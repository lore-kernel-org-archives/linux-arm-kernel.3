Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7615AD149DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HAmGnbsXlsT4wTydGcek4ZEoMBRAPW62Dt7gooaokpo=; b=FLOFO6ebBzTh+GeWFYX5wfGDwp
	BSNEVXN6zCZV4MdssTXEv1NvAvwDBfWoSQL9m8rA3TSOX4+8serCnuTVZfpxe4OGRfAlKIDGuTZUN
	PUU1Bk9aBiQnB4+gxArbEVW7pCxRptrSsFE+iP+1t4nf/J5iA791EKiu2a03zOeHO1ySSdzOHK6XV
	anvYIXaV2nVZMgO0bCVGkG44EukdzyZZI8CJiPuWHHTpqCLc7nNNAd8QmdGMgQ0wRnaabif/iXXaM
	avxt/5P4IoOP9L7aW6lxOGstVhc4Itjvv2N0GdzrJp7TZvE/kOXFcPzu/jr3tEgFzFfCo2Jhymo69
	koFdpn3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Omv-00000004krf-2FRT;
	Fri, 25 Oct 2024 18:11:53 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nv9-00000004Xuc-3BsP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:22 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-53a007743e7so2843809e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876578; x=1730481378; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HAmGnbsXlsT4wTydGcek4ZEoMBRAPW62Dt7gooaokpo=;
        b=VO7ZZxnuspt/of8sJInlsawDRJfP/4RnqV4YffO8oLdw51qOyYg2TK40kxzcmNJsSd
         hDFuNH5j6x0HySSIlN42CoNi93qappQlowzTVocTD5IpbwOEuHVEjbSNg1rbuaUJ01f1
         rKcPKGRZDTc7wydn82RblGh5JuQeThp6W3kS7iztldOewhP6WkEjtm5Md9/GtQEMmvn4
         w+X15OeeA3yY1/ALY6QtEca9VA5uIvJnk5KoQDVqHprEvDx+xNPstYTKI8Nztx7u+8/f
         TlSvTj8zpDmIw4q0avWAeJ/GhxnojEZ05Qgxt17Sopd4r2XrRuyGPa8mAB0iUFDP32s9
         YKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876578; x=1730481378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAmGnbsXlsT4wTydGcek4ZEoMBRAPW62Dt7gooaokpo=;
        b=p32g1hyvmgk5LQQ0K8OC97OW5lgyqZqukv5mxTG9jEB5uHMW917tKYJkpSVFSDRRRq
         VeyvPBnE0wVIvlayRpQFSm4M1cJEfi/f/YX8GfsnmVJlWzuqXW/W91K+MBl9Vvks2fQ7
         3OzZJN9aj96gARr4pH3YL3qkgBNFu72XVwJU76Qct/HGURJ8cfFsDjgZNVVUM0Rr/F5W
         2D2+SIzKDr9U67hDVAY0pfX7FhoehtY9wYHQ5w1mZd9RDm7Ml+B9o+OiJV5e5FnCLULV
         ryj4Bzb+0QTAUadU4Ewj2BwRRCnDY1DYOYgdS1iOAMv0VZ8Q9i9umDyqBpwpc5ysEoBp
         lsjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRqzo+uUeHGWzNd8H5jdsE+mwFKpGvx+/pzc7J+bjHFO+7J+Qbd3yhunMoXVjBsumiqOewAUARZkS1h1CyfFc0@lists.infradead.org
X-Gm-Message-State: AOJu0YyLYp13JrCdbo4IXU/6rFOtEi19RAR8xI7gpoRWoWPtGFP106+B
	kk1jWsqKvvYDq+qAQN/aCcU4oLOi/IW5SwgLKTcpe6dEPmcqgGbKrLvErtUsa3c=
X-Google-Smtp-Source: AGHT+IFFnG99FDg0tbPUCrnuJ+5q39hROU6G1I7WeeX7XFXM8eg9WZcnUlhOo1IjHc3SXaTvZYJUzg==
X-Received: by 2002:a05:6512:138b:b0:539:f1e3:ca5e with SMTP id 2adb3069b0e04-53b1a391ed0mr5911852e87.44.1729876577643;
        Fri, 25 Oct 2024 10:16:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:17 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:48 +0100
Subject: [PATCH v2 17/36] drm/vc4: txp: Handle 40-bits DMA Addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-17-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_101619_899576_2B626D6F 
X-CRM114-Status: GOOD (  14.89  )
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


