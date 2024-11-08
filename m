Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2D3D64084
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 20:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NI6P3TUYrkoyoEc/tfD3lrh0bzVj5BXDH9t+6MLHSl4=; b=02ZXi2FJT0+/9BZv7ydpyqTR8+
	QAfOyGz5njwK9aUJD6QmNB1OOpstRwHU6sK7OvGs019N7gOKf3NoK7okEcPR2iD4qINa+dY13KSr5
	Z1RuAcmH8WhJpZBZrN8bcD4NWDA/KrQ9T2vQXB2d8IrBDSE5p2iVff0jKT6a6PDR5HUIOnQfr6frq
	P36jGNDL5l+ZI+fDq4PchpR880Qbz5wGnpRUrmLAMZGTGZnsBtWStddNyCmIgW6WIPVW68eAdYHkr
	LLcXn9iUrBStnAC6238dNYIvpGEYhxmwjaMI//zF6JW8Nis05pBgRH86LudbZuc/F3Zl0cXMt21jf
	OTErH0dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9VJn-0000000BqXp-0Ztr;
	Fri, 08 Nov 2024 20:10:55 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9VI1-0000000BqKM-2Z7C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 20:09:06 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-460963d6233so15435141cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 12:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731096544; x=1731701344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NI6P3TUYrkoyoEc/tfD3lrh0bzVj5BXDH9t+6MLHSl4=;
        b=J4d33qoajFmHSiMAzvDN+f9WXSr3NLSGHJ7OxLuGfGgFN9dCjnmWA/BHxhVNHpVRyS
         ApFyCqV3BuuTNnZ0304UNPlImnekRvX9Wjlh4FnIE+5MWlFnnOuzvSRLPTAbw3wZU01P
         5peJZUvomCEUAPz9kS11sc9v9bD6DiDsQIaPPesbkpMpHqkMlJ+sMHhzaVjEs1CRwWht
         W4XASy7uxP3L6VQAtkLq6DD5a5qx8iLjFPN/Kh3gmIFcASEdd+EOxl7KtvRCAeiMJMfq
         XiCwVotQzI7r9w8+sRjSKn5TZpB3KOumJlmgCyaRcNcXTshCadSJhWv+hidY+46Tih80
         lxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731096544; x=1731701344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NI6P3TUYrkoyoEc/tfD3lrh0bzVj5BXDH9t+6MLHSl4=;
        b=YbjbTFsbwbWMChhFLbx3KueXdCXsWV8/jTgx3SHF92/FNchlizyRPsA5kWvkv6vzlz
         vN1IGxxxGO5dtjdPpq7I2zVtlUZYxfbwfIxcEIAN26Ah1jehW0tooTLvbooazW2O/6Jx
         ZdVRyYaaOyTGsJ1Lbw/Hf1AVKt1Kf/d2Vgffm++gSx43ZjfG2C0+Q0cINVwmSLr2vPrn
         zDKKUcrrgkY0rBNSZEw4V2I3jFOaZoVvxS7hBcVAdPayWoOLaEYMWr0OROLqMzvpaXA/
         MEBjPkZxp8UqYBSHHsMXOfBAJVAox2whZAsDlIf5dIiusT0tuUBXMmX3unNdKedgdl9j
         Gt7A==
X-Forwarded-Encrypted: i=1; AJvYcCV8GhqRig0D5o4U/wTShQywXAqZoJ408dKVluIK/vEbP77QfyMFNeXyRL/odsO+HXh3fugiyBek5AweQ+Dc0/QC@lists.infradead.org
X-Gm-Message-State: AOJu0YxHfpsOjclBkb/5hY3ZhoQ+ykVSpeIqwyiR2wX5ltvGiq0Y+if5
	6bYZ76pjGuxmbilHipzuF5REBjMmtukI/Jxw1e1n+8nHIBR5+1iB
X-Google-Smtp-Source: AGHT+IE82TZXwTUiZGRTAp/L5/S3ZlnP1aQ28alBcXNmIEDpLw5fXICy0ok9tKG1jh+N+mTRfrzA/A==
X-Received: by 2002:ac8:5a91:0:b0:458:23fc:f345 with SMTP id d75a77b69052e-463093ecfdamr48531501cf.38.1731096544010;
        Fri, 08 Nov 2024 12:09:04 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ff47c162sm24151271cf.53.2024.11.08.12.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 12:09:03 -0800 (PST)
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
Subject: [PATCH v2] iio: trigger: stm32-timer-trigger: Add check for clk_enable()
Date: Fri,  8 Nov 2024 20:09:00 +0000
Message-Id: <20241108200900.44727-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_120905_676604_56608FAC 
X-CRM114-Status: GOOD (  14.85  )
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

v1 -> v2:

1. Remove unsuitable dev_err_probe().
---
 drivers/iio/trigger/stm32-timer-trigger.c | 32 ++++++++++++++++++-----
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
index 0684329956d9..e1e077122f73 100644
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
@@ -153,7 +153,11 @@ static int stm32_timer_start(struct stm32_timer_trigger *priv,
 	mutex_lock(&priv->lock);
 	if (!priv->enabled) {
 		priv->enabled = true;
-		clk_enable(priv->clk);
+		ret = clk_enable(priv->clk);
+		if (ret) {
+			mutex_unlock(&priv->lock);
+			return ret;
+		}
 	}
 
 	regmap_write(priv->regmap, TIM_PSC, prescaler);
@@ -307,7 +311,7 @@ static ssize_t stm32_tt_store_master_mode(struct device *dev,
 	struct stm32_timer_trigger *priv = dev_get_drvdata(dev);
 	struct iio_trigger *trig = to_iio_trigger(dev);
 	u32 mask, shift, master_mode_max;
-	int i;
+	int i, ret;
 
 	if (stm32_timer_is_trgo2_name(trig->name)) {
 		mask = TIM_CR2_MMS2;
@@ -326,7 +330,11 @@ static ssize_t stm32_tt_store_master_mode(struct device *dev,
 			if (!priv->enabled) {
 				/* Clock should be enabled first */
 				priv->enabled = true;
-				clk_enable(priv->clk);
+				ret = clk_enable(priv->clk);
+				if (ret) {
+					mutex_unlock(&priv->lock);
+					return ret;
+				}
 			}
 			regmap_update_bits(priv->regmap, TIM_CR2, mask,
 					   i << shift);
@@ -482,6 +490,7 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
 				   int val, int val2, long mask)
 {
 	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
+	int ret;
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
@@ -496,7 +505,11 @@ static int stm32_counter_write_raw(struct iio_dev *indio_dev,
 		if (val) {
 			if (!priv->enabled) {
 				priv->enabled = true;
-				clk_enable(priv->clk);
+				ret = clk_enable(priv->clk);
+				if (ret) {
+					mutex_unlock(&priv->lock);
+					return ret;
+				}
 			}
 			regmap_set_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN);
 		} else {
@@ -601,7 +614,7 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
 				 unsigned int mode)
 {
 	struct stm32_timer_trigger *priv = iio_priv(indio_dev);
-	int sms = stm32_enable_mode2sms(mode);
+	int sms = stm32_enable_mode2sms(mode), ret;
 
 	if (sms < 0)
 		return sms;
@@ -611,7 +624,12 @@ static int stm32_set_enable_mode(struct iio_dev *indio_dev,
 	 */
 	mutex_lock(&priv->lock);
 	if (sms == 6 && !priv->enabled) {
-		clk_enable(priv->clk);
+		ret = clk_enable(priv->clk);
+		if (ret) {
+			mutex_unlock(&priv->lock);
+			return ret;
+		}
+
 		priv->enabled = true;
 	}
 	mutex_unlock(&priv->lock);
-- 
2.25.1


