Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22F0D3ABF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 22:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xKJrUNekn+fLC6kP93590FUWGJ6YXqoOuHlp1oOaerI=; b=I5FDesGMMic/rb5wDMLbLO+dWZ
	uOvzW3yWqib1gXTESf2CumVJDW0bVHreUDws2Gszm8uqSqFTODdLU3IMMVLwQIFjdKgYDDBL/TRrg
	zJRbff3IFe6MpXyG8RdCrAs/Gv7TOLUk06oWMYZETldUnIg30c/kl5M7IwpzIO3Pqqq9sXoPLDqNo
	ASd2vCRsdaKvwMXfJ+50+UG6kEJ61g+EpZ7+2qo7ih/6M5bHg6Y/v1taTqJzvwdoFQaT6Sv+vBmaM
	keyedF044+07veIMo3PWH1YALMiGbwHLw26pr1F15N4y/qBtOsJltLhqjO9PIWmIYb+fgWhVlVJ/N
	+URoUvLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcqI-00000001VBh-2JKF;
	Mon, 11 Nov 2024 22:25:06 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcoU-00000001V0O-2RJ7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 22:23:15 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7b148919e82so341531885a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 14:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731363793; x=1731968593; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xKJrUNekn+fLC6kP93590FUWGJ6YXqoOuHlp1oOaerI=;
        b=Yq2lL+RIhDXrrap7173dZGzM5h/1dy5JAY1JAhdWRPvHvn0qOw+ruEbbR+pUTHYudm
         t+HuhF/WWEv+Q8N7mVe+KKlozfg2pDf+Zf/UBxoRxIsKG9+ZMU33LBsb+xPDoXGxiNsR
         mQppzlj162sqIfzcln7gqNzSNTPcEFhXT0MmkJKx631pRRfcJ9uHTq3L4iVSnj6Kstux
         KtnLgKpi2fYC22eZ/xTirb2yxNWR4xfnrjdIJt+gAufjx+lUXX8DU/vW453g7g2Nf6bd
         pUV3ik/eG4lfL2JG1xaFFSS9BzKa3dWlyPxATW5udHQHPigdNYZ0IyugN2UJHqHAzcjH
         uYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731363793; x=1731968593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKJrUNekn+fLC6kP93590FUWGJ6YXqoOuHlp1oOaerI=;
        b=SawhAleAGypjbTvL9zbgbvZVZcvb0E5x0ovbyWY6rAb1cnYI2jAB2/l10c+neo5Vo8
         7g1uZeAmVx3vbmAMgc9ebC+aJX35DIz+aWqwWpXS+JfvN3hMvYAD6SuZR7YQX1OBU/7N
         oxNisGhDfeBJjRuYKhIJ6uybKb1NK5/+JWpYjh4DKuRP0dm9Y37Hmq/7pg+HoxCaouPN
         cCAcbU0W4IQuJVK+1BBB25tDJA6AS3F3xSBpWRY5loEEtqTUdkyl2mwcPZehRzT1ab04
         vgNyJE26E9/OFit1NK+ZVlh3xxVJCdKUEsSCxyl+MxM70nI+vvlwqFzQCshoaj5T9Y/n
         YqfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi3ybhYG6bHmRjUfpWt8SA2WSaRB4oaomJcPnyLL2/PmQeTDK2G0I/GQK/r0mVi62lUdQSvUFXszVOgRD2qbSk@lists.infradead.org
X-Gm-Message-State: AOJu0YzSLIhubqNgN5SPiTuKBEB+Q4AZ38KzDfVoTjyQIHZfq7VXejzw
	Sn6wKhynUq0LXV2nKtDM7Ly1i0X3vu8GYlypoEr8wAyQykscXWq6
X-Google-Smtp-Source: AGHT+IGFThbZRbYxwToYYeuVu+7TuIAwrVPuAA2eieBL7N+tsgVpKFWjBEQC2tvJmKh1er5auG0BMA==
X-Received: by 2002:a05:620a:1aaa:b0:7ac:b118:a732 with SMTP id af79cd13be357-7b331dd2fb1mr2162857285a.32.1731363793253;
        Mon, 11 Nov 2024 14:23:13 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b32ac2dc06sm535599885a.12.2024.11.11.14.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 14:23:13 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: dlechner@baylibre.com
Cc: jic23@kernel.org,
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
Subject: [PATCH v4] iio: trigger: stm32-timer-trigger: Add check for clk_enable()
Date: Mon, 11 Nov 2024 22:23:10 +0000
Message-Id: <20241111222310.12339-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_142314_648264_99DD9F42 
X-CRM114-Status: GOOD (  17.46  )
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

Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v3 -> v4:

1. Place braces around the case body.

v2 -> v3:

1. Simplify code with cleanup helpers.

v1 -> v2:

1. Remove unsuitable dev_err_probe().
---
 drivers/iio/trigger/stm32-timer-trigger.c | 45 ++++++++++++++---------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
index 0684329956d9..d599d50fbb3b 100644
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
@@ -506,9 +511,10 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
 				clk_disable(priv->clk);
 			}
 		}
-		mutex_unlock(&priv->lock);
+
 		return 0;
 	}
+	}
 
 	return -EINVAL;
 }
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


