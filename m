Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277B4CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 08:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zDd+tgEzJ8FD2/6I7c4yt842rv6yCjpqDn9OARxio8I=; b=icqZ2O1gvP0O1falXn3eyoKifu
	25U3LbKg6yb492oLdCY6GLmOU7TJt6japAcMal7NbGlvuHMw6/eb9MytgOe54MBapI14F9giC9Gsd
	ylENIypBkIeD7Hia7j4U3ow8v0oJnsfGP+lUM2eHnW6LbbHyHVgDnV5D8Ub3x/IYPXZwUH+U2kbG5
	xpBwelgP5oE0qSwPaMpevx12z0LbhCfOdmCq4+dJY16RnU1uXYwVO/mMbHxIQjzWZJ5T8k+a9Q2Ae
	Zi3vWhd0xum4I3rQsDiOz+Y1hry9cGFJCKED/cPViidv/XeXhbY8L/HqtYh4lAwvlVeWzSqxqb9hN
	ITqZvdDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v63WY-00000001ePt-2Vqp;
	Tue, 07 Oct 2025 08:58:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v63WX-00000001ePF-0LQY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 08:58:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 42DB760147;
	Tue,  7 Oct 2025 08:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 141DBC4CEF7;
	Tue,  7 Oct 2025 08:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759827499;
	bh=NT6pCgWJouBWI8k6FBlAG/a1lpdejxjoaWoToJyIVEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qEuSauHww9lo8O3TWII4agFp4kmEaLEWD3PpAYB02hcjb8nGi0wCjFvNnb170OkD8
	 Vku+sPfDq6l5fsr/f7qE+gpKDGZGMatJcJ/vytTcWfwKHd4swKncAklYuw3wRYCvt1
	 08a/78vUSW01VBkL93dRyWiVFHPalVOocLIL/Sp8r6g2/TjQnsclWnSjg3EpN1S480
	 VnqjQu/jq1PFvrW/RS3g7375W+kKKnJPW+uOTwTnFLf7Mx0GXBVsakf+vuUrSQRUsM
	 WZ7M79T8G+avXTUl8qMkJp3lf6h6SJYSQR2hRf3NNIHLf2oYTf11OhU+lssvjAxwT9
	 vmc47MDbr1bZQ==
Date: Tue, 7 Oct 2025 10:58:12 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] irqchip/gic-v5: Fix GIC CDEOI instruction encoding
Message-ID: <aOTWJBETJDY4xFUh@lpieralisi>
References: <20251006100758.624934-1-lpieralisi@kernel.org>
 <aOPEXEx-QRv7v9A5@arm.com>
 <aOPZqM2xGIrPJH/d@lpieralisi>
 <aOPfIgrxZaqzu-7s@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOPfIgrxZaqzu-7s@arm.com>
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

On Mon, Oct 06, 2025 at 04:24:18PM +0100, Catalin Marinas wrote:
> On Mon, Oct 06, 2025 at 05:00:56PM +0200, Lorenzo Pieralisi wrote:
> > On Mon, Oct 06, 2025 at 02:30:04PM +0100, Catalin Marinas wrote:
> > > On Mon, Oct 06, 2025 at 12:07:58PM +0200, Lorenzo Pieralisi wrote:
> > > > diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> > > > index 6455db1b54fd..6cf8c46ddde5 100644
> > > > --- a/arch/arm64/include/asm/sysreg.h
> > > > +++ b/arch/arm64/include/asm/sysreg.h
> > > > @@ -113,14 +113,14 @@
> > > >  /* Register-based PAN access, for save/restore purposes */
> > > >  #define SYS_PSTATE_PAN			sys_reg(3, 0, 4, 2, 3)
> > > >  
> > > > -#define __SYS_BARRIER_INSN(op0, op1, CRn, CRm, op2, Rt)			\
> > > > +#define __SYS_INSN(op0, op1, CRn, CRm, op2, Rt)				\
> > > >  	__emit_inst(0xd5000000					|	\
> > > >  		    sys_insn((op0), (op1), (CRn), (CRm), (op2))	|	\
> > > >  		    ((Rt) & 0x1f))
> > > >  
> > > > -#define SB_BARRIER_INSN			__SYS_BARRIER_INSN(0, 3, 3, 0, 7, 31)
> > > > -#define GSB_SYS_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 0, 31)
> > > > -#define GSB_ACK_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 1, 31)
> > > > +#define SB_BARRIER_INSN			__SYS_INSN(0, 3, 3, 0, 7, 31)
> > > > +#define GSB_SYS_BARRIER_INSN		__SYS_INSN(1, 0, 12, 0, 0, 31)
> > > > +#define GSB_ACK_BARRIER_INSN		__SYS_INSN(1, 0, 12, 0, 1, 31)
> > > >  
> > > >  /* Data cache zero operations */
> > > >  #define SYS_DC_ISW			sys_insn(1, 0, 7, 6, 2)
> > > > @@ -1075,7 +1075,6 @@
> > > >  #define GICV5_OP_GIC_CDDIS		sys_insn(1, 0, 12, 1, 0)
> > > >  #define GICV5_OP_GIC_CDHM		sys_insn(1, 0, 12, 2, 1)
> > > >  #define GICV5_OP_GIC_CDEN		sys_insn(1, 0, 12, 1, 1)
> > > > -#define GICV5_OP_GIC_CDEOI		sys_insn(1, 0, 12, 1, 7)
> > > >  #define GICV5_OP_GIC_CDPEND		sys_insn(1, 0, 12, 1, 4)
> > > >  #define GICV5_OP_GIC_CDPRI		sys_insn(1, 0, 12, 1, 2)
> > > >  #define GICV5_OP_GIC_CDRCFG		sys_insn(1, 0, 12, 1, 5)
> > > > @@ -1129,6 +1128,17 @@
> > > >  #define gicr_insn(insn)			read_sysreg_s(GICV5_OP_GICR_##insn)
> > > >  #define gic_insn(v, insn)		write_sysreg_s(v, GICV5_OP_GIC_##insn)
> > > >  
> > > > +/*
> > > > + * GIC CDEOI encoding requires Rt to be 0b11111.
> > > > + * gic_insn() with an immediate value of 0 cannot be used to encode it
> > > > + * because some compilers do not follow asm inline constraints in
> > > > + * write_sysreg_s() to turn an immediate 0 value into an XZR as
> > > > + * MSR source register.
> > > > + * Use __SYS_INSN to specify its precise encoding explicitly.
> > > > + */
> > > > +#define GICV5_CDEOI_INSN		__SYS_INSN(1, 0, 12, 1, 7, 31)
> > > > +#define gic_cdeoi()			asm volatile(GICV5_CDEOI_INSN)
> > > 
> > > Would something like this work? Completely untested (and build still
> > > going):
> > 
> > I tested the GIC CDEOI code generated with GCC/LLVM and it works.
> > 
> > My only remark there is that even as the code in mainline stands with
> > GCC, it is not very clear that we rely on implicit XZR generation to
> > make sure the instruction encoding generated is correct - it looks
> > like a bit of a stretch to reuse a sysreg write with immediate value == 0
> > to generate a system instruction write with Rt == 0b11111, it works
> > but it is a bit opaque or at least not straighforward to grok.
> > 
> > Obviously the patch below improves LLVM code generation too in the process.
> > 
> > I don't know what's best - I admit I am on the fence on this one.
> 
> My concern is other cases where we may rely on this, so we might as well
> go with a generic approach than fixing each case individually. If that's
> the only case, I'll leave it to you and Marc do decide whichever you
> prefer.

I will take your patch - added comments and rewrote the log for v2, with
your Suggested-by (did not give you authorship let me know if that's OK
please).

One thing to mention, I added a Fixes: tag that goes back to the initial
GICv5 commit, I don't know whether it is fixing more than that, it does
not look like by a quick grep through kernel code but I am not sure.

Thanks,
Lorenzo

