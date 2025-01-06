Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC63E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 10:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AAIyAkkM0yKQJbpmNHjXjA/jD+BCjrd2aTQ0YqQbUTo=; b=AtRBStxFGQG28wQ69rZ3sTMz/n
	pg1CIpjANjr+Kkzqcha4nwZJa9Q5h8w/e4hxNXCVAGP3ncXJnxj/4+s7YKp/3+TQsBzqEqKsfxeZQ
	UBw/dhOZen1GXsCm5AShw83yB4KVOZRzlcWyZxCUNqg9DvErFBjVAgNu1n+UtikCajO51BfTuPJgR
	kmrL5aaZMfpM3OOd7e266XZzMY3ZLMFAx4wvcBQdggKKhx7Lb4BKGLNilI/2GrkgW2mZP8zoy+Gaj
	Xyz8R5ANmooEeblHBymo4dOQQB3AvBmF+X4D0uiPvjeTdMZc2lX8AKYMimY62nV/rawrGdYBkWDjB
	mBh0C6vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUkoj-00000000wrT-406Q;
	Mon, 06 Jan 2025 10:58:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUknQ-00000000wOp-1wGT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 10:57:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 92BB8A41442;
	Mon,  6 Jan 2025 10:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDAF6C4CED2;
	Mon,  6 Jan 2025 10:57:17 +0000 (UTC)
Date: Mon, 6 Jan 2025 10:57:15 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: Filter out SVE hwcaps when FEAT_SVE isn't
 implemented
Message-ID: <Z3u3C87U7LKJZ77B@arm.com>
References: <20250103182255.1763739-1-maz@kernel.org>
 <Z3ulKMeKQcHFErgr@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3ulKMeKQcHFErgr@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_025720_636889_D79A17CA 
X-CRM114-Status: GOOD (  33.65  )
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

On Mon, Jan 06, 2025 at 09:40:56AM +0000, Mark Rutland wrote:
> On Fri, Jan 03, 2025 at 06:22:55PM +0000, Marc Zyngier wrote:
> > The hwcaps code that exposes SVE features to userspace only
> > considers ID_AA64ZFR0_EL1, while this is only valid when
> > ID_AA64PFR0_EL1.SVE advertises that SVE is actually supported.
> > 
> > The expectations are that when ID_AA64PFR0_EL1.SVE is 0, the
> > ID_AA64ZFR0_EL1 register is also 0. So far, so good.
> > 
> > Things become a bit more interesting if the HW implements SME.
> > In this case, a few ID_AA64ZFR0_EL1 fields indicate *SME*
> > features. And these fields overlap with their SVE interpretations.
> > But the architecture says that the SME and SVE feature sets must
> > match, so we're still hunky-dory.
> > 
> > This goes wrong if the HW implements SME, but not SVE. In this
> > case, we end-up advertising some SVE features to userspace, even
> > if the HW has none. That's because we never consider whether SVE
> > is actually implemented. Oh well.
> 
> Ugh; this is a massive pain. :(
> 
> Was this found by inspection, or is some real software going wrong?

It goes wrong on M4 in a VM. The latest macOS (15.2 I think) enabled
those ID regs for guests and Linux user space started falling apart
(first one reported was a fairly recent JDK getting SIGILL when trying
to use the INCB instruction). Reported initially on the Parallels forum.

> > Fix it by restricting all SVE capabilities to ID_AA64PFR0_EL1.SVE
> > being non-zero.
> 
> Unfortunately, I'm not sure this fix is correct+complete.
> 
> We expose ID_AA64PFR0_EL1 and ID_AA64ZFR0_EL1 via ID register emulation,
> so any userspace software reading ID_AA64ZFR0_EL1 will encounter the
> same surprise. If we hide that I'm worried we might hide some SME-only
> information that isn't exposed elsewhere, and I'm not sure we can
> reasonably hide ID_AA64ZFR0_EL1 emulation for SME-only (more on that
> below).

Good point about the user also accessing these registers through
emulation.

> Secondly, all our HWCAP documentation is written in the form:
> 
> | HWCAP2_SVEBF16
> |     Functionality implied by ID_AA64ZFR0_EL1.BF16 == 0b0001.
> 
> ... so while the architectural behaviour is a surprise, the kernel is
> (techincallyy) behaving exactly as documented prior to this patch. Maybe
> we need to change that documentation?

The kernel is also reporting HWCAP2_SVE2 based on ID_AA64ZFR0_EL1.SVEver
which I don't think it should (my reading of the spec). I suspect that's
what's causing JDK failures.

> Do we have equivalent SME hwcaps for the relevant features?
> 
> ... looking at:
> 
>   https://developer.arm.com/documentation/ddi0601/2024-12/AArch64-Registers/ID-AA64ZFR0-EL1--SVE-Feature-ID-Register-0?lang=en
> 
> ... I see that ID_AA64ZFR0_EL1.B16B16 >= 0b0010 implies the presence of
> SME BFMUL and BFSCALE instructions, but I don't see something equivalent
> in ID_AA64SMFR0_EL1 per:
> 
>   https://developer.arm.com/documentation/ddi0601/2024-12/AArch64-Registers/ID-AA64SMFR0-EL1--SME-Feature-ID-Register-0?lang=en
> 
> ... so I suspect ID_AA64ZFR0_EL1 might be the only source of truth for
> this.
> 
> It is bizarre that ID_AA64SMFR0_EL1 doesn't follow the same format, and
> ID_AA64SMFR0_EL1.B16B16 is a single-bit field that cannot encode the
> same values as ID_AA64ZFR0_EL1.B16B16 (which is a 4-bit field).

Oh, I'm getting confused now. Do we have this information exposed twice
in the ID regs? I think in the kernel we use ZFR0 for SVE and SMFR0 for
the SME equivalent but the architecture is actually confusing with ZFR0
describing both SME and SVE features available. I guess at some point
the architects thought we can't have SME without SVE but changed their
mind and we haven't spotted.

-- 
Catalin

