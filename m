Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A11C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 17:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/R+k38EavnnLqI4ME3aQthwcfO1+fuRzyD+GV3fSk4=; b=i/K3dirp+/bD0/h2Uuf/T1+VoW
	xbfpHQhiP8aywNMtkrjTatAElxo4AFW2WX4bbCLTdXZFwRB6vJlggbOy4BXItypdMdKDyG1TUtw4J
	FR+FLT/AsQRhB1usr5/BePSfQ2cUVeJpsFKwazMXgzQvHvHlwoxNmRF+Cb34jlD/XjHcEKtkdzzx7
	g6TKzxbkxvikIMQyES7qTzKQ78Ih1e229BL1Ta1kwzSrgbvNXsiaZv0r1karhx9mYqAhJq5AI26Ls
	+wbAl5g4j6mM4n8t+CdklBx+14vxneMKu/wWYoG0XDtrbHuuq90SYipqAJ3RJxH1fd3t4k2StvuQQ
	UqsU5O+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm9k-0000000Bz4S-3Zjq;
	Thu, 13 Mar 2025 17:15:40 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm1w-0000000Bvdp-1Pla
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 17:07:38 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DGD84J004017;
	Thu, 13 Mar 2025 18:07:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	m/R+k38EavnnLqI4ME3aQthwcfO1+fuRzyD+GV3fSk4=; b=2+g7dDtPyxMq1Shu
	QHC7J6eyC/YvBdFdAZwurWUHHOA6LbrJL32RrgKtq6u5ob9qxTvRk5bJnUVgh8Bh
	fuL7OIC6gBf4neJDK0XG6x0vLfIzJOPucsEIuA+AefRNN1/Tuc5P5s+cnZ1BhBtI
	q5WeCk4l+oVW8Gj7CMC2somyp35Ih/UhvZkznVvVOmoxkw/vAKm4LW+OWDwHN8pC
	WLkSntmDkbrr9nk82zbtKDLviuYVMp2hghusryDe1xQFlabxomansar33G0yJIzX
	HwdVxqOZpfB1NNjLgHBkwR/1Z3jQkjXWn0WqW4/vjeQYpH+q7pcfT+BUaXVFZ9sD
	5eitpA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45c2pf07ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 18:07:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9EAC94002D;
	Thu, 13 Mar 2025 18:05:58 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C1DE757D4E3;
	Thu, 13 Mar 2025 18:04:27 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 18:04:27 +0100
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 18:04:26 +0100
Message-ID: <c0aec002-7889-4ec5-a438-e7e90d8da13f@foss.st.com>
Date: Thu, 13 Mar 2025 18:04:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] clocksource: stm32-lptimer: add support for
 stm32mp25
To: Daniel Lezcano <daniel.lezcano@linaro.org>, <lee@kernel.org>,
        <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jic23@kernel.org>, <tglx@linutronix.de>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <devicetree@vger.kernel.org>,
        <wbg@kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>
References: <20250305094935.595667-1-fabrice.gasnier@foss.st.com>
 <20250305094935.595667-5-fabrice.gasnier@foss.st.com>
 <83283a94-6833-4d7d-8d89-6ba42b43b96c@linaro.org>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <83283a94-6833-4d7d-8d89-6ba42b43b96c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_08,2025-03-11_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_100737_003595_1DEA1318 
X-CRM114-Status: GOOD (  21.40  )
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

On 3/7/25 16:12, Daniel Lezcano wrote:
> On 05/03/2025 10:49, Fabrice Gasnier wrote:
>> On stm32mp25, DIER (former IER) must only be modified when the lptimer
>> is enabled. On earlier SoCs, it must be only be modified when it is
>> disabled. Read the LPTIM_VERR register to properly manage the enable
>> state, before accessing IER.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>> ---
>> Changes in V2:
>> - rely on fallback compatible as no specific .data is associated to the
>>    driver. Use version data from MFD core.
>> - Added interrupt enable register access update in (missed in V1)
>> ---
>>   drivers/clocksource/timer-stm32-lp.c | 26 ++++++++++++++++++++++----
>>   1 file changed, 22 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clocksource/timer-stm32-lp.c
>> b/drivers/clocksource/timer-stm32-lp.c
>> index a4c95161cb22..96d975adf7a4 100644
>> --- a/drivers/clocksource/timer-stm32-lp.c
>> +++ b/drivers/clocksource/timer-stm32-lp.c
>> @@ -25,6 +25,7 @@ struct stm32_lp_private {
>>       struct clock_event_device clkevt;
>>       unsigned long period;
>>       struct device *dev;
>> +    bool ier_wr_enabled;    /* Enables LPTIMER before writing into
>> IER register */
>>   };
>>     static struct stm32_lp_private*
>> @@ -37,8 +38,15 @@ static int stm32_clkevent_lp_shutdown(struct
>> clock_event_device *clkevt)
>>   {
>>       struct stm32_lp_private *priv = to_priv(clkevt);
>>   -    regmap_write(priv->reg, STM32_LPTIM_CR, 0);
>> +    /* Disable LPTIMER either before or after writing IER register
>> (else, keep it enabled) */
>> +    if (!priv->ier_wr_enabled)
>> +        regmap_write(priv->reg, STM32_LPTIM_CR, 0);
>> +
>>       regmap_write(priv->reg, STM32_LPTIM_IER, 0);
>> +
> 
> Why not encapsulate the function ?
> 
>     regmap_write_ier(struct stm32_lp_private *priv, int value)
>     {
> 
>         /* A comment ... */
>         if (!priv->ier_wr_enabled)
>             regmap_write(priv->reg, STM32_LPTIM_CR, 0);
> 
>         regmap_write(priv->reg, STM32_LPTIM_IER, value);
> 
>         if (!priv->ier_wr_enabled)
>             regmap_write(priv->reg, STM32_LPTIM_CR, STM32_LPTIM_ENABLE);
>     }

Hi Daniel,

Thanks for your suggestion.

I've tried various factorization but can't really find something pretty
and easy to read.

I think I'll rather implement some dedicated ops in V4, for stm32mp25,
based on compatible data.
This would allow straight forward sequence, without dangling with enable
bit / flags. I also need to add some checks on new status flags. So this
will avoid to add complexity on existing routines.

Best Regards,
Fabrice

> 
> 
>> +    if (priv->ier_wr_enabled)
>> +        regmap_write(priv->reg, STM32_LPTIM_CR, 0);
>> +
> 
>>       /* clear pending flags */
>>       regmap_write(priv->reg, STM32_LPTIM_ICR, STM32_LPTIM_ARRMCF);
>>   @@ -51,12 +59,21 @@ static int stm32_clkevent_lp_set_timer(unsigned
>> long evt,
>>   {
>>       struct stm32_lp_private *priv = to_priv(clkevt);
>>   -    /* disable LPTIMER to be able to write into IER register*/
>> -    regmap_write(priv->reg, STM32_LPTIM_CR, 0);
>> +    if (!priv->ier_wr_enabled) {
>> +        /* Disable LPTIMER to be able to write into IER register */
>> +        regmap_write(priv->reg, STM32_LPTIM_CR, 0);
>> +    } else {
>> +        /* Enable LPTIMER to be able to write into IER register */
>> +        regmap_write(priv->reg, STM32_LPTIM_CR, STM32_LPTIM_ENABLE);
>> +    }
>> +
>>       /* enable ARR interrupt */
>>       regmap_write(priv->reg, STM32_LPTIM_IER, STM32_LPTIM_ARRMIE);
>> +
>>       /* enable LPTIMER to be able to write into ARR register */
>> -    regmap_write(priv->reg, STM32_LPTIM_CR, STM32_LPTIM_ENABLE);
>> +    if (!priv->ier_wr_enabled)
>> +        regmap_write(priv->reg, STM32_LPTIM_CR, STM32_LPTIM_ENABLE);
>> +
>>       /* set next event counter */
>>       regmap_write(priv->reg, STM32_LPTIM_ARR, evt);
>>   @@ -151,6 +168,7 @@ static int stm32_clkevent_lp_probe(struct
>> platform_device *pdev)
>>           return -ENOMEM;
>>         priv->reg = ddata->regmap;
>> +    priv->ier_wr_enabled = ddata->version == STM32_LPTIM_VERR_23;
>>       ret = clk_prepare_enable(ddata->clk);
>>       if (ret)
>>           return -EINVAL;
> 
> 

