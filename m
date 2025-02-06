Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F100BC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 10:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZg6wwh8xcXPdvLRYkuCKP4kUADz5CJ+ekvgu1I/GGU=; b=mpi3FSfXWSn1aSyyj3oxOmc6/X
	cqpD00RLECzsrGGdeGGyYRfRHtH6/31D1fqK1+vTFEILdNEd+92zj8bPPZiTgbmLv3YhMyb8HtRpj
	UhvztLNpQO7szI1Wng8AOUA1XDc7wfz8uLSAV9puWFM7bDEvHpnxWmPx8O8wvyjO4rKw1YWs4YqF1
	81DiExp3dT65R9kqmSubVWyd6A9Ob9jAgsXvWmysNG3fXs9LvMARxpZ2t/uQsfPDQortw/2xxf59o
	M4B/GC2q7F32l1afJWtOGCQv2+5N+fX3fwQeL1tK1qo0MoUf4AUQxZsOEDIiI2EWCH78ryEBletiw
	p08v2w8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfz96-00000005yXw-2ccR;
	Thu, 06 Feb 2025 10:30:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfz7h-00000005yPs-1DY2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:28:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7740112FC;
	Thu,  6 Feb 2025 02:29:03 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D961A3F63F;
	Thu,  6 Feb 2025 02:28:37 -0800 (PST)
Date: Thu, 6 Feb 2025 10:28:35 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, eauger@redhat.com, fweimer@redhat.com,
	jeremy.linton@arm.com, oliver.upton@linux.dev, pbonzini@redhat.com,
	stable@vger.kernel.org, tabba@google.com, wilco.dijkstra@arm.com,
	will@kernel.org
Subject: Re: [PATCH 8/8] KVM: arm64: Eagerly switch ZCR_EL{1,2}
Message-ID: <Z6SO0x-T4QRT31Y_@J2N7QTR9R3>
References: <20250204152100.705610-1-mark.rutland@arm.com>
 <20250204152100.705610-9-mark.rutland@arm.com>
 <861pwdvbd3.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <861pwdvbd3.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_022841_372165_5A767059 
X-CRM114-Status: GOOD (  14.58  )
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

On Tue, Feb 04, 2025 at 06:00:24PM +0000, Marc Zyngier wrote:
> On Tue, 04 Feb 2025 15:21:00 +0000,
> Mark Rutland <mark.rutland@arm.com> wrote:

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
> > +		sve_cond_update_zcr_vq(zcr_el2, SYS_ZCR_EL2);
> 
> Not a big deal, but I though I'd mention it here: Using ZCR_EL2 (or
> any other register using the _EL2 suffix) is a source of expensive
> traps with NV. We're much better off using the _EL1 accessor if we are
> running VHE, as this will involve no trap at all.
> 
> nVHE will of course trap, but using nVHE with SVE under NV is not
> something I'm prepared to give a damn about.

Ah, sorry. I had forgotten that wrinkle.

Given the compiler warnings reported by Mark Brown [1] and the kernel
test robot [2], I'll go spin a v2 with that cleaned up.

I'll use write_sysreg_el2() here, i.e.

	if (vcpu_has_sve(vcpu)) {
		/* A guest hypervisor may restrict the effective max VL. */
		if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu))
			zcr_el2 = __vcpu_sys_reg(vcpu, ZCR_EL2);
		else
			zcr_el2 = vcpu_sve_max_vq(vcpu) - 1;

		write_sysreg_el2(scr_el2, SYS_ZCR);
	}

That'll use the preferred alias automatically, and it matches the style
used to write to ZCR_EL{1,12} immediately after.

Likewise for the other instances.

Mark.

[1] https://lore.kernel.org/linux-arm-kernel/b76803b7-c1b3-426b-a375-0c01b98142c9@sirena.org.uk/
[2] https://lore.kernel.org/oe-kbuild-all/202502061341.FvsCMKEH-lkp@intel.com/

