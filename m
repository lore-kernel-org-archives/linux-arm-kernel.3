Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DE4C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtHXWPAh0KRA8SczolZ0xgY7fE+m4PGqg79MZ/iZMe4=; b=ELbwuZdlqAUDdm2Va/ACPgQnAf
	6ETPUqDSqoQlMJFrF812SSbr1kyJkUML/Ejmr2PyVr7MYsRlq5M8tn7WF9EOw3IlAiKmFEyXuY2Vm
	XFIMXv/5PwstiSF0ctYYjwWK7n7ZWnDtI8fs8MAo3gz5uF8S9WmR0igK9BfnmbYs2ClwriDg5gx68
	H10LNiP7Gt2vFkyIyqVoPMDKDe8NePGut2/BCQOwqQ6jcauF/keGhj6gj3hr3aeej9r0bMntAAWrk
	GqqfFMN0s7uYWtTcvUSx0/COiNFoTKI7f6jkEUWbxl/M17vPaoLk+HNGskefOz3X1tRmob2/k+jJ6
	De9DkwXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiq5-0000000GNsx-0QmD;
	Wed, 07 May 2025 17:45:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiSR-0000000GHG5-0kiD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 17:21:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5B2C16F2;
	Wed,  7 May 2025 10:21:11 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 489483F5A1;
	Wed,  7 May 2025 10:21:20 -0700 (PDT)
Date: Wed, 7 May 2025 18:21:18 +0100
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
Message-ID: <aBuWjj3warvfRf4b@J2N7QTR9R3>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
 <20250506152523.1107431-14-mark.rutland@arm.com>
 <20250507145800.GC2475@willie-the-truck>
 <aBt6nvRmk1O_easH@J2N7QTR9R3>
 <20250507161137.GA2580@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507161137.GA2580@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_102123_369361_387DC151 
X-CRM114-Status: GOOD (  26.95  )
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

On Wed, May 07, 2025 at 05:11:38PM +0100, Will Deacon wrote:
> On Wed, May 07, 2025 at 04:22:06PM +0100, Mark Rutland wrote:
> > On Wed, May 07, 2025 at 03:58:01PM +0100, Will Deacon wrote:
> > > On Tue, May 06, 2025 at 04:25:16PM +0100, Mark Rutland wrote:
> > > > @@ -441,14 +449,39 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> > > >  				childregs->sp = stack_start;
> > > >  		}
> > > >  
> > > > +		/*
> > > > +		 * Due to the AAPCS64 "ZA lazy saving scheme", PSTATE.ZA and
> > > > +		 * TPIDR2 need to be manipulated as a pair, and either both
> > > > +		 * need to be inherited or both need to be reset.
> > > > +		 *
> > > > +		 * Within a process, child threads must not inherit their
> > > > +		 * parent's TPIDR2 value or they may clobber their parent's
> > > > +		 * stack at some later point.
> > > > +		 *
> > > > +		 * When a process is fork()'d, the child must inherit ZA and
> > > > +		 * TPIDR2 from its parent in case there was dormant ZA state.
> > > > +		 *
> > > > +		 * Use CLONE_VM to determine when the child will share the
> > > > +		 * address space with the parent, and cannot safely inherit the
> > > > +		 * state.
> > > > +		 */
> > > > +		if (system_supports_sme()) {
> > > > +			if (!(clone_flags & CLONE_VM)) {
> > > > +				p->thread.tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);
> > > 
> > > Why do we need to re-read this register given that we did this just a few
> > > lines earlier?
> > 
> > Sorry -- I had meant to delete the earlier read. My intent was to centralise
> > manipulation of TPIDR2 (and ZA) in this block so that it was clear that they
> > were manipulated as a pair.
> > 
> > I will delete the earlier read, and make this:
> > 
> > | if (system_supports_sme()) {
> > | 	if (!(clone_flags & CLONE_VM)) {
> > | 		p->thread.tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);
> > | 		ret = copy_thread_za(p, current);
> > | 		if (ret)
> > | 			return ret;
> > | 	} else {
> > | 		p->thread.tpidr2_el0 = 0;
> 
> If we context-switch here, can we end up reading the register value
> back into the thread structure?

No; this is running in the context of the parent, and writing to the
child's task_struct, before the child is runnable. Nothing else is
concurrently reading or writing p->thread.tpidr2_el0.

In the case where we read the parent's TPIDR2 value, we ready the live
CPU register since that's switched eagerly in __switch_to() ->
tls_thread_switch(), and will not change under our feet.

> 
> > | 		WARN_ON_ONCE(p->thread.svcr & SVCR_ZA_MASK);
> > | 	}
> > | }
> > 
> > ... or I can clear TPIDR2 in arch_dup_task_struct() along with ZA, delete the
> > earlier read here, and make this:
> > 
> > | if (system_supports_sme() && !(clone_flags & CLONE_VM)) {
> > | 	p->thread.tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);
> > | 	ret = copy_thread_za(p, current);
> > | 	if (ret)
> > | 		return ret;
> > | }
> > 
> > Any preference?
> 
> I don't mind, assuming they both work :)

Cool; I'll go with the first option for now.

Mark.

