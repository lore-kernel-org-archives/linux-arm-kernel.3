Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700A1CEB2DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 14:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MocqCxWcaLZfsHWYqTZWM/wBzmMvMPkWJzIzBgPappQ=; b=YZn6O7evVPwzluNPHRxiA82y/Q
	SP+e8yeY3V/4gW1RuKLoVRzh8N41FtN7BpM3ctPWHEnal97CEhHxSEz2o2Cxi4Evo/Ms4bAl+N42x
	nwPyaNuv+gpgCkssPRKPGP5RXAEvb9rv9yMOLFAZVV6G5UfqSHLZggefF6m07ug88ku7L1nbLAd/P
	eb0M0sjE/OmG3rysfTpBrph9LP8rk2GBUluas/YRcd18DzeYD8dTLmHHeoHT6eeJ/3m0rBOcr6TVA
	2I8xRKgbVKYiBIQBfU4u07sdgfWKHhLnyld4Wv06fS5j8kcegwEKmQ2+ocqeRm6fTNug80XeDjLaT
	gfQSjOhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKH2g-0000000Dphr-3Gof;
	Sat, 15 Nov 2025 14:14:18 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKH2d-0000000DpgQ-49A2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 14:14:17 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-640aa1445c3so4560049a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 06:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763216054; x=1763820854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MocqCxWcaLZfsHWYqTZWM/wBzmMvMPkWJzIzBgPappQ=;
        b=UTXoIbV4AZWGu+vM8WZWDtg6DPSI7En43pAGG1w9hGuWRsMKfJ97X47ztu8lhryoAi
         fNttwEokhQVtaxRTv6KEt/1zbcIaUg/r3JYevZ1Wu9Yxh/UcD5dy5CyOP6WNNfAe1sad
         msJjlOqrZQIQP6UtHXhGhoaQyOtpLHBH6qVRQ3O706fAXjDHXnXYYs6cQIyHUToBENS4
         ptM32AFRVUP9Z4A6pJV97mB30nmc/mxvqIApa1Lhvuk04y3J/ZaGm/ZHOCDEQaqmFoqO
         AgbcE8IQBecCENLJElySiBI+1wCWw6Xptkz2nnbT5uZsCJKNdwcHTVOtt26XFFuTedy7
         /65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763216054; x=1763820854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MocqCxWcaLZfsHWYqTZWM/wBzmMvMPkWJzIzBgPappQ=;
        b=V7Z2BL0hY8uIKTgiuBhYcHDT5gtrXLvSShVAmTJ4TCnZEGPJw5SmKBs7OMXEq333iA
         27LXttEY2VzR/IDWdyJCypOM6FxWuYhnB0s1kQ2lBCyH/UFT7rYCloSrDUwTSYXDOeRU
         A5Zkkk6uAr3io3rTwxAu/4EDtvScrUli7noK5b9ln4oW0C9cn9LRta/gPJN0y2b/BEOr
         gPpoWebwZDR5am0NtnKJ5R7up9re2A2zfCWouJOZTBNS+phj0tWkfOaAs1cF+ZCP39Zf
         9B6u1aooHw/kUDMjugxA9FLwrQuoLwC279MLdmPbJv0SCPAz9Wwra89kP+0W6J6LF2B6
         SYoA==
X-Forwarded-Encrypted: i=1; AJvYcCUuQ1qRX7qMk7GfU7Uef9Gdf9P25P4e6D9cc65RrnUK4MVmnV/JumrfbBo/qZHn3BwW2QoirMCYs4f7MqeSACZC@lists.infradead.org
X-Gm-Message-State: AOJu0YzAStY2S2VyyxmKtGS6Own8vVZkqBlwCUHUgfS7b+N1EWJMgLIU
	2Q1UWYVbDMMgfRojPECDfhTyopctz5BD+98ZGzuUeCht0k4Q+MCXkqx3
X-Gm-Gg: ASbGncuG3ln5dG1yaUk75jTmJ39r3GL5f0CV3MTgFHq/Eshs+NmHOGwOfHx1qPnVjtQ
	da6aC2u7jGNS+/A1xjLGYaBIuWNiknB3hKiAvMOw39MkcluCvg3yx7kq/tHAS3S46Yawvau4dHB
	Q/FmLczZW7T6++Q8Iafb85olDiDiUHu6LExRhT+vjHk/Z+B20ZnM8OBjxpbmdT+VnH4jU3np5mT
	RsiYgUthhwl7xuJePcj3QnEsS2yKGzkmLzRCNwSNKCvXCPQlo3LmPwrSEukMqHsn+4P2RVxVVv4
	SGNQHqjJnLrArIKzRzDdqIDIYtYitUfB3ZtI+xt8MKjC5RH89VuMzceFZCCZGHs09TKRgD0m1Dk
	t/qraJEHN9FVJqze6esH3HeWk2P/MwzOcyJiglNIO8WHrrIVylD3+kREoOO2bC8oxIXMJLXwLeq
	3TVYRUkltKo+87BCiy19SU+Fs4m6ekNLZt8j5frJ9Xrg2yITgzX+KaAQ+K
X-Google-Smtp-Source: AGHT+IFSj1aDwiro/wwK4L9h7pp1M9ctQw+POyBArF5AsNHZz7cGsgDc33Ii1wskS73N5JZnJxCpEQ==
X-Received: by 2002:a17:906:f145:b0:b73:6d56:f3ff with SMTP id a640c23a62f3a-b736d573ee7mr440406566b.20.1763216054020;
        Sat, 15 Nov 2025 06:14:14 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:14:13 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
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
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/7] drm/sun4i: Add support for DE33 CSC
Date: Sat, 15 Nov 2025 15:13:41 +0100
Message-ID: <20251115141347.13087-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115141347.13087-1-jernej.skrabec@gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_061416_053220_2DE7915A 
X-CRM114-Status: GOOD (  15.88  )
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

DE33 has channel CSC units (for each plane separately) so pipeline can
be configured to output in desired colorspace.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
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
2.51.2


