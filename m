Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818CAC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 09:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G572VyB9IaYB6Qlvr75cvpshPA1NYeremSy2zk/VSaA=; b=ng6A2bVw+diO1lBT5kMXLaQP1+
	bI5TVkxi77UO94zA8R42zXBmc67QZ+Pc6IPbSq6Q3BTRcdlXgH/Q3KFsDZhlaJokd3ZIV1oWtUCAb
	d73cRvUkJ3uN3ZvwjpZD/vQSbJxdBbAp+ySeH64Pp0NOmaCBvfGwED4YEKBzFnkpt2q03XryiSJQs
	JROjIdZhcbpUDdLY1oWwFKRYUl89u6HYvErmdSfb6aPccC8WxFGEkdMTliYelQ7y+TS+ED9FbKkO4
	obN7EJ6waPTibdzt0FPPXQi61Jtsl4cLxoOoVZztyKsvIa3WQwnmmL1CKoQFF5TJG653Clq/DqHQt
	Uup3F3yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMklz-0000000D4h9-0YlM;
	Wed, 04 Jun 2025 09:51:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkjt-0000000D4Qt-0qGx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 09:48:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F47D1758;
	Wed,  4 Jun 2025 02:48:33 -0700 (PDT)
Received: from [10.57.48.144] (unknown [10.57.48.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6ED773F5A1;
	Wed,  4 Jun 2025 02:48:49 -0700 (PDT)
Message-ID: <58fc37a9-37c4-4a8f-b1b3-6f18f2b67618@arm.com>
Date: Wed, 4 Jun 2025 10:48:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] coresight: etm4x: Control the trace unit in CPU
 suspend
Content-Language: en-GB
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, Yabin Cui <yabinc@google.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20250516160742.1200904-1-leo.yan@arm.com>
 <20250516160742.1200904-2-leo.yan@arm.com>
 <f8ef3a37-2be2-4c07-bd88-888fedc4cd4d@linaro.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <f8ef3a37-2be2-4c07-bd88-888fedc4cd4d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_024853_326237_83413BA2 
X-CRM114-Status: GOOD (  23.94  )
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

On 03/06/2025 14:40, James Clark wrote:
> 
> 
> On 16/05/2025 5:07 pm, Leo Yan wrote:
>> If a trace unit has been enabled, a CPU suspend operation misses to
>> disable the trace unit.  After the CPU resumes, it also does not follow
>> the general flow for re-enabling the trace unit.  As a result, this may
>> lead to a wrong state machine for the ETM.
>>
>> This commit stops the trace unit during the CPU suspend flow and
>> re-enables the trace unit in the resume flow.
>>
>> Fixes: f188b5e76aae ("coresight: etm4x: Save/restore state across CPU 
>> low power states")
>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 15 ++++++++++++++-
>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/ 
>> drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index 6a5898355a83..b12d59b89a49 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -1820,6 +1820,11 @@ static int __etm4_cpu_save(struct etmv4_drvdata 
>> *drvdata)
>>       state = drvdata->save_state;
>>       state->trcprgctlr = etm4x_read32(csa, TRCPRGCTLR);
>> +
>> +    /* Stop the trace unit if it is enabled */
>> +    if (state->trcprgctlr)
> 
> etm4_cpu_save() looks at coresight_get_mode() to determine enabled 
> state. Seems a bit inconsistent to look directly at the enable bit right 
> after checking coresight_get_mode().

May be this is due to AUX pause case ? The mode could still be PERF, but
  the ETM/ETE is disabled ?

> 
>> +        etm4_disable_trace_unit(drvdata);
>> +
> 
> Section 3.4.1 in ARM IHI 0064H.b doesn't say that anything extra needs 
> to be done here, and it implies that restoring to an enabled state 
> should work. It might make sense to mention why it diverges from the 
> published sequence. Or get the sequence updated? I suppose that document 
> doesn't include ETE and I see there is one extra register missing from 
> __etm4_cpu_save() which is written to in etm4_disable_trace_unit().
> 
> Plus we end up doing extra things like two waits on TRCSTATR.PMSTABLE.

I guess, we need to stop the tracing before we reliably capture the
register states (similar to the disable/pause sequence).

Suzuki

> 
>>       if (drvdata->nr_pe)
>>           state->trcprocselr = etm4x_read32(csa, TRCPROCSELR);
>>       state->trcconfigr = etm4x_read32(csa, TRCCONFIGR);
>> @@ -1951,7 +1956,6 @@ static void __etm4_cpu_restore(struct 
>> etmv4_drvdata *drvdata)
>>       etm4_cs_unlock(drvdata, csa);
>>       etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
>> -    etm4x_relaxed_write32(csa, state->trcprgctlr, TRCPRGCTLR);
>>       if (drvdata->nr_pe)
>>           etm4x_relaxed_write32(csa, state->trcprocselr, TRCPROCSELR);
>>       etm4x_relaxed_write32(csa, state->trcconfigr, TRCCONFIGR);
>> @@ -2035,6 +2039,15 @@ static void __etm4_cpu_restore(struct 
>> etmv4_drvdata *drvdata)
>>       /* Unlock the OS lock to re-enable trace and external debug 
>> access */
>>       etm4_os_unlock(drvdata);
>> +
>> +    /*
>> +     * Re-enable the trace unit if it was enabled before suspend.
>> +     * Put it after etm4_os_unlock() as unlocking the OS lock is the
>> +     * prerequisite for enabling the trace unit.
>> +     */
>> +    if (state->trcprgctlr)
>> +        etm4_enable_trace_unit(drvdata);
>> +
>>       etm4_cs_lock(drvdata, csa);
>>   }
> 


