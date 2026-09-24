Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BAEC98317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 11:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVZyQuOx10W8AoQP9MzIvUBAsru1Ry+CJZYSEvVQ+/k=; b=suPcBii2vFNTCnpOBM4NlH7cmJ
	y1VkXqosc9CnmtEdI1hNk1O+WGax5yP8AvsOOA3gVcXlCzKljBa5MCHmQ2byucCAMUrjw2EHptl9h
	IU/nXVllBEgtp1L6+tMKWnsvkK5hqSop5fzL+kxvAiiXWC6b0bpG9E8/hVq4U3uptCnd7Au7/x3kq
	+tipNcbArnG6nWH/PDiPS0euQSkpxk3ml2cUsIQ8vVModGTe0nnXnaBHHqbb77KOW4l7AlaLYQtBF
	TRqOLCfsEPIV3p3LxacHY10gyJaxlAWpKn/3VlDADSqF3asPunRFq1yM/KygxFiOt/MPCLqEhZPTZ
	di3k1wxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hYf-0000000ArF9-1PgW;
	Thu, 24 Sep 2026 11:24:09 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hYW-0000000Ar8V-353Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 11:24:01 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so822203a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 04:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790249040; x=1790853840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVZyQuOx10W8AoQP9MzIvUBAsru1Ry+CJZYSEvVQ+/k=;
        b=StMe9XaDs4woaVdys0qXPeRdZjrcEcN7ZvipKvsqTI/b6TsTbzxQcZ9/B1FCNMCxlr
         6PLVwMYOXVYoaRobjR2hExoW/X7Gz/ejxcfKs5k1kikPMzNDI4loro+P5TbjLpinO0d3
         Sh16GhvRBwm6ZfrKPwFHeEnORhJ5UbQuo3xouMIINFD2haMWFp0OFz/n2FMU5IDW/7YJ
         PUe8XkB2WJJoxcGtuUAGRt3DhLyQXBn2NMxIKg1iYe76HnMoQt25VKZjV1SWQKv4MgSU
         8ODxQryt3EbIZAkCPrnDDK6OKH3DK42xXnojliqKhL85s7AGFKosFuKOb447nOMAHhXu
         z6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249040; x=1790853840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVZyQuOx10W8AoQP9MzIvUBAsru1Ry+CJZYSEvVQ+/k=;
        b=iytij1dsbvdRKDvNizBilM6J6DaoYlJpmB6KksWy/XIWo3LMCUWMJcjc/rbkpaabR6
         4WR8D69j7QOYeWCfrD5ePGxsdOgJ9hv/4mGfSb+rGM1vkfXlrv1BmyaSbyMgqWIgLKwH
         jtUV+vTxqCCZSAzn999P2Obm6bMgVsXMtm3GdU8yYVCJZn2bkWMOEgREONxIwnb6kffy
         9dZ7XFL2wShDbJiVu6NZLNabaBYpWE6Ssew7tMFp+QK8KyZHnCMtl0K5ZzuuTsvQNDnU
         57gnmJAu5FF1cEZnDwYiaptYJWXyc4nFCyyXDTz2V8fpbHztf96mvQqHMN88z9NnkHzj
         E8gA==
X-Forwarded-Encrypted: i=1; AKwUvByvVilL7dYED1egeQGXGF26Np19u5Pdx4JiD3c1QfBnaPTDvBAkNum3ewTi/qheeVhQ+/1i9bOLQVNnfIW7puhy@lists.infradead.org
X-Gm-Message-State: AFuF++mVarVooD8Ju0hPCCKONIdBNA+eEc2RC+94Ojvr/g042de9J5Wi
	vQl00VkUzERpVEP5OCIPiSR6AKelb41U7DycJeg/ADqy6MyDwzeMuWfl
X-Gm-Gg: AYBFou1cqbdBlJrYaMh+ahPvD8b1V9ehiQRSU9xeOPB0fr4t2WHH9JcUZZbqx0KiwL5
	i6SiiJrEmoeY1Xf7AErqlQ4rV1/BDSpxXPv4TxQP2ER+krTVYrBnm1FCUasF9R7gINNqErTkEe4
	izVrWMHts1XKY5I1SZQrAwYDyjsJ8aJGgRJZmVAybpSP8a9V9uoD/mof5J/czyUyV65gcQZ8dmc
	17inp7MpJ6XgtMuzaENWVJQOu6/xQiI1QHrYsqt0SfHpa7+tEboYjhXAqe19v+gLwzVbTVXExzH
	Pt2xQ8hm8soZphzRHgey+sjNsuuSuEwPGt6945evmL1iooDbNnbo3sjckXEevvi9nzyr9o0eJ3r
	nHFnVqaXlsJMZtQwNK2V6ObO+gfFhOh0xHI5GS0dlgZtw32wDHET11hbcbAK0uu3vmdnMBLYGAZ
	SLUsKE3MhdkKll7f3+gF4we+1OFPNThrSljpECXXq7ulb4zbAFCKJ7sQ==
X-Received: by 2002:a17:90b:1a82:b0:3a0:8050:2ecf with SMTP id 98e67ed59e1d1-3a098ac556cmr1232198a91.25.1790249035317;
        Thu, 24 Sep 2026 04:23:55 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0813318c1sm3586800a91.4.2026.09.24.04.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:23:54 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: broonie@kernel.org,
	heiko@sntech.de,
	william.zhang@broadcom.com,
	kursad.oney@broadcom.com,
	jonas.gorski@gmail.com
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	jon.lin@rock-chips.com,
	bcm-kernel-feedback-list@broadcom.com,
	noltari@gmail.com,
	lgs201920130244@gmail.com
Subject: [PATCH 3/3] spi: bcm63xx-hsspi: Disable runtime PM on remove
Date: Thu, 24 Sep 2026 19:23:29 +0800
Message-ID: <20260924112329.1566051-4-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924112329.1566051-1-lgs201920130244@gmail.com>
References: <20260924112329.1566051-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_042400_787102_DFD4A8C0 
X-CRM114-Status: GOOD (  10.70  )
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

bcm63xx_hsspi_probe() enables runtime PM before creating the sysfs
 group, but bcm63xx_hsspi_remove() does not perform the matching
pm_runtime_disable() after a successful probe.

The probe error paths already disable runtime PM when sysfs group
creation or controller registration fails.

Add pm_runtime_disable() to the remove path after removing the sysfs
group to balance pm_runtime_enable() from bcm63xx_hsspi_probe().

Fixes: fb8695e3749e ("spi: bcm63xx-hsspi: fix pm_runtime")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/spi/spi-bcm63xx-hsspi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-bcm63xx-hsspi.c b/drivers/spi/spi-bcm63xx-hsspi.c
index 25f169a2a81d..80bf02bc324a 100644
--- a/drivers/spi/spi-bcm63xx-hsspi.c
+++ b/drivers/spi/spi-bcm63xx-hsspi.c
@@ -882,6 +882,7 @@ static void bcm63xx_hsspi_remove(struct platform_device *pdev)
 	/* reset the hardware and block queue progress */
 	__raw_writel(0, bs->regs + HSSPI_INT_MASK_REG);
 	sysfs_remove_group(&pdev->dev.kobj, &bcm63xx_hsspi_group);
+	pm_runtime_disable(&pdev->dev);
 }
 
 static int bcm63xx_hsspi_suspend(struct device *dev)
-- 
2.43.0


