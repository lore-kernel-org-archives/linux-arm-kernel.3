Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC7FC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 11:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tq6CfDZwT6y7fOu5hClaRiQxRwv97Ot26OLFtz377hA=; b=2TYeuCjq4rgRhcfzRzBpLlkRRe
	dlxuXxXxMilBELpZeKzllGczNKBZQJbAW7EumJFqmNETDipB2XrPL8TaWM0SpdWInoKt28fJBrI4U
	W4nq1PuBZCM5oyw5bvmoVR2G23Ae52LHIKqtl54ZHqwmdJfC0jnVtS/cZqm9L2TNtYV0MvE+20V/j
	hKDZI11cJj/aXxcalDI00GuUhn3YhaszYxbr/4mTcOgSxSKW7VEvxGA/reXcOFB2EAUGLWGtraHBm
	iit5BldkuKjE9DztxnLMmgK56EJ4ERq6oG0QOnCFjP9vqNuEMinry6YVncwsMgOU0RyMowNhncL+b
	QxqRai2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlqd-0000000DAmn-1f1Q;
	Wed, 04 Jun 2025 10:59:55 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlhn-0000000D9sK-1fjN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 10:50:48 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a36748920cso7286867f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 03:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749034245; x=1749639045; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tq6CfDZwT6y7fOu5hClaRiQxRwv97Ot26OLFtz377hA=;
        b=GXLlliPivXukqtFDOcO+9v5761JgInDnrkBPFeiNwm057bF43pfMMahbkFUTcuP4IW
         kh7Oci/Zwc5136s7vz3gW8qRTktokiXzFcBF63tPZLvSy+N9jICAIZhU7x7TUtWqyiDu
         E8FLuAS/OW5rj07te/nnmGA2QNDoBEPoj2MFAxT3MASnUfEt7E+TEnNP2vZ0p6ZQjrS/
         bSkp9QvXoIE+AHOY9Nh7a2ImXCBe3dnJ2UKzhMihmZ8sc0gIN1xmSuGWwgcSsUA9k9dn
         s6V9U6PD6png11GCNAa5nzpTSPq2fGqPc3zNJTi84NGqIEVB4vnCDTRvuSFRuWneVRNQ
         mrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749034245; x=1749639045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tq6CfDZwT6y7fOu5hClaRiQxRwv97Ot26OLFtz377hA=;
        b=KmfyMgDnoYJAKe0DNGgF0+/Gwp5aUQHR4m1txJmsThBJ3Jt7IEEKtZ9HKTjkGBxLJu
         f8ZvaFTGUh4gNSj46XAVZUQFjMxaLD48fINzTAyTaPfp72+Vu0OCrvFsXDzl+yyMZc98
         Ki74ucTl1PbxRL7ylG6K7QCEQrNDFFpTbEoc2F+v155X/8WTIxIP/bK5OXx4PIvMde6g
         3NgBTWRLRfdoL6KPTXJo0ElUw90aGRjFpaC7jP5EPULHKABed5FjUMjdRGabb13okGxh
         mGsH4DZmYWjc4RMZ2IZlz+qf8a1IGRwzmkiiCdPzm70923kJqZYnP3rKcqOjhtJfEMT7
         PzBw==
X-Forwarded-Encrypted: i=1; AJvYcCUXKrkx2NkQOz2O9zGD3S8bt0b9Spd7kuA6YXB+7EcUvwq444LZ3FJb25c15izuElZLzM/V73/rLyiM+2EsPk3P@lists.infradead.org
X-Gm-Message-State: AOJu0YxgMBz4Wy41f1HzO/ZfTabBiPsuCHLYqA2VvC+KrSMnopqT7l6a
	0llq6SPO7Y2zZv7oMXWkXzjahjq81Wr+hazA397VrEE28dk0JiGz347mn3M1p1NSc31fLKWxeO0
	CSjDo5zw=
X-Gm-Gg: ASbGnctfMkHDKfZnzc2BTCPAW/zGhInoIq1DbHpgIGVtjO3s5F48Qflc2fWXxjeack3
	HIp61Yd3FrNIBnmxe3tlUVyy+sol8xaWkmhTOLZFbvCpYa5lffFNpaxnRzRzJI1ncF9Tiu3Gffw
	7JikD1xejjMV/sssMhMGiTxyWpDex56zQ2PvqQAEzfaYe/hUlOtFtHa4z0q5pPTL3bQtEZ9hYJa
	mqqbhYBNoBl0On4iDQXuaRMWj1dA3euCbBjYPZgj1q7tiGeGDwmyIJmdOJ5BDIHczFvCjvAjDT5
	3d/FMd2fWEh5PaBF1Fo3ZYK60rVOTKupApOBHRN+3zalaJV57LxZ9aEQ
X-Google-Smtp-Source: AGHT+IFgGDOXwb5Al7TPXkPXZT0YnSetnMN5MV6Cpfn7r5avD3ofFo4Rn0UHHTZ1VY2g9SBGbSs8DA==
X-Received: by 2002:a05:6000:2c12:b0:3a0:9dfc:da4 with SMTP id ffacd0b85a97d-3a51d96ab81mr1841041f8f.42.1749034245468;
        Wed, 04 Jun 2025 03:50:45 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009752esm21308070f8f.74.2025.06.04.03.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 03:50:45 -0700 (PDT)
Message-ID: <3766612b-b72d-4ef1-83e7-fe7639104b6c@linaro.org>
Date: Wed, 4 Jun 2025 11:50:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] coresight: etm4x: Control the trace unit in CPU
 suspend
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, Yabin Cui <yabinc@google.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20250516160742.1200904-1-leo.yan@arm.com>
 <20250516160742.1200904-2-leo.yan@arm.com>
 <f8ef3a37-2be2-4c07-bd88-888fedc4cd4d@linaro.org>
 <58fc37a9-37c4-4a8f-b1b3-6f18f2b67618@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <58fc37a9-37c4-4a8f-b1b3-6f18f2b67618@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_035047_449220_1E500A6A 
X-CRM114-Status: GOOD (  30.54  )
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



On 04/06/2025 10:48 am, Suzuki K Poulose wrote:
> On 03/06/2025 14:40, James Clark wrote:
>>
>>
>> On 16/05/2025 5:07 pm, Leo Yan wrote:
>>> If a trace unit has been enabled, a CPU suspend operation misses to
>>> disable the trace unit.  After the CPU resumes, it also does not follow
>>> the general flow for re-enabling the trace unit.  As a result, this may
>>> lead to a wrong state machine for the ETM.
>>>
>>> This commit stops the trace unit during the CPU suspend flow and
>>> re-enables the trace unit in the resume flow.
>>>
>>> Fixes: f188b5e76aae ("coresight: etm4x: Save/restore state across CPU 
>>> low power states")
>>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>>> ---
>>>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 15 +++++++++++ 
>>> +++-
>>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/ 
>>> drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> index 6a5898355a83..b12d59b89a49 100644
>>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> @@ -1820,6 +1820,11 @@ static int __etm4_cpu_save(struct 
>>> etmv4_drvdata *drvdata)
>>>       state = drvdata->save_state;
>>>       state->trcprgctlr = etm4x_read32(csa, TRCPRGCTLR);
>>> +
>>> +    /* Stop the trace unit if it is enabled */
>>> +    if (state->trcprgctlr)
>>
>> etm4_cpu_save() looks at coresight_get_mode() to determine enabled 
>> state. Seems a bit inconsistent to look directly at the enable bit 
>> right after checking coresight_get_mode().
> 
> May be this is due to AUX pause case ? The mode could still be PERF, but
>   the ETM/ETE is disabled ?
> 

Disabling unconditionally would be harmless, and that's quite a bit of 
an edge case so it might be worth the simplification.

Then __etm4_cpu_save() could remove the duplicate wait on 
TRCSTATR_PMSTABLE_BIT and multiple reads of TRCPRGCTLR. There are other 
inconsistencies like one does etm4x_relaxed_read32(csa, TRCPRGCTLR) and 
the other does etm4x_read32(csa, TRCPRGCTLR).


>>
>>> +        etm4_disable_trace_unit(drvdata);
>>> +
>>
>> Section 3.4.1 in ARM IHI 0064H.b doesn't say that anything extra needs 
>> to be done here, and it implies that restoring to an enabled state 
>> should work. It might make sense to mention why it diverges from the 
>> published sequence. Or get the sequence updated? I suppose that 
>> document doesn't include ETE and I see there is one extra register 
>> missing from __etm4_cpu_save() which is written to in 
>> etm4_disable_trace_unit().
>>
>> Plus we end up doing extra things like two waits on TRCSTATR.PMSTABLE.
> 
> I guess, we need to stop the tracing before we reliably capture the
> register states (similar to the disable/pause sequence).
> 

Is that because the counters and comparators are changing? I'm not sure 
why we need to read everything anyway, etm4_enable_hw() is done entirely 
from drvdata, implying that everything we need is already saved.

If there are only two things that might be different to drvdata 
(TRCSSCSRn and TRCCNTVRn) we could only save those in __etm4_cpu_save(). 
But then the function looks an awful lot like etm4_disable_hw() and I 
wonder if there isn't a way to share the code to show we're doing 
basically the same thing.

There are a few other small inconsistencies between disabling and saving 
like etm4_disable_hw() removes power first and __etm4_cpu_save() does it 
last. And __etm4_cpu_restore() doesn't follow the correct sequence to 
write to TRCCLAIMSET.

Could it look something like this:

void __etm4_cpu_save()
{
   etm4_disable_hw(drvdata);
   drvdata->state_needs_restore = true;
}


void __etm4_cpu_restore()
{
   etm4_enable_hw(drvdata, false);
   drvdata->state_needs_restore = false;
}

Where the extra argument for enable stops clearing the comparator status:

void etm4_enable_hw(struct etmv4_drvdata *drvdata, bool clear_cmp)
{
   /* clear status bit on restart if using single-shot */
   if (clear_cmp && (config->ss_ctrl[i] || config->ss_pe_cmp[i]))
      config->ss_status[i] &= ~TRCSSCSRn_STATUS;


> Suzuki
> 
>>
>>>       if (drvdata->nr_pe)
>>>           state->trcprocselr = etm4x_read32(csa, TRCPROCSELR);
>>>       state->trcconfigr = etm4x_read32(csa, TRCCONFIGR);
>>> @@ -1951,7 +1956,6 @@ static void __etm4_cpu_restore(struct 
>>> etmv4_drvdata *drvdata)
>>>       etm4_cs_unlock(drvdata, csa);
>>>       etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
>>> -    etm4x_relaxed_write32(csa, state->trcprgctlr, TRCPRGCTLR);
>>>       if (drvdata->nr_pe)
>>>           etm4x_relaxed_write32(csa, state->trcprocselr, TRCPROCSELR);
>>>       etm4x_relaxed_write32(csa, state->trcconfigr, TRCCONFIGR);
>>> @@ -2035,6 +2039,15 @@ static void __etm4_cpu_restore(struct 
>>> etmv4_drvdata *drvdata)
>>>       /* Unlock the OS lock to re-enable trace and external debug 
>>> access */
>>>       etm4_os_unlock(drvdata);
>>> +
>>> +    /*
>>> +     * Re-enable the trace unit if it was enabled before suspend.
>>> +     * Put it after etm4_os_unlock() as unlocking the OS lock is the
>>> +     * prerequisite for enabling the trace unit.
>>> +     */
>>> +    if (state->trcprgctlr)
>>> +        etm4_enable_trace_unit(drvdata);
>>> +
>>>       etm4_cs_lock(drvdata, csa);
>>>   }
>>
> 


