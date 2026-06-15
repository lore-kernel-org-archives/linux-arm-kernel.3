Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA35CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 15:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejF4t2I4d+E2yAtG1CLI4adu866j9j/R+6+/ewAAvBY=; b=px9an+OdmGy/dFM9V875BIxjJH
	xlg1b9N48ynv28eb47BM9aVE+0MIrtX3nO4UqAjApxm9Wby02EDkIHgPA3ZkOEmAnr0zbEnV7iGfC
	+366DeXD9Cr5A5LXPHQc8u7f4tyo+FGNEug73167jg4pb6ldiTHyGPyZdCgoRY1m7hAaEF0oT+aBa
	utiz5RZDe5VRV6grjCPvkIIka2JNoIRQ87kNEfaUTtTXsoQ0vMeUQzhbA+PvqwHDFHNU+mbXaJOww
	XaqGw896YlT8IEYaEwq7YDYNarDL7d2XISzEtOzckfrOvzFUcrBZ7j3meP9PDBRcAiQ5FY6KqWJMQ
	FGVgNVkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ8xR-0000000ETvz-1G8s;
	Mon, 15 Jun 2026 15:10:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ8xN-0000000ETvs-36Gs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 15:10:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4092841E5C;
	Mon, 15 Jun 2026 15:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57051F000E9;
	Mon, 15 Jun 2026 15:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781536233;
	bh=ejF4t2I4d+E2yAtG1CLI4adu866j9j/R+6+/ewAAvBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G3TArmm82sV+XPBinsQxph2Kk0pHPX8Rb1XflIBKMCSjzApxPuYY57BvERp/w7IF6
	 KrgZxuzWJfW3dMnw1ipAb/kGztSk6u8Z/A/Hc9PLCfYKPtgGsJjFZHAyOzETLrhX3+
	 04XQYQiEqn//QM/TA4i0xaqHcpYw2gXn6usv/mjQfRUdg5qFOaHKrVXDHjAtKeq7Fr
	 DISzGlxucPjT3IkXIznF6BL3ecuHYRRRio7U7vpY4DxLBMMf0pcWhiZYi65BZpyCSj
	 NfbnCN6lnz4KKcoexji+VAYuJNVElWoZO1C38Hbgc7VDfnD0ou04O5OkVvA8t5u9Xz
	 76TasGGozIoaw==
Date: Mon, 15 Jun 2026 16:10:27 +0100
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH] KVM: arm64: Sync SPSR_EL1 when injecting an exception
 into a pVM
Message-ID: <ajAV4ymK6puBxkEG@willie-the-truck>
References: <20260612113414.1022901-1-tabba@google.com>
 <ai_OevUNS-OACPm7@willie-the-truck>
 <CA+EHjTyMOoCLQ7d6+TgkrnOJF-PV9K-BKtb4CNuAg8p4gtg6wg@mail.gmail.com>
 <ajAPNFDsQ63k_jAS@willie-the-truck>
 <CA+EHjTzL4GKw8RQrGnMq81Ohquo48_L4-MNJrCdGnBpMPR7XcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzL4GKw8RQrGnMq81Ohquo48_L4-MNJrCdGnBpMPR7XcA@mail.gmail.com>
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

On Mon, Jun 15, 2026 at 04:03:17PM +0100, Fuad Tabba wrote:
> On Mon, 15 Jun 2026 at 15:42, Will Deacon <will@kernel.org> wrote:
> >
> > On Mon, Jun 15, 2026 at 11:52:10AM +0100, Fuad Tabba wrote:
> > > On Mon, 15 Jun 2026 at 11:05, Will Deacon <will@kernel.org> wrote:
> > > >
> > > > On Fri, Jun 12, 2026 at 12:34:14PM +0100, Fuad Tabba wrote:
> > > > > When pKVM injects a synchronous exception into a protected guest, it
> > > > > re-enters without restoring the guest's EL1 sysregs and writes the EL1
> > > > > exception registers to hardware by hand: ESR_EL1 and ELR_EL1, but not
> > > > > SPSR_EL1. enter_exception64() sets SPSR_EL1 (the interrupted PSTATE)
> > > > > only in memory, so the guest's handler reads a stale SPSR_EL1 and
> > > > > restores the wrong PSTATE on eret.
> > > > >
> > > > > Write SPSR_EL1 alongside the other exception registers.
> > > > >
> > > > > Fixes: 6c30bfb18d0b ("KVM: arm64: Add handlers for protected VM System Registers")
> > > > > Reported-by: sashiko <sashiko@sashiko.dev>
> > > > > Signed-off-by: Fuad Tabba <tabba@google.com>
> > > > > ---
> > > > >  arch/arm64/kvm/hyp/nvhe/sys_regs.c | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > > > > index 8c3fbb413a06..1a7d5cd16d72 100644
> > > > > --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > > > > +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > > > > @@ -268,6 +268,7 @@ static void inject_sync64(struct kvm_vcpu *vcpu, u64 esr)
> > > > >
> > > > >       write_sysreg_el1(esr, SYS_ESR);
> > > > >       write_sysreg_el1(read_sysreg_el2(SYS_ELR), SYS_ELR);
> > > > > +     write_sysreg_el1(read_sysreg_el2(SYS_SPSR), SYS_SPSR);
> > > > >       write_sysreg_el2(*vcpu_pc(vcpu), SYS_ELR);
> > > > >       write_sysreg_el2(*vcpu_cpsr(vcpu), SYS_SPSR);
> > > > >  }
> > > >
> > > > Is SPSR_EL1 not set in enter_exception64() using vcpu_cpsr(vcpu), which
> > > > *is* set here? I'm just a bit wary of the report, as I'd have expected
> > > > fireworks if we weren't initialising the guest's SPSR on the exception
> > > > injection path.
> > >
> > > Yes, enter_exception64() sets SPSR_EL1, but only in memory:
> > > __vcpu_write_spsr() takes the nVHE path and calls
> > > __vcpu_assign_sys_reg(vcpu, SPSR_EL1, val), which writes
> > > vcpu->arch.ctxt.sys_regs[SPSR_EL1] without touching the hardware
> > > register.
> > >
> > > In the normal nVHE entry path that memory value reaches hardware via
> > > __sysreg_restore_state_nvhe() before __guest_enter(). But
> > > inject_sync64() runs inside the fixup_guest_exit() loop, which
> > > re-enters the guest directly without a sysreg restore pass. ESR_EL1
> > > and ELR_EL1 are already written to hardware by hand for this reason
> > > but SPSR_EL1 was missed.
> >
> > Ah, I see. Does that mean that all the in-memory updates performed by
> > enter_exception64() (e.g. the construction of the cpsr) are ignored too?
> 
> From looking at the code, no. inject_sync64() reads back the cpsr and
> PC that enter_exception64() computed in memory and writes them to
> hardware:
> 
>     write_sysreg_el2(*vcpu_pc(vcpu), SYS_ELR);
>     write_sysreg_el2(*vcpu_cpsr(vcpu), SYS_SPSR);
> 
> So the guest re-enters with the right PSTATE. The only value left
> stranded in memory is SPSR_EL1.

Ah, thanks. I had pissed that inject_sync64() calls __kvm_adjust_pc()
immediately after pending the exception. So you've convinced me:

Acked-by: Will Deacon <will@kernel.org>

Will

