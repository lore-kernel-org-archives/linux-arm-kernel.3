Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F986C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0RinXTxGOPfZ73QJZSm0x8nGtVjIGPhN07CdD7KpuoQ=; b=iZMFSaylkGfSAz
	vn6aS6PN1c4haqxMkiYLk+TavhZ56XY5FhDi6oK2kVLwQMKAww/T1M92m250L+ucFCeVeJ92z4pLH
	Dkxd4gspEiENzGzGDFI3TjMWHqaXh61+Nd2VOS+Pvwlr2c8Ws0hZR5EYTji1CllDixHtR9B/Tp+9U
	0NPcOexvAghvvAlMegqBDfYRfffC7oZnIVckc/WDpTwi5e9IvKw/fDkEblBqeAt5w22Ef3XxiERqO
	l3d7Mp70wAj3YIVB/k5HuAs2sfXhJIj48eZYnADpd2Zw2ZRhCi7UQymMGQfDVbrxvWyAdpuJwL2kr
	pggBWzu5g+2DIeHQuByg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50Y7-0000000Ge50-34yn;
	Fri, 11 Sep 2026 12:40:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50Xz-0000000Ge4H-3vts
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 12:40:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E5811655;
	Fri, 11 Sep 2026 05:39:58 -0700 (PDT)
Received: from [10.0.152.207] (unknown [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7AD2E3F7B4;
	Fri, 11 Sep 2026 05:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789130402; bh=XWfFiVJQd8zBFFXzrkVrZmYAIrf55jggjdeH4rEAhZY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KN4FsSrfRC9lwmJZtigkSjR7gNXqFF7FANz0TzckKmWInMpvcvMo+pB8+yKgjAOqE
	 9jcCsLZvHxady43T6hGmNthEKXvu68EFA4buVRZTjGM4h/huoQiyLSsufd1/HBWBv+
	 5D8iTAJMOvJMNziV41314S8ON3oZP1/NHBc+F6uI=
Message-ID: <98386fb5-9545-446c-9681-746b9f7b8b49@arm.com>
Date: Fri, 11 Sep 2026 13:39:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/21] arm64: percpu: Factor out percpu offset asm
To: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20260908151741.394589-1-mark.rutland@arm.com>
 <20260908151741.394589-10-mark.rutland@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260908151741.394589-10-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_054004_354050_20ECE59E 
X-CRM114-Status: GOOD (  18.47  )
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
> Depending on whether the kernel runs at EL1 or EL2, the percpu offset is
> stored in either TPIDR_EL1 or TPIDR_EL2, and __kern_my_cpu_offset() uses
> an ALTERNATIVE() sequence to read the relevant TPIDR_ELx.
> 
> In subsequent patches we'll need to read the percpu offset in other
> assembly sequences. Factor the ALTERNATIVE sequence out of
> __kern_my_cpu_offset() into a new __KERN_ASM_CPU_OFFSET() macro so that
> we can share the code sequence.
> 
> There should be no functional change as a result of this patch.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/include/asm/percpu.h | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> index 8cf4068ce1b56..746d2a56f48bb 100644
> --- a/arch/arm64/include/asm/percpu.h
> +++ b/arch/arm64/include/asm/percpu.h
> @@ -29,6 +29,11 @@ static inline unsigned long __hyp_my_cpu_offset(void)
>  	return read_sysreg(tpidr_el2);
>  }
>  
> +#define __KERN_ASM_CPU_OFFSET(dst)					\
> +	ALTERNATIVE("mrs " dst ", tpidr_el1",				\
> +		    "mrs " dst ", tpidr_el2",				\
> +		       ARM64_HAS_VIRT_HOST_EXTN)
> +
>  static inline unsigned long __kern_my_cpu_offset(void)
>  {
>  	unsigned long off;
> @@ -37,11 +42,11 @@ static inline unsigned long __kern_my_cpu_offset(void)
>  	 * We want to allow caching the value, so avoid using volatile and
>  	 * instead use a fake stack read to hazard against barrier().
>  	 */
> -	asm(ALTERNATIVE("mrs %0, tpidr_el1",
> -			"mrs %0, tpidr_el2",
> -			ARM64_HAS_VIRT_HOST_EXTN)
> -		: "=r" (off) :
> -		"Q" (*(const unsigned long *)current_stack_pointer));
> +	asm(
> +	__KERN_ASM_CPU_OFFSET("%0")
> +	: "=r" (off)
> +	: "Q" (*(const unsigned long *)current_stack_pointer)
> +	);

Tiny tiny nitpick: named operand, say, [dst] would read nicer :) 
No need to resin just for that. FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


>  
>  	return off;
>  }
> -- 2.30.2
> 


