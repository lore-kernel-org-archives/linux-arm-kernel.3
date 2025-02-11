Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633A8C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 19:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWdL8bxL4dwo4St94DUC8vS2v2Io1xOQVPeaWbL9hwg=; b=ToVZ+FFFv623NpUjGIbAOp7TN9
	/phUl81ua10BQkdL7tbH1zMaPmcacNbxKSu0FKv40f0m2vW0k7MZaExNN8sMZyIYl/J8muygnc6Wc
	vWf8dJ19p4AyD0O7XvvAHfmgAuoECa62UmmJBFrVGBalYL83PKgBT2aEQui9Xv6ND9ur9Iyb6Z8pZ
	cp6eApT2yFRMsxSvydkudcSKll7VuKEpcKYDpv1zaf/MVaEAS0W4wM4UzrmBBabBlDII4geyZuN5S
	SF1l5KBe3dxNlBxCDMwuru3EfpgGCPY0VwT5vuSeMlr+xUXIL9Lq4nHlzQc+oGTVz8NdGyr+boj6r
	t+0wwX9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvdp-00000004xSr-3XcS;
	Tue, 11 Feb 2025 19:09:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvcQ-00000004xNU-1Qi6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 19:08:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 149FE13D5;
	Tue, 11 Feb 2025 11:08:47 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE6023F58B;
	Tue, 11 Feb 2025 11:08:23 -0800 (PST)
Date: Tue, 11 Feb 2025 19:08:15 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, eauger@redhat.com, eric.auger@redhat.com,
	fweimer@redhat.com, jeremy.linton@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, pbonzini@redhat.com, stable@vger.kernel.org,
	tabba@google.com, wilco.dijkstra@arm.com
Subject: Re: [PATCH v2 2/8] KVM: arm64: Remove host FPSIMD saving for
 non-protected KVM
Message-ID: <Z6ugHxri_XlOMKWD@J2N7QTR9R3>
References: <20250206141102.954688-1-mark.rutland@arm.com>
 <20250206141102.954688-3-mark.rutland@arm.com>
 <20250210161242.GC7568@willie-the-truck>
 <Z6owjEPNaJ55e9LM@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6owjEPNaJ55e9LM@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_110826_472575_56FCE343 
X-CRM114-Status: GOOD (  22.46  )
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

On Mon, Feb 10, 2025 at 05:00:04PM +0000, Mark Rutland wrote:
> | static inline bool kvm_hyp_handle_fpsimd(struct kvm_vcpu *vcpu, u64 *exit_code)
> | {
> | 	...
> | 
> | 	/* Valid trap */
> | 
> | 	/*
> | 	 * Enable everything EL2 might need to save/restore state.
> | 	 * Maybe each of the bits should depend on system_has_xxx()
> | 	 */
> | 	cpacr_clear_set(0, CPACR_EL1_FPEN | CPACR_EL1_ZEN | CPACR_EL1_SMEN */
> | 	isb();
> | 
> | 	...
> | 
> | 	/* Write out the host state if it's in the registers */
> | 	if (is_protected_kvm_enabled() && host_owns_fp_regs())
> | 		kvm_hyp_save_fpsimd_host(vcpu);
> | 	
> | 	/* Restore guest state */
> | 
> | 	...
> | 
> | 	/*
> | 	 * Enable traps for the VCPU. The ERET will cause the traps to
> | 	 * take effect in the guest, so no ISB is necessary.
> | 	 */
> | 	cpacr_guest = CPACR_EL1_FPEN;
> | 	if (vcpu_has_sve(vcpu))
> | 		cpacr_guest |= CPACR_EL1_ZEN;
> | 	if (vcpu_has_sme(vcpu))			// whenever we add this
> | 		cpacr_guest |= CPACR_EL1_SMEN;
> | 	cpacr_clear_set(CPACR_EL1_FPEN | CPACR_EL1_ZEN | CPACR_EL1_SMEN,
> | 			cpacr_guest);
> | 
> | 	return true;
> | }
> 
> ... where we'd still have the CPACR write to re-enable traps, but it'd
> be unconditional, and wouldn't need an extra ISB.

I had a quick go at this, and there are a few things that I spotted that
got in the way, so I'm not going to spin that immediately, but I'd be
happy to in a short while. Notes below:

(1) I looked at using __activate_cptr_traps() and
    __deactivate_cptr_traps() rather than poking CPACR/CPTR directly,
    to ensure that this is kept in-sync with the regular guest<->host
    transitions, but that requires a bit of refactoring (e.g. moving
    those *back* into the common header), and potentially requires doing
    a bit of redundant work here, so I'm not sure whether that's
    actually preferable or not.

    If you have a strong preference either way as to doing that or
    poking CPACR/CPTR directly, knowing that would be helfpul.

(2) The cpacr_clear_set() function doesn't behave the same as
    sysreg_clear_set(), and doesn't handle the case where a field is in
    both the 'clr' and 'set' masks as is the case above. For example, if
    one writes the following to clear THEN set the FPEN field, disabling
    traps:

    | cpacr_clear_set(CPACR_EL1_FPEN, CPACR_EL1_FPEN);

    ... the VHE code looks good:

    | mrs     x0, cpacr_el1
    | orr     x1, x0, #0x300000		// set both FPEN bits
    | cmp     x0, x1
    | b.eq    <<skip_write>>
    | msr     cpacr_el1, x1

    ... but the nVHE code does the opposite:

    | mrs     x0, cptr_el2
    | orr     x1, x0, #0x400		// set TFP
    | tbnz    w0, #10, <<skip_write>>
    | msr     cptr_el2, x1

    Luckily this does the right thing for all existing users, but that'd
    need to be cleaned up.

(3) We should be able to get rid of the ISB when writing to FPEXC32_EL2.
    That register has no effect while in AArch64 state, and the ERET
    will synchronize it before AArch32 guest code can be executed.

    That should probably be factored out into save/restore functions
    that are used consistently.

Mark.

