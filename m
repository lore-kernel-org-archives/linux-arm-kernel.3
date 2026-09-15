Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386E8C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LVZKopqQ5xHV0VQulDTZRTQzJLuh3wD0zC/ycl7CrmQ=; b=fbGZbFh7Tz/zIY
	LM5i3gBJqJRmB6DnKBPX9fAueAzFP/pyAIvetprIdqJ/23j5dPX2G3RgB2WZ6ir2l/wFKXppUBJVC
	6LnsKSZuJhXW5Ze94j4BfQGT6n4Lsjwi093Yx+pR5ZzLph9mC/KJ3Z84TZkyUkgxD2oDR7JwTD6F7
	ZACx8CFXW64R+0ri+2w6UaKOr2lgYGWqcR83ge3Sbla4YZwlBAGsyuDB5oDjWBxXjGrhBqPbOeXwF
	yFkdmuMmqm9qRQi91RzgbybhEQExLSw5yY8Et6Ql4Igmb20znAZafDGueDCtqil0fTsXVJCaKCU04
	9HUrrAHIgyC21IG+MmuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rwv-00000006Oeo-2BSq;
	Tue, 15 Sep 2026 12:07:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rws-00000006Odi-3nD9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:07:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62463152B;
	Tue, 15 Sep 2026 05:07:38 -0700 (PDT)
Received: from [10.0.152.207] (unknown [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A9863F882;
	Tue, 15 Sep 2026 05:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789474062; bh=NkaK2Y3o+sxwMHp2P5k5Vew61TmbzoHNUWz0zBsRtOM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CFAdFPo3BKQ6eXhEoHs6KB9L2l+97P3jrDv/9D5JM7H44vw3H4tNzMyYa69gBKxWN
	 +i3HXrfHGnIVWdG169zFzD91EH+Jslmj+LELtzl3EY9p0CuzlBRPTBet6yuxCR5oVH
	 fKpPwVNOEDOO10ds8phUkxuQbMZ8GB3mI4+oHjI8=
Message-ID: <f9112506-2444-41e9-b38d-7bf0b445a552@arm.com>
Date: Tue, 15 Sep 2026 13:07:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/21] arm64: percpu: Implement preemptible XCHG ops
To: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20260908151741.394589-1-mark.rutland@arm.com>
 <20260908151741.394589-19-mark.rutland@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260908151741.394589-19-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_050743_045662_7933F7A5 
X-CRM114-Status: GOOD (  17.78  )
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
> Use the PCPU GPR infrastructure to implement all of the xchg ops
> 
> Test case:
> 
> | u64 outline_xchg_name(u64 *p, u64 v)
> | {
> | 	return xchg(p, v);
> | }
> 
> Generated code before this patch (v7.2-rc4):
> 
> | <outline_this_cpu_xchg_u64>:
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
> |        prfm    pstl1strm, [x2]
> | 1:     ldxr    x0, [x2]
> |        stxr    w5, x1, [x2]
> |        cbnz    w5, 1b
> |        ldr     x1, [x3, #8]
> |        sub     x1, x1, #0x1
> |        str     w1, [x3, #8]
> |        cbz     x1, 2f
> |        ldr     x1, [x3, #8]
> |        cbnz    x1, 3f
> | 2:     str     x0, [sp, #24]
> |        bl      preempt_schedule_notrace
> |        ldr     x0, [sp, #24]
> | 3:     ldp     x29, x30, [sp], #32
> |        autiasp
> |        ret
> 
> Generated code after this patch:
> 
> | <outline_this_cpu_xchg_u64>:
> |        mrs     x3, sp_el0
> |        mov     w5, #0x10a0
> |        strh    w5, [x3, #20]
> |        mrs     x5, tpidr_el1
> |        add     x4, x0, x5
> |        prfm    pstl1strm, [x4]
> | 1:     ldxr    x2, [x4]
> |        stxr    w6, x1, [x4]
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
>  arch/arm64/include/asm/percpu.h | 57 ++++++++++++++++++++++++++++++---
>  1 file changed, 53 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> index 9fe44d04c871b..820340c61d70f 100644
> --- a/arch/arm64/include/asm/percpu.h
> +++ b/arch/arm64/include/asm/percpu.h
> @@ -269,6 +269,50 @@ PERCPU_RET_OP(add, add, ldadd)
>  #undef PERCPU_OP
>  #undef PERCPU_RET_OP
>  
> +#define PERCPU_XCHG_OP(w, sfx, sz)					\
> +static inline unsigned long						\
> +__percpu_xchg_case_##sz(void __percpu *pcp, u##sz val)			\
> +{									\
> +	u16 *gprs = &current_thread_info()->pcpu_gprs;			\
> +	unsigned long addr;						\
> +	unsigned long off;						\
> +	unsigned int loop;						\
> +	unsigned long ret;						\
> +									\
> +	asm volatile (							\
> +	__PCPU_GPRS_BEGIN("%[gprs]", "%[pcp]", "%[off]", "%[addr]")	\
> +	ARM64_LSE_ATOMIC_INSN(						\
> +	/* LL/SC */							\
> +	"	prfm	pstl1strm, [%[addr]]\n"				\
> +	"1:	ldxr" #sfx "\t%" #w "[ret], [%[addr]]\n"		\
> +	"	stxr" #sfx "\t%w[loop], %" #w "[val], [%[addr]]\n"	\
> +	"	cbnz	%w[loop], 1b\n"					\
> +	,								\
> +	/* LSE atomics */						\
> +	"	swp" #sfx "\t%" #w "[val], %" #w "[ret], [%[addr]]\n"	\
> +		__nops(3)						\
> +	)								\
> +	__PCPU_GPRS_END("%[gprs]")					\
> +	: [gprs] "=Qo" (*gprs),						\
> +	  [addr] "=&r" (addr),						\
> +	  [off] "=&r" (off),						\
> +	  [loop] "=&r" (loop),						\
> +	  [ret] "=&r" (ret)						\
> +	: [pcp] "r" (pcp),						\
> +	  [val] "r" (val)						\
> +	: "memory"							\
> +	);								\
> +									\
> +	return ret;							\
> +}
> +
> +PERCPU_XCHG_OP(w, b, 8)
> +PERCPU_XCHG_OP(w, h, 16)
> +PERCPU_XCHG_OP(w,  , 32)
> +PERCPU_XCHG_OP(x,  , 64)
> +
> +#undef PERCPU_XCHG_OP
> +
>  /*
>   * It would be nice to avoid the conditional call into the scheduler when
>   * re-enabling preemption for preemptible kernels, but doing that in a way
> @@ -306,6 +350,11 @@ PERCPU_RET_OP(add, add, ldadd)
>  	(typeof(pcp))op(&(pcp), ##args);				\
>  })
>  
> +#define _pcp_wrap_xchg(op, pcp, val)					\
> +({									\
> +	(typeof(pcp))op(&(pcp), (unsigned long)(val));			\
> +})
> +
>  #define this_cpu_read_1(pcp)		\
>  	_pcp_wrap_return(__percpu_read_8, pcp)
>  #define this_cpu_read_2(pcp)		\
> @@ -361,13 +410,13 @@ PERCPU_RET_OP(add, add, ldadd)
>  	_pcp_wrap(__percpu_or_case_64, pcp, val)
>  
>  #define this_cpu_xchg_1(pcp, val)	\
> -	_pcp_protect_return(xchg_relaxed, pcp, val)
> +	_pcp_wrap_xchg(__percpu_xchg_case_8, pcp, val)
>  #define this_cpu_xchg_2(pcp, val)	\
> -	_pcp_protect_return(xchg_relaxed, pcp, val)
> +	_pcp_wrap_xchg(__percpu_xchg_case_16, pcp, val)
>  #define this_cpu_xchg_4(pcp, val)	\
> -	_pcp_protect_return(xchg_relaxed, pcp, val)
> +	_pcp_wrap_xchg(__percpu_xchg_case_32, pcp, val)
>  #define this_cpu_xchg_8(pcp, val)	\
> -	_pcp_protect_return(xchg_relaxed, pcp, val)
> +	_pcp_wrap_xchg(__percpu_xchg_case_64, pcp, val)
>  
>  #define this_cpu_cmpxchg_1(pcp, o, n)	\
>  	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
> -- 2.30.2
> 

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


