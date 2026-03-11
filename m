Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC27112588E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 19:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5jKa1mhx8JE7wb9TTu7vy92JT5A3X2bElgi3jOUD4I=; b=pPMG6xfskUjnqkFjCW27WdPhyu
	3mgiMhQL628O2sC9pzlT2IMZ1FRfRygf15dYLsmBWHXVintQ6Rt+0slT0IVp/fDfYcj8wmCMOS/Mt
	kcIEUse4pwkchTI/gMxdsrOFQd/IfyO/3aiehwkP2SXs5ZnMCClak4TgWcgZmCd8wius/sI5i9VGH
	eWRflphlTFR/2HZgrXWVvkvo/S5jJMYGS9Xt8eYlHcAduBeUDIh3ACSeVzsHdPqXt7ZyBSifcZmA9
	ACSzWdPIR7ylhMCmt5bhOrAr/KLM2G1WHvbMuPz757vXOPDZLkpp2+CLCZ8/hBpEwcNHcdh9koTPx
	3/1NG0Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0PNw-0000000CMjj-0GGx;
	Wed, 11 Mar 2026 19:38:24 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0PNu-0000000CMj0-1vwr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 19:38:23 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4853f2826f7so1851215e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 12:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773257900; x=1773862700; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O5jKa1mhx8JE7wb9TTu7vy92JT5A3X2bElgi3jOUD4I=;
        b=oRvrjQ2yFo5NfzXH/EBBi/IofghAsdusCSqGa6U+FgEgeItAYyob0jEmVdZYNUOTNc
         yGJ6DiEcMEzoDQCqWtKDQQEnV8GUKXJ5CRkwA3on5g6NbqDki4shyrr18kMH6RTvCIV9
         s+VantBjKqulbi6tyMzNNRjhXZIfLbERajzCClKWjxAubTjD1PDXxVgfjdYIDedUGFZ6
         cK4kjPTjVuYL+04DXmnPbsRpyninc0PqzDtbaUXUwxnxffk6ARrEfKheQeiZebNGWJjR
         19ycoHTWJrEJhBZOTfBVzem9XFUWaTzow4no8zyjIEq2dQRik3WYdEPZCl8k5msPjJnK
         xnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257900; x=1773862700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5jKa1mhx8JE7wb9TTu7vy92JT5A3X2bElgi3jOUD4I=;
        b=ZznCoUqXU348v3xOz54FNQOT7g6wm8FRapD6U8JAsM69WvzCKOwFxAIj3pm2DGa2+t
         /ViCX2Tz0SI/pu1XyzoX4weuwEM329YoQLTym18B/jQ/buHQ16d99ttCyg2l/fsRrumd
         3RzdrwpaNcpM0Pqv4lYN76Ey3EzNlVp+0X7VaNLm43eh2k0ug0vkcnQvCxjtqLanHnwZ
         LOoFQjZaNEoqh99qWUhGGU3+fRZEoN5/sdjBrXu5yCHApykdmaZA9RtT9SeKDeR6aQ9n
         46q+C60m4eciehsq4vbyccUmz/kWkEQtXyGTK7vcJ2IJgEKPOB/WY6JR20gs5+WaOGiE
         m3ig==
X-Forwarded-Encrypted: i=1; AJvYcCXA2I13a7myuWFKiDp44NzFwuFEMhNFkyx7YzSZPZn7CvEXsXcjOhZaev2kr+6/QyoHSFo4COyf1HtQUelpT3eZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo7xRViPjH8kOLDooCYwOf1++L+L3l6raGpHcYVMvK5lli9dfl
	/TT8ikDwX2IdZ7zvUn863IBjCbPHLLMnytOyPaUmkD17YgBOILI0OM7Q8Ity1ObDBf0=
X-Gm-Gg: ATEYQzwlTYK7p9UjV3m/RlgM52zZjtuB3LueqHBhlOH6rK2DmXFFsMffBuBZscKklcQ
	JMlerNsSMvHuwxrmFlKvK355qHXui/Trsz30lf0gxGPKSvNs1bZeP04yKZjiMC5na+FIIi6h17j
	crBNLG21ruefIXEqsGUYgTS4gWLuRQQGmSPxH3AcpmNjZwQ/01LhyglhklvE6AWAsMrHw9DGZ4J
	PZR0knk6ktXCqodaeBDHfDKretOrsPCnY1yRzGt/gMDhmhjFpwjqwv3nwF+ZNMetfHKnfZh4bXt
	d3RkCYMIuhI7CFkwQl6RQqMKpJN/j2fThoh09Nwh9Ie+eQ/FmBtrvh97gOXi8Y9v/K8PYJKOZdA
	yJR45vN/d1W09ThhVWZC1ZWnJtqP9Q3G2LvpIINuHjtpa30YaHZs58ocDePr/jORoctlX7UwiLi
	segLup7oNiqOlFIv80fxtej33cWBjE
X-Received: by 2002:a05:600c:608c:b0:485:34b3:8589 with SMTP id 5b1f17b1804b1-4854b136ae3mr63730725e9.31.1773257900308;
        Wed, 11 Mar 2026 12:38:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2187aasm1506034f8f.30.2026.03.11.12.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:38:19 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:38:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 2/7] pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
Message-ID: <ce2b6b8f5b5432ac551720bad5776ef2ce490b68.1773150895.git.dan.carpenter@linaro.org>
References: <cover.1773150895.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773150895.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_123822_538429_E5BCC32F 
X-CRM114-Status: GOOD (  15.66  )
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


