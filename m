Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9148CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 12:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2vcHJY5yto/sLUFU3DZawnJcYGXCK+KrmqFh5wYl58=; b=MegJH6kCsrid9yLeorXPBziHpx
	XRxhQGLdR+goajpTTAU3A1xufdgshClqy0ncUzuZctvFGSCIj0p8DNch0Q6tuk+QuxKR+Cm8XLNR9
	BMyjmVk5B1lm569I30+Ia9qfvbEt2592Ifxvz1mqas3yShILS2ytd6zkyAuNDq4fHUmrZCVNf74N3
	LpV2iynRlIbHJkHwmXDSBRDagRJi64duPYW4p5Zqc3Ym8YMSfH+5F8hPcrRC/xObwQly/e3oBZkQC
	YGjnZmkqVrRfV5AWvgVCcDSleJKNsFuTToRsly/yTU1QJ6r0T4DoZyDT2z1IZ5xaLYAKTElh5v6LC
	cyKwGSdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZfV-00000005Ipj-3vll;
	Tue, 30 Sep 2025 12:41:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZfT-00000005IpK-32o5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 12:41:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3FF7339;
	Tue, 30 Sep 2025 05:41:09 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E70E3F66E;
	Tue, 30 Sep 2025 05:41:16 -0700 (PDT)
Date: Tue, 30 Sep 2025 13:41:10 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 08/13] KVM: arm64: Move CNT*CT_EL0 userspace accessors to
 generic infrastructure
Message-ID: <20250930124055.GA1107543@e124191.cambridge.arm.com>
References: <20250929160458.3351788-1-maz@kernel.org>
 <20250929160458.3351788-9-maz@kernel.org>
 <20250930104552.GB1093338@e124191.cambridge.arm.com>
 <86tt0kywlq.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86tt0kywlq.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_054119_891672_5A1431C5 
X-CRM114-Status: GOOD (  24.70  )
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

On Tue, Sep 30, 2025 at 01:05:05PM +0100, Marc Zyngier wrote:
> On Tue, 30 Sep 2025 11:45:52 +0100,
> Joey Gouly <joey.gouly@arm.com> wrote:
> > 
> > Observation below
> > 
> >   |
> >   v
> > 
> > On Mon, Sep 29, 2025 at 05:04:52PM +0100, Marc Zyngier wrote:
> > > Moving the counter registers is a bit more involved than for the control
> > > and comparator (there is no shadow data for the counter), but still
> > > pretty manageable.
> > > 
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > ---
> > >  arch/arm64/kvm/guest.c    |  7 -------
> > >  arch/arm64/kvm/sys_regs.c | 34 +++++++++++++++++++++++++++++++---
> > >  2 files changed, 31 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> > > index c23ec9be4ce27..138e5e2dc10c8 100644
> > > --- a/arch/arm64/kvm/guest.c
> > > +++ b/arch/arm64/kvm/guest.c
> > > @@ -592,19 +592,12 @@ static unsigned long num_core_regs(const struct kvm_vcpu *vcpu)
> > >  }
> > >  
> > >  static const u64 timer_reg_list[] = {
> > > -	KVM_REG_ARM_TIMER_CNT,
> > > -	KVM_REG_ARM_PTIMER_CNT,
> > >  };
> > >  
> > >  #define NUM_TIMER_REGS ARRAY_SIZE(timer_reg_list)
> > >  
> > >  static bool is_timer_reg(u64 index)
> > >  {
> > > -	switch (index) {
> > > -	case KVM_REG_ARM_TIMER_CNT:
> > > -	case KVM_REG_ARM_PTIMER_CNT:
> > > -		return true;
> > > -	}
> > >  	return false;
> > >  }
> > >  
> > > diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> > > index 68e88d5c0dfb5..e67eb39ddc118 100644
> > > --- a/arch/arm64/kvm/sys_regs.c
> > > +++ b/arch/arm64/kvm/sys_regs.c
> > > @@ -1605,12 +1605,38 @@ static int arch_timer_set_user(struct kvm_vcpu *vcpu,
> > >  	case SYS_CNTHP_CTL_EL2:
> > >  		val &= ~ARCH_TIMER_CTRL_IT_STAT;
> > >  		break;
> > > +	case SYS_CNTVCT_EL0:
> > > +		if (!test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags))
> > > +			timer_set_offset(vcpu_vtimer(vcpu), kvm_phys_timer_read() - val);
> > > +		return 0;
> > > +	case SYS_CNTPCT_EL0:
> > > +		if (!test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags))
> > > +			timer_set_offset(vcpu_ptimer(vcpu), kvm_phys_timer_read() - val);
> > > +		return 0;
> > >  	}
> > >  
> > >  	__vcpu_assign_sys_reg(vcpu, rd->reg, val);
> > >  	return 0;
> > >  }
> > >  
> > > +static int arch_timer_get_user(struct kvm_vcpu *vcpu,
> > > +			       const struct sys_reg_desc *rd,
> > > +			       u64 *val)
> > > +{
> > > +	switch (reg_to_encoding(rd)) {
> > > +	case SYS_CNTVCT_EL0:
> > > +		*val = kvm_phys_timer_read() - timer_get_offset(vcpu_vtimer(vcpu));
> > > +		break;
> > > +	case SYS_CNTPCT_EL0:
> > > +		*val = kvm_phys_timer_read() - timer_get_offset(vcpu_ptimer(vcpu));
> > > +		break;
> > > +	default:
> > > +		*val = __vcpu_sys_reg(vcpu, rd->reg);
> > 
> > Unsure if this is actually an issue but for the _CTL registers, via
> > access_arch_timer() (kvm_arm_timer_read_sysreg() -> .. -> read_timer_ctl()),
> > the ARCH_TIMER_CTRL_IT_STAT bit will be set if the timer expired, but that's
> > not done here.
> 
> Indeed, but I don't think this really matters, at least not for
> save/restore. We always clear the ISTATUS bit on restore, and
> snapshoting CTL is always a racy process.

Makes sense, so:

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks,
Joey

> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

