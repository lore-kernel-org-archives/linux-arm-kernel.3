Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D895F3383D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oGuZGWOJwSB6f8V0h3mJxMfgC0ILfRIiCjXkY39JNU=; b=4RejL9n65WxJQA+DJFeBlxvHch
	F+2fq1iWRes0UNdIV5j/txzYv5AyWinH3Y1cFKi1yd2cHtt768nQVMT5MccJO3q/51SQNHdCAyLRZ
	RjgF8tdKilFaXJw60FGLAlSYo5HkosVl9LvChI/KHdDsxxog/AgZbdtxTt9pc3cfYV1bS1gv+IEE/
	MNu8/ZeAeeyFkSERAGdq2QTnS5TLWiYccmp2uuJ+B1Il4o6OE8iTKyFu8Y+lwm+yetuI+wl6K4UDz
	YL9hyaiu85QFsm1IW1BR2E0fNuHtN1HIu/sC+pmL+7yJa+7RJcXMl8vyN44BmEZYMnE1rbO6FtvCc
	Ymen7I8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Vb4-00000006dZr-1YdZ;
	Tue, 17 Mar 2026 14:40:38 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Vb0-00000006dXW-2NHl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:40:37 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b8f97c626aaso910208766b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773758431; x=1774363231; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6oGuZGWOJwSB6f8V0h3mJxMfgC0ILfRIiCjXkY39JNU=;
        b=IAR7gM2wMlESU0a425rtAzTSdFoWn0dM86wRldohkQAAd5czucy6OTpPULH9HuQCAj
         xhW+7oY2EtsG68BLn1sk9EtLjnOGr/ZQVRTHFZmXqn5h2GavPNExFEZkGjVwHB6qViqC
         5HcdyE2LhHRuDeQfnJOic8JW9UyQiP0Tm58/NrUefyO0xrRqPxRQSBUtakYLyin7bKr/
         FT+g8EX1LP1sjCD7pQpjgiHXf3wpJjnNS2jqABLg8ncC1xruztT/jF9twXhAPRE+zuHV
         pacVBGF7iCerQbkUkpSBUFTc5L26bYLesO8FGVsh6neIJF0NRSV8npw+pEVDqEVPJFBO
         8FMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758431; x=1774363231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6oGuZGWOJwSB6f8V0h3mJxMfgC0ILfRIiCjXkY39JNU=;
        b=WNvkQPA4VuG2RJjc6xJnqWUTKAapyC6kqDxAHIVMzrheqegL7tbmizfBhycoLGTthA
         ITxEVuR2iptKenN0DY0pj4O4v3dH28DBcP0IzQ1F88N1aekqkgo/60NR67Qj1GkA/y5A
         MIl57uBOTzC7tJ+dPoYfua1i3d5XX3jcvUqZK9pm5lWKc0NNTMMOwjM/AQYi60KQ/fG0
         ivf3Yw2Ak8fO8qdv7CLZU5BlnpSrpyTV+J1kGx0IXoC37uvoSyvLI7ThmAxpTV36MpAK
         INeTuy8O7QbUe6dLkHPPf4NBQzufNxlZ+a4iKWT4N3catsFwQhbzbXNOG0BubMtpNvmq
         JRZA==
X-Forwarded-Encrypted: i=1; AJvYcCXBeJI7hfAgoII6f5EpvxPnWFawxdV8YNynci0vKw+dsxMEaLuh6ajko1WdopnNy/v9br2TQ7WABSMsEgvAuUh/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6MElnd/dy1V5BtQvd1JF8argA4fWK0MJQjkH4EK76cgum1AIt
	LvO+LvWeRgeCje7XIECQK2YmJDP5AxVdYlzNFV6l2vwlNLu8jJn8jeWyEr3zHTkvAQs=
X-Gm-Gg: ATEYQzy2P4CFzP8p7pIJJ1joDCvTZ4I/abQ5uuinSm+M4nWEY8TB/ean95HNhKaiNj8
	E3Qg6yNA3Nx7DzXx3ye3VhyB/gv5Jh6ZmgF5mvg+seZHWmE+cH6PVZJxPzwSz6+G3St3UDXmKdC
	dREU/zSZHE2sqzHc2H56qAfkgyDnAk9bvrs7ckTJoR6LPQcE2iIdqDHoi6TwU6Ze7UeI3zzT+F5
	WzXLmmHBAdO5rvqMEJ0MwAekjEAqn4KouSL2lNoGvxpTWByhDvFyIkX+PawOKwkZjZW5achnw+G
	yNCHozi8xcwRTiB13yDKCIzRDnJzbmwSNKv6n7ZeibPUNXvHdqI0MLExX8nAO3PkGgrdvJkbHVM
	1bl/z0TYHnPVh7WVaiPSnu3VO52HZWsunf4Hza3wWimvlR0byYKQSgjDLaiqtaupEIolAQeBa1U
	EbwYNpEyy/vxg6HGTOyuB3Gp1IFmeT
X-Received: by 2002:a17:906:dc94:b0:b97:860c:de51 with SMTP id a640c23a62f3a-b97860ce73amr764078966b.43.1773758430465;
        Tue, 17 Mar 2026 07:40:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf380f2sm755154766b.53.2026.03.17.07.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:40:30 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:40:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v4 2/7] pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
Message-ID: <940ff48bd53e35e19a4cda081170d9198c20675e.1773757772.git.dan.carpenter@linaro.org>
References: <cover.1773757772.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773757772.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_074034_644983_A1D475F6 
X-CRM114-Status: GOOD (  15.51  )
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

The PIN_CONFIG_LEVEL parameter represents the value of the pin, whether
reading or writing to the pin.  In SCMI, the parameter is represented by
two different values SCMI_PIN_OUTPUT_VALUE for writing to a pin and
SCMI_PIN_INPUT_VALUE for reading.  The current code translates
PIN_CONFIG_LEVEL as SCMI_PIN_OUTPUT_VALUE (writing).

Add a function to translate it to either INPUT or OUTPUT depending on
whether it is called from a _get or _set() operation.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/pinctrl/pinctrl-scmi.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index f4f296e07be5..5d347e6b2e4c 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -251,9 +251,6 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_MODE_LOW_POWER:
 		*type = SCMI_PIN_LOW_POWER_MODE;
 		break;
-	case PIN_CONFIG_LEVEL:
-		*type = SCMI_PIN_OUTPUT_VALUE;
-		break;
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		*type = SCMI_PIN_OUTPUT_MODE;
 		break;
@@ -276,6 +273,28 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	return 0;
 }
 
+static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
+					     enum scmi_pinctrl_conf_type *type)
+{
+	if (param == PIN_CONFIG_LEVEL) {
+		*type = SCMI_PIN_INPUT_VALUE;
+		return 0;
+	}
+
+	return pinctrl_scmi_map_pinconf_type(param, type);
+}
+
+static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
+					     enum scmi_pinctrl_conf_type *type)
+{
+	if (param == PIN_CONFIG_LEVEL) {
+		*type = SCMI_PIN_OUTPUT_VALUE;
+		return 0;
+	}
+
+	return pinctrl_scmi_map_pinconf_type(param, type);
+}
+
 static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 				    unsigned int pin, unsigned long *config)
 {
@@ -290,7 +309,7 @@ static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 
 	config_type = pinconf_to_config_param(*config);
 
-	ret = pinctrl_scmi_map_pinconf_type(config_type, &type);
+	ret = pinctrl_scmi_map_pinconf_type_get(config_type, &type);
 	if (ret)
 		return ret;
 
@@ -363,7 +382,7 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-		ret = pinctrl_scmi_map_pinconf_type(param, &p_config_type[i]);
+		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[i]);
 		if (ret) {
 			dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 			goto free_config;
@@ -405,7 +424,7 @@ static int pinctrl_scmi_pinconf_group_set(struct pinctrl_dev *pctldev,
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-		ret = pinctrl_scmi_map_pinconf_type(param, &p_config_type[i]);
+		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[i]);
 		if (ret) {
 			dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 			goto free_config;
@@ -440,7 +459,7 @@ static int pinctrl_scmi_pinconf_group_get(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	config_type = pinconf_to_config_param(*config);
-	ret = pinctrl_scmi_map_pinconf_type(config_type, &type);
+	ret = pinctrl_scmi_map_pinconf_type_get(config_type, &type);
 	if (ret) {
 		dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 		return ret;
-- 
2.51.0


