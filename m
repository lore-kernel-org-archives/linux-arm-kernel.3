Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4537DC55822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 08:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6L5hEIACrzWkfhK+g6IqcfRxL0gKu8KPahN+8ZtlEc=; b=Q76UiJDIWjjxXA
	MTrMvcvJwdOFl+A+c1cv0bkxVrZdg5OXuqejon2+85RFnRv9hKix7Y6/PIcWQfsoxSdY3avrFIbga
	y8D6yBYSYl8WS9bpyuH8N1IlIM+gWXTWERGIBIFC3HNWp6D37b+bCTzooVghbLw9FauprnLWvmthX
	FbUqDAquDoH2UaDayt6pZ8+YmxnebtyAhWHDEU7KuO3I5YGadnHHmVwlHbdu/Ftb77oqbPj0+7syC
	RezwCyIKM5zfu7cjiOvRX3o25Hln5/3Udd3lcCaaFPxgnB4GlIJEYzzhDOQcao1iVmkYxSccfxhUb
	k0wu804kEWJxSH1yIvPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrX7l-00000003XSO-3M45;
	Wed, 05 Aug 2026 08:37:18 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrX7i-00000003XS1-3eoo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 08:37:16 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47f703a9d05so433425f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 01:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785919032; x=1786523832; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o6L5hEIACrzWkfhK+g6IqcfRxL0gKu8KPahN+8ZtlEc=;
        b=ssw3no9lQYAVpgpSLWuajMuGxpIdnjehlUN9Xi/JCnw2L9bpBrVjP/HB/G2x/jGi3w
         Hn9YIOFlozsCuenyHkW5pV1BXOaLNDM17wjr85dIVn0SeTRfSs9eootvKeW0NvaaW1HE
         SzVbSN2Mx+6PAPjAAz9hdD2pfh82aqoe9u5hnrlLcrCaJyHGfvgM6wiop9OqZ8osK/hd
         7c0bJvhyvGQPO9Y2Gpid3hoWYd/2HXADvTQ3aXWlJPh1kSqTcHcF+8F159mjO5OOl4wW
         5XhGr1kQNrF8Uwqv42VC+nZ5yY3dTu9fg7zQtXIhLG5utl4p9YARFaGjmUX2hLsIwbsh
         hajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785919032; x=1786523832;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o6L5hEIACrzWkfhK+g6IqcfRxL0gKu8KPahN+8ZtlEc=;
        b=p679RVqQflkrMw0HjYd6cn2uPRdccHWbrmspf4HOO319h1uzTb+zeSBuF5dXF6ymTK
         /RfgLzJmZx51MVsiaVi0qlZ91ydZSsORSWHn68fQPSoN6y6GOBj+iBMvBfSl8V3QgI8D
         GeTtCV4T1N8IiaK0Ks0sFM8W9+t57uvvEhh01iEsPNfMxaRLx+jXwIGhgWIRtZ1N3DPJ
         8GJPh/ZmrqruSGBm0usoj1uSbNTK+c06sCFAnYcCj5IRR+ssiTg5Xsywa4Uv+BV1609A
         DRvFVnEeh9WADo2jcxUSb1xFFhne1Ws30OMYBlzzhqdqFHP5bnsltJDrIdZxfe9+X8rE
         acew==
X-Gm-Message-State: AOJu0YxbZLJ5a+M5oyl0Jmx85XegpqmKPPZfMmXN0HgsWmMwXzFocd16
	o0BJn3x8LJe7n2BMtdKoHERb/faAeeTU5g7dqn2qUhC4u3tJtkzUG1qn
X-Gm-Gg: AR+sD12ESPkJ9lvc6Lm2k5mQuJFdojSM0O1YjS+jFLDnA2xzEkbULieAwUjQ7axgl+O
	931IK6KoLJ1TVYC+m5OYzeTRJKn0KfFNfT7yEUtynfbzKZ/iLHv5LxENjQKcYui4cwtkUoR6Iap
	6hGlHfrvvWwmuCbkK+aNs/hfe1fzef3/e3xQbLCc0IyvOkArplhsjIK0qU2QGNDTXWtzU6KGHgy
	T950CpdHk8+pHtIhTncuEXefMFZWyjlKLD2ETZnVt0zuRFOY74+b4wzQtZ8fWNn8jy+5NnBQV+C
	3e6DBiCngtfBoqJSEBFs40paoQxuZz7Ez3Wlz4ou8qBGlTxbeoIsKaLYP6wO4dIKcNXvk4g9RpC
	J5394+EwuQEAUE2IpVobfMGrpGFpKs6iPhaHbb1QdqSV2wygbM1mWpNZVFrX8HBuDWa8bvxDJWC
	VNdkRPE99prMsz4Gi67LOivdiK/BOih1ZvQVvChPETMTvg+Ldox2ArlFwU3oCofGSGQiFDuRMCt
	inmOEocf4JT+k70ZQSA//Kd8Q==
X-Received: by 2002:a05:6000:29c2:b0:47f:cb30:8591 with SMTP id ffacd0b85a97d-47fec4e712dmr6453147f8f.6.1785919031999;
        Wed, 05 Aug 2026 01:37:11 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febfe5ecfsm6952226f8f.11.2026.08.05.01.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 01:37:11 -0700 (PDT)
Date: Wed, 5 Aug 2026 09:37:10 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 01/20] arm64: percpu: Fix this_cpu_write() casting
Message-ID: <20260805093710.3c4baf6c@pumpkin>
In-Reply-To: <20260804170503.3513916-2-mark.rutland@arm.com>
References: <20260804170503.3513916-1-mark.rutland@arm.com>
	<20260804170503.3513916-2-mark.rutland@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_013715_001058_619B0D2A 
X-CRM114-Status: GOOD (  24.40  )
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
Cc: vladimir.murzin@arm.com, ryan.roberts@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ruanjinjie@huawei.com, stable@vger.kernel.org, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue,  4 Aug 2026 18:04:44 +0100
Mark Rutland <mark.rutland@arm.com> wrote:

> The arm64 implementation of this_cpu_write() casts 'val' to unsigned
> long. This is necessary to handle cases where 'val' is a pointer type,
> and to avoid spurious compiler warnings for the (unreachable!) cases
> where the pointer type would be cast to a smaller integer type.
> 
> Unfortunately, the cast is applied to 'val' rather than '(val)', which
> won't always generate the expected value when 'val' is an expression.
> 
> For example, for this_cpu_write(pcp, zero - 1), where 'pcp' is a u64 and
> 'zero' is a u32:
> 
> * 'zero'                      ===> (u32) 0x00000000
> * 'zero - 1'                  ===> (u32) 0xffffffff
> * '(unsigned long)zero - 1'   ===> (u64) 0xffffffffffffffff
> * '(unsigned long)(zero - 1)' ===> (u64) 0x00000000ffffffff
> 
> Fix this by adding brackets around 'val'
> 
> The bug described above can be seen from the disassembly of the
> following test code:
> 
> | void this_cpu_write_zero_minus_1(u64 __percpu *pcp)
> | {
> | 	u32 zero = 0;
> | 	this_cpu_write(*pcp, zero - 1);
> | }
> |
> | void this_cpu_write_zero_minus_1_brackets(u64 __percpu *pcp)
> | {
> | 	u32 zero = 0;
> | 	this_cpu_write(*pcp, (zero - 1));
> | }
> 
> Generated code before this patch:
> 
> | <this_cpu_write_zero_minus_1>:
> |        paciasp
> |        stp     x29, x30, [sp, #-16]!
> |        mrs     x1, sp_el0
> |        mov     x29, sp
> |        ldr     w2, [x1, #8]
> |        add     w2, w2, #0x1
> |        str     w2, [x1, #8]
> |        mov     x3, #0xffffffffffffffff
> |        mrs     x2, tpidr_el1
> |        str     x3, [x0, x2]
> |        ldr     x0, [x1, #8]
> |        add     x0, x0, x3
> |        str     w0, [x1, #8]
> |        cbz     x0, 1f
> |        ldr     x0, [x1, #8]
> |        cbnz    x0, 2f
> | 1:     bl      preempt_schedule_notrace
> | 2:     ldp     x29, x30, [sp], #16
> |        autiasp
> |        ret
> |
> | <this_cpu_write_zero_minus_1_brackets>:
> |        paciasp
> |        stp     x29, x30, [sp, #-16]!
> |        mrs     x1, sp_el0
> |        mov     x29, sp
> |        ldr     w2, [x1, #8]
> |        add     w2, w2, #0x1
> |        str     w2, [x1, #8]
> |        mov     x3, #0xffffffff
> |        mrs     x2, tpidr_el1
> |        str     x3, [x0, x2]
> |        ldr     x0, [x1, #8]
> |        sub     x0, x0, #0x1
> |        str     w0, [x1, #8]
> |        cbz     x0, 1f
> |        ldr     x0, [x1, #8]
> |        cbnz    x0, 2f
> | 1:     bl      preempt_schedule_notrace
> | 2:     ldp     x29, x30, [sp], #16
> |        autiasp
> |        ret
> 
> Generated code after this patch:
> 
> | <this_cpu_write_zero_minus_1>:
> |        paciasp
> |        stp     x29, x30, [sp, #-16]!
> |        mrs     x1, sp_el0
> |        mov     x29, sp
> |        ldr     w2, [x1, #8]
> |        add     w2, w2, #0x1
> |        str     w2, [x1, #8]
> |        mov     x3, #0xffffffff
> |        mrs     x2, tpidr_el1
> |        str     x3, [x0, x2]
> |        ldr     x0, [x1, #8]
> |        sub     x0, x0, #0x1
> |        str     w0, [x1, #8]
> |        cbz     x0, 1f
> |        ldr     x0, [x1, #8]
> |        cbnz    x0, 2f
> | 1:     bl      preempt_schedule_notrace
> | 2:     ldp     x29, x30, [sp], #16
> |        autiasp
> |        ret
> |
> | <this_cpu_write_zero_minus_1_brackets>:
> |        b       this_cpu_write_zero_minus_1
> 
> Fixes: 959bf2fd03b5 ("arm64: percpu: Rewrite per-cpu ops to allow use of LSE atomics")
> Reported-by: David Laight <david.laight.linux@gmail.com>
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

I suspect there is no affected code - largely testable by comparing the
output of two arm64 allmodconfig builds.

Reviewed-by: David Laight <david.laight.linux@gmail.com>

> ---
>  arch/arm64/include/asm/percpu.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> index b57b2bb009677..63bbfd4944a37 100644
> --- a/arch/arm64/include/asm/percpu.h
> +++ b/arch/arm64/include/asm/percpu.h
> @@ -179,13 +179,13 @@ PERCPU_RET_OP(add, add, ldadd)
>  	_pcp_protect_return(__percpu_read_64, pcp)
>  
>  #define this_cpu_write_1(pcp, val)	\
> -	_pcp_protect(__percpu_write_8, pcp, (unsigned long)val)
> +	_pcp_protect(__percpu_write_8, pcp, (unsigned long)(val))
>  #define this_cpu_write_2(pcp, val)	\
> -	_pcp_protect(__percpu_write_16, pcp, (unsigned long)val)
> +	_pcp_protect(__percpu_write_16, pcp, (unsigned long)(val))
>  #define this_cpu_write_4(pcp, val)	\
> -	_pcp_protect(__percpu_write_32, pcp, (unsigned long)val)
> +	_pcp_protect(__percpu_write_32, pcp, (unsigned long)(val))
>  #define this_cpu_write_8(pcp, val)	\
> -	_pcp_protect(__percpu_write_64, pcp, (unsigned long)val)
> +	_pcp_protect(__percpu_write_64, pcp, (unsigned long)(val))
>  
>  #define this_cpu_add_1(pcp, val)	\
>  	_pcp_protect(__percpu_add_case_8, pcp, val)


