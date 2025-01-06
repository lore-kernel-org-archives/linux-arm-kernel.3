Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B0EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 12:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZMi0/+lFeaKbLjqyUotA2pLGSRlDX1aBpiWIb0bBSY=; b=cH9fGJmkcKRGV4rGYYok4XT0cD
	W0YTCuQ6DjTTiEfZXoHZP966ANo6H0+Wc3vTj0K97JyfslPUoJqCvwj7CYhMhzhjyz7V96fVkpv6T
	2hkVBzMmW5hJum6eycnuYNPh25WZvhOGSsrQq6+UcFJQsU2dWmKaqyVYwdEuHKse56QkqMwWxhPTC
	816gUReGQosxDjHoRvqkJvG+CfBKXuR1vvD+vgrrbqew6BC4n+0GYr8qZJyGiMMog+vbguLiBAZGS
	eqviAuddroE3z7cvvpHE1+QeRaBvUAHwYppkoDqZqsgVAbw8uxgcEOzgYWHy+6NsE5RP0PvtD4Hp1
	fjDXNbVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUm6G-00000001C3Q-2BeG;
	Mon, 06 Jan 2025 12:20:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUlps-000000018BR-09bD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 12:03:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C614222D9;
	Mon,  6 Jan 2025 04:04:23 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 870B33F673;
	Mon,  6 Jan 2025 04:03:54 -0800 (PST)
Date: Mon, 6 Jan 2025 12:03:44 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: Filter out SVE hwcaps when FEAT_SVE isn't
 implemented
Message-ID: <Z3vGeFUBd9YSIgg_@J2N7QTR9R3>
References: <20250103182255.1763739-1-maz@kernel.org>
 <Z3ulKMeKQcHFErgr@J2N7QTR9R3>
 <868qrop556.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <868qrop556.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_040356_181907_C586E6BF 
X-CRM114-Status: GOOD (  41.20  )
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

On Mon, Jan 06, 2025 at 11:12:53AM +0000, Marc Zyngier wrote:
> On Mon, 06 Jan 2025 09:40:56 +0000,
> Mark Rutland <mark.rutland@arm.com> wrote:
> > 
> > On Fri, Jan 03, 2025 at 06:22:55PM +0000, Marc Zyngier wrote:
> > > The hwcaps code that exposes SVE features to userspace only
> > > considers ID_AA64ZFR0_EL1, while this is only valid when
> > > ID_AA64PFR0_EL1.SVE advertises that SVE is actually supported.
> > > 
> > > The expectations are that when ID_AA64PFR0_EL1.SVE is 0, the
> > > ID_AA64ZFR0_EL1 register is also 0. So far, so good.
> > > 
> > > Things become a bit more interesting if the HW implements SME.
> > > In this case, a few ID_AA64ZFR0_EL1 fields indicate *SME*
> > > features. And these fields overlap with their SVE interpretations.
> > > But the architecture says that the SME and SVE feature sets must
> > > match, so we're still hunky-dory.
> > > 
> > > This goes wrong if the HW implements SME, but not SVE. In this
> > > case, we end-up advertising some SVE features to userspace, even
> > > if the HW has none. That's because we never consider whether SVE
> > > is actually implemented. Oh well.
> > 
> > Ugh; this is a massive pain. :(
> > 
> > Was this found by inspection, or is some real software going wrong?
> 
> Catalin can comment on that -- I understand that he found existing SW
> latching on SVE2 being wrongly advertised as hwcaps.
> 
> > > Fix it by restricting all SVE capabilities to ID_AA64PFR0_EL1.SVE
> > > being non-zero.
> > 
> > Unfortunately, I'm not sure this fix is correct+complete.
> > 
> > We expose ID_AA64PFR0_EL1 and ID_AA64ZFR0_EL1 via ID register emulation,
> > so any userspace software reading ID_AA64ZFR0_EL1 will encounter the
> > same surprise. If we hide that I'm worried we might hide some SME-only
> > information that isn't exposed elsewhere, and I'm not sure we can
> > reasonably hide ID_AA64ZFR0_EL1 emulation for SME-only (more on that
> > below).
> 
> I don't understand where things go wrong. EL0 SW that looks at the ID
> registers should perform similar checks, and we are not trying to make
> things better on that front (we can't). Unless you invent time travel
> and fix the architecture 5 years ago... :-/

Fair enough; if we say software consuming ID_AA64ZFR0_EL1 must check
ID_AA64PFR0_EL1.SVE or ID_AA64PFR1_EL1.SME first, and we leave the
emulation of ID_AA64ZFR0_EL1 as-is, that's fine by me.

> The hwcaps are effectively demultiplexing the ID registers, and they
> have to be exact, which is what this patch provides (SVE2 doesn't get
> wrongly advertised when not present).

> > Secondly, all our HWCAP documentation is written in the form:
> > 
> > | HWCAP2_SVEBF16
> > |     Functionality implied by ID_AA64ZFR0_EL1.BF16 == 0b0001.
> > 
> > ... so while the architectural behaviour is a surprise, the kernel is
> > (techincallyy) behaving exactly as documented prior to this patch. Maybe
> > we need to change that documentation?
> 
> Again, I don't see what goes wrong here. BF16 is only implemented for
> SVE or SME+FA64, and FA64 requires SVE2. So at least for that one, we
> should be good.

That was probably a bad example. What I was trying to get at is that the
HWCAPs are behavind exactly *as documented*, but that's not what we
actually want them to describe. For example, SVE2 is described as:

| Functionality implied by ID_AA64ZFR0_EL1.SVEver == 0b0001.

... which is exactly what we check today, but that doesn't
architecturally imply FEAT_SVE2 on SME-only HW where it can apparently
be 0b0001 due to FEAT_SME alone.

So to match the code change we'd need to change that to something like:

| Functionality impled by ID_AA64PFR0_EL1 == 0b0001 and
| ID_AA64ZFR0_EL1.SVEver == 0b0001

... with similar for other hwcaps.

> > Do we have equivalent SME hwcaps for the relevant features?
> >
> > ... looking at:
> > 
> >   https://developer.arm.com/documentation/ddi0601/2024-12/AArch64-Registers/ID-AA64ZFR0-EL1--SVE-Feature-ID-Register-0?lang=en
> > 
> > ... I see that ID_AA64ZFR0_EL1.B16B16 >= 0b0010 implies the presence of
> > SME BFMUL and BFSCALE instructions, but I don't see something equivalent
> > in ID_AA64SMFR0_EL1 per:
> > 
> >   https://developer.arm.com/documentation/ddi0601/2024-12/AArch64-Registers/ID-AA64SMFR0-EL1--SME-Feature-ID-Register-0?lang=en
> > 
> > ... so I suspect ID_AA64ZFR0_EL1 might be the only source of truth for
> > this.
> 
> Indeed, and the SME HWCAPs are not doing the right thing either. Or
> rather, we have no way to tell userspace that BFMUL/BFSCALE are
> available.

To be clear, I'm happy to punt on adding SME-specific HWCAPs, I just
want to make sure we're agreed as to whether the existing HWCAPs should
be SVE-specific, which it sounds like we are?

Mark.

