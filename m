Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD329C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 14:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7WQ85ZwzaG+oLmFcTwxrBQ9U7/3N21t4CiCD3HZPOo=; b=Z8FUFf/q4Qfzx1ZH/YiRS12/M3
	bnH6UVnLXC08lRGnok6IEwLsENh7udUdl1+SjfrGBN//UK/LUIhBO3PfZpTnJX4iMDI0rlpqkY+ap
	DgYW6SQbCnlelfSTLtMSSGz4J3FNyCZ/4y751tV8fwfvJBnAdkOw3HFVoZMXw339beRpHxSKauwUw
	Io6h7VjzNHW2+EDmwWViT13U4lz8PrcBCKHmOdp6sVneqnD8TOT5hIranxOzqNrKJdzHjTerMEO+3
	4ZsKpzvMTmM0W58MOI4XLcFzOpwuvs4YBNOG8CxwEVv8IA4bgWIZwB/cqcNaz+fwhSCPfD/MrAkOu
	8Kd1eAiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hkA-0000000Bwjo-2th1;
	Fri, 04 Apr 2025 14:10:02 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hZo-0000000Buuy-1G63
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 13:59:22 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso10745235e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 06:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743775158; x=1744379958; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K7WQ85ZwzaG+oLmFcTwxrBQ9U7/3N21t4CiCD3HZPOo=;
        b=BB5JaaoSTqedOQfiy0zeibk0EH3FBwfRJXkAKopJ4gwqpdvD7FwhWqpzh0AlDGJXxC
         bDbF2Ju7M3+o/Jzx8QMcSQ8QJLU7Z9ud8qzsipaLR36hJQQ8LorX86TFB4uYM7DH5YFD
         pskvHV2TLhFRcL4wrrn35a/v1LGGvWYSE4wLTTOSgMNJzjYIhsn1Ja728qrD8lI7hPsP
         AOiaoK8gE1URpFaoDeYloOoP8en7jNT7OY6QVKe3qR8Zr22tfXFHabBqLsHv7jOviCTO
         hOBvTBA74iP/TWAxQ9j9gpSTSC8Xi4QXUqI/T5GDMRGNzK5dD9X3QLGoJYTRoFunwNyf
         p5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743775158; x=1744379958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7WQ85ZwzaG+oLmFcTwxrBQ9U7/3N21t4CiCD3HZPOo=;
        b=qyrTDVZRV+Y6PT7ujmBtB/apgCj3Zg46gDyI36gpw85yGhG+vjAyRB4JwAzdtxr+xT
         eMmE2rl3VwTrhD1RpbkDzL1ttmARNvZJ1Q2aQT5pzy/I1UL9ll4JAA/BpSaqixxmDhBV
         0iSsec1St/GOZjeQ1lV049TOE7rpTMZmdZNX+zaZFXm3/eNhOqxIxXdx5SwDk+0pgcI/
         Uel8KaySsqb0kQc/ELj2gK2t/dXAOC3wkbY0NjrJeSy8hbqI3JrFQt/G3E+eaGqfij98
         fTWo9ArDTZMyaqwVFwNpFT7LRC7mfGIMBYLbjzvzOSSXESKdeo2WgSVHfqhZECpRxXze
         Y/PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA8ZRhrZ/moUhzI2Bv4IKsDZwXYHMA5BgKx8FtIZXZz/WgO61N6aoD5EjUec65lj9zCFVB7FVGPqskQomoHgRt@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfw1jqXKtUrTmLEhgXsvUW1oJyrx5g3Dg4NvHv0BYjSFmBzfLG
	DOGvOl4SkyASrr3rnuo2NI4ZAzTb80FQjl8uk8KEfmAENMc4fmK5
X-Gm-Gg: ASbGncuVK5/j34f80mk6lQce+i8fxYKIKHru567qRqT8eAyRfATECLyLv7ukW4RM7kF
	BRg9rU80tQgtNz0UboOxo6yjwTF67zwGvAlUgqZaKlvXmrKveuK9zf9U4L425c+7XF11Pm6F2uH
	HPSzxftFcs6iregoOQ4ddsjS4CG49gejPTyVTha6mHgBAGqVWNj05Ao+Z7EJcPcGUjZwCQ8C92K
	QOs8ug753HjV/tgSABdvTuSX7s9KCMMsiC4w0u8/BzcGf+ogJm6T6XWpptQ8yTQ22Q5v+sJZocu
	/f7DEVpO5LUIJ8WjuyXpNKL7P6RNAKKmWZz5EjOCpQ4EuXkd8DgowYt8nZCQ6eMhhDn7dl1JhQ=
	=
X-Google-Smtp-Source: AGHT+IFMDjr8Pj3/DFumk8gQPXeQjRro++AUyJw2sQrTBIk2T7ULhdgksQGfttKQv2KG2mJ8OoPW5w==
X-Received: by 2002:a05:600c:4513:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-43ed0b5e246mr26591995e9.2.1743775157969;
        Fri, 04 Apr 2025 06:59:17 -0700 (PDT)
Received: from [192.168.1.132] ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bb7bfsm45945005e9.17.2025.04.04.06.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 06:59:17 -0700 (PDT)
Message-ID: <793d6a31-e3f9-456d-98cb-1622c48e6f38@gmail.com>
Date: Fri, 4 Apr 2025 16:59:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] bus: add driver for IMX AIPSTZ bridge
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
 <20250401154404.45932-4-laurentiumihalcea111@gmail.com>
 <12639974.O9o76ZdvQC@steina-w>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <12639974.O9o76ZdvQC@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_065920_346994_70968C4B 
X-CRM114-Status: GOOD (  28.17  )
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



On 4/3/2025 11:30 AM, Alexander Stein wrote:
> Hi,
>
> Am Dienstag, 1. April 2025, 17:44:01 CEST schrieb Laurentiu Mihalcea:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The secure AHB to IP Slave (AIPSTZ) bus bridge provides access control
>> configurations meant to restrict access to certain peripherals.
>> Some of the configurations include:
>>
>> 	1) Marking masters as trusted for R/W. Based on this
>> 	(and the configuration of the accessed peripheral), the bridge
>> 	may choose to abort the R/W transactions issued by certain
>> 	masters.
>>
>> 	2) Allowing/disallowing write accesses to peripherals.
>>
>> Add driver for this IP. Since there's currently no framework for
>> access controllers (and since there's currently no need for having
>> flexibility w.r.t the configurations) all this driver does is it
>> applies a relaxed, "default" configuration, in which all masters
>> are trusted for R/W.
>>
>> Note that some instances of this IP (e.g: AIPSTZ5 on i.MX8MP) may be tied
>> to a power domain and may lose their configuration when the domain is
>> powered off. This is why the configuration has to be restored when the
>> domain is powered on.
>>
>> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  drivers/bus/Kconfig      |  6 +++
>>  drivers/bus/Makefile     |  1 +
>>  drivers/bus/imx-aipstz.c | 92 ++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 99 insertions(+)
>>  create mode 100644 drivers/bus/imx-aipstz.c
>>
>> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
>> index ff669a8ccad9..fe7600283e70 100644
>> --- a/drivers/bus/Kconfig
>> +++ b/drivers/bus/Kconfig
>> @@ -87,6 +87,12 @@ config HISILICON_LPC
>>  	  Driver to enable I/O access to devices attached to the Low Pin
>>  	  Count bus on the HiSilicon Hip06/7 SoC.
>>  
>> +config IMX_AIPSTZ
>> +	tristate "Support for IMX Secure AHB to IP Slave bus (AIPSTZ) bridge"
>> +	depends on ARCH_MXC
>> +	help
>> +	  Enable support for IMX AIPSTZ bridge.
>> +
>>  config IMX_WEIM
>>  	bool "Freescale EIM DRIVER"
>>  	depends on ARCH_MXC || COMPILE_TEST
>> diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
>> index cddd4984d6af..8e693fe8a03a 100644
>> --- a/drivers/bus/Makefile
>> +++ b/drivers/bus/Makefile
>> @@ -15,6 +15,7 @@ obj-$(CONFIG_FSL_MC_BUS)	+= fsl-mc/
>>  
>>  obj-$(CONFIG_BT1_APB)		+= bt1-apb.o
>>  obj-$(CONFIG_BT1_AXI)		+= bt1-axi.o
>> +obj-$(CONFIG_IMX_AIPSTZ)	+= imx-aipstz.o
>>  obj-$(CONFIG_IMX_WEIM)		+= imx-weim.o
>>  obj-$(CONFIG_INTEL_IXP4XX_EB)	+= intel-ixp4xx-eb.o
>>  obj-$(CONFIG_MIPS_CDMM)		+= mips_cdmm.o
>> diff --git a/drivers/bus/imx-aipstz.c b/drivers/bus/imx-aipstz.c
>> new file mode 100644
>> index 000000000000..44db40dae71b
>> --- /dev/null
>> +++ b/drivers/bus/imx-aipstz.c
>> @@ -0,0 +1,92 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright 2025 NXP
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>> +
>> +#define IMX_AIPSTZ_MPR0 0x0
>> +
>> +struct imx_aipstz_config {
>> +	u32 mpr0;
>> +};
>> +
>> +static void imx_aipstz_apply_default(void __iomem *base,
>> +				     const struct imx_aipstz_config *default_cfg)
>> +{
>> +	writel(default_cfg->mpr0, base + IMX_AIPSTZ_MPR0);
>> +}
>> +
>> +static int imx_aipstz_probe(struct platform_device *pdev)
>> +{
>> +	const struct imx_aipstz_config *default_cfg;
>> +	void __iomem *base;
>> +
>> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
>> +	if (IS_ERR(base))
>> +		return dev_err_probe(&pdev->dev, -ENOMEM,
>> +				     "failed to get/ioremap AC memory\n");
>> +
>> +	default_cfg = of_device_get_match_data(&pdev->dev);
> Shouldn't you use the configuration setup by trusted firmware (TF-A)?


not sure I see the value in doing that? the TF-A configuration will be overriden
anyways if an AC API is ever introduced in Linux. Also, for AIPSTZ5, you'd need to:

1) Make sure the AUDIOMIX domain is not power cycled before latching on to the
TF-A configuration otherwise you'll lose it.

2) Add an extra step in which you actually configure the bridge's AC from TF-A since
it's not ATM.

I'm not sure why you'd want to do that when you can just set the configuration directly
from Linux?


>
>> +
>> +	imx_aipstz_apply_default(base, default_cfg);
>> +
>> +	dev_set_drvdata(&pdev->dev, base);
>> +
>> +	pm_runtime_set_active(&pdev->dev);
>> +	devm_pm_runtime_enable(&pdev->dev);
>> +
>> +	return devm_of_platform_populate(&pdev->dev);
>> +}
>> +
>> +static int imx_aipstz_runtime_resume(struct device *dev)
>> +{
>> +	const struct imx_aipstz_config *default_cfg;
>> +	void __iomem *base;
>> +
>> +	base = dev_get_drvdata(dev);
>> +	default_cfg = of_device_get_match_data(dev);
>> +
>> +	/* restore potentially lost configuration during domain power-off */
>> +	imx_aipstz_apply_default(base, default_cfg);
> Shouldn't you store the configuration at suspend and restore that one
> instead of this fixed one?

you're only using the fixed configuration here and you're not modifying it anywhere
so no need to save it during suspend.

>
> What's going to happen if trusted firmware decides that Cortex-A53 domain
> is not allowed to access AIPSTZ?

then you'll get a bus fault and will have to model AIPSTZ as just AIPS via the devicetree
(like we do for AIPSTZ1-AIPSTZ4 right now)

