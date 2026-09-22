Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E91C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Zu5Ozx+jS0FohX0/d3Boi+OVW1vOPW0SN2MYK7ER00=; b=O3Mu4qIC1U/wJYtC3Jq5Vn0dx6
	fZN7vaGpJEoR/YALqefUcIhVsqS7atD1pWwTcpimhSnzdZx6YvLMla4lz9oP5y0/tJOvcPPCobWUQ
	DRqjONeb0FlZNYMFS3fnr/QlbTtvy6UiUJqHDGNZ577aiOsHN0Boxa6H7YXgh3xK6/2syrfvsVkzE
	zaxfc+fCpH4RZ/76TKubL4FEPdYFJNH5SMoTkIZZOC/+UMJwGs6gzBUIO8nKwRFzkktk8NRFymImu
	jKcZkwjRe5muzI09JHY2Ol8W6AvKrivnpemk85YP4/xNQ6dHHUXvAkNkdyXyAjcUvgIYOGiaFok6Y
	vZIYBCQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ymC-00000005BUq-3AX2;
	Tue, 22 Sep 2026 11:35:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ymB-00000005BUa-3RlH
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 11:35:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6Zu5Ozx+jS0FohX0/d3Boi+OVW1vOPW0SN2MYK7ER00=; b=jpNTBVbQ2fmeVJ8A0rAkACp+8c
	awJvaJLxzKH5wFHRd1mf6eBDV3WPEXzT8Zvce8x+iCf6BlVyTRRBlXVSpu8S19O7qoM+AqspNHV/g
	9Pihf9MYnYgV4CGBorb+/w4vJiartjOOLw7EIYdHL5xf+O2sdcZeoKapJubxDgfmlB2MOfyVNQq5w
	DcvU7OBn/IAX8ELJBr+JaypuSQDs4XU6BZX5ihOsV1Ed1Z+OGtU1gNgnGWXJssaGhk6mn/AtaLGEB
	b28mF4hRy6BvDER2BCCXDYZFoF1Ev6sJTRlcBoww85YGZCx10TEZ1XFde5vvOUe/Bj01xikBY5C0d
	1U4puomw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8ym7-0000000DUlQ-1pzb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 11:35:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D1101576;
	Tue, 22 Sep 2026 04:34:56 -0700 (PDT)
Received: from [10.0.152.207] (e121487-lin.cambridge.arm.com [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFA753F528;
	Tue, 22 Sep 2026 04:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790076900; bh=SZsdbKDx8p+gX/Wtd2BIwez5gwBCQ+Mu14yhe7AlHyM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=th5AFxDViFq/9IzX8oexX7KddC5uoMDi4ETkffA8MhOSC2EHIGuQH11Ikdr5sQIP5
	 FkBTpG/4KB4iALAl+z+VnI7tttT1kACeyCWYw+nYbTH/ci3RtmZvXOHVVqruCB3RDh
	 4yQ2zG8CGIbCY/5rlOM6x2AK5wb9UfkbieBKbmnw=
Message-ID: <ac89b76e-90d0-4372-b95c-f1f11097c510@arm.com>
Date: Tue, 22 Sep 2026 12:34:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: alternative: Remove 'cfg' parameter
To: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
 will@kernel.org
References: <20260902113232.314831-1-mark.rutland@arm.com>
 <20260902113232.314831-3-mark.rutland@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260902113232.314831-3-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_123503_988299_BC5BF8A1 
X-CRM114-Status: GOOD (  17.94  )
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

On 9/2/26 12:32, Mark Rutland wrote:
> There are no remaining users of the 'cfg' parameter for alternative
> sequences.
> 
> Remove support for the 'cfg' parameter. In general, it's better to use
> explicit ifdeffery or IS_ENABLED() checks.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/alternative-macros.h | 30 +++++++--------------
>  1 file changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/alternative-macros.h b/arch/arm64/include/asm/alternative-macros.h
> index 8624166248528..ee75a2f1a575f 100644
> --- a/arch/arm64/include/asm/alternative-macros.h
> +++ b/arch/arm64/include/asm/alternative-macros.h
> @@ -53,8 +53,7 @@
>   *
>   * Alternatives with callbacks do not generate replacement instructions.
>   */
> -#define __ALTERNATIVE_CFG(oldinstr, newinstr, cpucap, cfg_enabled)	\
> -	".if "__stringify(cfg_enabled)" == 1\n"				\
> +#define __ALTERNATIVE(oldinstr, newinstr, cpucap)			\
>  	"661:\n\t"							\
>  	oldinstr "\n"							\
>  	"662:\n"							\
> @@ -68,10 +67,8 @@
>  	".org	. - (664b-663b) + (662b-661b)\n\t"			\
>  	".org	. - (662b-661b) + (664b-663b)\n\t"			\
>  	".previous\n"							\
> -	".endif\n"
>  
> -#define __ALTERNATIVE_CFG_CB(oldinstr, cpucap, cfg_enabled, cb)	\
> -	".if "__stringify(cfg_enabled)" == 1\n"				\
> +#define __ALTERNATIVE_CB(oldinstr, cpucap, cb)				\
>  	"661:\n\t"							\
>  	oldinstr "\n"							\
>  	"662:\n"							\
> @@ -80,13 +77,12 @@
>  	".popsection\n"							\
>  	"663:\n\t"							\
>  	"664:\n\t"							\
> -	".endif\n"
>  
> -#define _ALTERNATIVE_CFG(oldinstr, newinstr, cpucap, cfg, ...)	\
> -	__ALTERNATIVE_CFG(oldinstr, newinstr, cpucap, IS_ENABLED(cfg))
> +#define _ALTERNATIVE(oldinstr, newinstr, cpucap)			\
> +	__ALTERNATIVE(oldinstr, newinstr, cpucap)
>  
>  #define ALTERNATIVE_CB(oldinstr, cpucap, cb) \
> -	__ALTERNATIVE_CFG_CB(oldinstr, (1 << ARM64_CB_SHIFT) | (cpucap), 1, cb)
> +	__ALTERNATIVE_CB(oldinstr, (1 << ARM64_CB_SHIFT) | (cpucap), cb)
>  #else
>  
>  #include <asm/assembler.h>
> @@ -99,8 +95,7 @@
>  	.byte \alt_len
>  .endm
>  
> -.macro alternative_insn insn1, insn2, cap, enable = 1
> -	.if \enable
> +.macro alternative_insn insn1, insn2, cap
>  661:	\insn1
>  662:	.pushsection .altinstructions, "a"
>  	altinstruction_entry 661b, 663f, \cap, 662b-661b, 664f-663f
> @@ -110,7 +105,6 @@
>  664:	.org	. - (664b-663b) + (662b-661b)
>  	.org	. - (662b-661b) + (664b-663b)
>  	.previous
> -	.endif
>  .endm
>  
>  /*
> @@ -204,20 +198,16 @@ alternative_else
>  alternative_endif
>  .endm
>  
> -#define _ALTERNATIVE_CFG(insn1, insn2, cap, cfg, ...)	\
> -	alternative_insn insn1, insn2, cap, IS_ENABLED(cfg)
> +#define _ALTERNATIVE(insn1, insn2, cap)	\
> +	alternative_insn insn1, insn2, cap
>  
>  #endif  /*  __ASSEMBLER__  */
>  
>  /*
>   * Usage: asm(ALTERNATIVE(oldinstr, newinstr, cpucap));
> - *
> - * Usage: asm(ALTERNATIVE(oldinstr, newinstr, cpucap, CONFIG_FOO));
> - * N.B. If CONFIG_FOO is specified, but not selected, the whole block
> - *      will be omitted, including oldinstr.
>   */
> -#define ALTERNATIVE(oldinstr, newinstr, ...)   \
> -	_ALTERNATIVE_CFG(oldinstr, newinstr, __VA_ARGS__, 1)
> +#define ALTERNATIVE(oldinstr, newinstr, cpucap)   \
> +	_ALTERNATIVE(oldinstr, newinstr, cpucap)
>  
>  #ifndef __ASSEMBLER__
>  
> -- 2.30.2
> 

Digging through the history, it looks like the only users of cfg
used to be PAN and UAO (modulo MTE from the previous patch),
which are either gone (UAO) or have become unconditional (PAN).

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


