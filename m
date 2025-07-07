Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCFBC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 12:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tuqC9beYeXQDyom1+KuHCuf6wqm7fyMn+vwlhFtjQHU=; b=N2Bz+r5Kv4gg+CDsmPrjDzau4x
	bxW3lZM2/e1/HaOxIjgHWqab8OLNYVsrGc75FLSIPSpxC++h5A/ebEgIzmpxQa1b6B46u58f9B7AD
	RDvogeVtKKWReJRAq9OP2IeeoBd21cAGn5wla0sE/W/PHxHa1FmElQex/ZOXwhPL7rKDl1uXvFDFB
	RB0FO7jCVBrimgBW8khxYDQFV7uYJ3pEjktruokTYEPKqkhzNgTRg2zzbAR+CKKLY5x7yA+P89xTb
	cqzp0gHCaE/WduodXu34VixtyBoErAVcv3zA23tUG4mgqnW0Ygcoe5ST1yfcHnMtJeKNEwNCwzsEF
	mhB71Y0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYka1-00000002NLZ-3gWo;
	Mon, 07 Jul 2025 12:04:17 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYkCW-00000002Ind-02jP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 11:40:01 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a588da60dfso1931173f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 04:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751888398; x=1752493198; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tuqC9beYeXQDyom1+KuHCuf6wqm7fyMn+vwlhFtjQHU=;
        b=ogUGfGN9ZfsFh3FCQzJmXwdUKZTrHsQhEjoxAco6AYAx4D+j9XWRuiW4aWo7dyYl2k
         i47K1DBN/wlPOZlHhvghkdGS8HSN2gPnJnHJNrpGJGhpP45OLR7WYnQWyzrXBWnX7cHR
         X6GF4A6HxgLdFokXeDpAB+QlKrLIqrypDUy1NQreEpdvQYHLg7fVl3cgmoZED0U3VEUY
         px3Naiw28kctoSWzVtVZnfYpW7uXX9Ciy6/EjBV/c0cpF81R4r0HyL+LBb66f3C3tsVo
         DnWefjOjV8KULoC6NjZPZSiapBF+CujnNY7yDV7l3M0k9WJqKFbETchUg5jqn8u8HQEn
         RSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751888398; x=1752493198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tuqC9beYeXQDyom1+KuHCuf6wqm7fyMn+vwlhFtjQHU=;
        b=c8lhf3/KnrTO0VKCYSmnJ2WNq1NFxV0aACGYoeOM9HmaZirwTg5fYh6/z0HH8gDVeW
         syOwO9K1UKY+nrBeFr2UfLVBdWYaUYo0Zcj2zQoVBdgH+6F98FpTScAGJDWBACPQA+Ee
         ES8kGuLtzRKFRZaTwbMSJTagKuynkV2xnKXKfQ7K0Aq99ooYemdDKgVeEEfjUxxzhOmr
         eEAaLcEox/U5Og9B51MGNFmsu63CUrFvJKtphhOZtVmxTzAtyVN65h29UvjEuHXMvYiC
         UlyK+/y70xYd6EZkWPlwD0DbFukQmNUuvk44y94RZDFSViij1qk5rQCM0yW8Bpll2GpO
         AZYg==
X-Forwarded-Encrypted: i=1; AJvYcCWTnAgD2fSlSbsZBYDL2aQl/Ffel0e1a2FJzrSXTOyEtpjENiQrKQRz6A8EFMU9gs4w0a1rSHlVaOn8+VeCc2oN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx55PcJKfzdGsKOqDD3ZRlDYtnELYdpr1gTGx3eRaJbkg1l6eFC
	ESm66qDzzhCpGBFDyuDnG/EOaY7OUNn8sV5nEz1rFKHWl4WPBV01Lc15Bstp3SVbB24=
X-Gm-Gg: ASbGncvDb/1GR8Uzylc8M4Ch2lH9NUwguMdiI3kjy3S9qrt9vxJHg1ZpSsy0eZtjLtP
	fFOw38FiGvMZPQ9t3X3KBOhDH0wj6mGE3MrNQTUE0Ob5eAyNtS+nHflkwLN+8V9bQ1PmHFfC0sn
	Ex8jbDmDRNFwTtiZWx/dtMSNPYuIPGy3cza9YR0PdI+gnKjZmTaLAttNKOARuEWAL57WIdnEL+3
	W0LwU1xta1HLVRlvMbrEhSMOnwksWBvi4RrT80honcVS6hgHEOfqw36qIrsJj5FRIvj7/T52ssV
	DdUcux7ZfrUvE66t8xRtoq662H/U2FGU4rWr4heMGc8b+DDxeFQa23acU7dHcGSfqUQ=
X-Google-Smtp-Source: AGHT+IGDItNt/gQIylGSzRr2n2QM8HyI4XMr7tCVaXbrsZo7Z/t7OtW5bunomLUqBKEeZpRqJk5pSA==
X-Received: by 2002:a05:6000:208a:b0:3a5:2698:f65d with SMTP id ffacd0b85a97d-3b4964dedf7mr8422836f8f.27.1751888398358;
        Mon, 07 Jul 2025 04:39:58 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16865c2sm108604675e9.19.2025.07.07.04.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 04:39:57 -0700 (PDT)
Message-ID: <b77f12e7-ea3f-4c57-9706-ff8e32721cc8@linaro.org>
Date: Mon, 7 Jul 2025 12:39:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] perf: arm_spe: Disable buffer before writing to
 PMBPTR_EL1 or PMBSR_EL1
To: Leo Yan <leo.yan@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Alexandru Elisei <Alexandru.Elisei@arm.com>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Rob Herring <Rob.Herring@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
 Robin Murphy <Robin.Murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
 <20250701-james-spe-vm-interface-v1-2-52a2cd223d00@linaro.org>
 <20250704155016.GI1039028@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250704155016.GI1039028@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_044000_062088_7A363031 
X-CRM114-Status: GOOD (  30.68  )
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



On 04/07/2025 4:50 pm, Leo Yan wrote:
> On Tue, Jul 01, 2025 at 04:31:58PM +0100, James Clark wrote:
> 
> [...]
> 
>> @@ -661,16 +666,24 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
>>   	 */
>>   	irq_work_run();
>>   
>> +	/*
>> +	 * arm_spe_pmu_buf_get_fault_act() already drained, and PMBSR_EL1.S == 1
>> +	 * means that StatisticalProfilingEnabled() == false. So now we can
>> +	 * safely disable the buffer.
>> +	 */
>> +	write_sysreg_s(0, SYS_PMBLIMITR_EL1);
>> +	isb();
>> +
>> +	/* Status can be cleared now that PMBLIMITR_EL1.E == 0 */
>> +	write_sysreg_s(0, SYS_PMBSR_EL1);
>> +
> 
> An important thing is about sequence:
> As described in arm_spe_pmu_disable_and_drain_local(), should we always
> clear ELs bits in PMSCR_EL1 before clear PMBLIMITR_EL1.E bit? As a
> reference, we could see TRBE always clear ELx bits before disable trace
> buffer.
> 
> And a trivial flaw:
> 
> If the TRUNCATED flag has been set, the irq_work_run() above runs the
> IRQ work to invoke the arm_spe_pmu_stop() to disable trace buffer, which
> clear SYS_PMBLIMITR_EL1.E bit. This is why the current code does not
> explictly clear SYS_PMBLIMITR_EL1.E bit.
> 
> With this patch, the interrupt handler will clear SYS_PMBLIMITR_EL1.E
> bit twice for a trunacated case.
> 
> 

I suppose that's a rarer case that we don't necessarily have to optimize 
for. I don't think it will do any harm, but is it even possible to avoid?

There are already some other duplications in the driver, for example in 
arm_spe_pmu_stop() we call arm_spe_pmu_disable_and_drain_local() which 
drains, and then arm_spe_pmu_buf_get_fault_act() which also drains again.

>>   	switch (act) {
>>   	case SPE_PMU_BUF_FAULT_ACT_FATAL:
>>   		/*
>> -		 * If a fatal exception occurred then leaving the profiling
>> -		 * buffer enabled is a recipe waiting to happen. Since
>> -		 * fatal faults don't always imply truncation, make sure
>> -		 * that the profiling buffer is disabled explicitly before
>> -		 * clearing the syndrome register.
>> +		 * To complete the full disable sequence, also disable profiling
>> +		 * at EL0 and EL1, we don't want to continue at all anymore.
>>   		 */
>> -		arm_spe_pmu_disable_and_drain_local();
>> +		write_sysreg_s(0, SYS_PMSCR_EL1);
>>   		break;
>>   	case SPE_PMU_BUF_FAULT_ACT_OK:
>>   		/*
>> @@ -679,18 +692,14 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
>>   		 * PMBPTR might be misaligned, but we'll burn that bridge
>>   		 * when we get to it.
>>   		 */
>> -		if (!(handle->aux_flags & PERF_AUX_FLAG_TRUNCATED)) {
>> +		if (!(handle->aux_flags & PERF_AUX_FLAG_TRUNCATED))
>>   			arm_spe_perf_aux_output_begin(handle, event);
>> -			isb();
> 
> I am a bit suspecious we can remove this isb().
> 
> As a reference to the software usage PKLXF in Arm ARM (DDI 0487 L.a),
> after enable TRBE trace unit, an ISB is mandatory. Maybe check a bit
> for this?
> 
> Thanks,
> Leo
> 

Wasn't this isb() to separate the programming of the registers with the 
status register clear at the end of this function to enable profiling?

But now we enable profiling with the write to PMBLIMITR_EL1 in 
arm_spe_perf_aux_output_begin() and the last thing here is the ERET. 
That's specifically mentioned as enough synchronization in PKLXF:

   In the common case, this is an ERET instruction that returns to a
   different Exception level where tracing is allowed.

>> -		}
>>   		break;
>>   	case SPE_PMU_BUF_FAULT_ACT_SPURIOUS:
>>   		/* We've seen you before, but GCC has the memory of a sieve. */
>>   		break;
>>   	}
>>   
>> -	/* The buffer pointers are now sane, so resume profiling. */
>> -	write_sysreg_s(0, SYS_PMBSR_EL1);
>>   	return IRQ_HANDLED;
>>   }
>>   
>>
>> -- 
>> 2.34.1
>>
>>


