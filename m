Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283AC1094468
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 10:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5nvE2qXP7SXrFq3OejPF5HK1aF/+SsVNdOeY2ld3e5k=; b=eIyBxeE/25Iir1SZSaOWXfi4gK
	thS3C+hn56w2R9e6FWT6/f1Uj8esJ9AVjChnjebJn0euh7bs+DmvBy9Ra0w5RFgfLa0PPnjXrQ6zv
	Cxr1hXqzPxF8Y+3vy3U6TbOU4tIoG39lo2ozRiSXDVWT9tdLyWMCkeP6suHdSw/rComP22i4dQOBl
	+qBP3E2xuWra0kltKKuryLZh6rQqTsp9T73nZO1NMCSAeSqmqwLW/3IkhL2ZCocS10XDYAmQj/2iL
	03uouFEy+E3UBMoKAgv3iVqwWdUYzXtVwEXQAi9J+tbQ1syxfAkEtRpay/jBSt0Qtg3DsiDccwk7Q
	EpLIv7/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3tLC-0000000EL0Y-1vzt;
	Sat, 21 Mar 2026 10:13:58 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3tL9-0000000EKzI-2LVz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 10:13:56 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso1769139f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Mar 2026 03:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774088031; x=1774692831; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5nvE2qXP7SXrFq3OejPF5HK1aF/+SsVNdOeY2ld3e5k=;
        b=q0Qa/z5YLXF6vDE787olCGTm3Jj8mY4rCCUopPgKe1ohaJ5flkzkhbtT/ouTJ7AflT
         XxCvbeDn+thD0bGrJzZPhzAOcKL2vDo5ZRDQGd9J4ojsMUDmoirMp3Onvw8WmOt58g5+
         XZqgCJHUAVcZxWRNOnPlNgGI51sHuMAEUS3cTrjUETDDIQexsfTwColQTo5HddRiPR0S
         /HYtiI85gPcdB08Pk23PJW1+F0jNfaCCWMROQ8SuLj7Lhd0ISzVie77mm8M5Ue1fiAAr
         K/xbiBsECA2DgMFtS3vXhXgR+WJMMWU3LSX7wzV7JUNoENIzDvKb23AiwCaUroSssoVW
         a+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774088031; x=1774692831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nvE2qXP7SXrFq3OejPF5HK1aF/+SsVNdOeY2ld3e5k=;
        b=e9Lm+oPadJeRErRRHNtt8O/RCKdlIjmC9WRnghDKrnMgvklwAPEWEPwCfmAAxUKYjv
         FIlrMM9D39jntbVwLMdFrwCSkT7pbl/DbqnpHu1LpZnFusAPCDIEVfPmPk4beg1Z4mQH
         zVg+x5yZeM5fh/o5Bs/dTeM6a5MVhRpDb5jVhWXCBcMlMIQA2swffXJPy498BMHbJrIF
         nWlRPrtZOpqOT8SibAZUtdq/NdiZCi0fhj7dcT7/AaLSPqdjBLg7YI7RCBDw2Pg1y/6i
         dPprlMKDpZkgEJT+8uG/OcI4Qx48U8Hxra3yGIwKiU0UEWoIz3VMreqPSHai5ecsCcvA
         eNkg==
X-Forwarded-Encrypted: i=1; AJvYcCU7WADFJMS4UJTlwTFSeRcix3ITKgA+EldIbI2bV/8t4D/2KdEip+wNsL8vkDr0aIMZdEqBxSqtkYp8Y+X+iFAZ@lists.infradead.org
X-Gm-Message-State: AOJu0YylgNJXgSZfFa2Pk/tDvYALANCevHDceQ/8tWcSq5y3LSFb8sP7
	0LxJNCnrjbeAwEKaTu04J2YWQ4fD0oyGRka45IctaXNwfPOb48oUK/hHHBWVBQBRV54=
X-Gm-Gg: ATEYQzywxG4pay58NZBMXDbNQ3Vtn1o0rtb6pxKF5PURrqA4WkOmcsAwBPnF+dhrqPv
	IfHBIltxw28dj5V3oqnwM2J8IxAw3cs8xTHNo385OXyl5mOIeypQ6GIqKxAjTFcxmbSacfgTALl
	XYsSmeCTheAKhyAKV3lXPHjQbMQQVQoT3lTDNl6m68dTE9Sq1MOtWpds4OKUaYjElN1LFP/+Sgg
	QBx4cGEYh+IaVMXqrkLDzXYyAe9H5/r2AOcpbTvcPXj7pYIM9XzomEMD6yN5lEUhR4S5CoefxUv
	24bW3Xcrb4MRVnOVDgnD88lV/iX8iMlEkTpF1nS5Vv1dKazsKQ2FtO7cgI7Ytw0/fukUpWHOcql
	IzOD2q7fwhULeM9At603DeYgEw4FdCKMPZoMR0Az0G8h6qE9NUY34DgmunrgUXZAMCAVqlBW49u
	0GczeJmoXIV4Y8O3xV2dA0SgXkQndv
X-Received: by 2002:a05:600c:4e8e:b0:483:c35d:3659 with SMTP id 5b1f17b1804b1-486fee04a48mr82485135e9.18.1774088030748;
        Sat, 21 Mar 2026 03:13:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8159dcsm47760825e9.0.2026.03.21.03.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 03:13:50 -0700 (PDT)
Date: Sat, 21 Mar 2026 13:13:47 +0300
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
Subject: [PATCH v5 4/7] pinctrl: scmi: ignore PIN_CONFIG_PERSIST_STATE
Message-ID: <6087ce1233834f554de6f1941ff5bc85ffa059a0.1774087290.git.dan.carpenter@linaro.org>
References: <cover.1774087290.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774087290.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_031355_626145_C0617185 
X-CRM114-Status: GOOD (  13.36  )
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
2.51.0


