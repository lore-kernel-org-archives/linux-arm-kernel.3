Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3474AC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 16:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=az0YCnmeyySHfJgjCSLhzolXq61fHw4p+GQsMO6NSxk=; b=bRgYYRWm8/0PtKMoXyQ0V9GR1U
	uKq1ETgY4XTEfXaCamaJwUtLIfsKLua0k8vl7kiX0rYeUBY9w3N+Z4oQrlkAS6q7tcnDH8I9OzoiD
	WW2w38KutHY4ECwRY5jOOraV8tSCT9zBUiTvBzOj52Eyij2tE9Oa4U2Fkf9olsV/+Ta2YxuSSV0wz
	OrrdBQYIKPyii2S4VP5eXVcaSLaQ2VGQEMOmKETp3i8qLLArfP9lyQ1YX9WVVZznj9ecaHI+i6V5z
	yztZzaY8k5hqyfqjXzMOCwgufnrlOrX+aVFEc0Na1jXtEaRqBIFWRWNTobKWloMBqi6gUgRFauuXu
	ASdk5Zvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqND-0000000BYp1-0m5m;
	Thu, 27 Mar 2025 16:46:31 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqGf-0000000BXgb-1Qsd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 16:39:47 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RDilnT022015;
	Thu, 27 Mar 2025 17:39:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	az0YCnmeyySHfJgjCSLhzolXq61fHw4p+GQsMO6NSxk=; b=0J6ljeygU3qcaI8y
	8bWZLLYh00LdEbVFMd0OSckS8S7TmA+OfQCtQHY4HQRDzlMiisrqZG3YiV8KrS2f
	cYKnrklharMXLL8knqJ2FQLppd50N9/I2D/kyUmOMcuKUHBMnacOvVNC+tEzjZxt
	8N730tIwORhnQcYHGb3xlQ3k+ofQjCVXXOd/t49N8khu0laJ6WRFeZf4lAGFTkKF
	HIJliiEMGa+BsNBhlD+iOAoXGiXoD0jV6Mt+2KLdYze/Z+bihwY/Mp+9H5NQ+2gO
	UOa+FbHYUwhdX3senU1hGgScRih6j/CiikhlL2UU9H/lnlaIQeUCyKv3ehNzCRUf
	35vwVA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45j91sucg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 17:39:18 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9C88E40045;
	Thu, 27 Mar 2025 17:38:01 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 55A6890429F;
	Thu, 27 Mar 2025 17:36:02 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 17:36:02 +0100
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 17:36:00 +0100
Message-ID: <30d13179-66fc-4856-ac70-af051ec5fe8f@foss.st.com>
Date: Thu, 27 Mar 2025 17:36:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] iio: trigger: stm32-lptimer: add support for
 stm32mp25
To: Jonathan Cameron <jic23@kernel.org>, <lee@kernel.org>
CC: <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <daniel.lezcano@linaro.org>, <tglx@linutronix.de>, <robh@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <devicetree@vger.kernel.org>, <wbg@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <olivier.moysan@foss.st.com>
References: <20250314171451.3497789-1-fabrice.gasnier@foss.st.com>
 <20250314171451.3497789-4-fabrice.gasnier@foss.st.com>
 <20250315125615.065a2e74@jic23-huawei>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250315125615.065a2e74@jic23-huawei>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_02,2025-03-26_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_093945_858374_0B55B0CA 
X-CRM114-Status: GOOD (  24.01  )
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

On 3/15/25 13:56, Jonathan Cameron wrote:
> On Fri, 14 Mar 2025 18:14:46 +0100
> Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:
> 
>> From: Olivier Moysan <olivier.moysan@foss.st.com>
>>
>> Add support for STM32MP25 SoC. Use newly introduced compatible to handle
>> this new HW variant. Add new trigger definitions that can be used by the
>> stm32 analog-to-digital converter. Use compatible data to identify them.
>>
>> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> 
> How do you want this to merge?   If it's going through mfd because
> of dependencies, then
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> I haven't checked if there are any dependencies so shout if I should
> pick this up directly for next cycle.

Hi Jonathan, Lee,

There's no build dependency, but the dt-bindings that adds the
compatible string.

Perhaps Lee can pick it up along with the mfd bindings and driver ?

I'm not sure what the most suitable option is.

Best Regards,
Fabrice
> 
> Thanks,
> 
> Jonathan
> 
> 
>> ---
>> Changes in v4:
>> - Jonathan's comment: simplify infrastructure by keeping
>>   devm_iio_trigger_register. Don't need to cast compatible data.
>> ---
>>  drivers/iio/trigger/stm32-lptimer-trigger.c   | 75 ++++++++++++++-----
>>  include/linux/iio/timer/stm32-lptim-trigger.h |  9 +++
>>  2 files changed, 67 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/iio/trigger/stm32-lptimer-trigger.c b/drivers/iio/trigger/stm32-lptimer-trigger.c
>> index f1e18913236a..3dcc8d2fe093 100644
>> --- a/drivers/iio/trigger/stm32-lptimer-trigger.c
>> +++ b/drivers/iio/trigger/stm32-lptimer-trigger.c
>> @@ -16,16 +16,43 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/property.h>
>>  
>> -/* List Low-Power Timer triggers */
>> -static const char * const stm32_lptim_triggers[] = {
>> -	LPTIM1_OUT,
>> -	LPTIM2_OUT,
>> -	LPTIM3_OUT,
>> +/* Maximum triggers + one trailing null entry to indicate the end of array */
>> +#define MAX_TRIGGERS 3
>> +
>> +struct stm32_lptim_cfg {
>> +	const char * const (*triggers)[MAX_TRIGGERS];
>> +	unsigned int nb_triggers;
>> +};
>> +
>> +/* List Low-Power Timer triggers for H7, MP13, MP15 */
>> +static const char * const stm32_lptim_triggers[][MAX_TRIGGERS] = {
>> +	{ LPTIM1_OUT,},
>> +	{ LPTIM2_OUT,},
>> +	{ LPTIM3_OUT,},
>> +};
>> +
>> +/* List Low-Power Timer triggers for STM32MP25 */
>> +static const char * const stm32mp25_lptim_triggers[][MAX_TRIGGERS] = {
>> +	{ LPTIM1_CH1, LPTIM1_CH2, },
>> +	{ LPTIM2_CH1, LPTIM2_CH2, },
>> +	{ LPTIM3_CH1,},
>> +	{ LPTIM4_CH1,},
>> +	{ LPTIM5_OUT,},
>> +};
>> +
>> +static const struct stm32_lptim_cfg stm32mp15_lptim_cfg = {
>> +	.triggers = stm32_lptim_triggers,
>> +	.nb_triggers = ARRAY_SIZE(stm32_lptim_triggers),
>> +};
>> +
>> +static const struct stm32_lptim_cfg stm32mp25_lptim_cfg = {
>> +	.triggers = stm32mp25_lptim_triggers,
>> +	.nb_triggers = ARRAY_SIZE(stm32mp25_lptim_triggers),
>>  };
>>  
>>  struct stm32_lptim_trigger {
>>  	struct device *dev;
>> -	const char *trg;
>> +	const char * const *triggers;
>>  };
>>  
>>  static int stm32_lptim_validate_device(struct iio_trigger *trig,
>> @@ -56,22 +83,33 @@ EXPORT_SYMBOL(is_stm32_lptim_trigger);
>>  
>>  static int stm32_lptim_setup_trig(struct stm32_lptim_trigger *priv)
>>  {
>> -	struct iio_trigger *trig;
>> +	const char * const *cur = priv->triggers;
>> +	int ret;
>>  
>> -	trig = devm_iio_trigger_alloc(priv->dev, "%s", priv->trg);
>> -	if  (!trig)
>> -		return -ENOMEM;
>> +	while (cur && *cur) {
>> +		struct iio_trigger *trig;
>>  
>> -	trig->dev.parent = priv->dev->parent;
>> -	trig->ops = &stm32_lptim_trigger_ops;
>> -	iio_trigger_set_drvdata(trig, priv);
>> +		trig = devm_iio_trigger_alloc(priv->dev, "%s", *cur);
>> +		if  (!trig)
>> +			return -ENOMEM;
>>  
>> -	return devm_iio_trigger_register(priv->dev, trig);
>> +		trig->dev.parent = priv->dev->parent;
>> +		trig->ops = &stm32_lptim_trigger_ops;
>> +		iio_trigger_set_drvdata(trig, priv);
>> +
>> +		ret = devm_iio_trigger_register(priv->dev, trig);
>> +		if (ret)
>> +			return ret;
>> +		cur++;
>> +	}
>> +
>> +	return 0;
>>  }
>>  
>>  static int stm32_lptim_trigger_probe(struct platform_device *pdev)
>>  {
>>  	struct stm32_lptim_trigger *priv;
>> +	struct stm32_lptim_cfg const *lptim_cfg;
>>  	u32 index;
>>  
>>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>> @@ -81,17 +119,20 @@ static int stm32_lptim_trigger_probe(struct platform_device *pdev)
>>  	if (device_property_read_u32(&pdev->dev, "reg", &index))
>>  		return -EINVAL;
>>  
>> -	if (index >= ARRAY_SIZE(stm32_lptim_triggers))
>> +	lptim_cfg = device_get_match_data(&pdev->dev);
>> +
>> +	if (index >= lptim_cfg->nb_triggers)
>>  		return -EINVAL;
>>  
>>  	priv->dev = &pdev->dev;
>> -	priv->trg = stm32_lptim_triggers[index];
>> +	priv->triggers = lptim_cfg->triggers[index];
>>  
>>  	return stm32_lptim_setup_trig(priv);
>>  }
>>  
>>  static const struct of_device_id stm32_lptim_trig_of_match[] = {
>> -	{ .compatible = "st,stm32-lptimer-trigger", },
>> +	{ .compatible = "st,stm32-lptimer-trigger", .data = &stm32mp15_lptim_cfg },
>> +	{ .compatible = "st,stm32mp25-lptimer-trigger", .data = &stm32mp25_lptim_cfg},
>>  	{},
>>  };
>>  MODULE_DEVICE_TABLE(of, stm32_lptim_trig_of_match);
>> diff --git a/include/linux/iio/timer/stm32-lptim-trigger.h b/include/linux/iio/timer/stm32-lptim-trigger.h
>> index a34dcf6a6001..ce3cf0addb2e 100644
>> --- a/include/linux/iio/timer/stm32-lptim-trigger.h
>> +++ b/include/linux/iio/timer/stm32-lptim-trigger.h
>> @@ -14,6 +14,15 @@
>>  #define LPTIM1_OUT	"lptim1_out"
>>  #define LPTIM2_OUT	"lptim2_out"
>>  #define LPTIM3_OUT	"lptim3_out"
>> +#define LPTIM4_OUT	"lptim4_out"
>> +#define LPTIM5_OUT	"lptim5_out"
>> +
>> +#define LPTIM1_CH1	"lptim1_ch1"
>> +#define LPTIM1_CH2	"lptim1_ch2"
>> +#define LPTIM2_CH1	"lptim2_ch1"
>> +#define LPTIM2_CH2	"lptim2_ch2"
>> +#define LPTIM3_CH1	"lptim3_ch1"
>> +#define LPTIM4_CH1	"lptim4_ch1"
>>  
>>  #if IS_REACHABLE(CONFIG_IIO_STM32_LPTIMER_TRIGGER)
>>  bool is_stm32_lptim_trigger(struct iio_trigger *trig);
> 

