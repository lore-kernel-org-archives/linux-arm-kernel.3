Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4906E67808
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 19:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=muOFYNTzaO2s6LuQjYw2jR7V/iVjO+R6V5aOyyeC/fE=; b=COztBZU7q82jZRP4lgHX52IjoB
	XYU1DkFmO7ykHK0BDzkV7WAiUzZyhFctwwmYiOs9cEYrGHu40ZEqOCiH6MzB7AkS9fE0MhMhcz05q
	LVFi/zKE+AU5GVw0Fbim2xUQz1afUsWQhsGdrXL10kLGoR3itbYNYQbh22EVq2I+xdJe/P047BG5K
	hxmuQ+C0vaetwXEj93R+UTyi+82gzDbbrMW2tOdMQ8uifO4ORHCP7/QL1pw3+R8HK2wqCJ+Tq0TV7
	BOEm0unRuNTCXTCuKDjn0i66zis/oViHX9kgg3jtyTQSCpJDU5gWAnK5UxY00UCZJ1zJhEImkOp3U
	dHkupY1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7KHh-0000000AK4m-14rD;
	Sat, 02 Nov 2024 19:59:45 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7KD6-0000000AJ9r-0qMx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 19:55:02 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id 519BC4C832;
	Sat,  2 Nov 2024 19:54:58 +0000 (UTC)
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
Subject: [PATCH v4 2/6] iio: light: stk3310: handle all remove logic with devm callbacks
Date: Sat,  2 Nov 2024 15:50:37 -0400
Message-ID: <20241102195037.3013934-7-aren@peacevolution.org>
In-Reply-To: <20241102195037.3013934-3-aren@peacevolution.org>
References: <20241102195037.3013934-3-aren@peacevolution.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
X-Spamd-Bar: +++++
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1730577299;
	h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
	bh=muOFYNTzaO2s6LuQjYw2jR7V/iVjO+R6V5aOyyeC/fE=;
	b=N7FNSpabyT6u3ukvz2bGjgD3Kioi/Imge8JRYxQFCk/rPJ43by7Uq54vvUM7JGmALM8AbD
	TtrYr8kRff/oSFO2M9ES5MPF1Bxlnzy1RgeNDHDPq9FjiiwFM7AAqCQF/MAl4DGeztFM2n
	i+adxee2o+IWMf48clpCf+XkW19ahIw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_125500_389463_ACA08A6D 
X-CRM114-Status: GOOD (  12.46  )
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

Using devm callbacks helps to make the ordering of probe / remove
operations easier to reason about and removes some duplicate code
between the probe error path and driver remove.
---

Notes:
    Changes in v4:
     - also replace mutex_init with devm_mutex_init
    
    Added in v3

 drivers/iio/light/stk3310.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
index ed20b6714546..181b7acb3f96 100644
--- a/drivers/iio/light/stk3310.c
+++ b/drivers/iio/light/stk3310.c
@@ -484,6 +484,17 @@ static int stk3310_set_state(struct stk3310_data *data, u8 state)
 	return ret;
 }
 
+static void stk3310_set_state_disable(void *private)
+{
+	int ret;
+	struct stk3310_data *data = private;
+	struct device *dev = &data->client->dev;
+
+	ret = stk3310_set_state(data, STK3310_STATE_STANDBY);
+	if (ret)
+		dev_err(dev, "failed to set state to standby: %d\n", ret);
+}
+
 static int stk3310_init(struct iio_dev *indio_dev)
 {
 	int ret;
@@ -491,6 +502,7 @@ static int stk3310_init(struct iio_dev *indio_dev)
 	u8 state;
 	struct stk3310_data *data = iio_priv(indio_dev);
 	struct i2c_client *client = data->client;
+	struct device *dev = &client->dev;
 
 	ret = regmap_read(data->regmap, STK3310_REG_ID, &chipid);
 	if (ret < 0)
@@ -507,6 +519,10 @@ static int stk3310_init(struct iio_dev *indio_dev)
 		return ret;
 	}
 
+	ret = devm_add_action_or_reset(&client->dev, stk3310_set_state_disable, data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register cleanup function\n");
+
 	/* Enable PS interrupts */
 	ret = regmap_field_write(data->reg_int_ps, STK3310_PSINT_EN);
 	if (ret < 0)
@@ -624,7 +640,7 @@ static int stk3310_probe(struct i2c_client *client)
 	device_property_read_u32(&client->dev, "proximity-near-level",
 				 &data->ps_near_level);
 
-	mutex_init(&data->lock);
+	devm_mutex_init(&client->dev, &data->lock);
 
 	ret = stk3310_regmap_init(data);
 	if (ret < 0)
@@ -650,29 +666,17 @@ static int stk3310_probe(struct i2c_client *client)
 		if (ret < 0) {
 			dev_err(&client->dev, "request irq %d failed\n",
 				client->irq);
-			goto err_standby;
+			return ret;
 		}
 	}
 
-	ret = iio_device_register(indio_dev);
+	ret = devm_iio_device_register(&client->dev, indio_dev);
 	if (ret < 0) {
 		dev_err(&client->dev, "device_register failed\n");
-		goto err_standby;
+		return ret;
 	}
 
 	return 0;
-
-err_standby:
-	stk3310_set_state(data, STK3310_STATE_STANDBY);
-	return ret;
-}
-
-static void stk3310_remove(struct i2c_client *client)
-{
-	struct iio_dev *indio_dev = i2c_get_clientdata(client);
-
-	iio_device_unregister(indio_dev);
-	stk3310_set_state(iio_priv(indio_dev), STK3310_STATE_STANDBY);
 }
 
 static int stk3310_suspend(struct device *dev)
@@ -736,7 +740,6 @@ static struct i2c_driver stk3310_driver = {
 		.acpi_match_table = stk3310_acpi_id,
 	},
 	.probe =        stk3310_probe,
-	.remove =           stk3310_remove,
 	.id_table =         stk3310_i2c_id,
 };
 
-- 
2.47.0


