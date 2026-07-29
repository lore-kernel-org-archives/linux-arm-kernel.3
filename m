Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55356C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 03:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZMw8Dzuq6hg3zCS4Y6/u0InA7iQz/rrppvZU7GaIMu0=; b=GfGnXxCupdnReH
	jCpXUWjr3EFOswsg/mGR+cQU8y0GZDI82HjMCVH8Cw2GWwwOjAwVOJJRwWZC1q+uanEPsAJe3q5ps
	Kj4IvShvfGQcQw4TniQns5wX2mSBC11vt4QZT2doraQ+Hm4iPzCFYUQzLWPqfbZh0XOMtJmO5xE6E
	CTywnkZGeBTSVS+tPE8Dj9eFTgckpsbNdA/HUWWdLGEKcPQX0pjsR7EHm48RxFBsj5uVuSDsWHM5d
	hBvOEhENHmNyFMOk18C61/446fik/a1Nj+NANgYYZPjk/1qf6DQuAXLYZLc3dEZwr24tPada1gl0Q
	mTYeoMQK+bW5axFHxpbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovPu-00000006msb-3m6I;
	Wed, 29 Jul 2026 03:57:14 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovPq-00000006mrq-2A9g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 03:57:12 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZMw8Dzuq6hg3zCS4Y6/u0InA7iQz/rrppvZU7GaIMu0=;
	b=0Ip+p+KXDyaZHo3guiMXU3BsqTa7f9L9fu5SFhOblnS/LGBYMMVJVzUv6BLhdym4SoELJk9Cq
	vyfFrcuRUHLznd/AWxANqlfBGS1xvBobw50i5xDT2M+3TSMHAw0UiSEf+2AtwGvHcXaqmpWjSNk
	jBfhCuwTrpV43rLQfiTgGjc=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4h8yvh2rcrz1T4Fq;
	Wed, 29 Jul 2026 11:47:28 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 92EB940575;
	Wed, 29 Jul 2026 11:56:58 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 29 Jul 2026 11:56:57 +0800
Message-ID: <96db4406-5000-49df-a9ef-b4e49eb206cd@huawei.com>
Date: Wed, 29 Jul 2026 11:56:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/13] arm64: preempt: Simplify and optimize
 __preempt_count_dec_and_test()
To: Mark Rutland <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
 <20260728123859.2911495-2-mark.rutland@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260728123859.2911495-2-mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_205711_183923_05BEBB33 
X-CRM114-Status: GOOD (  30.07  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, maz@kernel.org, hca@linux.ibm.com, linux-kernel@vger.kernel.org, yang@os.amperecomputing.com, catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



在 2026/7/28 20:38, Mark Rutland 写道:
> In arm64's __preempt_count_dec_and_test(), the final conditional load of
> 'ti->preempt_count' is always executed in the common case. The
> conditional load leads to unfortunate code generation for
> preempt_enable[_notrace](), and it would be better to unconditionally
> load 'ti->preempt_count', as described below.
> 
> On arm64, struct thread_info contains the following union:
> 
> | union {
> |         u64             preempt_count;
> |         struct {
> |                 u32     count;
> |                 u32     need_resched;
> |         } preempt;
> | };
> 
> Note: 'need_resched' is encoded so that '0' means a reschedule is
> needed, and '1' means a reschedule is NOT needed.

Indeed, that's true

> 
> The core logic of __preempt_count_dec_and_test() is:
> 
> | static inline bool __preempt_count_dec_and_test(void)
> | {
> |         struct thread_info *ti = current_thread_info();
> |         u64 pc = READ_ONCE(ti->preempt_count);
> |
> |         WRITE_ONCE(ti->preempt.count, --pc);
> |
> |         return !pc || !READ_ONCE(ti->preempt_count);
> | }
> 
> The '!pc' condition can only be true when both:
> 
> * The initial value of 'need_resched' was 0, meaning that a reschedule
>   is needed. This should be rare.

At the moment of executing --pc, the probability of it coinciding with
the process needing scheduling is indeed very small.

> 
> * The initial value of 'count' was exactly 1. This cannot be true for a
>   nested preempt_disable() ... preempt_enable() sequence.
> 
> Hence in common cases, '!pc' will be false, and it's necessary to
> execute the final READ_ONCE(ti->preempt_count).
> 
> This results in a conditional branch in the common case, as can be seen
> when __preempt_count_dec_and_test() is outlined:
> 
> | <outline___preempt_count_dec_and_test>:
> |        mrs     x2, sp_el0
> |        ldr     x1, [x2, #8]
> |        mov     w0, #0x1
> |        sub     x1, x1, #0x1
> |        str     w1, [x2, #8]
> |        cbz     x1, 1f
> |        ldr     x0, [x2, #8]
> |        cmp     x0, #0x0
> |        cset    w0, eq  // eq = none
> | 1:     ret
> 
> It would be better to avoid the special case for 'pc == 0', and to
> always load 'ti->preempt_count' after decrementing 'ti->preempt.count'.
> For the common cases this will remove a conditional branch. For the rare
> cases where preemption is needed initially, this only adds a single
> load, whose cost should be dominated by other factors.
> 
> Remove the special case for 'pc == 0', and always load the combined
> 'ti->preempt_count' after decrementing 'ti->preempt.count'.
> 
> The removal of the conditional branch helps with code generation, as the
> compiler can more easily move a dependent slow path out-of-line, as
> demonstrated with the following compiled with GCC 15.2.0:
> 
> | void outline_preempt_enable_notrace(void)
> | {
> |        preempt_enable_notrace();
> | }
> 
> Before this patch:
> 
> | <outline_preempt_enable_notrace>:
> |        mrs     x1, sp_el0
> |        ldr     x0, [x1, #8]
> |        sub     x0, x0, #0x1
> |        str     w0, [x1, #8]
> |        cbz     x0, 1f
> |        ldr     x0, [x1, #8]
> |        cbnz    x0, 2f
> | 1:     paciasp
> |        stp     x29, x30, [sp, #-16]!
> |        mov     x29, sp
> |        bl      preempt_schedule_notrace
> |        ldp     x29, x30, [sp], #16
> |        autiasp
> |        ret
> | 2:     ret
> 
> After this patch:
> 
> | <outline_preempt_enable_notrace>:
> |        mrs     x0, sp_el0
> |        ldr     w1, [x0, #8]
> |        sub     w1, w1, #0x1
> |        str     w1, [x0, #8]
> |        ldr     x0, [x0, #8]
> |        cbz     x0, 1f
> |        ret
> | 1:     paciasp
> |        stp     x29, x30, [sp, #-16]!
> |        mov     x29, sp
> |        bl      preempt_schedule_notrace
> |        ldp     x29, x30, [sp], #16
> |        autiasp
> |        ret
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/include/asm/preempt.h | 29 +++++++++++------------------
>  1 file changed, 11 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
> index 932ea4b620428..ca2ad1a8db095 100644
> --- a/arch/arm64/include/asm/preempt.h
> +++ b/arch/arm64/include/asm/preempt.h
> @@ -55,30 +55,23 @@ static inline void __preempt_count_sub(int val)
>  	WRITE_ONCE(current_thread_info()->preempt.count, pc);
>  }
>  
> -static inline bool __preempt_count_dec_and_test(void)
> -{
> -	struct thread_info *ti = current_thread_info();
> -	u64 pc = READ_ONCE(ti->preempt_count);
> -
> -	/* Update only the count field, leaving need_resched unchanged */
> -	WRITE_ONCE(ti->preempt.count, --pc);
> -
> -	/*
> -	 * If we wrote back all zeroes, then we're preemptible and in
> -	 * need of a reschedule. Otherwise, we need to reload the
> -	 * preempt_count in case the need_resched flag was cleared by an
> -	 * interrupt occurring between the non-atomic READ_ONCE/WRITE_ONCE
> -	 * pair.
> -	 */
> -	return !pc || !READ_ONCE(ti->preempt_count);
> -}
> -
>  static inline bool should_resched(int preempt_offset)
>  {
>  	u64 pc = READ_ONCE(current_thread_info()->preempt_count);
>  	return pc == preempt_offset;
>  }
>  
> +static inline bool __preempt_count_dec_and_test(void)
> +{
> +	/*
> +	 * We must load the combined 'prempt_count' after decrementing
> +	 * 'preempt.count' as an interrupt could modify 'need_resched' before
> +	 * __preempt_count_sub() writes back to 'preempt.count'.
> +	 */
> +	__preempt_count_sub(1);
> +	return should_resched(0);

In general, the functions are consistent.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> +}
> +
>  #ifdef CONFIG_PREEMPTION
>  
>  void preempt_schedule(void);


