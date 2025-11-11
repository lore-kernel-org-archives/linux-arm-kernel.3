Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606BDCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 10:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=se9+XFWvJRMf+im71/JM9TILIfiygsPhAaFbNEpkdgE=; b=gzfRCghxMvUCz7o3h+PrTOhNQM
	Ojcxl7MX2SqO2TbIOSTpO53Lq0yiOfV6/1bAdx84rRNGlIuI0NW7u/16penRb0anl4Ol3a3q7aNwt
	SW3e/tgywyD4GWGsOF87N19ZllSfl+G0PlmJdu9lzxe5FQdgv57gOhuc9ogCIf+oAvOWq1cuSrjy+
	+4Hm8F+bBWllGbBh5CObQsGqc9gLL0GcAw2dtKSBqlTCcxIj5xakJafm1cMLZxHHr69KWjkLYQXSB
	8EwWwdrGrzkFjMnvcsEvnW8LfUTHW+spv7sWe5l5S8fcalfy6M5jdNVtHY+pCB96QPWJGRRtJm+65
	YPqJxvXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlaT-00000006wpc-1weJ;
	Tue, 11 Nov 2025 10:26:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlaP-00000006wp5-3pxt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 10:26:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECDF02F;
	Tue, 11 Nov 2025 02:26:42 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 923D63F63F;
	Tue, 11 Nov 2025 02:26:49 -0800 (PST)
Date: Tue, 11 Nov 2025 10:26:44 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, kprobes@vger.kernel.org,
	linux-kernel@vger.kernel.org, will@kernel.org,
	catalin.marinas@arm.com, masami.hiramatsu@linaro.org
Subject: Re: [PATCH] arm64: insn: Route BTI to simulate_nop to avoid XOL/SS
 at function entry
Message-ID: <aRMPZB6W04_l7iSB@J2N7QTR9R3>
References: <20251106104955.2089268-1-khaja.khaji@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251106104955.2089268-1-khaja.khaji@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_022654_064588_0E6BBD36 
X-CRM114-Status: GOOD (  24.61  )
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

On Thu, Nov 06, 2025 at 04:19:55PM +0530, Khaja Hussain Shaik Khaji wrote:
> On arm64 with branch protection, functions typically begin with a BTI
> (Branch Target Identification) landing pad. Today the decoder treats BTI
> as requiring out-of-line single-step (XOL), allocating a slot and placing
> an SS-BRK. Under SMP this leaves a small window before DAIF is masked
> where an asynchronous exception or nested probe can interleave and clear
> current_kprobe, resulting in an SS-BRK panic.

If you can take an exception here, and current_kprobe gets cleared, then
XOL stepping is broken in general, but just for BTI.

> Handle BTI like NOP in the decoder and simulate it (advance PC by one
> instruction). This avoids XOL/SS-BRK at these sites and removes the
> single-step window, while preserving correctness for kprobes since BTI’s
> branch-target enforcement has no program-visible effect in this EL1
> exception context.

One of the reasons for doing this out-of-line is that we should be able
to mark the XOL slot as a guarded page, and get the correct BTI
behaviour. It looks like we don't currently do that, which is a bug.

Just skipping the BTI isn't right; that throws away the BTI target
check.

> In practice BTI is most commonly observed at function entry, so the main
> effect of this change is to eliminate entry-site single-stepping. Other
> instructions and non-entry sites are unaffected.
> 
> Signed-off-by: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
> ---
>  arch/arm64/include/asm/insn.h            | 5 -----
>  arch/arm64/kernel/probes/decode-insn.c   | 9 ++++++---
>  arch/arm64/kernel/probes/simulate-insn.c | 1 +
>  3 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
> index 18c7811774d3..7e80cc1f0c3d 100644
> --- a/arch/arm64/include/asm/insn.h
> +++ b/arch/arm64/include/asm/insn.h
> @@ -452,11 +452,6 @@ static __always_inline bool aarch64_insn_is_steppable_hint(u32 insn)
>  	case AARCH64_INSN_HINT_PACIASP:
>  	case AARCH64_INSN_HINT_PACIBZ:
>  	case AARCH64_INSN_HINT_PACIBSP:
> -	case AARCH64_INSN_HINT_BTI:
> -	case AARCH64_INSN_HINT_BTIC:
> -	case AARCH64_INSN_HINT_BTIJ:
> -	case AARCH64_INSN_HINT_BTIJC:
> -	case AARCH64_INSN_HINT_NOP:
>  		return true;
>  	default:
>  		return false;
> diff --git a/arch/arm64/kernel/probes/decode-insn.c b/arch/arm64/kernel/probes/decode-insn.c
> index 6438bf62e753..7ce2cf5e21d3 100644
> --- a/arch/arm64/kernel/probes/decode-insn.c
> +++ b/arch/arm64/kernel/probes/decode-insn.c
> @@ -79,10 +79,13 @@ enum probe_insn __kprobes
>  arm_probe_decode_insn(u32 insn, struct arch_probe_insn *api)
>  {
>  	/*
> -	 * While 'nop' instruction can execute in the out-of-line slot,
> -	 * simulating them in breakpoint handling offers better performance.
> +	 * NOP and BTI (Branch Target Identification) have no program‑visible side
> +	 * effects for kprobes purposes. Simulate them to avoid XOL/SS‑BRK and the
> +	 * small single‑step window. BTI’s branch‑target enforcement semantics are
> +	 * irrelevant in this EL1 kprobe context, so advancing PC by one insn is
> +	 * sufficient here.
>  	 */
> -	if (aarch64_insn_is_nop(insn)) {
> +	if (aarch64_insn_is_nop(insn) || aarch64_insn_is_bti(insn)) {
>  		api->handler = simulate_nop;
>  		return INSN_GOOD_NO_SLOT;
>  	}

I'm not necessarily opposed to emulating the BTI, but:

(a) The BTI should not be emulated as a NOP. I am not keen on simulating
    the BTI exception in software, and would strongly prefer that's
    handled by HW (e.g. in the XOL slot).

(b) As above, it sounds like this is bodging around a more general
    problem. We must solve that more general problem.

> diff --git a/arch/arm64/kernel/probes/simulate-insn.c b/arch/arm64/kernel/probes/simulate-insn.c
> index 4c6d2d712fbd..b83312cb70ba 100644
> --- a/arch/arm64/kernel/probes/simulate-insn.c
> +++ b/arch/arm64/kernel/probes/simulate-insn.c
> @@ -200,5 +200,6 @@ simulate_ldrsw_literal(u32 opcode, long addr, struct pt_regs *regs)
>  void __kprobes
>  simulate_nop(u32 opcode, long addr, struct pt_regs *regs)
>  {
> +	/* Also used as BTI simulator: both just advance PC by one insn. */
>  	arm64_skip_faulting_instruction(regs, AARCH64_INSN_SIZE);
>  }

This comment should go.

Mark.

