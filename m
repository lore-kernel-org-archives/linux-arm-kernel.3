Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A89C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 10:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dj0K4EbKEWPw+E6cEyU5Wt750OYTkC+ep01W10RCgXc=; b=BCgO+MmQBLGNhSb9/4ZQ7Op4rS
	7Vl7jHHxh1jwuAyov6uJdCVKzCLpn86saPVLNMHQUOtfm4zaH4ePmqqke02cwVE3Az2RYFZwufjmW
	yTCnSxfMzt+S7JbD9PEeNPdZnq3gdCGB1MF3nWkBeWiuyYeSypk9seTorbadqgLnRQHSR5aHs9Icj
	iZwxhf0m8mtxX3TS3A6cpUld37BUOjnhNNiYglmY1GjIK6gsX/1wkTdZwEDMQs827hylawXEmdR/2
	DHJTIuurHZjL2W78wgEEsPBHvrJWXwVBknjPjsDhiFeEVSrDS2p2ly3bE5cnfWGGjosZNZ73jAVoG
	eS/I4wAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaR5-0000000Ba75-0hoE;
	Tue, 14 Jul 2026 10:32:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaR2-0000000Ba6d-2aca
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 10:32:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1547497;
	Tue, 14 Jul 2026 03:32:14 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B33F13F7B4;
	Tue, 14 Jul 2026 03:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784025139; bh=VPaDZKZaVIdaeG32n73WwtZk8gcop7EyMXtxcN5MFo0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vOuM+MqVDTrdwCFZM6aRD+cfRY9pB+xnzby3/dylYhZNgFUwThC0lQZBFnVAiJW8Z
	 7Fe0/rEdnMRv6ZRwhO+A65XGYFUTqOtSiXLf7/N2DRk0EN4vfRH4uYwdf84r/DuV33
	 W6DJgddvvsgmCoajbTdbcROavVxs52rCYNmwvqLA=
Message-ID: <b70b65b7-8ea4-4dc9-bf0b-f184e14d4850@arm.com>
Date: Tue, 14 Jul 2026 11:32:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/36] arm64: Add support for FEAT_NMI
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <375ee9ac-f715-47bf-8f0d-7ec8dc35c7f2@huawei.com>
 <bb6e80db-dd5e-405f-9aa9-2a59fae3a1dc@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <bb6e80db-dd5e-405f-9aa9-2a59fae3a1dc@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_033220_737212_317AEEE5 
X-CRM114-Status: GOOD (  26.36  )
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

On 7/14/26 10:00, Jinjie Ruan wrote:
> 
> On 7/14/2026 4:37 PM, Jinjie Ruan wrote:
>> Hi, Vladimir,
>>
>> On QEMU, if the CPU supports FEAT_NMI but gic-version=2, the kernel
>> panic as following:
>>
>> [    0.000000] CPU features: detected: HCRX_EL2 register
>> [    0.000000] CPU features: detected: Non-maskable Interrupts
>> [    0.000000] CPU features: kernel page table isolation forced ON by KASLR
>> [    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
>> [    0.000000] CPU features: detected: ARM erratum 845719
>> [    0.000000] alternatives: applying boot alternatives
>> [    0.000000] Kernel command line: root=/dev/vda rw console=ttyAMA0
>> kgdboc=ttyAMA0,115200 earlycon preempt=full irqchip.gicv3_pseudo_nmi=0 0
>> [    0.000000] Unknown kernel command line parameters "preempt=full",
>> will be passed to user space.
>> [    0.000000] printk: log buffer data + meta data: 131072 + 458752 =
>> 589824 bytes
>> [    0.000000] Dentry cache hash table entries: 1048576 (order: 11,
>> 8388608 bytes, linear)
>> [    0.000000] Inode-cache hash table entries: 524288 (order: 10,
>> 4194304 bytes, linear)
>> [    0.000000] software IO TLB: area num 8.
>> [    0.000000] software IO TLB: mapped [mem
>> 0x00000000e4000000-0x00000000e8000000] (64MB)
>> [    0.000000] Fallback order for Node 0: 0
>> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:
>> 3145728
>> [    0.000000] Policy zone: Normal
>> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
>> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
>> [    0.000000] Running RCU self tests
>> [    0.000000] Running RCU synchronous self tests
>> [    0.000000] rcu: Preemptible hierarchical RCU implementation.
>> [    0.000000] rcu:     RCU event tracing is enabled.
>> [    0.000000] rcu:     RCU lockdep checking is enabled.
>> [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=512 to
>> nr_cpu_ids=8.
>> [    0.000000]  Trampoline variant of Tasks RCU enabled.
>> [    0.000000]  Tracing variant of Tasks RCU enabled.
>> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
>> is 25 jiffies.
>> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
>> [    0.000000] Running RCU synchronous self tests
>> [    0.000000] RCU Tasks: Setting shift to 3 and lim to 1
>> rcu_task_cb_adjust=1 rcu_task_cpu_ids=8.
>> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
>> [    0.000000] Root IRQ handler: gic_handle_irq
>> [    0.000000] ------------[ cut here ]------------
>> [    0.000000] Could not request IRQ 4 as NMI, err=-22
>> [    0.000000] WARNING: arch/arm64/kernel/smp.c:1103 at
>> set_smp_ipi_range_percpu+0x2c0/0x31c, CPU#0: swapper/0/0
>> [    0.000000] Modules linked in:
>> [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
>> 7.2.0-rc1-00036-g6fbe132d3a74-dirty #353 PREEMPT
>> [    0.000000] Hardware name: linux,dummy-virt (DT)
>> [    0.000000] pstate: 600000c5 (nZCv daIF -ALLINT -PAN -UAO -TCO -DIT
>> -SSBS BTYPE=--)
>> [    0.000000] pc : set_smp_ipi_range_percpu+0x2c0/0x31c
>> [    0.000000] lr : set_smp_ipi_range_percpu+0x2c0/0x31c
>> [    0.000000] sp : ffffffdadd5d3b90
>> [    0.000000] x29: ffffffdadd5d3b90 x28: 0000000000102200 x27:
>> ffffffdadc1e49a0
>> [    0.000000] x26: ffffff82fe7a7008 x25: 0000000000000008 x24:
>> 0000000000000004
>> [    0.000000] x23: ffffffdadd5e4078 x22: ffffffdadc9340c8 x21:
>> ffffffdadc92c470
>> [    0.000000] x20: 0000000000000003 x19: ffffffdadd5e02b0 x18:
>> 00000000ffffffff
>> [    0.000000] x17: 20313d7473756a64 x16: 615f62635f6b7361 x15:
>> ffffffdb5d5d37b7
>> [    0.000000] x14: 0000000000000000 x13: ffffffdadd60aaa8 x12:
>> 0000000000000041
>> [    0.000000] x11: 00000000000000c3 x10: ffffffdadd67aa90 x9 :
>> ffffffdadd60aaa8
>> [    0.000000] x8 : 3ffffffffffff000 x7 : 0000000000000001 x6 :
>> 0000000000000001
>> [    0.000000] x5 : ffffffdadd662aa8 x4 : 0000000000000000 x3 :
>> 0000000000000000
>> [    0.000000] x2 : 0000000000000000 x1 : 0000000000000000 x0 :
>> ffffffdadd5eb780
>> [    0.000000] Call trace:
>> [    0.000000]  set_smp_ipi_range_percpu+0x2c0/0x31c (P)
>> [    0.000000]  __gic_init_bases+0x138/0x148
>> [    0.000000]  gic_of_init+0x88/0x3ec
>> [    0.000000]  of_irq_init+0x1bc/0x458
>> [    0.000000]  irqchip_init+0x18/0x40
>> [    0.000000]  init_IRQ+0xa8/0x218
>> [    0.000000]  start_kernel+0x550/0xa98
>> [    0.000000]  __primary_switched+0x88/0x90
>> [    0.000000] Kernel panic - not syncing: kernel: panic_on_warn set ...
>> [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
>> 7.2.0-rc1-00036-g6fbe132d3a74-dirty #353 PREEMPT
>> [    0.000000] Hardware name: linux,dummy-virt (DT)
>> [    0.000000] Call trace:
>> [    0.000000]  show_stack+0x18/0x24 (C)
>> [    0.000000]  dump_stack_lvl+0x18c/0x1d4
>> [    0.000000]  dump_stack+0x18/0x24
>> [    0.000000]  vpanic+0x590/0x594
>> [    0.000000]  do_panic_on_target_cpu+0x0/0x1c
>> [    0.000000]  check_panic_on_warn+0x8c/0x9c
>> [    0.000000]  __warn+0xa0/0x2cc
>> [    0.000000]  __report_bug+0xe0/0x19c
>> [    0.000000]  report_bug+0x50/0x10c
>> [    0.000000]  bug_brk_handler+0x24/0x70
>> [    0.000000]  call_el1_break_hook+0x6c/0xc8
>> [    0.000000]  do_el1_brk64+0x24/0x4c
>> [    0.000000]  el1_brk64+0x38/0x64
>> [    0.000000]  el1h_64_sync_handler+0xa8/0x134
>> [    0.000000]  el1h_64_sync+0x80/0x84
>> [    0.000000]  set_smp_ipi_range_percpu+0x2c0/0x31c (P)
>> [    0.000000]  __gic_init_bases+0x138/0x148
>> [    0.000000]  gic_of_init+0x88/0x3ec
>> [    0.000000]  of_irq_init+0x1bc/0x458
>> [    0.000000]  irqchip_init+0x18/0x40
>> [    0.000000]  init_IRQ+0xa8/0x218
>> [    0.000000]  start_kernel+0x550/0xa98
>> [    0.000000]  __primary_switched+0x88/0x90
>> [    0.000000] ---[ end Kernel panic - not syncing: kernel:
>> panic_on_warn set ... ]---
> Hi Vladimir,
> 
> Even if PE supports FEAT_NMI, the GIC may not be able to generate a
> super-priority interrupt.
> 
> The following patch can fix it, we should use
> gic_supports_v3_3_nmi() instead of system_uses_nmi() in
> ipi_should_be_nmi() because the GIC.
> 

Thanks for the report!

I think it would be better for me to spend some time making the arch
IPI code tolerate both the presence and absence of NMI support,
perhaps similar to how perf handles this, rather than creating a
strong dependency between the architecture code and the interrupt
controller. At least, I’ll give that a try!

> One more small suggestion: gic_data.has_nmi is a very important piece of
> information, and we should print it out, as some versions of GICv3
> hardware may not support FEAT_GICv3_NMI.
> 

I'll have a look, thanks!

> Best regards,
> Jinjie
> 
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -1035,7 +1035,7 @@ static void smp_cross_call(const struct cpumask
> *target, unsigned int ipinr)
> 
>  static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
>  {
> -       if (!system_uses_nmi() && !system_uses_irq_prio_masking())
> +       if (!gic_supports_v3_3_nmi() && !system_uses_irq_prio_masking())
>                 return false;
> 
>         switch (ipi) {
>  /*
> @@ -2124,6 +2126,8 @@ static int __init gic_init_bases(phys_addr_t
> dist_phys_base,
> 
>         gic_data.has_rss = !!(typer & GICD_TYPER_RSS);
>         gic_data.has_nmi = !!(typer & GICD_TYPER_NMI);
> +       pr_info("GICv3 Non-maskable interrupt property %s supported\n",
> +               gic_data.has_nmi ? "is" : "not");
> 
>         if (typer & GICD_TYPER_MBIS) {
>                 err = mbi_init(handle, gic_data.domain);
> diff --git a/include/linux/irqchip/arm-gic-v3.h
> b/include/linux/irqchip/arm-gic-v3.h
> index ebccd76cadda..6bf73e7b9600 100644
> --- a/include/linux/irqchip/arm-gic-v3.h
> +++ b/include/linux/irqchip/arm-gic-v3.h
> @@ -661,6 +661,7 @@ static inline bool gic_enable_sre(void)
>         return !!(val & ICC_SRE_EL1_SRE);
>  }
> 
> +bool gic_supports_v3_3_nmi(void);
>  #endif
> 
> 

Cheers
Vladimir

