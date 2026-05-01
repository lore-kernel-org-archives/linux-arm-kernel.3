Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39694CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 09:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=in3/bYblpEbZej2XATKsoT0Of3FBnJ5woY0ebB360NI=; b=QUyWZGjZbgKJL8aa9aR/ZTO78H
	AlOEeDC+6miCmMcnUN28O0kSFbT6sXQ2rJPv4bO0XAl0qPdZ2HOfjFDjzxovz1Z9djq2ZmgyAuWVC
	kioEP4Q9DlZM2AOWB5hNTihf01i5hYFypwsn7kP3TxIxxwqhhHRr3LksGtTTu7HIi5lnROise107P
	fILrvF3We98nTyEdAu+g45ORYHJoSeNcmCiWgdwxl9ss7stgh06PmjDdhyM+ut/+hpBfbgb2Otm5k
	Z8i/BTDYa4GUzcd9QlukRe4FSHeSFF4BD2thGIqUhM4FahdyB9a5PXvKQF5XblhAhBwA2fOLT62of
	PslGFA2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIkOx-00000006YPc-3M7G;
	Fri, 01 May 2026 09:43:15 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIkOv-00000006YPF-0jZK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 09:43:14 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-43d73422431so1510140f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 02:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777628591; x=1778233391; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=in3/bYblpEbZej2XATKsoT0Of3FBnJ5woY0ebB360NI=;
        b=e0Qx9pezb8CEZulPQ+gKhWvKZqSZKIHHZLD+HmTtD2J+GJSCAgYOx3N61RefCGbeAF
         QI31YdvCwBBtcFsUC6BAZ7HA0kWMkCyPcpJW/1agmtwJRLZX1WlpbaaB1m1++oUtkGSF
         a0Z9dtc2kQMgw494x/QIGkBv/dWUCoX2TW+68732jYBzAK34bu/RS3f+vJSVW+PEeA0a
         ikujPL9EZuaG3xo53rw5Dkhf1mPA/9V4q3c1+t2iATq2HZxTEjwpw1Umox6B89eZE97B
         Tuzr7zBkf7PBJO5uJDC98VHAUj1+nDF7R4svHATmKQn5sT5pNPgXTlZbq7YltVZ39Nt9
         2s6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777628591; x=1778233391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=in3/bYblpEbZej2XATKsoT0Of3FBnJ5woY0ebB360NI=;
        b=jR6VVe3gQfYzoUANK20J8Hi152HwijaUJ+6AhEQWYtuwOlpqQN5vnNg68zXxXjEaxj
         b0WcWf0RZRlXc5IAD5EgoNww+0AovkV2b+KoHQ9lTOnWxpNqoME5cILMoyEswrL9uiVq
         G63ma3d7NeCxJ32JUcXESxDiz94q7NlYib725pOObsnJO9LSh4pJ/JpdwJHk08Dx7cJ5
         GPCl6A/j1sYukTG4UDa5+IoawADV8sVTBZoxw1INnRW1RnrL5IUVWcOnnw78Y9V54gG+
         Cc/08Yobp6UqAnCIeIl5Wg2DpJ07Qn83B9mBXmqEQaZkobojJX4Ypkwc6cTbBNDbkJ7K
         puYw==
X-Forwarded-Encrypted: i=1; AFNElJ+Xhm5JsW0EBF+ssOOdTWqBT9fEK1SBssytC1BWU1HJaEBZRi34YjIsaDNAU8o2D6Tcv0z0E6sj/GGFO61RkbVA@lists.infradead.org
X-Gm-Message-State: AOJu0YzYAn9DwuHDh+zGEzRZVQZyA4CbhwZ7TM38NeI427w6VBNjfWqn
	Nt5/VOatbb8TtmTD9EJPhCnOEUKL7StvMfVjz40XNlVBmEDIu770os/CIU7DdWtgw0f5H3ebA09
	crFrGqpo=
X-Gm-Gg: AeBDietFyPKvwyj2Iq9bw3XQuQPHTtCgrnhVuRZFNmfcoaCUMC98uevh0jaqO/UYcAd
	IIlFbyvogXkCMhwq3prHG/ob18dZ7oqbx8cnfMtlHW3cKt0b7OCBoemJ2DxmquR1bQnaHPwhmje
	T9B2rVRKemPa4OiEPeHR8NKW6xp71/VAow0+N4Z2/Qz7zfVOljW3slRERh2uwdmZQB29spyIL8b
	6xh5NXJwJ/wdewNQ3YddFp30jjiJS17ZTPfAxl82yFk756UC5hxE7x45qm8n8NotxtCDHLG3o4w
	630BHFnnitP82806Qjxgk3f/BFIQ/yYK8QSjTn3G2jabNHNQHsAyCI7YTaezmmoa4U6/u5fvXIc
	QPCbjrXsrMtyPuPrKmg6U/ARda4Z8wrM33/dTI2NqnL+88K4PSRm8yhQwPMRA+MEjXpQG5EYdc2
	eCDt8jjHoPLTzWl6qncQA2MfJJixolS3DtFQIqBD4=
X-Received: by 2002:a05:6000:2508:b0:43d:1c59:2dc with SMTP id ffacd0b85a97d-4493e5ac44cmr11110357f8f.28.1777628590663;
        Fri, 01 May 2026 02:43:10 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a9879ef89sm4384785f8f.30.2026.05.01.02.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 02:43:10 -0700 (PDT)
Message-ID: <be6bbfe1-cd51-43d8-84c7-34de929118f4@linaro.org>
Date: Fri, 1 May 2026 10:43:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] coresight: ete: Always save state on power down
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20260428-james-cs-ete-pm_save_enable-v1-0-c7a90ca6f43b@linaro.org>
 <20260428-james-cs-ete-pm_save_enable-v1-1-c7a90ca6f43b@linaro.org>
 <bc9f873e-4919-4617-bb6f-1f495a6a508b@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <bc9f873e-4919-4617-bb6f-1f495a6a508b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_024313_264009_DC95D391 
X-CRM114-Status: GOOD (  28.54  )
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



On 01/05/2026 9:24 am, Suzuki K Poulose wrote:
> On 28/04/2026 13:18, James Clark wrote:
>> ETE registers are always system registers so it's highly unlikely there
>> will be an implementation that preserves them on CPU power down. Also
>> the ETE DT binding never documented
>> "arm,coresight-loses-context-with-cpu" so nobody would have legitimately
>> been able to use that binding to fix it.
>>
>> Fix it by hard coding the setting for ETE and add a warning if the user
>> tried to use the module parameter. Don't add a warning if
>> loses-context-with-cpu is present in the DT as it's not a documented
>> binding anyway. etm4_init_pm_save() needs to happen after drvdata is
>> initialised so etm4x_is_ete() can be called.
>>
>> This fixes the following error when using Coresight with ACPI on the FVP
>> which supports CPU PM:
>>
>>    coresight ete0: External agent took claim tag
>>    WARNING: drivers/hwtracing/coresight/coresight-core.c:248 at 
>> coresight_disclaim_device_unlocked+0xe0/0xe8, CPU#0: perf/117
>>
>> Fixes: 35e1c9163e02 ("coresight: ete: Add support for ETE tracing")
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 41 ++++++++++++ 
>> +++-------
>>   1 file changed, 29 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/ 
>> drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index d565a73f0042..a7fb680dd383 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -56,10 +56,11 @@ MODULE_PARM_DESC(boot_enable, "Enable tracing on 
>> boot");
>>   #define PARAM_PM_SAVE_NEVER      1 /* never save any state */
>>   #define PARAM_PM_SAVE_SELF_HOSTED 2 /* save self-hosted state only */
>> +/* Save option for ETM4. ETE ignores this option and always saves */
>>   static int pm_save_enable = PARAM_PM_SAVE_FIRMWARE;
>>   module_param(pm_save_enable, int, 0444);
>>   MODULE_PARM_DESC(pm_save_enable,
>> -    "Save/restore state on power down: 1 = never, 2 = self-hosted");
>> +    "Save/restore state on power down: 1 = never, 2 = self-hosted. 
>> ETM4 only.");
>>   static struct etmv4_drvdata *etmdrvdata[NR_CPUS];
>>   static void etm4_set_default_config(struct etmv4_config *config);
>> @@ -1365,6 +1366,30 @@ static void etm4_fixup_wrong_ccitmin(struct 
>> etmv4_drvdata *drvdata)
>>       }
>>   }
>> +static int etm4_init_pm_save(struct device *dev, struct etmv4_drvdata 
>> *drvdata)
>> +{
>> +    if (etm4x_is_ete(drvdata)) {
>> +        /*
>> +         * Always do PM save for ETE. It always uses system registers
>> +         * which will be lost on CPU power down.
>> +         */
>> +        pm_save_enable = PARAM_PM_SAVE_SELF_HOSTED;
> 
> Should we do this instead based on if the ETM/ETE is accessed via sys 
> instructions ? That would cover all implementations?
> 
> 
> Suzuki
> 

I did discuss that with Leo but we thought it might be a riskier change 
as ETM is older and nobody has reported any issues, and there is already 
the DT option to fix it that way. Turning it on by default could cause 
some performance regressions. Although it's only if the ETM is in use, 
so the impact is minimal.

In reality it probably does make sense as it's highly unlikely that 
sysreg ETM wouldn't need saving, so it might make some platforms with 
misconfigured DTs more stable.

I can send another version if you think it makes sense, what do you 
think Leo?

>> +    } else if (pm_save_enable == PARAM_PM_SAVE_FIRMWARE) {
>> +        pm_save_enable = coresight_loses_context_with_cpu(dev) ?
>> +            PARAM_PM_SAVE_SELF_HOSTED : PARAM_PM_SAVE_NEVER;
>> +    }
>> +
>> +    if (pm_save_enable != PARAM_PM_SAVE_NEVER) {
>> +        drvdata->save_state = devm_kmalloc(dev,
>> +                           sizeof(struct etmv4_save_state),
>> +                           GFP_KERNEL);
>> +        if (!drvdata->save_state)
>> +            return -ENOMEM;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static void etm4_init_arch_data(void *info)
>>   {
>>       u32 etmidr0;
>> @@ -2247,6 +2272,9 @@ static int etm4_add_coresight_dev(struct 
>> etm4_init_arg *init_arg)
>>           return -ENOMEM;
>>       etm4_set_default(&drvdata->config);
>> +    ret = etm4_init_pm_save(dev, drvdata);
>> +    if (ret)
>> +        return ret;
>>       pdata = coresight_get_platform_data(dev);
>>       if (IS_ERR(pdata))
>> @@ -2305,17 +2333,6 @@ static int etm4_probe(struct device *dev)
>>       if (ret)
>>           return ret;
>> -    if (pm_save_enable == PARAM_PM_SAVE_FIRMWARE)
>> -        pm_save_enable = coresight_loses_context_with_cpu(dev) ?
>> -                   PARAM_PM_SAVE_SELF_HOSTED : PARAM_PM_SAVE_NEVER;
>> -
>> -    if (pm_save_enable != PARAM_PM_SAVE_NEVER) {
>> -        drvdata->save_state = devm_kmalloc(dev,
>> -                sizeof(struct etmv4_save_state), GFP_KERNEL);
>> -        if (!drvdata->save_state)
>> -            return -ENOMEM;
>> -    }
>> -
>>       raw_spin_lock_init(&drvdata->spinlock);
>>       drvdata->cpu = coresight_get_cpu(dev);
>>
> 


