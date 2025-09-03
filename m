Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F43CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 11:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DEdmwPLHvbOsh4bwWxxStD0XvRblLCjIU1ccbSTvbCo=; b=inv1JOcy57i/f7+d+zHyiVITHN
	6qddlqPg6wlcIMolHcBWQ/Rez4xW/sK8bUdzEUfsIuqomb+XNjohFbUoeciXRlPrFB9P2E//GqPJX
	90IBoJ5e1VWnpXfd0iMGCupBrot6LLCGC4++2L/OJT53BUonLBnBs9GA9kjanpR5m4Zno+etuUTOg
	xnePsekAfRq8zi2V79knXiocNt/aN4j5m7gOBemOK/ucJqHM3wqOWGa09OJ8U2xNAEhuBkjnxy+fK
	M+K4VphlqJvRzipU9PFALSzLreWCCbuSAjgQJOKPuMXHyK6WAYDfE5kvCwHvhB92xakGnbHm5lM3Q
	F1sLgRog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utm9B-00000006JBc-1CJN;
	Wed, 03 Sep 2025 11:59:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkxj-0000000681d-2dX4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 10:43:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0E321688;
	Wed,  3 Sep 2025 03:43:24 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DDAD3F6A8;
	Wed,  3 Sep 2025 03:43:28 -0700 (PDT)
Date: Wed, 3 Sep 2025 11:43:09 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, anshuman.khandual@arm.com, robh@kernel.org,
	james.morse@arm.com, mark.rutland@arm.com, joey.gouly@arm.com,
	ahmed.genidi@arm.com, kevin.brodsky@arm.com,
	scott@os.amperecomputing.com, mbenes@suse.cz,
	james.clark@linaro.org, frederic@kernel.org, rafael@kernel.org,
	pavel@kernel.org, ryan.roberts@arm.com, suzuki.poulose@arm.com,
	maz@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v4 2/5] arm64: initialise SCTLR2_ELx register at boot time
Message-ID: <aLgbvWYeCr5l1MF6@e133380.arm.com>
References: <20250821172408.2101870-1-yeoreum.yun@arm.com>
 <20250821172408.2101870-3-yeoreum.yun@arm.com>
 <aLW4A3rTcJvA0c+j@e133380.arm.com>
 <aLXmCJOuxCHVXEYx@e129823.arm.com>
 <aLbJeQf9LKXFTxzS@e133380.arm.com>
 <aLbPjmy/ZYSd+wzA@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aLbPjmy/ZYSd+wzA@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_034335_744176_C4A49071 
X-CRM114-Status: GOOD (  42.23  )
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

Hi,

On Tue, Sep 02, 2025 at 12:05:50PM +0100, Yeoreum Yun wrote:
> Hi Dave,
> 
> [...]
> 
> > > > > diff --git a/arch/arm64/kernel/hyp-stub.S b/arch/arm64/kernel/hyp-stub.S
> > > > > index 36e2d26b54f5..ac12f1b4f8e2 100644
> > > > > --- a/arch/arm64/kernel/hyp-stub.S
> > > > > +++ b/arch/arm64/kernel/hyp-stub.S
> > > > > @@ -144,7 +144,17 @@ SYM_CODE_START_LOCAL(__finalise_el2)
> > > > >
> > > > >  .Lskip_indirection:
> > > > >  .Lskip_tcr2:
> > > > > +	mrs_s	x1, SYS_ID_AA64MMFR3_EL1
> > > > > +	ubfx	x1, x1, #ID_AA64MMFR3_EL1_SCTLRX_SHIFT, #4
> > > > > +	cbz	x1, .Lskip_sctlr2
> > > > > +	mrs_s	x1, SYS_SCTLR2_EL12
> > > > > +	msr_s	SYS_SCTLR2_EL1, x1
> > > > >
> > > > > +	// clean SCTLR2_EL1
> > > > > +	mov_q	x1, INIT_SCTLR2_EL1
> > > > > +	msr_s	SYS_SCTLR2_EL12, x1
> > > >
> > > > I'm still not sure why we need to do this.  The code doesn't seem to
> > > > clean up by the EL1 value of any other register -- or have I missed
> > > > something?
> > > >
> > > > We have already switched to EL2, via the HVC call that jumped to
> > > > __finalise_el2.  We won't run at EL1 again unless KVM starts a guest --
> > > > but in that case, it's KVM's responsibility to set up the EL1 registers
> > > > before handing control to the guest.
> > > >
> > > > In any case, is SCTLR2_EL1 ever set to anything except INIT_SCTLR2_EL1
> > > > before we get here?

[...]

> When I look at init_el2(), it returns to EL1 via:
> 
>   mov x0, #INIT_PSTATE_EL1
>   msr spsr_el2, x0
>   ...
>   eret
> 
> In other words, from init_kernel_el() through finalise_el2(),
> all system-register accesses are made at EL1 (i.e., SYS_REG_EL1).
> During this period, it appears that only SCTLR_EL1 is modified,
> so the code only needs to care about the accessed register — SCTLR_EL1.
> 
> That’s why SCTLR_EL1 is reinitialised at the end of finalise_el2().
> Otherwise, the MMU bit might remain enabled, which could cause errors later
> when launching a VM under VHE.
> 
> However, the idea behind this patch is to initialise SCTLR2_ELx
> the same way as SCTLR_ELx.
> I’m not sure whether SCTLR2_ELx is modified during this period.
> If it is (now or in the future),
> it should be cleared/reinitialised just like SCTLR_EL1.
> 
> This patch is based on the assumption that there may be modifications to
> SCTLR2_ELx during this period. So it isn’t about other system registers;
> it’s about the register actually used during this period.
> 
> Am I missing anything?
> 
> Thanks!
> 
> --
> Sincerely,
> Yeoreum Yun

I think I missed the SCTLR_EL1 reset in the idmap code after the
enter_vhe label.

Actually, I'm not sure whether there is any architectural reason for
setting SCTLR_EL1 to INIT_SCTLR_EL1_MMU_OFF here.  "for good measure"
suggests that it felt like a good idea but there was no known reason
for it.  The commit message for the original patch doesn't offer an
explanation -- maybe Marc can remember.

This might be a defence against speculative translation table walks
using the EL1&0 regime (but the architecture says [RNRJPP]: "If an
implementation is executing at EL3 or EL2, the PE is not permitted to
use the registers associated with the EL1&0 translation regime to
speculatively access memory or translation tables.")  So it shouldn't
really matter, but in case buggy CPUs don't implement this rule
properly it may be a good idea to turn the stage1 MMU off just in case.

Since it's there, though, it probably does make sense to reinitialise
SCTLR2_EL1 at the same time -- but can you move this so that it is next
to the SCTLR_EL1 reinitialisation?  Otherwise, the purpose of
reinitialising SCTLR2_EL1 is unclear.  It really should come under the
same "for good measure" justification as the SCTLR_EL1 reset.


However, I don't think this has anything to do with putting things into
a clean state for VMs.  KVM defines the reset state for all the _EL1
regs explicitly -- failing to do that would be a bug in KVM.

(See arch/arm64/kvm/sys_regs.c : sys_reg_descs[], kvm_reset_sys_regs().)

Cheers
---Dave

