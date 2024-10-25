Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803B2D149D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 17:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjLOa+CYvpz+BpNsMyaYFjyUkwYrQkclw8bv+vdgZA4=; b=IUUWl8hRXc2GbvmNFo6+c6kpSq
	5h8Q2hCXwzbGH8x+8WOmFcMLWRD2rqXY9WAM2V0AlCT8K2MGMZw8gIc912DQl5i2s92vCoxUvWFSJ
	ymHiiHcwBsHgNuEAJL9EANL3rI/Czwvt3RZc7cNehzWGAkbI2hLI+QhLdYNbhODlFbu+5JdIYIhsS
	KyujsrPLczPuwCABfH0hcP+9Cd//AHM/udTE8cMWJUe/E373ur4z3RTSzi+vCdAPK2aDOnUZhvw8e
	lCP1rnYU0PrrtP7+fqK1tb46Kl2tavv9kuMQ9LZxAY0JuOLsYRRRQIFJppLLfQe1CMOs+B54LslCU
	5MbPiQrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OIB-00000004e3Z-3ZOt;
	Fri, 25 Oct 2024 17:40:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NvC-00000004Xvx-0Z36
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 17:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AjLOa+CYvpz+BpNsMyaYFjyUkwYrQkclw8bv+vdgZA4=; b=Ik6O6cOAdNZpjsfHg99rnDKjw4
	rizx5iirdr3uXlplIA2C42h+ti8mFbu+mc8SKrSi5vbVbv/Zz+tgoLukCd4q/z8PUU3/u4BVrs6U6
	Mf6Z5MPNyVqUanC69717tA+JTPZRC6xATZi0iD1GNQutV2d6aCfd8MXbn7XahBBlqjFvWg0h9QlWe
	sFtn28f5oG5geDiB1wqteM8O+lfb1gCOcE0bylrDpFB80UNkiOAle+C9672HKmsEfZDA3CKjn7FoK
	eJtDTohA5TWX6egV9BJ2RySeuBhO0hHxA1P3tAPGibcQnNKBXnQgBOp2xBgVghpaBR9PT/gOJPcGL
	vxCd21cw==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nv9-00000008zkp-07eU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:20 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-37d495d217bso1930835f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876577; x=1730481377; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AjLOa+CYvpz+BpNsMyaYFjyUkwYrQkclw8bv+vdgZA4=;
        b=HzlFONyI4bNkHeFuzjlaG8Rvv6wuancefkWNaIOc7R/tglxYkbofeC3z278mv4963s
         8dP0b8jLSDeyhuW/XxEX7CjqPpg5/0D8hU9vkguXHIAjMQgZ5K0BjZibEQDz0uoYEqkv
         h/Ih2CuUybCj5CHmq2SilJRuFe7Z81AdljCRT41rUVX5SLMh27ucWMKc8hMjvPbkwkjf
         4wOw/u0aY66Lny8XOT7ymPD9Ch9iox5YX5QHhmiSZnGrPACAav35UGWfQ6FdrCX4EMIY
         auSg/n7NjWhF7kW/wyR+C2c7DJguJY5gK40a4aI05CGatQgzzvvu2zw6LHfsGpmrRb6P
         MxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876577; x=1730481377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjLOa+CYvpz+BpNsMyaYFjyUkwYrQkclw8bv+vdgZA4=;
        b=MNJC/ZBlvqoghNF6T2imdX7oIOfGHm5dBNF4EWM/4Gn1usQjWfwbNlPkhT+yP0rZIr
         LFkGugKz9LUQAZhdDc8jr/BeXrm1+FXdPBHRU7kqmklysHoSwSqKHiu5EngGi1xt346n
         bUctAwBvT3SPXdYQNRJmVkj8nGhManJOWxBO7bpqYL9AQ+EvkLEOhCb80aGS4Rn2QgWj
         6CilMEpFXxzXKhyalBqBqjhRxuFyc9j8mbaZvfP52wASOuqV1YyiWxyhRvAYscVJM7JF
         1NWZjqm5NRz9zyMpVVBOGlQ8wmLwSfif1vFkpZsKEyt0IYXlUPiicu4IQNN5afP/5WVJ
         gD+g==
X-Forwarded-Encrypted: i=1; AJvYcCUILm2p9sn+UtAgYd6G4X0BfP/d9r42FqbjK3X8DAxho68gvN94FHwYaGwMp4Q+MKY5iAYyshdRePbM77vENlzI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8Sbs9uqwhRcIGzeRSBrTfpgzsN4TZwn9VLDjWnPj2cdoTK2/A
	AaYWqY9/IuOyJPXzVCGj23O9eAw1hdG+SRY508FzgRvg4wzn01DTfUPkD0S3X+M=
X-Google-Smtp-Source: AGHT+IGP9nRcQ2kzvdL+ddPuHATxPAjofcN1yD5KA+iaTZo+WrIoFCmEwqLiAauQ9eDZll9Qzpuj9A==
X-Received: by 2002:a5d:444f:0:b0:37c:c832:cf95 with SMTP id ffacd0b85a97d-3806123eecfmr110629f8f.50.1729876576741;
        Fri, 25 Oct 2024 10:16:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:16 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:47 +0100
Subject: [PATCH v2 16/36] drm/vc4: txp: Add horizontal and vertical size
 offset toggle bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-16-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_181619_187711_83680E95 
X-CRM114-Status: GOOD (  15.76  )
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

The new writeback controllers that can be found on the BCM2712 require
to have their horizontal and vertical size reduced by one.

Let's tie that behaviour to the compatible so we can support both the
new and old controllers.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h |  1 +
 drivers/gpu/drm/vc4/vc4_txp.c | 14 ++++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 27deb4cde02d..984fddae0048 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -539,6 +539,7 @@ struct vc4_crtc_data {
 struct vc4_txp_data {
 	struct vc4_crtc_data	base;
 	unsigned int has_byte_enable:1;
+	unsigned int size_minus_one:1;
 };
 
 extern const struct vc4_txp_data bcm2835_txp_data;
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index eaf30b2cfb5b..d2ee872e9c0b 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -291,6 +291,8 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 	struct drm_gem_dma_object *gem;
 	struct drm_display_mode *mode;
 	struct drm_framebuffer *fb;
+	unsigned int hdisplay;
+	unsigned int vdisplay;
 	u32 ctrl;
 	int idx;
 	int i;
@@ -330,9 +332,17 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
 	TXP_WRITE(TXP_DST_PTR, gem->dma_addr + fb->offsets[0]);
 	TXP_WRITE(TXP_DST_PITCH, fb->pitches[0]);
+
+	hdisplay = mode->hdisplay ?: 1;
+	vdisplay = mode->vdisplay ?: 1;
+	if (txp_data->size_minus_one) {
+		hdisplay -= 1;
+		vdisplay -= 1;
+	}
+
 	TXP_WRITE(TXP_DIM,
-		  VC4_SET_FIELD(mode->hdisplay, TXP_WIDTH) |
-		  VC4_SET_FIELD(mode->vdisplay, TXP_HEIGHT));
+		  VC4_SET_FIELD(hdisplay, TXP_WIDTH) |
+		  VC4_SET_FIELD(vdisplay, TXP_HEIGHT));
 
 	TXP_WRITE(TXP_DST_CTRL, ctrl);
 

-- 
2.34.1


