Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74192C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 06:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niNHoCAD7J8kEKqHZYZsWT3+mUywaPXwVxq01jkz2d4=; b=gko7ywfsUlBbXs0I6AQCk0Oz0s
	TFcJYAaNxz0SX2S3Zm0Vpwpm2nNmNk2I4vuRSxe9HzvP3LxzRkXSP1UPqhv3wQaPNsgXqVMMJiHuK
	1JqMnzJU7GRwPSDowUf2uKzKFLabrWw/jm4IVgH7xVzjPjVl2kWfCe/dE02WLWyyLbpxVFrAR8l6R
	doRhIe/HRYfwLHmSkMzFnR73zwSwOOo7zbI8QTMX9bdhzbFdl6dM3InsThamhHz2DNqbSFKOYJU9o
	upXyPLZv4M8LD+OGb4n2HplIfjTR6Y7emDUhnygf2fICZz/H7P10Bfhlna1BoNowhTj6Lu9KGX05q
	QWiCmVLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uge6x-0000000G33H-0F0E;
	Tue, 29 Jul 2025 06:46:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uge2x-0000000G2dP-2ECc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 06:42:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DFDF601DF;
	Tue, 29 Jul 2025 06:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2506C4CEEF;
	Tue, 29 Jul 2025 06:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753771366;
	bh=rz7sPehGGQwD9/qaMbd8+aH/afiOwr4+TclPx58XHHA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B2o9KbMYMWN/1B+HcRZbHDgoyCY6b8vnVOCABigY/JEXx5RYm/Xelyhl2ULSiZA9+
	 ruqnTeuzQ9GCY4tZqAnVjUrlzta1ydFdoMScWz8ydceCX2MY9EwFxsxhgA4C2Ixoba
	 9e/n4foui3dN+MkdIlcImC4gV5/2OflGuPXpaTQ+iXUWp7cZ6NJk6Qdl7Bwmg+/4Ug
	 g0FRl2LNpPLQW6I98r2JZSiEanQWS8inwjxTlQkpjB/lsFN/TaYoWEPzcpRagf8Q8X
	 +fa/VMiLOpGna/I+suXIv83RFuneaNCILIpf/tdgjvbFZ62Z7ZbSG84xSc2pBkSrRZ
	 DnHwPIXNgfeXw==
Message-ID: <21ce4f23-8aec-486f-8fbb-021c1e114908@kernel.org>
Date: Tue, 29 Jul 2025 08:42:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] thermal: qoriq: add i.MX93 TMU support
To: Jacky Bai <ping.bai@nxp.com>, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 kernel@pengutronix.de, festevam@gmail.com
References: <20250729024039.1223771-1-ping.bai@nxp.com>
 <20250729024039.1223771-2-ping.bai@nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250729024039.1223771-2-ping.bai@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 29/07/2025 04:40, Jacky Bai wrote:
> The TMU used on i.MX93 need some speccial handling and workaround to be
> done even the revision info read from the ID register is the same as
> Qoriq platform. Add i.MX93 compatible string and corresponding code for it.
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  drivers/thermal/qoriq_thermal.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/thermal/qoriq_thermal.c b/drivers/thermal/qoriq_thermal.c
> index 01b58be0dcc6..fc1bf102350d 100644
> --- a/drivers/thermal/qoriq_thermal.c
> +++ b/drivers/thermal/qoriq_thermal.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  //
>  // Copyright 2016 Freescale Semiconductor, Inc.
> +// Copyright 2022-2025 NXP
>  
>  #include <linux/clk.h>
>  #include <linux/err.h>
> @@ -24,9 +25,11 @@
>  #define TMTMIR_DEFAULT	0x0000000f
>  #define TIER_DISABLE	0x0
>  #define TEUMR0_V2		0x51009c00
> +#define TEUMR0_V21		0x55010c00
>  #define TMSARA_V2		0xe
>  #define TMU_VER1		0x1
>  #define TMU_VER2		0x2
> +#define TMU_VER93		0x3
>  
>  #define REGS_TMR	0x000	/* Mode Register */
>  #define TMR_DISABLE	0x0
> @@ -232,6 +235,9 @@ static void qoriq_tmu_init_device(struct qoriq_tmu_data *data)
>  
>  	if (data->ver == TMU_VER1) {
>  		regmap_write(data->regmap, REGS_TMTMIR, TMTMIR_DEFAULT);
> +	} else if (data->ver == TMU_VER93) {
> +		regmap_write(data->regmap, REGS_V2_TMTMIR, TMTMIR_DEFAULT);
> +		regmap_write(data->regmap, REGS_V2_TEUMR(0), TEUMR0_V21);
>  	} else {
>  		regmap_write(data->regmap, REGS_V2_TMTMIR, TMTMIR_DEFAULT);
>  		regmap_write(data->regmap, REGS_V2_TEUMR(0), TEUMR0_V2);
> @@ -319,6 +325,9 @@ static int qoriq_tmu_probe(struct platform_device *pdev)
>  
>  	data->ver = (ver >> 8) & 0xff;
>  
> +	if (of_find_compatible_node(NULL, NULL, "fsl,imx93-tmu"))
> +		data->ver = TMU_VER93;

No, you have driver match data for this.

Anyway, are you sure devices are compatible how you expressed in the
bindings?

> +
>  	qoriq_tmu_init_device(data);	/* TMU initialization */
>  
>  	ret = qoriq_tmu_calibration(dev, data);	/* TMU calibration */
> @@ -379,6 +388,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(qoriq_tmu_pm_ops,
>  static const struct of_device_id qoriq_tmu_match[] = {
>  	{ .compatible = "fsl,qoriq-tmu", },
>  	{ .compatible = "fsl,imx8mq-tmu", },
> +	{ .compatible = "fsl,imx93-tmu", },

Otherwise I claim devices are compatible and this should be dropped.



Best regards,
Krzysztof

