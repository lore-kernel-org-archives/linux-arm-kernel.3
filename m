Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD08C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 08:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c4GIZGT4TyXoHHB1gMPoDnQG3lKJ5Fhq9LS0nG+kawY=; b=VkMWUXRpOzyKxc
	PBT454YW828TPDjKVxlsjgSH9AI3Q7770x1ylrywPOz8ZT9kw2UtMv3Y0jjrVtnVWrdxuGV/o2Jfm
	g3DI+GDsRG6YyqUwzaMeu9zxUZ+a+xaJ+zTLLMBNQBnwyzXWug5wUSd+FykAKe2NAKTF7gk589MVT
	MsTPsXePvBzHpzKvtDbZsy2L//wqOMAuDbDSmgpTTorJ5LbCQ/3XQPjkFmUI64P8vFBR7IvoaGL0+
	fZUzJKd/gfHb1VrUUfumfiKYHMw5ftTzdPp7r8f6s/CN0XtR/CyVGbGV0WIdtTxi3lGEY2FZcrath
	y1ksbcMJipAckzUC8MAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3V2I-00000006JL6-0owK;
	Mon, 07 Sep 2026 08:49:06 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3V2F-00000006JK7-3qGx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 08:49:05 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=c4GIZGT4TyXoHHB1gMPoDnQG3lKJ5Fhq9LS0nG+kawY=;
	b=Tmr3qKK2UZTVAKGyV1HXzzOlhYSd+2g/gxsOMAmf1W7o+6V/djRr41cLbVpbg/cziClc4SjkX
	UFLphzUI0iCCGIX2Ns3ouTKOljyqNN94EVQSHXVwvsL+NzGHUTju+9lJIVsTVldBhzCWcGPkIer
	51myB+T37h202XyHNs8eUyA=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hdgRq3dwyz1T4Mc;
	Mon,  7 Sep 2026 16:37:27 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 2235E40579;
	Mon,  7 Sep 2026 16:48:56 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 7 Sep 2026 16:48:55 +0800
Message-ID: <b5194b06-ec4b-42f7-b879-9d3082aa58d7@huawei.com>
Date: Mon, 7 Sep 2026 16:48:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/21] arm64: percpu: Fix LSE operations on {8,16}-bit
 types
To: Mark Rutland <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260904161758.376504-1-mark.rutland@arm.com>
 <20260904161758.376504-4-mark.rutland@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260904161758.376504-4-mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_014904_272303_6E4C91CD 
X-CRM114-Status: GOOD (  16.75  )
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
Cc: vladimir.murzin@arm.com, usama.anjum@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



在 2026/9/5 0:17, Mark Rutland 写道:
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

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  		__nops(2))						\
>  	: [loop] "=&r" (loop), [ret] "=&r" (ret),			\


