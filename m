Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7A6D10BFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 14:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFmQ3g+4IAepm2mpZZIQvyrjJDFwDM0PVhWAGARzdh0=; b=iX5bIro7CbSkpAmT8E65HtXnhK
	1pGSmxZaEk10od9C7y2tdBEefkh/aNq7miIG37NTv6u2Oox0TKEGbm9Yud0ggqdLKobUoechd2+F3
	Y83yUUz0XoTXmLbyi+/S+HEoadmim9lSOKik/+tw5qf/N8yk17REbTCRhZvftlGHJ+tJ+9RoU413+
	LMDBd6cXrVjLP9+04/ASYVzVXY/tuBzEK4TSOeP2mU5g0/A2SrfoG+Z9wRAZ2yZ3snWPpkR+8DCOD
	dn31Oxc7LVsYk6a4ThlTZECsJeteIXqvGkPcHvTXj6DY5OfXF3uZ9AKksgFwIp7KM9z8cUApsbkbJ
	mHaIOumQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4huk-00000006kgZ-3OPm;
	Sat, 26 Oct 2024 14:37:14 +0000
Received: from out-184.mta1.migadu.com ([2001:41d0:203:375::b8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4htA-00000006kZo-3ICB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 14:35:38 +0000
Date: Sat, 26 Oct 2024 14:35:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729953332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zFmQ3g+4IAepm2mpZZIQvyrjJDFwDM0PVhWAGARzdh0=;
	b=F2IYVKt9wwTeWiNFOGahnxdxOpcgp+X0rGKqdi4PqbQICyB4SfSARm0Xpljy1aYEwkn6Bl
	oCYeG0DFz7Z93sbK5WE3peOEVOaWehi7dBCwiLLjomlOxzNveqUYWzWEeMmxcdIij2coZi
	ETkOmQtFcMi1girOaHrfX7jRS2MkEhs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/18] KVM: arm64: nv: Reinject traps that take effect
 in Host EL0
Message-ID: <Zxz-LocgUKuzE3t0@linux.dev>
References: <20241025182354.3364124-1-oliver.upton@linux.dev>
 <20241025182354.3364124-9-oliver.upton@linux.dev>
 <87r083th7m.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r083th7m.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_073536_992571_77E27042 
X-CRM114-Status: GOOD (  22.88  )
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

Hey,

On Sat, Oct 26, 2024 at 09:13:17AM +0100, Marc Zyngier wrote:
> On Fri, 25 Oct 2024 19:23:43 +0100,
> Oliver Upton <oliver.upton@linux.dev> wrote:
> > 
> > Wire up the other end of traps that affect host EL0 by actually
> > injecting them into the guest hypervisor. Skip over FGT entirely, as a
> > cursory glance suggests no FGT is effective in host EL0.
> 
> Yes, and this (thankfully) is by design! :-)
> 
> > 
> > Note that kvm_inject_nested() is already equipped for handling
> > exceptions while the VM is already in a host context.
> > 
> > Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
> > ---
> >  arch/arm64/include/asm/kvm_emulate.h |  5 +++++
> >  arch/arm64/kvm/emulate-nested.c      | 29 ++++++++++++++++++++++++----
> >  2 files changed, 30 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> > index a601a9305b10..bf0c48403f59 100644
> > --- a/arch/arm64/include/asm/kvm_emulate.h
> > +++ b/arch/arm64/include/asm/kvm_emulate.h
> > @@ -225,6 +225,11 @@ static inline bool is_hyp_ctxt(const struct kvm_vcpu *vcpu)
> >  	return vcpu_has_nv(vcpu) && __is_hyp_ctxt(&vcpu->arch.ctxt);
> >  }
> >  
> > +static inline bool vcpu_is_host_el0(const struct kvm_vcpu *vcpu)
> > +{
> > +	return is_hyp_ctxt(vcpu) && !vcpu_is_el2(vcpu);
> > +}
> > +
> >  /*
> >   * The layout of SPSR for an AArch32 state is different when observed from an
> >   * AArch64 SPSR_ELx or an AArch32 SPSR_*. This function generates the AArch32
> > diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> > index e1a30d1bcd06..db3149379a4d 100644
> > --- a/arch/arm64/kvm/emulate-nested.c
> > +++ b/arch/arm64/kvm/emulate-nested.c
> > @@ -20,6 +20,9 @@ enum trap_behaviour {
> >  	BEHAVE_FORWARD_READ	= BIT(0),
> >  	BEHAVE_FORWARD_WRITE	= BIT(1),
> >  	BEHAVE_FORWARD_RW	= BEHAVE_FORWARD_READ | BEHAVE_FORWARD_WRITE,
> > +
> > +	/* Traps that take effect in Host EL0, this is rare! */
> > +	BEHAVE_IN_HOST_EL0	= BIT(2),
> 
> nit: BEHAVE_IN_HOST_EL0 lacks an action verb (forward?).

Thinking I'll squash this in (plus renaming in later patches):

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index db3149379a4d..b072098ee44e 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -22,7 +22,7 @@ enum trap_behaviour {
 	BEHAVE_FORWARD_RW	= BEHAVE_FORWARD_READ | BEHAVE_FORWARD_WRITE,
 
 	/* Traps that take effect in Host EL0, this is rare! */
-	BEHAVE_IN_HOST_EL0	= BIT(2),
+	BEHAVE_FORWARD_IN_HOST_EL0	= BIT(2),
 };
 
 struct trap_bits {
@@ -2279,7 +2279,7 @@ bool triage_sysreg_trap(struct kvm_vcpu *vcpu, int *sr_index)
 
 	b = compute_trap_behaviour(vcpu, tc);
 
-	if (!(b & BEHAVE_IN_HOST_EL0) && vcpu_is_host_el0(vcpu))
+	if (!(b & BEHAVE_FORWARD_IN_HOST_EL0) && vcpu_is_host_el0(vcpu))
 		goto local;
 
 	if (((b & BEHAVE_FORWARD_READ) && is_read) ||

-- 
Thanks,
Oliver

