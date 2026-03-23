Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8C3F483E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYNDUizmJ/rKIkz2DY5qa0t62hb9uVCR9S4PHSBe3sY=; b=CkZh5ut5XPEO+O2p0BD7lCmyBL
	7YkocvR3aPwrR9tk03C/sxu/jcYQbrKoMqZlDGiQNkm1CFXgrJXHnWfz2Eh3Bj13x4uGM8Cq6E2rX
	9IEZ/DRihgxIRezdr13JBd8R/67y+YBf68iEcac30Vfg1gwTG5hgAQQFZmhQQ3pqkW9AgwwXw8CkP
	WeOAaq3aDYb7bMn2y0biRLlnPBah9ySNiK0ZftjWRSPmQWjXUzzFdlVCDf6JdDWOlHAGnRtGUi3lu
	oFmSUmmiaMMqKGaSob6beFHkWO55X82x6ekFssGktBp/ZDZM/H+pshs5fGj8z9upWEiuRP2WGfJQD
	kgHhMSBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kWh-0000000HOc9-3olE;
	Mon, 23 Mar 2026 19:01:23 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kWf-0000000HObd-2qML
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 19:01:22 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so30823215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 12:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774292480; x=1774897280; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cYNDUizmJ/rKIkz2DY5qa0t62hb9uVCR9S4PHSBe3sY=;
        b=vaN4tCp7zIb9FJIm6wOJDfNdIU/P/bs8shHaxKShR/0GWus4VlIV2PDtgIiUWqLLJ9
         8ttzktaBnhrbxAtzgJ+gglww+/ZzDzryUXIW+bUOZp1rpl27CxxlN0lji/5e4GVZRCbY
         M5IlkEpadW21MCh/683Hd56p3rGkxdNbMEAlRPyn26FDByuhVYBM0tIsYQgMw+lQ0S7e
         M7/iflbNaZ+QccGaXhTZADro7yQ2gAc3y+PvOOH/buQsLZ943y0edo4p3DlvqsH5xVJ4
         Z+kUt2ETjZ2yn9p4GMLHA3UxAkIhHJZF9dYaGfiFK07Fg3mwu8B171u/Wjd3usrPtMpm
         7oDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292480; x=1774897280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYNDUizmJ/rKIkz2DY5qa0t62hb9uVCR9S4PHSBe3sY=;
        b=RCjR0F8p46Y/6O8d/LJwxsT0bl6fffQoRCqzfa7AnRdDAlhQpNVYur8ZdYWQc6D6NP
         nI7PHY2S/1pilYABHVAGdZ5N2VDFOpU9RAqqToONhx2oWDlfduufNS+oZaC+YqNJvWZk
         PeVE6sXuh7W3hV4Xte0wjPbEg6lUx++rz9l+CUKMNkap/2sDxjNCa2Xs/+t7eEidyEyO
         UyVSh4qV7t9FrxR+qc6EHzxOVgssFh7v4z5Ot+TWLQ9fEZJRmM97gIa2gCY2sVDyVmxD
         u8TJ4h8ev/hhafa5QT1hL22Wn/195BgCnEI6uRf5VTCUMpZGQKdz7SZsKKDnRjCIWfii
         jbZg==
X-Forwarded-Encrypted: i=1; AJvYcCWaXW4OBAWMdDpVM/Cvki1406S1MJnnhT77ShwriFeUrLR6orKLBDnYELG5R1ehbcYPwrjS7TwRc03/rNI+HaZ4@lists.infradead.org
X-Gm-Message-State: AOJu0YxFtlf1tbpZGLnDVZzvoREzjyf+9IMN9vBam+AzlWw20c1sW45Z
	36i27Sga/Vp2/mjqQw6NeQtNqqMtU4bPsK9lnCVhITV3B7N5JwkqB7+ms38bhJCBa4s=
X-Gm-Gg: ATEYQzwYo6hVz1cCROpCy8F9bwyRyNtUJ+sxbkx9T3j6PIMmSUVn9c2y6zVVTKrkYJz
	1J/KGv/+2IfJPv284igtK0/A9EWQmYUW7qnDLS5UZj/zvMFrjayENcvf6CYazuts5VZm0O/RFTc
	sKOxwvqINcgvaYa4ikzKT8/fr/yqpad4CRkeuIi7NTrShI4bBSL37m6/fwVf8v0x8nEpFWzETif
	3Q0yDZNVF+3eQqWfKq0J6BU+xOKk2AqsyFZj4YkHvsTd4P1OrUefeF6OehugdlsbN2oPBg7MXAk
	Xk2Z8XoE/IkrOOfiPXSPk8T19D5BlCnW24jl128gKyI3ZIIMtgkcsaEgdKw1+Nh2yOUrFScgHay
	99QZPdjYdNcYInV+j4XstfHYtoEO6V/omkhPeDcm+NR0AoizGwkX1RtvLYR0DB3LnCah6u4hYZQ
	yFu6pFk4X6UcBky8KowKBbMEfKw61Z
X-Received: by 2002:a05:6000:4382:b0:43b:5192:894b with SMTP id ffacd0b85a97d-43b642426afmr20898486f8f.23.1774292479509;
        Mon, 23 Mar 2026 12:01:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae16fsm32522970f8f.8.2026.03.23.12.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:01:19 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:01:15 +0300
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
Subject: [PATCH v6 2/7] pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
Message-ID: <cf3f9e6f296ebe3828741b42dad9e511e51c5cc1.1774283146.git.dan.carpenter@linaro.org>
References: <cover.1774283146.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774283146.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_120121_744683_80055A03 
X-CRM114-Status: GOOD (  16.21  )
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
v5: no change
v4: add r-b tags
v3: new patch

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
2.53.0


