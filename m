Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E9CCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 13:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NmXVEzQXcxUuQnQm+IdRPBf6IZejdGlyY+jQVAdGvSs=; b=q4/DuJNjEhBRZY3WL76hT/KHaG
	9jdtKrgxcv7LmP1hDLlDrp714Ruax78VEFAAUwaqNYUJm6TqEz4sF2oFYWiS9zv8b6RW0f1g+82OK
	uEwetffGl8S53hI18vRS8ZhN1lbj3sxngd1HPYJPXHmtmwPXpIVkUaSKDYrZi5bdIRgeQFa2MqIL/
	gQP/FoBaLcQsL8CgcFhjG4DOX6Vc4KlxytbchDRYsAaLJTZyo65vcVW9pMIwYmJrncdGGcWY/7Jwi
	4Yf6Ed6M5Y/5ngIxcQfYLDdMapg+o0y/k2GGedDTNwAJE7z9MPCNwPg+TIYIgsNaENPzbPRSy9vEC
	3FsqE+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6qG3-00000006AJY-2ceD;
	Thu, 09 Oct 2025 13:00:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6qG0-00000006AI9-0uaQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 13:00:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EF59176A;
	Thu,  9 Oct 2025 06:00:21 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8E423F59E;
	Thu,  9 Oct 2025 06:00:27 -0700 (PDT)
Date: Thu, 9 Oct 2025 14:00:22 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jan Kotas <jank@cadence.com>
Subject: Re: [PATCH] arm64: Revamp HCR_EL2.E2H RES1 detection
Message-ID: <aOex5rmMU5Q-vvss@J2N7QTR9R3>
References: <20251009121239.29370-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009121239.29370-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_060032_383407_D438F4DA 
X-CRM114-Status: GOOD (  32.49  )
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

On Thu, Oct 09, 2025 at 01:12:39PM +0100, Marc Zyngier wrote:
> We currently have two ways to identify CPUs that only implement FEAT_VHE
> and not FEAT_E2H0:
> 
> - either they advertise it via ID_AA64MMFR4_EL1.E2H0,
> - or the HCR_EL2.E2H bit is RAO/WI
> 
> However, there is a third category of "cpus" that fall between these
> two cases: on CPUs that do not implement FEAT_FGT, it is IMPDEF whether
> an access to ID_AA64MMFR4_EL1 can trap to EL2 when the register value
> is zero.
> 
> A consequence of this is that on systems such as Neoverse V2, a NV
> guest cannot reliably detect that it is in a VHE-only configuration
> (E2H is writable, and ID_AA64MMFR0_EL1 is 0), despite the hypervisor's
> best effort to repaint the id register.
> 
> Replace the RAO/WI test by a sequence that makes use of the VHE
> register remnapping between EL1 and EL2 to detect this situation,
> and work out whether we get the VHE behaviour even after having
> set HCR_EL2.E2H to 0.
> 
> This solves the NV problem, and provides a more reliable acid test
> for CPUs that do not completely follow the letter of the architecture
> while providing a RES1 behaviour for HCR_EL2.E2H.
> 
> Suggested-by: Marc Rutland <mark.rutland@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Link: https://lore.kernel.org/r/15A85F2B-1A0C-4FA7-9FE4-EEC2203CC09E@global.cadence.com
> ---
>  arch/arm64/include/asm/el2_setup.h | 30 ++++++++++++++++++++++++------
>  1 file changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index 46033027510cc..b7640e2c20503 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -24,22 +24,40 @@
>  	 * ID_AA64MMFR4_EL1.E2H0 < 0. On such CPUs HCR_EL2.E2H is RES1, but it
>  	 * can reset into an UNKNOWN state and might not read as 1 until it has
>  	 * been initialized explicitly.
> -	 *
> -	 * Fruity CPUs seem to have HCR_EL2.E2H set to RAO/WI, but
> -	 * don't advertise it (they predate this relaxation).
> -	 *
>  	 * Initalize HCR_EL2.E2H so that later code can rely upon HCR_EL2.E2H
>  	 * indicating whether the CPU is running in E2H mode.
>  	 */
>  	mrs_s	x1, SYS_ID_AA64MMFR4_EL1
>  	sbfx	x1, x1, #ID_AA64MMFR4_EL1_E2H0_SHIFT, #ID_AA64MMFR4_EL1_E2H0_WIDTH
>  	cmp	x1, #0
> -	b.ge	.LnVHE_\@
> +	b.lt	.LnE2H0_\@
>  

> +	/*
> +	 * Fruity CPUs seem to have HCR_EL2.E2H set to RAO/WI, but don't
> +	 * advertise it (they predate this relaxation). Check for an
> +	 * essential VHE property (system register remapping) to decide
> +	 * whether we're effectively VHE-only or not.
> +	 *
> +	 * This is also useful for for NV guests on CPUs that can't trap
> +	 * ID_AA64MMFR4_EL1 as they don't have FEAT_FGT.
> +	 */

Would you be happy to elaborate this comment to:

	/*
	 * Unfortunately, HCR_EL2.E2H can be RES1 even if not advertised
	 * as such via ID_AA64MMFR4_EL1.E2H0:
	 *
	 * - Fruity CPUs predate the !FEAT_E2H0 relaxation, and seem to
	 *   have HCR_EL2.E2H implemented as RAO/WI.
	 *
	 * - On CPUs that lack FEAT_FGT, a hypervisor can't trap guest
	 *   reads of ID_AA64MMFR4_EL1 to advertise !FEAT_E2H0. NV
	 *   guests on these hosts can write to HCR_EL2.E2H without
	 *   trapping to the hypervisor, but these writes have no
	 *   functional effect.
	 *
	 * Handle both cases by checking for an essential VHE property
	 * (system register remapping) to decide whether we're
	 * effectively VHE-only or not.
	 */

Other than that, this all looks good to me:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> +	msr_hcr_el2 x0		// Setup HCR_EL2 as nVHE
> +	isb
> +	mov	x1, #1		// Write something to FAR_EL1
> +	msr	far_el1, x1
> +	isb
> +	mov	x1, #2		// Try to overwrite it via FAR_EL2
> +	msr	far_el2, x1
> +	isb
> +	mrs	x1, far_el1	// If we see the latest write in FAR_EL1,
> +	cmp	x1, #2		// we can safely assume we are VHE only.
> +	b.ne	.LnVHE_\@	// Otherwise, we know that nVHE works.
> +
> +.LnE2H0_\@:
>  	orr	x0, x0, #HCR_E2H
> -.LnVHE_\@:
>  	msr_hcr_el2 x0
>  	isb
> +.LnVHE_\@:
>  .endm
>  
>  .macro __init_el2_sctlr
> -- 
> 2.47.3
> 
> 

