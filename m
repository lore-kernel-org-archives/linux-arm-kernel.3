Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2529D33992
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 14:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYRnEk36IG62nZFzfPUk6ctg8BAgE9bbIy4meLjMgzI=; b=RIIS+rQA3/dNHyJi9K3iFaE+A/
	iOb/jDM7SHV6W3N56s+9LIsU9mbcaprj4O+yxV/GK3VdaJ/WVxWhY6RGeGg8N6mhWOwWbkm+0lhzK
	EXz1sjPHn0ci8AHBo0wWBBfdaNLArOxL0iQ4WGNXtUuV2CJG6OpJX1tkW/Arz5Fd6fIC1UPJiSeFO
	X7MjqGtvEZBOLxj8R4Y8ozOAQsIIpRevT0Ynq3wWVz9BPMpPY3t/ZJYQZiuCktOgnFnVEPig5Qb8s
	XYIl+kmyKNrYfD2g0sTqsRIXyH4LYGP8ZHV+90wUiwB+otjmEgRGXzT6G3vRZdIVAfl4u0El3QRNa
	YQumjWMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5R4x-0000000BCIZ-129d;
	Mon, 28 Oct 2024 14:50:47 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QdD-0000000B6C6-068p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:22:08 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id 303D24C772;
	Mon, 28 Oct 2024 14:22:05 +0000 (UTC)
From: Aren Moynihan <aren@peacevolution.org>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Aren Moynihan <aren@peacevolution.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ondrej Jirman <megi@xff.cz>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Dragan Simic <dsimic@manjaro.org>,
	phone-devel@vger.kernel.org
Subject: [PATCH v3 4/6] iio: light: stk3310: use dev_err_probe where possible
Date: Mon, 28 Oct 2024 10:19:58 -0400
Message-ID: <20241028142000.1058149-5-aren@peacevolution.org>
In-Reply-To: <20241028142000.1058149-1-aren@peacevolution.org>
References: <20241028142000.1058149-1-aren@peacevolution.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
X-Spamd-Bar: +++
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1730125326;
	h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
	bh=BYRnEk36IG62nZFzfPUk6ctg8BAgE9bbIy4meLjMgzI=;
	b=cqf1pXMjukY8Zv46PsYKFeV55lZhBqM38mH3p3E4cmvuH9UV6mTtFWKG3tCX4bitZ0DpkP
	pJEptKQFJXJIWJd9qgHzxkrmJqnaKg3g6B7eBrEGf+yj19ePMOkBzrdPjo88UYI3SxqAYG
	8NcgYXvHDVm6ZbRJW5Z5M9R3nisONzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_072207_213536_ED8F1C69 
X-CRM114-Status: GOOD (  11.76  )
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

Using dev_err_probe instead of dev_err and return makes the errors
easier to understand by including the error name, and saves a little
code.

Signed-off-by: Aren Moynihan <aren@peacevolution.org>
---

Notes:
    Added in v2

 drivers/iio/light/stk3310.c | 47 ++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
index f02b4d20c282..968a2cc59d09 100644
--- a/drivers/iio/light/stk3310.c
+++ b/drivers/iio/light/stk3310.c
@@ -63,10 +63,10 @@
 		data->reg_##name =					    \
 			devm_regmap_field_alloc(&client->dev, regmap,	    \
 				stk3310_reg_field_##name);		    \
-		if (IS_ERR(data->reg_##name)) {				    \
-			dev_err(&client->dev, "reg field alloc failed.\n"); \
-			return PTR_ERR(data->reg_##name);		    \
-		}							    \
+		if (IS_ERR(data->reg_##name))				    \
+			return dev_err_probe(&client->dev,		    \
+				PTR_ERR(data->reg_##name),		    \
+				"reg field alloc failed.\n");		    \
 	} while (0)
 
 static const struct reg_field stk3310_reg_field_state =
@@ -516,10 +516,8 @@ static int stk3310_init(struct iio_dev *indio_dev)
 
 	state = STK3310_STATE_EN_ALS | STK3310_STATE_EN_PS;
 	ret = stk3310_set_state(data, state);
-	if (ret < 0) {
-		dev_err(&client->dev, "failed to enable sensor");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret, "failed to enable sensor\n");
 
 	ret = devm_add_action_or_reset(&client->dev, stk3310_set_state_disable, data);
 	if (ret)
@@ -529,9 +527,10 @@ static int stk3310_init(struct iio_dev *indio_dev)
 	/* Enable PS interrupts */
 	ret = regmap_field_write(data->reg_int_ps, STK3310_PSINT_EN);
 	if (ret < 0)
-		dev_err(&client->dev, "failed to enable interrupts!\n");
+		return dev_err_probe(&client->dev, ret,
+				     "failed to enable interrupts!\n");
 
-	return ret;
+	return 0;
 }
 
 static bool stk3310_is_volatile_reg(struct device *dev, unsigned int reg)
@@ -564,10 +563,10 @@ static int stk3310_regmap_init(struct stk3310_data *data)
 
 	client = data->client;
 	regmap = devm_regmap_init_i2c(client, &stk3310_regmap_config);
-	if (IS_ERR(regmap)) {
-		dev_err(&client->dev, "regmap initialization failed.\n");
-		return PTR_ERR(regmap);
-	}
+	if (IS_ERR(regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(regmap),
+				     "regmap initialization failed.\n");
+
 	data->regmap = regmap;
 
 	STK3310_REGFIELD(state);
@@ -656,10 +655,8 @@ static int stk3310_probe(struct i2c_client *client)
 	struct stk3310_data *data;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed!\n");
-		return -ENOMEM;
-	}
+	if (!indio_dev)
+		return dev_err_probe(&client->dev, -ENOMEM, "iio allocation failed!\n");
 
 	data = iio_priv(indio_dev);
 	data->client = client;
@@ -708,18 +705,14 @@ static int stk3310_probe(struct i2c_client *client)
 						IRQF_TRIGGER_FALLING |
 						IRQF_ONESHOT,
 						STK3310_EVENT, indio_dev);
-		if (ret < 0) {
-			dev_err(&client->dev, "request irq %d failed\n",
-				client->irq);
-			return ret;
-		}
+		if (ret < 0)
+			return dev_err_probe(&client->dev, ret, "request irq %d failed\n",
+					     client->irq);
 	}
 
 	ret = devm_iio_device_register(&client->dev, indio_dev);
-	if (ret < 0) {
-		dev_err(&client->dev, "device_register failed\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret, "device_register failed\n");
 
 	return 0;
 }
-- 
2.47.0


