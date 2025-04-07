Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDDEC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 16:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABEfNN+1IHR+r4C1nJ+5cHN86lWSmwG/a4wotKyjNpw=; b=25aDakeI6rjCD8TKfaXg4JszoI
	sFUUyxPTTrpLS7DjTvuhF5gB1ZuQG0ZuvxQtYgANmUwTVA/9kco+ufWUVaS7/8vzkKnlGHvQXGpHg
	s5MzcyNbPU3kMetxTVMW1iIoG0MAMyZxDJ7kvW6lFVduS8CzGymOc136hjZ4cklpjbpP7JYctDUCt
	V1p79FNO2CxSjfFGSZiYMPSMBFrKXNOyVHLRwbfMq9GlChWexq1ZSpLjL6CYYOEvUCwVUa3gXhJCp
	XJNKhJfhBDoomXWOuYX8eJzLVEgNAme6zGYoT4n0cDBRDmSJ+L9Q+UPs9TCbF56xwRhZLfzxH/d3d
	gKyaK+fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1phg-00000001HRz-348J;
	Mon, 07 Apr 2025 16:52:08 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1p22-0000000165C-3uoM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 16:09:09 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537CPnR5010581;
	Mon, 7 Apr 2025 18:08:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ABEfNN+1IHR+r4C1nJ+5cHN86lWSmwG/a4wotKyjNpw=; b=QsN4ddLV2BziarOd
	c+Z3E91XSpJlml/ZpY3aaCJdk29y8ZOUmBoo+JmQ/1EL3RsXbyDsSUP/6JZw+kGF
	aqYusWJbb9j7I1i8qiakFk7ecsYybMOwi+KMSpan+tKH35sQaWawjOPtwmq+qzKv
	d9/U+qcAGHUbdNhxZd1Ml6+9/ze6UwnQuWnebHzfBTYrEk2csUGGCtkCYT+CJoQA
	fdukqoVR0ss8qWqfiO976U8yKTLE6rzlawAbFapualrt/qia/EWSaKsi1nfRbfeR
	d22Y/YXgQwrG5oEktogDeR6tusG+PrfRwtSpq3MlhURHYPeVfZOJao/aWiDy6YTX
	GSMeWQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45ue33xg8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 18:08:54 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D4D7740045;
	Mon,  7 Apr 2025 18:07:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2AE2B897C4D;
	Mon,  7 Apr 2025 18:07:19 +0200 (CEST)
Received: from [10.48.87.151] (10.48.87.151) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 18:07:18 +0200
Message-ID: <6d12b6fe-85fb-4345-bf32-02c0fbb1a27a@foss.st.com>
Date: Mon, 7 Apr 2025 18:07:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iio: adc: stm32: add oversampling support
To: David Lechner <dlechner@baylibre.com>,
        Jonathan Cameron
	<jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, <linux-iio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250403162358.1257370-1-olivier.moysan@foss.st.com>
 <25b34e60-5392-4bfb-b994-49212dfbdb22@baylibre.com>
Content-Language: en-US
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <25b34e60-5392-4bfb-b994-49212dfbdb22@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.151]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_090907_643171_F543655B 
X-CRM114-Status: GOOD (  38.67  )
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

Hi David,

Thanks for reviewing,

On 4/4/25 18:15, David Lechner wrote:
> On 4/3/25 11:23 AM, Olivier Moysan wrote:
>> Add oversampling support for STM32H7, STM32MP15 & STM32MP13.
>> STM32F4 ADC has no oversampling feature.
>>
>> The current support of the oversampling feature aims at increasing
>> the data SNR, without changing the data resolution.
>> As the oversampling by itself increases data resolution,
>> a right shift is applied to keep initial resolution.
> 
> Why do we not want the extra bits too? I guess if we wanted the extra bits
> in the future we could make the in_voltage_scale attribute writable to
> select the resolution.
> 

Yes, I agree that the oversampling feature could could be further 
exploited. It could also be used to increase the data resolution.
This additional feature can be managed as a separate patch later.
The main logic here was to keep the resolution aligned with the one 
requested in the DT, through the "assigned-resolution-bits" property.

>> Only the oversampling ratio corresponding to a power of two are
>> supported here, to get a direct link between right shift and
>> oversampling ratio. (2exp(n) ratio <=> n right shift)
>>
>> The oversampling ratio is shared by all channels, whatever channel type.
>> (e.g. single ended or differential).
>>
>> Oversampling can be configured using IIO ABI:
>> - in_voltage_oversampling_ratio_available
>> - in_voltage_oversampling_ratio
> 
> This would require info_mask_shared_by_type but the patch uses
> info_mask_shared_by_all, so the attributes will be:
> 
> - oversampling_ratio
> - oversampling_ratio_available
> 
> I guess currently it doesn't matter which one gets used if there are only
> voltage channels, but it could make a difference, e.g. if a temperature
> channel was ever added.
> 
> In any case, the description should match what is actually implemented.
> 

The oversampling configuration is shared by all the channels of a given 
ADC instance. So, it makes sense to use info_mask_shared_by_all here.
What is the most relevant is to change the commit message to
"- oversampling_ratio
  - oversampling_ratio_available"
which are the attributes actually exposed.

>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
>>
>> ---
>> Changes in v2:
>> - Remove useless header files
>> - Use FIELD_PREP macro
>> - Reorder stm32_adc_write_raw() function
> 
> Link to v1? (for the lazy reviewer :-p)
> 
>> ---
>>   drivers/iio/adc/stm32-adc-core.h |  14 ++++
>>   drivers/iio/adc/stm32-adc.c      | 137 +++++++++++++++++++++++++++++++
>>   2 files changed, 151 insertions(+)
>>
>> diff --git a/drivers/iio/adc/stm32-adc-core.h b/drivers/iio/adc/stm32-adc-core.h
>> index 73b2c2e91c08..bfd42c5456bf 100644
>> --- a/drivers/iio/adc/stm32-adc-core.h
>> +++ b/drivers/iio/adc/stm32-adc-core.h
>> @@ -91,6 +91,7 @@
>>   #define STM32H7_ADC_IER			0x04
>>   #define STM32H7_ADC_CR			0x08
>>   #define STM32H7_ADC_CFGR		0x0C
>> +#define STM32H7_ADC_CFGR2		0x10
>>   #define STM32H7_ADC_SMPR1		0x14
>>   #define STM32H7_ADC_SMPR2		0x18
>>   #define STM32H7_ADC_PCSEL		0x1C
>> @@ -160,6 +161,13 @@
>>   #define STM32H7_DMNGT_SHIFT		0
>>   #define STM32H7_DMNGT_MASK		GENMASK(1, 0)
>>   
>> +/* STM32H7_ADC_CFGR2 bit fields */
>> +#define STM32H7_OVSR_MASK		GENMASK(25, 16) /* Correspond to OSVR field in datasheet */
> 
> nit: Comment seems obvious and can be left out.
> 

Oversampling bit name is "OSVR" in datasheet H7, while oversampling 
shift is "OVSS". For naming consistency, I used OVSR instead of OSVR,
and highlighted it with a comment. As an alternative, STM32H7_OVSR could 
be renamed, but I would rather keep it unchanged.

>> +#define STM32H7_OVSR(v)			FIELD_PREP(STM32H7_OVSR_MASK, v)
>> +#define STM32H7_OVSS_MASK		GENMASK(8, 5)
>> +#define STM32H7_OVSS(v)			FIELD_PREP(STM32H7_OVSS_MASK, v)
>> +#define STM32H7_ROVSE			BIT(0)
>> +
> 
> ...
> 
>> +static const unsigned int stm32h7_adc_oversampling_avail[] = {
>> +1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024
> 
> Normal style is to have 1 tab indent here.
> 

ok

>> +};
>> +
>> +static const unsigned int stm32mp13_adc_oversampling_avail[] = {
>> +1, 2, 4, 8, 16, 32, 64, 128, 256
> 
> And here.
> 

ok

>>   };
>>   
> 
> ...
> 
>> @@ -889,6 +912,41 @@ static void stm32mp13_adc_start_conv(struct iio_dev *indio_dev, bool dma)
>>   	stm32_adc_set_bits(adc, STM32H7_ADC_CR, STM32H7_ADSTART);
>>   }
>>   
>> +static void stm32h7_adc_set_ovs(struct iio_dev *indio_dev, u32 ovs_idx)
>> +{
>> +	struct stm32_adc *adc = iio_priv(indio_dev);
>> +	u32 ovsr_bits, bits, msk;
>> +
>> +	msk = STM32H7_ROVSE | STM32H7_OVSR_MASK | STM32H7_OVSS_MASK;
>> +	stm32_adc_clr_bits(adc, STM32H7_ADC_CFGR2, msk);
>> +
>> +	if (!ovs_idx)
>> +		return;
>> +
>> +	ovsr_bits = (1 << ovs_idx) - 1;
>> +	bits = STM32H7_ROVSE | STM32H7_OVSS(ovs_idx) | STM32H7_OVSR(ovsr_bits);
>> +
>> +	stm32_adc_set_bits(adc, STM32H7_ADC_CFGR2, bits & msk);
>> +}
>> +
>> +static void stm32mp13_adc_set_ovs(struct iio_dev *indio_dev, u32 ovs_idx)
>> +{
>> +	struct stm32_adc *adc = iio_priv(indio_dev);
>> +	u32 bits, msk;
>> +
>> +	msk = STM32H7_ROVSE | STM32MP13_OVSR_MASK | STM32MP13_OVSS_MASK;
>> +	stm32_adc_clr_bits(adc, STM32H7_ADC_CFGR2, msk);
>> +
>> +	if (!ovs_idx)
>> +		return;
>> +
>> +	bits = STM32H7_ROVSE | STM32MP13_OVSS(ovs_idx);
>> +	if (ovs_idx - 1)
>> +		bits |= STM32MP13_OVSR(ovs_idx - 1);
>> +
>> +	stm32_adc_set_bits(adc, STM32H7_ADC_CFGR2, bits & msk);
>> +}
> 
> 
> Some comments in these functions could be useful to avoid needing the
> datasheet to understand all the different things that are happening here
> and more importantly, why it was decided to do it this way when there are
> many other possibilities (i.e. repeat the bit from commit message about
> always using 12-bit output).
> 

ok, I will add some comments here.

>> @@ -1461,6 +1519,69 @@ static int stm32_adc_single_conv(struct iio_dev *indio_dev,
>>   	return ret;
>>   }
>>   
>> +static int stm32_adc_write_raw(struct iio_dev *indio_dev,
>> +			       struct iio_chan_spec const *chan,
>> +			       int val, int val2, long mask)
>> +{
>> +	struct stm32_adc *adc = iio_priv(indio_dev);
>> +	struct device *dev = indio_dev->dev.parent;
>> +	int nb = adc->cfg->adc_info->num_ovs;
>> +	u32 idx;
>> +	int ret;
>> +
>> +	switch (mask) {
>> +	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
>> +		if (val2)
>> +			return -EINVAL;
>> +
>> +		for (idx = 0; idx < nb; idx++)
>> +			if (adc->cfg->adc_info->oversampling[idx] == val)
>> +				break;
>> +
>> +		if (idx >= nb)
>> +			return -EINVAL;
>> +
>> +		ret = iio_device_claim_direct_mode(indio_dev);
>> +		if (ret)
>> +			return ret;
> 
> We've been replacing this everywhere with:
> 
> 		if (!iio_device_claim_direct(indio_dev))
> 			return -EBUSY;
> 
> See: https://lore.kernel.org/linux-iio/20250331121317.1694135-1-jic23@kernel.org/
> 

ok

>> +
>> +		ret = pm_runtime_resume_and_get(dev);
>> +		if (ret < 0)
>> +			goto err;
>> +
>> +		adc->cfg->set_ovs(indio_dev, idx);
>> +
>> +		pm_runtime_mark_last_busy(dev);
>> +		pm_runtime_put_autosuspend(dev);
>> +
>> +		adc->ovs_idx = idx;
>> +
>> +err:
>> +		iio_device_release_direct_mode(indio_dev);
> 
> 		iio_device_release_direct(indio_dev);
> 
>> +
>> +		return ret;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}

BRs
Olivier

