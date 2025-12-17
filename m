Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171D6D66B83
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 18:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ev+GLglo0I9y0Cglcge+QiXghbE/SPBhJSBF3frc4FA=; b=HG/QIABipahrz7FiPQUkGgitZL
	/uRocVtnjQxP4IUjE1kr1v25FjdTnUZ1Z7pWh3/rAWKhZV7jSI0qjSFsnpbU1s94qjrIiUYTWJ4Zm
	EU6/wT4RiYg3KRPq5nh2LZMIhYNBPTVUPWcylNQotzYzOJZCjigYUrK7HkWVqHBJfxtc/FwcJPxyf
	Em5eGZJB/ASZetqHJo8QLEmQL8+1Jbf1J16AhcDkLkRRudoNW46MlqMgjDVZomV61fL7HnKyMBMXD
	n1i3Gp4f6hO/1yy1WBWFuHYT6bS3VTHRH3vpd+bBFLCcXgYd4BENtv08hF4muUKetA3NWwJxt+yvT
	v+YGebLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVwC7-00000007Ggc-3OeA;
	Wed, 17 Dec 2025 18:24:15 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVwC4-00000007GgB-1d2f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 18:24:14 +0000
Message-ID: <51466fd3-c837-46a6-af50-28a8336fd8cd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765995847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ev+GLglo0I9y0Cglcge+QiXghbE/SPBhJSBF3frc4FA=;
	b=oV1hdoNWb8L1eF+62OovjEqJtFSHrow7bmioRSoN4+jr9WCFakAzU7zIrj7cONWHEWYduI
	td5TYT7uIkuQc2njPiSIVqweo3NcRR4G+T7dATl+xRHmibGZniiLkUoAXhdAbvDldBIW28
	yYjoTMXeEWitIoJ75YdztTJ1R4AjLDo=
Date: Wed, 17 Dec 2025 10:23:59 -0800
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next 2/2] bpf: arm64: Optimize recursion detection by
 not using atomics
Content-Language: en-GB
To: bot+bpf-ci@kernel.org, puranjay@kernel.org, bpf@vger.kernel.org
Cc: puranjay12@gmail.com, ast@kernel.org, andrii@kernel.org,
 daniel@iogearbox.net, martin.lau@kernel.org, eddyz87@gmail.com,
 memxor@gmail.com, kernel-team@meta.com, catalin.marinas@arm.com,
 will@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 clm@meta.com, ihor.solodrai@linux.dev
References: <20251217162830.2597286-3-puranjay@kernel.org>
 <f144fd46b602b74fc4c1c2664082fbe893e7ec9c274fcc5fdf13d65151749e9c@mail.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <f144fd46b602b74fc4c1c2664082fbe893e7ec9c274fcc5fdf13d65151749e9c@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_102412_934001_E1EF7651 
X-CRM114-Status: GOOD (  16.44  )
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



On 12/17/25 8:56 AM, bot+bpf-ci@kernel.org wrote:
>> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
>> index 2da986136d26..654fb94bf60c 100644
>> --- a/include/linux/bpf.h
>> +++ b/include/linux/bpf.h
> [ ... ]
>
>> @@ -2006,12 +2009,32 @@ struct bpf_struct_ops_common_value {
>>
>>   static inline bool bpf_prog_get_recursion_context(struct bpf_prog *prog)
>>   {
>> +#ifdef CONFIG_ARM64
>> +	u8 rctx = interrupt_context_level();
>> +	u8 *active = this_cpu_ptr(prog->active);
>> +
>> +	active[rctx]++;
>> +	barrier();
>> +	if (get_unaligned_le32(active) != BIT(rctx * 8))
>> +		return false;
>> +
>> +	return true;
>> +#else
>>   	return this_cpu_inc_return(*(prog->active)) == 1;
>> +#endif
>>   }
> Can preemption between the increment and check cause a counter leak on
> CONFIG_PREEMPT_RCU systems? The trampoline calls this function under
> rcu_read_lock_dont_migrate() which allows preemption on PREEMPT_RCU
> (documented at include/linux/rcupdate.h:856).
>
> Consider this scenario on an ARM64 system with PREEMPT_RCU:
>
> 1. Thread A increments active[0] to 1
> 2. Preemption occurs before Thread A reaches the check
> 3. Thread B on same CPU increments active[0] to 2
> 4. Thread B checks: sees 2 != BIT(0), returns false
> 5. Thread A resumes, checks: sees 2 != BIT(0), returns false
> 6. Both threads return false, neither runs BPF
> 7. Neither calls bpf_prog_put_recursion_context() (see
>     __bpf_prog_enter_recur() at kernel/bpf/trampoline.c:952)
> 8. Counter permanently stuck at 2, all future BPF on this CPU fails
>
> The old atomic code handled this correctly because this_cpu_inc_return()
> completes atomically, ensuring Thread A reads the value 1 before Thread B
> can interfere. With non-atomic operations, Thread A increments but hasn't
> read the value yet, allowing Thread B to interfere and cause both threads
> to see the modified value.
>
> Is there a guarantee that same-context preemption cannot occur in the BPF
> execution path on ARM64, or does this need additional synchronization?

AI is correct here. See below for another thread:
   https://lore.kernel.org/bpf/20251217093326.1745307-1-chen.dylane@linux.dev/T/#m906fd4502fbbedd4609c586122a393363003312a
where preempt_disable is necessary to prevent the above scenario.

But adding preempt_disable may impact the overall system-level performance.

Does this patch can improve performance for *all* ARM64 cpu versions?
Do you have numbers to show how much performance improvement?

>
>> @@ -2006,12 +2009,32 @@ struct bpf_struct_ops_common_value {
>>
>>   static inline void bpf_prog_put_recursion_context(struct bpf_prog *prog)
>>   {
>> +#ifdef CONFIG_ARM64
>> +	u8 rctx = interrupt_context_level();
>> +	u8 *active = this_cpu_ptr(prog->active);
>> +
>> +	barrier();
>> +	active[rctx]--;
>> +#else
>>   	this_cpu_dec(*(prog->active));
>> +#endif
>>   }
[...]

