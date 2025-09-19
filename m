Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B773ACAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 15:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mk5UbU1vmdkhvVI9gXoWyB4lbjlenJW2I4nrsVx97aE=; b=re0dUUFQVCKCcZL7mx8znvOPuN
	vRnkofrZ1u0WS/+CRdZPlSzYN0l5Lvf6LPILqKiIBjTrlfxru4JLVPM6CO48ZkzVDpjHhRXz+tnfR
	VoqD9ujQXk8eDPVHU+x5gx39h5L5NnlrGWqQftL6QbcXmAsIfj1m1f1SDgLY3w33UEObX+jIsLNzi
	39blPWKlSDfQ+dwZySS6UbEgvDJpQkjw8KIm/26Oea6OooYNARgeSTy6dWTOYU0x8O9ivRKbGTai4
	O9/L0bDo3t0AH+2JR5Hd2zAwxGGbjD3jCPTT/2RBGfpambL1HLqOvPZFvH2Vcb3WZrVsJ58kPlfQn
	gx1pDGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdOQ-00000003PFy-1nJh;
	Fri, 19 Sep 2025 15:51:26 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdOO-00000003PF4-0dbB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 15:51:25 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-46897c60e38so5529975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 08:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758297082; x=1758901882; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mk5UbU1vmdkhvVI9gXoWyB4lbjlenJW2I4nrsVx97aE=;
        b=n7wQWFSMGl7jX8VozybuC8YV3FWvduLBln/D8qlyX0eQJWv8Tb+5SbgdXxVhzbMY00
         Pw9ZczD5V8r9/Oo7sPQMyRbWJATdVKMG1DZEMdvtlyXME1e7fsT0IcAH7XERjCKpf4mf
         XKAx5zyHuGBUFxGxGKenGAlc3F0wcRXipPfZLoQ7j+HpVvtVrp42RzhyPx015afMmLna
         6jMug0oBunkd5FEBmZcSGk3FwoL+CQv0OPHfN3Y0YfgDgIUkSx6TMKpY2MpogFbm0V3O
         pHSoHwEfCZ11b40CLDq63qpEaOoaWCisxMcfU03qSW/uF4MfaP2dAXn5H/Qd76xvgHui
         iftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758297082; x=1758901882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mk5UbU1vmdkhvVI9gXoWyB4lbjlenJW2I4nrsVx97aE=;
        b=cIC2URbpMFpb2/1BpPaelXkRTsIRGgqnRJ2YvhJd9J89X5C76kJ1ASTrYxaMdfm2uo
         EMyspb2bOBhBZP83ZESAzYdN9N9zYEKg3CpVLvlSRrp/LoQokJvKZ6ZPXgr1AZJHMGgR
         3DHHQSdMG8q22b8tZKTfFogD+Uegc1tBuWG3jYjIcRpw71s7wa1Meu92dK4t1RsOMfjL
         E/BBe2YmosOhwdc9PgYq+3REFDT5JqHFjf2BSQXxJpfRugEYfGlGU6tlBEg8Cvcek/dT
         iaclbGAu2ambtV+XdzT2V9UMbEvM/vlepwx6cnlrdKvcS2ZbTctEIXOiSICc61lRShLN
         1szw==
X-Forwarded-Encrypted: i=1; AJvYcCVu0HNVJlCD49F4krPamLyMHjN8EugUThgi6WT1OyaikznhBPEWX1ed1i1X6bZByDcQ92B3HElSn1FcMda60phY@lists.infradead.org
X-Gm-Message-State: AOJu0YytRV+pvhTqC0t3dqjnFi5DMqh9xc6rzicYd4R3Lms6WxQowrko
	DzSjPZ98Md4WkET+Lf0oRuBlapTtSIwm1OPFjG1M798ZxJi4wFBjBucLA6PW/aEw/pU=
X-Gm-Gg: ASbGncuS/GzDpb3pUMcTFsyd+lW/6vXkOOR9HwfdG1+EjnS3MPGOqFQVLQqujofpElP
	r6z9gpFU7Aey4wxqS8RKJdqxFyyJ+Q/M1b0GyNMXM9KF/xLa2ScTzsg2cJKawvoaK0eoq2cXsma
	p+TEf1RraXpniuijpDgPepnxNYs5C8JLpAVdJXFUVMp0kRaPZIx4i49yxB/Ci5yf+Ovphepg/NS
	ifYQneuFcVSrnO51yO1VXsSrMumJLct/VNkYDkbYi8o6vsT0y40CRjFQ6GQkNLCvSN79p4PxirV
	AMxPipHqj282KWVWbR5aBwkYOSsc7VDyGMP9gE25HXyguO5+uvJ49fytXMbeWyCM7dA5ohmo0xG
	TjZqPKspAPZRSJrztwyet1TJsv8FX/9cwFHnUP+KYgvjFOq1FZAKNen/RL4hBs1qm8zorPljL1b
	wgnQ==
X-Google-Smtp-Source: AGHT+IEottwmKNmGH3CS9GghPYQKwlqbFMuq8pbSqNH1dciybusPD40QQuLbFVR/u9qMf8tPOI+eLA==
X-Received: by 2002:a05:600c:350d:b0:45f:2843:e779 with SMTP id 5b1f17b1804b1-467ee3057d8mr35673815e9.8.1758297082008;
        Fri, 19 Sep 2025 08:51:22 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:8ffd:205a:6719:49c1? ([2a05:6e02:1041:c10:8ffd:205a:6719:49c1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-469bd07268csm13103315e9.14.2025.09.19.08.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 08:51:21 -0700 (PDT)
Message-ID: <d9392dbc-806a-41df-8992-28c3d6132309@linaro.org>
Date: Fri, 19 Sep 2025 17:51:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] thermal: qoriq: add i.MX93 tmu support
To: Jacky Bai <ping.bai@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Alice Guo <alice.guo@nxp.com>, Frank Li <Frank.Li@nxp.com>
References: <20250821-imx93_tmu-v4-0-6cf5688bf016@nxp.com>
 <20250821-imx93_tmu-v4-2-6cf5688bf016@nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250821-imx93_tmu-v4-2-6cf5688bf016@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_085124_230317_3E998401 
X-CRM114-Status: GOOD (  28.31  )
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

On 21/08/2025 08:23, Jacky Bai wrote:
> For Thermal monitor unit(TMU) used on i.MX93, the HW revision info read
> from the ID register is the same the one used on some of the QorIQ
> platform, but the config has some slight differance. Add i.MX93 compatible
> string and corresponding code for it.
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>   - v4 changes:
>    - no
> 
>   - v3 changes:
>    - use the drv data struct for match data and refine the code
>    - update the copyright
> 
>   - v2 changes:
>    - use the compatible match data to identify the i.MX93 TMU variant
> ---
>   drivers/thermal/qoriq_thermal.c | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/qoriq_thermal.c b/drivers/thermal/qoriq_thermal.c
> index 01b58be0dcc64d14ca5e4bba654eed8f15e827fc..b2e634547271dcf512c714907baa162921d2d527 100644
> --- a/drivers/thermal/qoriq_thermal.c
> +++ b/drivers/thermal/qoriq_thermal.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0
>   //
>   // Copyright 2016 Freescale Semiconductor, Inc.
> +// Copyright 2025 NXP
>   
>   #include <linux/clk.h>
>   #include <linux/err.h>
> @@ -24,6 +25,7 @@
>   #define TMTMIR_DEFAULT	0x0000000f
>   #define TIER_DISABLE	0x0
>   #define TEUMR0_V2		0x51009c00
> +#define TEUMR0_V21		0x55000c00
>   #define TMSARA_V2		0xe
>   #define TMU_VER1		0x1
>   #define TMU_VER2		0x2
> @@ -66,6 +68,8 @@
>   						   */
>   #define REGS_V2_TEUMR(n)	(0xf00 + 4 * (n))
>   
> +#define GET_TEUMR0(drvdata)	(drvdata && drvdata->teumr0 ? drvdata->teumr0 : TEUMR0_V2)

This is not adequate for code which will evolve. Please don't use this 
macro.

>   /*
>    * Thermal zone data
>    */
> @@ -73,12 +77,17 @@ struct qoriq_sensor {
>   	int				id;
>   };
>   
> +struct tmu_drvdata {
> +	u32 teumr0;
> +};
> +
>   struct qoriq_tmu_data {
>   	int ver;
>   	u32 ttrcr[NUM_TTRCR_MAX];
>   	struct regmap *regmap;
>   	struct clk *clk;
>   	struct qoriq_sensor	sensor[SITES_MAX];
> +	const struct tmu_drvdata *drvdata;

The drvdata pointer is not usually used.

	u32 model;

>   };
>   
>   static struct qoriq_tmu_data *qoriq_sensor_to_data(struct qoriq_sensor *s)
> @@ -234,7 +243,7 @@ static void qoriq_tmu_init_device(struct qoriq_tmu_data *data)
>   		regmap_write(data->regmap, REGS_TMTMIR, TMTMIR_DEFAULT);
>   	} else {
>   		regmap_write(data->regmap, REGS_V2_TMTMIR, TMTMIR_DEFAULT);
> -		regmap_write(data->regmap, REGS_V2_TEUMR(0), TEUMR0_V2);
> +		regmap_write(data->regmap, REGS_V2_TEUMR(0), GET_TEUMR0(data->drvdata));

		
	regmap_write(data->regmap, REGS_V2_TEUMR(0), data->model);
>   	}
>   
>   	/* Disable monitoring */
> @@ -319,6 +328,8 @@ static int qoriq_tmu_probe(struct platform_device *pdev)
>   
>   	data->ver = (ver >> 8) & 0xff;
>   
> +	data->drvdata = of_device_get_match_data(&pdev->dev);
> +
>   	qoriq_tmu_init_device(data);	/* TMU initialization */
>   
>   	ret = qoriq_tmu_calibration(dev, data);	/* TMU calibration */
> @@ -376,9 +387,14 @@ static int qoriq_tmu_resume(struct device *dev)
>   static DEFINE_SIMPLE_DEV_PM_OPS(qoriq_tmu_pm_ops,
>   				qoriq_tmu_suspend, qoriq_tmu_resume);
>   
> +static const struct tmu_drvdata imx93_data = {
> +	.teumr0 = TEUMR0_V21,
> +};
> +

Do the change for everyone

static const struct tmu_drvdata imx8mq_data = {
	.model = TEUMR0_V2,
};

static const struct tmu_drvdata qoriq_data = {
	.model = TEUMR0_V2,
};

>   static const struct of_device_id qoriq_tmu_match[] = {
>   	{ .compatible = "fsl,qoriq-tmu", },
>   	{ .compatible = "fsl,imx8mq-tmu", },
> +	{ .compatible = "fsl,imx93-tmu", .data = &imx93_data },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, qoriq_tmu_match);

Thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

