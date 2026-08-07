Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE7EC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 04:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5R1g/lTULmE0cpizN2C7xpl0sqIGETJfyPJS85LVXWU=; b=3/t+WBKy5jiyoX
	1+pZAiaYbthdqgvS2KBW36pVBADkTBC2c9yja1vfVjaCLmJ1/pV7QeC1zRKLfyCTUcZmdEPYABKAh
	VgEtvhiHz4WfgxkFxD9iVeyumwmfOCAOVgexAhX2MWlEXzx8bLSMSyVvnDLzfxryItbJXv5XmyUa0
	wxRAl+MFEuC1Xjsx3a9KzC+4vjTzRX22UfBSyfHhoLRKpxwJ6ahU4V4I6qbcRWj2+u78TeGOqRAmK
	CFc4LPdUoaDB5N3DX5gjrIpl08xXSHqlpOJoyudi+IcUAqNzGSq+NZLI+TXLfutlW7sq5X6kt7nEf
	mSQoiSgMWLwMemcHUgIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsBl3-000000073zO-09FM;
	Fri, 07 Aug 2026 04:00:33 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsBkz-000000073z0-1CVa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 04:00:31 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5R1g/lTULmE0cpizN2C7xpl0sqIGETJfyPJS85LVXWU=;
	b=ri2HG5CGFuk8tcKqZxbnIsBGwNt20PeeMCJijON/OfdinYe905qjRB0sO4Cy98idpAIDEziJ3
	e24qjH5bZG6rPeJWQUrHhKAzcqicTHkv79R+XE0f1dnir/ew7dfwwgmbH6PJl2JHZYDPgRmciG6
	dZTEGT/7G0nUwHRL9Wv3d8M=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4hGVYH6cTNzpSvB;
	Fri,  7 Aug 2026 11:50:43 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id C03864057F;
	Fri,  7 Aug 2026 12:00:16 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 7 Aug 2026 12:00:15 +0800
Message-ID: <2b96cf93-ddf2-4700-91d2-a0587343c3ff@huawei.com>
Date: Fri, 7 Aug 2026 12:00:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/20] arm64: percpu: Fix this_cpu_write() casting
To: Mark Rutland <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260804170503.3513916-1-mark.rutland@arm.com>
 <20260804170503.3513916-2-mark.rutland@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260804170503.3513916-2-mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_210030_034557_D10749D4 
X-CRM114-Status: GOOD (  17.87  )
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
Cc: vladimir.murzin@arm.com, ryan.roberts@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



在 2026/8/5 1:04, Mark Rutland 写道:
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

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

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


