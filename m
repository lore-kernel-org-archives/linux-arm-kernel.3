Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64606CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 15:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6D3OVlrvkPFC5YpM7Ascrn3ZDmZs0qt08Auv5CsEr4=; b=nZr4bbP3ff8RxIrtAPfzu+5M0w
	SwieplbSm+3gN6dWmZ8XBamCFMaOww4jYxjzQRw23QXvAUc1itQUyoPD5aezJR9zaCIcWCHLNMAj+
	XEOopuz9wDYpmUnkKQ3WbBB4MfikJvwyV6mbH4lGW9w9RaTNp1FlfL6xR8ceazLu0P6Q+A6BeZsvF
	CuoCG+fs1YKy7+VcUa0dIDa1iXhSx+zz7Z058N4Ez6XaOBJbhLDR0LjUhikrIEkhPeKdpw9+exJ7N
	O/23snDrJsI70+EY4yraWRC2O4sl9eVJQfl+t9455AEvF4V5ixqOixqh4NzwLaedQqFH8VMEscfAQ
	sCJzE2hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBact-00000003MjB-1n5V;
	Wed, 22 Oct 2025 15:19:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBacr-00000003Miz-3d7q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 15:19:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36C3A604FC;
	Wed, 22 Oct 2025 15:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD1FC4CEE7;
	Wed, 22 Oct 2025 15:19:42 +0000 (UTC)
Date: Wed, 22 Oct 2025 16:19:40 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: guard AMU register access with ARM64_HAS_AMU_EXTN
Message-ID: <aPj2DA2FwYVSmLVc@arm.com>
References: <20251022133621.178546-1-marek.vasut+renesas@mailbox.org>
 <86347bvx0f.wl-maz@kernel.org>
 <07391913-aab6-4d92-b75f-278506f51397@mailbox.org>
 <861pmvvv2g.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <861pmvvv2g.wl-maz@kernel.org>
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

On Wed, Oct 22, 2025 at 04:02:15PM +0100, Marc Zyngier wrote:
> On Wed, 22 Oct 2025 15:33:38 +0100,
> Marek Vasut <marek.vasut@mailbox.org> wrote:
> > 
> > On 10/22/25 4:20 PM, Marc Zyngier wrote:
> > > On Wed, 22 Oct 2025 14:35:28 +0100,
> > > Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
> > >> 
> > >> The AMU configuration register access may fault and prevent successful
> > >> kernel boot. This can occur for example in case the firmware does not
> > >> allow AMU counter access from EL1. Guard the AMU configuration register
> > >> access with ARM64_HAS_AMU_EXTN to prevent this fault if ARM64_HAS_AMU_EXTN
> > >> Kconfig option is explicitly disabled. Other interaction with the AMU is
> > >> already guarded by similar ifdeffery.
> > >> 
> > >> Fixes: 87a1f063464a ("arm64: trap to EL1 accesses to AMU counters from EL0")
> > >> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > >> ---
> > >> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> > >> Cc: Catalin Marinas <catalin.marinas@arm.com>
> > >> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > >> Cc: Marc Zyngier <maz@kernel.org>
> > >> Cc: Ryan Roberts <ryan.roberts@arm.com>
> > >> Cc: Will Deacon <will@kernel.org>
> > >> Cc: Yicong Yang <yangyicong@hisilicon.com>
> > >> Cc: linux-arm-kernel@lists.infradead.org
> > >> Cc: linux-renesas-soc@vger.kernel.org
> > >> ---
> > >>   arch/arm64/mm/proc.S | 4 ++++
> > >>   1 file changed, 4 insertions(+)
> > >> 
> > >> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> > >> index 86818511962b6..123538ffeda6b 100644
> > >> --- a/arch/arm64/mm/proc.S
> > >> +++ b/arch/arm64/mm/proc.S
> > >> @@ -145,7 +145,9 @@ SYM_FUNC_START(cpu_do_resume)
> > >>   	ubfx	x11, x11, #1, #1
> > >>   	msr	oslar_el1, x11
> > >>   	reset_pmuserenr_el0 x0			// Disable PMU access from EL0
> > >> +alternative_if ARM64_HAS_AMU_EXTN
> > >>   	reset_amuserenr_el0 x0			// Disable AMU access from EL0
> > >> +alternative_else_nop_endif
> > > 
> > > Why?
> > > 
> > > We ensure that the AMU is available in the macro itself by checking
> > > for ID_AA64PFR0_EL1.AMU. If the AMu isn't present on this CPU, we skip
> > > the offending sysreg access. This is similar to what we do for the
> > > PMU.
> > > 
> > > Does your HW advertise an AMU, but doesn't actually have one?
> >
> > The hardware does have AMU, but it is currently blocked in old TFA
> > version and access to this AMU register here causes a fault. That's
> > why I have to disable ARM64_HAS_AMU_EXTN until the TFA is updated and
> > the AMU access is made available on this hardware. But even if I do
> > disable ARM64_HAS_AMU_EXTN=n , I get a fault.
> 
> Well, I would tend to say that you are trying to update the wrong
> piece of SW here. Crashing kernels should be a good incentive for the
> board manufacturer to update their firmware pronto, specially when we
> are talking of code that has been in the tree for over 5 years...

I agree.

> > This patch is mainly meant to prevent a surprise in case someone does
> > set ARM64_HAS_AMU_EXTN=n , and the system still faults on AMU register
> > access.
> 
> But that doesn't really fix anything if you have a buggy firmware,
> because you can't tell which CPUs have been correctly configured, and
> which have not. I also don't really get why this hack works for you,
> because the feature will be set as soon as one CPU advertises the
> feature.

I think Marek also disables the config option and the feature won't be
turned on.

-- 
Catalin

