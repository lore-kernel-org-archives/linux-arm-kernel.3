Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C49C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 20:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JsbinM8pfIZhsw6KubZ4VNabJpTXJFIRYJ5pyYy9jJQ=; b=Gk6NafrAYlhMH9NoqqnhvUCW/o
	Yppzo11o/TYhbV2DvVeED4A61PMcVRxUnM3hjRjVXsKPX9A2v2oz1ZCU2SDJcxh6l1RnHSn+F1+EL
	WQSwF/XHZ489F9R8K9Tg4abDwQ6ywj7RXq/Y3DhogDkFgQnC9k6Fyu9h+yCWUcaPvncJxw7jCcrZ6
	wjsSIy0Dh94xCezvHPeZVXh3wQki1GPIelNzlsNlQxh3gMRcds+zJB/vzBZm9tQx61bS/20YQWFBb
	CAw/ANIgWhK3zKlVtFjDAey7Af4doqVKY54N6Gzx2gWASFawzvamklvHFGU8m3MeyTanMqBIHtw/n
	OseSloqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6xba-000000055LV-1ntL;
	Mon, 21 Apr 2025 20:19:02 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6xW5-000000054e6-40Qt;
	Mon, 21 Apr 2025 20:13:23 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso3913733a12.1;
        Mon, 21 Apr 2025 13:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745266400; x=1745871200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsbinM8pfIZhsw6KubZ4VNabJpTXJFIRYJ5pyYy9jJQ=;
        b=JnGeedTHtmIGAIMIglsC3RAa6gABkxsCx5cmUYlm38F10LV5QZ/+zL8pP+zMP8FzZB
         9YDsvBODlDovErSppdkcJfQv2k/pvHW0geuu3AZw0V3GvU7k+X7ZzUuoKHKNs7PdiTDI
         tyN1cjFtu45lHpCJtdnE1GBKnIVCR2Inula7WNXu3LKGhLBhHUxyOKjgyDyo6JYxLtaK
         Cl5VP2tdNAktltG0bHc10aKQ12WO4RcLeF0ixHgjsMRdHDr5KySM7fCMUF6dSgZ1ATLw
         ZIzdDQ8H/UU/CBhJJ0Dcnmu51+8rxOtPmJg0TJOqPHgu6N8jj4ArASaWk+Gb9yXP+9Tv
         OvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745266400; x=1745871200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsbinM8pfIZhsw6KubZ4VNabJpTXJFIRYJ5pyYy9jJQ=;
        b=p+BMfKgNaBIcd/RIlVg20Kvwx0d6Y2GcawVWEBxymvEh7nV0uGTw+9raqG3eJKZ7l/
         /VndNKIl58bGMfq6dPA4kCNj+L2Mn3wRXjnoFsm8Bgtyn3Z/F39Dly7sJHeYLCO/MfAi
         EYWtGNH0uB2IyDXmODV22e4jhy72BMijUOhOo+Vw/OZSomqQuwg0utJKL1UpI8Y3KZkH
         HESkCYbFp4tCcZ+ln+EHUyXip9fS65NuftihF4GETlzhDzdr5gb9Lf+eIsdDUmBcDQgL
         z38/y05wAUmuxtsMe2V3D8ezAROKDPtRuDHtAqWx2c2QnNWm+4mvZjZUkAa2bCQLhwS7
         SYmg==
X-Forwarded-Encrypted: i=1; AJvYcCX+8+3aX9hrU7tfXQ9rE55nNP3V/qTTUBlFYOS+OYF4pc5DYm36kDPElng9O85mDDYKWZ7O5WifX2DmJFGSagD4ug==@lists.infradead.org, AJvYcCXAQrCGQTEA/6c6TCymLxkK6uB29rnwHembecSNPo//noZKVzC0cHcgvgTFQbbPZpWoNl2WCcpWsKxc7QGl@lists.infradead.org
X-Gm-Message-State: AOJu0YxKyyfv5nMLtvKCby5XJ6tx/F67wOI9iFUbxvGO1npbB0DnqE4b
	nmtQIqIibptb8P2JXjSEUQglRthVq+5dk5r9ipBFOeTyV3gsRCtg
X-Gm-Gg: ASbGnctIb/PoeP5u4G9nF009yMfVkPsHe5GJMfZhOeRfQFzC4AnNZ3IrGPkqYywQJKI
	1qfKmSNqPyUAB8wRG19YpRhHUVNu1vfnFWwiC2IaDxTDEFXwU53/7Mv5pmMpylhXnRRxhiCFuvp
	YDTgMlhKZw3ieEs2B0i0C+my/vzSXNOtKqNOUhaOFpQQ8cy77U5WBkY8qKRIOVhgQk7UosQ5r4T
	M+xPZ9OMwZiF2bKKfTFaZvbG/I4VQNpq/LeKLlDyuNyQtRmnWnwSwScTrgeX68M3FMqLSrLkRcc
	scApgnI+1qD16IoQPcsQ6mwKsDopqgaGeI/3cGEqTb9GU7e7nrNwuyk2wtBLyE8vYHZqhTYPD3Z
	JyAtBVT48FDt4gUk7IZQN+mUWL+v7i+kk28aQbjUKMlb8IIBLJ1wpXuqRIa1SjnfqxQ==
X-Google-Smtp-Source: AGHT+IHsZ/NuDK0IuqZyQaLl/+J8JeLQl3sL0LmN3d9W1xo3o8AVpB20Ji79CvJUYXWioTu42XY8LQ==
X-Received: by 2002:a05:6402:510c:b0:5ed:599a:3cbe with SMTP id 4fb4d7f45d1cf-5f627cdbaf1mr11266349a12.4.1745266399987;
        Mon, 21 Apr 2025 13:13:19 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a503-5900-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:a503:5900::e63])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5f62557a547sm4955447a12.22.2025.04.21.13.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 13:13:18 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org
Cc: neil.armstrong@linaro.org,
	christianshewitt@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH RFC v2 2/2] drm/meson: use unsigned long long / Hz for frequency types
Date: Mon, 21 Apr 2025 22:13:00 +0200
Message-ID: <20250421201300.778955-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
References: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_131321_999235_43205548 
X-CRM114-Status: GOOD (  23.35  )
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

Christian reports that 4K output using YUV420 encoding fails with the
following error:
  Fatal Error, invalid HDMI vclk freq 593406

Modetest shows the following:
  3840x2160 59.94 3840 4016 4104 4400 2160 2168 2178 2250 593407 flags: xxxx, xxxx,
  drm calculated value -------------------------------------^

This indicates that there's a (1kHz) mismatch between the clock
calculated by the drm framework and the meson driver.

Relevant function call stack:
(drm framework)
  -> meson_encoder_hdmi_atomic_enable()
    -> meson_encoder_hdmi_set_vclk()
      -> meson_vclk_setup()

The video clock requested by the drm framework is 593407kHz. This is
passed by meson_encoder_hdmi_atomic_enable() to
meson_encoder_hdmi_set_vclk() and the following formula is applied:
- the frequency is halved (which would be 296703.5kHz) and rounded down
  to the next full integer, which is 296703kHz
- TMDS clock is calculated (296703kHz * 10)
- video encoder clock is calculated - this needs to match a table from
  meson_vclk.c and so it doubles the previously halved value again
  (resulting in 593406kHz)
- meson_vclk_setup() can't find (either directly, or by deriving it from
  594000kHz * 1000 / 1001 and rounding to the closest integer value -
  which is 593407kHz as originally requested by the drm framework) a
  matching clock in it's internal table and errors out with "invalid
  HDMI vclk freq"

Fix the division precision by switching the whole meson driver to use
unsigned long long (64-bit) Hz values for clock frequencies instead of
unsigned int (32-bit) kHz to fix the rouding error.

Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes since v1 from Christian:
- fix compilation targeting 32-bit ARM
- change all clock frequencies from kHz to Hz (throughout the whole
  driver)


 drivers/gpu/drm/meson/meson_drv.c          |   2 +-
 drivers/gpu/drm/meson/meson_drv.h          |   2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c |  29 +--
 drivers/gpu/drm/meson/meson_vclk.c         | 195 +++++++++++----------
 drivers/gpu/drm/meson/meson_vclk.h         |  13 +-
 5 files changed, 126 insertions(+), 115 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 81d2ee37e773..49ff9f1f16d3 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -169,7 +169,7 @@ static const struct meson_drm_soc_attr meson_drm_soc_attrs[] = {
 	/* S805X/S805Y HDMI PLL won't lock for HDMI PHY freq > 1,65GHz */
 	{
 		.limits = {
-			.max_hdmi_phy_freq = 1650000,
+			.max_hdmi_phy_freq = 1650000000,
 		},
 		.attrs = (const struct soc_device_attribute []) {
 			{ .soc_id = "GXL (S805*)", },
diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
index 3f9345c14f31..be4b0e4df6e1 100644
--- a/drivers/gpu/drm/meson/meson_drv.h
+++ b/drivers/gpu/drm/meson/meson_drv.h
@@ -37,7 +37,7 @@ struct meson_drm_match_data {
 };
 
 struct meson_drm_soc_limits {
-	unsigned int max_hdmi_phy_freq;
+	unsigned long long max_hdmi_phy_freq;
 };
 
 struct meson_drm {
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 6d1c9262a2cf..7752d8ac85f0 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -70,12 +70,12 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
 {
 	struct meson_drm *priv = encoder_hdmi->priv;
 	int vic = drm_match_cea_mode(mode);
-	unsigned int phy_freq;
-	unsigned int vclk_freq;
-	unsigned int venc_freq;
-	unsigned int hdmi_freq;
+	unsigned long long phy_freq;
+	unsigned long long vclk_freq;
+	unsigned long long venc_freq;
+	unsigned long long hdmi_freq;
 
-	vclk_freq = mode->clock;
+	vclk_freq = mode->clock * 1000;
 
 	/* For 420, pixel clock is half unlike venc clock */
 	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
@@ -107,7 +107,8 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		venc_freq /= 2;
 
-	dev_dbg(priv->dev, "vclk:%d phy=%d venc=%d hdmi=%d enci=%d\n",
+	dev_dbg(priv->dev,
+		"vclk:%lluHz phy=%lluHz venc=%lluHz hdmi=%lluHz enci=%d\n",
 		phy_freq, vclk_freq, venc_freq, hdmi_freq,
 		priv->venc.hdmi_use_enci);
 
@@ -122,10 +123,11 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 	struct meson_drm *priv = encoder_hdmi->priv;
 	bool is_hdmi2_sink = display_info->hdmi.scdc.supported;
-	unsigned int phy_freq;
-	unsigned int vclk_freq;
-	unsigned int venc_freq;
-	unsigned int hdmi_freq;
+	unsigned long long clock = mode->clock * 1000;
+	unsigned long long phy_freq;
+	unsigned long long vclk_freq;
+	unsigned long long venc_freq;
+	unsigned long long hdmi_freq;
 	int vic = drm_match_cea_mode(mode);
 	enum drm_mode_status status;
 
@@ -144,12 +146,12 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
 		if (status != MODE_OK)
 			return status;
 
-		return meson_vclk_dmt_supported_freq(priv, mode->clock);
+		return meson_vclk_dmt_supported_freq(priv, clock);
 	/* Check against supported VIC modes */
 	} else if (!meson_venc_hdmi_supported_vic(vic))
 		return MODE_BAD;
 
-	vclk_freq = mode->clock;
+	vclk_freq = clock;
 
 	/* For 420, pixel clock is half unlike venc clock */
 	if (drm_mode_is_420_only(display_info, mode) ||
@@ -179,7 +181,8 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		venc_freq /= 2;
 
-	dev_dbg(priv->dev, "%s: vclk:%d phy=%d venc=%d hdmi=%d\n",
+	dev_dbg(priv->dev,
+		"%s: vclk:%lluHz phy=%lluHz venc=%lluHz hdmi=%lluHz\n",
 		__func__, phy_freq, vclk_freq, venc_freq, hdmi_freq);
 
 	return meson_vclk_vic_supported_freq(priv, phy_freq, vclk_freq);
diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index 2a82119eb58e..3325580d885d 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -110,7 +110,10 @@
 #define HDMI_PLL_LOCK		BIT(31)
 #define HDMI_PLL_LOCK_G12A	(3 << 30)
 
-#define FREQ_1000_1001(_freq)	DIV_ROUND_CLOSEST(_freq * 1000, 1001)
+#define PIXEL_FREQ_1000_1001(_freq)	\
+	DIV_ROUND_CLOSEST_ULL((_freq) * 1000ULL, 1001ULL)
+#define PHY_FREQ_1000_1001(_freq)	\
+	(PIXEL_FREQ_1000_1001(DIV_ROUND_DOWN_ULL(_freq, 10ULL)) * 10)
 
 /* VID PLL Dividers */
 enum {
@@ -360,11 +363,11 @@ enum {
 };
 
 struct meson_vclk_params {
-	unsigned int pll_freq;
-	unsigned int phy_freq;
-	unsigned int vclk_freq;
-	unsigned int venc_freq;
-	unsigned int pixel_freq;
+	unsigned long long pll_freq;
+	unsigned long long phy_freq;
+	unsigned long long vclk_freq;
+	unsigned long long venc_freq;
+	unsigned long long pixel_freq;
 	unsigned int pll_od1;
 	unsigned int pll_od2;
 	unsigned int pll_od3;
@@ -372,11 +375,11 @@ struct meson_vclk_params {
 	unsigned int vclk_div;
 } params[] = {
 	[MESON_VCLK_HDMI_ENCI_54000] = {
-		.pll_freq = 4320000,
-		.phy_freq = 270000,
-		.vclk_freq = 54000,
-		.venc_freq = 54000,
-		.pixel_freq = 54000,
+		.pll_freq = 4320000000,
+		.phy_freq = 270000000,
+		.vclk_freq = 54000000,
+		.venc_freq = 54000000,
+		.pixel_freq = 54000000,
 		.pll_od1 = 4,
 		.pll_od2 = 4,
 		.pll_od3 = 1,
@@ -384,11 +387,11 @@ struct meson_vclk_params {
 		.vclk_div = 1,
 	},
 	[MESON_VCLK_HDMI_DDR_54000] = {
-		.pll_freq = 4320000,
-		.phy_freq = 270000,
-		.vclk_freq = 54000,
-		.venc_freq = 54000,
-		.pixel_freq = 27000,
+		.pll_freq = 4320000000,
+		.phy_freq = 270000000,
+		.vclk_freq = 54000000,
+		.venc_freq = 54000000,
+		.pixel_freq = 27000000,
 		.pll_od1 = 4,
 		.pll_od2 = 4,
 		.pll_od3 = 1,
@@ -396,11 +399,11 @@ struct meson_vclk_params {
 		.vclk_div = 1,
 	},
 	[MESON_VCLK_HDMI_DDR_148500] = {
-		.pll_freq = 2970000,
-		.phy_freq = 742500,
-		.vclk_freq = 148500,
-		.venc_freq = 148500,
-		.pixel_freq = 74250,
+		.pll_freq = 2970000000,
+		.phy_freq = 742500000,
+		.vclk_freq = 148500000,
+		.venc_freq = 148500000,
+		.pixel_freq = 74250000,
 		.pll_od1 = 4,
 		.pll_od2 = 1,
 		.pll_od3 = 1,
@@ -408,11 +411,11 @@ struct meson_vclk_params {
 		.vclk_div = 1,
 	},
 	[MESON_VCLK_HDMI_74250] = {
-		.pll_freq = 2970000,
-		.phy_freq = 742500,
-		.vclk_freq = 74250,
-		.venc_freq = 74250,
-		.pixel_freq = 74250,
+		.pll_freq = 2970000000,
+		.phy_freq = 742500000,
+		.vclk_freq = 74250000,
+		.venc_freq = 74250000,
+		.pixel_freq = 74250000,
 		.pll_od1 = 2,
 		.pll_od2 = 2,
 		.pll_od3 = 2,
@@ -420,11 +423,11 @@ struct meson_vclk_params {
 		.vclk_div = 1,
 	},
 	[MESON_VCLK_HDMI_148500] = {
-		.pll_freq = 2970000,
-		.phy_freq = 1485000,
-		.vclk_freq = 148500,
-		.venc_freq = 148500,
-		.pixel_freq = 148500,
+		.pll_freq = 2970000000,
+		.phy_freq = 1485000000,
+		.vclk_freq = 148500000,
+		.venc_freq = 148500000,
+		.pixel_freq = 148500000,
 		.pll_od1 = 1,
 		.pll_od2 = 2,
 		.pll_od3 = 2,
@@ -432,11 +435,11 @@ struct meson_vclk_params {
 		.vclk_div = 1,
 	},
 	[MESON_VCLK_HDMI_297000] = {
-		.pll_freq = 5940000,
-		.phy_freq = 2970000,
-		.venc_freq = 297000,
-		.vclk_freq = 297000,
-		.pixel_freq = 297000,
+		.pll_freq = 5940000000,
+		.phy_freq = 2970000000,
+		.venc_freq = 297000000,
+		.vclk_freq = 297000000,
+		.pixel_freq = 297000000,
 		.pll_od1 = 2,
 		.pll_od2 = 1,
 		.pll_od3 = 1,
@@ -444,11 +447,11 @@ struct meson_vclk_params {
 		.vclk_div = 2,
 	},
 	[MESON_VCLK_HDMI_594000] = {
-		.pll_freq = 5940000,
-		.phy_freq = 5940000,
-		.venc_freq = 594000,
-		.vclk_freq = 594000,
-		.pixel_freq = 594000,
+		.pll_freq = 5940000000,
+		.phy_freq = 5940000000,
+		.venc_freq = 594000000,
+		.vclk_freq = 594000000,
+		.pixel_freq = 594000000,
 		.pll_od1 = 1,
 		.pll_od2 = 1,
 		.pll_od3 = 2,
@@ -456,11 +459,11 @@ struct meson_vclk_params {
 		.vclk_div = 1,
 	},
 	[MESON_VCLK_HDMI_594000_YUV420] = {
-		.pll_freq = 5940000,
-		.phy_freq = 2970000,
-		.venc_freq = 594000,
-		.vclk_freq = 594000,
-		.pixel_freq = 297000,
+		.pll_freq = 5940000000,
+		.phy_freq = 2970000000,
+		.venc_freq = 594000000,
+		.vclk_freq = 594000000,
+		.pixel_freq = 297000000,
 		.pll_od1 = 2,
 		.pll_od2 = 1,
 		.pll_od3 = 1,
@@ -617,16 +620,16 @@ static void meson_hdmi_pll_set_params(struct meson_drm *priv, unsigned int m,
 				3 << 20, pll_od_to_reg(od3) << 20);
 }
 
-#define XTAL_FREQ 24000
+#define XTAL_FREQ (24 * 1000 * 1000)
 
 static unsigned int meson_hdmi_pll_get_m(struct meson_drm *priv,
-					 unsigned int pll_freq)
+					 unsigned long long pll_freq)
 {
 	/* The GXBB PLL has a /2 pre-multiplier */
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXBB))
-		pll_freq /= 2;
+		pll_freq = DIV_ROUND_DOWN_ULL(pll_freq, 2);
 
-	return pll_freq / XTAL_FREQ;
+	return DIV_ROUND_DOWN_ULL(pll_freq, XTAL_FREQ);
 }
 
 #define HDMI_FRAC_MAX_GXBB	4096
@@ -635,12 +638,13 @@ static unsigned int meson_hdmi_pll_get_m(struct meson_drm *priv,
 
 static unsigned int meson_hdmi_pll_get_frac(struct meson_drm *priv,
 					    unsigned int m,
-					    unsigned int pll_freq)
+					    unsigned long long pll_freq)
 {
-	unsigned int parent_freq = XTAL_FREQ;
+	unsigned long long parent_freq = XTAL_FREQ;
 	unsigned int frac_max = HDMI_FRAC_MAX_GXL;
 	unsigned int frac_m;
 	unsigned int frac;
+	u32 remainder;
 
 	/* The GXBB PLL has a /2 pre-multiplier and a larger FRAC width */
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXBB)) {
@@ -652,11 +656,11 @@ static unsigned int meson_hdmi_pll_get_frac(struct meson_drm *priv,
 		frac_max = HDMI_FRAC_MAX_G12A;
 
 	/* We can have a perfect match !*/
-	if (pll_freq / m == parent_freq &&
-	    pll_freq % m == 0)
+	if (div_u64_rem(pll_freq, m, &remainder) == parent_freq &&
+	    remainder == 0)
 		return 0;
 
-	frac = div_u64((u64)pll_freq * (u64)frac_max, parent_freq);
+	frac = mul_u64_u64_div_u64(pll_freq, frac_max, parent_freq);
 	frac_m = m * frac_max;
 	if (frac_m > frac)
 		return frac_max;
@@ -666,7 +670,7 @@ static unsigned int meson_hdmi_pll_get_frac(struct meson_drm *priv,
 }
 
 static bool meson_hdmi_pll_validate_params(struct meson_drm *priv,
-					   unsigned int m,
+					   unsigned long long m,
 					   unsigned int frac)
 {
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXBB)) {
@@ -694,7 +698,7 @@ static bool meson_hdmi_pll_validate_params(struct meson_drm *priv,
 }
 
 static bool meson_hdmi_pll_find_params(struct meson_drm *priv,
-				       unsigned int freq,
+				       unsigned long long freq,
 				       unsigned int *m,
 				       unsigned int *frac,
 				       unsigned int *od)
@@ -706,7 +710,7 @@ static bool meson_hdmi_pll_find_params(struct meson_drm *priv,
 			continue;
 		*frac = meson_hdmi_pll_get_frac(priv, *m, freq * *od);
 
-		DRM_DEBUG_DRIVER("PLL params for %dkHz: m=%x frac=%x od=%d\n",
+		DRM_DEBUG_DRIVER("PLL params for %lluHz: m=%x frac=%x od=%d\n",
 				 freq, *m, *frac, *od);
 
 		if (meson_hdmi_pll_validate_params(priv, *m, *frac))
@@ -718,7 +722,7 @@ static bool meson_hdmi_pll_find_params(struct meson_drm *priv,
 
 /* pll_freq is the frequency after the OD dividers */
 enum drm_mode_status
-meson_vclk_dmt_supported_freq(struct meson_drm *priv, unsigned int freq)
+meson_vclk_dmt_supported_freq(struct meson_drm *priv, unsigned long long freq)
 {
 	unsigned int od, m, frac;
 
@@ -741,7 +745,7 @@ EXPORT_SYMBOL_GPL(meson_vclk_dmt_supported_freq);
 
 /* pll_freq is the frequency after the OD dividers */
 static void meson_hdmi_pll_generic_set(struct meson_drm *priv,
-				       unsigned int pll_freq)
+				       unsigned long long pll_freq)
 {
 	unsigned int od, m, frac, od1, od2, od3;
 
@@ -756,7 +760,7 @@ static void meson_hdmi_pll_generic_set(struct meson_drm *priv,
 			od1 = od / od2;
 		}
 
-		DRM_DEBUG_DRIVER("PLL params for %dkHz: m=%x frac=%x od=%d/%d/%d\n",
+		DRM_DEBUG_DRIVER("PLL params for %lluHz: m=%x frac=%x od=%d/%d/%d\n",
 				 pll_freq, m, frac, od1, od2, od3);
 
 		meson_hdmi_pll_set_params(priv, m, frac, od1, od2, od3);
@@ -764,17 +768,18 @@ static void meson_hdmi_pll_generic_set(struct meson_drm *priv,
 		return;
 	}
 
-	DRM_ERROR("Fatal, unable to find parameters for PLL freq %d\n",
+	DRM_ERROR("Fatal, unable to find parameters for PLL freq %lluHz\n",
 		  pll_freq);
 }
 
 enum drm_mode_status
-meson_vclk_vic_supported_freq(struct meson_drm *priv, unsigned int phy_freq,
-			      unsigned int vclk_freq)
+meson_vclk_vic_supported_freq(struct meson_drm *priv,
+			      unsigned long long phy_freq,
+			      unsigned long long vclk_freq)
 {
 	int i;
 
-	DRM_DEBUG_DRIVER("phy_freq = %d vclk_freq = %d\n",
+	DRM_DEBUG_DRIVER("phy_freq = %lluHz vclk_freq = %lluHz\n",
 			 phy_freq, vclk_freq);
 
 	/* Check against soc revision/package limits */
@@ -785,19 +790,19 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv, unsigned int phy_freq,
 	}
 
 	for (i = 0 ; params[i].pixel_freq ; ++i) {
-		DRM_DEBUG_DRIVER("i = %d pixel_freq = %d alt = %d\n",
+		DRM_DEBUG_DRIVER("i = %d pixel_freq = %lluHz alt = %lluHz\n",
 				 i, params[i].pixel_freq,
-				 FREQ_1000_1001(params[i].pixel_freq));
-		DRM_DEBUG_DRIVER("i = %d phy_freq = %d alt = %d\n",
+				 PIXEL_FREQ_1000_1001(params[i].pixel_freq));
+		DRM_DEBUG_DRIVER("i = %d phy_freq = %lluHz alt = %lluHz\n",
 				 i, params[i].phy_freq,
-				 FREQ_1000_1001(params[i].phy_freq/10)*10);
+				 PHY_FREQ_1000_1001(params[i].phy_freq));
 		/* Match strict frequency */
 		if (phy_freq == params[i].phy_freq &&
 		    vclk_freq == params[i].vclk_freq)
 			return MODE_OK;
 		/* Match 1000/1001 variant */
-		if (phy_freq == (FREQ_1000_1001(params[i].phy_freq/10)*10) &&
-		    vclk_freq == FREQ_1000_1001(params[i].vclk_freq))
+		if (phy_freq == PHY_FREQ_1000_1001(params[i].phy_freq) &&
+		    vclk_freq == PIXEL_FREQ_1000_1001(params[i].vclk_freq))
 			return MODE_OK;
 	}
 
@@ -805,8 +810,9 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv, unsigned int phy_freq,
 }
 EXPORT_SYMBOL_GPL(meson_vclk_vic_supported_freq);
 
-static void meson_vclk_set(struct meson_drm *priv, unsigned int pll_base_freq,
-			   unsigned int od1, unsigned int od2, unsigned int od3,
+static void meson_vclk_set(struct meson_drm *priv,
+			   unsigned long long pll_base_freq, unsigned int od1,
+			   unsigned int od2, unsigned int od3,
 			   unsigned int vid_pll_div, unsigned int vclk_div,
 			   unsigned int hdmi_tx_div, unsigned int venc_div,
 			   bool hdmi_use_enci, bool vic_alternate_clock)
@@ -826,15 +832,15 @@ static void meson_vclk_set(struct meson_drm *priv, unsigned int pll_base_freq,
 		meson_hdmi_pll_generic_set(priv, pll_base_freq);
 	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXBB)) {
 		switch (pll_base_freq) {
-		case 2970000:
+		case 2970000000:
 			m = 0x3d;
 			frac = vic_alternate_clock ? 0xd02 : 0xe00;
 			break;
-		case 4320000:
+		case 4320000000:
 			m = vic_alternate_clock ? 0x59 : 0x5a;
 			frac = vic_alternate_clock ? 0xe8f : 0;
 			break;
-		case 5940000:
+		case 5940000000:
 			m = 0x7b;
 			frac = vic_alternate_clock ? 0xa05 : 0xc00;
 			break;
@@ -844,15 +850,15 @@ static void meson_vclk_set(struct meson_drm *priv, unsigned int pll_base_freq,
 	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
 		   meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL)) {
 		switch (pll_base_freq) {
-		case 2970000:
+		case 2970000000:
 			m = 0x7b;
 			frac = vic_alternate_clock ? 0x281 : 0x300;
 			break;
-		case 4320000:
+		case 4320000000:
 			m = vic_alternate_clock ? 0xb3 : 0xb4;
 			frac = vic_alternate_clock ? 0x347 : 0;
 			break;
-		case 5940000:
+		case 5940000000:
 			m = 0xf7;
 			frac = vic_alternate_clock ? 0x102 : 0x200;
 			break;
@@ -861,15 +867,15 @@ static void meson_vclk_set(struct meson_drm *priv, unsigned int pll_base_freq,
 		meson_hdmi_pll_set_params(priv, m, frac, od1, od2, od3);
 	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
 		switch (pll_base_freq) {
-		case 2970000:
+		case 2970000000:
 			m = 0x7b;
 			frac = vic_alternate_clock ? 0x140b4 : 0x18000;
 			break;
-		case 4320000:
+		case 4320000000:
 			m = vic_alternate_clock ? 0xb3 : 0xb4;
 			frac = vic_alternate_clock ? 0x1a3ee : 0;
 			break;
-		case 5940000:
+		case 5940000000:
 			m = 0xf7;
 			frac = vic_alternate_clock ? 0x8148 : 0x10000;
 			break;
@@ -1025,14 +1031,14 @@ static void meson_vclk_set(struct meson_drm *priv, unsigned int pll_base_freq,
 }
 
 void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
-		      unsigned int phy_freq, unsigned int vclk_freq,
-		      unsigned int venc_freq, unsigned int dac_freq,
+		      unsigned long long phy_freq, unsigned long long vclk_freq,
+		      unsigned long long venc_freq, unsigned long long dac_freq,
 		      bool hdmi_use_enci)
 {
 	bool vic_alternate_clock = false;
-	unsigned int freq;
-	unsigned int hdmi_tx_div;
-	unsigned int venc_div;
+	unsigned long long freq;
+	unsigned long long hdmi_tx_div;
+	unsigned long long venc_div;
 
 	if (target == MESON_VCLK_TARGET_CVBS) {
 		meson_venci_cvbs_clock_config(priv);
@@ -1052,27 +1058,27 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 		return;
 	}
 
-	hdmi_tx_div = vclk_freq / dac_freq;
+	hdmi_tx_div = DIV_ROUND_DOWN_ULL(vclk_freq, dac_freq);
 
 	if (hdmi_tx_div == 0) {
-		pr_err("Fatal Error, invalid HDMI-TX freq %d\n",
+		pr_err("Fatal Error, invalid HDMI-TX freq %lluHz\n",
 		       dac_freq);
 		return;
 	}
 
-	venc_div = vclk_freq / venc_freq;
+	venc_div = DIV_ROUND_DOWN_ULL(vclk_freq, venc_freq);
 
 	if (venc_div == 0) {
-		pr_err("Fatal Error, invalid HDMI venc freq %d\n",
+		pr_err("Fatal Error, invalid HDMI venc freq %lluHz\n",
 		       venc_freq);
 		return;
 	}
 
 	for (freq = 0 ; params[freq].pixel_freq ; ++freq) {
 		if ((phy_freq == params[freq].phy_freq ||
-		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/10)*10) &&
+		     phy_freq == PHY_FREQ_1000_1001(params[freq].phy_freq)) &&
 		    (vclk_freq == params[freq].vclk_freq ||
-		     vclk_freq == FREQ_1000_1001(params[freq].vclk_freq))) {
+		     vclk_freq == PIXEL_FREQ_1000_1001(params[freq].vclk_freq))) {
 			if (vclk_freq != params[freq].vclk_freq)
 				vic_alternate_clock = true;
 			else
@@ -1098,7 +1104,8 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 	}
 
 	if (!params[freq].pixel_freq) {
-		pr_err("Fatal Error, invalid HDMI vclk freq %d\n", vclk_freq);
+		pr_err("Fatal Error, invalid HDMI vclk freq %lluHz\n",
+		       vclk_freq);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/meson/meson_vclk.h b/drivers/gpu/drm/meson/meson_vclk.h
index 60617aaf18dd..7ac55744e574 100644
--- a/drivers/gpu/drm/meson/meson_vclk.h
+++ b/drivers/gpu/drm/meson/meson_vclk.h
@@ -20,17 +20,18 @@ enum {
 };
 
 /* 27MHz is the CVBS Pixel Clock */
-#define MESON_VCLK_CVBS			27000
+#define MESON_VCLK_CVBS			(27 * 1000 * 1000)
 
 enum drm_mode_status
-meson_vclk_dmt_supported_freq(struct meson_drm *priv, unsigned int freq);
+meson_vclk_dmt_supported_freq(struct meson_drm *priv, unsigned long long freq);
 enum drm_mode_status
-meson_vclk_vic_supported_freq(struct meson_drm *priv, unsigned int phy_freq,
-			      unsigned int vclk_freq);
+meson_vclk_vic_supported_freq(struct meson_drm *priv,
+			      unsigned long long phy_freq,
+			      unsigned long long vclk_freq);
 
 void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
-		      unsigned int phy_freq, unsigned int vclk_freq,
-		      unsigned int venc_freq, unsigned int dac_freq,
+		      unsigned long long phy_freq, unsigned long long vclk_freq,
+		      unsigned long long venc_freq, unsigned long long dac_freq,
 		      bool hdmi_use_enci);
 
 #endif /* __MESON_VCLK_H */
-- 
2.49.0


