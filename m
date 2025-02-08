Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3C3C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 21:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntyJSBJfrG72XmoeXkVO4Qlom9oNlP0IrTSTWLoR4vU=; b=BFJb0I2dj8e3ekbkHAoT5n3y+2
	L46t4RYLhPq6A41xYMnuTiytc5+IUViLhNSOrxJmNGC6teqaoG/JBwdL5cqd5KQPTgdA2eWARLMwo
	7t+xcliCbeWGAc3w/rHaF1CSoPwHMh5BCQym3UpTqmsWdl2cqDNqZh+eLhvUVB/WniccLswN/yA0u
	pdMElXUHnsAGx121OnEJof5KskWHcDQjxeVX412YFFJsRsr+Vm1HCCthuTR1UqITqwCooqPp94J4S
	UEjocsx3cFhfd+yJvBPS/HnZ24sK4ds35R+0+H7VK10lky6ibjJ8i+QG0Iw9wHj7TA4Z1SXMNE8d0
	vUEROkhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgsIY-0000000DZGk-0eQB;
	Sat, 08 Feb 2025 21:23:34 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgsBq-0000000DYUw-3CU1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 21:16:40 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id DB3AB41B5C;
	Sat,  8 Feb 2025 21:16:36 +0000 (UTC)
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
Subject: [PATCH v5 3/8] iio: light: stk3310: implement vdd and leda supplies
Date: Sat,  8 Feb 2025 16:13:21 -0500
Message-ID: <20250208211325.992280-5-aren@peacevolution.org>
In-Reply-To: <20250208211325.992280-2-aren@peacevolution.org>
References: <20250208211325.992280-2-aren@peacevolution.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
X-Spamd-Bar: ++++++
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1739049398;
	h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
	bh=ntyJSBJfrG72XmoeXkVO4Qlom9oNlP0IrTSTWLoR4vU=;
	b=I3LnkCzfPUy+GdccLFWWcf0WyW5X015DA1Kz9Du2vHznVZxboQC1SM2FNhmwpnJZh0bhGx
	ERiS5NwZwJzCd7dCy3a7/tBVLLUJ5/woBkKg7MejpSgovuGLo8i90Z/fFRPMhJ/p5WHzQ2
	8g0YA5dCF/toruqEIwGew0+e/+iYeMk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_131639_034328_80C8521C 
X-CRM114-Status: GOOD (  20.08  )
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

The vdd and leda supplies must be powered on for the chip to function
and can be powered off during system suspend.

This is originally based on a patch by Ondrej Jirman, but has been
rewritten since.

Link: https://codeberg.org/megi/linux/commit/a933aff8b7a0e6e3c9cf1d832dcba07022bbfa82
Signed-off-by: Aren Moynihan <aren@peacevolution.org>
---

Notes:
    Changes in v5:
     - explicitely include array_size.h
    
    Changes in v4:
     - fix variable declaration order in stk3310_resume to match the rest of
       the driver
    
    Changes in v3:
     - use bulk regulators instead of two individual ones
     - handle cleanup using devm callbacks instead of the remove function
    
    Changes in v2:
     - always enable / disable regulators and rely on a dummy regulator if
       one isn't specified
     - replace usleep_range with fsleep
     - reorder includes so iio headers are last
     - add missing error handling to resume

 drivers/iio/light/stk3310.c | 76 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
index 73ea36fa3acec..9c38ff01fdf0f 100644
--- a/drivers/iio/light/stk3310.c
+++ b/drivers/iio/light/stk3310.c
@@ -7,12 +7,15 @@
  * IIO driver for STK3310/STK3311. 7-bit I2C address: 0x48.
  */
 
+#include <linux/array_size.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
 #include <linux/iio/events.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
@@ -130,6 +133,7 @@ struct stk3310_data {
 	struct regmap_field *reg_int_ps;
 	struct regmap_field *reg_flag_psint;
 	struct regmap_field *reg_flag_nf;
+	struct regulator_bulk_data supplies[2];
 };
 
 static const struct iio_event_spec stk3310_events[] = {
@@ -618,6 +622,31 @@ static irqreturn_t stk3310_irq_event_handler(int irq, void *private)
 	return IRQ_HANDLED;
 }
 
+static int stk3310_regulators_enable(struct stk3310_data *data)
+{
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(data->supplies), data->supplies);
+	if (ret)
+		return ret;
+
+	/* we need a short delay to allow the chip time to power on */
+	fsleep(1000);
+
+	return 0;
+}
+
+static void stk3310_regulators_disable(void *private)
+{
+	int ret;
+	struct stk3310_data *data = private;
+	struct device *dev = &data->client->dev;
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(data->supplies), data->supplies);
+	if (ret)
+		dev_err(dev, "failed to disable regulators: %d\n", ret);
+}
+
 static int stk3310_probe(struct i2c_client *client)
 {
 	int ret;
@@ -642,6 +671,13 @@ static int stk3310_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	data->supplies[0].supply = "vdd";
+	data->supplies[1].supply = "leda";
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(data->supplies),
+				      data->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "get regulators failed\n");
+
 	ret = stk3310_regmap_init(data);
 	if (ret < 0)
 		return ret;
@@ -652,6 +688,15 @@ static int stk3310_probe(struct i2c_client *client)
 	indio_dev->channels = stk3310_channels;
 	indio_dev->num_channels = ARRAY_SIZE(stk3310_channels);
 
+	ret = stk3310_regulators_enable(data);
+	if (ret)
+		return dev_err_probe(dev, ret, "regulator enable failed\n");
+
+	ret = devm_add_action_or_reset(dev, stk3310_regulators_disable, data);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register regulator cleanup\n");
+
 	ret = stk3310_init(indio_dev);
 	if (ret < 0)
 		return ret;
@@ -681,19 +726,46 @@ static int stk3310_probe(struct i2c_client *client)
 
 static int stk3310_suspend(struct device *dev)
 {
+	int ret;
 	struct stk3310_data *data;
 
 	data = iio_priv(i2c_get_clientdata(to_i2c_client(dev)));
 
-	return stk3310_set_state(data, STK3310_STATE_STANDBY);
+	ret = stk3310_set_state(data, STK3310_STATE_STANDBY);
+	if (ret)
+		return ret;
+
+	regcache_mark_dirty(data->regmap);
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(data->supplies), data->supplies);
+	if (ret) {
+		dev_err(dev, "failed to disable regulators: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
 }
 
 static int stk3310_resume(struct device *dev)
 {
-	u8 state = 0;
+	int ret;
 	struct stk3310_data *data;
+	u8 state = 0;
 
 	data = iio_priv(i2c_get_clientdata(to_i2c_client(dev)));
+
+	ret = stk3310_regulators_enable(data);
+	if (ret) {
+		dev_err(dev, "Failed to re-enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	ret = regcache_sync(data->regmap);
+	if (ret) {
+		dev_err(dev, "Failed to restore registers: %d\n", ret);
+		return ret;
+	}
+
 	if (data->ps_enabled)
 		state |= STK3310_STATE_EN_PS;
 	if (data->als_enabled)
-- 
2.48.1


