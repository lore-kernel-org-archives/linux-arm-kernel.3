Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FE8CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkwWRSm6IVCUkMR7ZYJsN+Excc6BTQ4/9tKWmpf323I=; b=sJb8ODigx8GVmvmXbDf7Ic61Rk
	bRRUuGcH/fhzRowiHSclU4r7DXu18Lhw4D1MkKtKg7b6NAKIN/1+D3pAFuA+wJ7/3HbEm4PSDe+7z
	r7bj6ZCSjoYjP7hV3vUMFWPCjvADXXJ9R4NWPrL9/CcC5imQpgIyMPGk8NgWrIpzEQSoHf73FKHm2
	PGntyaQPx1kEKDBWRECeE/zi7dfNNjAL2MYHRZseKpz9D1bxS9nk2IbFnmJ/bW5F2iJN20EqrXL8d
	W5P0Z6sLyOUMVFt8CYh9Fk5CBqNkMF1fJc3UkGf1dCyVL8SWCU9566iekf+4M35MBq9qFbbGVTot9
	44YzC5Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkwS-00000007El1-0MXr;
	Mon, 19 Oct 2026 10:50:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkwP-00000007Ekc-1zxU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 10:50:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C10C143D;
	Mon, 19 Oct 2026 03:49:59 -0700 (PDT)
Received: from [10.0.152.204] (e121487-lin.cambridge.arm.com [10.0.152.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09EA93F673;
	Mon, 19 Oct 2026 03:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792407002; bh=IqZ87T79p4v8rA9Dq15cLL8uTowBdbPbhhKw0ZN/MlY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NYFSZUuc/9suaLWc749nxL4ykoa8DJDTQM6fCDj9wTRepvPczuvlJgGrAOlcpILe4
	 8M5PlL2UpN27svp6PQNxOwzUCKPcaOVbi7qXj8tHRB6vMUwuUDBlX95pIqzo+rCyiX
	 O+5M0zrEBM9D2BsB3dBCmJ5xYGxDDxiVTOSes9eM=
Message-ID: <5f1c9d90-2269-4e46-9a20-e8152153384c@arm.com>
Date: Mon, 19 Oct 2026 11:49:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: insn: make `aarch64_insn_gen_d{m,s}b()`
 alternative-safe
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Tejun Heo <tj@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Lucas Wei <lucaswei@google.com>, Sascha Bischoff <Sascha.Bischoff@arm.com>,
 Barry Song <baohua@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Xu Kuohai <xukuohai@huaweicloud.com>, Puranjay Mohan <puranjay@kernel.org>
References: <20261016165140.254791-1-ada.coupriediaz@arm.com>
 <20261016165140.254791-3-ada.coupriediaz@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261016165140.254791-3-ada.coupriediaz@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_035005_699638_0CE0A210 
X-CRM114-Status: GOOD (  24.81  )
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

Hi Ada,

On 10/16/26 17:51, Ada Couprie Diaz wrote:
> Move `aarch64_insn_gen_d{m,s}b()` and `__get_barrier_crm_val()`

__get_barrier_crm_val()/__is_valid_barrier_type() has gone, so
reference to it confuses.

> to `insn.h` and mark them `__always_inline`.
> Replace the error print by an inline build-time check
> now that the compiler can verify all call sites.

My understanding is that error printing is not alternative-safe,
so we replace it with a build-time check. The latter requires the
barrier type to be visible to the compiler, hence moving the
helper to a header and marking it __always_inline (with the side
effect that the code may be inlined into noinstr functions).

However, is it safe to assume that the barrier type will always
be visible to the compiler? This is true today, but I can imagine
a scenario where the barrier type is passed through a helper
defined in a separate translation units, making it impossible for
the compiler to observe its value at build time. I'm not sure
whether this is something we should worry about right now.

Another thing I'm wondering about is how we plan to make other
helpers alternative-safe. Do we eventually intend to move all of
them into header?

I also noticed that we're not entirely consistent with error
reporting across helpers. In several cases, we simply return
AARCH64_BREAK_FAULT without printing anything to the log. Perhaps
a better approach to making these helpers alternative-safe would
be to remove error printing altogether, mark them noinstr, and
return AARCH64_BREAK_FAULT whenever we cannot construct a valid
opcode?

> 
> As BPF is the only caller, with static arguments, only accept
> non-deprecated types for each barrier, as per Arm ARM DDI 0487
> version M.c[0], and update `A64_DMB_ISH` accordingly.
> 
> As all functions are now inlined and do not call any instrumentable
> function, they are now safe to call in alternative callbacks.
> 
> [0]: https://support.arm.com/documentation/ddi0487/mc/
>          (See C6.2.150, C6.2.152)
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> ---
>  arch/arm64/include/asm/insn.h | 46 +++++++++++++++++++++++++++++++++--
>  arch/arm64/lib/insn.c         | 44 ---------------------------------
>  arch/arm64/net/bpf_jit.h      |  2 +-
>  3 files changed, 45 insertions(+), 47 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
> index 2d19f48aab81..c91a8431c961 100644
> --- a/arch/arm64/include/asm/insn.h
> +++ b/arch/arm64/include/asm/insn.h
> @@ -703,8 +703,50 @@ u32 aarch64_insn_gen_cas(enum aarch64_insn_register result,
>  			 enum aarch64_insn_register value,
>  			 enum aarch64_insn_size_type size,
>  			 enum aarch64_insn_mem_order_type order);
> -u32 aarch64_insn_gen_dmb(enum aarch64_insn_mb_type type);
> -u32 aarch64_insn_gen_dsb(enum aarch64_insn_mb_type type);
> +
> +static __always_inline u32 aarch64_insn_gen_dmb(enum aarch64_insn_mb_type type)
> +{
> +	u32 insn;
> +
> +	switch (type) {
> +	case AARCH64_INSN_MB_LD:
> +	case AARCH64_INSN_MB_ST:
> +	case AARCH64_INSN_MB_SY:
> +		break;
> +	default:
> +		BUILD_BUG_ON_MSG(1, "invalid dmb type");
> +	}
> +
> +	insn = aarch64_insn_get_dmb_value();
> +	insn &= ~AARCH64_INSN_MB_TYPE_MASK;
> +	insn |= type;
> +
> +	return insn;
> +}
> +
> +static __always_inline u32 aarch64_insn_gen_dsb(enum aarch64_insn_mb_type type)
> +{
> +	u32 insn;
> +
> +	switch (type) {
> +	case AARCH64_INSN_MB_OSH:
> +	case AARCH64_INSN_MB_NSH:
> +	case AARCH64_INSN_MB_ISH:
> +	case AARCH64_INSN_MB_LD:
> +	case AARCH64_INSN_MB_ST:
> +	case AARCH64_INSN_MB_SY:
> +		break;
> +	default:
> +		BUILD_BUG_ON_MSG(1, "invalid dsb type");
> +	}
> +
> +	insn = aarch64_insn_get_dsb_base_value();
> +	insn &= ~AARCH64_INSN_MB_TYPE_MASK;
> +	insn |= type;
> +
> +	return insn;
> +}
> +
>  u32 aarch64_insn_gen_mrs(enum aarch64_insn_register result,
>  			 enum aarch64_insn_system_register sysreg);
>  
> diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
> index fa61a631d687..5c37f3a4c402 100644
> --- a/arch/arm64/lib/insn.c
> +++ b/arch/arm64/lib/insn.c
> @@ -1561,50 +1561,6 @@ u32 aarch64_insn_gen_extr(enum aarch64_insn_variant variant,
>  	return aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RM, insn, Rm);
>  }
>  
> -static bool __is_valid_barrier_type(enum aarch64_insn_mb_type type)
> -{
> -	switch (type) {
> -	case AARCH64_INSN_MB_OSH:
> -	case AARCH64_INSN_MB_NSH:
> -	case AARCH64_INSN_MB_ISH:
> -	case AARCH64_INSN_MB_LD:
> -	case AARCH64_INSN_MB_ST:
> -	case AARCH64_INSN_MB_SY:
> -		return true;
> -	default:
> -		pr_err("%s: unknown barrier type %d\n", __func__, type);
> -		return false;
> -	}
> -}
> -
> -u32 aarch64_insn_gen_dmb(enum aarch64_insn_mb_type type)
> -{
> -	u32 insn;
> -
> -	if (!__is_valid_barrier_type(type))
> -		return AARCH64_BREAK_FAULT;
> -
> -	insn = aarch64_insn_get_dmb_value();
> -	insn &= ~AARCH64_INSN_MB_TYPE_MASK;
> -	insn |= type;
> -
> -	return insn;
> -}
> -
> -u32 aarch64_insn_gen_dsb(enum aarch64_insn_mb_type type)
> -{
> -	u32 insn;
> -
> -	if (!__is_valid_barrier_type(type))
> -		return AARCH64_BREAK_FAULT;
> -
> -	insn = aarch64_insn_get_dsb_base_value();
> -	insn &= ~AARCH64_INSN_MB_TYPE_MASK;
> -	insn |= type;
> -
> -	return insn;
> -}
> -
>  u32 aarch64_insn_gen_mrs(enum aarch64_insn_register result,
>  			 enum aarch64_insn_system_register sysreg)
>  {
> diff --git a/arch/arm64/net/bpf_jit.h b/arch/arm64/net/bpf_jit.h
> index b2fe6e6dcf44..08d514b40a5b 100644
> --- a/arch/arm64/net/bpf_jit.h
> +++ b/arch/arm64/net/bpf_jit.h
> @@ -324,7 +324,7 @@
>  #define A64_NOP    A64_HINT(AARCH64_INSN_HINT_NOP)
>  
>  /* DMB */
> -#define A64_DMB_ISH aarch64_insn_gen_dmb(AARCH64_INSN_MB_ISH)
> +#define A64_DMB_ISH aarch64_insn_gen_dmb(AARCH64_INSN_MB_SY)
>  

ISH - This option has the same behavior as SY and is deprecated.    

so conversion is valid.

Cheers
Vladimir

>  /* ADR */
>  #define A64_ADR(Rd, offset) \
> -- 2.43.0
> 


