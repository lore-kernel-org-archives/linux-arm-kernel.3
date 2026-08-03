Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7F4C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7t2IG/bjYzTOtWYdkDb/FYlzP9IlRZpnBpyzw8LyRI=; b=jychUPA3lf6QXYco+XeZqWkzTD
	BMBUiTSbYQcCnAcgH+3tr+ySqtwvZabZeum8by7YXsaOIRACtmtW8JTDpGRpAVM+ZuiOTRjdGEdSV
	syaQNtLE7nKlRAasJwJYtVbH3gO3JHiuhuFnqnH+w2XBFxVJQr3GFf+3c5/s0MEixuO7a7eyXXvsK
	aY8AEBrYw4ZRQm9Ro/qMokzr02pS+/09unlfckQIk/LLCdkPue89/8dxjSDQ66iNtqPwP1irmH8QM
	nW0OZTlwCp7S8vmjg7r7XkUOEejYO6b1ECkcjv/1HH1bXF18vwHSUEJozGlshjVDWReI0Xt4mQ/m8
	s8imKD0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvG7-000000001iz-1HQH;
	Mon, 03 Aug 2026 16:11:23 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvG1-000000001e4-3cwx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:11:20 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-495590dde14so23149055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773476; x=1786378276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7t2IG/bjYzTOtWYdkDb/FYlzP9IlRZpnBpyzw8LyRI=;
        b=Uw/EV6DfMsXsQPwTgLSJvD03wxt0e6i5e/808AmkcBrtRn9WWYGssjYQrV/ZI8e0MN
         aaj1bKaZh9yHznLsSl1DwTnwNJyazseaFsSZdZS2LLugQDanlCe9qAAqAajiiJSLit6w
         BNcBlVDWjzJCuvveiNeUNELrsEGlGi1eGzVZD74hWax2xUxvKPgxIBToNG9GOo4HoVPB
         9ppLwQNOS80WsdUhvoz2qemMU/5o/5W9X6O8BmWHc8n17f99khlhwQsN/ixnwmbQ0ZBj
         Dt+nnMdaarTOHlvAZ0xSHud5D6KT2is6IbArvO4YbCjxEWFx6OhT7UlfRO8QbYM/Nfrd
         RSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773476; x=1786378276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7t2IG/bjYzTOtWYdkDb/FYlzP9IlRZpnBpyzw8LyRI=;
        b=ZXUOkCM32ID+HWUGhKJndhLPaz6n4DlSMJ2QMJrpwohWbVg7T9JVkywT2fULp0Lxy6
         i2NeMHo0+TUpN7FziO9wTuDSYk6G6uH+EoxrtsZQX9rvFm89yFG/eBICGNVj6N1iJzUr
         Zj51R3KEI3w0U3n0vaU7vX+e7xVRMNIktDdtvszCH5DCHfKVV/ykZ9BceddZkbtYMWY/
         8nuf49vwHJTGVcjZS0grLJemj0g6WreK6YAVyegU2+LwG1uNDh+iF01EWzdwYjVDaZI9
         N5MDyi0QBQokWpfw18JHPukLXhGe3TVEsBbyJJmlNXu9+mORDsFuq3Pwbct6WcJxdEC5
         8ccQ==
X-Forwarded-Encrypted: i=1; AHgh+RqaAJNnmuDB8bliGJSSPWlMKevRnmxJRkDNBMNab/AK2cXSJtIWE1Gd1Egrpr/wuFQhuuh+p+Y2bSd2WzDJnSZI@lists.infradead.org
X-Gm-Message-State: AOJu0YxELUjSBEaAuOxiSa4/A0Ce4HVc+EiwsBJcrqi7jmOJ44/0Xmt0
	Y2ErQ2z3SHEu/ZGWMfznzHqJsc52s0uYPVTJbiwMpfiW+rTZNaujuPKt
X-Gm-Gg: AR+sD12KsCfH54crzpwQ/APc4wLatLGNmSQEOT8174AYKBU+8VzZRVtjPV0gCEspBFQ
	PoR/T14SEG+HkjqgEiyhLqGvCXmDIsjii6y5C+vSmHV+8ofDNDhQzwqYNsWBfDoNtZU7ptfWhg9
	cIQpyuAXxKOBDjqhJkysYjMJvnihlKpSdUOedKHshoBSl8u8vY/w5RSt+4clJUcEibzRTmkbD9b
	A7jLsv67+CzGB8RXNOddtd7dT4GFo6Apajakn1aWVZ8j3Xx8PAL6G75MtndMiLQj0x86BDeZCxd
	dRKQocWpW5unq6N/cF1MrazsD5PkCKHH2O6DcWhV2OUcH863wHv/wmiejrgmOWho91FHhPYx0hT
	/2hacoipCqDbKSzgzTydyd8m+pqomow/fFEcpT7CgEfO0KxGCq/X4MqlATd/rvGyi0AsybvoWdv
	VVnqaCtFjWa7Jer6op0qZaFYNo7wO1OXWi8m33wBetL/3weXrjvpEoGDzzxx2LW2ZFIxZfI+92S
	9weZSlljgKFu+saCiDJ88ADTTh/sSMYXNvnupI7o5wHiXzDqgNkf50r3HXu/v00f5cTIOEwYFMw
	cMCsNfSThBtl8CDfD4/yKEEhrsl1sqQK6np3ebN051X+YMTQrz9OMbOzdx+F45ysWyasjyxS3xq
	5uU+0kYguN0Z1V31c6SGK7XVKp+UfAj/Z2jFKcIozln+GXz5bbQ4emhT4Oq3jcHyMj4ZqCg4eJn
	HP1Q==
X-Received: by 2002:a05:600c:6d03:b0:495:7a23:1eee with SMTP id 5b1f17b1804b1-4980c674f32mr180465495e9.12.1785773475697;
        Mon, 03 Aug 2026 09:11:15 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:15 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 02/13] drm/sun4i: vi scaler: Fix coefficient selection
Date: Mon,  3 Aug 2026 18:10:40 +0200
Message-ID: <263a4a41442a3c8b072b170256b72658f1b90802.1785772659.git.jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785772659.git.jernej.skrabec@gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_091117_982039_0B4B318E 
X-CRM114-Status: GOOD (  12.28  )
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

Currently, vertical coefficients are selected based on horizontal
scaling, which is wrong. Additionally, chroma coefficients should be
selected based on format subsampling.

Fix all that.

Fixes: b862a648de3b ("drm/sun4i: Add support for HW scaling to DE2")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index 3dec4eeb1ba2..d4412a62c2f0 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -894,20 +894,26 @@ static void sun8i_vi_scaler_set_coeff(struct regmap *map, u32 base,
 			     lan3coefftab32_left[offset + i]);
 		regmap_write(map, SUN8I_SCALER_VSU_YHCOEFF1(base, i),
 			     lan3coefftab32_right[offset + i]);
+	}
+	offset = sun8i_vi_scaler_coef_index(vstep) *
+			SUN8I_VI_SCALER_COEFF_COUNT;
+	for (i = 0; i < SUN8I_VI_SCALER_COEFF_COUNT; i++)
+		regmap_write(map, SUN8I_SCALER_VSU_YVCOEFF(base, i),
+			     lan2coefftab32[offset + i]);
+
+	offset = sun8i_vi_scaler_coef_index(hstep / format->hsub) *
+			SUN8I_VI_SCALER_COEFF_COUNT;
+	for (i = 0; i < SUN8I_VI_SCALER_COEFF_COUNT; i++) {
 		regmap_write(map, SUN8I_SCALER_VSU_CHCOEFF0(base, i),
 			     ch_left[offset + i]);
 		regmap_write(map, SUN8I_SCALER_VSU_CHCOEFF1(base, i),
 			     ch_right[offset + i]);
 	}
-
-	offset = sun8i_vi_scaler_coef_index(hstep) *
+	offset = sun8i_vi_scaler_coef_index(vstep / format->vsub) *
 			SUN8I_VI_SCALER_COEFF_COUNT;
-	for (i = 0; i < SUN8I_VI_SCALER_COEFF_COUNT; i++) {
-		regmap_write(map, SUN8I_SCALER_VSU_YVCOEFF(base, i),
-			     lan2coefftab32[offset + i]);
+	for (i = 0; i < SUN8I_VI_SCALER_COEFF_COUNT; i++)
 		regmap_write(map, SUN8I_SCALER_VSU_CVCOEFF(base, i),
 			     cy[offset + i]);
-	}
 }
 
 void sun8i_vi_scaler_enable(struct sun8i_layer *layer, bool enable)
-- 
2.43.0


