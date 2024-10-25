Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24089D149D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 17:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mE1J+qWE3+MY5OdGTFndB6Yv1OgEwWzvu24HL6ntl3Y=; b=kWBWS5nUchczjQ79qIJ7DFVfLm
	P1HZ+e6ywMpdiNWIIYSIh7wII03XOwG6QFfShR/XeMRjPck2j2QUIwNKoN9+AzuRWn+D/yh0K+m0p
	GtTPKK+FbVVSbVinilxMeh0VFTSj1OTDJk/XUfJO5ngdtKb6U3BrPLoltg4yFhTE6mG+vp3O1gqOP
	YT7KvMliSysRGcXsVq9+aET1vCt9TjLs/xc2CxblDnRw6zw9oR7G5+9cMJgNLADdVs5JqhhxBXqHe
	YDn3aVN1XQg+p52kvQ1IuKwoTOg7jHB4gakNGZJg9WpMJuvz0mEIMo6qW2MBBTu8PtVyZ3xtv5yvZ
	MM9kcu2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NyY-00000004Z2n-2DfL;
	Fri, 25 Oct 2024 17:19:50 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nut-00000004Xke-1Thb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:08 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-37d3e8d923fso1437693f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876562; x=1730481362; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mE1J+qWE3+MY5OdGTFndB6Yv1OgEwWzvu24HL6ntl3Y=;
        b=g7Lhj6gRWQHFPNh8dlpt7e9wHcZQOpzabmE4kUx4EfmnLfDpxs7BwjXBIKhQhj+KCC
         zOwBNOAcTGzY+Wnd9Lei+hZezg8vBzctWKA9cwoIQqzfAPLj2WYddeCGFLI2EsnCKaAX
         +BdeXjzP5UTRj6U8Vec87EzhawRhYfedjUNQ71tAVMMlH1M/EWMKXQliPgBd3PdSbAWS
         P1CwsPNjSQ6Gs1ZYX9oQZpd83/a6BBTGVD/7O65F+8tm37pGKoEiw8vLTcJtYT9WT9GC
         ormTlUML8MbjhUe6ds+vluESjlmez51H4LpfNvEmbxba8BzgKiRoSc1Zzvl17czhYAWG
         t4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876562; x=1730481362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mE1J+qWE3+MY5OdGTFndB6Yv1OgEwWzvu24HL6ntl3Y=;
        b=jxI3zGVwZbgJaJ8CApt+Le5JE1gJKWWaf6BkZRZ5tYCMZkZGGTFwVLya5xBpdrwcSH
         ApSwEP1Yec9wDY7KpDiQtqWjTahRUPJ5qcD612J4sEuWuKhLkJJ2Ry+WJTaqC690v5gd
         IG8nJ4ahucH1x81Gvz/2bRHwmMyXQdNP3WdZVPhdWhZV25bkogTwdMMDDRFVagVDnHEg
         V23t/VL54ZY3I0b1YwWiDtsYz99U4gmu85htcnmcsa6oBZhRONihXpqAKVtoHcVBJV4k
         mZS+V4FC/gpGlPsyPQZYITEHW3+VZ9fbAZyHIXjpXvkuTuQvYA4uxKypNtp0VahPxk3C
         vdaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFJoDgezCYsS5Y2JOWUOk79RY6myxxP+JQr2m5LUy4FG+HfDVd+JVn5vYiB04b0ru2uOXBUD+poeiS21bgLCR8@lists.infradead.org
X-Gm-Message-State: AOJu0YwajECSl46vCqGkdhrp8VauvyRCg82E0DCgl+z/tzgI1WSVocv8
	zlHmfwBSJDNxxgn1ZBXjUpf+/CZwdMHX/gJj2XtYzUN1tJvewOgQtgpE10yM/cQ=
X-Google-Smtp-Source: AGHT+IEHBMyfg8LeLTWXyBsyEhO7uNb2SflsZSQOS0RHT+/8zxN2LWxj0WgsnINVEDyefqmgv9Nkcw==
X-Received: by 2002:adf:a29b:0:b0:37d:3f5c:5a83 with SMTP id ffacd0b85a97d-38061128754mr107580f8f.19.1729876561858;
        Fri, 25 Oct 2024 10:16:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:01 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:32 +0100
Subject: [PATCH v2 01/36] drm/vc4: Use of_device_get_match_data to set
 generation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-1-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_101603_400001_009BC02A 
X-CRM114-Status: GOOD (  14.38  )
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
Reviewed-by: Maxime Ripard <mripard@kernel.org>
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


