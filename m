Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DED6CFA45D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 18:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HAmGnbsXlsT4wTydGcek4ZEoMBRAPW62Dt7gooaokpo=; b=FodCBA+yfCdEOZuDH8SD2BQMHM
	oV/wCxZ7abmhyk/ZOQSMFbXOIJVgBoo4TlxD8/ahbSy2L/4SF7bxz9XOMONgkLlTUD4SnPGqYq4IQ
	DRU/xRzXwujSOzwh25BYSiCf0ZTVBNIIKB7ZJ0pHmFpsP2jsNNzTwdMIATjEnbMCGGLy+Kg7gPINZ
	xSLdtJjcqKMB/hFSh3j/YpdguR+fkEUX0eGwCyAHcjrCZ/o6c3F17dctpBXmODZafmGQx7rU1CF3W
	7zWTM27bQUbcXChQTv9FPcE+2ntjMW3uJO3xcU7F8viXJ+Sm8/8KbTFWrVFrJo0sMy1pb6EioUO98
	eCaqj5uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3g8t-0000000FY2E-0ulu;
	Wed, 23 Oct 2024 18:31:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eZ6-0000000FDS1-1hHA
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 16:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HAmGnbsXlsT4wTydGcek4ZEoMBRAPW62Dt7gooaokpo=; b=R/Xtp3MLZ5dPOJMgOop4R/NzRk
	krBsU/h8GMFE6b+ArYbYeLmtY+G/KeHF0DJYhXDJhpuw7N3O8lQIRumYHrlh2uRVy/QejIahzePI+
	M71qHNyQN/nUmRvOnSjee7CINhdqlkdCTgrP68SEfRc+xhhnB003tdofGNOzv9C0SPO5Ge7/g6e85
	bGUdyqC3vBtPSDTsxWKWwpU4qgsnt8XDOhIe9xmFR5zdDI8oRtjNKkf5C30RQ+zmmSaLsmJv0+Gwa
	1l0iLwGRoGdu+8FfG+QVmGXV/acXyLCBEh2snVf9jXBqEyc41SONGBBVvvkowP2bI0TcAx8ziZRSl
	Po4n6TQA==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eZ1-00000008TFg-2vzu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:31 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-431616c23b5so516045e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702226; x=1730307026; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HAmGnbsXlsT4wTydGcek4ZEoMBRAPW62Dt7gooaokpo=;
        b=XKcUde0OodSHEXcidWdOYrCNzcrjyWRJoKRejTqetdgi4q8Neb9zwpcDuu5pOTRVdz
         OPTmtUNllE7yp+5Xx8bAffWGK3iOJIL93mhAEazGU9PYO/JWXjTWR59h7xB/L8Oww8mR
         b6Go+ECH09WqveY9xdWxb5Xn4i77ysd9n/0dHMnYyrmx2i+HRdRe5QJT5fgsJUYs2Syd
         mwiYugxs+uq8n8IQpafhmJNG54vt6mfEh1v2SDzgPQ7ZIhZ3Ctc4tOVezpI+8FuOeeW7
         cCq8vU11RrJdzielgJPmcaH0nuzoK8jWWLjf1HC5f+25lMzBECw3er7DKQ2XzbLPjkzd
         RuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702226; x=1730307026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAmGnbsXlsT4wTydGcek4ZEoMBRAPW62Dt7gooaokpo=;
        b=kQXJESkYqAPVbG1bfRJn732zCL48uwed1b0zkgNmKwPAGdnrhvFlIF25XoKqpltV3v
         upoU5k0PYatbUAE0PubuZ90Gr6byAsqp/ARG79e3FRz+F608Rnq5pbDdzX8GQZmdEI6+
         4YKNkOElafO2en+MujiKMuS12V09MNBeARZz0dW2W3aynW4aq5UlPhsDDF0e/g7FxNZ8
         w7oL+JMJp+cP7LvfegKnYN/MFWtGocog5X2GarzSX7za5UBEOVRm13QiBCj8+Eoisl3j
         YcgnaPVL/U55LPOPATqMDt/9WCMISO6OkkXH+8gFBsBY4tk/zKt4MFYzvowLY5xOKoTV
         jl6A==
X-Forwarded-Encrypted: i=1; AJvYcCUr5Wt6ZruaTbClYnHovFKfxIjg9In3yfHLyyick2Vejqa9zjp91+/novO8HXYPbWnbK4MSOrN5embcVF0V94ZB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4n+G4SVnivwYtv+3fceAz1WISoNMprZDIsT0VBdRzP75+p0gd
	kdrygWPHTrO8GAqNHa07YxC6SUIvV+5imcyju4gPVhtfLdpHyhSoh7XN/nAnqac=
X-Google-Smtp-Source: AGHT+IHL2wgt75iB2bh0ZhjUQkAbPcOQbonRHG1SD5jdc74+CwqD//SyS484BHiLP8yrR7PCt0OkEA==
X-Received: by 2002:a05:600c:354f:b0:431:57cf:f13d with SMTP id 5b1f17b1804b1-43184337402mr22456585e9.3.1729702226319;
        Wed, 23 Oct 2024 09:50:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:25 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:15 +0100
Subject: [PATCH 18/37] drm/vc4: txp: Handle 40-bits DMA Addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-18-1cc2d5594907@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241023_175027_945643_C0C1E2D6 
X-CRM114-Status: GOOD (  14.60  )
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

The BCM2712 MOP and MOPLET can handle addresses larger than 32bits
through an extra register. We can easily support it and make it
conditional based on the compatible through a boolean in our variant
structure.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h |  2 ++
 drivers/gpu/drm/vc4/vc4_txp.c | 12 +++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 984fddae0048..34e72e711a17 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -538,8 +538,10 @@ struct vc4_crtc_data {
 
 struct vc4_txp_data {
 	struct vc4_crtc_data	base;
+	unsigned int high_addr_ptr_reg;
 	unsigned int has_byte_enable:1;
 	unsigned int size_minus_one:1;
+	unsigned int supports_40bit_addresses:1;
 };
 
 extern const struct vc4_txp_data bcm2835_txp_data;
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index d2ee872e9c0b..c2726ccde1cf 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -145,6 +145,9 @@
 /* Number of lines received and committed to memory. */
 #define TXP_PROGRESS		0x10
 
+#define TXP_DST_PTR_HIGH_MOPLET	0x1c
+#define TXP_DST_PTR_HIGH_MOP	0x24
+
 #define TXP_READ(offset)								\
 	({										\
 		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
@@ -293,6 +296,7 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 	struct drm_framebuffer *fb;
 	unsigned int hdisplay;
 	unsigned int vdisplay;
+	dma_addr_t addr;
 	u32 ctrl;
 	int idx;
 	int i;
@@ -330,7 +334,13 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 		return;
 
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
-	TXP_WRITE(TXP_DST_PTR, gem->dma_addr + fb->offsets[0]);
+	addr = gem->dma_addr + fb->offsets[0];
+
+	TXP_WRITE(TXP_DST_PTR, lower_32_bits(addr));
+
+	if (txp_data->supports_40bit_addresses)
+		TXP_WRITE(txp_data->high_addr_ptr_reg, upper_32_bits(addr) & 0xff);
+
 	TXP_WRITE(TXP_DST_PITCH, fb->pitches[0]);
 
 	hdisplay = mode->hdisplay ?: 1;

-- 
2.34.1


