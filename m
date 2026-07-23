Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D80C4453D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 02:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuGwipoYOBur1+Yi6fhSnda/qeR92ZcTkhHKhGqfw5o=; b=Aqa7Ub2nUIBq/oylZY1x+pzCoi
	JjzT2tFcP4KbUvtmOORL9tlt5YXcVeVYBlu22WbwXUENGzQsh8ZEXTVsBVcr8E1vFTYRpNRVR1SIE
	jtl3cxEucgBr6OfXTyjlMVvXNlUb5YoSClW8+OOvOo+uUKLApAkd6SXgsHPhUBqL0kr0y5WlsDts2
	x75QvmjMai0JrtuXEGR0MbE2NiU8Bap6kXahsChd5RzgxKvjxMcWS6Ju33qT2BeJ5KUVZGvbliSPf
	e2EBIS1qnpYuEXSpd5scE0KILryf8n+iOzZO6A4Yqy+4DP3G2IZE6SYY6oNBuQ6i7WExa+fgSwFcn
	ZQcc7mdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjV1-0000000DGJz-0dZT;
	Thu, 23 Jul 2026 02:49:27 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjUx-0000000DGJC-36QB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 02:49:25 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yuGwipoYOBur1+Yi6fhSnda/qeR92ZcTkhHKhGqfw5o=;
	b=P4gdf86jK9grHowwl0tJGg3QRwzO2F+y2EoRUSVFvkr3HWV/5kOTDSgOh4maYzYO+yzderc13
	b+OC8J7Fk8IWeNqrKi9wNgXdEL5cKbR0e/aIwfnvuIR3v1RtmKTebrfOIc3EX5z0DJfJGvgVXvC
	xGS7yR0UuO96X8xN9X2JkQg=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4h5FhP1RjpzmV7C;
	Thu, 23 Jul 2026 10:39:49 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7F63B4055B;
	Thu, 23 Jul 2026 10:49:12 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 23 Jul 2026 10:49:11 +0800
Message-ID: <6e13c10f-ccc2-48c3-bf8a-d65133a33e17@huawei.com>
Date: Thu, 23 Jul 2026 10:49:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: smp: distinguish secondary CPUs that hang after
 reaching head.S
To: Naman Jain <namjain@linux.microsoft.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Marc Zyngier <maz@kernel.org>, Thomas Huth <thuth@redhat.com>, Fuad Tabba
	<fuad.tabba@linux.dev>, Thomas Gleixner <tglx@kernel.org>, Pengjie Zhang
	<zhangpengjie2@huawei.com>, mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Saurabh Sengar <ssengar@linux.microsoft.com>
References: <20260722113044.1835365-1-namjain@linux.microsoft.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260722113044.1835365-1-namjain@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_194924_102266_D8944AE0 
X-CRM114-Status: GOOD (  32.10  )
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



在 2026/7/22 19:30, Naman Jain 写道:
> When a secondary CPU fails to come online, __cpu_up() falls back to
> __early_cpu_boot_status, but boot status 0x0 is ambiguous: it cannot
> distinguish a CPU that never executed head.S (firmware/hypervisor never
> dispatched it, so it never ran a single instruction) from one that
> entered head.S, started executing, and then got stuck somewhere in kernel
> bring-up. Add a change to let us tell those two cases apart, which
> narrows down where to look when a CPU goes missing during boot.

I previously encountered this issue when debugging the parallel startup
of ARM64 secondary cores. It is difficult for the kernel to determine
whether the secondary core is hung in the firmware or whether it has not
executed a single instruction. So I think this motive is reasonable.

> 
> Write a sentinel (CPU_BOOT_ASM_ENTERED, 0x10) as the first thing in
> secondary_entry so the two cases can be told apart:
> 
>   0x0  - CPU never ran head.S
>   0x10 - CPU entered head.S but did not come online
> 
> __cpu_up() resets the word before releasing each secondary, so a stale
> value is not misattributed. Nothing clears the marker on the success
> path. Reason being, the CPU instead sets CPU_BOOT_SUCCESS in
> secondary_data.status, which __cpu_up() checks first, so
> __early_cpu_boot_status is only read on failure. A stall before
> CPU_BOOT_SUCCESS - including in secondary_start_kernel() - is therefore
> reported as 0x10. The sentinel sits in the low byte and sets no
> CPU_STUCK_REASON_* bits, so existing status decoding is unchanged.
> 
> Limitations: best-effort only. The status variable is global with no CPU
> identity, and spin-table secondaries boot via secondary_holding_pen and
> never write it, so 0x0 is a strong hint rather than a guarantee.
> 
> Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
> ---
>  arch/arm64/include/asm/smp.h | 10 ++++++++++
>  arch/arm64/kernel/head.S     | 24 +++++++++++++++++++++++-
>  arch/arm64/kernel/smp.c      | 21 +++++++++++++++++++++
>  3 files changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
> index 10ea4f5430690..ca330cd1b0615 100644
> --- a/arch/arm64/include/asm/smp.h
> +++ b/arch/arm64/include/asm/smp.h
> @@ -20,6 +20,16 @@
>  /* Fatal system error detected by secondary CPU, crash the system */
>  #define CPU_PANIC_KERNEL		(3)
>  
> +/*
> + * Best-effort marker written early in secondary_entry (PSCI/hotplug
> + * path) so __cpu_up() can tell whether a stuck CPU ever ran head.S.
> + * Not authoritative: spin-table secondaries use secondary_holding_pen
> + * and never write it, and the word has no CPU identity. Value must sit
> + * in the low byte, stay out of {0,1,2,3}, and set no CPU_STUCK_REASON_*
> + * bits.
> + */
> +#define CPU_BOOT_ASM_ENTERED		(0x10)
> +
>  #define CPU_STUCK_REASON_52_BIT_VA	(UL(1) << CPU_STUCK_REASON_SHIFT)
>  #define CPU_STUCK_REASON_NO_GRAN	(UL(2) << CPU_STUCK_REASON_SHIFT)
>  
> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> index 87a822e5c4ca8..8ac3c49b4daf7 100644
> --- a/arch/arm64/kernel/head.S
> +++ b/arch/arm64/kernel/head.S
> @@ -353,6 +353,22 @@ SYM_FUNC_END(secondary_holding_pen)
>  	 * be used where CPUs are brought online dynamically by the kernel.
>  	 */
>  SYM_FUNC_START(secondary_entry)
> +	/*
> +	 * Record that this CPU reached head.S, before init_kernel_el()
> +	 * sets SCTLR_ELx.EE. A single-byte store to the reader's low
> +	 * byte (__cpu_up() zeroed the word) is endian-agnostic, so a
> +	 * big-endian kernel still reads 0x10. Flush it like
> +	 * update_early_cpu_boot_status.
> +	 */
> +	adr_l	x2, __early_cpu_boot_status
> +	mov	w1, #CPU_BOOT_ASM_ENTERED
> +#ifdef CONFIG_CPU_BIG_ENDIAN
> +	strb	w1, [x2, #7]	// low byte at top address
> +#else
> +	strb	w1, [x2]
> +#endif
> +	dmb	sy
> +	dc	ivac, x2
>  	mov	x0, xzr
>  	bl	init_kernel_el			// w0=cpu_boot_mode
>  	b	secondary_startup
> @@ -386,7 +402,6 @@ SYM_FUNC_START_LOCAL(__secondary_switched)
>  	mov	x0, x20
>  	bl	finalise_el2
>  
> -	str_l	xzr, __early_cpu_boot_status, x3
>  	adr_l	x5, vectors
>  	msr	vbar_el1, x5
>  	isb
> @@ -395,6 +410,13 @@ SYM_FUNC_START_LOCAL(__secondary_switched)
>  	ldr	x2, [x0, #CPU_BOOT_TASK]
>  	cbz	x2, __secondary_too_slow
>  
> +	/*
> +	 * Don't clear the marker here; nothing on the secondary clears
> +	 * it. Once the CPU sets CPU_BOOT_SUCCESS in
> +	 * secondary_data.status, __cpu_up() stops reading
> +	 * __early_cpu_boot_status (and resets it before the next
> +	 * release), so a stall before that still reports 0x10.
> +	 */
>  	init_cpu_task x2, x1, x3
>  
>  #ifdef CONFIG_ARM64_PTR_AUTH
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index cdcdd160e5b69..662205ae5a7a6 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -120,6 +120,17 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
>  	secondary_data.task = idle;
>  	update_cpu_boot_status(CPU_MMU_OFF);
>  
> +	/*
> +	 * Reset the marker before releasing this secondary: head.S
> +	 * never clears it, so without this a CPU that never reaches
> +	 * head.S would inherit a stale 0x10 from a previous CPU. Flush
> +	 * it so the MMU-off secondary sees the reset.
> +	 */
> +	WRITE_ONCE(__early_cpu_boot_status, 0);
> +	dcache_clean_inval_poc((unsigned long)&__early_cpu_boot_status,
> +			       (unsigned long)&__early_cpu_boot_status +
> +			       sizeof(__early_cpu_boot_status));
> +
>  	/* Now bring the CPU into our world */
>  	ret = boot_secondary(cpu, idle);
>  	if (ret) {
> @@ -145,10 +156,20 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
>  
>  	switch (status & CPU_BOOT_STATUS_MASK) {
>  	default:
> +		/*
> +		 * 0x0 usually means the CPU never ran head.S, but
> +		 * treat it as a hint: spin-table secondaries never
> +		 * write the marker and the word has no CPU identity.
> +		 */
>  		pr_err("CPU%u: failed in unknown state : 0x%lx\n",
>  		       cpu, status);
>  		cpus_stuck_in_kernel++;
>  		break;
> +	case CPU_BOOT_ASM_ENTERED:
> +		pr_err("CPU%u: entered head.S but not online : 0x%lx\n",
> +		       cpu, status);
> +		cpus_stuck_in_kernel++;
> +		break;
>  	case CPU_KILL_ME:
>  		if (!op_cpu_kill(cpu)) {
>  			pr_crit("CPU%u: died during early boot\n", cpu);
> 
> base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10


