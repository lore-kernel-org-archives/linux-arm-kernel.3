Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C699C44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 05:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fskRTNmKCHuMx7B3elKsJMyK2dJDvII2EXTM/GUSwAI=; b=VteRSvHKBDhkqSCjlRfjlA5cX+
	KRtBQJvme5ssVCcSA4xBt4BDFEv+pbGdQr8FyHwunkkIZQEzEqr2QqUJTynGlX3MhDqMziajvr2vq
	HU2YoJt9BJZ6sn8eAe70yTiWv59Gjx42mXM6wwQQQ/F5ynYvvhhUoRh3q0RDRvA3GNDGxyppakXfH
	zM3Kwx19Lu19BpCopcMUDNcJ99oV4XA8ncTtuyGN10c2kbGY8nq2/vTEouMA2YtDBG2Vfn3GVhcSG
	OqedtRu+t8i3xQSGEmdEDw6u4n3hoUOocDvx/wfqxaoypa0y2TSs+zR68vhiFnnUUPlKkdf29CZyu
	UITlMlbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmldL-0000000DRnX-3GYp;
	Thu, 23 Jul 2026 05:06:11 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmldJ-0000000DRnA-0xnu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 05:06:10 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ceb096e675so2808495ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 22:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784783168; x=1785387968; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fskRTNmKCHuMx7B3elKsJMyK2dJDvII2EXTM/GUSwAI=;
        b=Wd1YH5bWXJ9cV6uIiHaDojAj5FKwzIDYgtEiRmp1PMU4s8LVBg8mfQV/I9OclpHjId
         cScplcA4Q5+MF4hxL9PW9l0nI8FGk5cxQM+jRJqmXWBF/RJ4jnzplYVPmSOa/NkwZuTv
         u59bOjo0n11Uzf7pos/Y1t0veseQJ3Q2XXrQ4VrWIy3gvW+SRxL9gefI+kCrEhuunkgI
         IshQ84AjqUkl1k6vECKN5P6ee6PrfiVYZDZOisrsqtmnAPl9Q2KU0BsW/zFNVDECfVB3
         zQzIYV7VUZjmlIDK69WiggpTd4BG1bEYcQ98TADu3Jx5/CavyPNJ++Dhw6OJlKznQ4T+
         s1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784783168; x=1785387968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fskRTNmKCHuMx7B3elKsJMyK2dJDvII2EXTM/GUSwAI=;
        b=BwxgrsM6CLx29csSzPZN4AHjAuws4Raesh7iMqThVxMBPn3BNpyUW44cp44gnLsGfZ
         34lNQ0X7RfDJmJXoOYmmo/gr1FY6D30Bxa/DLH8ty9ke4cHYsi/bXbdZfAj59ZgIyMzi
         ZP0s1pCRf4rQs71lTJmB/eDlBZRpPb0ijXMWEFbMy6MNmDf2FXYaSaprpI7vdjgb0VrL
         E2IOO6NFgMdIhVUN7zuRAPHAskd4hg1g6O+MkykZ+wmtGfIGXocvzh+9bC2QwPBFZTlu
         K7UwzU5KR1c8epMYe2U3kyMInZaD6P/DJZQ/7a4bAyDRO/HqCYx0fefEKaFNulxVMJBz
         GBDQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQFp1NkyZ1odeYXSFtkpUhupVRb73kC8PrPFHgmgwuubc4Ah94fel7kEFSoBWrwAQJL+ChSmkriEEgQY9cNJH+@lists.infradead.org
X-Gm-Message-State: AOJu0YzDh60yqyk38pu9ZoMsndPmIrgmH18DFjzyR9dDXqRtG2Ao+OET
	cqebCxxPOR1fjC0REpiBNeN2/Lr43XxRTlslQAUAomGzB8+tlanLEmAoazzHTw==
X-Gm-Gg: AR+sD117nhxWgAEHrU+TMX19K1LagHi+igQmD19Jj5m6HuorEuPLB6iM9zHeJi65ftk
	g4YZ8dMCkwkjBYyJGGdIxblnTmmVNaBp+XlPFmb9Iae7+SkoSEOoDr/wDUldBF1szWy5tFAqArZ
	tZQM2R42cfZN1t36KyoCZSV/JHQuYBS7SxPeOm4zHHu0zw4mf/pHWfi41qux9jdxQMyRFeJ0ouH
	9UTzJGzr6vUMlWoSz67ci07itwh8KZXqiOrN6JdhNEMm8mocKn0wo3F6yyOWFMie8Nj5pbVgloA
	grdgCjCbV3QBweAFeq1C4mJbpcmIO5RGZuOusMBoTMWX9/saQZ/iKcxWA1Y/qZc3Hpr/ey5/HzN
	+kqMnS7tl7obc8hSBLx4b0956XOHMfsEXIBL6M8N6tPntYeRB2UUPIlZPT9wjypCSmafOzI1B3x
	bhROxBIT8CsB/HogwtlpC26LHRvTsXW2AQm6gHU5CwmPxny+pYZTIyN+Xxl2bIMd3Vw6gexOgKT
	8TtCSCiZNUJ5/ce2mk0yqSINFK4r0n/fKS0m4X3sCIV8oRfSPErjMg=
X-Received: by 2002:a17:902:fc43:b0:2c9:97a7:3276 with SMTP id d9443c01a7336-2cfa6c87f9fmr20526865ad.39.1784783168285;
        Wed, 22 Jul 2026 22:06:08 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f3b46absm25427275ad.80.2026.07.22.22.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 22:06:07 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: at_hdmac: ioremap and get irq early
Date: Wed, 22 Jul 2026 22:06:06 -0700
Message-ID: <20260723050606.283453-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_220609_273010_038EEAFF 
X-CRM114-Status: GOOD (  11.99  )
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

The functions can return -EPROBE_DEFER. Call them before anything else
to avoid doing extra work.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/at_hdmac.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index e5b30a57c477..2f6f5877fc3c 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -1943,11 +1943,20 @@ static void at_dma_off(struct at_dma *atdma)
 static int __init at_dma_probe(struct platform_device *pdev)
 {
 	struct at_dma		*atdma;
+	void __iomem		*regs;
 	int			irq;
 	int			err;
 	int			i;
 	const struct at_dma_platform_data *plat_dat;
 
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
 	/* setup platform data for each SoC */
 	dma_cap_set(DMA_MEMCPY, at91sam9rl_config.cap_mask);
 	dma_cap_set(DMA_INTERLEAVE, at91sam9g45_config.cap_mask);
@@ -1968,13 +1977,7 @@ static int __init at_dma_probe(struct platform_device *pdev)
 	if (!atdma)
 		return -ENOMEM;
 
-	atdma->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(atdma->regs))
-		return PTR_ERR(atdma->regs);
-
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	atdma->regs = regs;
 
 	/* discover transaction capabilities */
 	atdma->dma_device.cap_mask = plat_dat->cap_mask;
-- 
2.55.0


