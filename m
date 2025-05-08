Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83140C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 12:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frV4+yL+39Z7d7LWXo4i6UCorNZ49yYCFq4u4bGbi7M=; b=WP/dOsDcCz09vWOGDnuDH7i2Cb
	hEDSfQX2+L9iv6v2UG1JY/scXUS8db+L3/weaqkUm1wod2onh9+weMO9Hr7es4okoQ/E48A91a78d
	UHSvazmapGq0fivdtFGq7avmTiC9DEqsJRHany5tdQ4y3D3hbcZJf/mjCtIOUQS+XlVkJS7C9Lo3m
	PKr1GFKM2QTirsjb8bqGuk/bp9ltykoZW2C5L3xTyHeP0q6c8J5mpifbTXHw0CxhQCMf3ouGzf/Kd
	Yp8dbZjgE/ep1Jj07h2r5iv9/tMThCGS8i9frkr82TR5xTziw/uIt9Z2k7E0k/DvETPLsm5rPqpmn
	ukhIS1EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0An-00000000Zft-0sMr;
	Thu, 08 May 2025 12:16:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD079-00000000ZJ8-1MmK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 12:12:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C27D0106F;
	Thu,  8 May 2025 05:12:23 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1867E3F5A1;
	Thu,  8 May 2025 05:12:31 -0700 (PDT)
Date: Thu, 8 May 2025 13:12:27 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, daniel.kiss@arm.com,
	david.spickett@arm.com, luis.machado@arm.com, maz@kernel.org,
	richard.sandiford@arm.com, sander.desmalen@arm.com,
	tabba@google.com, tamas.petz@arm.com, tkjos@google.com,
	yury.khrustalev@arm.com
Subject: Re: [PATCH 19/20] arm64/fpsimd: ptrace: Gracefully handle errors
Message-ID: <aByfq6i2fPv3sDzH@J2N7QTR9R3.cambridge.arm.com>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
 <20250506152523.1107431-20-mark.rutland@arm.com>
 <20250507163242.GD2580@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507163242.GD2580@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_051235_410623_B8610EE7 
X-CRM114-Status: GOOD (  23.14  )
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

On Wed, May 07, 2025 at 05:32:43PM +0100, Will Deacon wrote:
> On Tue, May 06, 2025 at 04:25:22PM +0100, Mark Rutland wrote:
> > Within sve_set_common() we do not handle error conditions correctly:
> > 
> > * When writing to NT_ARM_SSVE, if sme_alloc() fails, the task will be
> >   left with task->thread.sme_state==NULL, but TIF_SME will be set and
> >   task->thread.fp_type==FP_STATE_SVE. This will result in a subsequent
> >   null pointer dereference when the task's state is loaded or otherwise
> >   manipulated.
> > 
> > * When writing to NT_ARM_SSVE, if sve_alloc() fails, the task will be
> >   left with task->thread.sve_state==NULL, but TIF_SME will be set,
> >   PSTATE.SM will be set, and task->thread.fp_type==FP_STATE_FPSIMD.
> >   This is not a legitimate state, and can result in various problems,
> >   including a subsequent null pointer dereference and/or the task
> >   inheriting stale streaming mode register state the next time its state
> >   is loaded into hardware.
> > 
> > * When writing to NT_ARM_SSVE, if the VL is changed but the resultign VL
> >   differs from that in the header, the task will be left with TIF_SME
> >   set, PSTATE.SM set, but task->thread.fp_type==FP_STATE_FPSIMD. This is
> >   not a legitimate state, and can result in various problems as
> >   described above.
> > 
> > Avoid these problems by allocating memory earlier, and by changing the
> > task's saved fp_type to FP_STATE_SVE before skipping register writes due
> > to a change of VL. To make this simpler I've pulled the flushing of task
> > state earlier and moved the setting of TIF_SVE earlier -- this will be
> > cleared when loading FPSIMD-only state, and so moving this has no
> > resulting functional change.
> 
> Doesn't flushing the state earlier mean that passing a count smaller than
> the header size is now potentially destructive to the fpsimd state?

Sorry, this is poorly worded, and I will go rewrite this for clarity.

There are two key things to bear in mind:

(1) In patch 5 ("arm64/fpsimd: ptrace: Consistently handle partial
    writes to NT_ARM_(S)SVE"), sve_set_common() was changed to always
    zero state first, so that's *always* destructive.

(2) Here, "flush" is referring to the poorly named which detaches a task
    from live/stale state on any CPU, and does not modify the saved
    state in any way. For the ptrace set_*() functions, we know that the
    tracee is blocked (and its state has already been saved), so calling
    that earlier doesn't result in any functional change.

> > When changlnig the
> 
> This ends mid-sentence and 'changlnig' sounds like a Doors tune.

I've deleted this (and fix the "resultign" typo above).

Mark.

