Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0752DD36113
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 19:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mlpXLUDiuAj4Ax3s/8PaCa808KyyiZFwFmndcMeabmA=; b=pASgvGLJvqYQq8RE9iu/QC2AY+
	veGyRLjJLGoXWe5ZyMimVU0NehGB79aS0IRFxod8NY7EnAjD6yX5e9j7O//8WPwelpn63t6Ynae8K
	z0OySP8VAbF1JXmDgKjO/JgpMgy1zNiijNAzCJGBj1adPVEpDtP5sVKJxbwbErStDAQW7wv7w4nzL
	jf4GjB+fggIfB7cX+KlFnZmxRHR0iS1lszZlKq4jvNyHhZm+s3U0pp1EGJ3QaYzaI10evyk5ujjRK
	++siGGOhkpP0cF6eyh/zfZoVbTak77Gyw568gNM9z8qctGNNGfFgyv4Cyqzb602K9tgcHyiYfHqty
	ZXDo4Snw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8PJZ-00000000YkK-2IwU;
	Tue, 05 Nov 2024 19:34:09 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8PHq-00000000YYj-2iMy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 19:32:23 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7b153047b29so378404485a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 11:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730835141; x=1731439941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mlpXLUDiuAj4Ax3s/8PaCa808KyyiZFwFmndcMeabmA=;
        b=YKZoGV74zTo2DgN30ZBMFrX1+VF/YLKhc/c5k3MM6O+azIxcVQ9OupxlC+pzjxG3fG
         RAzpWm5B5TYc0czSTXI+MKgBaH1rjPViTIWoRTRlYzDwFx6cts/c5psh00XURaGJxCF9
         pzkoYgjwjwh9yh9L1VxIhCJu10YVTPXPyl3t5Bzm52yRHf/aRCK0RpA/Uk/dvqXUh12L
         95GJKxb63pllZr8cyc4PZrYBp8AYZCt4UB+Jn3L4emZzJ4U6x37A2myuNcm5ZB5STOlQ
         erjazRt2T+nFjO98AGSQXRQbp8u/IqMh0GM3wzil9CI5QgaZt9cUho1vDoCIPpxiqHkE
         uB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730835141; x=1731439941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mlpXLUDiuAj4Ax3s/8PaCa808KyyiZFwFmndcMeabmA=;
        b=UO9M82i0bUntOCipJfM533VnbjvXFlCS/Vq+5x1BY67O8FeurM33442+Xw4i2gTfaa
         dCNDo8sfDKLDegjjjKoAfZGOZMeT58Fj8o9gBftdrH+f2mRxsx16OofCXxRuKkIuD3QV
         1UEUBR5IBgJ8ChEbUqCKcWK6O20B+cJgtaZtV6e5KgEmD6RERM0bNmgT9YGMp3uXc5lv
         sR8i2RnSOLHpA+KjaletjQU1zq1UNzVfIjCHJgrDf6mqSp40IoIqEEW6cVDtCxQLJ1V/
         SCfdZmDpmdgmzIr8j0NCCYLDnQUtCckkKOySn/GtCF4kYLaO+usYIxgdAoPFq0QkLvTy
         fE/A==
X-Forwarded-Encrypted: i=1; AJvYcCWNOmOo/LQduVeCd5d/kwJn7EysHP8eGf3dIk/HEj/zDb0+KIU3n3JtOa2G5Pnj4wqs2llo0vTjhKDgaDf/Lo55@lists.infradead.org
X-Gm-Message-State: AOJu0YxwSorqJQEJrmXDXfsJyNyoQ4tgMAPyFI0oGyvlJXrhjo7UCTcI
	gDvtIpvT/Cj+RAuSlXXayb/ZHuxMQqK6md9rH/VhJ5UsSb+ggrxdK97u8g==
X-Google-Smtp-Source: AGHT+IHmPYcPWfZhwOxujigyXrVRSB8kRoNxKABpVBwVCQzAOZBWznyCKjCQL89t1FiTLIwjVZF9zw==
X-Received: by 2002:a05:620a:14e:b0:7ac:ae32:286a with SMTP id af79cd13be357-7b193f041d5mr4080201485a.34.1730835141086;
        Tue, 05 Nov 2024 11:32:21 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f3a9b991sm553343285a.127.2024.11.05.11.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 11:32:20 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: jic23@kernel.org,
	lars@metafoo.de,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	u.kleine-koenig@baylibre.com,
	tgamblin@baylibre.com,
	fabrice.gasnier@st.com,
	benjamin.gaignard@linaro.org,
	lee@kernel.org
Cc: linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] iio: trigger: stm32-timer-trigger: Add check for clk_enable()
Date: Tue,  5 Nov 2024 19:32:12 +0000
Message-Id: <20241105193212.2082-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_113222_730767_8D930A7A 
X-CRM114-Status: GOOD (  14.96  )
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

Fixes: 3192ade7b6f6 ("iio: trigger: stm32-timer: enable clock when in master mode")
Fixes: 90938ca432e6 ("iio: trigger: stm32-timer: add enable attribute")
Fixes: 93fbe91b5521 ("iio: Add STM32 timer trigger driver")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/iio/trigger/stm32-timer-trigger.c | 40 +++++++++++++++++++----
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
index 0684329956d9..0d5bb808c61d 100644
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
@@ -153,7 +153,13 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
 	mutex_lock(&priv->lock);
 	if (!priv->enabled) {
 		priv->enabled = true;
-		clk_enable(priv->clk);
+		ret = clk_enable(priv->clk);
+		if (ret) {
+			mutex_unlock(&priv->lock);
+			return dev_err_probe(priv->dev, ret,
+					     "failed to enable clock: %d\n",
+					     ret);
+		}
 	}
 
 	regmap_write(priv->regmap, TIM_PSC, prescaler);
@@ -307,7 +313,7 @@ static ssize_t stm32_tt_store_master_mode(struct device *dev,
 	struct stm32_timer_trigger *priv = dev_get_drvdata(dev);
 	struct iio_trigger *trig = to_iio_trigger(dev);
 	u32 mask, shift, master_mode_max;
-	int i;
+	int i, ret;
 
 	if (stm32_timer_is_trgo2_name(trig->name)) {
 		mask = TIM_CR2_MMS2;
@@ -326,7 +332,13 @@ static ssize_t stm32_tt_store_master_mode(struct device *dev,
 			if (!priv->enabled) {
 				/* Clock should be enabled first */
 				priv->enabled = true;
-				clk_enable(priv->clk);
+				ret = clk_enable(priv->clk);
+				if (ret) {
+					mutex_unlock(&priv->lock);
+					return dev_err_probe(priv->dev, ret,
+							     "failed to enable clock: %d\n",
+							     ret);
+				}
 			}
 			regmap_update_bits(priv->regmap, TIM_CR2, mask,
 					   i << shift);
@@ -482,6 +494,7 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
 				   int val, int val2, long mask)
 {
 	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
+	int ret;
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
@@ -496,7 +509,13 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
 		if (val) {
 			if (!priv->enabled) {
 				priv->enabled = true;
-				clk_enable(priv->clk);
+				ret = clk_enable(priv->clk);
+				if (ret) {
+					mutex_unlock(&priv->lock);
+					return dev_err_probe(priv->dev, ret,
+							     "failed to enable clock: %d\n",
+							     ret);
+				}
 			}
 			regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
 		} else {
@@ -601,7 +620,7 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
 				 unsigned int mode)
 {
 	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
-	int sms = stm32_enable_mode2sms(mode);
+	int sms = stm32_enable_mode2sms(mode), ret;
 
 	if (sms < 0)
 		return sms;
@@ -611,7 +630,14 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
 	 */
 	mutex_lock(&priv->lock);
 	if (sms == 6 && !priv->enabled) {
-		clk_enable(priv->clk);
+		ret = clk_enable(priv->clk);
+		if (ret) {
+			mutex_unlock(&priv->lock);
+			return dev_err_probe(priv->dev, ret,
+					     "failed to enable clock: %d\n",
+					     ret);
+		}
+
 		priv->enabled = true;
 	}
 	mutex_unlock(&priv->lock);
-- 
2.25.1


