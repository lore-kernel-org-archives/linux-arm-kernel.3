Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBB5C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fk+3zU33sCqoZlV6B6qSYZSBg88kLSXJJ3oAr4lA5vU=; b=v2rnJS8IGfsNmudxyk2oSKO1JK
	DSbgzuxBOj/JysoHrVm+RfFKZvMsXdngjwVTN/EvG7E9q83BxSVtFFLAk+NOaDpqgZyhjvqxRNpZF
	ZauOFgjvrk15/q7k/IzQvBsSPpV6Z1H4HwX/XC/N23arVL7EwE0P6Yo/MJQI3MAumaT7kdhRjOcsu
	6mJWtXi5gNAqgaoSp3uAQL473Q6L/Lo4lcllurbRajLdO2S230WG3ReXZ96PhZ/a6BUDtUtDkp+dQ
	U4vky9Qfsbw6th+UN18VlQ5HRXENtjLqnH81z4WamwsS7q9venWOC/nIXI/LnWSVtuyVbaDdoZvbZ
	hN1bk4ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7wT-00000009Ehf-1Sal;
	Tue, 21 Jul 2026 10:43:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7wQ-00000009EhA-0YVw;
	Tue, 21 Jul 2026 10:43:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784630591;
	bh=ArAK5eqqqsAwRJw9a12ekL0SmbGFQuXBHELKAchUZ2A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=crWUlhcAh3AbBhIOV9712HCInJrmYECt0XPRLkQQ+8axoEOnwGU8Czco2MEe3Ppyj
	 e9ewF0Fo/mfM8ZYrrw6fLbFlU2cp/RZoxQWEqAMRqNauF2Sr1pmL0GvQwO1x034ied
	 OJn4Zwq42CDE59ECSzH9BLRRGgr4UWQ9wW8KM4/8yfHpTFipYX2eBFjVQz7S0GuUQz
	 Apf+6IDXSjsWXOchI/oRA5XHNBsPMYW7m+cehXIUirM3505ACZ+IAlXcnzN/idpwzw
	 HV9tnVP0+7nRfF3RelmhW4RtzxCxOXtHpoODUNPl2jKyvdmGczykkEGWztpD10330N
	 Wbtzf8PT6ufrQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 02E4117E0018;
	Tue, 21 Jul 2026 12:43:10 +0200 (CEST)
Message-ID: <8a9aed82-5f0c-4ad8-91c5-1e1ac169781d@collabora.com>
Date: Tue, 21 Jul 2026 12:43:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Make reset
 optional for MT8196
To: Philipp Zabel <p.zabel@pengutronix.de>, rafael@kernel.org
Cc: daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 matthias.bgg@gmail.com, laura.nao@collabora.com, fshao@chromium.org,
 wenst@chromium.org, jiapeng.chong@linux.alibaba.com,
 frank-w@public-files.de, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20260720144244.88877-1-angelogioacchino.delregno@collabora.com>
 <16651472d6a782bdef63e1c9742444de08c59f1e.camel@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <16651472d6a782bdef63e1c9742444de08c59f1e.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_034314_338139_D9387B4D 
X-CRM114-Status: GOOD (  29.49  )
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

On 7/21/26 09:53, Philipp Zabel wrote:
> On Mo, 2026-07-20 at 16:42 +0200, AngeloGioacchino Del Regno wrote:
>> Depending on the SoC+Firmware combination, the LVTS hardware may be
>> may be actively used by one or even multiple concurrent MCUs!
>> In this case, resetting it may produce either a severe slowdown of
>> the entire system, or even a thermal protection AP reset, as some
>> MCU(s) may be reading a very high or very low temperature while the
>> LVTS is being reset.
>>
>> On those, don't fail if no reset is found as that may be omitted on
>> purpose, but still check if there's one, because some board(s) may
>> be running on a different bootchain with reduced firmwares or using
>> firmwares with reduced functionality.
>>
>> Add a new "optional_reset" member to lvts_data and use it to check
>> whether the resets should be mandatory or not.
>>
>> Also, while at it, since devm_reset_control_get_by_index() is now
>> deprecated, change the probe function to instead call function
>> devm_reset_control_get_exclusive_by_index(), which does the same.
> 
> Why is this using _by_index() at all? mediatek,lvts-thermal.yaml
> specifies a single reset, so the driver should just
> devm_reset_control_get_exclusive(dev, NULL).
> 
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/thermal/mediatek/lvts_thermal.c | 29 ++++++++++++++++++++++---
>>   1 file changed, 26 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
>> index 92711896ce24..6670b5458f2c 100644
>> --- a/drivers/thermal/mediatek/lvts_thermal.c
>> +++ b/drivers/thermal/mediatek/lvts_thermal.c
>> @@ -160,6 +160,7 @@ struct lvts_data {
>>   	int gt_calib_bit_offset;
>>   	unsigned int def_calibration;
>>   	u16 msr_offset;
>> +	bool optional_reset;
> 
> No need to complicate things. It's not the driver's business to check
> device tree correctness. Just make the reset optional, as the commit
> message says.
> 
>>   };
>>   
>>   struct lvts_sensor {
>> @@ -1473,9 +1474,29 @@ static int lvts_probe(struct platform_device *pdev)
>>   	if (IS_ERR(lvts_td->base))
>>   		return dev_err_probe(dev, PTR_ERR(lvts_td->base), "Failed to map io resource\n");
>>   
>> -	lvts_td->reset = devm_reset_control_get_by_index(dev, 0);
>> -	if (IS_ERR(lvts_td->reset))
>> -		return dev_err_probe(dev, PTR_ERR(lvts_td->reset), "Failed to get reset control\n");
>> +	/*
>> +	 * Depending on the SoC+Firmware combination, the LVTS hardware may be
>> +	 * may be actively used by one or even multiple concurrent MCUs!
>> +	 * In this case, resetting it may produce either a severe slowdown of
>> +	 * the entire system, or even a thermal protection AP reset, as some
>> +	 * MCU(s) may be reading a very high or very low temperature while the
>> +	 * LVTS is being reset.
>> +	 *
>> +	 * On those, don't fail if no reset is found as that may be omitted on
>> +	 * purpose, but still check if there's one, because some board(s) may
>> +	 * be running on a different bootchain with reduced firmwares or using
>> +	 * firmwares with reduced functionality.
>> +	 */
>> +	lvts_td->reset = devm_reset_control_get_exclusive_by_index(dev, 0);
> 
> So this should be:
> 
> 	lvts_td->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
> 
>> +	if (IS_ERR(lvts_td->reset)) {
>> +		if (lvts_data->optional_reset) {
>> +			dev_dbg(dev, "No reset found. LVTS may be used by firmware.\n");
>> +			lvts_td->reset = NULL;
> 
> This is not necessary then.
> 
>> +		} else {
>> +			return dev_err_probe(dev, PTR_ERR(lvts_td->reset),
>> +					     "Failed to get reset control\n");
>> +		}
> 
> And this part could be kept as before.
> 
>> +	}
>>   
>>   	irq = platform_get_irq(pdev, 0);
>>   	if (irq < 0)
>> @@ -2163,6 +2184,7 @@ static const struct lvts_data mt8196_lvts_mcu_data = {
>>   	.num_cal_offsets = LVTS_NUM_CAL_OFFSETS_MT8196,
>>   	.msr_offset = LVTS_MSR_OFFSET_MT8196,
>>   	.ops = &lvts_platform_ops_mt8196,
>> +	.optional_reset = true,
> 
> But mediatek,lvts-thermal.yaml still specifies the reset as required
> for mediatek,mt8196-lvts-ap. That should be changed instead.
> 
>>   };
>>   
>>   static const struct lvts_data mt8196_lvts_ap_data = {
>> @@ -2175,6 +2197,7 @@ static const struct lvts_data mt8196_lvts_ap_data = {
>>   	.num_cal_offsets = LVTS_NUM_CAL_OFFSETS_MT8196,
>>   	.msr_offset = LVTS_MSR_OFFSET_MT8196,
>>   	.ops = &lvts_platform_ops_mt8196,
>> +	.optional_reset = true,
> 
> Same as above, but for mediatek,mt8196-lvts-mcu.
> 

Ack. Will send a v2 shortly.

Thanks,
Angelo

