Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AD0E7BD8F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 10:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=et0M9QIeKYJpMWLDuEx7jjkufYlirGMPzyVJS1cazuA=; b=hPD/LanavD/HGj0XFKzb+yGO5u
	BRMmJ8SIJmYLGxSLIgKDRfUum5kBtiEUgUEyjYHFDh5284Qk+7sbbG0FRyJwsY7fnaxmCwIVYERpi
	xDKABiAvyXvP/zKZ4bdMcD8M9K7bRLYjQiAnoblLsa5KMPp7kDTi+IjKnx5Kqxxv7DcGwIlB27hmp
	HUI4qglflPfnCdnK/MLtoD3ltt+WQzBMFe3o72DEJyFFPUbhEvocs6Bg1aEr/ReWtsRVS2Tz2I/W4
	/U2jXEXqo/z9Tkp/rCb1SoZymBLNbgi88U1tEkOtPd3QZ1I0Ub7VExTEZwbOnOM0esWTIV9NoLEgX
	fJkoRcGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwJy-00000006OYS-38Kp;
	Mon, 16 Feb 2026 10:59:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwJv-00000006OXf-0e15
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 10:59:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 666D11570;
	Mon, 16 Feb 2026 02:59:06 -0800 (PST)
Received: from [10.164.19.71] (unknown [10.164.19.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 640983F632;
	Mon, 16 Feb 2026 02:59:10 -0800 (PST)
Message-ID: <d2eb1116-44e8-4e55-bb09-e8d9af5787c6@arm.com>
Date: Mon, 16 Feb 2026 16:29:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: remove HAVE_CMPXCHG_LOCAL
To: Jisheng Zhang <jszhang@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
 Christoph Lameter <cl@gentwo.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20260215033944.16374-1-jszhang@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260215033944.16374-1-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_025915_802277_F0AC26EB 
X-CRM114-Status: GOOD (  14.06  )
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


On 15/02/26 9:09 am, Jisheng Zhang wrote:
> It turns out the generic disable/enable irq this_cpu_cmpxchg
> implementation is faster than LL/SC or lse implementation. Remove
> HAVE_CMPXCHG_LOCAL for better performance on arm64.
>
> Tested on Quad 1.9GHZ CA55 platform:
> average mod_node_page_state() cost decreases from 167ns to 103ns
> the spawn (30 duration) benchmark in unixbench is improved
> from 147494 lps to 150561 lps, improved by 2.1%
>
> Tested on Quad 2.1GHZ CA73 platform:
> average mod_node_page_state() cost decreases from 113ns to 85ns
> the spawn (30 duration) benchmark in unixbench is improved
> from 209844 lps to 212581 lps, improved by 1.3%
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---

Thanks. This concurs with my investigation on [1]. The problem
isn't really LL/SC/LSE but preempt_disable()/enable() in
this_cpu_* [1, 2].

I think you should only remove the selection of the config,
but keep the code? We may want to switch this on again if
the real issue gets solved.

[1] https://lore.kernel.org/all/5a6782f3-d758-4d9c-975b-5ae4b5d80d4e@arm.com/
[2] https://lore.kernel.org/all/CAHbLzkpcN-T8MH6=W3jCxcFj1gVZp8fRqe231yzZT-rV_E_org@mail.gmail.com/

>  arch/arm64/Kconfig              |  1 -
>  arch/arm64/include/asm/percpu.h | 24 ------------------------
>  2 files changed, 25 deletions(-)
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 38dba5f7e4d2..5e7e2e65d5a5 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -205,7 +205,6 @@ config ARM64
>  	select HAVE_EBPF_JIT
>  	select HAVE_C_RECORDMCOUNT
>  	select HAVE_CMPXCHG_DOUBLE
> -	select HAVE_CMPXCHG_LOCAL
>  	select HAVE_CONTEXT_TRACKING_USER
>  	select HAVE_DEBUG_KMEMLEAK
>  	select HAVE_DMA_CONTIGUOUS
> diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> index b57b2bb00967..70ffe566cb4b 100644
> --- a/arch/arm64/include/asm/percpu.h
> +++ b/arch/arm64/include/asm/percpu.h
> @@ -232,30 +232,6 @@ PERCPU_RET_OP(add, add, ldadd)
>  #define this_cpu_xchg_8(pcp, val)	\
>  	_pcp_protect_return(xchg_relaxed, pcp, val)
>  
> -#define this_cpu_cmpxchg_1(pcp, o, n)	\
> -	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
> -#define this_cpu_cmpxchg_2(pcp, o, n)	\
> -	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
> -#define this_cpu_cmpxchg_4(pcp, o, n)	\
> -	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
> -#define this_cpu_cmpxchg_8(pcp, o, n)	\
> -	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
> -
> -#define this_cpu_cmpxchg64(pcp, o, n)	this_cpu_cmpxchg_8(pcp, o, n)
> -
> -#define this_cpu_cmpxchg128(pcp, o, n)					\
> -({									\
> -	typedef typeof(pcp) pcp_op_T__;					\
> -	u128 old__, new__, ret__;					\
> -	pcp_op_T__ *ptr__;						\
> -	old__ = o;							\
> -	new__ = n;							\
> -	preempt_disable_notrace();					\
> -	ptr__ = raw_cpu_ptr(&(pcp));					\
> -	ret__ = cmpxchg128_local((void *)ptr__, old__, new__);		\
> -	preempt_enable_notrace();					\
> -	ret__;								\
> -})
>  
>  #ifdef __KVM_NVHE_HYPERVISOR__
>  extern unsigned long __hyp_per_cpu_offset(unsigned int cpu);

