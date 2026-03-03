Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A0FEC145E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJ814JYnv+p/rTMasmSc9pGQkm5ealeMMq1sY3dGaMQ=; b=32yRaqF6tgWPAsTS08Ha1lvgbU
	yCc9hmokdoASkhV5TesaLnPOIezX82fEpRLXt8GDfG0ERMJZdyW6lBhI8I4JeLD9uyGVp7SP17egr
	2bWeBjg1rlYRv5mQvXSItqvl5CsEmKEjdyVZwzIc22WdgPPSZK4sv6lUOfxouq68r9p187pE4HUQK
	PvwTc8yfkImWE/mn/W9L4ZUClS3geOIGMQKybxvWf4sEDDveQ69fc2SVBf251Nn3WPeGj2jyecCbB
	gnuL4/ZNT3+WmWsPMn8qrq26ljqNcVXVmYgaSj3LAv9wHUAmizdOoIOTLgqnCuS6mQLRpHhah7+En
	2UE3y+PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQuE-0000000FLOU-3wl9;
	Tue, 03 Mar 2026 14:39:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQuD-0000000FLOF-3CdW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 14:39:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 90CA760123;
	Tue,  3 Mar 2026 14:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF39C116C6;
	Tue,  3 Mar 2026 14:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772548764;
	bh=dBHrFQSk7Rk6asGJP5iligD6SmHOO6Xhw2TblL/B79c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MBQqp4EhSe5SXnHFzg7VJrtyBReJOXhWPuZrHbNgUsz42KbIJd7dEyBpfHmj6s7ro
	 /UZhqt5gYCI4u+TUKYIBFUNCE8VYYcYm6EOebMike7aEv9+d5JTdWT3VFGRPvQGq/o
	 S8Ch0yuIvb8+73GXvtE/oNHRYTdPm73NEic7PgoB5kzipm6OTgSrSjiUpN+XOYOqt4
	 gGKcowhSBmWuy0YFNTuaJCgM8n5vtD/pyLogaRL3U8BoECmiZmTzqRCpgeU1SO88j1
	 e7A/hTRm0GpkhY9Hl8yIHNznwDSxPKa6SCrzJaQwJa3XQvMwuK4LPFb/ugv+QHzRGv
	 koD/jtFwF+8yw==
Date: Tue, 3 Mar 2026 14:39:18 +0000
From: Will Deacon <will@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvmarm@lists.linux.dev, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Yabin Cui <yabinc@google.com>
Subject: Re: [PATCH v2 2/3] KVM: arm64: Disable SPE Profiling Buffer when
 running in guest context
Message-ID: <aabylhEFnTUR0WTy@willie-the-truck>
References: <20260227212136.7660-1-will@kernel.org>
 <20260227212136.7660-3-will@kernel.org>
 <b6f0b0c8-c2a6-4b61-a0cc-482450c092f5@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6f0b0c8-c2a6-4b61-a0cc-482450c092f5@arm.com>
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

On Tue, Mar 03, 2026 at 09:48:06AM +0000, Suzuki K Poulose wrote:
> On 27/02/2026 21:21, Will Deacon wrote:
> > diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> > index 3dbdee1148d3..75158a9cd06a 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> > @@ -14,20 +14,20 @@
> >   #include <asm/kvm_hyp.h>
> >   #include <asm/kvm_mmu.h>
> > -static void __debug_save_spe(u64 *pmscr_el1)
> > +static void __debug_save_spe(void)
> >   {
> > -	u64 reg;
> > +	u64 *pmscr_el1, *pmblimitr_el1;
> > -	/* Clear pmscr in case of early return */
> > -	*pmscr_el1 = 0;
> > +	pmscr_el1 = host_data_ptr(host_debug_state.pmscr_el1);
> > +	pmblimitr_el1 = host_data_ptr(host_debug_state.pmblimitr_el1);
> >   	/*
> >   	 * At this point, we know that this CPU implements
> >   	 * SPE and is available to the host.
> >   	 * Check if the host is actually using it ?
> >   	 */
> > -	reg = read_sysreg_s(SYS_PMBLIMITR_EL1);
> > -	if (!(reg & BIT(PMBLIMITR_EL1_E_SHIFT)))
> > +	*pmblimitr_el1 = read_sysreg_s(SYS_PMBLIMITR_EL1);
> > +	if (!(*pmblimitr_el1 & BIT(PMBLIMITR_EL1_E_SHIFT)))
> >   		return;
> >   	/* Yes; save the control register and disable data generation */
> > @@ -37,18 +37,29 @@ static void __debug_save_spe(u64 *pmscr_el1)
> >   	/* Now drain all buffered data to memory */
> >   	psb_csync();
> > +	dsb(nsh);
> > +
> > +	/* And disable the profiling buffer */
> > +	write_sysreg_s(0, SYS_PMBLIMITR_EL1);
> > +	isb();
> >   }
> > -static void __debug_restore_spe(u64 pmscr_el1)
> > +static void __debug_restore_spe(void)
> >   {
> > -	if (!pmscr_el1)
> > +	u64 pmblimitr_el1 = *host_data_ptr(host_debug_state.pmblimitr_el1);
> > +
> > +	if (!(pmblimitr_el1 & BIT(PMBLIMITR_EL1_E_SHIFT)))
> >   		return;
> >   	/* The host page table is installed, but not yet synchronised */
> >   	isb();
> 
> minor nit: This seems buried deep down in a helper (with no context of what
> else could have happened since the host context has been restored)
> and for now it looks correct,  but is prone to inadvertent changes
> causing issues or making this obsolete. With the isb() following LIMITR,
> wouldn't that be  sufficient ?

I'm just inherting this from the existing upstream code -- see the isb()
in the existing implementation of __debug_restore_spe().

The isb() is needed to ensure that SPE can't start making out-of-context
translation table walks (which can occur once PMBLIMITR_EL1.E is set)
before the stage-2 MMU is restored back to the host configuration (e.g.
by clearing HCR_EL2.VM for nVHE or by restoring VTCR and VTTBR for
pKVM). We want to predicate it on SPE being enabled, otherwise it's
unconditional overhead, so I don't think we can move it.

Will

