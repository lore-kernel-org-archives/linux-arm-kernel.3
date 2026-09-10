Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB48C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PkA9PRX4q8VYDEBPwAybgSZo/upZNhSdAtGGy5bkLIE=; b=LlMCIRDDJdn3Ly
	7XfIPGq/epSZvP0MA3Jg3t/Bi1kB8w3V/y/kTXG0AZKDtt2X03r2ngy8lAXJgFd3yW04rUVCuhh1C
	w/FkwgL4aQP6n5OJaF9j5zj9V+lY5fMU0S4MbODhTGChFtYA9J0oLYIm71Q1KPQycVArdd9WW6/ik
	cVzj0918/48wLodhgUg+Ci5talGt+1xXJ62Lp3FUZKB7N2ExJ2K5wgVKe7qRrth2x9nAQpKwz4Ll7
	tzxUamCCa6mG5qkhfw9z+TkaKB7LkEEkT3cNVZqEhT0eHzrfjJeTSkji4Uo9VMj47ujJs4VnvL/Qt
	JPbukOenXS5JXJnRoMqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gYF-0000000EllE-43x0;
	Thu, 10 Sep 2026 15:18:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gYE-0000000ElkT-1Y9o
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 15:18:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PkA9PRX4q8VYDEBPwAybgSZo/upZNhSdAtGGy5bkLIE=; b=appvAmUovGgnpzEYg/DSkAnd3T
	20N4gg7a7NxcHu5oAo+MFlgXyTNa83NutXvA1JgcZIGYcGkh9Dm3CBwvgBGrsg3JBcBT0e8nRBldI
	XqcQgLyJjG9ptd6m7+d2O5d9S1isdQOgDmFB1uLaZXhykNJFwvMJcV5t0wPpYXl0pUHxkbFljbtDb
	QzbL+++dhPY4JuSv0qCFyWPtqtqAZTLc4pdfSYw4ney2hT3jpzx473LAvue5tBZ8qWXoo6mvFqybb
	Pudw97E4y6ugoupBmVKwwCpjmizzVG9AnSVm81DnEKWE09+PZg7F0O8qMmwV8O3kYmHxV7kY2Tr41
	1ixORT7Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4gYA-00000002fFG-3IFx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:18:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9FFA22C8;
	Thu, 10 Sep 2026 08:18:48 -0700 (PDT)
Received: from [10.0.152.207] (unknown [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1CD33F59E;
	Thu, 10 Sep 2026 08:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789053532; bh=L24XCAY42o+vXWCHtSAqHdGIfTKiNnN51PX4L4Lt9HM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G0Y0pKB4kZOkk0qnITI6T8sUKH3z1GLATPlQAlIv3gEciFafKv4FG6L2tUTLbbvVN
	 dN7wYsYHdBINYYzzzqd9QkcddymiO7+Oixfny+E/gRiRS2nSQVAd2Mx0XUuNENDte7
	 w07epDGtDLgyjY8fZBoFwacqccCv1XJHDDeJb8yE=
Message-ID: <3f2fe813-b6ae-461c-9a95-5cf62c087cc6@arm.com>
Date: Thu, 10 Sep 2026 16:18:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/21] arm64: percpu: Fix LSE operations on {8,16}-bit
 types
To: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20260908151741.394589-1-mark.rutland@arm.com>
 <20260908151741.394589-4-mark.rutland@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260908151741.394589-4-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_161855_314548_1EBB2D64 
X-CRM114-Status: GOOD (  19.24  )
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
> The assembly for __percpu_##name##_case_##sz() and
> __percpu_##name##_return_case_##sz() doesn't use the 'sfx' macro
> argument to form the LSE instruction. Without 'sfx', a W register
> argument will imply a 32-bit memory location, and consequently
> {8,16}-bit ops will erroneously read and write 32 bits of memory when
> the LSE instruction is used.
> 
> Fix this by appending 'sfx' to 'op_lse' to LSE instruction. It is not
> necessary (and not valid) to append 'sfx' to 'op_llsc', as 'op_llsc' is
> a register-register operation which does not access memory (and does not
> take a size suffix).
> 
> Test case:
> 
> | void outline_this_cpu_add_u8(u8 __percpu *p, u8 v)
> | {
> | 	this_cpu_add(*p, v);
> | }
> 
> Generated inline code (same before and after this patch):
> 
> | <outline_this_cpu_add_u8>:
> |        paciasp
> |        stp     x29, x30, [sp, #-16]!
> |        mrs     x2, sp_el0
> |        mov     x29, sp
> |        ldr     w3, [x2, #8]
> |        add     w3, w3, #0x1
> |        str     w3, [x2, #8]
> |        mrs     x3, tpidr_el1
> |        add     x0, x0, x3
> | 1:     ldxrb   w5, [x0]        // <----------------
> |        add     w5, w5, w1      // LL/SC alternative
> |        stxrb   w4, w5, [x0]    // instructions here
> |        cbnz    w4, 1b          // <----------------
> |        ldr     x0, [x2, #8]
> |        sub     x0, x0, #0x1
> |        str     w0, [x2, #8]
> |        cbz     x0, 2f
> |        ldr     x0, [x2, #8]
> |        cbnz    x0, 3f
> | 2:     bl      preempt_schedule_notrace
> | 3:     ldp     x29, x30, [sp], #16
> |        autiasp
> |        ret
> 
> Generated LSE alternative before this patch:
> 
> |        ldadd   w1, w5, [x0]    // 32-bit LDADD
> |        nop
> |        nop
> |        nop
> 
> Generated LSE alternative after this patch:
> 
> |        ldaddb  w1, w5, [x0]    // 8-bit LDADDB
> |        nop
> |        nop
> |        nop
> 
> Fixes: 959bf2fd03b5 ("arm64: percpu: Rewrite per-cpu ops to allow use of LSE atomics")
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Yang Shi <yang@os.amperecomputing.com>
> Cc: stable@vger.kernel.org
> ---
>  arch/arm64/include/asm/percpu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> index 31193bcf89a2b..8cf4068ce1b56 100644
> --- a/arch/arm64/include/asm/percpu.h
> +++ b/arch/arm64/include/asm/percpu.h
> @@ -77,7 +77,7 @@ __percpu_##name##_case_##sz(void *ptr, unsigned long val)		\
>  	"	stxr" #sfx "\t%w[loop], %" #w "[tmp], %[ptr]\n"		\
>  	"	cbnz	%w[loop], 1b",					\
>  	/* LSE atomics */						\
> -		#op_lse "\t%" #w "[val], %" #w "[tmp], %[ptr]\n"	\
> +		#op_lse #sfx "\t%" #w "[val], %" #w "[tmp], %[ptr]\n"	\
>  		__nops(3))						\
>  	: [loop] "=&r" (loop), [tmp] "=&r" (tmp),			\
>  	  [ptr] "+Q"(*(u##sz *)ptr)					\
> @@ -98,7 +98,7 @@ __percpu_##name##_return_case_##sz(void *ptr, unsigned long val)	\
>  	"	stxr" #sfx "\t%w[loop], %" #w "[ret], %[ptr]\n"		\
>  	"	cbnz	%w[loop], 1b",					\
>  	/* LSE atomics */						\
> -		#op_lse "\t%" #w "[val], %" #w "[ret], %[ptr]\n"	\
> +		#op_lse #sfx "\t%" #w "[val], %" #w "[ret], %[ptr]\n"	\
>  		#op_llsc "\t%" #w "[ret], %" #w "[ret], %" #w "[val]\n"	\
>  		__nops(2))						\
>  	: [loop] "=&r" (loop), [ret] "=&r" (ret),			\
> -- 2.30.2
> 

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


