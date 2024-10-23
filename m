Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92C2CFA455
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 17:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WK3Wcz0LjTp23A2ibh778TvWVk0jVp3LvtNmMQecJo=; b=Baj5i6c4zFsJc5uUK3/zI/Rk2Q
	OLk76A/1WpRd0qqWbY4bZce6xZLcSnb9CbJNVV7zTJAHBCBgmnIrwd+OL0yreouvnv9xnHem1m0b6
	ie04mH7QleRPBtSdDKId1uzzSeFkKuRnOqwkZ4OvwC/LFWwrEoIBsOPZ2ADg9oV2KMYZZLVge8rwZ
	MFAA9fQQnVcbyYTaMRSQobbgZAldruwfThPUB9ui6OM3tkaanv0rs4s+V9toMoSpix4N3N3x7id1o
	YYSkY1Dlfs0QUwwNCj5zaCbYffOifVIcdaH93H4/eGIiLLHRI8VbUzNC8PnnSHvtjRdtM2g0EXrk+
	a7NRaYVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fBC-0000000FNdZ-0qOA;
	Wed, 23 Oct 2024 17:29:54 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eYm-0000000FDEZ-33n4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:14 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-37d518f9abcso4769530f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702210; x=1730307010; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5WK3Wcz0LjTp23A2ibh778TvWVk0jVp3LvtNmMQecJo=;
        b=rMffH++0zyF0aajFSMiUitlEx3BKX6b6pCC9y1NBmpTtZ2/l4iP4TqH/sC8wQNjqsl
         oN07x2kwmckEU07Tf2leMWdXm8Iy9ViTT4klPvOchfBdti573PmF5yCl6OhtfIcjTXsS
         kkCJd/69nQ+suUvERwFDyc/y7bcmxGZzmCWvLCuQpmJj+EBHasyQnk43eXHdL241FdwT
         L3rIqsZkqxVgEDdv/GzMBUe8k1RAeu9Nxlyvgec4EC+Yb9aG9+jTUyEP9BJJ/MnBkzeB
         FmYGh0lxKt1aFntw2cqOOZtmafSfzlPKqTRL/SKqmKGpgYCOW809m6eGOF139EiBnIAD
         f17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702210; x=1730307010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5WK3Wcz0LjTp23A2ibh778TvWVk0jVp3LvtNmMQecJo=;
        b=tQUKGLhwfO1Bg/g3ZZRhfv+pRD3y4+sviFRhwopw2Es5A9Tur8lJI+OZKtVL5tCF19
         u+tZsC6Lmwya4oiEJrCNYibnQ+zNsv3p732GC8KzrW2CN/m7bDktYr5bMOmQM6f0yHtT
         BQIMk6Vtwq/zc00RyBu/vqfdehJwZkIWqN4OnB17N/fLXjSddEcMxFlat7qyGRouDD8g
         spZcVynaQpKh+rkvqr8G9hZLuEnIcMfksjnu4R1D5yd07om1bQ2K/qOp8qknHIbKku/b
         72zWZI3mID+/VYNeC/1aDWdsSZaHgUGbKRDeDxkuWporyz9s/WhA46T4NqaSAil8i32d
         OTcg==
X-Forwarded-Encrypted: i=1; AJvYcCU6MIMBOp9ZGKcr+xsAFK97Qe6Wa/zf63vOySFXwcu3LocCpaa8ksfTDZhnkwcdQ2HacBy0btmuei7G7hAlgxR4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1AjFIXELmqTAIvxrHTKZ8qc5XsajUGfUu9XZO8LJ/aPXsUTES
	acGOmH/YjGg4J+XV2J81yV/QkLvM4m1BfP0gnyHMwpnmucHc0p9sLTaghw84aEA=
X-Google-Smtp-Source: AGHT+IF8V/3kWZEsM033mvmCNVLqu8ni3b3xlel5RuPa1mpKVOt5Sj94RWpbn1HR47WB9YguGyyFfQ==
X-Received: by 2002:a5d:420f:0:b0:37d:47d8:5fff with SMTP id ffacd0b85a97d-37efcf7ecc8mr1949275f8f.37.1729702210382;
        Wed, 23 Oct 2024 09:50:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:09 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:49:59 +0100
Subject: [PATCH 02/37] drm/vc4: Use of_device_get_match_data to set
 generation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-2-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_095012_879952_F3B18103 
X-CRM114-Status: GOOD (  14.43  )
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

Use of_device_get_match_data to retrieve the generation value
as set in the struct of_device_id, rather than manually comparing
compatible strings.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index d47e5967592f..3099292f22a5 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -300,10 +300,7 @@ static int vc4_drm_bind(struct device *dev)
 
 	dev->coherent_dma_mask = DMA_BIT_MASK(32);
 
-	if (of_device_is_compatible(dev->of_node, "brcm,bcm2711-vc5"))
-		gen = VC4_GEN_5;
-	else
-		gen = VC4_GEN_4;
+	gen = (enum vc4_gen)of_device_get_match_data(dev);
 
 	if (gen > VC4_GEN_4)
 		driver = &vc5_drm_driver;
@@ -462,9 +459,9 @@ static void vc4_platform_drm_shutdown(struct platform_device *pdev)
 }
 
 static const struct of_device_id vc4_of_match[] = {
-	{ .compatible = "brcm,bcm2711-vc5", },
-	{ .compatible = "brcm,bcm2835-vc4", },
-	{ .compatible = "brcm,cygnus-vc4", },
+	{ .compatible = "brcm,bcm2711-vc5", .data = (void *)VC4_GEN_5 },
+	{ .compatible = "brcm,bcm2835-vc4", .data = (void *)VC4_GEN_4 },
+	{ .compatible = "brcm,cygnus-vc4", .data = (void *)VC4_GEN_4 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, vc4_of_match);

-- 
2.34.1


