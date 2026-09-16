Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A22C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 02:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ib231hSrUutdnOZqRRhD3YN7lmhWNHZ9uGVCcHvxjVs=; b=df34e2GGxFiavmYkOT+O6q6yef
	fPd/Wlg051qtbq0bFOv6gi32XLNSEGXYR6uhwCaaNynCAV6zBH7lkIrz67pvYD7i69CKLV1Mv4UCw
	970U58KNPB5jbUfYcavB/n+YdgkWrx9IwfAF0BguutUyZIk3PHseAWod6LOVetMPgwkW8i1juDA82
	IoDnRfCRKvbs7q1n3436UhCLTV7hjzVnt3q5pnp3iaDwkCHRV2FFeU0m/RiKbO9Iljk4/7eP/Mwzx
	Y0UyHgj1d7JEoPj7kewOmFfMhVJfuNOuO3TviwDAe4TPajTWPPjvaHy8sqZf0OJjcsWP4HjJN3Gff
	Q6ZHrqSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6fTd-00000008CIK-0Auz;
	Wed, 16 Sep 2026 02:34:25 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6fTY-00000008CHV-1jQf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 02:34:23 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ib231hSrUutdnOZqRRhD3YN7lmhWNHZ9uGVCcHvxjVs=;
	b=2feBQNUF6Jmmklotoj5ljj3FQ8hmgKUrgH6edAQuUORuB5eObH51JGoPPcyqf3kgHADRVGpiA
	nZjsg5+EgfNyIAwopSdaxepaglv520WpCuWypTP0U9Omq6kEdd9AIRvJ6o6sWfryLvtNmGUwD3r
	zt7apRk7RC/8D+ezGjCniOU=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hl2jn6pDhzKmTc;
	Wed, 16 Sep 2026 10:23:09 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 1D2EA4048B;
	Wed, 16 Sep 2026 10:34:12 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 16 Sep 2026 10:34:11 +0800
Message-ID: <18e3c3d9-562d-42c6-80f6-7744adfad79d@huawei.com>
Date: Wed, 16 Sep 2026 10:34:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/19] arm64: smp: Use generic HOTPLUG_PARALLEL machinery
 for CPU onlining
To: Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-19-will@kernel.org>
 <23be2187-4618-400d-b817-023e6bc8f4bc@huawei.com>
 <aqP6kv9ZfNRWmngj@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aqP6kv9ZfNRWmngj@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_193421_082339_BF0CC2F3 
X-CRM114-Status: GOOD (  22.51  )
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



在 2026/9/11 20:56, Will Deacon 写道:
> On Tue, Sep 08, 2026 at 09:05:18PM +0800, Jinjie Ruan wrote:
>> 在 2026/9/8 0:40, Will Deacon 写道:
>>> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
>>> index 17868b497d7c..bec4bc1b12db 100644
>>> --- a/arch/arm64/kernel/head.S
>>> +++ b/arch/arm64/kernel/head.S
>>> @@ -393,7 +393,6 @@ SYM_FUNC_START_LOCAL(__secondary_switched)
>>>  	mov	x0, x20
>>>  	bl	finalise_el2
>>>  
>>> -	str_l	xzr, __early_cpu_boot_status, x3
>>>  	adr_l	x5, vectors
>>>  	msr	vbar_el1, x5
>>>  	isb
>>> @@ -439,15 +438,15 @@ SYM_FUNC_END(set_cpu_boot_mode_flag)
>>>   * with MMU turned off.
>>>   *
>>>   * update_early_cpu_boot_status tmp, status
>>> - *  - Corrupts tmp1, tmp2
>>> - *  - Writes 'status' to __early_cpu_boot_status and makes sure
>>> + *  - Corrupts tmp1
>>
>> Corrupts tmp1, tmp2 ?
> 
> Well spotted, thanks.
> 
>>> @@ -125,45 +135,42 @@ int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
>>>  
>>>  void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
>>>  {
>>> -	long status;
>>> +	union secondary_status status;
>>>  
>>>  	if (is_alive)
>>>  		return;
>>>  
>>> -	secondary_data.task = NULL;
>>> -	status = READ_ONCE(secondary_data.status);
>>> -	if (status == CPU_MMU_OFF)
>>> -		status = READ_ONCE(__early_cpu_boot_status);
>>> -
>>>  	/* A CPU has failed to boot. Try to figure out what happened. */
>>> -	switch (status & CPU_BOOT_STATUS_MASK) {
>>> -	default:
>>> -		pr_err("CPU%u: failed in unknown state : 0x%lx\n",
>>> -		       cpu, status);
>>> -		cpus_stuck_in_kernel++;
>>> -		break;
>>> -	case CPU_KILL_ME:
>>> -		if (cpumask_test_cpu(cpu, &secondary_data.cpu_died_early_mask))
>>> -			set_cpu_present(cpu, false);
>>> +	if (smp_parallel_bringup)
>>> +		pr_warn_once("Parallel CPU bringup failed; consider passing \"cpuhp.parallel=off\" for a more accurate diagnosis.\n");
>>
>> For some production systems, restarting to reproduce the issue may be
>> troublesome.
> 
> These errors _really_ shouldn't happen with production systems. They are
> caused by critical, deterministic errors such as the secondary CPU not
> supporting the system page size. If you can't reboot in that situation,
> then you have no system!

That does seem to be the case — this kind of situation is usually more
common with firmware issues or during the testing phase before a chip is
commercially available, and these boot problems should already have been
resolved before production systems.

> 
> The parallel bringup code will detect the issue, it just won't be able
> to tell you which CPU caused which issue.

Indeed.

> 
>>> +	if (cpumask_test_cpu(cpu, &secondary_data.cpu_died_early_mask)) {
>>> +		set_cpu_present(cpu, false);
>>>  		if (!op_cpu_kill(cpu)) {
>>>  			pr_crit("CPU%u: died during early boot\n", cpu);
>>> -			break;
>>> +			return;
>>>  		}
>>> -		pr_crit("CPU%u: may not have shut down cleanly\n", cpu);
>>> -		fallthrough;
>>> -	case CPU_STUCK_IN_KERNEL:
>>> -		pr_crit("CPU%u: is stuck in kernel\n", cpu);
>>> -		if (status & CPU_STUCK_REASON_52_BIT_VA)
>>> -			pr_crit("CPU%u: does not support 52-bit VAs\n", cpu);
>>> -		if (status & CPU_STUCK_REASON_NO_GRAN) {
>>> -			pr_crit("CPU%u: does not support %luK granule\n",
>>> -				cpu, PAGE_SIZE / SZ_1K);
>>> -		}
>>> -		cpus_stuck_in_kernel++;
>>> -		break;
>>> -	case CPU_PANIC_KERNEL:
>>> -		panic("CPU%u detected unsupported configuration\n", cpu);
>>>  	}
>>> +
>>> +	pr_crit_once("CPUs may be stuck in kernel\n");
>>
>> Need we print the "cpu"
> 
> You should already get something like:
> 
>   CPUn: will not boot

"will not boot" is only for "cpu_died_early_mask" case, I meant the
"unknown state" case in the original default branch of the switch.

> 
> so I don't think we need anything extra (as, as above, we don't know
> exactly which CPUs are stuck).
> 
>>>  static void init_gic_priority_masking(void)
>>> @@ -407,12 +414,8 @@ void __noreturn cpu_die_early(void)
>>>  
>>>  	cpumask_set_cpu(cpu, &secondary_data.cpu_died_early_mask);
>>
>> It seems unsafe for multiple secondary CPUs to update
>> cpu_died_early_mask concurrently.
> 
> Why? cpumask_set_cpu() is atomic and each CPU only sets their own bit.

Oh! Sorry, I misread it — the underlying implementation uses atomic LSE
or LDXR/STXR instructions.

> 
> Will


