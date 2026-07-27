Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB53C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLfj4e7PYbv17pgcUAJcNclY2K/xl/o48sCMhXJ1vaY=; b=nEbzfNJYPA4EP3qZJQSE7kdlmt
	aOXiHNfSv/O9lcZWnVW4NUQF3pokB8cuuoBtAT0jUX4ufbB94oa7ZICZwKftSbyeqqlwTNQu9SQeD
	FVCUv+xJQMxB2XCaX4PKCtCNZjz+fVej56bxORZrDWbGG8NDxEHqcCNHj1OCHvhE0CzqNN2w+DFKn
	weCotd4HYugfufbIbYcXU9sozflUNy4RT/xbQ4ZFfc0lH7hULNC+BtOclTMd2xBp5hAplso5UZUQK
	dt2BO/IsGu96vFykVMdj6sDd4GaAJUZHUAc4cWn4Q4AoZtgy6kN3b5mvbmplE1+1ScWCGbkumqKRm
	4YRxwuLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS4s-00000003rNX-1HyL;
	Mon, 27 Jul 2026 20:37:34 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS4p-00000003rMy-26QU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:37:32 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so2519636b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184650; x=1785789450; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PLfj4e7PYbv17pgcUAJcNclY2K/xl/o48sCMhXJ1vaY=;
        b=ohvS7iSB7QyOp601jxyE9tkqPwhfdI2SsiGWuXCipMkU7rKZ6rlPgYblCSq0cYX631
         ai3nRw10xt3JbXdl1ljAjce6U4CaHpWWGlS+CUb+qEk5Hrn/spjTBnpyrXZueY0TEPFa
         qdPomD8GQG7lkmD+KO909T9SRNvfRUyxmy3o5R87SliuiQC3MHqKw3yS09ZedcbsFbCz
         g6Y/W8ipW1ROlPQiPjsY4r1nSNJ7JTNJ6PhhkReBrb1y8y8YrprQ+azGpVXUmMBALigm
         YbXWXCoHYt9CVptciwMa2XuWsDaCeOfoIF+nV7C5VH2sD+5xlGwTEO2oHimiRgbl3q0K
         f+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184650; x=1785789450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PLfj4e7PYbv17pgcUAJcNclY2K/xl/o48sCMhXJ1vaY=;
        b=O6Lt4ctAWQ2SDtrigLcnypYFauEIo4f9Y0yD90ibFJPrvQZ6PZP3tWSUTH6gssojLz
         lXZPyhyAQnOQR8LXsCmSeZUnPWUfPBdoMcjuORBMJq5ujf72p1ZmKTKMzCHNQ+q4ECyk
         qthWsF1OGYOYP5bWIek2Sehza22h2tCDuY4pc6KNb3nJ9gYf54o0GMYu7l56Q63jrRRb
         P5v0TBmhvA+dOi6mit9ajhsVqB0vA8E842LC62Nox1IxBP0xCZoRZSu3GLpTMogtE/2W
         qq167oExUimFMBQiTzVNmYjWaSQilPXei+t40d6jRGJ9u4VkSG9Mos59VZ0z7gnsg4RZ
         VAPw==
X-Forwarded-Encrypted: i=1; AHgh+RraZFCb8FBZTRPFEF9p88Dt3MuzEnchWzKYlOEf+DTSnLIO+1EfkPVMxsVvoXsxjlMwSXiBPE/Xr0XqbN4D6jgN@lists.infradead.org
X-Gm-Message-State: AOJu0YwivVwvgrbHZ7lXc/iOxecPoK1Qbp7ogex3ni7T5yjQ4FHM7jH8
	7Tk/wns2R9GQ4tBdFIs0suIb0N/O7pRFxKy86S2nAuzXNbfmDONGjvVb
X-Gm-Gg: AR+sD11+o9aXRQ60EyqQ6NRl7s9iYI4h5sxpJIpy7JewNZ1NytmMxcvk55ewtYiP4yv
	cEAx3a+Vt420vKVjUT2BRD5jAmAeSkBReEBrBh+zfydbGjHyocDXFKgxg6M5WNJ1cX0Oei363wm
	yA7fgWcMy7ERlwImkmC6lJeP1wdp2IBjIfgvD68VHXbbTl0tFCUxOXmXGUJ1g2e/7VRhd7uZyaI
	OWYBBp0sMP/o+UZ5cwXB4GSgMevrzZ0gvlrbDF5LHz0K1pg3t/UuxgXr/utXZTnITl/5CBWb6Ae
	N+7x0+EEiwIKae/plilMoATbg/ywwLog28JxgIZE6CuJvKF5J/1NSDiD9iDH9ELPERlZvmODyMA
	Ee3nQWTRwXsGaPbko9nEfZpG8pUy5OdO+qT0FOnT/IxbfJoKO5bzQ3vALQAI2ecfrlIhy65oPPs
	3TEGm4
X-Received: by 2002:aa7:8888:0:b0:84e:456d:aa5b with SMTP id d2e1a72fcca58-84e595f7ed2mr8128845b3a.72.1785184650522;
        Mon, 27 Jul 2026 13:37:30 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5327f116sm3507549b3a.16.2026.07.27.13.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:37:30 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 33/64] dmaengine: sun6i: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:36:10 -0700
Message-ID: <176cf55cdf7e686ba064befa2b257f3ae76696ab.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_133731_547005_9CB03FCE 
X-CRM114-Status: GOOD (  11.98  )
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

Use dma_chan_kill_bh() for virt-dma channel cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/sun6i-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index a9a254dbf8cb..9289c24dfcfa 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -1097,7 +1097,7 @@ static inline void sun6i_dma_free(struct sun6i_dma_dev *sdev)
 		struct sun6i_vchan *vchan = &sdev->vchans[i];
 
 		list_del(&vchan->vc.chan.device_node);
-		tasklet_kill(&vchan->vc.task);
+		dma_chan_kill_bh(&vchan->vc.chan);
 	}
 }
 
-- 
2.43.0


