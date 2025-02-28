Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB80C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 12:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpTn5WvQbmVfa4udMCUUwuiCw2iOJ9q1CUbIwaSCf7c=; b=orpFtDAQGu0KQEW53FTeWGqPFc
	rR82jiS71WLuqI0QU8jN47aLm61CWs5CwpMJBkSvwQ3oqKlk2XNwPt9CMl++MjSd3ZfXG90rxXnI8
	P7dbojHENSmFeGlyQXfc5s/XGrmwljVpQRqaL6BWdVvzMGPUW11A4oIrG2rW0p6W1QaXSyQ4bw+so
	+FZ6vTvBRa/MLkgOSDpqQjkB+DH44oejHF4m2q2+4XV60Tda/fOcTYkihic64+NFV+6H5oTsCQJ0L
	WlOAGomeJ9i4zxoshmeZXI8Q9pVEHtObiwlprYgP6UwRSOzl9qvZxi078jT0geegqV2IcoRWy1ZqT
	9OJ63kSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnz3P-0000000ApcN-23wo;
	Fri, 28 Feb 2025 12:01:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyJM-0000000AiR1-2SLj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 11:13:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 597C41692;
	Fri, 28 Feb 2025 03:13:59 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C5973F673;
	Fri, 28 Feb 2025 03:13:42 -0800 (PST)
Date: Fri, 28 Feb 2025 11:13:39 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Leo Yan <leo.yan@arm.com>, linux-arm-kernel@lists.infradead.org,
	ahmed.genidi@arm.com, ben.horgan@arm.com, catalin.marinas@arm.com,
	kvmarm@lists.linux.dev, oliver.upton@linux.dev, will@kernel.org
Subject: Re: [PATCH 1/2] KVM: arm64: Initialize HCR_EL2.E2H early
Message-ID: <Z8GaY09Ly2-qVRM1@J2N7QTR9R3>
References: <20250227180526.1204723-1-mark.rutland@arm.com>
 <20250227180526.1204723-2-mark.rutland@arm.com>
 <20250228092955.GC2157064@e132581.arm.com>
 <86y0xqpfpj.wl-maz@kernel.org>
 <Z8GHclusYN3CX5m2@J2N7QTR9R3>
 <86v7supdzd.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86v7supdzd.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_031344_710094_1AC43BA0 
X-CRM114-Status: GOOD (  28.00  )
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

On Fri, Feb 28, 2025 at 10:20:38AM +0000, Marc Zyngier wrote:
> On Fri, 28 Feb 2025 09:52:50 +0000,
> Mark Rutland <mark.rutland@arm.com> wrote:
> > 
> > On Fri, Feb 28, 2025 at 09:43:20AM +0000, Marc Zyngier wrote:
> > > On Fri, 28 Feb 2025 09:29:55 +0000,
> > > Leo Yan <leo.yan@arm.com> wrote:
> > > > 
> > > > Hi Mark,
> > > > 
> > > > On Thu, Feb 27, 2025 at 06:05:25PM +0000, Mark Rutland wrote:
> > > > 
> > > > [...]
> > > > 
> > > > > +.macro init_el2_hcr	val
> > > > > +	mov_q	x0, \val
> > > > > +
> > > > > +	/*
> > > > > +	 * Compliant CPUs advertise their VHE-onlyness with
> > > > > +	 * ID_AA64MMFR4_EL1.E2H0 < 0. On such CPUs HCR_EL2.E2H is RES1, but it
> > > > > +	 * can reset into an UNKNOWN state and might not read as 1 until it has
> > > > > +	 * been initialized explicitly.
> > > > 
> > > > For ID_AA64MMFR4_EL1.E2H0 < 0 case, the code actually clears the
> > > > HCR_EL2.E2H bit.
> > > >
> > > > Hence, the comment should be corrected as: "... it can reset into an
> > > > UNKNOWN state and might not read as 0 until it has been initialized
> > > > explicitly".
> > > 
> > > The comment is just fine. It is the code that is wrong, as it avoids
> > > setting E2H when E2H0 < 0 while we want the exact opposite behaviour.
> > > 
> > > As a result, 'b.lt' really should be a 'b.ge'. Or the original code
> > > kept as is.
> > 
> > Ugh, yes. I got confused and got the condition backwards.
> > 
> > Either works. Using 'b.ge' is closer to my intention -- I found the
> > 'tbz' of the sign bit somewhat surprising and that needed a longer line
> > after the lable name changed.
> > 
> > Would you like me to respin, or would you be hapy to fix up when
> > applying?
> 
> I can fix it on the fly, but it needs retesting, as I don't understand
> how things could work in this state.

This happened to work by virtue of coincidence :/

Critically, I have not tested this on a CPU where HCR_EL2.E2H is
writeable but one polarity has no effect, as I don't have such a CPU to
hand. IIUC you tested that with hVHE under NV per commit:

  b3320142f3db9b3f ("arm64: Fix early handling of FEAT_E2H0 not being implemented")

... but I don't currently have a good setup to test that configuration.

In other cases, this largely falls out in the wash, e.g.

* On a CPU without E2H, where the HCR_EL2.E2H bit is implemented as
  RAZ/WI, the bit always reads as 0. Trying to set the bit has no
  effect. Later reads see 0.

  Hence this case happens to work.

* On a CPU with E2H and without FEAT_E2H0, where the HCR_EL2.E2H bit is
  implemented as RAO/WI, the bit always reads as 1. Trying to clear the
  bit has no effect. Later reads see 1.

  Hence this case happens to work.

* On a CPU with E2H and with FEAT_E2H0, there the HCR_EL2.E2H bit is
  implemented and has an effect, writing to the bit moves the CPU into
  E2H mode.

  The early boot code handles this the same as FEAT_E2H0 being absent,
  and so that happens to work. I haven't dug into how HCR_EL2 gets
  properly initialized later by KVM, but testing seems to indicate that
  this works.

Mark.

