Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B53E67808
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 20:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOQ+icUlK1H5YL/QrrfHa7ZgZuPTLdaho4son5PhToI=; b=mKMYjrrcrqiOiJGh2t8qrfEQGE
	tGqHwMx/zV+Eu7xvnQNJvQH2hyIY6i5MdRIAlkzXDUUB/9P+fGVDoLcexLYJ01XULhUTwiTnEtzEP
	pcLam1kctdayNJhgcX1viPwtAOe0Pq9CuTitI2Hu3aSAUrYUGuqLq4P5oPkN3ZmGjYHqZL6x28JTp
	XU072A3kiO4CGWwDin/wSYhg1+rVMFIHzxRmEMcPxWhVlT3hg6ktn3gtVmC/UAcGH5UV7OgoDiMah
	diyLH3CmvzkD0DKI8QGG1ilul/nZmQbwfLeNI+X35EydpZ/z8yGOdr7AXpIzRIKR2lhIpAXs/UNo1
	+mnLNDnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7KKz-0000000AKPm-0fCk;
	Sat, 02 Nov 2024 20:03:09 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7KE9-0000000AJLm-3N30
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 19:56:07 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id 605304C847;
	Sat,  2 Nov 2024 19:56:03 +0000 (UTC)
From: Aren Moynihan <aren@peacevolution.org>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Aren Moynihan <aren@peacevolution.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>,
	Ondrej Jirman <megi@xff.cz>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Dragan Simic <dsimic@manjaro.org>,
	phone-devel@vger.kernel.org
Subject: [PATCH v4 4/6] iio: light: stk3310: use dev_err_probe where possible
Date: Sat,  2 Nov 2024 15:50:41 -0400
Message-ID: <20241102195037.3013934-11-aren@peacevolution.org>
In-Reply-To: <20241102195037.3013934-3-aren@peacevolution.org>
References: <20241102195037.3013934-3-aren@peacevolution.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
X-Spamd-Bar: +++
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1730577364;
	h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
	bh=EOQ+icUlK1H5YL/QrrfHa7ZgZuPTLdaho4son5PhToI=;
	b=ZBbr8wfwo3qQ6VZx2PM+mCKxgFgJ/XzgEIbWYqxxV53kdJtu1IBxYs/14HzjzlLCmsI4jP
	h0+CYKNKBlldsH12AbP+Fb/Fi3RtW5SWO0+akM3HX4gLAKYE1ihUITbcPR4JxGcegEhi5O
	WVHfe7SmFGbvI01CTC/SvMfZUL4D0qI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_125605_995669_CD7A0FE5 
X-CRM114-Status: GOOD (  15.81  )
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
    Changes in v4:
     - Get a struct device ahead of time so it can be passed as "dev"
       instead of "&client->dev"
    
    No changes in v3
    
    Added in v2

 drivers/iio/light/stk3310.c | 61 ++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 35 deletions(-)

diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
index f93689c61f44..c9a3f02bdd80 100644
--- a/drivers/iio/light/stk3310.c
+++ b/drivers/iio/light/stk3310.c
@@ -61,12 +61,12 @@
 #define STK3310_REGFIELD(name)						    \
 	do {								    \
 		data->reg_##name =					    \
-			devm_regmap_field_alloc(&client->dev, regmap,	    \
+			devm_regmap_field_alloc(dev, regmap,		    \
 				stk3310_reg_field_##name);		    \
-		if (IS_ERR(data->reg_##name)) {				    \
-			dev_err(&client->dev, "reg field alloc failed.\n"); \
-			return PTR_ERR(data->reg_##name);		    \
-		}							    \
+		if (IS_ERR(data->reg_##name))				    \
+			return dev_err_probe(dev,			    \
+				PTR_ERR(data->reg_##name),		    \
+				"reg field alloc failed.\n");		    \
 	} while (0)
 
 static const struct reg_field stk3310_reg_field_state =
@@ -517,10 +517,8 @@ static int stk3310_init(struct iio_dev *indio_dev)
 
 	state = STK3310_STATE_EN_ALS | STK3310_STATE_EN_PS;
 	ret = stk3310_set_state(data, state);
-	if (ret < 0) {
-		dev_err(&client->dev, "failed to enable sensor");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to enable sensor\n");
 
 	ret = devm_add_action_or_reset(&client->dev, stk3310_set_state_disable, data);
 	if (ret)
@@ -529,9 +527,9 @@ static int stk3310_init(struct iio_dev *indio_dev)
 	/* Enable PS interrupts */
 	ret = regmap_field_write(data->reg_int_ps, STK3310_PSINT_EN);
 	if (ret < 0)
-		dev_err(&client->dev, "failed to enable interrupts!\n");
+		return dev_err_probe(dev, ret, "failed to enable interrupts!\n");
 
-	return ret;
+	return 0;
 }
 
 static bool stk3310_is_volatile_reg(struct device *dev, unsigned int reg)
@@ -560,14 +558,14 @@ static const struct regmap_config stk3310_regmap_config = {
 static int stk3310_regmap_init(struct stk3310_data *data)
 {
 	struct regmap *regmap;
-	struct i2c_client *client;
+	struct i2c_client *client = data->client;
+	struct device *dev = &client->dev;
 
-	client = data->client;
 	regmap = devm_regmap_init_i2c(client, &stk3310_regmap_config);
-	if (IS_ERR(regmap)) {
-		dev_err(&client->dev, "regmap initialization failed.\n");
-		return PTR_ERR(regmap);
-	}
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "regmap initialization failed.\n");
+
 	data->regmap = regmap;
 
 	STK3310_REGFIELD(state);
@@ -654,12 +652,11 @@ static int stk3310_probe(struct i2c_client *client)
 	int ret;
 	struct iio_dev *indio_dev;
 	struct stk3310_data *data;
+	struct device *dev = &client->dev;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed!\n");
-		return -ENOMEM;
-	}
+	if (!indio_dev)
+		return dev_err_probe(dev, -ENOMEM, "iio allocation failed!\n");
 
 	data = iio_priv(indio_dev);
 	data->client = client;
@@ -675,7 +672,7 @@ static int stk3310_probe(struct i2c_client *client)
 	ret = devm_regulator_bulk_get(&client->dev, ARRAY_SIZE(data->supplies),
 				      data->supplies);
 	if (ret)
-		return dev_err_probe(&client->dev, ret, "get regulators failed\n");
+		return dev_err_probe(dev, ret, "get regulators failed\n");
 
 	ret = stk3310_regmap_init(data);
 	if (ret < 0)
@@ -689,13 +686,11 @@ static int stk3310_probe(struct i2c_client *client)
 
 	ret = stk3310_regulators_enable(data);
 	if (ret)
-		return dev_err_probe(&client->dev, ret,
-				     "regulator enable failed\n");
+		return dev_err_probe(dev, ret, "regulator enable failed\n");
 
 	ret = devm_add_action_or_reset(&client->dev, stk3310_regulators_disable, data);
 	if (ret)
-		return dev_err_probe(&client->dev, ret,
-				     "failed to register regulator cleanup\n");
+		return dev_err_probe(dev, ret, "failed to register regulator cleanup\n");
 
 	ret = stk3310_init(indio_dev);
 	if (ret < 0)
@@ -708,18 +703,14 @@ static int stk3310_probe(struct i2c_client *client)
 						IRQF_TRIGGER_FALLING |
 						IRQF_ONESHOT,
 						STK3310_EVENT, indio_dev);
-		if (ret < 0) {
-			dev_err(&client->dev, "request irq %d failed\n",
-				client->irq);
-			return ret;
-		}
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "request irq %d failed\n",
+					     client->irq);
 	}
 
 	ret = devm_iio_device_register(&client->dev, indio_dev);
-	if (ret < 0) {
-		dev_err(&client->dev, "device_register failed\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "device_register failed\n");
 
 	return 0;
 }
-- 
2.47.0


