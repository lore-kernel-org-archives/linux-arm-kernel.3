Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB4FC021A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 10:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PoBELKKE+yECTK++b72BWsWgFI0aCLVRf2TRxH/cixI=; b=fajsezV+Y/K82KXrZzwyXz7DTQ
	WEPwb8I4zzldiGBh13QK94J3AziV2zKFn16t4w0qDM6Eacmg7kTjzxVma5qcoxi2pmCFCAS2AEwBB
	Xzzr4JYT6dLe0+zDuKuHzLAGqXfcb7vhFYu1I5EX32vfDWwv23C0ihrsMwFKhF6xBUIHKFFhzGEic
	WiK2ZFAA+tJ9rlMC5YMrp1NDxMnf5HoIJYUeg+0q4t9fkbyc2kyhji7X74mc1dLKlV3vDHmXTAwS4
	hnpMn/waG84CPJLeqsohQFwWofzAnymYLkmNm6d/sshZV306P6M4M5a3Z7P9cFOtnEQT+SufDbDYk
	uhVnmxQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVFn-0000000D1F0-1xLe;
	Mon, 24 Feb 2025 09:59:59 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmV9N-0000000Czc8-0uq5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 09:53:22 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38f325dd9e6so2145821f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 01:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740390799; x=1740995599; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PoBELKKE+yECTK++b72BWsWgFI0aCLVRf2TRxH/cixI=;
        b=TPw9Z7scjMOoe8kMGo7syA3v4D5cGQjAiBJ+fGrCnipYsk19FjlO4tFfqTvWaW0Amy
         fdJJ79eFFYIPLRXHv6bZR1gi1/PJYOkHONiNc4JtvCgh1CyYaXlp81IOxqn6ZfxZ3lH2
         6yqyGT+j/xgX0bDhoJcMivOqLQk5SJbtE+HOxnurtkudgBdS0hxD4iPXEJqZAQ3M1jQF
         OIlHZcXtej9n0CzRgVLObqGBLpwDrmN33wP5gByrAH747g7Opq9CrmWO9+sbt+fXmgTh
         e7F/ti/qB4F/8pycXGYgEuts2gMIlTcz8CqDHR8a30WmfdycP4YGGZQ6GzqDRAG+kITu
         +fGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740390799; x=1740995599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PoBELKKE+yECTK++b72BWsWgFI0aCLVRf2TRxH/cixI=;
        b=QR4+jSYdrU4nrd6SIZZ9tqPU6FiWY1Ldj57ghF84GR5leDLajoS0LTG0l2v5c2+5Wi
         TcD9swg+EhYzZvRtSr25jhCsMkscba4e3dNddgesS4UZlpq8FHP/CwMWEA7WSpTg6/Zb
         0UzR8UCoopLFoMFVMkD01MCLYGMBpBn7DDVLDp2X7hBKCiLMgoo99cXexuXn2bgC40gj
         f5Ni6pvPBZbRv6JdSXAABBOGHqnnRYY4coWQtku4uuFYbaYmE33T7kUsNS284NodE7FX
         EmQcd4WY0yPHu96n72PVphT5/rGE8VwHn3f982edi4MX/OaGkl+cqSHITumWrAHbUVKA
         zAJw==
X-Forwarded-Encrypted: i=1; AJvYcCUdFcIwjhqcjaTDRsQuks0JlpADx/1+ZZlEOZkBzfmGf0YKfzEdqTgyLTKVD5ETnVrz7QAJVNsXTzVqNUYg7cPA@lists.infradead.org
X-Gm-Message-State: AOJu0YzIRLmhAJQY046U9L9OJ5fDY0WER2GOH7LMMvcRgtxRax7u1ODK
	rAnTKyeOLKOxGBhZIwDCyIEmHm4rh8bYsZVict7Od46eh46RsukEosozo4eR/UQ=
X-Gm-Gg: ASbGncsVwEXMeMw8vjjhEQ6OnwNpiN9xhU7xxgVGEBnMWrT0JjX21iDA20MLcj2dKPr
	gcXkJJiYpktbMo/qPv0tK8rYGFfuo9J0WAlaBV+v8toBP6ezTEUKyGhxz6vtihTfcB103PCdh01
	iGEQhh2hlq21JTI91z2Ib4Shnd7eHrTxecvvFf1QJNlsty4dtixdZL+SOKTXZfWACPVGEFfcXWY
	G6WoLUHO5/rNeaVYuodkpdSriv2Mbq05ndE6J6fim4mIX9WyZIYdn6v16PeVG4yLQ30rH/9vZaM
	n6GdSC3sJvQ8wTnUX4JWJlY8mJNU+NEd5r6H
X-Google-Smtp-Source: AGHT+IH69+CyKK8E2xVQeIZRb1cBUYBGNIMPFy29sJHEqbtta0YCE3tbtJ7P1KVtoT+LfEsIBnerVg==
X-Received: by 2002:adf:f74b:0:b0:38f:3791:c1d3 with SMTP id ffacd0b85a97d-38f6f0db7dbmr8697362f8f.54.1740390799001;
        Mon, 24 Feb 2025 01:53:19 -0800 (PST)
Received: from [192.168.68.163] ([145.224.66.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b0371cfcsm99715125e9.36.2025.02.24.01.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 01:53:18 -0800 (PST)
Message-ID: <37cb0da5-fcca-41e0-95d8-280fd95541c9@linaro.org>
Date: Mon, 24 Feb 2025 09:53:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 6/7] Coresight: Add Coresight TMC Control Unit driver
To: Jie Gan <quic_jiegan@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250217093024.1133096-1-quic_jiegan@quicinc.com>
 <20250217093024.1133096-7-quic_jiegan@quicinc.com>
 <35d1a923-4e8e-4fe2-bf4a-0b78b1d511e3@arm.com>
 <a594bdee-7d9e-4d79-a5ee-a34dafa2869f@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <a594bdee-7d9e-4d79-a5ee-a34dafa2869f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_015321_266204_ADEDF425 
X-CRM114-Status: GOOD (  39.06  )
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



On 24/02/2025 3:32 am, Jie Gan wrote:
> 
> 
> On 2/21/2025 7:39 PM, Suzuki K Poulose wrote:
>> On 17/02/2025 09:30, Jie Gan wrote:
>>> The Coresight TMC Control Unit hosts miscellaneous configuration 
>>> registers
>>> which control various features related to TMC ETR sink.
>>>
>>> Based on the trace ID, which is programmed in the related CTCU ATID
>>> register of a specific ETR, trace data with that trace ID gets into
>>> the ETR buffer, while other trace data gets dropped.
>>>
>>> Enabling source device sets one bit of the ATID register based on
>>> source device's trace ID.
>>> Disabling source device resets the bit according to the source
>>> device's trace ID.
>>>
>>> Reviewed-by: James Clark <james.clark@linaro.org>
>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>> ---
>>>   drivers/hwtracing/coresight/Kconfig          |  12 +
>>>   drivers/hwtracing/coresight/Makefile         |   1 +
>>>   drivers/hwtracing/coresight/coresight-ctcu.c | 268 +++++++++++++++++++
>>>   drivers/hwtracing/coresight/coresight-ctcu.h |  24 ++
>>>   include/linux/coresight.h                    |   3 +-
>>>   5 files changed, 307 insertions(+), 1 deletion(-)
>>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.c
>>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h
>>>
>>> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/ 
>>> coresight/Kconfig
>>> index 06f0a7594169..ecd7086a5b83 100644
>>> --- a/drivers/hwtracing/coresight/Kconfig
>>> +++ b/drivers/hwtracing/coresight/Kconfig
>>> @@ -133,6 +133,18 @@ config CORESIGHT_STM
>>>         To compile this driver as a module, choose M here: the
>>>         module will be called coresight-stm.
>>> +config CORESIGHT_CTCU
>>> +    tristate "CoreSight TMC Control Unit driver"
>>> +    depends on CORESIGHT_LINK_AND_SINK_TMC
>>> +    help
>>> +      This driver provides support for CoreSight TMC Control Unit
>>> +      that hosts miscellaneous configuration registers. This is
>>> +      primarily used for controlling the behaviors of the TMC
>>> +      ETR device.
>>> +
>>> +      To compile this driver as a module, choose M here: the
>>> +      module will be called coresight-ctcu.
>>> +
>>>   config CORESIGHT_CPU_DEBUG
>>>       tristate "CoreSight CPU Debug driver"
>>>       depends on ARM || ARM64
>>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/ 
>>> hwtracing/ coresight/Makefile
>>> index 4ba478211b31..1b7869910a12 100644
>>> --- a/drivers/hwtracing/coresight/Makefile
>>> +++ b/drivers/hwtracing/coresight/Makefile
>>> @@ -51,3 +51,4 @@ coresight-cti-y := coresight-cti-core.o coresight- 
>>> cti-platform.o \
>>>              coresight-cti-sysfs.o
>>>   obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>>>   obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
>>> +obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
>>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu.c b/drivers/ 
>>> hwtracing/coresight/coresight-ctcu.c
>>> new file mode 100644
>>> index 000000000000..e1460a627c4d
>>> --- /dev/null
>>> +++ b/drivers/hwtracing/coresight/coresight-ctcu.c
>>> @@ -0,0 +1,268 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All 
>>> rights reserved.
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/coresight.h>
>>> +#include <linux/device.h>
>>> +#include <linux/err.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/init.h>
>>> +#include <linux/io.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/of.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/slab.h>
>>> +
>>> +#include "coresight-ctcu.h"
>>> +#include "coresight-priv.h"
>>> +
>>> +DEFINE_CORESIGHT_DEVLIST(ctcu_devs, "ctcu");
>>> +
>>> +#define ctcu_writel(drvdata, val, offset)    __raw_writel((val), 
>>> drvdata->base + offset)
>>> +#define ctcu_readl(drvdata, offset)        __raw_readl(drvdata->base 
>>> + offset)
>>> +
>>> +/*
>>> + * The TMC Coresight Control Unit uses four ATID registers to 
>>> control the data
>>> + * filter function based on the trace ID for each TMC ETR sink. The 
>>> length of
>>> + * each ATID register is 32 bits. Therefore, the ETR has a related 
>>> field in
>>> + * CTCU that is 128 bits long. Each trace ID is represented by one 
>>> bit in that
>>> + * filed.
>>> + * e.g. ETR0ATID0 layout, set bit 5 for traceid 5
>>> + *                                           bit5
>>> + * ------------------------------------------------------
>>> + * |   |28|   |24|   |20|   |16|   |12|   |8|  1|4|   |0|
>>> + * ------------------------------------------------------
>>> + *
>>> + * e.g. ETR0:
>>> + * 127                     0 from ATID_offset for ETR0ATID0
>>> + * -------------------------
>>> + * |ATID3|ATID2|ATID1|ATID0|
>>> + */
>>> +#define CTCU_ATID_REG_OFFSET(traceid, atid_offset) \
>>> +        ((traceid / 32) * 4 + atid_offset)
>>> +
>>> +#define CTCU_ATID_REG_BIT(traceid)    (traceid % 32)
>>> +#define CTCU_ATID_REG_SIZE        0x10
>>> +
>>> +struct ctcu_atid_config {
>>> +    const u32 atid_offset;
>>> +    const u32 port_num;
>>> +};
>>> +
>>> +struct ctcu_config {
>>> +    const struct ctcu_atid_config *atid_config;
>>> +    int num_atid_config;
>>> +};
>>> +
>>> +static const struct ctcu_atid_config sa8775p_atid_cfgs[] = {
>>> +    {0xf8,  0},
>>> +    {0x108, 1},
>>> +};
>>> +
>>> +static const struct ctcu_config sa8775p_cfgs = {
>>> +    .atid_config        = sa8775p_atid_cfgs,
>>> +    .num_atid_config    = ARRAY_SIZE(sa8775p_atid_cfgs),
>>> +};
>>> +
>>> +static void ctcu_program_atid_register(struct ctcu_drvdata *drvdata, 
>>> u32 reg_offset,
>>> +                       u8 bit, bool enable)
>>> +{
>>> +    u32 val;
>>> +
>>> +    CS_UNLOCK(drvdata->base);
>>> +    val = ctcu_readl(drvdata, reg_offset);
>>> +    val = enable? (val | BIT(bit)) : (val & ~BIT(bit));
>>
>> minor nit: If possible do not use the ternary operator like this. It 
>> is much better readable as:
>>
>>      if (enable)
>>          val |= BIT(bit);
>>      else
>>          val &= ~BIT(bit);
>>
> 
> Will do this way.
> 
>>> +    ctcu_writel(drvdata, val, reg_offset);
>>> +    CS_LOCK(drvdata->base);
>>> +}
>>> +
>>> +/*
>>> + * __ctcu_set_etr_traceid: Set bit in the ATID register based on 
>>> trace ID when enable is true.
>>> + * Reset the bit of the ATID register based on trace ID when enable 
>>> is false.
>>> + *
>>> + * @csdev:    coresight_device struct related to the device
>>> + * @traceid:    trace ID of the source tracer.
>>> + * @port_num:    port number from TMC ETR sink.
>>> + * @enable:    True for set bit and false for reset bit.
>>> + *
>>> + * Returns 0 indicates success. Non-zero result means failure.
>>> + */
>>> +static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 
>>> traceid, int port_num,
>>> +                  bool enable)
>>> +{
>>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>> +    u32 atid_offset, reg_offset;
>>> +    u8 refcnt, bit;
>>> +
>>> +    atid_offset = drvdata->atid_offset[port_num];
>>> +    if (atid_offset == 0)
>>> +        return -EINVAL;
>>> +
>>> +    bit = CTCU_ATID_REG_BIT(traceid);
>>> +    reg_offset = CTCU_ATID_REG_OFFSET(traceid, atid_offset);
>>> +    if (reg_offset - atid_offset > CTCU_ATID_REG_SIZE)
>>> +        return -EINVAL;
>>> +
>>> +    guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
>>> +    refcnt = drvdata->traceid_refcnt[port_num][traceid];
>>> +    /* Only program the atid register when the refcnt value is 0 or 
>>> 1 */
>>
>> A normal trace source won't be enabled more than once (e.g., ETM). The 
>> only odd one out is the STM, which may be driven by multiple agents.
>> So this refcounting looks necessary.
>>
> 
> Besides, for the TPDMs which shared the trace_id of the TPDA also need 
> the refcnt. Consider we have TPDM1 and TPDM2 connected to the same TPDA 
> device. Once we disable one of the TPDM without checking the refcnt, the 
> filter function will be disabled for another TPDM.
> 
>>> +    if (enable && (++refcnt == 1))
>>> +        ctcu_program_atid_register(drvdata, reg_offset, bit, enable);
>>> +    else if (!enable && (--refcnt == 0))
>>> +        ctcu_program_atid_register(drvdata, reg_offset, bit, enable);
>>
>> minor nit:
>>
>>      if ((enable && !refcount++) ||
>>          (!enable && --refcount))
>>          ctcu_program_atid_register(drvdata, reg_offset, bit, enable);
>>
>>
> 
> I did (enable && (++refcnt == 1)) just because I think we only need 
> program the register when refcnt is equal to 1. We dont need reprogram 
> the register with same value when refcnt greater than 1. So I think it's 
> better for the performance?
> 
>> Also, see my comment the bottom for "refcount" being u8 .
> 
> Sure, will check.
> 
>>
>>
>>> +
>>> +    drvdata->traceid_refcnt[port_num][traceid] = refcnt;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int ctcu_get_active_port(struct coresight_device *sink, 
>>> struct coresight_device *helper)
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = 0; i < sink->pdata->nr_outconns; ++i) {
>>> +        if (sink->pdata->out_conns[i]->dest_dev)
>>> +            return sink->pdata->out_conns[i]->dest_port;
>>
>> Don't we need to make sure it matches the helper ? What if there are 
>> multiple helpers ? e.g, a CATU connected to the ETR and CTCU ?
>> Or even try the opposite ? i.e. search the helper and find the port
>> matching the sink ?

Good catch, looks like this should be done the opposite way around.

>>
>>      struct coresight_platform_data *pdata = helper->pdata;
>>
>>      for (i = 0; i < pdata->nr_inconns; ++i)
>>          if (pdata->in_conns[i]->dest_dev == sink)
>>              return pdata->in_conns[i]->src_port;
>>
>> Not sure if that works with the helper device connection, James ?

Yeah connections are always made in both directions.

> Can we check the subtype of the helper device? We should only have one 
> CTCU helper device for each ETR.
> 
> enum coresight_dev_subtype_helper subtype;
> 
> for (i = 0; i < sink->pdata->nr_outconns; ++i) {
>      subtype = sink->pdata->out_conns[i]->dest_dev->subtype.helper_subtype;
>      if (subtype == CORESIGHT_DEV_SUBTYPE_HELPER_CTCU)
>         return sink->pdata->out_conns[i]->dest_port;
> 

I don't think we need to check the type, just search all the CTCU's 
in_conns until you find the sink.

As Suzuki says, by looking at the out_conns of the sink you might find a 
different helper device. Checking that it really is connected to the 
sink is probably more robust that relying on the type anyway.



