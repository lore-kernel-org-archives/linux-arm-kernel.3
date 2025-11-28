Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBFBD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 12:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s25YBeQHCL9rDo1dkSWXPokeFGnHiIE7x3ElxvksI2k=; b=TJGSidtgDCtdOZdgg942hbcFiV
	LlCWDOwPjH9bIA/aMVYhCDPKMbWreROivBJ+rMtHSCzjCAS4PAiEezyi05BZdMHsWlz2drE0qfZop
	r998fkN7Dc/Fya0ryymCYW4UtYzTNMJbOUcjuo3a+/IdKx6HMVSJN7ytxtkaOw0DVUG03pmiUGiKJ
	40ShZYxWax4ezoT7dgHTZ+T5UCt6eqHSf0Y3ssISti6+acKmYspK9UUUfdOqoEaS/+eKRAA++2vSa
	5oL0NPBcBFPrIFcM9mtMsEUnvpPYxoMH9aiDi4fCwDAdLysW0pdeKmwWUfa+2IbQC6b4/EN6SMGBD
	kyh2DqGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOxJ3-00000000PfB-0pkO;
	Fri, 28 Nov 2025 12:10:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOxJ1-00000000Pf1-1bdt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 12:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38AA9601FD;
	Fri, 28 Nov 2025 12:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F146C4CEF1;
	Fri, 28 Nov 2025 12:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764331828;
	bh=bdCyEl4sa48vbIuQYg/qlHBmJ0kk+v8PxkVZj+7WPtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yi6Pm2urK4icMwNAhXBuWZDlSfEkYN4A9TUD/QOnzRHLlghPBAXNkWHB1nN4sfJsV
	 dSaHjpfLVs1gY+P5FvXhCf99FthBNmI2/vnToCkPdi/lBPFDaAE22aAK7Vbxk8BSYE
	 2sqCZIuAR/OV3yphVK/9M8ZXrOglDJPGjq+F6Wnp7bTk0S94DWIsrLZKnuY9arA2Jo
	 PXm3ycfb/uZfFQWxtih5JKx69oQ0ETi3ME36oYcGmbP10+150IQ6Z2CUWvanja3rdl
	 pTILwLFAclgG6B4uhWlo1Rd6BqKNFJs4MY3ajWiN2cJm5cjCVajspQD9G53nES4mY6
	 hHY1eAuIvdEGA==
Date: Fri, 28 Nov 2025 12:10:23 +0000
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com
Subject: Re: [PATCH v1 4/5] arm64: Inject UNDEF when accessing MTE sysregs
 with MTE disabled
Message-ID: <aSmRL4oSAi0WNUpl@willie-the-truck>
References: <20251127122210.4111702-1-tabba@google.com>
 <20251127122210.4111702-5-tabba@google.com>
 <86345zr24c.wl-maz@kernel.org>
 <CA+EHjTz9fJ2892TNn-hy3aiQA6Cxj6xuFUBKQhpDOnsHkDtdwQ@mail.gmail.com>
 <86wm3apmxu.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86wm3apmxu.wl-maz@kernel.org>
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

Hey Marc,

I can shed a bit more light on why MTE might be disabled in Android, but
please don't shoot the messenger!

On Fri, Nov 28, 2025 at 08:43:09AM +0000, Marc Zyngier wrote:
> On Thu, 27 Nov 2025 14:41:24 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> > On Thu, 27 Nov 2025 at 14:17, Marc Zyngier <maz@kernel.org> wrote:
> > > On Thu, 27 Nov 2025 12:22:09 +0000,
> > > Fuad Tabba <tabba@google.com> wrote:
> > > > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > > index 29430c031095..f542e4c17156 100644
> > > > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > > @@ -686,6 +686,46 @@ static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
> > > >       kvm_skip_host_instr();
> > > >  }
> > > >
> > > > +static void inject_undef64(void)
> > > > +{
> > > > +     unsigned long sctlr, vbar, old, new;
> > > > +     u64 offset, esr;
> > > > +
> > > > +     vbar = read_sysreg_el1(SYS_VBAR);
> > > > +     sctlr = read_sysreg_el1(SYS_SCTLR);
> > > > +     old = read_sysreg_el2(SYS_SPSR);
> > > > +     new = get_except64_cpsr(old, system_supports_mte(), sctlr, PSR_MODE_EL1h);
> > > > +     offset = get_except64_offset(old, PSR_MODE_EL1h, except_type_sync);
> > > > +     esr = (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT) | ESR_ELx_IL;
> > > > +
> > > > +     write_sysreg_el1(esr, SYS_ESR);
> > > > +     write_sysreg_el1(read_sysreg_el2(SYS_ELR), SYS_ELR);
> > > > +     write_sysreg_el1(old, SYS_SPSR);
> > > > +     write_sysreg_el2(vbar + offset, SYS_ELR);
> > > > +     write_sysreg_el2(new, SYS_SPSR);
> > > > +}
> > > > +
> > > > +static bool handle_host_mte(u64 esr)
> > > > +{
> > > > +     /* If we're here for any reason other than MTE, then it's a bug. */
> > > > +
> > > > +     if (read_sysreg(HCR_EL2) & HCR_ATA)
> > > > +             return false;
> > > > +
> > > > +     switch (esr_sys64_to_sysreg(esr)) {
> > > > +     case SYS_RGSR_EL1:
> > > > +     case SYS_GCR_EL1:
> > > > +     case SYS_TFSR_EL1:
> > > > +     case SYS_TFSRE0_EL1:
> > >
> > > How about other things, such as DC GVA? Don't you need to trap and
> > > UNDEF it (which has the side effect of also trapping DC ZVA)?
> > >
> > > Same question for all the DC {C,I,CI}GVA{C,P} instructions.
> > 
> > As far as I could tell, none of these are trapped by ATA. The spec
> > says that in the absence of MTE, their behavior is undefined --- which
> > is the same for the ones I'm actually handling here...
> > 
> > The reasons I've only handled these is that, when booting a system
> > with a misadvertised MTE, the kernel accesses these registers, and
> > injecting an UNDEF resulted in a nicer failure mode.
> 
> But it all comes down to *why* is MTE disabled. Is it because the user
> cannot be arsed with MTE's abysmal^Wstellar performance? Or because
> this is a memory corruption vector on a misconfigured platform?

FWIW, Android uses "arm64.nomte" as the mechanism to "disable" MTE so
that the physical memory otherwise used as tag storage can be used for
other things (i.e. treated just like the rest of memory):

https://source.android.com/docs/security/test/memory-safety/bootloader-support#bootloader-support

I appreciate that this isn't what the early idreg overrides were
designed for, but it's an interesting case because the hardware isn't
actually broken, it's just that there's a decicion about whether to give
up memory for tags or not and, if the memory is used for other things,
we need to clear ATA to prevent the host from accesing that memory via
tag operations.

Will

