Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2476E81A3A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 15:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyU/1yqbDTt+Tsm+4EXpZVbrSAOuHNabjPfri/+S+fY=; b=nKTpHAXhn4pFj2Dv4nTpP03Scm
	Ft1vEAN8qsqlcwTivYapmFLMSz0wi1NK473eR8cEHPInGuSQ57Nw4jtd0kUvXhXqY++E94bGvYfih
	EBpRnNaXohhw1h8/N8OPf0r22fSMOFI2cA4Aa5XjN8XOYjyVMboiTaWcVmv+l3hR6xpkMuIo0llD7
	qihnbhZJfQOHpSI4dE6eZB5uorGE8TmbZQ9Jo5mC0UT6wTTjMpM+CdJrKQ6AUPYSudzMYYEnwXGtl
	BtpCZxg703l8dm5FKsmWdLepgW26et58fXe8KJpEntaH66yr522gdlPupy+j1WHxyCCTNnkjsmSIB
	tvnBo1ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0XQ-00000006tmN-2wqI;
	Mon, 16 Feb 2026 15:29:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0XN-00000006tm0-2iH2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 15:29:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C379C1576;
	Mon, 16 Feb 2026 07:29:17 -0800 (PST)
Received: from [10.163.134.253] (unknown [10.163.134.253])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D34753F632;
	Mon, 16 Feb 2026 07:29:20 -0800 (PST)
Message-ID: <89606308-3c03-4dcf-a89d-479258b710e4@arm.com>
Date: Mon, 16 Feb 2026 20:59:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: remove HAVE_CMPXCHG_LOCAL
To: Will Deacon <will@kernel.org>, Jisheng Zhang <jszhang@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Dennis Zhou
 <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
 Christoph Lameter <cl@gentwo.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, maz@kernel.org
References: <20260215033944.16374-1-jszhang@kernel.org>
 <aZL46z1UZkQlF3Dd@willie-the-truck>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <aZL46z1UZkQlF3Dd@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_072925_837037_685BCC00 
X-CRM114-Status: GOOD (  14.16  )
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


On 16/02/26 4:30 pm, Will Deacon wrote:
> On Sun, Feb 15, 2026 at 11:39:44AM +0800, Jisheng Zhang wrote:
>> It turns out the generic disable/enable irq this_cpu_cmpxchg
>> implementation is faster than LL/SC or lse implementation. Remove
>> HAVE_CMPXCHG_LOCAL for better performance on arm64.
>>
>> Tested on Quad 1.9GHZ CA55 platform:
>> average mod_node_page_state() cost decreases from 167ns to 103ns
>> the spawn (30 duration) benchmark in unixbench is improved
>> from 147494 lps to 150561 lps, improved by 2.1%
>>
>> Tested on Quad 2.1GHZ CA73 platform:
>> average mod_node_page_state() cost decreases from 113ns to 85ns
>> the spawn (30 duration) benchmark in unixbench is improved
>> from 209844 lps to 212581 lps, improved by 1.3%
>>
>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>> ---
>>  arch/arm64/Kconfig              |  1 -
>>  arch/arm64/include/asm/percpu.h | 24 ------------------------
>>  2 files changed, 25 deletions(-)
> That is _entirely_ dependent on the system, so this isn't the right
> approach. I also don't think it's something we particularly want to
> micro-optimise to accomodate systems that suck at atomics.

Hi Will,

As I mention in the other email, the suspect is not the atomics, but
preempt_disable(). On Apple M3, the regression reported in [1] resolves
by removing preempt_disable/enable in _pcp_protect_return. To prove
this another way, I disabled CONFIG_ARM64_HAS_LSE_ATOMICS and the
regression worsened, indicating that at least on Apple M3 the
atomics are faster.

It may help to confirm this hypothesis on other hardware - perhaps
Jisheng can test with this change on his hardware and confirm
whether he gets the same performance improvement.

By coincidence, Yang Shi has been discussing the this_cpu_* overhead
at [2].

[1] https://lore.kernel.org/all/1052a452-9ba3-4da7-be47-7d27d27b3d1d@arm.com/
[2] https://lore.kernel.org/all/CAHbLzkpcN-T8MH6=W3jCxcFj1gVZp8fRqe231yzZT-rV_E_org@mail.gmail.com/

>
> Will
>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 38dba5f7e4d2..5e7e2e65d5a5 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -205,7 +205,6 @@ config ARM64
>>  	select HAVE_EBPF_JIT
>>  	select HAVE_C_RECORDMCOUNT
>>  	select HAVE_CMPXCHG_DOUBLE
>> -	select HAVE_CMPXCHG_LOCAL
>>  	select HAVE_CONTEXT_TRACKING_USER
>>  	select HAVE_DEBUG_KMEMLEAK
>>  	select HAVE_DMA_CONTIGUOUS
>> diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
>> index b57b2bb00967..70ffe566cb4b 100644
>> --- a/arch/arm64/include/asm/percpu.h
>> +++ b/arch/arm64/include/asm/percpu.h
>> @@ -232,30 +232,6 @@ PERCPU_RET_OP(add, add, ldadd)
>>  #define this_cpu_xchg_8(pcp, val)	\
>>  	_pcp_protect_return(xchg_relaxed, pcp, val)
>>  
>> -#define this_cpu_cmpxchg_1(pcp, o, n)	\
>> -	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
>> -#define this_cpu_cmpxchg_2(pcp, o, n)	\
>> -	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
>> -#define this_cpu_cmpxchg_4(pcp, o, n)	\
>> -	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
>> -#define this_cpu_cmpxchg_8(pcp, o, n)	\
>> -	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
>> -
>> -#define this_cpu_cmpxchg64(pcp, o, n)	this_cpu_cmpxchg_8(pcp, o, n)
>> -
>> -#define this_cpu_cmpxchg128(pcp, o, n)					\
>> -({									\
>> -	typedef typeof(pcp) pcp_op_T__;					\
>> -	u128 old__, new__, ret__;					\
>> -	pcp_op_T__ *ptr__;						\
>> -	old__ = o;							\
>> -	new__ = n;							\
>> -	preempt_disable_notrace();					\
>> -	ptr__ = raw_cpu_ptr(&(pcp));					\
>> -	ret__ = cmpxchg128_local((void *)ptr__, old__, new__);		\
>> -	preempt_enable_notrace();					\
>> -	ret__;								\
>> -})
>>  
>>  #ifdef __KVM_NVHE_HYPERVISOR__
>>  extern unsigned long __hyp_per_cpu_offset(unsigned int cpu);
>> -- 
>> 2.51.0
>>

