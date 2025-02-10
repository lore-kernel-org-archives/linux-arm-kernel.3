Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D43C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsHZWnV2vY+9DykA3VXGPmTxG/x4T2YiMl6GDGVUd0Y=; b=YgaW/D0LbYjgT2SDo15yWijuRf
	fEQSO30s6ye0i4U1GR5B/CHeS2QPGY1tUtm5rcdbkH+st7YHarnLsq5k/ulJ4twVcFxHDUTyeSBO1
	4ITo+TXKMoOxcJxXE7nIvhISSbtijy5fjKVgFQbYtgebGSXqXxGeWgnTigf+BSxHNxKnTA1qBOSEV
	iSO/BY6Id33HK85Odg7ii+60pTIJNj/ZZ9t0s7sRSWJ193oPXEWZreZqgpmuyuhOkUHt21YtttGm5
	3gooplhKCO7QSUH9BwCaysKIjZD7l4+3/qAEWW7V8Vq7PkScz0Hp6ilODCqZYfhG5egGe0v5SROhi
	j7DjAbVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZYO-000000016Q2-0LKV;
	Mon, 10 Feb 2025 19:34:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thXTw-00000000hgK-3UjX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 17:22:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA1731477;
	Mon, 10 Feb 2025 09:22:25 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBB193F58B;
	Mon, 10 Feb 2025 09:22:01 -0800 (PST)
Date: Mon, 10 Feb 2025 17:21:59 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, eauger@redhat.com, eric.auger@redhat.com,
	fweimer@redhat.com, jeremy.linton@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, pbonzini@redhat.com, stable@vger.kernel.org,
	tabba@google.com, wilco.dijkstra@arm.com
Subject: Re: [PATCH v2 8/8] KVM: arm64: Eagerly switch ZCR_EL{1,2}
Message-ID: <Z6o1t7ys2qVaZ-7n@J2N7QTR9R3>
References: <20250206141102.954688-1-mark.rutland@arm.com>
 <20250206141102.954688-9-mark.rutland@arm.com>
 <20250210165325.GI7568@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210165325.GI7568@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_092204_961993_301B9541 
X-CRM114-Status: GOOD (  25.19  )
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

On Mon, Feb 10, 2025 at 04:53:27PM +0000, Will Deacon wrote:
> On Thu, Feb 06, 2025 at 02:11:02PM +0000, Mark Rutland wrote:
> > Fix this and make this a bit easier to reason about by always eagerly
> > switching ZCR_EL{1,2} at hyp during guest<->host transitions. With this
> > happening, there's no need to trap host SVE usage, and the nVHE/nVHVE
> 
> nit: nVHVE?
> 
> (also, note to Fuad: I think we're trapping FPSIMD/SVE from the host with
>  pKVM in Android, so we'll want to fix that when we take this patch via
>  -stable)
> 
> > __deactivate_cptr_traps() logic can be simplified enable host access to
> 
> nit: to enable
> 
> > all present FPSIMD/SVE/SME features.
> > 
> > In protected nVHE/hVHVE modes, the host's state is always saved/restored
> 
> nit: hVHVE
> 
> (something tells me these acronyms aren't particularly friendly!)

Aargh, sorry about those -- I've fixed those up and I'll give the series
another once-over.

[...]

> > +static inline void fpsimd_lazy_switch_to_guest(struct kvm_vcpu *vcpu)
> > +{
> > +	u64 zcr_el1, zcr_el2;
> > +
> > +	if (!guest_owns_fp_regs())
> > +		return;
> > +
> > +	if (vcpu_has_sve(vcpu)) {
> > +		/* A guest hypervisor may restrict the effective max VL. */
> > +		if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu))
> > +			zcr_el2 = __vcpu_sys_reg(vcpu, ZCR_EL2);
> > +		else
> > +			zcr_el2 = vcpu_sve_max_vq(vcpu) - 1;
> > +
> > +		write_sysreg_el2(zcr_el2, SYS_ZCR);
> > +
> > +		zcr_el1 = __vcpu_sys_reg(vcpu, vcpu_sve_zcr_elx(vcpu));
> > +		write_sysreg_el1(zcr_el1, SYS_ZCR);
> > +	}
> > +}
> > +
> > +static inline void fpsimd_lazy_switch_to_host(struct kvm_vcpu *vcpu)
> > +{
> > +	u64 zcr_el1, zcr_el2;
> > +
> > +	if (!guest_owns_fp_regs())
> > +		return;
> > +
> > +	if (vcpu_has_sve(vcpu)) {
> > +		zcr_el1 = read_sysreg_el1(SYS_ZCR);
> > +		__vcpu_sys_reg(vcpu, vcpu_sve_zcr_elx(vcpu)) = zcr_el1;
> > +
> > +		/*
> > +		 * The guest's state is always saved using the guest's max VL.
> > +		 * Ensure that the host has the guest's max VL active such that
> > +		 * the host can save the guest's state lazily, but don't
> > +		 * artificially restrict the host to the guest's max VL.
> > +		 */
> > +		if (has_vhe()) {
> > +			zcr_el2 = vcpu_sve_max_vq(vcpu) - 1;
> > +			write_sysreg_el2(zcr_el2, SYS_ZCR);
> > +		} else {
> > +			zcr_el2 = sve_vq_from_vl(kvm_host_sve_max_vl) - 1;
> > +			write_sysreg_el2(zcr_el2, SYS_ZCR);
> > +
> > +			zcr_el1 = vcpu_sve_max_vq(vcpu) - 1;
> > +			write_sysreg_el1(zcr_el1, SYS_ZCR);
> 
> Do we need an ISB before this to make sure that the CPTR traps have been
> deactivated properly?

Sorry, I had meant to add a comment here that this relies upon a
subtlety that avoids the need for the ISB.

When the guest owns the FP regs here, we know:

* If the guest doesn't have SVE, then we're not poking anything, and so
  no ISB is necessary.

* If the guest has SVE, then either:

  - The guest owned the FP regs when it was entered.

  - The guest *didn't* own the FP regs when it was entered, but acquired
    ownership via a trap which executed kvm_hyp_handle_fpsimd().

  ... and in either case, *after* disabling the traps there's been an
  ERET to the guest and an exception back to hyp, either of which
  provides the necessary context synchronization such that the traps are
  disabled here.

Does that make sense to you?

Mark.

