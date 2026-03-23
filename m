Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B31EF483E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHuRsDVkQUUGFXQRrZ4RkpmncGpGmYSyMNCrKIAVWFs=; b=fVedaZie998hXZeV7ON26q0Ahh
	xx/3r5XNRAeoZXJmROgadp6B96EaWWiBv8IssfU4rmFNcPrwgdM2ZT/Kek9i8yALFzRBc/UAFOo8c
	iRMZ9u+dHpe4m9kXkTvhn9BAjERzhmS3fQwnVGcNki3X0qWSZNuqVReLiQP1zowve3DQLIMNE3BpJ
	VdIDeP5e+gdHc3O7zW5z0vnUiU5BOS5QmQo+MRnoXIOFIHvp+TSzDLEQR48+w6AX1IVXkiplf13kx
	Ss86VBbDjyTvGpgUNg580GxdSD6AxoKweRI23cOJT8kG1JUiKuiamjsD38dCPCq5MSgCrNre06y/C
	LgfAGyew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kWv-0000000HOgt-26pQ;
	Mon, 23 Mar 2026 19:01:37 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kWm-0000000HOdF-0dZ0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 19:01:29 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-439b9b190easo437435f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 12:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774292486; x=1774897286; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MHuRsDVkQUUGFXQRrZ4RkpmncGpGmYSyMNCrKIAVWFs=;
        b=B7pDJYjzt3JSkFFO0KObuh5NrGHUyoCbz0fgqtAispkHxoO5cg+5RDQOZL3ldCDwMS
         0XANsVn6g+PMcfEQcMK6N59x83DsFfRBzS1eVmJogHZTrPWx0M4vsAo8Qu4+Ha2OHMv7
         ye8K2qrhLWUAqaE806m8EAVsXNUGt8QT48BjTj9GWoOZkuKx2OVe08m6nYHZG9WbuHDV
         x712HIacEhDQ9LFCMGmEv3fxjp/k1VmgJ7GKIrUmGi5QuiONcFqGCLYpfjqxMn8GiYSR
         dedJTd8wIY1l4zwxeh53ejrCLr4ED5mTQZssacE+MAsRE9tsmLHRM9e7OLo0t7Tkc1uC
         JK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292486; x=1774897286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHuRsDVkQUUGFXQRrZ4RkpmncGpGmYSyMNCrKIAVWFs=;
        b=awEMkqcmh16o62MHld9tKhwIOTwjPLqc8/tnUhtJwgz9Uw9JBDlb7spKXmoAXScAbL
         DaeIEyv9jYcxD65jeACqQZn4Zp6mxTdsVyvvFDWqKbZfNoPKLfdSIoTtYHWrW+EnVuIe
         cYORtePXyxz0MPxZheSXN3dKvB33pVG0XSLAK3NrPgp6sLzgPpyFK3vnlT2TnSWlG3j/
         h4zREbTAVMYaMmnNf1UMwfSTEPXKDdu043GCVLO390J+zk0iasF/3Y6OdRRno5bbgSbv
         J+5wfl8Dp3DxlUXoXhoVQ/KlN6bCJsoE99SchV8GylA4anKcw5oOwEHi7UFjL8NKGaUe
         NJdw==
X-Forwarded-Encrypted: i=1; AJvYcCVCpVKEIj6BdeZ2LvFqnegvAf6kA0/WkWc86WnNw/RrmBbkaoKSjCUdLSqMMPvn1guHihHmcA/+LQp0PCEzgCLb@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy4O5oQSTcng/MN58vT2seDR9Bm0YGBhvrTEXslVLV8Uh4BJ+q
	yIZLPl4+RwIsOskrHh1Am8LJNtn0bQiTzU9TZKhF3PbXkKsZFqyvor+n5SR9Hx2pqTo=
X-Gm-Gg: ATEYQzyZbSCUpPOYCm/0aYqWBP07LDLO4IFWtUutOdbWHMJ6jyd+YJld1SKdPrxcAz3
	Jovzr8z7RK+9MNrWWSeP1qXINs1TLILkmsWYWPPtgb4JVQfOndL4WuaklaXcr5eiYOMraCS711N
	Sv0Nm5YjjvB6EIxMZOWoR6nHT6dHcuqu7yCHkKpqC7YAgKvITCZUPNYNjlO1a/h/Al9Rr3zC2j3
	gA/RJSccNJq6VhtWL5xc3ir7iMybcw19J5fj4c3Vj86qzA7UyUbf7XsNWjkyr+5jj+KH69+iFYd
	yzkP27YXMeGGxvJuHlhTYvd1BXaTPbo+hfkPH4CTrjKqOsBy2uiIhPuazuBt1RRjjX8VILVbvrD
	QlwiY/u59ixADRI04E2bHMwI2YQ690QM9idXnj4wBYsIypqmLMErFl9JaS8NRSdfidlnaFj+XXm
	8S4epZzcsDHT/fBBGIabuU6AB4nIm1
X-Received: by 2002:a05:600c:5248:b0:485:3a27:a961 with SMTP id 5b1f17b1804b1-486feb5d845mr199608445e9.0.1774292486005;
        Mon, 23 Mar 2026 12:01:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64714decsm28604894f8f.31.2026.03.23.12.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:01:25 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:01:22 +0300
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
Subject: [PATCH v6 4/7] pinctrl: scmi: ignore PIN_CONFIG_PERSIST_STATE
Message-ID: <77357ddd5c96622e4be77c0b209206d5a59c9b05.1774283146.git.dan.carpenter@linaro.org>
References: <cover.1774283146.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774283146.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_120128_202703_EF365DF7 
X-CRM114-Status: GOOD (  13.79  )
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

The PIN_CONFIG_PERSIST_STATE setting ensures that the pin state persists
across a sleep or controller reset.  The SCMI spec does not have an
equivalent command to this so just ignore it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
v5: fix subsystem prefix
v4: Add r-b tags
v3: No change

 drivers/pinctrl/pinctrl-scmi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index de8c113bc61d..f22be6b7b82a 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -361,7 +361,7 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
 				    unsigned long *configs,
 				    unsigned int num_configs)
 {
-	int i, ret;
+	int i, cnt, ret;
 	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
 	enum scmi_pinctrl_conf_type config_type[SCMI_NUM_CONFIGS];
 	u32 config_value[SCMI_NUM_CONFIGS];
@@ -377,17 +377,21 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	cnt = 0;
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[i]);
+		if (param == PIN_CONFIG_PERSIST_STATE)
+			continue;
+		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[cnt]);
 		if (ret) {
 			dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 			goto free_config;
 		}
-		p_config_value[i] = pinconf_to_config_argument(configs[i]);
+		p_config_value[cnt] = pinconf_to_config_argument(configs[i]);
+		cnt++;
 	}
 
-	ret = pinctrl_ops->settings_conf(pmx->ph, pin, PIN_TYPE, num_configs,
+	ret = pinctrl_ops->settings_conf(pmx->ph, pin, PIN_TYPE, cnt,
 					 p_config_type,  p_config_value);
 	if (ret)
 		dev_err(pmx->dev, "Error parsing config %d\n", ret);
-- 
2.53.0


