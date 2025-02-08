Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D481EC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 21:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sh7wQrLZxDOxMjvtRdMEMxgWKn7Sh557t7kPahOEyMI=; b=fqIW/w+cuYN1KYZi0LNAggn1CL
	q6k0xoY2R8Z9Qvvmk49iy90j8pj80hKawtyWUSMLPIyTOwZ1MzWkj8KF+0LWn/tBmZuuI2QKSqUXb
	1CRymD0C8THWaKTTQFKozzs5TN0qATPX0yzzR7EyJRln6kBZawU55FqGliajrQqKZ/BB5gEbFUqdj
	vSJBM1ROvZvFS2TJJjw6OZaLN+12L3n1arrOKE4qAVyBe4tUTpcAiplbUcxHrqdcs4MCEkml/u6xM
	ltU4+NDuAauO+UnDZ5bgA+H2hSNMWFWZ2L6He0JTGoQIxr/1E3X7PI/TYuu4JOx+PWnNtPzmJuJBs
	YY8ycwsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgsLF-0000000DZX8-3Br6;
	Sat, 08 Feb 2025 21:26:21 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgsBv-0000000DYXD-2YWH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 21:16:45 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id 90EC741B67;
	Sat,  8 Feb 2025 21:16:41 +0000 (UTC)
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
	Julien Stephan <jstephan@baylibre.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Ondrej Jirman <megi@xff.cz>,
	Dragan Simic <dsimic@manjaro.org>,
	phone-devel@vger.kernel.org
Subject: [PATCH v5 5/8] iio: light: stk3310: refactor to always make dev a variable
Date: Sat,  8 Feb 2025 16:13:23 -0500
Message-ID: <20250208211325.992280-7-aren@peacevolution.org>
In-Reply-To: <20250208211325.992280-2-aren@peacevolution.org>
References: <20250208211325.992280-2-aren@peacevolution.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
X-Spamd-Bar: +++
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1739049402;
	h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
	bh=Sh7wQrLZxDOxMjvtRdMEMxgWKn7Sh557t7kPahOEyMI=;
	b=Gu1chLssn9M/DwHkcpE3lBPErZZ2kSARpXYc7RdIMQQiSeAQX3vGgq6zX75y90xNTujuk0
	EShh6UGm7HgyAgNWBHziTweEQEmUYsaXCqOj6019iXb2eQwfVUau6Mq/G6pIBf/6+yyH0j
	EGLET+Frop/AqwvDCUaeKv02Ll5jcuQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_131643_789556_6371AB38 
X-CRM114-Status: GOOD (  13.47  )
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

This reduces syntactic noise where the dev variable is used, which
should help improve readability.

Signed-off-by: Aren Moynihan <aren@peacevolution.org>
---

Notes:
    Added in v5

 drivers/iio/light/stk3310.c | 40 ++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
index 2e883e24dc4b2..2233eab63b7aa 100644
--- a/drivers/iio/light/stk3310.c
+++ b/drivers/iio/light/stk3310.c
@@ -237,6 +237,7 @@ static int stk3310_read_event(struct iio_dev *indio_dev,
 	__be16 buf;
 	int ret;
 	struct stk3310_data *data = iio_priv(indio_dev);
+	struct device *dev = &data->client->dev;
 
 	if (info != IIO_EV_INFO_VALUE)
 		return -EINVAL;
@@ -253,7 +254,7 @@ static int stk3310_read_event(struct iio_dev *indio_dev,
 	ret = regmap_bulk_read(data->regmap, reg, &buf, 2);
 	mutex_unlock(&data->lock);
 	if (ret < 0) {
-		dev_err(&data->client->dev, "register read failed\n");
+		dev_err(dev, "register read failed\n");
 		return ret;
 	}
 	*val = be16_to_cpu(buf);
@@ -273,7 +274,7 @@ static int stk3310_write_event(struct iio_dev *indio_dev,
 	int ret;
 	unsigned int index;
 	struct stk3310_data *data = iio_priv(indio_dev);
-	struct i2c_client *client = data->client;
+	struct device *dev = &data->client->dev;
 
 	ret = regmap_field_read(data->reg_ps_gain, &index);
 	if (ret < 0)
@@ -292,7 +293,7 @@ static int stk3310_write_event(struct iio_dev *indio_dev,
 	buf = cpu_to_be16(val);
 	ret = regmap_bulk_write(data->regmap, reg, &buf, 2);
 	if (ret < 0)
-		dev_err(&client->dev, "failed to set PS threshold!\n");
+		dev_err(dev, "failed to set PS threshold!\n");
 
 	return ret;
 }
@@ -321,13 +322,13 @@ static int stk3310_write_event_config(struct iio_dev *indio_dev,
 {
 	int ret;
 	struct stk3310_data *data = iio_priv(indio_dev);
-	struct i2c_client *client = data->client;
+	struct device *dev = &data->client->dev;
 
 	/* Set INT_PS value */
 	mutex_lock(&data->lock);
 	ret = regmap_field_write(data->reg_int_ps, state);
 	if (ret < 0)
-		dev_err(&client->dev, "failed to set interrupt mode\n");
+		dev_err(dev, "failed to set interrupt mode\n");
 	mutex_unlock(&data->lock);
 
 	return ret;
@@ -342,7 +343,7 @@ static int stk3310_read_raw(struct iio_dev *indio_dev,
 	int ret;
 	unsigned int index;
 	struct stk3310_data *data = iio_priv(indio_dev);
-	struct i2c_client *client = data->client;
+	struct device *dev = &data->client->dev;
 
 	if (chan->type != IIO_LIGHT && chan->type != IIO_PROXIMITY)
 		return -EINVAL;
@@ -357,7 +358,7 @@ static int stk3310_read_raw(struct iio_dev *indio_dev,
 		mutex_lock(&data->lock);
 		ret = regmap_bulk_read(data->regmap, reg, &buf, 2);
 		if (ret < 0) {
-			dev_err(&client->dev, "register read failed\n");
+			dev_err(dev, "register read failed\n");
 			mutex_unlock(&data->lock);
 			return ret;
 		}
@@ -398,6 +399,7 @@ static int stk3310_write_raw(struct iio_dev *indio_dev,
 	int ret;
 	int index;
 	struct stk3310_data *data = iio_priv(indio_dev);
+	struct device *dev = &data->client->dev;
 
 	if (chan->type != IIO_LIGHT && chan->type != IIO_PROXIMITY)
 		return -EINVAL;
@@ -415,8 +417,7 @@ static int stk3310_write_raw(struct iio_dev *indio_dev,
 		else
 			ret = regmap_field_write(data->reg_ps_it, index);
 		if (ret < 0)
-			dev_err(&data->client->dev,
-				"sensor configuration failed\n");
+			dev_err(dev, "sensor configuration failed\n");
 		mutex_unlock(&data->lock);
 		return ret;
 
@@ -432,8 +433,7 @@ static int stk3310_write_raw(struct iio_dev *indio_dev,
 		else
 			ret = regmap_field_write(data->reg_ps_gain, index);
 		if (ret < 0)
-			dev_err(&data->client->dev,
-				"sensor configuration failed\n");
+			dev_err(dev, "sensor configuration failed\n");
 		mutex_unlock(&data->lock);
 		return ret;
 	}
@@ -454,7 +454,7 @@ static const struct iio_info stk3310_info = {
 static int stk3310_set_state(struct stk3310_data *data, u8 state)
 {
 	int ret;
-	struct i2c_client *client = data->client;
+	struct device *dev = &data->client->dev;
 
 	/* 3-bit state; 0b100 is not supported. */
 	if (state > 7 || state == 4)
@@ -463,7 +463,7 @@ static int stk3310_set_state(struct stk3310_data *data, u8 state)
 	mutex_lock(&data->lock);
 	ret = regmap_field_write(data->reg_state, state);
 	if (ret < 0) {
-		dev_err(&client->dev, "failed to change sensor state\n");
+		dev_err(dev, "failed to change sensor state\n");
 	} else if (state != STK3310_STATE_STANDBY) {
 		/* Don't reset the 'enabled' flags if we're going in standby */
 		data->ps_enabled  = !!(state & STK3310_STATE_EN_PS);
@@ -500,7 +500,7 @@ static int stk3310_init(struct iio_dev *indio_dev)
 
 	ret = stk3310_check_chip_id(chipid);
 	if (ret < 0)
-		dev_info(&client->dev, "new unknown chip id: 0x%x\n", chipid);
+		dev_info(dev, "new unknown chip id: 0x%x\n", chipid);
 
 	state = STK3310_STATE_EN_ALS | STK3310_STATE_EN_PS;
 	ret = stk3310_set_state(data, state);
@@ -618,12 +618,13 @@ static irqreturn_t stk3310_irq_event_handler(int irq, void *private)
 
 	struct iio_dev *indio_dev = private;
 	struct stk3310_data *data = iio_priv(indio_dev);
+	struct device *dev = &data->client->dev;
 
 	/* Read FLAG_NF to figure out what threshold has been met. */
 	mutex_lock(&data->lock);
 	ret = regmap_field_read(data->reg_flag_nf, &dir);
 	if (ret < 0) {
-		dev_err(&data->client->dev, "register read failed: %d\n", ret);
+		dev_err(dev, "register read failed: %d\n", ret);
 		goto out;
 	}
 	event = IIO_UNMOD_EVENT_CODE(IIO_PROXIMITY, 1,
@@ -635,7 +636,7 @@ static irqreturn_t stk3310_irq_event_handler(int irq, void *private)
 	/* Reset the interrupt flag */
 	ret = regmap_field_write(data->reg_flag_psint, 0);
 	if (ret < 0)
-		dev_err(&data->client->dev, "failed to reset interrupts\n");
+		dev_err(dev, "failed to reset interrupts\n");
 out:
 	mutex_unlock(&data->lock);
 
@@ -674,7 +675,7 @@ static int stk3310_probe(struct i2c_client *client)
 	struct stk3310_data *data;
 	struct device *dev = &client->dev;
 
-	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
 	if (!indio_dev) {
 		dev_err(&client->dev, "iio allocation failed!\n");
 		return -ENOMEM;
@@ -684,8 +685,7 @@ static int stk3310_probe(struct i2c_client *client)
 	data->client = client;
 	i2c_set_clientdata(client, indio_dev);
 
-	device_property_read_u32(&client->dev, "proximity-near-level",
-				 &data->ps_near_level);
+	device_property_read_u32(dev, "proximity-near-level", &data->ps_near_level);
 
 	ret = devm_mutex_init(dev, &data->lock);
 	if (ret)
@@ -722,7 +722,7 @@ static int stk3310_probe(struct i2c_client *client)
 		return ret;
 
 	if (client->irq > 0) {
-		ret = devm_request_threaded_irq(&client->dev, client->irq,
+		ret = devm_request_threaded_irq(dev, client->irq,
 						stk3310_irq_handler,
 						stk3310_irq_event_handler,
 						IRQF_TRIGGER_FALLING |
-- 
2.48.1


