Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E765CFA45C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 18:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7edjMwM9R4r+Uxc3cqOP0qRuD6L2fQT2FKa6L1QAhs0=; b=rvGEl5fwYmf2mNJhVP2TMG+Liv
	OeT8lnBpSrpZgy+eMS2xE1i/zzIUrjBCjIPWqS6/jSJzRRgJiv8s0PhaA0Sgq4aslea7kzvlpCujL
	r91u1OPYg7F1REefjS1p0Znn6cUVn2grU0H7LUS6+t6l6pqViHihlJfcVjh9VdnPI8U1CnTKXIf0D
	GpV/Gnydea9glVyrC4OKFpSlztpslWT5yAPG7WChN/6e1r6W+fKy74ycT8He7iFZ6BRkyJ/ACBktT
	ZjYMbMaba4SStqAL2kgng5/spAq2DLPH4jT6i/eKKVBF2J73q7xIN1yiE/Vk6QdSNWF5p7fOJJpvG
	/ONrlx6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gAR-0000000FYR8-3AfD;
	Wed, 23 Oct 2024 18:33:11 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eZ4-0000000FDQc-3P2U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43158625112so69898905e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702229; x=1730307029; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7edjMwM9R4r+Uxc3cqOP0qRuD6L2fQT2FKa6L1QAhs0=;
        b=GtdJEzlTGKhrKgLxfRoKmHFOh9Q5QK0UbTmLTmh2H8kPsCt58mvdVs4A5RVhdXrktv
         37QlBc7HNSxfn6jY7+zqvO964xIxiwMAi++FynaqZytE8fYQQ6LodUt3MA8BDBiQzNQN
         Yk1WSREQMiGBE41Z3O6U2/yMpaA4M/kqI0KF3AMcAkZP5dcOIR2SgKt4JC7Lv9imYXzx
         UsBkr/aK+mholwD9EprRbsmtkLe8W+dSAEGJsB/0BW2cMxDhF0kU60QAIKuNHnr3P0uf
         mKAHnjFWc2EpLPo4dhej+XA4/pGCr1Kd4wqp5hcRVdE8FGy/JEC5k6adLV/9D6sM1xl6
         /mPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702229; x=1730307029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7edjMwM9R4r+Uxc3cqOP0qRuD6L2fQT2FKa6L1QAhs0=;
        b=SP7hwSy5dt755D65qm0j+usA2GFSFq8xH/OXSOh//TScED7BdqdtFlelDI8/QeiV1P
         xRNzxk9kPWs867JlpxQj8RU9bZ6gWUzeThxPJK+F6DS+CCdmwqpkfbLppKGAeqpShv/I
         KL5c9KgDXF/ur2rlL4yjC1N2kS/UvcHHe/1ySMeOw7S8gNhoGSmhu+LnZ6rJYp8RMXdJ
         9IuiEsXW6eJ+YrEZ9J9E1mD6JXNmxcukaZxMC+ac9k6lIfmLtXW+n6N2Oub0j4zh8qGo
         J4amuOYJXu7Hu8d6ojt8ML7qFDNUZOVpgmZVJtUxhLpMliBTljVuMdYijzwHyiS/93cM
         Wv9g==
X-Forwarded-Encrypted: i=1; AJvYcCXJcC9b1q0ivE5CYmhQGwiu5a+kFOdRbUQdVip75r67ZNezddyOLexoE8rEKQfJA8TtADmh2DhlJDpUjVlWHmOE@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+jl9zYxIgngbTktuor7OghOzNndZ3Mi9sTr01/OMf8XVrWGmh
	VwO53Ybe0zGTHbbdzw7wMzyZz/aMrpaZVnBD/ZkhF55m7a+az6inTt84exOa9Yw=
X-Google-Smtp-Source: AGHT+IHmnnBF1XbicsZZSX63ufvz1Ey37usN3AVArfITs1P5URFwomZVlyoIAXXLcYHQj75m7dMF0g==
X-Received: by 2002:a05:600c:5802:b0:431:5f8c:ccbd with SMTP id 5b1f17b1804b1-431841ee182mr25601835e9.4.1729702229220;
        Wed, 23 Oct 2024 09:50:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:28 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:18 +0100
Subject: [PATCH 21/37] drm/vc4: txp: Add support for BCM2712 MOP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-21-1cc2d5594907@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241023_095030_897222_83DA8BD0 
X-CRM114-Status: GOOD (  17.35  )
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

From: Maxime Ripard <mripard@kernel.org>

The BCM2712 has an evolution of what used to be called TXP in the
earlier SoCs, but is now called MOP.

There's a few differences still, so we can add a new compatible to deal
with them easily.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 2979d141f3bb..befb99c9b5bb 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -386,6 +386,7 @@ static const struct drm_connector_funcs vc4_txp_connector_funcs = {
 static void vc4_txp_encoder_disable(struct drm_encoder *encoder)
 {
 	struct drm_device *drm = encoder->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_txp *txp = encoder_to_vc4_txp(encoder);
 	int idx;
 
@@ -404,7 +405,8 @@ static void vc4_txp_encoder_disable(struct drm_encoder *encoder)
 		WARN_ON(TXP_READ(TXP_DST_CTRL) & TXP_BUSY);
 	}
 
-	TXP_WRITE(TXP_DST_CTRL, TXP_POWERDOWN);
+	if (vc4->gen < VC4_GEN_6_C)
+		TXP_WRITE(TXP_DST_CTRL, TXP_POWERDOWN);
 
 	drm_dev_exit(idx);
 }
@@ -508,6 +510,20 @@ static irqreturn_t vc4_txp_interrupt(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+const struct vc4_txp_data bcm2712_mop_data = {
+	.base = {
+		.name = "mop",
+		.debugfs_name = "mop_regs",
+		.hvs_available_channels = BIT(2),
+		.hvs_output = 2,
+	},
+	.encoder_type = VC4_ENCODER_TYPE_TXP0,
+	.high_addr_ptr_reg = TXP_DST_PTR_HIGH_MOP,
+	.has_byte_enable = true,
+	.size_minus_one = true,
+	.supports_40bit_addresses = true,
+};
+
 const struct vc4_txp_data bcm2835_txp_data = {
 	.base = {
 		.name = "txp",
@@ -613,6 +629,7 @@ static void vc4_txp_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id vc4_txp_dt_match[] = {
+	{ .compatible = "brcm,bcm2712-mop", .data = &bcm2712_mop_data },
 	{ .compatible = "brcm,bcm2835-txp", .data = &bcm2835_txp_data },
 	{ /* sentinel */ },
 };

-- 
2.34.1


