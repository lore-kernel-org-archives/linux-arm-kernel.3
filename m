Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE24CC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 09:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+ao5jQJ1R7PTJfrrw1EpttxvTi/GDyKDdBxqcsCbU8=; b=HU6vbueZBU9h8AWCzx+SQAk76B
	4ef/NA462xlObBYN2hDEX8m2zFVyTMKpOJ6uDDNimhRiR1Fdqk/rn4sYklbRtbBc01PpVcFVFN2xU
	BoLm9rcNPRe/OqA2YS5HPCIfsa9b6cA7oK1lyJDvssV4XSvPlQV8DnZICUuB0uvvtvD7ck1O+tY4p
	OmRsxKGkqsSmgpv4ivs3ATD8nGghh4ZJBib7JcMhpSNb2ePtIOZQPfVxKD8+Gs+th5PbgczkGK1RT
	Z+gH/Ivbooqkm/N0YwW0F4BmQWm75+Lg3+4pcs2J0jE/NIlN/bUrgoyRvc77GhQGOiMrJfoNbX8X5
	c8JL2rdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMOEa-0000000Aaht-46gK;
	Tue, 03 Jun 2025 09:47:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMOCI-0000000Aa8I-3JXt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 09:44:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BA5312FC;
	Tue,  3 Jun 2025 02:44:25 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 013613F5A1;
	Tue,  3 Jun 2025 02:44:39 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:44:35 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH] arm64/trap: fix broken ct->nmi_nesting when die() is
 called in a kthread
Message-ID: <aD7EA2Bmp-mrWZaN@J2N7QTR9R3.cambridge.arm.com>
References: <20250530092723.3307630-1-yeoreum.yun@arm.com>
 <20250602124738.GD1227@willie-the-truck>
 <aD27GxSWsFekORcy@e129823.arm.com>
 <aD2_Jp7CQgnp15Kx@J2N7QTR9R3>
 <aD3kfTx8sF8/Yar/@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD3kfTx8sF8/Yar/@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_024442_915290_F1DD6A3A 
X-CRM114-Status: GOOD (  28.56  )
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
Cc: linux-arm-kernel@lists.infradead.org, ptosi@google.com, pcc@google.com, catalin.marinas@arm.com, bigeasy@linutronix.de, linux-kernel@vger.kernel.org, joey.gouly@arm.com, mcgrof@kernel.org, broonie@kernel.org, geert@linux-m68k.org, kristina.martsenko@arm.com, james.morse@arm.com, Will Deacon <will@kernel.org>, rppt@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Jun 02, 2025 at 06:50:53PM +0100, Yeoreum Yun wrote:
> > One of the reasons we treak BRK as an NMI is that exception entry for
> > BRK will leave all DAIF bits set, whereas schedule() should be called
> > with debug and SError unmasked (but IRQ+FIQ masked). Generally, calling
> > ct_nmi_enter() prevents preemption (and hence calls to schedule()).
> 
> I think ct_nmi_enter() doesn't prevents preemption but
> debug_exception_enter() disables preemption.

Yep, sorry for the confusion there. I had erroneously pattern-matched on
the nmi_nesting values and I had confused that with the similar
manipulation of the preempt count.

> > Another is that we may have a BUG() or WARN() in entry code where the
> > task could be in an inconsistent state, and we need to treat the
> > exception like an NMI to avoid consuming that inconsistent state.
> 
> So, let's think the "inconsistent" state like:
>   -> el0_enter()
> 	  -> enter_from_user_mode()
> 		  -> before update ct_state (context_tracking.state), call BUG()/WARN()
> 			  -> el1_dbg()
> 
> It need to call ct_nmi_enter() in el1_dbg() right?

Yes. The critical things are that RCU may not be watching, and all other
entry accounting may be in an intermediate/inconsistent state, since the
BUG()/WARN() could be anywhere in that C code. Currently that means we
must call ct_nmi_enter().

The other problem to bear in mind is that we don't have a way to
distinguish these BUG()/WARN() cases from others throughout the kernel,
which is why we currently unconditionally treat this as an NMI entry.

> > To handle that properly, we need to:
> >
> > (a) Figure out what to do with entry code. Last I looked I was under the
> >     impression that x86 either didn't have a problem here, or simply
> >     ignored it.
> 
> TBH, in above case, x86 seems context_traking.state will be broken...

That's certainly possible, that was the impression I had last time I
looked, but I haven't looked at this in detail for a short while, and I
may have missed something.

> > (b) Handle BUG/WARN traps separately from other BRKs, such that we can
> >     use local_daif_inherit(), and treat this as a special function call
> >     rather than an NMI.
> >
> > (c) Somehow teach make_task_dead() to handle the case where DAIF.D
> >     and/or DAIF.A are set. Most likely we simply have to panic() here,
> >     as with BUG() in interrupt context.
> 
> Right... It should handle for DAIF.D and DAIF.A bits...

Yes.

[...]

> > As-is, I think an extra warning in the case of a BUG() is fine given
> > the larger functional issues.
> >
> > I do not think this patch is correct as-is.
> 
> So, what I think:
>   1. arm64_enter_el1_dbg() should ct_nmi_enter() as it is.
>   2. in bug_handler() while handling BUG_TYPE, add above ct_nmi_exit()
>      conditional call.
>   3. DAIF.D and DAIF.A handling.

No, that is not safe. In step 2, calling ct_nmi_exit() would undo *all*
of the ct_nmi_enter() logic, and may stop RCU from watching if the
exception was entered from some intermediate/inconsistent state.

If we want to change anything now, it should be the DAIF.DA handling,
but even for that I'm not sure what the best approach is, and that'll
require some changes to core code.

Please leave this as-if for now.

Mark.

