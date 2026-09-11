Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38739C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MpoL6uXTw+SZCeXvkjzFLTMX5iE7pkmJI/5n8jsejKE=; b=vD3AWXIS1UxN97
	21w5d2FYo0XBqHaIxGRS6EninSrGPGdlVdvs7Y9SoVysvBKLHpPbx+uIdvxNqmbBQVuIFED6Kzd/Q
	qi/5PRKdjIUMZrJ5ChVi1qbWaiYpP9kEedR4Z8XSprEVLPSWbqp162I1KZQ/7bgtw/EHM47Dgx69G
	6pkeAkIqHxME7t459kDTGpcrjhsDR410lL3EOP0whY5NVy5H7Uzd+bZVD+g44x9xtlsSJ1m/O3Sp5
	HCKiQquTB4cKdv2ZBePYp1g8ie3z9HnPUSD9DFWGghUACSiMqOjD4Q7s6SWWleKFLf9XMXIWmCukL
	3a5c/8qF5T5py7f4jFOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50f1-0000000Gfa0-1imX;
	Fri, 11 Sep 2026 12:47:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50et-0000000GfTc-16vg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 12:47:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D15F216A3;
	Fri, 11 Sep 2026 05:47:06 -0700 (PDT)
Received: from [10.0.152.207] (unknown [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBD8B3F7B4;
	Fri, 11 Sep 2026 05:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789130830; bh=id96Lk+HpLVgNjIVup4+7EebLweifTMRP/9y9m7oEJE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ias0IPMUgeA6nzUHI6Z5ZM7GoPxgPuUUUDADBiMCIR7EKtcam6ybraYlVw1V+Rql7
	 PrDiQI2k/4+OxCpOArrbzlnZOHhlFLx+Wm1Pmbs4fnuux4TVU8qyJ8lbbj0WzTsmuS
	 tmQKpXbkF7fs/1Kt2R8IsuaM5Nw09VVZxF0jywpQ=
Message-ID: <5760123e-6e18-4f7a-beb4-8179c0795c6d@arm.com>
Date: Fri, 11 Sep 2026 13:47:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/21] arm64: entry: sdei: Restore all clobberable GPRs
To: Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20260908151741.394589-1-mark.rutland@arm.com>
 <20260908151741.394589-13-mark.rutland@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260908151741.394589-13-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_054713_804880_50CAEB58 
X-CRM114-Status: GOOD (  15.67  )
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
> Currently __sdei_asm_handler() avoids restoring x20 to x27, as these are
> not be clobbered by existing code. This is correct today, but it makes
> it awkward to rework __sdei_asm_handler(). Given the rarity of SDEI
> events, restoring x20 to x27 should not have a measurable impact.
> 
> Restore x20 to x27 when returning from an SDEI event handler. This will
> free up those GPRs for usage in __sdei_asm_handler() prior to return.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
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
> ---
>  arch/arm64/kernel/entry.S | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index f63049ac32dc6..a6ec5c5a2d29c 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -1044,10 +1044,14 @@ SYM_CODE_START(__sdei_asm_handler)
>  	bl	__sdei_handler
>  
>  	msr	sp_el0, x28
> -	/* restore regs >x17 that we clobbered */
> +	/* restore regs >x17 that firmware won't restore */
>  	mov	x4, x19         // keep x4 for __sdei_asm_exit_trampoline
> -	ldp	x28, x29, [x4, #SDEI_EVENT_INTREGS + 16 * 14]
>  	ldp	x18, x19, [x4, #SDEI_EVENT_INTREGS + 16 * 9]
> +	ldp	x20, x21, [x4, #SDEI_EVENT_INTREGS + 16 * 10]
> +	ldp	x22, x23, [x4, #SDEI_EVENT_INTREGS + 16 * 11]
> +	ldp	x24, x25, [x4, #SDEI_EVENT_INTREGS + 16 * 12]
> +	ldp	x26, x27, [x4, #SDEI_EVENT_INTREGS + 16 * 13]
> +	ldp	x28, x29, [x4, #SDEI_EVENT_INTREGS + 16 * 14]
>  	ldp	lr, x1, [x4, #SDEI_EVENT_INTREGS + S_LR]
>  	mov	sp, x1
>  
> -- 2.30.2
> 

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


