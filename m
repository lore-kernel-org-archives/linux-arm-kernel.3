Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40211C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 18:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfyxTMni5BP5SV6CRH9ZSsPLHp0ae+0utnSwwkwnNb4=; b=QsCISIUIMbQRWOmzRdZG/ZZQFB
	sztEWzN+RUuu+9wCbMR9JfBaued4Fnw3DxTmA8VBJZxd65c9OYg3varRSeg2Ev5m0ycEgUuFWhlf/
	qw/RcNeeJfOUQLy+szDdvAHOOF86rXB22LHJp8MttX4WJFVDVk+gA7qJq3dsutUcYX5FK3grUDlzX
	E5sGwqpEGZa07tBu7LpBRD5RNjBR7pW/jw8NUCt9SvsLAqMdQ4mDjigiE1YrC6+M+3AtAB7CupBDR
	LTJWChcvs9BslwlGWdW+NnQ45UnuLaYndaKKCDP93kDeWqA4KSp0bonvECuD+OooXJDio7wOPTWDl
	lilQRy1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2wgM-0000000BWP3-2HfT;
	Thu, 10 Apr 2025 18:31:22 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vrh-0000000BPLV-29Ez
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 17:39:02 +0000
Date: Thu, 10 Apr 2025 10:38:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744306738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QfyxTMni5BP5SV6CRH9ZSsPLHp0ae+0utnSwwkwnNb4=;
	b=LDt7/ePOoEvVHqeF3YQCr3fzz5+8/MAM2x6Lp9fQ3J+IrDianiEFWgh50j2+FogFRss7wq
	tPcnmlcVDJGH5R7gHiRy0PD1pXByBUCIiYPc47fkmnUVY6HTpBLXdVVS2VB6fiSFW+DP0u
	/kUkVH9Sy///MAlSUr+bV6y9t3wrcM4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 1/6] KVM: arm64: Fix MDCR_EL2.HPMN reset value
Message-ID: <Z_gCLmb11eMYKFDv@linux.dev>
References: <20250409160106.6445-1-maz@kernel.org>
 <20250409160106.6445-2-maz@kernel.org>
 <Z_bWzRSgyom1_hvJ@linux.dev>
 <86ikncl20s.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ikncl20s.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_103901_690847_0E7FCF9D 
X-CRM114-Status: GOOD (  25.71  )
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

On Thu, Apr 10, 2025 at 11:54:59AM +0100, Marc Zyngier wrote:
> On Wed, 09 Apr 2025 21:21:33 +0100,
> Oliver Upton <oliver.upton@linux.dev> wrote:
> > 
> > On Wed, Apr 09, 2025 at 05:01:01PM +0100, Marc Zyngier wrote:
> > > The MDCR_EL2 documentation indicates that the HPMN field has
> > > the following behaviour:
> > > 
> > > "On a Warm reset, this field resets to the expression NUM_PMU_COUNTERS."
> > > 
> > > However, it appears we reset it to zero, which is not very useful.
> > > 
> > > Add a reset helper for MDCR_EL2, and handle the case where userspace
> > > changes the target PMU, which may force us to change HPMN again.
> > > 
> > > Reported-by: Joey Gouly <joey.gouly@arm.com>
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > ---
> > >  arch/arm64/kvm/pmu-emul.c | 13 +++++++++++++
> > >  arch/arm64/kvm/sys_regs.c |  8 +++++++-
> > >  2 files changed, 20 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> > > index a1bc10d7116a5..4dc4f3a473c3f 100644
> > > --- a/arch/arm64/kvm/pmu-emul.c
> > > +++ b/arch/arm64/kvm/pmu-emul.c
> > > @@ -1033,6 +1033,19 @@ static void kvm_arm_set_pmu(struct kvm *kvm, struct arm_pmu *arm_pmu)
> > >  
> > >  	kvm->arch.arm_pmu = arm_pmu;
> > >  	kvm->arch.pmcr_n = kvm_arm_pmu_get_max_counters(kvm);
> > 
> > nit: Can we rename pmcr_n to nr_pmu_counters? The current name is misleading.
> 
> Fair enough.
> 
> > > +
> > > +	/* Reset MDCR_EL2.HPMN behind the vcpus' back... */
> > > +	if (test_bit(KVM_ARM_VCPU_HAS_EL2, kvm->arch.vcpu_features)) {
> > > +		struct kvm_vcpu *vcpu;
> > > +		unsigned long i;
> > > +
> > > +		kvm_for_each_vcpu(i, vcpu, kvm) {
> > > +			u64 val = __vcpu_sys_reg(vcpu, MDCR_EL2);
> > > +			val &= ~MDCR_EL2_HPMN;
> > > +			val |= FIELD_PREP(MDCR_EL2_HPMN, kvm->arch.pmcr_n);
> > > +			__vcpu_sys_reg(vcpu, MDCR_EL2) = val;
> > > +		}
> > 
> > Shouldn't we be taking the vCPU mutex(es) here?
> 
> If we needed to, it shouldn't be here. We hold the config_lock at this
> point, and taking a vcpu mutex would result in a locking inversion.
> 
> One option is to punt this to a request, but that makes the updated
> HPMN un-observable from userspace until the vcpu has run. This already
> affects the default PMU, btw, since it is only assigned on first run.

Ah, right. Default PMU is set at KVM_ARM_VCPU_INIT, so any race that
comes afterwards would be the fault of userspace.

Fine with it as is then.

Thanks,
Oliver

