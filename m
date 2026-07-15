Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A5FC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 07:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0D6+b7NIcI0cE6mu1KZnMkeelwn9bdYbGTnJWKwkR6w=; b=C2NDoiu6jS2D/tsxm3USm5FUzn
	PjfgaGDJvH9XgD3ooz/mP/24+jJqodArYxM8Ns1xnusLwpp/o4LX/Q9Xna3RXCg/rt1j2Fqr8y5Ey
	jYPqaKEGm5kjK1r0Mnz1EtI7RbUY2jWdWAEyRSvib9JDtOPP3oZPVrRbo3iXBrAk70pvRcmDWnWoV
	Z8rldoP+rk0NIP2jHiDdcxYM7iUe0B5islHIaeQFPfS3XarBVxHFSCswrIU433Mku/DiG2yvcu5k+
	bzYm/kDJ01Ir9WMsUhA3uTKmvr9x6m63sRBuogn8wTWIYVskLsijHVKo4s2U7e6yzNOxCKl+VaFu6
	dXiMa5RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wju3f-0000000E1iH-3oSH;
	Wed, 15 Jul 2026 07:29:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wju3d-0000000E1gr-2vYN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 07:29:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE8D5152B;
	Wed, 15 Jul 2026 00:29:23 -0700 (PDT)
Received: from [10.57.2.177] (unknown [10.57.2.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58BF33F915;
	Wed, 15 Jul 2026 00:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784100567; bh=MsXvHNOp7jRLeDUmwfDBA82AWHhFNBc6/5erc1wQXKY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QsxDWt3KD0gLwwOVoSwz6F9QcdMXkaoZzWSEXTWUDIGD8Wbyn3D8MGU6B6LhHga5H
	 7BIEM0JS4ez1HsCRWPMHhfRoAtjGUsdKSVU/XGI2BRVs6ji9U/sUxioC0KlqV7r46w
	 n5UTC4yHj6i0ZuJHGmRoDUwkvaiT8cfh48r7v5Eo=
Message-ID: <a886ad87-d17a-4ace-8388-fab5c4c2ba3c@arm.com>
Date: Wed, 15 Jul 2026 08:29:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] thermal/drivers/imx: Fix rounding and clamp for
 i.MX7D alarm
To: Haoning.CHENG@cn.bosch.com
Cc: linux-pm@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>
References: <20260714-b4-symana21-11221-imx-thermal-support-upstream-6-18-v8-0-d54d8690e16e@cn.bosch.com>
 <20260714-b4-symana21-11221-imx-thermal-support-upstream-6-18-v8-2-d54d8690e16e@cn.bosch.com>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20260714-b4-symana21-11221-imx-thermal-support-upstream-6-18-v8-2-d54d8690e16e@cn.bosch.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_002929_859379_BB9B2130 
X-CRM114-Status: GOOD (  17.60  )
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



On 7/14/26 11:28, Haoning CHENG via B4 Relay wrote:
> From: Haoning CHENG <Haoning.CHENG@cn.bosch.com>
> 
> Convert the alarm temperature from millicelsius to degrees for i.MX7D
> using ceiling division instead of integer division, ensuring rounding
> errors do not cause the alarm to trigger below the intended threshold.
> Use DIV_ROUND_UP() for non-negative values and plain integer division
> for negative values, since C rounds toward zero which is equivalent to
> ceiling when the divisor is positive.
> 
> Add clamp() to ensure the hardware register value stays within the 9-bit
> range (0..0x1ff) of the i.MX7D alarm field, preventing silent truncation
> if an out-of-range value is written.
> 
> Signed-off-by: Haoning CHENG <Haoning.CHENG@cn.bosch.com>
> ---
>   drivers/thermal/imx_thermal.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
> index 38c993d1bcb3..7f7d1116b9d6 100644
> --- a/drivers/thermal/imx_thermal.c
> +++ b/drivers/thermal/imx_thermal.c
> @@ -240,10 +240,16 @@ static void imx_set_alarm_temp(struct imx_thermal_data *data,
>   
>   	data->alarm_temp = alarm_temp;
>   
> -	if (data->socdata->version == TEMPMON_IMX7D)
> -		alarm_value = alarm_temp / 1000 + data->c1 - 25;
> -	else
> +	if (data->socdata->version == TEMPMON_IMX7D) {
> +		if (alarm_temp >= 0)
> +			alarm_temp = DIV_ROUND_UP(alarm_temp, 1000);
> +		else
> +			alarm_temp /= 1000;
> +		alarm_value = alarm_temp + data->c1 - 25;
> +		alarm_value = clamp(alarm_value, 0, 0x1ff);
> +	} else {
>   		alarm_value = (data->c2 - alarm_temp) / data->c1;
> +	}
>   
>   	regmap_write(map, soc_data->high_alarm_ctrl + REG_CLR,
>   		     soc_data->high_alarm_mask);
> 

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

