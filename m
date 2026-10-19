Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5016FCCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGx+a1NtZjnrwcw+BONGdD/EOWeC/4NjaF0ritVuERU=; b=E0vMMsJGEyXoJIPVhVPsBm7fBO
	TOnq1WLNL0sq9+RFsfMV7o34JTgqk1qAICW1+QLWBA7n6TajXQFKYtpBHFAg0FtSEzDDSjA1a16Pq
	6fMz7TheaRfF/G41S/F17M0PutpgITftmJuM4i0Z+c4cMVPT6lDqYIsLHi0ymmomnZI9dFJ2uHTRQ
	JvjP+1RKQTr/X39kA5DeP3zSOca+GmqYuUJ9GIoeU1s8cpgJ25ITnqX7Niv+I+87SyTKuLPGQ/c7/
	ncm1DLfrUPkbT/7qD7zY0eolGhSz6mU2AbgW1TTBniYW1O8Z9EsPXFZXX//Upm0dWj3E6q/SsdRT/
	uJMaPViw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkHR-000000077Vq-2xM6;
	Mon, 19 Oct 2026 10:07:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkHO-000000077TI-3b7k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 10:07:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4B941EA6;
	Mon, 19 Oct 2026 03:07:37 -0700 (PDT)
Received: from [10.0.152.204] (e121487-lin.cambridge.arm.com [10.0.152.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66EA73F9A2;
	Mon, 19 Oct 2026 03:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792404460; bh=k6+k9+SxLvm79mWJFJgtdJVBZiNU+MObDWGx9GFnGLY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JNyTjHNnGTUDKYCXW/stxA9LPFq2koRAWOg4251zM8h492M/vo3tL6bZ7FjWQccJI
	 byxaGzPD1gtXiutyZGKtDHYOFZfbphx47+3q9kfCmyc66jLykYbJesnmCUWJAH8Sjq
	 lPiuvzu54FQmzE7yozakQy8m8ST/ISuHw3hmeQGA=
Message-ID: <d8c784c0-ee8b-451f-879d-c3890f8dc63c@arm.com>
Date: Mon, 19 Oct 2026 11:07:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: insn: clean-up memory barrier types
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
 <20261016165140.254791-2-ada.coupriediaz@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261016165140.254791-2-ada.coupriediaz@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_030742_993159_A54CF8A8 
X-CRM114-Status: GOOD (  19.06  )
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
> Replace magic-numbers for offset and mask with shared defines.
> 
> Re-order the types enum by value, matching the Arm ARM, and
> define them with their proper values, simplifying their use.
> 
> Arm ARM DDI 0487 version M.c[0] deprecated a number of types
> used as options for the DMB and DSB instructions, with no change
> in behaviour.
> The deprecated types are not used in the kernel, so remove them
> from our instruction generation framework and add the missing
> `AARCH64_INSN_MB_OSH` case in `__get_barrier_crm_val()`.
> 

Nitpick: this is slightly confusing since __get_barrier_crm_val()
gets converted into  __is_valid_barrier_type()

> This simplifies the switch-case and now covers all the enum types,
> which allows for making the DSB and DMB generation non instrumentable
> in a follow-up commit.
> 
> [0]: https://support.arm.com/documentation/ddi0487/mc/
>      (See C6.2.150, C6.2.152)
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> ---
>  arch/arm64/include/asm/insn.h | 22 ++++++++----------
>  arch/arm64/lib/insn.c         | 44 ++++++++++++-----------------------
>  2 files changed, 25 insertions(+), 41 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
> index 1ce75a442638..2d19f48aab81 100644
> --- a/arch/arm64/include/asm/insn.h
> +++ b/arch/arm64/include/asm/insn.h
> @@ -7,6 +7,7 @@
>   */
>  #ifndef	__ASM_INSN_H
>  #define	__ASM_INSN_H
> +#include <linux/bits.h>
>  #include <linux/build_bug.h>
>  #include <linux/types.h>
>  
> @@ -297,19 +298,16 @@ enum aarch64_insn_mem_order_type {
>  	AARCH64_INSN_MEM_ORDER_ACQREL,
>  };
>  
> +#define AARCH64_INSN_MB_TYPE_OFFSET 8
> +#define AARCH64_INSN_MB_TYPE_MASK GENMASK(11, AARCH64_INSN_MB_TYPE_OFFSET)
> +
>  enum aarch64_insn_mb_type {
> -	AARCH64_INSN_MB_SY,
> -	AARCH64_INSN_MB_ST,
> -	AARCH64_INSN_MB_LD,
> -	AARCH64_INSN_MB_ISH,
> -	AARCH64_INSN_MB_ISHST,
> -	AARCH64_INSN_MB_ISHLD,
> -	AARCH64_INSN_MB_NSH,
> -	AARCH64_INSN_MB_NSHST,
> -	AARCH64_INSN_MB_NSHLD,
> -	AARCH64_INSN_MB_OSH,
> -	AARCH64_INSN_MB_OSHST,
> -	AARCH64_INSN_MB_OSHLD,
> +	AARCH64_INSN_MB_OSH	= 0b0011 << AARCH64_INSN_MB_TYPE_OFFSET,
> +	AARCH64_INSN_MB_NSH	= 0b0111 << AARCH64_INSN_MB_TYPE_OFFSET,
> +	AARCH64_INSN_MB_ISH	= 0b1011 << AARCH64_INSN_MB_TYPE_OFFSET,
> +	AARCH64_INSN_MB_LD	= 0b1101 << AARCH64_INSN_MB_TYPE_OFFSET,
> +	AARCH64_INSN_MB_ST	= 0b1110 << AARCH64_INSN_MB_TYPE_OFFSET,
> +	AARCH64_INSN_MB_SY	= 0b1111 << AARCH64_INSN_MB_TYPE_OFFSET,
>  };
>  
>  #define	__AARCH64_INSN_FUNCS(abbr, mask, val)				\
> diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
> index e70ac0238515..fa61a631d687 100644
> --- a/arch/arm64/lib/insn.c
> +++ b/arch/arm64/lib/insn.c
> @@ -1561,60 +1561,46 @@ u32 aarch64_insn_gen_extr(enum aarch64_insn_variant variant,
>  	return aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RM, insn, Rm);
>  }
>  
> -static u32 __get_barrier_crm_val(enum aarch64_insn_mb_type type)
> +static bool __is_valid_barrier_type(enum aarch64_insn_mb_type type)
>  {
>  	switch (type) {
> -	case AARCH64_INSN_MB_SY:
> -		return 0xf;
> -	case AARCH64_INSN_MB_ST:
> -		return 0xe;
> -	case AARCH64_INSN_MB_LD:
> -		return 0xd;
> -	case AARCH64_INSN_MB_ISH:
> -		return 0xb;
> -	case AARCH64_INSN_MB_ISHST:
> -		return 0xa;
> -	case AARCH64_INSN_MB_ISHLD:
> -		return 0x9;
> +	case AARCH64_INSN_MB_OSH:
>  	case AARCH64_INSN_MB_NSH:
> -		return 0x7;
> -	case AARCH64_INSN_MB_NSHST:
> -		return 0x6;
> -	case AARCH64_INSN_MB_NSHLD:
> -		return 0x5;
> +	case AARCH64_INSN_MB_ISH:
> +	case AARCH64_INSN_MB_LD:
> +	case AARCH64_INSN_MB_ST:
> +	case AARCH64_INSN_MB_SY:
> +		return true;
>  	default:
>  		pr_err("%s: unknown barrier type %d\n", __func__, type);
> -		return AARCH64_BREAK_FAULT;
> +		return false;
>  	}
>  }
>  
>  u32 aarch64_insn_gen_dmb(enum aarch64_insn_mb_type type)
>  {
> -	u32 opt;
>  	u32 insn;
>  
> -	opt = __get_barrier_crm_val(type);
> -	if (opt == AARCH64_BREAK_FAULT)
> +	if (!__is_valid_barrier_type(type))
>  		return AARCH64_BREAK_FAULT;
>  
>  	insn = aarch64_insn_get_dmb_value();
> -	insn &= ~GENMASK(11, 8);
> -	insn |= (opt << 8);
> +	insn &= ~AARCH64_INSN_MB_TYPE_MASK;
> +	insn |= type;
>  
>  	return insn;
>  }
>  
>  u32 aarch64_insn_gen_dsb(enum aarch64_insn_mb_type type)
>  {
> -	u32 opt, insn;
> +	u32 insn;
>  
> -	opt = __get_barrier_crm_val(type);
> -	if (opt == AARCH64_BREAK_FAULT)
> +	if (!__is_valid_barrier_type(type))
>  		return AARCH64_BREAK_FAULT;
>  
>  	insn = aarch64_insn_get_dsb_base_value();
> -	insn &= ~GENMASK(11, 8);
> -	insn |= (opt << 8);
> +	insn &= ~AARCH64_INSN_MB_TYPE_MASK;
> +	insn |= type;
>  
>  	return insn;
>  }
> -- 2.43.0
> 

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>

