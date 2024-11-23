Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD290E6688B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 22:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sTXm56p8RBq1M4ykDPiGEs2Y+aiYwh8JuLxWApDmdM4=; b=Re+AweO0GUIpDbC8pgXTiWibny
	cOhymUmaT4wvqPo9JXp4d20J2Lz2UEdzkqvcIVVgmIux/tDoKJ7NC3aGE/1Y22gotQSK/np6Ql3a6
	IEKcMi4Dc+626l6RhhReQgOG5qK+RJ3Z4vcclSXk2iQNSI7J1cPvS0Ej7VMOEdgTlsAMDMMC2wGAj
	vmEDi8agJH+1G6t2cOvxHqRQ1fxe3FT0cNVKpZLNLCrb0gO9ot2tLt66Mda87jvo00JpGURkwp2zX
	b+iP2UYmVbrHuUieVHasNkW0shkDHU0g8bSHrwgqzPao04RFunrAyQGCmKdVcMgBzBstccfhMsgJ/
	ikYmseXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEyDM-00000004wbd-3F9N;
	Sat, 23 Nov 2024 22:02:52 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEyCP-00000004wWA-266M
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 22:01:54 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6d41c87aec0so26211266d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Nov 2024 14:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732399312; x=1733004112; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sTXm56p8RBq1M4ykDPiGEs2Y+aiYwh8JuLxWApDmdM4=;
        b=XEqRmlmbL2FjUTJJk3+9z+gxvVU0XnbU6RtG+EbcragkhpdYb3oSnMypUkOXnKu5IM
         MFtX3diOhihNB+OLjrxG6jn07CzUsqQLFC4mp0f7iMEh9qRdI98btPT4i/IqAVuNzQE8
         sdOKn8Bwqv69Q2MrGBLszV/ChfjcVMG3c2gJfofXBF9pLSJehbFnfGoIWXxbSVTu+zUM
         GEAqhQQyrrK51kx5vh8Z2XHTPfBBIvUvi9JJsDc/MudjIV0lG2nVkBV4+lI7i1ExZD+Q
         bRhmoVw3Z18jC3l0eQGLu/WZcNktW0vPq1AmRfn/sn4w8wYlEA8Hzq0ssIEOSOH+0BjX
         f4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732399312; x=1733004112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTXm56p8RBq1M4ykDPiGEs2Y+aiYwh8JuLxWApDmdM4=;
        b=JTggdPJxIG1c6BVdU2sxxrGc0rW2PmgrDBs88alE0p8PpIEKxYOd1w4cXOTu30igl6
         QLNkU0nFYd2d6PWpha2GHxCQxgvFkKyLJY45RcqCrsmFcYlGY3lLcvyBk486dus5vpfo
         +YAmXf7yjdNTvRTiIdQTWfG3UFizRz77taPlx0ekE7bSgmZApgxk6iWIEkCybdSEbGW+
         sBa/6EsWQNFpY+ljxPhSQfCJ/P+Nj5MaB3xcOYZIULbsRnGS5DN3wR2ZRog1un9ZV7gS
         VXT6kjRkH6Up+Ec5yqQ13xn8GVj+r/yCH1YPm8WnKbZNWfQ4ZzBk/WMbB9zSbXASb6cJ
         DBWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH5VLPf+fooIBx0auJAFNtLHA0tRMONnnAFlOL9fm3Xy1jaf4ro1X90LDuORAUlCUCgDnWGAWsJmLBR8klyb0h@lists.infradead.org
X-Gm-Message-State: AOJu0YyJhLrrA94vrFVip7erUvt4ueLhGMw779hH6U5iMIM3heTyMhjL
	F464KwXYAv41tHVteytRvQcNIsWjWYsm8MBYFscKRIu0nUhDtwct
X-Gm-Gg: ASbGnct38fXWxmPpcJPS8JHQNVrYZwgebH33KQKkVHrXtJ49X0qkb7leIYXRVW8FGLv
	0+Dm58ZjoDPEl027ZkWB/WK9X0o23pCx5Lwfr3+FCsT/JaK/R+gBXivNqLSjKwq1UrL/z1ypBgI
	WXyUEA3ld/+It7rAyXb56//IJzTaUekZ0ghNGHkxoDD/XolQ1NovLAexJ2m7A5PLN3jFUj2PV92
	E96czYHQo/xYBcYruBzkd5lMZvO2LZe9h9fDZEaXLF0c4lNBeeQVDct+ybnNIg7asPKYH/a
X-Google-Smtp-Source: AGHT+IHwaDfV1oVZjshMQqgput4KO/RhIrIMFQsBtq4zu1BHrnOtGbjeB/uPQuJ2P/Cp8Ar7T0Qjug==
X-Received: by 2002:a05:6214:19ef:b0:6d4:20fa:83f1 with SMTP id 6a1803df08f44-6d45134d114mr137061356d6.37.1732399312180;
        Sat, 23 Nov 2024 14:01:52 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d451b4a0a5sm25789426d6.106.2024.11.23.14.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 14:01:51 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	lars@metafoo.de,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	u.kleine-koenig@baylibre.com,
	tgamblin@baylibre.com,
	fabrice.gasnier@st.com,
	benjamin.gaignard@linaro.org,
	lee@kernel.org,
	linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH v5] iio: trigger: stm32-timer-trigger: Add check for clk_enable()
Date: Sat, 23 Nov 2024 22:01:49 +0000
Message-Id: <20241123220149.30655-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_140153_892799_00585013 
X-CRM114-Status: GOOD (  18.00  )
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

Add check for the return value of clk_enable() in order to catch the
potential exception.

Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v4 -> v5:

1. Add a default in the switch.

v3 -> v4:

1. Place braces around the case body.

v2 -> v3:

1. Use guard() to simplify the resulting code.

v1 -> v2:

1. Remove unsuitable dev_err_probe().
---
 drivers/iio/trigger/stm32-timer-trigger.c | 49 ++++++++++++++---------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
index 0684329956d9..67528ec7d0a5 100644
--- a/drivers/iio/trigger/stm32-timer-trigger.c
+++ b/drivers/iio/trigger/stm32-timer-trigger.c
@@ -119,7 +119,7 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
 			     unsigned int frequency)
 {
 	unsigned long long prd, div;
-	int prescaler = 0;
+	int prescaler = 0, ret;
 	u32 ccer;
 
 	/* Period and prescaler values depends of clock rate */
@@ -150,10 +150,12 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
 	if (ccer & TIM_CCER_CCXE)
 		return -EBUSY;
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	if (!priv->enabled) {
 		priv->enabled = true;
-		clk_enable(priv->clk);
+		ret = clk_enable(priv->clk);
+		if (ret)
+			return ret;
 	}
 
 	regmap_write(priv->regmap, TIM_PSC, prescaler);
@@ -173,7 +175,6 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
 
 	/* Enable controller */
 	regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
-	mutex_unlock(&priv->lock);
 
 	return 0;
 }
@@ -307,7 +308,7 @@ static ssize_t stm32_tt_store_master_mode(struct device *dev,
 	struct stm32_timer_trigger *priv = dev_get_drvdata(dev);
 	struct iio_trigger *trig = to_iio_trigger(dev);
 	u32 mask, shift, master_mode_max;
-	int i;
+	int i, ret;
 
 	if (stm32_timer_is_trgo2_name(trig->name)) {
 		mask = TIM_CR2_MMS2;
@@ -322,15 +323,16 @@ static ssize_t stm32_tt_store_master_mode(struct device *dev,
 	for (i = 0; i <= master_mode_max; i++) {
 		if (!strncmp(master_mode_table[i], buf,
 			     strlen(master_mode_table[i]))) {
-			mutex_lock(&priv->lock);
+			guard(mutex)(&priv->lock);
 			if (!priv->enabled) {
 				/* Clock should be enabled first */
 				priv->enabled = true;
-				clk_enable(priv->clk);
+				ret = clk_enable(priv->clk);
+				if (ret)
+					return ret;
 			}
 			regmap_update_bits(priv->regmap, TIM_CR2, mask,
 					   i << shift);
-			mutex_unlock(&priv->lock);
 			return len;
 		}
 	}
@@ -482,6 +484,7 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
 				   int val, int val2, long mask)
 {
 	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
+	int ret;
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
@@ -491,12 +494,14 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
 		/* fixed scale */
 		return -EINVAL;
 
-	case IIO_CHAN_INFO_ENABLE:
-		mutex_lock(&priv->lock);
+	case IIO_CHAN_INFO_ENABLE: {
+		guard(mutex)(&priv->lock);
 		if (val) {
 			if (!priv->enabled) {
 				priv->enabled = true;
-				clk_enable(priv->clk);
+				ret = clk_enable(priv->clk);
+				if (ret)
+					return ret;
 			}
 			regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
 		} else {
@@ -506,11 +511,12 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
 				clk_disable(priv->clk);
 			}
 		}
-		mutex_unlock(&priv->lock);
+
 		return 0;
 	}
-
-	return -EINVAL;
+	default:
+		return -EINVAL;
+	}
 }
 
 static int stm32_counter_validate_trigger(struct iio_dev *indio_dev,
@@ -601,7 +607,7 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
 				 unsigned int mode)
 {
 	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
-	int sms = stm32_enable_mode2sms(mode);
+	int sms = stm32_enable_mode2sms(mode), ret;
 
 	if (sms < 0)
 		return sms;
@@ -609,12 +615,15 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
 	 * Triggered mode sets CEN bit automatically by hardware. So, first
 	 * enable counter clock, so it can use it. Keeps it in sync with CEN.
 	 */
-	mutex_lock(&priv->lock);
-	if (sms == 6 && !priv->enabled) {
-		clk_enable(priv->clk);
-		priv->enabled = true;
+	scoped_guard(mutex, &priv->lock) {
+		if (sms == 6 && !priv->enabled) {
+			ret = clk_enable(priv->clk);
+			if (ret)
+				return ret;
+
+			priv->enabled = true;
+		}
 	}
-	mutex_unlock(&priv->lock);
 
 	regmap_update_bits(priv->regmap, TIM_SMCR, TIM_SMCR_SMS, sms);
 
-- 
2.25.1


