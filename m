Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152AFC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 12:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ASEg+LPUNythxyPQgR2kNgKdj/Y2CNNfzUmoJBF8q4=; b=1SAPeMT/I1Cdy7u2TLWEJry93n
	oN9/9XYDkAUxW+Alf6vl4ZIHLFbwre8joADNJf15Fnft7/yt3W0hpQObQirx5zKx/ybCwlJ09y/wX
	sCCGgh8CFFbUIReurLss1l0Q1N+PU/ikb1/eESrhWcOgLjAGqZUP68mh2qYoW/4YbyL4nymWg2AsL
	vGUCzDDvZECiHL5K9qJjsmYoGlrk9BJSN3qjLprNZKuDewuIAsEXLxzSv1EiI5qfDEkJq163BOJfK
	h8gSLNcCHjCDGkmc+m0JiaTNEnbBX1z5+YXmc+U9JVgKn40ku+eo/1abIFM/L+TaTAM7Bp+Aaff1o
	36CYDumg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLP7-0000000HHaR-2jRG;
	Thu, 16 Jul 2026 12:41:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLP4-0000000HHZR-3reY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 12:41:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0840B1476;
	Thu, 16 Jul 2026 05:41:19 -0700 (PDT)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C6003F7B4;
	Thu, 16 Jul 2026 05:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784205683; bh=Y3aM/kQqvp++lv0mc4QE+i4DL7rm5D/JWaR3nRML3zI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qlVTQLJGnpvRinTtJ4NWwCfIhzmffxp11KxgrK0NTEaJMtM4Reo3kYV51OHiMKJc7
	 IEyNzUjXeLXO/sNY4CrPhGN23/73KwC89/+b+HyLPbh62C64kN3rHWgy2RlKTiBkKh
	 6IR1YMRL4qxLGWz14Kmko2cB7UUemkSebOa8J6Kg=
Message-ID: <2005044a-ff4d-4585-963b-1c346d661a35@arm.com>
Date: Thu, 16 Jul 2026 13:41:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/13] coresight: etm4x: fix inconsistencies with sysfs
 configuration
To: Leo Yan <leo.yan@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, mike.leach@arm.com, james.clark@linaro.org,
 alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
References: <20260629090007.1718746-1-yeoreum.yun@arm.com>
 <20260629090007.1718746-9-yeoreum.yun@arm.com>
 <20260706173940.GB1024232@e132581.arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260706173940.GB1024232@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054127_058197_3102C581 
X-CRM114-Status: GOOD (  16.55  )
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

On 06/07/2026 18:39, Leo Yan wrote:
> On Mon, Jun 29, 2026 at 10:00:01AM +0100, Yeoreum Yun wrote:
> 
> [...]
> 
>> @@ -922,25 +950,7 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
>>   {
>>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>   	struct etm4_enable_arg arg = { };
>> -	unsigned long cfg_hash;
>> -	int ret, preset;
>> -
>> -	/* enable any config activated by configfs */
>> -	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
>> -	if (cfg_hash) {
>> -		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
>> -		if (ret) {
>> -			etm4_release_trace_id(drvdata);
>> -			return ret;
>> -		}
>> -	}
>> -
>> -	raw_spin_lock(&drvdata->spinlock);
>> -
>> -	drvdata->trcid = path->trace_id;
>> -
>> -	/* Tracer will never be paused in sysfs mode */
>> -	drvdata->paused = false;
>> +	int ret;
>>   
>>   	/*
>>   	 * Executing etm4_enable_hw on the cpu whose ETM is being enabled
>> @@ -948,20 +958,20 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
>>   	 */
>>   	arg.drvdata = drvdata;
>>   	arg.path = path;
>> +
>> +	raw_spin_lock(&drvdata->spinlock);
>> +	arg.config = drvdata->config;
>> +	raw_spin_unlock(&drvdata->spinlock);
>> +
>>   	ret = smp_call_function_single(drvdata->cpu,
>>   				       etm4_enable_sysfs_smp_call, &arg, 1);
>>   	if (!ret)
>>   		ret = arg.rc;
>>   	if (!ret)
>> -		drvdata->sticky_enable = true;
>> -
>> -	if (ret)
>> +		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
>> +	else
>>   		etm4_release_trace_id(drvdata);
>>   
>> -	raw_spin_unlock(&drvdata->spinlock);
>> -
>> -	if (!ret)
>> -		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
>>   	return ret;
>>   }
> 
> This is most valuable change for me, as now we will have much clear
> scope for what is protected ("drvdata->config").
> 
> However, a corner case was mentioned by Sashiko:
> 
>   | It appears etm4_enable_hw() modifies drvdata->ss_status while executing
>   | via IPI, but sshot_ctrl_store() can modify the same array concurrently

Could we stop modifying the drvdata->ss_status in enable_hw() ? We moved
it outside the config claiming that the status is not used(or useful). #
Then why not remove the updating from enable_hw()

Suzuki


>   | from process context since the lock is no longer held across the
>   | smp_call_function_single() call.
> 
> "drvdata->ss_status" is a race condition between SMP call and sysfs
> knobs. Should we change to spinlock_irqsave/irqrestore when access
> drvdata->ss_status?
> 
> Thanks,
> Leo


