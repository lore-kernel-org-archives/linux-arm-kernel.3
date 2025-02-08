Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA86C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 21:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mx7GsGGiN8qI/cnEK3cRpdvpl4cmkBeU5/Nkgf8DQFw=; b=Tqd7aw1IhQ4bm9/j8pciumdwr+
	DQcazQshx9YQ5auw64Krm0MRmyhqXt0ND/oSDTEsG3DbAppN5+utDdp74u7R1EvBOvC7FwKDfw7sT
	cC73u1u8NxTgG7h8hg/UOKVJc3diGggvEEuaqjL/vuM1EptZ8owVmAl+emSzprj8rCFq0L6Dg2qJI
	yDggzfdhDNy2rspQO2Lo82yTImoM5MkAk7lthsd+FBCMt/flbbzvG/nczJMn6ysbgQbz7uuzZ4zQ8
	t5EsOtv0UF3tKMH/OzNZGjHguIr+R0xRhZtKav9UPkqkC48Jmr6nu/eJHVM0ljb6N600T4wVj+88R
	5nqpBJcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgsJu-0000000DZPI-0VWm;
	Sat, 08 Feb 2025 21:24:58 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgsBt-0000000DYWE-0MbD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 21:16:42 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id 3045941B62;
	Sat,  8 Feb 2025 21:16:39 +0000 (UTC)
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
Subject: [PATCH v5 4/8] iio: light: stk3310: simplify and inline STK3310_REGFIELD macro
Date: Sat,  8 Feb 2025 16:13:22 -0500
Message-ID: <20250208211325.992280-6-aren@peacevolution.org>
In-Reply-To: <20250208211325.992280-2-aren@peacevolution.org>
References: <20250208211325.992280-2-aren@peacevolution.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
X-Spamd-Bar: ++
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1739049400;
	h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
	bh=Mx7GsGGiN8qI/cnEK3cRpdvpl4cmkBeU5/Nkgf8DQFw=;
	b=e3cTbml3prtzCmxHCRYg0uCtzSSdKwUHWsADXg8UBkwdCD/d2zABsDeKwSi0A98k2pyaOb
	BgoyVJgFwfO3GBvxhKhBg/CEwRT/Ib/7pYpAsO5SD8uPWRc/RuDRzniMpnNr+DEruN/iLa
	g6OSGRkUZ79xBVXcdsKELaG7qF953YE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_131641_263291_731CB44B 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

This macro has a conditional return statement, which obfuscates control
flow. Inlining makes the control flow more clear.

This also switches to using dev_err_probe for error reporting, which is
a shorter way of expressing the same logic as before.

Signed-off-by: Aren Moynihan <aren@peacevolution.org>
---

Notes:
    Added in v5

 drivers/iio/light/stk3310.c | 58 +++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 19 deletions(-)

diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
index 9c38ff01fdf0f..2e883e24dc4b2 100644
--- a/drivers/iio/light/stk3310.c
+++ b/drivers/iio/light/stk3310.c
@@ -59,17 +59,6 @@
 	"0.023680 0.047360 0.094720 0.189440 0.378880 0.757760 1.515520 " \
 	"3.031040 6.062080"
 
-#define STK3310_REGFIELD(name)						    \
-	do {								    \
-		data->reg_##name =					    \
-			devm_regmap_field_alloc(&client->dev, regmap,	    \
-				stk3310_reg_field_##name);		    \
-		if (IS_ERR(data->reg_##name)) {				    \
-			dev_err(&client->dev, "reg field alloc failed.\n"); \
-			return PTR_ERR(data->reg_##name);		    \
-		}							    \
-	} while (0)
-
 static const struct reg_field stk3310_reg_field_state =
 				REG_FIELD(STK3310_REG_STATE, 0, 2);
 static const struct reg_field stk3310_reg_field_als_gain =
@@ -568,14 +557,45 @@ static int stk3310_regmap_init(struct stk3310_data *data)
 	}
 	data->regmap = regmap;
 
-	STK3310_REGFIELD(state);
-	STK3310_REGFIELD(als_gain);
-	STK3310_REGFIELD(ps_gain);
-	STK3310_REGFIELD(als_it);
-	STK3310_REGFIELD(ps_it);
-	STK3310_REGFIELD(int_ps);
-	STK3310_REGFIELD(flag_psint);
-	STK3310_REGFIELD(flag_nf);
+	data->reg_state = devm_regmap_field_alloc(dev, regmap, stk3310_reg_field_state);
+	if (IS_ERR(data->reg_state))
+		return dev_err_probe(dev, PTR_ERR(data->reg_state),
+				     "reg_state alloc failed\n");
+
+	data->reg_als_gain = devm_regmap_field_alloc(dev, regmap, stk3310_reg_field_als_gain);
+	if (IS_ERR(data->reg_als_gain))
+		return dev_err_probe(dev, PTR_ERR(data->reg_als_gain),
+				     "reg_als_gain alloc failed\n");
+
+	data->reg_ps_gain = devm_regmap_field_alloc(dev, regmap, stk3310_reg_field_ps_gain);
+	if (IS_ERR(data->reg_ps_gain))
+		return dev_err_probe(dev, PTR_ERR(data->reg_ps_gain),
+				     "reg_ps_gain alloc failed\n");
+
+	data->reg_als_it = devm_regmap_field_alloc(dev, regmap, stk3310_reg_field_als_it);
+	if (IS_ERR(data->reg_als_it))
+		return dev_err_probe(dev, PTR_ERR(data->reg_als_it),
+				     "reg_als_it alloc failed\n");
+
+	data->reg_ps_it = devm_regmap_field_alloc(dev, regmap, stk3310_reg_field_ps_it);
+	if (IS_ERR(data->reg_ps_it))
+		return dev_err_probe(dev, PTR_ERR(data->reg_ps_it),
+				     "reg_ps_it alloc failed\n");
+
+	data->reg_int_ps = devm_regmap_field_alloc(dev, regmap, stk3310_reg_field_int_ps);
+	if (IS_ERR(data->reg_int_ps))
+		return dev_err_probe(dev, PTR_ERR(data->reg_int_ps),
+				     "reg_int_ps alloc failed\n");
+
+	data->reg_flag_psint = devm_regmap_field_alloc(dev, regmap, stk3310_reg_field_flag_psint);
+	if (IS_ERR(data->reg_flag_psint))
+		return dev_err_probe(dev, PTR_ERR(data->reg_flag_psint),
+				     "reg_flag_psint alloc failed\n");
+
+	data->reg_flag_nf = devm_regmap_field_alloc(dev, regmap, stk3310_reg_field_flag_nf);
+	if (IS_ERR(data->reg_flag_nf))
+		return dev_err_probe(dev, PTR_ERR(data->reg_flag_nf),
+				     "reg_flag_nf alloc failed\n");
 
 	return 0;
 }
-- 
2.48.1


