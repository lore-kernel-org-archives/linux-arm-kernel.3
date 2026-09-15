Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B33BC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KVdxO6hdA6XFoL4rHOKE2J+GKfGaTMxnnC3apsX5p0I=; b=kQVZzBfRRWteMf
	rFELjHEgxcrjLzn/1qT5PrYzey5zFJUOqel5N2p426vD4NKRBHOf9owBjJaZuXhiPH5AaPY6VFEdq
	NR506xrgGjgO+HxQN5x9YZoUmtvtGJytN6XX0LfIs87rjZDlrdTeJ06H+0EaxMLu9DLZpuQxmSiDs
	8LgPD76ti0lFW8YjaKo9qXDYcFY1rLAufHXggSYG+QKOpUkbKEmRw8iYcvKw0pgFQPk0IxXq7W58d
	vYxy85Q6dlHrOp9UV/SexVXqIuMMvCLA+TW/jnP396ZCsLgdB3J6y5N+5MqLj4XK+CvHnIWFOmP62
	F+uAQfNJkIH5KbQdFUPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rss-00000006NH4-2I2u;
	Tue, 15 Sep 2026 12:03:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rsp-00000006NFH-0LgN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:03:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1827152B;
	Tue, 15 Sep 2026 05:03:26 -0700 (PDT)
Received: from [10.0.152.207] (unknown [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08D0B3F882;
	Tue, 15 Sep 2026 05:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789473810; bh=Ql0vV5t/7oOQyKnU8hNi/eOcAQrT9AGW0rHk2HmA1p8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aWVZhsYBcnEVi7lPILurGmuO5pisKXymS/AazN08xcogj54Ibm4uDYy+5zHo/HURO
	 1WiVlMy6pWu9duiOc0MKswdsSRyuYtOd+0SScGItOHl+xwZewCpKoFKhWbQJZp2GGT
	 5HrCj+5BIZH868RarcLNhjBn+9KDigFUvxK+KD9I=
Message-ID: <2adbde95-da5e-4d31-a606-9632b884b313@arm.com>
Date: Tue, 15 Sep 2026 13:03:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/21] arm64: percpu: Implement preemptible return RMW
 ops
To: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20260908151741.394589-1-mark.rutland@arm.com>
 <20260908151741.394589-18-mark.rutland@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260908151741.394589-18-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_050331_239856_64B7B36A 
X-CRM114-Status: GOOD (  15.15  )
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
Cc: ryan.roberts@arm.com, usama.anjum@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 9/8/26 16:17, Mark Rutland wrote:
> Use the PCPU GPR infrastructure to implement all of the RMW ops which
> return a value.
> 
> Test case:
> 
> | u64 outline_this_cpu_add_return_u64(u64 __percpu *p, u64 v)
> | {
> | 	return this_cpu_add_return(*p, v);
> | }
> 
> Generated code before this patch (v7.2-rc4):
> 
> | <outline_this_cpu_add_return_u64>:
> |        paciasp
> |        stp     x29, x30, [sp, #-32]!
> |        mrs     x3, sp_el0
> |        mov     x29, sp
> |        ldr     w2, [x3, #8]
> |        add     w2, w2, #0x1
> |        str     w2, [x3, #8]
> |        mov     x2, x0
> |        mrs     x4, tpidr_el1
> |        add     x2, x2, x4
> | 1:     ldxr    x0, [x2]
> |        add     x0, x0, x1
> |        stxr    w5, x0, [x2]
> |        cbnz    w5, 1b
> |        ldr     x1, [x3, #8]
> |        sub     x1, x1, #0x1
> |        str     w1, [x3, #8]
> |        cbz     x1, 2f
> |        ldr     x1, [x3, #8]
> |        cbnz    x1, 3f
> | 2:     str     x0, [sp, #24]
> |        bl      0 <preempt_schedule_notrace>
> |        ldr     x0, [sp, #24]
> | 3:     ldp     x29, x30, [sp], #32
> |        autiasp
> |        ret
> 
> Generated code after this patch:
> 
> | <outline_this_cpu_add_return_u64>:
> |        mrs     x3, sp_el0
> |        mov     w5, #0x10a0
> |        strh    w5, [x3, #20]
> |        mrs     x5, tpidr_el1
> |        add     x4, x0, x5
> | 1:     ldxr    x2, [x4]
> |        add     x2, x2, x1
> |        stxr    w6, x2, [x4]
> |        cbnz    w6, 1b
> |        strh    wzr, [x3, #20]
> |        mov     x0, x2
> |        ret
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/include/asm/percpu.h | 36 ++++++++++++++++++++++-----------
>  1 file changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> index 504a7fefa2015..9fe44d04c871b 100644
> --- a/arch/arm64/include/asm/percpu.h
> +++ b/arch/arm64/include/asm/percpu.h
> @@ -201,24 +201,36 @@ __percpu_##name##_case_##sz(void __percpu *pcp, unsigned long val)	\
>  
>  #define __PERCPU_RET_OP_CASE(w, sfx, name, sz, op_llsc, op_lse)		\
>  static inline u##sz							\
> -__percpu_##name##_return_case_##sz(void *ptr, unsigned long val)	\
> +__percpu_##name##_return_case_##sz(void __percpu *pcp, unsigned long val)	\
>  {									\
> +	u16 *gprs = &current_thread_info()->pcpu_gprs;			\
> +	unsigned long addr;						\
> +	unsigned long off;						\
>  	unsigned int loop;						\
>  	u##sz ret;							\
>  									\
> -	asm volatile (ARM64_LSE_ATOMIC_INSN(				\
> +	asm volatile (							\
> +	__PCPU_GPRS_BEGIN("%[gprs]", "%[pcp]", "%[off]", "%[addr]")	\
> +	ARM64_LSE_ATOMIC_INSN(						\
>  	/* LL/SC */							\
> -	"1:	ldxr" #sfx "\t%" #w "[ret], %[ptr]\n"			\
> +	"1:	ldxr" #sfx "\t%" #w "[ret], [%[addr]]\n"		\
>  		#op_llsc "\t%" #w "[ret], %" #w "[ret], %" #w "[val]\n"	\
> -	"	stxr" #sfx "\t%w[loop], %" #w "[ret], %[ptr]\n"		\
> +	"	stxr" #sfx "\t%w[loop], %" #w "[ret], [%[addr]]\n"	\
>  	"	cbnz	%w[loop], 1b",					\
>  	/* LSE atomics */						\
> -		#op_lse #sfx "\t%" #w "[val], %" #w "[ret], %[ptr]\n"	\
> +		#op_lse #sfx "\t%" #w "[val], %" #w "[ret], [%[addr]]\n"\
>  		#op_llsc "\t%" #w "[ret], %" #w "[ret], %" #w "[val]\n"	\
>  		__nops(2))						\
> -	: [loop] "=&r" (loop), [ret] "=&r" (ret),			\
> -	  [ptr] "+Q"(*(u##sz *)ptr)					\
> -	: [val] "r" ((u##sz)(val)));					\
> +	__PCPU_GPRS_END("%[gprs]")					\
> +	: [gprs] "=Qo" (*gprs),						\
> +	  [addr] "=&r" (addr),						\
> +	  [off] "=&r" (off),						\
> +	  [loop] "=&r" (loop),						\
> +	  [ret] "=&r" (ret)						\
> +	: [pcp] "r" (pcp),						\
> +	  [val] "r" ((u##sz)(val))					\
> +	: "memory"							\
> +	);								\
>  									\
>  	return ret;							\
>  }
> @@ -322,13 +334,13 @@ PERCPU_RET_OP(add, add, ldadd)
>  	_pcp_wrap(__percpu_add_case_64, pcp, val)
>  
>  #define this_cpu_add_return_1(pcp, val)	\
> -	_pcp_protect_return(__percpu_add_return_case_8, pcp, val)
> +	_pcp_wrap_return(__percpu_add_return_case_8, pcp, val)
>  #define this_cpu_add_return_2(pcp, val)	\
> -	_pcp_protect_return(__percpu_add_return_case_16, pcp, val)
> +	_pcp_wrap_return(__percpu_add_return_case_16, pcp, val)
>  #define this_cpu_add_return_4(pcp, val)	\
> -	_pcp_protect_return(__percpu_add_return_case_32, pcp, val)
> +	_pcp_wrap_return(__percpu_add_return_case_32, pcp, val)
>  #define this_cpu_add_return_8(pcp, val)	\
> -	_pcp_protect_return(__percpu_add_return_case_64, pcp, val)
> +	_pcp_wrap_return(__percpu_add_return_case_64, pcp, val)
>  
>  #define this_cpu_and_1(pcp, val)	\
>  	_pcp_wrap(__percpu_andnot_case_8, pcp, ~(u8)(val))
> -- 2.30.2
> 

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


