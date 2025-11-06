Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8F4CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 17:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/BnwF1273z4DQ2UGNBaZUlYBvA8681VyOTJBrneyQE=; b=V8fd8QSM15lg8CR6OoMnPqUMZI
	eVdAI5USeHrsllvSThciXfWvXox3nPrUmqms4yfoFdmlKq3Zn8HlKxZ6iUjiF/tJr/nrcNwW4CcxY
	q91QS8XK7lh38eAmMaQPf2jVbmEggJBRXmtWlfKvZvd7x1rpOLNrGdFQ5xcXsYsfMpvDc7y29Ftm8
	KwI7dpnqbhAPiEFRiKZiUP2jz5ASFt+6mb8RJB9/CgdU5SfXpNO4s+ljczL7K+CPXZnRdNkxW9G51
	dXLoXyHO1P91wK+2Q6aUU0VLkLJzBBS1r8gYmw9FYxzKSfv3v4nzROC8kcwb8TG2B5oGs+ELYodB/
	JuF+je5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH4C0-0000000G3ku-0swQ;
	Thu, 06 Nov 2025 17:54:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH4Bx-0000000G3kJ-2SBo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 17:54:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DDD4153B;
	Thu,  6 Nov 2025 09:54:26 -0800 (PST)
Received: from arm.com (RQ4T19M611-5.cambridge.arm.com [10.1.31.13])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A934F3F66E;
	Thu,  6 Nov 2025 09:54:33 -0800 (PST)
Date: Thu, 6 Nov 2025 17:54:31 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: paulmck@kernel.org, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <aQzg1_uxNfCK8_V_@arm.com>
References: <aQyqGxJVIybi7mJS@arm.com>
 <mhng-4170B7AB-3975-451A-A177-3798DB46182F@palmerdabbelt-mac>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-4170B7AB-3975-451A-A177-3798DB46182F@palmerdabbelt-mac>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_095437_717253_072A3DC7 
X-CRM114-Status: GOOD (  26.60  )
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

On Thu, Nov 06, 2025 at 08:30:05AM -0800, Palmer Dabbelt wrote:
> On Thu, 06 Nov 2025 06:00:59 PST (-0800), Catalin Marinas wrote:
> > On Wed, Nov 05, 2025 at 01:13:10PM -0800, Palmer Dabbelt wrote:
> > > I ran a bunch of cases with those:
> > [...]
> > > Which I'm interpreting to say the following:
> > > 
> > > * LL/SC is pretty good for the common cases, but gets really bad under  the
> > > pathological cases.  It still seems always slower that LDADD.
> > > * STADD has latency that blocks other STADDs, but not other CPU-local  work.
> > > I'd bet there's a bunch of interactions with caches and memory  ordering
> > > here, but those would all juts make STADD look worse so I'm  just ignoring
> > > them.
> > > * LDADD is better than STADD even under pathologically highly contended
> > > cases.  I was actually kind of surprised about this one, I thought the  far
> > > atomics would be better there.
> > > * The prefetches help STADD, but they don't seem to make it better that
> > > LDADD in any case.
> > > * The LDADD latency also happens concurrently with other CPU operations
> > > like the STADD latency does.  It has less latency to hide, so the  latency
> > > starts to go up with less extra work, but it's never worse  that STADD.
> > > 
> > > So I think at least on this system, LDADD is just always better.
> > 
> > Thanks for this, very useful. I guess that's expected in the light of I
> > learnt from the other Arm engineers in the past couple of days.
> 
> OK, sorry if I misunderstood you earlier.  From reading your posts I thought
> there would be some mode in which STADD was better -- probably high
> contention and enough extra work to hide the latency.  So I was kind of
> surprised to find these results.

I think STADD is better for cases where you update some stat counters
but you do a lot of work in between. In your microbenchmark, just lots
of STADDs back to back with NOPs in between (rather than lots of other
memory transactions) are likely to be slower. If these are real
use-cases, at some point the hardware may evolve to behave differently
(or more dynamically).

BTW, I've been pointed by Ola Liljedahl @ Arm at this collection of
routines: https://github.com/ARM-software/progress64/tree/master.
Building it with ATOMICS=yes makes the compiler generate LSE atomics for
intrinsics like __atomic_fetch_add(). It won't generate STADD because of
some aspects of the C consistency models (DMB LD wouldn't guarantee
ordering with a prior STADD).

-- 
Catalin

