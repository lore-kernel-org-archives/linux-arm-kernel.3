Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77AC606A334
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 10:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R/xdE1N6;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vrYRwihz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFWVqZBl3+CvvbX18CIyH20MM9fydx+sK4UtzanFtfg=; b=R/xdE1N6CMC4BbvqWoOlMT9hcl
	jZSFBMbULnWkB1Kj42YQpCDGyPmwSW6+cA7aB15RE4s9a2BuZwRQb1Jx1Ef8pYJy5OMVIhhB3tqC3
	Ab7eHAHfSh4sFCt4AYjYdSjomOA/mACLjh4lUgV1rfsosOC1McoL7Qlmf6fZ2bDC7EEU4vrnOOLaD
	WiY5BgYNNtar5iyVtNbUSOIyAML4xMgRWtK9nb9rIk0snG9koX47yCamtI4sMEz0n1aPcaNmm9VUo
	DawsuSUJ559J581JdA9puCd4WOViAMw7a0Jt6lqy3XGQ2Mt5lgt547xVQFL3I2+ueC3TfB3iALNmJ
	KmHizG0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7LJ-00000009T9n-0Jnw;
	Tue, 20 Oct 2026 10:45:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7LG-00000009T9A-1zVf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 10:45:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 750A91596;
	Tue, 20 Oct 2026 03:45:10 -0700 (PDT)
Received: from [10.0.152.204] (e121487-lin.cambridge.arm.com [10.0.152.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D158C3F7D8;
	Tue, 20 Oct 2026 03:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792493113; bh=7gzvOVw5ut8T5NsUrMoweS15qykq52GG2OrNTb4KKNk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vrYRwihz4TJXg0UBO2MqMrs4mr/zFyQsXD0Lpd5TGeED1KhAhCrgKY7TccsHaG0fQ
	 v3NXkxnT3/Is9gNZ5uc3CPFvbL3USzdJifo1Bip7PcAk1m0ZE9wpsS0tzOdR6Bue3B
	 YK/Ocyrz5+581ilB5UuLCfbYpLDfrM+0r6rcAgb0=
Message-ID: <531c9e81-12fb-4ca9-9be6-aff19877e1a1@arm.com>
Date: Tue, 20 Oct 2026 11:45:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: insn: clean-up sysregs handling
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Tejun Heo <tj@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Lucas Wei <lucaswei@google.com>, Sascha Bischoff <Sascha.Bischoff@arm.com>,
 Barry Song <baohua@kernel.org>, Oliver Upton <oupton@kernel.org>
References: <20261016164648.251258-1-ada.coupriediaz@arm.com>
 <20261016164648.251258-5-ada.coupriediaz@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261016164648.251258-5-ada.coupriediaz@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_034514_601653_355E1E72 
X-CRM114-Status: GOOD (  21.90  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/16/26 17:46, Ada Couprie Diaz wrote:
> System register encodings are already defined in <asm/sysreg.h>, so
> use those definitions in <asm/insn.h> instead of duplicating them.
> This will avoid future errors and deviations.
> 
> Remove the unnecessary shifts for encoding/decoding now that the enum
> values directly match the encoded registers.
> 
> No code using the insn register encodings currently makes a distinction
> between "regular" system registers and special-purpose registers,
> so let's just drop the difference and merge the two enums.
> Remove all unused registers while we are here.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> ---
>  arch/arm64/include/asm/insn.h          | 36 ++++++++------------------
>  arch/arm64/kernel/probes/decode-insn.c |  2 +-
>  arch/arm64/lib/insn.c                  |  4 +--
>  3 files changed, 14 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
> index e020f9d8b83c2..6533191638804 100644
> --- a/arch/arm64/include/asm/insn.h
> +++ b/arch/arm64/include/asm/insn.h
> @@ -12,6 +12,7 @@
>  #include <linux/types.h>
>  
>  #include <asm/insn-def.h>
> +#include <asm/sysreg.h>
>  
>  #ifndef __ASSEMBLER__
>  
> @@ -113,38 +114,23 @@ enum aarch64_insn_register {
>  	AARCH64_INSN_REG_SP = 31  /* Stack pointer: as load/store base reg */
>  };
>  
> +/* System register encoding for MRS/MSR (register) instructions. */
>  #define AARCH64_INSN_SYSREG_OFFSET	5
>  #define AARCH64_INSN_SYSREG_MASK	GENMASK(20, AARCH64_INSN_SYSREG_OFFSET)
> +#define AARCH64_INSN_SYSREG_FROM_DEF(sysreg) \

bikeshedding: perhaps __AARCH64_INSN_SYSREG to match other helper macro in this
file?

> +	AARCH64_INSN_SYSREG_##sysreg = SYS_##sysreg
>  
> -enum aarch64_insn_special_register {
> -	AARCH64_INSN_SPCLREG_SPSR_EL1	= 0xC200,
> -	AARCH64_INSN_SPCLREG_ELR_EL1	= 0xC201,
> -	AARCH64_INSN_SPCLREG_SP_EL0	= 0xC208,
> -	AARCH64_INSN_SPCLREG_SPSEL	= 0xC210,
> -	AARCH64_INSN_SPCLREG_CURRENTEL	= 0xC212,
> -	AARCH64_INSN_SPCLREG_NZCV	= 0xDA10,
> -	AARCH64_INSN_SPCLREG_DAIF	= 0xDA11,
> -	AARCH64_INSN_SPCLREG_FPCR	= 0xDA20,
> -	AARCH64_INSN_SPCLREG_DSPSR_EL0	= 0xDA28,
> -	AARCH64_INSN_SPCLREG_DLR_EL0	= 0xDA29,
> -	AARCH64_INSN_SPCLREG_SPSR_EL2	= 0xE200,
> -	AARCH64_INSN_SPCLREG_ELR_EL2	= 0xE201,
> -	AARCH64_INSN_SPCLREG_SP_EL1	= 0xE208,
> -	AARCH64_INSN_SPCLREG_SPSR_IRQ	= 0xE218,
> -	AARCH64_INSN_SPCLREG_SPSR_ABT	= 0xE219,
> -	AARCH64_INSN_SPCLREG_SPSR_UND	= 0xE21A,
> -	AARCH64_INSN_SPCLREG_SPSR_FIQ	= 0xE21B,
> -	AARCH64_INSN_SPCLREG_SPSR_EL3	= 0xF200,
> -	AARCH64_INSN_SPCLREG_ELR_EL3	= 0xF201,
> -	AARCH64_INSN_SPCLREG_SP_EL2	= 0xF208,
> -};
>  

The only register in use was AARCH64_INSN_SPCLREG_DAIF which is
now replaced with direct use of AARCH64_INSN_SYSREG_DAIF.

> +/* Do not duplicate encodings: we already define them in <asm/sysreg.h> */
>  enum aarch64_insn_system_register {
> -	AARCH64_INSN_SYSREG_SP_EL0	= 0xC208,
> -	AARCH64_INSN_SYSREG_TPIDR_EL1	= 0xC684,
> -	AARCH64_INSN_SYSREG_TPIDR_EL2	= 0xE682,
> +	AARCH64_INSN_SYSREG_FROM_DEF(SP_EL0),
> +	AARCH64_INSN_SYSREG_FROM_DEF(TPIDR_EL1),
> +	AARCH64_INSN_SYSREG_FROM_DEF(DAIF),
> +	AARCH64_INSN_SYSREG_FROM_DEF(TPIDR_EL2),
>  };
>  
> +#undef AARCH64_INSN_SYSREG_FROM_DEF
> +
>  enum aarch64_insn_variant {
>  	AARCH64_INSN_VARIANT_32BIT,
>  	AARCH64_INSN_VARIANT_64BIT
> diff --git a/arch/arm64/kernel/probes/decode-insn.c b/arch/arm64/kernel/probes/decode-insn.c
> index 4137cc5ef031f..bb0af08105885 100644
> --- a/arch/arm64/kernel/probes/decode-insn.c
> +++ b/arch/arm64/kernel/probes/decode-insn.c
> @@ -40,7 +40,7 @@ static bool __kprobes aarch64_insn_is_steppable(u32 insn)
>  		 */
>  		if (aarch64_insn_is_mrs(insn))
>  			return aarch64_insn_extract_system_reg(insn)
> -			     != AARCH64_INSN_SPCLREG_DAIF;
> +			     != AARCH64_INSN_SYSREG_DAIF;
>  
>  		/*
>  		 * The HINT instruction is steppable only if it is in whitelist
> diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
> index 2edc5a9c0a9c8..1611c86885c9f 100644
> --- a/arch/arm64/lib/insn.c
> +++ b/arch/arm64/lib/insn.c
> @@ -1364,7 +1364,7 @@ u32 aarch64_insn_adrp_set_offset(u32 insn, s32 offset)
>   */
>  noinstr u32 aarch64_insn_extract_system_reg(u32 insn)
>  {
> -	return (insn & AARCH64_INSN_SYSREG_MASK) >> AARCH64_INSN_SYSREG_OFFSET;
> +	return insn & AARCH64_INSN_SYSREG_MASK;
>  }
>  
>  bool aarch32_insn_is_wide(u32 insn)
> @@ -1567,7 +1567,7 @@ u32 aarch64_insn_gen_mrs(enum aarch64_insn_register result,
>  	u32 insn = aarch64_insn_get_mrs_value();
>  
>  	insn &= ~AARCH64_INSN_SYSREG_MASK;
> -	insn |= sysreg << AARCH64_INSN_SYSREG_OFFSET;
> +	insn |= sysreg;
>  	return aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RT,
>  					    insn, result);
>  }
> -- 2.43.0
> 

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>



