Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D3ACD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 19:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+CrDBvKu/hcgSB1anyD1GXBKe06ZzlWC9+3i2f9q0bQ=; b=2Y2Fcp/5CRXrVM+Da8eIEzCz+C
	l11/QkWL/W9Eu2MZk7Eu48Xwkqw3ZRdVWgfJ4KanpDEHQ0Fdqhc/+2rPQsftIJEUxVyZTFgN7/nLz
	JYk3bxhNxmTgEO8Cu3qZMmGF8KchY5fcaQzs81MgNn/CJlFkBBrDOV2H1td7XGRTDUmWmupAC38pi
	va494c9OjtbaxPTs7/24myN5QCnbP3Synoj2Q1TZgJ49wfay5mSZB6FpbXRBr7eH6HoC3E2BrXmx6
	rQtd/DNokgjy98h/Gc2SgU6aWovsmLQRykuHOX0hvRaeMJO8hl6GJPyel46OiokJ/zCa2t+Z3yB+X
	uvpwDf2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLmuf-00000009THX-0qqs;
	Sat, 09 May 2026 19:00:33 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLmuY-00000009TCY-296y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 19:00:27 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-44a5174670eso1719241f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 12:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353225; x=1778958025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+CrDBvKu/hcgSB1anyD1GXBKe06ZzlWC9+3i2f9q0bQ=;
        b=CBKVB44uKfGKl8Z+VuakWMQGURv7vn76Dw0h//wMmR7FpFhAp0vZZDWPGrSshPmBlm
         JXlV3g/m6kptBBxp/BOdKZmidbmfTxh8EaoaeOXL7OfPwOXXkADvX2NP9D7pvGJ+aRNr
         J5W9zoOV5G8cq3jwtwLdBpHe+F15/Q3MjC9i51vN57TTD0utiHF9e/nO/pOR9vESaG3T
         M25sYxpUGYyN+AhxLy/xl9SzC4tWup0Dq448UMxXisKD/coCGA9dKgVw5oOlTstnTnck
         u0Ulp1VgExNOYEhseaZA970fo3x8oZc1F02Yc742EAJ6fvQFjdTFYn/sPSTM45RkYJjP
         tgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353225; x=1778958025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+CrDBvKu/hcgSB1anyD1GXBKe06ZzlWC9+3i2f9q0bQ=;
        b=GTACYwIcK/uQNICIyBGvOlkNTxa09dQDyRYBwTzQZ8swwYQ3rAH4oKFkZDm/yNIUlV
         SFbvhZBfnbFkcmagWnOuF1pQ9AvfnqglgKZpwNz861vPdz9AH5Cfc8IxudH/yUvHsjUm
         vGScr4ArJno5v+WoNX9fhflT8EdAGz55xmWi6nMocHDJlAIPVNreCpW6Poyn4LrgVhko
         00IUL/FavLW8cG28sHBMNI4KUl1XRmfNigH2wWJ0MqoHJf+mhRnmCiFCG6rgiUKBqydw
         cO+tCGlTDQihgiDa3R55UxxO88CoHukA1lM8lIfSG0dafWcqXXQeSbCHXc25PwHVyku+
         Fvsw==
X-Forwarded-Encrypted: i=1; AFNElJ/YXP3FARjHVVhMBmI85Ifw/pOV2i8jeixAAfKFw0UG5Avo8yUFwbDhiLQDpatWDN1FJ3HeYXLyFxu3rsRE8FQf@lists.infradead.org
X-Gm-Message-State: AOJu0YxDyTBXa++eNKz4bweMlIZ17Cr+cYbwRfBBkckCMv3m+VYpWEs0
	njzboIxOAjYZWvTDSMl9V0B1X3U8dhOW0u8oYhygSkY3B6deY6VWO7QG
X-Gm-Gg: Acq92OFR+PVRhM5fTKqc8IZ+LcathNBqxVFK1pPpS+KoBC5jqypn4uyXbH7E+O0mDha
	q0Vk3OokQ1HTq36KVhondDbL/sF2ZaJKoracudmZB3PyLGf0zFEQ6eQ91PDW352HrwvvBmc9ELm
	6bLZ7fGYbBjZ2AWMzW5fcvZiPmkne4WelapMdb1ipmHUMjUynp78HBiptc9NyVUGNqSiaECOotv
	4TJLEYO14FQMFb8VrOm6JD4fbQgMesoZkA8hAzqlgh/vIOMGBrYN+4a6ubfOZtBCWiLARaZ6yMH
	330+VjroOuOZjcSCD9EihtPQljjlqiBI7WqTQZRZxoWlTvJrklYfD0HBqKdXloIGdQoZnZaEVPo
	ilSfB5S7vf7+H6FpHhUZMy90I2+8N9cXfZZhUQXyqU2wv8ai1cKhbgJ1o6LTQNY6hCbji0dBTrc
	6x6A2STpRm1jWOL4jcxIfr3KmFSf9AapouO8VE6HA3bPIhsD7rr00pRiVLtAI6pTZ3xzY=
X-Received: by 2002:a05:6000:2910:b0:44d:821:1a0b with SMTP id ffacd0b85a97d-4515d3dc326mr27958440f8f.29.1778353224452;
        Sat, 09 May 2026 12:00:24 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:24 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej Skrabec <jernej.skrabec@siol.net>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	jernej.skrabec@gmail.com,
	Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH v2 3/8] drm/sun4i: Add support for DE33 CSC
Date: Sat,  9 May 2026 21:00:10 +0200
Message-ID: <20260509190015.79086-4-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509190015.79086-1-jernej.skrabec@siol.net>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_120026_580437_B64535C2 
X-CRM114-Status: GOOD (  16.41  )
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

From: Jernej Skrabec <jernej.skrabec@gmail.com>

DE33 has channel CSC units (for each plane separately) so pipeline can
be configured to output in desired colorspace.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes from v1:
- collected tag

 drivers/gpu/drm/sun4i/sun8i_csc.c | 71 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_csc.h |  5 +++
 2 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index ce81c12f511d..70fc9b017d17 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -205,6 +205,72 @@ static void sun8i_de3_ccsc_setup(struct regmap *map, int layer,
 			   mask, val);
 }
 
+/* extract constant from high word and invert sign if necessary */
+static u32 sun8i_de33_ccsc_get_constant(u32 value)
+{
+	value >>= 16;
+
+	if (value & BIT(15))
+		return 0x400 - (value & 0x3ff);
+
+	return value;
+}
+
+static void sun8i_de33_convert_table(const u32 *src, u32 *dst)
+{
+	dst[0] = sun8i_de33_ccsc_get_constant(src[3]);
+	dst[1] = sun8i_de33_ccsc_get_constant(src[7]);
+	dst[2] = sun8i_de33_ccsc_get_constant(src[11]);
+	memcpy(&dst[3], src, sizeof(u32) * 12);
+	dst[6] &= 0xffff;
+	dst[10] &= 0xffff;
+	dst[14] &= 0xffff;
+}
+
+static void sun8i_de33_ccsc_setup(struct regmap *map, int layer,
+				  enum sun8i_csc_mode mode,
+				  enum drm_color_encoding encoding,
+				  enum drm_color_range range)
+{
+	u32 addr, val, base, csc[15];
+	const u32 *table;
+	int i;
+
+	table = yuv2rgb_de3[range][encoding];
+	base = DE33_CCSC_BASE + layer * DE33_CH_SIZE;
+
+	switch (mode) {
+	case SUN8I_CSC_MODE_OFF:
+		val = 0;
+		break;
+	case SUN8I_CSC_MODE_YUV2RGB:
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(table, csc);
+		regmap_bulk_write(map, SUN50I_CSC_COEFF(base, 0), csc, 15);
+		break;
+	case SUN8I_CSC_MODE_YVU2RGB:
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(table, csc);
+		for (i = 0; i < 15; i++) {
+			addr = SUN50I_CSC_COEFF(base, i);
+			if (i > 3) {
+				if (((i - 3) & 3) == 1)
+					addr = SUN50I_CSC_COEFF(base, i + 1);
+				else if (((i - 3) & 3) == 2)
+					addr = SUN50I_CSC_COEFF(base, i - 1);
+			}
+			regmap_write(map, addr, csc[i]);
+		}
+		break;
+	default:
+		val = 0;
+		DRM_WARN("Wrong CSC mode specified.\n");
+		return;
+	}
+
+	regmap_write(map, SUN8I_CSC_CTRL(base), val);
+}
+
 static u32 sun8i_csc_get_mode(struct drm_plane_state *state)
 {
 	const struct drm_format_info *format;
@@ -238,6 +304,11 @@ void sun8i_csc_config(struct sun8i_layer *layer,
 				     mode, state->color_encoding,
 				     state->color_range);
 		return;
+	} else if (layer->cfg->de_type == SUN8I_MIXER_DE33) {
+		sun8i_de33_ccsc_setup(layer->regs, layer->channel,
+				      mode, state->color_encoding,
+				      state->color_range);
+		return;
 	}
 
 	base = ccsc_base[layer->cfg->ccsc][layer->channel];
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index 2a4b79599610..d2ba5f8611aa 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -18,9 +18,14 @@ struct sun8i_layer;
 #define CCSC10_OFFSET 0xA0000
 #define CCSC11_OFFSET 0xF0000
 
+#define DE33_CCSC_BASE 0x800
+
 #define SUN8I_CSC_CTRL(base)		((base) + 0x0)
 #define SUN8I_CSC_COEFF(base, i)	((base) + 0x10 + 4 * (i))
 
+#define SUN50I_CSC_COEFF(base, i)	((base) + 0x04 + 4 * (i))
+#define SUN50I_CSC_ALPHA(base)		((base) + 0x40)
+
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
 void sun8i_csc_config(struct sun8i_layer *layer,
-- 
2.54.0


