Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B1FD33990
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 14:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdEG+PzvG0Vo99BU/R4RjPsHvmaNQJ3LSrH+8TVql9M=; b=j4AYc2GSNxJpflli+Ql8m7Ic2G
	CkilRy9tfSabLEnfFcSc6ZDwQlFQxOP6oPBT7Ey4U5/QAceQUiyT7Edpm3ILZ+l3OyCk1IO7DQ9q6
	Vfjr7ue9uViHhOyQsWWEUdyk1P5na07h1VmdMFOoBmI8Ejb8Rv50B6S2AbskQ4HpusT56NGw9EbYf
	ohwP2Sime1/yhtsSKBFFfzHO8iZRLv8Glafw64muiv7n+xd3iftrcU8bp7pvCNx5T6fusmERnpp9E
	bON62RCsSkU9lAEEyDmkd2x7n4gRsHd9SElENrjygNIzCAx2YqbMHAX5pURN2p0DWGlpH2hGssIVB
	otevyxmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5R1n-0000000BBsW-3KVE;
	Mon, 28 Oct 2024 14:47:31 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Qd5-0000000B6AH-1tsm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:22:01 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id 8BFDB4C6A3;
	Mon, 28 Oct 2024 14:21:57 +0000 (UTC)
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
Subject: [PATCH v3 2/6] iio: light: stk3310: handle all remove logic with devm callbacks
Date: Mon, 28 Oct 2024 10:19:56 -0400
Message-ID: <20241028142000.1058149-3-aren@peacevolution.org>
In-Reply-To: <20241028142000.1058149-1-aren@peacevolution.org>
References: <20241028142000.1058149-1-aren@peacevolution.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
X-Spamd-Bar: +++++
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1730125318;
	h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
	bh=XdEG+PzvG0Vo99BU/R4RjPsHvmaNQJ3LSrH+8TVql9M=;
	b=N2EsH13FDOQFjN8HkB+osgOBN8dUDuhjxjaYEcRsLPXlm636aADXeXR8Ybm0VHHf8pGmmv
	YScoijdrRYm4Jrw2F3qOCB+ANT9XC/0ViSVsKemakgDBPPVntrbuj8e0HHL06jWOL6jpX6
	94B/thP/0MgpRh548+mX3NM11ZItS+g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_072159_652099_024864FE 
X-CRM114-Status: GOOD (  12.22  )
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
    Added in v3

 drivers/iio/light/stk3310.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
index ed20b6714546..2e1aa551bdbc 100644
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
@@ -507,6 +518,11 @@ static int stk3310_init(struct iio_dev *indio_dev)
 		return ret;
 	}
 
+	ret = devm_add_action_or_reset(&client->dev, stk3310_set_state_disable, data);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "failed to register cleanup function\n");
+
 	/* Enable PS interrupts */
 	ret = regmap_field_write(data->reg_int_ps, STK3310_PSINT_EN);
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


