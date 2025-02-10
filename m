Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3736CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 17:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFbtJA24umNAhTF4o3Hlp4XI77yResh+ejXBIzm2ZnY=; b=L6ppvCwyXjdSPZQ7ZB2Dk1QHPr
	Iw/DgVxhvZuj12uZmhQHHuZAzABjw8BSwFsdAzLc7Rl2F28t2ZqLncXN+BO/R6Gb7fxgC/AgKnVqr
	Gl2g0bpqtdpGVbV61OaUm9bX4E7RT/2RjSazRO0z1aJVCgaYKZJP9cFfh5EKzMZE6ljtcrGCD8/N3
	Zm70HuBh668t+K4TQx8+jGRazx2jUEuUw02WLCwiUq03lamBP0h86DEwX7w8Vt/6FGwkKPvJ0fh2V
	Rrk7570YWfNGfYr1usYuL4N2xgLMvp3zlxn5tvSWcwin2kucthrZn3feKLtr6p0iDts8F6ydj2Si0
	a6S60Dlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thXS4-00000000hAv-1X3B;
	Mon, 10 Feb 2025 17:20:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thX8g-00000000coh-3Rjr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 17:00:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 390341477;
	Mon, 10 Feb 2025 09:00:26 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AEED3F58B;
	Mon, 10 Feb 2025 09:00:02 -0800 (PST)
Date: Mon, 10 Feb 2025 16:59:56 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, eauger@redhat.com, eric.auger@redhat.com,
	fweimer@redhat.com, jeremy.linton@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, pbonzini@redhat.com, stable@vger.kernel.org,
	tabba@google.com, wilco.dijkstra@arm.com
Subject: Re: [PATCH v2 2/8] KVM: arm64: Remove host FPSIMD saving for
 non-protected KVM
Message-ID: <Z6owjEPNaJ55e9LM@J2N7QTR9R3>
References: <20250206141102.954688-1-mark.rutland@arm.com>
 <20250206141102.954688-3-mark.rutland@arm.com>
 <20250210161242.GC7568@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210161242.GC7568@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_090006_952036_9F49FCB3 
X-CRM114-Status: GOOD (  33.01  )
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

On Mon, Feb 10, 2025 at 04:12:43PM +0000, Will Deacon wrote:
> On Thu, Feb 06, 2025 at 02:10:56PM +0000, Mark Rutland wrote:
> > Now that the host eagerly saves its own FPSIMD/SVE/SME state,
> > non-protected KVM never needs to save the host FPSIMD/SVE/SME state,
> > and the code to do this is never used. Protected KVM still needs to
> > save/restore the host FPSIMD/SVE state to avoid leaking guest state to
> > the host (and to avoid revealing to the host whether the guest used
> > FPSIMD/SVE/SME), and that code needs to be retained.
> > 
> > Remove the unused code and data structures.
> > 
> > To avoid the need for a stub copy of kvm_hyp_save_fpsimd_host() in the
> > VHE hyp code, the nVHE/hVHE version is moved into the shared switch
> > header, where it is only invoked when KVM is in protected mode.
> > 
> > Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> > Reviewed-by: Mark Brown <broonie@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Fuad Tabba <tabba@google.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Oliver Upton <oliver.upton@linux.dev>
> > Cc: Will Deacon <will@kernel.org>
> > ---
> >  arch/arm64/include/asm/kvm_host.h       | 20 +++++-------------
> >  arch/arm64/kvm/arm.c                    |  8 -------
> >  arch/arm64/kvm/fpsimd.c                 |  2 --
> >  arch/arm64/kvm/hyp/include/hyp/switch.h | 25 ++++++++++++++++++++--
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  2 +-
> >  arch/arm64/kvm/hyp/nvhe/switch.c        | 28 -------------------------
> >  arch/arm64/kvm/hyp/vhe/switch.c         |  8 -------
> >  7 files changed, 29 insertions(+), 64 deletions(-)
> 
> [...]
> 
> > diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> > index f838a45665f26..c5b8a11ac4f50 100644
> > --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> > +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> > @@ -375,7 +375,28 @@ static inline void __hyp_sve_save_host(void)
> >  			 true);
> >  }
> >  
> > -static void kvm_hyp_save_fpsimd_host(struct kvm_vcpu *vcpu);
> > +static void kvm_hyp_save_fpsimd_host(struct kvm_vcpu *vcpu)
> > +{
> > +	/*
> > +	 * Non-protected kvm relies on the host restoring its sve state.
> > +	 * Protected kvm restores the host's sve state as not to reveal that
> > +	 * fpsimd was used by a guest nor leak upper sve bits.
> > +	 */
> > +	if (system_supports_sve()) {
> > +		__hyp_sve_save_host();
> > +
> > +		/* Re-enable SVE traps if not supported for the guest vcpu. */
> > +		if (!vcpu_has_sve(vcpu))
> > +			cpacr_clear_set(CPACR_EL1_ZEN, 0);
> > +
> > +	} else {
> > +		__fpsimd_save_state(host_data_ptr(host_ctxt.fp_regs));
> > +	}
> > +
> > +	if (kvm_has_fpmr(kern_hyp_va(vcpu->kvm)))
> > +		*host_data_ptr(fpmr) = read_sysreg_s(SYS_FPMR);
> > +}
> > +
> >  
> >  /*
> >   * We trap the first access to the FP/SIMD to save the host context and
> > @@ -425,7 +446,7 @@ static bool kvm_hyp_handle_fpsimd(struct kvm_vcpu *vcpu, u64 *exit_code)
> >  	isb();
> >  
> >  	/* Write out the host state if it's in the registers */
> > -	if (host_owns_fp_regs())
> > +	if (is_protected_kvm_enabled() && host_owns_fp_regs())
> >  		kvm_hyp_save_fpsimd_host(vcpu);
> 
> I wondered briefly whether this would allow us to clean up the CPACR
> handling a little and avoid the conditional SVE trap re-enabling inside
> kvm_hyp_save_fpsimd_host() but I couldn't come up with a clean way to
> do it without an additional ISB. Hrm.
> 
> Anyway, as far as the patch goes:
> 
> Acked-by: Will Deacon <will@kernel.org>

Thanks!

FWIW, I'd also considered that, and I'd concluded that if anything we
could do a subsequent simplification by pulling that out of
kvm_hyp_save_fpsimd_host() and have kvm_hyp_handle_fpsimd() do something
like:

| static inline bool kvm_hyp_handle_fpsimd(struct kvm_vcpu *vcpu, u64 *exit_code)
| {
| 	...
| 
| 	/* Valid trap */
| 
| 	/*
| 	 * Enable everything EL2 might need to save/restore state.
| 	 * Maybe each of the bits should depend on system_has_xxx()
| 	 */
| 	cpacr_clear_set(0, CPACR_EL1_FPEN | CPACR_EL1_ZEN | CPACR_EL1_SMEN */
| 	isb();
| 
| 	...
| 
| 	/* Write out the host state if it's in the registers */
| 	if (is_protected_kvm_enabled() && host_owns_fp_regs())
| 		kvm_hyp_save_fpsimd_host(vcpu);
| 	
| 	/* Restore guest state */
| 
| 	...
| 
| 	/*
| 	 * Enable traps for the VCPU. The ERET will cause the traps to
| 	 * take effect in the guest, so no ISB is necessary.
| 	 */
| 	cpacr_guest = CPACR_EL1_FPEN;
| 	if (vcpu_has_sve(vcpu))
| 		cpacr_guest |= CPACR_EL1_ZEN;
| 	if (vcpu_has_sme(vcpu))			// whenever we add this
| 		cpacr_guest |= CPACR_EL1_SMEN;
| 	cpacr_clear_set(CPACR_EL1_FPEN | CPACR_EL1_ZEN | CPACR_EL1_SMEN,
| 			cpacr_guest);
| 
| 	return true;
| }

... where we'd still have the CPACR write to re-enable traps, but it'd
be unconditional, and wouldn't need an extra ISB.

If that makes sense to you, I can go spin that as a subsequent cleanup
atop this series.

Mark.

