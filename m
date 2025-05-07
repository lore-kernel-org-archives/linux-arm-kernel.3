Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2313DC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4cI+WkruC9NWHQ6m2Ys1JWaDqfJJ0VGiMGpblJye9c=; b=XlUpJuFTN1lbED1ydgVACjWBEP
	ui8r7uOpPp8Hs3SrlTQuPPcdLRIoOuGz1z7mPqs0Us7v7LH0N8x7THAqu6H8PIctfJUiiClf/9K8u
	5Q/4bvXqld0dG3rCL+el7U17u274a9rYWxSrGbbq2lKwh0fkRL39MtKApwr7JFiup4UOc4BBvHtpA
	5kqaw3+ibtOMAgcqjqXaqua5F00ycO8KYnFvMqDNJy/8Rh9JY5Dftp0X+XNNvDO2/i9M69e5yzwzw
	FOdbsIoTKeD0Dd8h0UQh6ea3IH3RYgQLxO2yrDszUv1SL3nkM/Xr9SJX8ZMQfqv//YO9VQ+nhkIZD
	6PkmWs6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCh6u-0000000G3e4-0Bh2;
	Wed, 07 May 2025 15:55:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgb5-0000000FwwY-1cZV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 15:22:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6336722FC;
	Wed,  7 May 2025 08:22:00 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACFC43F58B;
	Wed,  7 May 2025 08:22:08 -0700 (PDT)
Date: Wed, 7 May 2025 16:22:06 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, daniel.kiss@arm.com,
	david.spickett@arm.com, luis.machado@arm.com, maz@kernel.org,
	richard.sandiford@arm.com, sander.desmalen@arm.com,
	tabba@google.com, tamas.petz@arm.com, tkjos@google.com,
	yury.khrustalev@arm.com
Subject: Re: [PATCH 13/20] arm64/fpsimd: Make clone() compatible with ZA lazy
 saving
Message-ID: <aBt6nvRmk1O_easH@J2N7QTR9R3>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
 <20250506152523.1107431-14-mark.rutland@arm.com>
 <20250507145800.GC2475@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507145800.GC2475@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_082211_468882_F283781F 
X-CRM114-Status: GOOD (  21.28  )
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

On Wed, May 07, 2025 at 03:58:01PM +0100, Will Deacon wrote:
> On Tue, May 06, 2025 at 04:25:16PM +0100, Mark Rutland wrote:
> > @@ -441,14 +449,39 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> >  				childregs->sp = stack_start;
> >  		}
> >  
> > +		/*
> > +		 * Due to the AAPCS64 "ZA lazy saving scheme", PSTATE.ZA and
> > +		 * TPIDR2 need to be manipulated as a pair, and either both
> > +		 * need to be inherited or both need to be reset.
> > +		 *
> > +		 * Within a process, child threads must not inherit their
> > +		 * parent's TPIDR2 value or they may clobber their parent's
> > +		 * stack at some later point.
> > +		 *
> > +		 * When a process is fork()'d, the child must inherit ZA and
> > +		 * TPIDR2 from its parent in case there was dormant ZA state.
> > +		 *
> > +		 * Use CLONE_VM to determine when the child will share the
> > +		 * address space with the parent, and cannot safely inherit the
> > +		 * state.
> > +		 */
> > +		if (system_supports_sme()) {
> > +			if (!(clone_flags & CLONE_VM)) {
> > +				p->thread.tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);
> 
> Why do we need to re-read this register given that we did this just a few
> lines earlier?

Sorry -- I had meant to delete the earlier read. My intent was to centralise
manipulation of TPIDR2 (and ZA) in this block so that it was clear that they
were manipulated as a pair.

I will delete the earlier read, and make this:

| if (system_supports_sme()) {
| 	if (!(clone_flags & CLONE_VM)) {
| 		p->thread.tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);
| 		ret = copy_thread_za(p, current);
| 		if (ret)
| 			return ret;
| 	} else {
| 		p->thread.tpidr2_el0 = 0;
| 		WARN_ON_ONCE(p->thread.svcr & SVCR_ZA_MASK);
| 	}
| }

... or I can clear TPIDR2 in arch_dup_task_struct() along with ZA, delete the
earlier read here, and make this:

| if (system_supports_sme() && !(clone_flags & CLONE_VM)) {
| 	p->thread.tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);
| 	ret = copy_thread_za(p, current);
| 	if (ret)
| 		return ret;
| }

Any preference?

[...]

> > diff --git a/tools/testing/selftests/arm64/abi/tpidr2.c b/tools/testing/selftests/arm64/abi/tpidr2.c

> Thank you for updating the selftest, but please can you put it in a
> separate patch?

Sure; I'll factor all the selftest changes out into separate patches.

Mark.

