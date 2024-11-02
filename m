Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC6DE677FD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 20:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZ4cqFntykXHpbFFV4ZfGRHhWWvK0O7Az93eNAhN7Dc=; b=eC2pMytuqmeVtUOZugvhIe1dxw
	1Q9nZ8Reo2jBtcm5bmW+Ina1fDIH2Sx3GmbGXz7QD1N23hU+6BHbCUJB6A2SEv1Rxv6fbq65SFStY
	4K93vbXAaiXIUfSfIJxG/GKQoDFwjPWMjoT2YkDn60Y6CKsgcymErdxxJ16uEQjZ7RXSM7FPWibsJ
	EMWO2saTt5ObiHctF/faUIXIkGgwYHWln2fNDZ8x/FAQRKE2nDRmR3p6p8F5xICN3UE+K3WH2QDxT
	VeMnnPRk4wHt6ZLuHHZKfPwv3Oqs9dxdKyuAanbalpQPJS5PA7bdm8TwKbxi/h3rkFYKbtOgnNNBW
	3MjSP3Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7KJJ-0000000AKEK-2t92;
	Sat, 02 Nov 2024 20:01:25 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7KDl-0000000AJHI-1Kkz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 19:55:42 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id 61D1C4C832;
	Sat,  2 Nov 2024 19:55:39 +0000 (UTC)
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
Subject: [PATCH v4 3/6] iio: light: stk3310: Implement vdd and leda supplies
Date: Sat,  2 Nov 2024 15:50:39 -0400
Message-ID: <20241102195037.3013934-9-aren@peacevolution.org>
In-Reply-To: <20241102195037.3013934-3-aren@peacevolution.org>
References: <20241102195037.3013934-3-aren@peacevolution.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
X-Spamd-Bar: ++++++
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1730577340;
	h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
	bh=bZ4cqFntykXHpbFFV4ZfGRHhWWvK0O7Az93eNAhN7Dc=;
	b=OW4ekAto3UFMKXXS3S0cDNzAePkehJMi1jH2TlRvY/Fy2fyyCuWKyfKeXbKV6yFTFk/riD
	/XXAgwAbUG7sYkXkMd+CcaRmJZ/uFTMefVd6Eo3Tyhkq4c6eKktdx2YajP4A5ULvl/1t45
	yVIE9EZPVPuSD3UAEHmroZ4HUASpkIw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_125541_514803_4A26F0EA 
X-CRM114-Status: GOOD (  20.69  )
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

This was originally based on a patch by Ondrej Jirman[1], but has been
rewritten since.

1: https://codeberg.org/megi/linux/commit/a933aff8b7a0e6e3c9cf1d832dcba07022bbfa82

Signed-off-by: Aren Moynihan <aren@peacevolution.org>
---

Notes:
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
index 181b7acb3f96..f93689c61f44 100644
--- a/drivers/iio/light/stk3310.c
+++ b/drivers/iio/light/stk3310.c
@@ -13,6 +13,8 @@
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
 #include <linux/iio/events.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
@@ -130,6 +132,7 @@ struct stk3310_data {
 	struct regmap_field *reg_int_ps;
 	struct regmap_field *reg_flag_psint;
 	struct regmap_field *reg_flag_nf;
+	struct regulator_bulk_data supplies[2];
 };
 
 static const struct iio_event_spec stk3310_events[] = {
@@ -621,6 +624,31 @@ static irqreturn_t stk3310_irq_event_handler(int irq, void *private)
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
@@ -642,6 +670,13 @@ static int stk3310_probe(struct i2c_client *client)
 
 	devm_mutex_init(&client->dev, &data->lock);
 
+	data->supplies[0].supply = "vdd";
+	data->supplies[1].supply = "leda";
+	ret = devm_regulator_bulk_get(&client->dev, ARRAY_SIZE(data->supplies),
+				      data->supplies);
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "get regulators failed\n");
+
 	ret = stk3310_regmap_init(data);
 	if (ret < 0)
 		return ret;
@@ -652,6 +687,16 @@ static int stk3310_probe(struct i2c_client *client)
 	indio_dev->channels = stk3310_channels;
 	indio_dev->num_channels = ARRAY_SIZE(stk3310_channels);
 
+	ret = stk3310_regulators_enable(data);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "regulator enable failed\n");
+
+	ret = devm_add_action_or_reset(&client->dev, stk3310_regulators_disable, data);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "failed to register regulator cleanup\n");
+
 	ret = stk3310_init(indio_dev);
 	if (ret < 0)
 		return ret;
@@ -682,18 +727,45 @@ static int stk3310_probe(struct i2c_client *client)
 static int stk3310_suspend(struct device *dev)
 {
 	struct stk3310_data *data;
+	int ret;
 
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
+		dev_err(dev, "Failed to re-enable regulators: %d", ret);
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
2.47.0


