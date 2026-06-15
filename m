Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFFACD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 14:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auW1SfhDQCopf2sqbS7z5c5X4NMG5lhVtX6nJa90VUI=; b=fczhuowD8c+k1twXsSE8t4v22g
	nr4PIfG/vCLOj/ACFD58/CZeX72hvJ9atk6+4INyw1tXXlllR+j8TS7O8vYU/vgBxnJxAx1jX/AEh
	4Pxv19lvn5SK8D/0pLyJWrwA5jXteZfqp/HLUVFCuJ//3aRLo5zfl4NLR1kHJffTt23p0PgfcgbaQ
	2viRQhXnQeCwju+LcksMMpb2pAA/Egov7wVMZ/t3tPoTEWDcxoWCpA4JkFEHHAqs5SBA1wZu8Qffa
	2SFx/wQwmP2ui1yfAK493HP7aA2NRSgAFUchJ6EL75ZQbzwgQ84t/oD+w0P0smIhkMRauAr+XFNzl
	muio2Xzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ8Vp-0000000EQmQ-0CYe;
	Mon, 15 Jun 2026 14:42:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ8Vn-0000000EQm9-3yzx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 14:42:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DFD2A600AB;
	Mon, 15 Jun 2026 14:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 242B11F00A3D;
	Mon, 15 Jun 2026 14:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781534522;
	bh=auW1SfhDQCopf2sqbS7z5c5X4NMG5lhVtX6nJa90VUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hn6HqzofiMp1J+MkJ22YKx6X41bjqOe4pc93PbjxEY658MVSZpgC5S5297ySbBD1e
	 6k/1tAxSWf8f+QouLflwIw21yUxKJvgKSPMJCyVr3uEKXqdpwnFcUrvgP7C4OGU4jO
	 TBqP2Rz5onP4JJL8s+wnWiMGILdcRV7heWWyNcbLyg+8MIOFY7aCNiOC4YRk8pJvxS
	 /ExiqY4iZPxlgfB9SSAPaJdM04rimCEj6whKSuJpLK6OVYlBDkO+3Qo4wNBz5Elae7
	 ocn69VmwJXqUMoDpS86H6nPAKBeCrzxDLh57XvRFwRsk1Du2D1z+qEPth3d3feL4oA
	 7TMkzvG2Kt1Rg==
Date: Mon, 15 Jun 2026 15:41:56 +0100
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
Message-ID: <ajAPNFDsQ63k_jAS@willie-the-truck>
References: <20260612113414.1022901-1-tabba@google.com>
 <ai_OevUNS-OACPm7@willie-the-truck>
 <CA+EHjTyMOoCLQ7d6+TgkrnOJF-PV9K-BKtb4CNuAg8p4gtg6wg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTyMOoCLQ7d6+TgkrnOJF-PV9K-BKtb4CNuAg8p4gtg6wg@mail.gmail.com>
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

On Mon, Jun 15, 2026 at 11:52:10AM +0100, Fuad Tabba wrote:
> On Mon, 15 Jun 2026 at 11:05, Will Deacon <will@kernel.org> wrote:
> >
> > On Fri, Jun 12, 2026 at 12:34:14PM +0100, Fuad Tabba wrote:
> > > When pKVM injects a synchronous exception into a protected guest, it
> > > re-enters without restoring the guest's EL1 sysregs and writes the EL1
> > > exception registers to hardware by hand: ESR_EL1 and ELR_EL1, but not
> > > SPSR_EL1. enter_exception64() sets SPSR_EL1 (the interrupted PSTATE)
> > > only in memory, so the guest's handler reads a stale SPSR_EL1 and
> > > restores the wrong PSTATE on eret.
> > >
> > > Write SPSR_EL1 alongside the other exception registers.
> > >
> > > Fixes: 6c30bfb18d0b ("KVM: arm64: Add handlers for protected VM System Registers")
> > > Reported-by: sashiko <sashiko@sashiko.dev>
> > > Signed-off-by: Fuad Tabba <tabba@google.com>
> > > ---
> > >  arch/arm64/kvm/hyp/nvhe/sys_regs.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > > index 8c3fbb413a06..1a7d5cd16d72 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > > @@ -268,6 +268,7 @@ static void inject_sync64(struct kvm_vcpu *vcpu, u64 esr)
> > >
> > >       write_sysreg_el1(esr, SYS_ESR);
> > >       write_sysreg_el1(read_sysreg_el2(SYS_ELR), SYS_ELR);
> > > +     write_sysreg_el1(read_sysreg_el2(SYS_SPSR), SYS_SPSR);
> > >       write_sysreg_el2(*vcpu_pc(vcpu), SYS_ELR);
> > >       write_sysreg_el2(*vcpu_cpsr(vcpu), SYS_SPSR);
> > >  }
> >
> > Is SPSR_EL1 not set in enter_exception64() using vcpu_cpsr(vcpu), which
> > *is* set here? I'm just a bit wary of the report, as I'd have expected
> > fireworks if we weren't initialising the guest's SPSR on the exception
> > injection path.
> 
> Yes, enter_exception64() sets SPSR_EL1, but only in memory:
> __vcpu_write_spsr() takes the nVHE path and calls
> __vcpu_assign_sys_reg(vcpu, SPSR_EL1, val), which writes
> vcpu->arch.ctxt.sys_regs[SPSR_EL1] without touching the hardware
> register.
> 
> In the normal nVHE entry path that memory value reaches hardware via
> __sysreg_restore_state_nvhe() before __guest_enter(). But
> inject_sync64() runs inside the fixup_guest_exit() loop, which
> re-enters the guest directly without a sysreg restore pass. ESR_EL1
> and ELR_EL1 are already written to hardware by hand for this reason
> but SPSR_EL1 was missed.

Ah, I see. Does that mean that all the in-memory updates performed by
enter_exception64() (e.g. the construction of the cpsr) are ignored too?

Will

