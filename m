Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922C21094468
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 10:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBfrdJJUZs1LM9q6ioHXhMJzsujMA5jyt7cbTuG7Xhg=; b=GtqKdilI6MogScNxVTIscgizej
	QlQ+8yCi5Q0+Pibt3YWV5kIeg0aqWwfhkrGY/QVlIDfCko+xjsvto7a28ql1hP0EFvcYIiBxiuihP
	gh3olc89CDKZNXRKH4mefLmXO7oUn0EkZYja2oAMRdvwjrUU7x4Rv2gbTnllm51OKojMD30ro4M2+
	zDqxeaQJS6nT2RheVgHJ6XgcJkJKJW+dd4z2hJj0CrUZVtLLVwT8WuILRFNuSlcDyTWE8kP2ONGED
	BbMkkIL5AjxnTWoPDN8XUUMpfmOEsMqAZHBlmrOqx2SX2nHFRUnyMUUHbw6Y3kg8huVwCUmXkuTG7
	7pvSi38w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3tKu-0000000EKvN-3gQw;
	Sat, 21 Mar 2026 10:13:40 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3tKs-0000000EKup-3Bpv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 10:13:39 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so20880655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Mar 2026 03:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774088016; x=1774692816; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KBfrdJJUZs1LM9q6ioHXhMJzsujMA5jyt7cbTuG7Xhg=;
        b=QWyVfmXNEwjBBQLnLL4IfkQ8aeN4/Bo2ruPhTPVsi+MGkyFdXto5moJ57tfjgODWqi
         94jCyCkuiZJCDf0PfDtjabdhe7AaqnBdlmkq2+701OUFSyk+6Ijclzu/8sNfuVMinFxg
         RzTbYI6KpFGLkgqdjx3BYoJDelsWP+S84xM/h9ANtaunkilOosb8fwuee6Z8/g2gYgDN
         ndBSUwBpud0L5Ubj2d4I6O55Jdij+EElnugHJJ/qz2U44IAbklhNV46kIBVCGRKsPQkl
         Q3YJz1KDQ1Zz1CYM+HlydUQNPDryacmAlwOFzzf1O50i95gwk/e9pchy8DPNkacaKgtH
         lSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774088016; x=1774692816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBfrdJJUZs1LM9q6ioHXhMJzsujMA5jyt7cbTuG7Xhg=;
        b=mgE2G6Zw3il0nJivwizZWdfb4xbjma82pLwBokLaE5Rf2Ye+pIvtuNYBaiQrJLPnDx
         KCoXfCIeP5pI4k9zJaDgzDpXQSZwv/zrpDgceUdH70ky9SACOPLwe5HRU20uoVBE34RV
         t29EwNYQV4rdGQS2wDuxOvrnq0L/ImnM6r7dzv6o01m6vGc0xapb11x3B1Ndy0jHXvJR
         X4l7THXix+TCZ6lD9dEa2hyWAvqincYpSVVZuX3OTARv+xeSv6SbaEPGMKga97MQDKX1
         gxqbXj/Ncj2ZMHlVoQNcyLTppAvCIAKlUDb3OtIYec8OpcPispACWyFMW4X/Jv5RZ7ze
         tdcA==
X-Forwarded-Encrypted: i=1; AJvYcCWvQozzetCEi1autnHCOxiDABifjYBWwFU5iSWi9dCCnSu7xoGX5lPnToPPnfRq6FQThcP2rzZsWC3byb4lISEN@lists.infradead.org
X-Gm-Message-State: AOJu0YwQeUXPsySapRclTgL4na32DfwtTuB0sCOhRE2JilI7Pgl+jIRc
	SfdD2g3fRBm66kznT3RUB63Ses3GSCDiFQ7bhcjiZ05JcX0g31B7c73INHi1t/+fxGY=
X-Gm-Gg: ATEYQzxRc8CndeY+O7S4sj1otCBrbtAYpfgWpA0EVIMNIVawMEvsfV6RG+lr9vBBO5D
	dsW7YmQI+eDIExTRyVWbtKIVK7oWp2vSpvW400rkdVlTMLPYOB7rp7XUW1o42MReTxZltMpETYK
	WGskKv6pTlRrcp+9sZRxZtf3j4n2haooDWuNFWsd+ymHWww+9sXxr4BhpLAGioA8ftx7+TPHOa1
	bLQwxPNFQUB8WTeEi41218HdRO08XUKZDmsu1ScDUcDNLbeurgWq7U+YWX7nIUgZqf2+UB9lO8I
	ZDmMhZDRrq1oGba5M6Y3k8/D2gdDtke66fEhGLk/mrIauU52ocuwvL4a/4L8GJ0IukJ1WIGYmmZ
	UVJq2IOVmws9lnaZ4ZAsbzA3d+W2EiHIzSypXp2naw1/1PKWPRVy6Ut6DY6noKs47PKiWPTNxTb
	1wfI0+HCt/mBbY0ADfbgeLXVbF/7NueYDX6sN2Es4=
X-Received: by 2002:a05:600c:c16e:b0:485:4eaf:eb53 with SMTP id 5b1f17b1804b1-486fee0f975mr77117095e9.19.1774088015816;
        Sat, 21 Mar 2026 03:13:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487004fee41sm47800325e9.3.2026.03.21.03.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 03:13:35 -0700 (PDT)
Date: Sat, 21 Mar 2026 13:13:32 +0300
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
Subject: [PATCH v5 2/7] pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
Message-ID: <b39ceff6729ebd79c9c5c774033947d146c56afb.1774087290.git.dan.carpenter@linaro.org>
References: <cover.1774087290.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774087290.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_031338_847623_F022296E 
X-CRM114-Status: GOOD (  15.28  )
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
2.51.0


