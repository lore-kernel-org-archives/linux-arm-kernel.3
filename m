Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4147C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XG3o1w38Z11NEPl9ofKBOXhZqOpeGIp2HSfZTPOFtyY=; b=EhhlW6MyKC/eliYyxRzeaj9V2d
	dw+HwAHjCpHrDQ0Iq/14tOb0j18Z5/nmwAyBhCMcRV3qLOe75ka0rW8YjGMK/HWBajsBLGk+tYmEk
	rNCYfmEEuS1IV7N12sC8nWUPO5AS6sAoW93mVEp60eTDMHRs0A7oOAaeJK8FaGeQLubbfr8Ai39Ak
	sgZyCjtQePAiMgh51wH9GXYdRtzQ1ASTzN5B87BHXxiujYRG1yKZF6b8iXPRYRv8ZR9lW5P14IZwx
	qsfOlAwrbNIjAM+DZJP+b4O8yP2a3VZST0+EmyjCfx/OECFX3Pt/F6ZPTtLzLUwLGKOcQnuh+VCQI
	ENhZepOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiXC-0000000GJ1t-0Y2U;
	Wed, 07 May 2025 17:26:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChN3-0000000G742-3JAY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 16:11:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DE4BCA4DB47;
	Wed,  7 May 2025 16:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1487BC4CEE2;
	Wed,  7 May 2025 16:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746634304;
	bh=HcoKpIOXrHbVzTQK8QiVg8ljhpcaLPeFrFIaFZvy5aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jq1VNKjV7A5l5Bq/Trn3C2b6fWd6He5Bd/iZ89b/ycvuWRHwx+3IRwPwEC9SZwBAi
	 FRicP1d4U++MYiqFe/lim+fQWNy9IRXpj8h7aWC9x5XnGNvj3DMyUBh9CK2c2WhWAY
	 rl8oFxY6MXZxViKWA+F9uBHCKoxAYpPnX4SxdsEXFfxSWDqBUKHvTAyAXdR82sEsch
	 CowMoKBWPvHrW3/bOWMcHuKhR+zVF+xTnA3U+856uR416MLHxmL9qFzIRSLzzL8fMt
	 uRMSv45a7PDD3oUOxXa8WFGl4Kcm8bhJZhIPN/FBzV1csH+kp9bAV3AUDAI+pOYf6g
	 iPItg2HHgGWEg==
Date: Wed, 7 May 2025 17:11:38 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, daniel.kiss@arm.com,
	david.spickett@arm.com, luis.machado@arm.com, maz@kernel.org,
	richard.sandiford@arm.com, sander.desmalen@arm.com,
	tabba@google.com, tamas.petz@arm.com, tkjos@google.com,
	yury.khrustalev@arm.com
Subject: Re: [PATCH 13/20] arm64/fpsimd: Make clone() compatible with ZA lazy
 saving
Message-ID: <20250507161137.GA2580@willie-the-truck>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
 <20250506152523.1107431-14-mark.rutland@arm.com>
 <20250507145800.GC2475@willie-the-truck>
 <aBt6nvRmk1O_easH@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBt6nvRmk1O_easH@J2N7QTR9R3>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_091145_955584_64D7835F 
X-CRM114-Status: GOOD (  23.58  )
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

On Wed, May 07, 2025 at 04:22:06PM +0100, Mark Rutland wrote:
> On Wed, May 07, 2025 at 03:58:01PM +0100, Will Deacon wrote:
> > On Tue, May 06, 2025 at 04:25:16PM +0100, Mark Rutland wrote:
> > > @@ -441,14 +449,39 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
> > >  				childregs->sp = stack_start;
> > >  		}
> > >  
> > > +		/*
> > > +		 * Due to the AAPCS64 "ZA lazy saving scheme", PSTATE.ZA and
> > > +		 * TPIDR2 need to be manipulated as a pair, and either both
> > > +		 * need to be inherited or both need to be reset.
> > > +		 *
> > > +		 * Within a process, child threads must not inherit their
> > > +		 * parent's TPIDR2 value or they may clobber their parent's
> > > +		 * stack at some later point.
> > > +		 *
> > > +		 * When a process is fork()'d, the child must inherit ZA and
> > > +		 * TPIDR2 from its parent in case there was dormant ZA state.
> > > +		 *
> > > +		 * Use CLONE_VM to determine when the child will share the
> > > +		 * address space with the parent, and cannot safely inherit the
> > > +		 * state.
> > > +		 */
> > > +		if (system_supports_sme()) {
> > > +			if (!(clone_flags & CLONE_VM)) {
> > > +				p->thread.tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);
> > 
> > Why do we need to re-read this register given that we did this just a few
> > lines earlier?
> 
> Sorry -- I had meant to delete the earlier read. My intent was to centralise
> manipulation of TPIDR2 (and ZA) in this block so that it was clear that they
> were manipulated as a pair.
> 
> I will delete the earlier read, and make this:
> 
> | if (system_supports_sme()) {
> | 	if (!(clone_flags & CLONE_VM)) {
> | 		p->thread.tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);
> | 		ret = copy_thread_za(p, current);
> | 		if (ret)
> | 			return ret;
> | 	} else {
> | 		p->thread.tpidr2_el0 = 0;

If we context-switch here, can we end up reading the register value
back into the thread structure?

> | 		WARN_ON_ONCE(p->thread.svcr & SVCR_ZA_MASK);
> | 	}
> | }
> 
> ... or I can clear TPIDR2 in arch_dup_task_struct() along with ZA, delete the
> earlier read here, and make this:
> 
> | if (system_supports_sme() && !(clone_flags & CLONE_VM)) {
> | 	p->thread.tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);
> | 	ret = copy_thread_za(p, current);
> | 	if (ret)
> | 		return ret;
> | }
> 
> Any preference?

I don't mind, assuming they both work :)

Will

