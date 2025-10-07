Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5A4CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 10:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OR1ZNI7xZniIFINBZhpOOwoWD9ICoGcUC1OGrWuFc9Y=; b=CvIUbRgLjyYDPVFaH3z8TxZUm6
	iB4oJuuuD/IUhEXBvebXprNymJl4hUgJL4VXjnzcmWDyVz/BUVXuaDuRe4GkUqVuFxf0sC5weO/0x
	BHLwsTmF1FP1JqRV8ErOBeG6k8kqokp61sgKq11F16Iho3RRGtnr+V1PbknJF8gyAEakZBv6vUDo9
	XkI+PH53uQ1CPg2GcOOAR/sGr68p4WeI0jNA+qJXC1buOEcMS9dnRxn6Sgf1Hx6OoSkoDTSjzQuC9
	toqeogZR7cldTbs0sMEppLgTEJyjQ5V1TCD/SKEW9WonyVDuTitasu9miMQdAi3DFycsEK5sYBioZ
	pVluBTyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v64jo-00000001mky-3cgF;
	Tue, 07 Oct 2025 10:16:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v64jo-00000001mkm-1lWA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 10:16:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D597D601DC;
	Tue,  7 Oct 2025 10:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DCDDC4CEF1;
	Tue,  7 Oct 2025 10:16:05 +0000 (UTC)
Date: Tue, 7 Oct 2025 11:16:03 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] irqchip/gic-v5: Fix GIC CDEOI instruction encoding
Message-ID: <aOToY8dF07zPe9Bt@arm.com>
References: <20251006100758.624934-1-lpieralisi@kernel.org>
 <aOPEXEx-QRv7v9A5@arm.com>
 <aOPZqM2xGIrPJH/d@lpieralisi>
 <aOPfIgrxZaqzu-7s@arm.com>
 <aOTWJBETJDY4xFUh@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOTWJBETJDY4xFUh@lpieralisi>
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

On Tue, Oct 07, 2025 at 10:58:12AM +0200, Lorenzo Pieralisi wrote:
> On Mon, Oct 06, 2025 at 04:24:18PM +0100, Catalin Marinas wrote:
> > On Mon, Oct 06, 2025 at 05:00:56PM +0200, Lorenzo Pieralisi wrote:
> > > My only remark there is that even as the code in mainline stands with
> > > GCC, it is not very clear that we rely on implicit XZR generation to
> > > make sure the instruction encoding generated is correct - it looks
> > > like a bit of a stretch to reuse a sysreg write with immediate value == 0
> > > to generate a system instruction write with Rt == 0b11111, it works
> > > but it is a bit opaque or at least not straighforward to grok.
> > > 
> > > Obviously the patch below improves LLVM code generation too in the process.
> > > 
> > > I don't know what's best - I admit I am on the fence on this one.
> > 
> > My concern is other cases where we may rely on this, so we might as well
> > go with a generic approach than fixing each case individually. If that's
> > the only case, I'll leave it to you and Marc do decide whichever you
> > prefer.
> 
> I will take your patch - added comments and rewrote the log for v2, with
> your Suggested-by (did not give you authorship let me know if that's OK
> please).

That's absolutely fine.

> One thing to mention, I added a Fixes: tag that goes back to the initial
> GICv5 commit, I don't know whether it is fixing more than that, it does
> not look like by a quick grep through kernel code but I am not sure.

This would do. If we find other problems, we'll backport it.

-- 
Catalin

