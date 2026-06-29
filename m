Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554B0C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 12:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YhNzJtjd4g7I67fgHg1GjtzbDZpsXvz5OahsTzru97E=; b=ujoKVaI/GgdIv52EOfN2At8PxD
	IPHNc8FDfiYyT2ivc1QcUK4h8637W26Cjn8kHkLqS4n5y+0cjDO2OVdIHts5ROxVF+3iNtC0Mr61A
	45I1NvsUY92mRWUkiOI+oC7xwoXrlwmisaDxqK7SZj6K9GfmQp3AXcc1gSG63ubNxcNzjTruL0BMI
	vtQFwhIPqCgwCe6XxWiIj3iob+SXPKRhrajy49T3e6X1dP+Uh8eNWQw2vrkGT2DwDV2451pQrC49j
	eeV8ZTz3I1jjVyHryfrNIdO12phQFzVrqsdQ/YQU/pUT9lkhBjOhDKpIQU84KO8v3RFQQVH1cnz22
	pbpjf+dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBJu-0000000EaiG-45h1;
	Mon, 29 Jun 2026 12:42:38 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBJs-0000000Eagd-3GfK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:42:38 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493a285ff0cso7767915e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 05:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782736955; x=1783341755; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YhNzJtjd4g7I67fgHg1GjtzbDZpsXvz5OahsTzru97E=;
        b=PzDMskneSebOk4edMeS8N1f7NH+zmCPbf8j5Hw91IiNOBCzEnuGdRIEKpvglLDCc9b
         PM7LTHkRoEcqfqzrjXPuNpxoqZvgSAGDw80t9UX+60hbQF+Dsy614KCL7i4yMzOiLaGT
         gne1CmHwZ/DOxJzjG9y6dERZYTxKSAoMsGggUE7SDfbGIogTQk4G/o/UBi2jBsXCiplj
         XpJusI2kMuuj2KbbhkASPbdy6cJ1EFQh8YNRCrXcuygMCunVwkYVpg4bdTsDGgM+0Ajp
         8fPCeQKfcst3QeEApRI+g6zxhbQXy20g9VyJLwfKL9tCqdEdlnhzDJdp+r32Y+UHZzq8
         5jFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736955; x=1783341755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YhNzJtjd4g7I67fgHg1GjtzbDZpsXvz5OahsTzru97E=;
        b=IBR+QHqthse4exXMBhlyxhbD8733zKpo1Xl6AXu8MOOqWVKwPvkmNW/Lb+9FrjneGl
         qM5xw09WWD0Deb6csqYttvvHpOGPYsxlq41XM6YlZI+R1JegN9wPNzvXfgaw87+nfSMu
         EjjKMNjv9YnOYE7TLPrga3nUC+JqOMuT3WU1qw437+CjF7jcgXkbl0XvtdyQjn4s4k0x
         o22ECQQkHwX6hhY2flzoLL/4SmwTPoqq5xxKL8mBREqUIM2MuTgpMjciSaxan+CUwnmS
         SDAlZDsc+JNOL9yll4TwTfn5G4YJiHTrwFhDyk6CyC6iMQb1X1614+R1yY2PWCLJsVba
         A0Jw==
X-Forwarded-Encrypted: i=1; AFNElJ/GfHQ7UEcNuwiPYoy3yKMCFHebbJSY3wE1BLHTXnX8784IL0AAq96gWYZrT1ZIUmc5b3/ND1peILs+xTtSnTuE@lists.infradead.org
X-Gm-Message-State: AOJu0YzVZQhlkZZrJcjS8+0MNTeY/wvGITVQ/+dGlNqDQuC5V5sletV7
	T+Nd3dgE5hVwoS4hyioWQkaW0JcOYI1RuWfGg/v30FAnszcQbrzO8JRIg0mfMitne0Q=
X-Gm-Gg: AfdE7cmkqK5ttN3f8W37GGuxBjeGSjNMGtW6LAbmUNKvU4+5bOiNBd4q1WBC2u/L9p7
	P4jThNa0m/uMfZQNbSxL57DxshiyJcVn9Jq3/hb5kKNwFKVLMTdYh5DnRFbTRpp4n5Ri0fTR3Tv
	pLFW0N6hoQYjOqBpVfmrtwD5Z1HuK7Ud6uA54FNQsL+JyLteAv2yO8uiMhv8K/WgZ117/Md4Qxo
	batDwswiKGP2KJ3V/Po3B0HQvyoHrhmw7z0k1wSX2Ylano+U/OYdRKpj+OtV8zaej05uqr6bucj
	9vzsXUglh9M5XN4dLt27JdpNiblGIYCRM7PdSE6F/qCLLtv16pPaUUflYgWNDBLxijYEXkSkt0K
	7DrW5sND8H0NLTn3FN3dQopqXqYKk1o1HcPWzSEUl4SDz++ZCMGLASshL46tSPs/mlqCcHvRFom
	o0a7qusf6A448=
X-Received: by 2002:a05:600c:5487:b0:493:a623:d090 with SMTP id 5b1f17b1804b1-493a623d54emr88606515e9.10.1782736954582;
        Mon, 29 Jun 2026 05:42:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46f8d6f10absm43899161f8f.5.2026.06.29.05.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 29 Jun 2026 14:42:07 +0200
Subject: [PATCH v2 3/6] clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC
 calibration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-a733-rtc-v2-3-7b72112784f8@baylibre.com>
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
In-Reply-To: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3514; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=qw1svrvYiRbA39e1tTAaC53/r39CysR7OZmJk6EA0P8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqQmguZlIuTKrBwsDM7sE3NJOiNO0633kiU5jvw
 iqmqtZQIPGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakJoLgAKCRDm/A8cN/La
 hVowEACbP1RgJeS6oBE7ZfdUCvyvRI5L1vmoVseCOL6b9LQ+Tk6FNRtcrw63NqYvazVySfNE3L9
 IElyTcJyOiet2Y//r9bS9tHvlsPRAGsGNudc47AIrhEB0xj+NWaA7vOy7+vB6P7yF+HmmAJZDPP
 Qj6m5ooIyFzyPpORnjN9fKeC43a3DDed2F6wPGCng3GkNO6SWNfMYkCHSdi9oXpIw6Xbz1V6Ckg
 7d8XtcOzdu4XAv5QMghkEuwjxLgD8iMEgLUx7R01RE0NVn2h+yHKOmGovBWFrKG6+yToDxHiY+u
 Ly6xRyt0rAYmtFCymRKEURq5j13T5FBOWS75ZjtoIsbdiEnsd6h+wuAm43sHNCIzkFUlW3Rvic7
 i4xiS6fnlrKm6oPE46TR4QHptzGgAEPuuIyE2b7RwW6WI3vEVXl4DBa1B1cZ+dFvgp7Dy8mtq2a
 VIrHKq/a4KDYOpRpMioC8BaVoRTCtpIlMbOGxTuAg//xyLVA8xVJZ3x3bOUigiNdkfxUE4zjbDG
 gOUNewajibt80USpU8Dd42aX3AoTHHAwErV8QOhBA67pf5spWQYZ/IH9NymwqWqpvk2ftCX+pfF
 hBZqiqDzoq2+utsG0Xt7/d9OH41U1qohcK6T/VeSRdyGSTABkFfpgEBxgTL33d/TXiloHWohvfl
 Wn+LMvsA0AiuzZw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_054236_854566_8F629D2C 
X-CRM114-Status: GOOD (  18.73  )
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

From: Junhui Liu <junhui.liu@pigmoral.tech>

The sun6i-rtc CCU driver currently uses a global static variable to
denote whether calibration is supported, which makes IOSC operations
tightly coupled to this file.

Convert this into a feature bit to decouple the logic. This allows the
IOSC clock code to be moved into a shared module for reuse by other SoCs.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
Signed-off-by: Jerome Brunet<jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 17 +++++++++--------
 drivers/clk/sunxi-ng/ccu_common.h    |  1 +
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index 0f528bfaed00..b24c8b196e66 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -52,8 +52,6 @@ struct sun6i_rtc_match_data {
 	u8				osc32k_fanout_nparents;
 };
 
-static bool have_iosc_calibration;
-
 static int ccu_iosc_enable(struct clk_hw *hw)
 {
 	struct ccu_common *cm = hw_to_ccu_common(hw);
@@ -80,7 +78,7 @@ static unsigned long ccu_iosc_recalc_rate(struct clk_hw *hw,
 {
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		u32 reg = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/*
@@ -119,7 +117,7 @@ static int ccu_iosc_32k_prepare(struct clk_hw *hw)
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (!have_iosc_calibration)
+	if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
 		return 0;
 
 	val = readl(cm->base + IOSC_CLK_CALI_REG);
@@ -134,7 +132,7 @@ static void ccu_iosc_32k_unprepare(struct clk_hw *hw)
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (!have_iosc_calibration)
+	if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
 		return;
 
 	val = readl(cm->base + IOSC_CLK_CALI_REG);
@@ -148,7 +146,7 @@ static unsigned long ccu_iosc_32k_recalc_rate(struct clk_hw *hw,
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		val = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/* Assume the calibrated 32k clock is accurate. */
@@ -167,7 +165,7 @@ static unsigned long ccu_iosc_32k_recalc_accuracy(struct clk_hw *hw,
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		val = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/* Assume the calibrated 32k clock is accurate. */
@@ -358,7 +356,10 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 		return 0;
 
 	data = match->data;
-	have_iosc_calibration = data->have_iosc_calibration;
+	if (data->have_iosc_calibration) {
+		iosc_clk.features |= CCU_FEATURE_IOSC_CALIBRATION;
+		iosc_32k_clk.features |= CCU_FEATURE_IOSC_CALIBRATION;
+	}
 
 	if (!data->have_ext_osc32k) {
 		/* ext-osc32k-gate is an orphan, so do not register it. */
diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu_common.h
index bbec283b9d99..d9dc24ad5503 100644
--- a/drivers/clk/sunxi-ng/ccu_common.h
+++ b/drivers/clk/sunxi-ng/ccu_common.h
@@ -21,6 +21,7 @@
 #define CCU_FEATURE_CLOSEST_RATE	BIT(9)
 #define CCU_FEATURE_DUAL_DIV		BIT(10)
 #define CCU_FEATURE_UPDATE_BIT		BIT(11)
+#define CCU_FEATURE_IOSC_CALIBRATION	BIT(12)
 
 /* MMC timing mode switch bit */
 #define CCU_MMC_NEW_TIMING_MODE		BIT(30)

-- 
2.47.3


