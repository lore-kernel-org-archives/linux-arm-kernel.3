Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3B9D149D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 17:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=045viQzx57IhwQQsyT6qqiu42hT8ZIqMYzIaAsSMK5k=; b=3xWkVWb6RBZOLOXCd7BAMPTYm0
	rzhp2lA9lDWjlOTEBcjVo66Bw1IYtxlokFBqJJey6zr666Gdfh1k/17kPT7o2gJJ9T9X/rgED3wd+
	EYNrr1Omsuo1JSI//NSdReMoYcOjYwLaDWQojGbCdg0ZlVUMejpt2/lPIBP2Yy9avLL9av6EVJgzo
	RjSMtdgnayejLWEDMrFs6hBIopkWf7Fb231nYveG9gN39jdBMXg79P6L7a+Mu6zchQkoGoXwmJopy
	ut/hOQgNFz0wEdnPhqsrrANLU7Oedim0ToLvlJrlS4yA/Q+KPiHRVXWe4PbRXoH+/nU9ebqGVQJ9S
	pjLSY6KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4ONO-00000004fPb-3n2z;
	Fri, 25 Oct 2024 17:45:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NvG-00000004XzG-0jI6
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 17:16:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=045viQzx57IhwQQsyT6qqiu42hT8ZIqMYzIaAsSMK5k=; b=fn4gmMOwdwowN5Yt6Rrchp0imV
	/9coHAzVMSG4f2aAyoUIW55PvKUMi+Id3ZHvh2ZRu1s3KOz6fUUvr8Yd16JuzUng7J/ZZqZBzHZQ2
	KJ6f/eljl/O7v3g44rYaI8gvbamAEcOAUoc37q+xOWHfNjndyvIYAWLJDkgpa7BSoHcC/PhIk10P0
	HyPfdrjEuEoadlc2mPshHwghbM41UpgnZKgx6LdSKQEKNLbjvn1xFFuBAmQEEc4bhhpu9ol4I6RLA
	n3/E162arZRUL3nLCq3WqwTNZDANfS4gpMCIfkgtvfhc7i/9nbdg6BLwSt/SJA+BNwyIBZv5AC5Te
	xW1mlUpQ==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NvD-00000008zmY-0mGP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:24 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4314f38d274so29264805e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876581; x=1730481381; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=045viQzx57IhwQQsyT6qqiu42hT8ZIqMYzIaAsSMK5k=;
        b=tjpJXs/1pbJWky4nDDfks9b8lW/DsXhELmcoGm72GW3fr3U8RwDbLR3LK0upCczsgT
         GQdtjXcTMLuQTVzd1+Cq8nLgr+CngU196WAiIk3urMEKLyKsZndPgo7pB0UIQDOsLVOh
         E6AM3CInYXL2GA9oxH7EbkWEeExKWCl0tBbc+ezqKF8XPGWqef1/W5NDNWxJ87Qdh1ym
         W2RkGSfsX8JyY1m/9nO3P42P48QGKPy3y8qv/OJLPrYQSiuHaAJM+XLLlsfCwMv8/bzq
         qpAltT4gK6eq6SVdRXjGUiRnZ1Z6AbQXMGRTK14sWKhh2dJ6kD9vC+B3Yt187QzlGvng
         DYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876581; x=1730481381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=045viQzx57IhwQQsyT6qqiu42hT8ZIqMYzIaAsSMK5k=;
        b=Sbk1CWy6eQfX14OYxDWzqTKrpImTyb8svwYSuzbyncsO9M+u+AmJRLLz88QPjxUe+K
         aD4BefqBdDxDIy+J8JIzPlU26RFFQHwybRE2SkpchiTVgkDLYndNApSe/ANJu+3tHnFE
         21SpjPbxeaWHVj877kEgbXJn2RhvL/bDnP3hzwzaFCBOOIAFjnUlEamxmFLoeKobKtCD
         mj8lOqe2+PGUKZ2g2m18maV8WJTnp4bqrzQwHrPNHjgN7prGg1miUYGY7Pq5HqJZhHra
         PqAnkWFuztSY6SU3WIWcaSAL4/aQUhtdd7HX+yJWRe5Y7/FmLmShmd1UkZb8sK9+rdb7
         TThQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNAUmu38K70Fk8dCZuZ/uqD1C9Q+iVh/C4Mwq6NP/luZ2eulDgOnaKUZjlx7UheoMxiC7BAjcSwy3gZK0MVAk5@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhpzu9ldfPJ2uQi8kd38ebFkOfxstq5PanzYPc5GitrSfw1pqI
	1s5HYqp4tqDR3sOfdFi/752GCfDSZg/Sj2gD3UluNS6IF8l7kgdRnvvCBP1P72o=
X-Google-Smtp-Source: AGHT+IFq8aW9+AJOypAF2zuR/gJf+QmQVgnYrUJ9N0n4pCykY2oKrjKRG8wAcTrjRRvZiRW4wqZj4Q==
X-Received: by 2002:a5d:61d2:0:b0:37c:cc4b:d1d6 with SMTP id ffacd0b85a97d-380611a495cmr139300f8f.27.1729876580783;
        Fri, 25 Oct 2024 10:16:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:20 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:51 +0100
Subject: [PATCH v2 20/36] drm/vc4: txp: Add support for BCM2712 MOP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-20-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_181623_328085_1B75359D 
X-CRM114-Status: GOOD (  17.52  )
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
index 2979d141f3bb..0fb8a57652b5 100644
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
 
+static const struct vc4_txp_data bcm2712_mop_data = {
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


