Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA40C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 21:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KC0X8lgQOTNNFYjC1MhZEeQLG9S5MuH28VUYqdOhE+o=; b=3WGVh46vll3rG01kGevJ199D+e
	b3IZIDVl7Pg0dvfjh6auY7fPcszJh8/S7z6fBExDecnqm9XNuTGEz9hnBQgN3hAbMNbf70OFMMwFO
	icKzxSLMRLadOWxgSUto8VLNik8ZD81mWD+QddMpDdX9zH2x+kPCi27tGp08STOuo7HpXYp7l/W4D
	NElsjJZhFCXLYD9cAHWUITeYs8Qk5pAyZvwt7j2WURfpSjsm3WlN2aQghFIgYwhs74L5+Y70YlUQP
	DIeCE70mkp4h63+m0AwetFLnpSL4bFjrbgSpbwsQQI63NQ8yf/3fJF4VnTvqryzbybuKFw2A7d/5w
	Ufr6iqqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgsMc-0000000DZqP-1fQl;
	Sat, 08 Feb 2025 21:27:46 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgsBx-0000000DYYR-3aqS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 21:16:47 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id E6BC641B6B;
	Sat,  8 Feb 2025 21:16:43 +0000 (UTC)
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
Subject: [PATCH v5 6/8] iio: light: stk3310: use dev_err_probe where possible
Date: Sat,  8 Feb 2025 16:13:24 -0500
Message-ID: <20250208211325.992280-8-aren@peacevolution.org>
In-Reply-To: <20250208211325.992280-2-aren@peacevolution.org>
References: <20250208211325.992280-2-aren@peacevolution.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
X-Spamd-Bar: +++
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1739049405;
	h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
	bh=KC0X8lgQOTNNFYjC1MhZEeQLG9S5MuH28VUYqdOhE+o=;
	b=J4Okbg3QnG7lEL3C4iRk+5TnFawAvUuqzePAkBusC1qhBoBrBXjERbpxiTmT9RwEzzLlG9
	EJzFAmh608wYtGQs83y92RJX7nTkrOwdYQDT4RVANdHF9bLM1p/4QYI4GDAEuIfKr1uwG8
	TRUU2x9wGGKx0XmOKucnyfEdIiWifFM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_131646_034703_3505D814 
X-CRM114-Status: GOOD (  13.26  )
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

 drivers/iio/light/stk3310.c | 42 +++++++++++++++----------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
index 2233eab63b7aa..9d517d51f6bae 100644
--- a/drivers/iio/light/stk3310.c
+++ b/drivers/iio/light/stk3310.c
@@ -504,10 +504,8 @@ static int stk3310_init(struct iio_dev *indio_dev)
 
 	state = STK3310_STATE_EN_ALS | STK3310_STATE_EN_PS;
 	ret = stk3310_set_state(data, state);
-	if (ret < 0) {
-		dev_err(&client->dev, "failed to enable sensor");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to enable sensor\n");
 
 	ret = devm_add_action_or_reset(dev, stk3310_set_state_disable, data);
 	if (ret)
@@ -516,9 +514,9 @@ static int stk3310_init(struct iio_dev *indio_dev)
 	/* Enable PS interrupts */
 	ret = regmap_field_write(data->reg_int_ps, STK3310_PSINT_EN);
 	if (ret < 0)
-		dev_err(&client->dev, "failed to enable interrupts!\n");
+		return dev_err_probe(dev, ret, "failed to enable interrupts!\n");
 
-	return ret;
+	return 0;
 }
 
 static bool stk3310_is_volatile_reg(struct device *dev, unsigned int reg)
@@ -547,14 +545,14 @@ static const struct regmap_config stk3310_regmap_config = {
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
+				     "regmap initialization failed\n");
+
 	data->regmap = regmap;
 
 	data->reg_state = devm_regmap_field_alloc(dev, regmap, stk3310_reg_field_state);
@@ -676,10 +674,8 @@ static int stk3310_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed!\n");
-		return -ENOMEM;
-	}
+	if (!indio_dev)
+		return dev_err_probe(dev, -ENOMEM, "iio allocation failed!\n");
 
 	data = iio_priv(indio_dev);
 	data->client = client;
@@ -728,18 +724,14 @@ static int stk3310_probe(struct i2c_client *client)
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
 
 	ret = devm_iio_device_register(dev, indio_dev);
-	if (ret < 0) {
-		dev_err(&client->dev, "device_register failed\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "device_register failed\n");
 
 	return 0;
 }
-- 
2.48.1


