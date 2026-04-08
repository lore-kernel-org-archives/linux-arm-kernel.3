Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56579105D993
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 02:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BEJrD9lpGuVmZxXihdgtCvkWgHOeY0uBe47D5xtX70=; b=RVoR0mdpr+MrYU
	AMe2NOP07cp45Gvm9BYLrQobtN4Iz6JWfrtr/bjo2JjL/Fb6UmLacdFDv5liI1+jXk9YxKDu15Jqb
	3W0Gr1PN1JROREXJiDBCZ1RppeXLzNJC3n2eyHCtqtEWpRF/uDb4ajMm5ZehLToYmqytwamz8Ntak
	NsT2QkORJ+zez6BP3/6L6kCux1fisDXxJj5NB2E6vCvOLX0pNxtHpM7tZFOUN0s8ephluFTPhYSGu
	ChjKu5nKncgliFGdxi/fIyAJKYv71/Y2DTX948qk1CCwWIsMQV/yqujgLBDNv7UxQnXCEHyhTuB4v
	wC18YQWjRZOQNQ2RA/vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAIUd-000000087oF-2mzj;
	Wed, 08 Apr 2026 02:18:11 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAIUZ-000000087no-3v2O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 02:18:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9BEJrD9lpGuVmZxXihdgtCvkWgHOeY0uBe47D5xtX70=;
	b=TBQ2pJozqSZXUqtzKAtPlRtgPXVouwODy9bApOuXFu5u7bizaK6+mKFr2fIH2MUd145ke6C4o
	e0bl6JqoTEEHAAGmXJ3t5Nf+afGZGcdZ4oM9K0s8KLejN9NRLHhUINoHHY1afObdyRquwgWMWtL
	u6rYts1EqDeZbUJkeFUhVK8=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4fr64y4Wlwz1cyqN;
	Wed,  8 Apr 2026 10:11:46 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id B8C6440573;
	Wed,  8 Apr 2026 10:17:59 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 8 Apr 2026 10:17:59 +0800
Message-ID: <26642def-7676-e081-98f3-9ab883048375@huawei.com>
Date: Wed, 8 Apr 2026 10:17:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 10/10] arm64: Check DAIF (and PMR) at task-switch time
Content-Language: en-US
To: Mark Rutland <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
 <20260407131650.3813777-11-mark.rutland@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260407131650.3813777-11-mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_191808_638138_84467BB4 
X-CRM114-Status: GOOD (  19.29  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, linux-kernel@vger.kernel.org, tglx@kernel.org, luto@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 2026/4/7 21:16, Mark Rutland wrote:
> When __switch_to() switches from a 'prev' task to a 'next' task, various
> pieces of CPU state are expected to have specific values, such that
> these do not need to be saved/restored. If any of these hold an
> unexpected value when switching away from the prev task, they could lead
> to surprising behaviour in the context of the next task, and it would be
> difficult to determine where they were configured to their unexpected
> value.
> 
> Add some checks for DAIF and PMR at task-switch time so that we can
> detect such issues.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/process.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index 489554931231e..ba9038434d2fb 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -699,6 +699,29 @@ void update_sctlr_el1(u64 sctlr)
>  	isb();
>  }
>  
> +static inline void debug_switch_state(void)
> +{
> +	if (system_uses_irq_prio_masking()) {
> +		unsigned long daif_expected = 0;
> +		unsigned long daif_actual = read_sysreg(daif);
> +		unsigned long pmr_expected = GIC_PRIO_IRQOFF;
> +		unsigned long pmr_actual = read_sysreg_s(SYS_ICC_PMR_EL1);
> +
> +		WARN_ONCE(daif_actual != daif_expected ||
> +			  pmr_actual != pmr_expected,
> +			  "Unexpected DAIF + PMR: 0x%lx + 0x%lx (expected 0x%lx + 0x%lx)\n",
> +			  daif_actual, pmr_actual,
> +			  daif_expected, pmr_expected);
> +	} else {
> +		unsigned long daif_expected = DAIF_PROCCTX_NOIRQ;
> +		unsigned long daif_actual = read_sysreg(daif);
> +
> +		WARN_ONCE(daif_actual != daif_expected,
> +			  "Unexpected DAIF value: 0x%lx (expected 0x%lx)\n",
> +			  daif_actual, daif_expected);
> +	}

This logic seems consistent with arm64's local_irq_disable()
implementation. Do we need to wrap these debug checks in a config option
(e.g., CONFIG_ARM64_DEBUG_PRIORITY_MASKING) to avoid unnecessary overhead?


__schedule()
  -> local_irq_disable()
    -> arch_local_irq_disable()

52 static __always_inline void __daif_local_irq_disable(void)
 53 {
 54         barrier();
 55         asm volatile("msr daifset, #3");
 56         barrier();
 57 }
 58
 59 static __always_inline void __pmr_local_irq_disable(void)
 60 {
 61         if (IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING)) {
 62                 u32 pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
 63                 WARN_ON_ONCE(pmr != GIC_PRIO_IRQON && pmr !=
GIC_PRIO_IRQOFF);
 64         }
 65
 66         barrier();
 67         write_sysreg_s(GIC_PRIO_IRQOFF, SYS_ICC_PMR_EL1);
 68         barrier();
 69 }
 70
 71 static inline void arch_local_irq_disable(void)
 72 {
 73         if (system_uses_irq_prio_masking()) {
 74                 __pmr_local_irq_disable();
 75         } else {
 76                 __daif_local_irq_disable();
 77         }
 78 }


> +}
> +
>  /*
>   * Thread switching.
>   */
> @@ -708,6 +731,8 @@ struct task_struct *__switch_to(struct task_struct *prev,
>  {
>  	struct task_struct *last;
>  
> +	debug_switch_state();
> +
>  	fpsimd_thread_switch(next);
>  	tls_thread_switch(next);
>  	hw_breakpoint_thread_switch(next);

