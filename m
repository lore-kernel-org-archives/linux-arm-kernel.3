Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997A8CCF2DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OZf5l3nm0qL9va+rXssexyiV+xjPumJIrkIx3ruN0bU=; b=Qce8bLNEDe3BK7UAR1MScYG4Pl
	gCHoCpaZZdWSwTiCPsS+vQqsvOJlWYDmVN7xzKW7bnSoIsIRegJV3/03UaxIxGnrYPWK0jFleGr6J
	misnx+2l1fvhZoxRi0QdcYRfOZYexxgmBw5zDc4QyT6ai5yeSeG8pyC2kiBz7Dd/zYdo6h02EFErm
	NpsYmK6vrhY6jlQYoGogd9IuabcNh2K+YT8o1oiEzJB9hSbwN+zIHbAzdg1i4AHHbMWV+WjzUhDGc
	Hbw8XqYHr9TugT4rfBMmKEaYgovORCD5zxP35siDDBkW6c+I7sLGMbifK3Osuow7FD3V6RgkHXRO2
	NtOh72qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInoJ-00000007ZO1-1awE;
	Mon, 19 Oct 2026 13:53:55 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInoH-00000007ZNS-2CHp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:53:54 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3a6d800781cso253560a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 06:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792418032; x=1793022832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OZf5l3nm0qL9va+rXssexyiV+xjPumJIrkIx3ruN0bU=;
        b=hz3JCfp+9I6AlKN2Ajd9B0RR3r+3DMXFdyWudtIJm/CUS1OJ/yCkLzxAGi2Xdg4aLa
         mWoEWUofVDq5BiIsg20AgajyVLeTAx+tzu/VfGuChkK7gknQbs5J1BToC3bM+MzGwls7
         PzET7l/OhQhvd1Z4teLdPh2uLyS7ROYGW/6r01eHqNjcK4n3ZQnup1PfpVkCf48w2jJw
         puWoBBUHdmYHP+3P+SCIAiqmpTzV/JYwPZW3pDpj8YlHLxbIMxSEdFaobRmz2i01l+Cu
         9tfbkZ9en60VGoHtQk6M/nymAf1VGuKD+e++gjP64yKOwt/HoKVRWu+TJVHUXNsyifZV
         Cr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792418032; x=1793022832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OZf5l3nm0qL9va+rXssexyiV+xjPumJIrkIx3ruN0bU=;
        b=gB4fGAKhl6EZieMtL0Hq0FTQJaYcvAw6LxzQ1bHjXRNViwGAdcb9Ea7JZzAs1fJcuV
         Nm5dcJgkOQIx5Qg7JGCYkXoldl1mcnON3iSNXD1L6L0WkrB3XMdBmw194deL8uvQpBYg
         HQEdkN9zOUsF4PlwTyalNL/u0rMEhimcFGZMIYD69Fb7mgKOMTrePY/w5hgLtG6uvo6d
         crDJzg/oMVLKd08JVXbiNWXfP6LyLeFK8o0XA6pLhsu65Va182BWr34/5CUja/K59Jvx
         Ws55tnBpMinylvKiDOPt8C9uCdWxOyOkpRb+ZMd5jAbcC9tnMMMoDsYJ80/TsqwEmDww
         nzvA==
X-Forwarded-Encrypted: i=1; AKwUvBynImYVXP+S2qBOuyLIfOmjaRqcxaxnB1g3rO7zA9lLP9NVuvAehh0giSEaVdTJtXKn6NDFa7QY8CKXN80wWVwH@lists.infradead.org
X-Gm-Message-State: AFq9FYKq0cKCDzJOeWwhZ005ArHg0nATUQ2yqnFNiDycuCZhg/dHFjnT
	yv6pAjac8VKCf7zYAoWKaqoA7d8gVMOSyG+7TNPpkYFbuNbOckPDw7Ic
X-Gm-Gg: AYBFou0M0KFvF3ekhuqQB7E8szoIs6pddDE9T5C6Z+Oh/Vgjr/lInCGm8NGBR1a4Fyk
	AMEIUetIzkfsAK4+BIFKz4jfoosh5sQArLdEtfKn2YLzu1nIlsBISTA2GWVKSKFq2qBugytKvrJ
	WrqyrvtSdaarektTYccUHfJFUFt2MFeTtZ0LQ076rbHEXNWkANTYqvD5aLGz/SEZzu6n8G7y6jh
	EVk7bbCd6DeGotkAKoRocX6XtPm1P26HyxS0LMa7URFM2Dbn+kMhQoXdU0K1U79hsxCs/W2U2FK
	b3F/zP7HHJMFmPWM1ZbV+a+X/RdHlEF636zINf9mpIDaXkuYeV6p/wV9rYOYOfkmfrkY29VzwVk
	fSftmNwhW0Dfo92/XA+cSfVSv5gLwGfCZeULQTev6qBVUHUbVdRmDZr45j9UXNbUVPVgf5LrgZ3
	qQws37bilj/nJY+BE1QtLhstAsWdL0BpEBecoWcDcNyjjqkrXWVZg5s4/JioZkeP+O/oxbtvIYs
	vxPkJzut1yCqAmTMw==
X-Received: by 2002:a17:90b:39ad:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3acee27aa63mr10757870a91.1.1792418031830;
        Mon, 19 Oct 2026 06:53:51 -0700 (PDT)
Received: from LSSP.an0.nb ([2001:da8:7001:22:db98:829a:1281:5d10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9474b52fsm23337328a91.9.2026.10.19.06.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:53:51 -0700 (PDT)
From: Guanxin Li <bruceli20040604@gmail.com>
To: Alexey Charkov <alchark@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Guanxin Li <bruceli20040604@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mmc: wmt-sdmmc: release DMA descriptors after stopping the host
Date: Mon, 19 Oct 2026 21:53:07 +0800
Message-ID: <20261019135307.2074577-1-bruceli20040604@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_065353_559880_0E9966BF 
X-CRM114-Status: GOOD (  12.28  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

wmt_mci_remove() currently frees the DMA descriptor buffer before calling
mmc_remove_host() and freeing the controller IRQs. The controller may still
be using the descriptors, and an interrupt handler may still access them
during this window.

Stop the MMC host and free both IRQs before releasing the DMA buffer to
prevent DMA or interrupt accesses to the freed memory during device removal.

Signed-off-by: Guanxin Li <bruceli20040604@gmail.com>
---
 drivers/mmc/host/wmt-sdmmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/wmt-sdmmc.c b/drivers/mmc/host/wmt-sdmmc.c
index 489daee4f4fc..c44befabc909 100644
--- a/drivers/mmc/host/wmt-sdmmc.c
+++ b/drivers/mmc/host/wmt-sdmmc.c
@@ -896,14 +896,14 @@ static void wmt_mci_remove(struct platform_device *pdev)
 	writeb(0xFF, priv->sdmmc_base + SDMMC_STS1);
 
 	/* release the dma buffers */
-	dma_free_coherent(&pdev->dev, priv->mmc->max_blk_count * 16,
-			  priv->dma_desc_buffer, priv->dma_desc_device_addr);
+
 
 	mmc_remove_host(mmc);
 
 	free_irq(priv->irq_regular, priv);
 	free_irq(priv->irq_dma, priv);
-
+	dma_free_coherent(&pdev->dev, priv->mmc->max_blk_count * 16,
+			  priv->dma_desc_buffer, priv->dma_desc_device_addr);
 	iounmap(priv->sdmmc_base);
 
 	clk_disable_unprepare(priv->clk_sdmmc);
-- 
2.43.0


