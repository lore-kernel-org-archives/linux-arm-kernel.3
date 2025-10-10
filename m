Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB80CCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 09:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GK8Mu0dOKN2A8dIIKwqE0gGoWgS4hrPc7h6U+u7tbnA=; b=NFJahnPiPK8olI9RFXo7G+BsjR
	PqGVnCkxS8GGKMniEzyE6c+D5qVAMDJochj7Sxz6kfKZqv2l1wsHF4SBXWzkaYpmUMxZbW1ff8MLz
	+QolPFxryqeBhd2ukwDPBGhexIwiL5RmUj2fIIMg4P+6FPjslZAgziKHNEK158PmhjJvXm8CRjElL
	J1zCdNB3QDSfU38pFl5/lsqs3J1hT0azIGbEaq3d0E+BN4+lexvZJVHSWkE6DjfPxn902YHlqelsK
	kqyya795U5hcu3dvgcPFYgHipArdsuO4vS46HIXfA36eeXO6K3S1WrzNLq/uLzrxY8OOtKwtg/9pB
	EFK4eObQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v79qf-00000008D1q-0mUq;
	Fri, 10 Oct 2025 09:55:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v79qc-00000008D1Q-2MEK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 09:55:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB7471596;
	Fri, 10 Oct 2025 02:55:29 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82B7F3F66E;
	Fri, 10 Oct 2025 02:55:35 -0700 (PDT)
Date: Fri, 10 Oct 2025 10:55:32 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: smp: Implement cpus_has_pending_ipi()
Message-ID: <aOjYFBpeqj8sBHJ9@J2N7QTR9R3>
References: <20251003150251.520624-1-ulf.hansson@linaro.org>
 <20251003150251.520624-3-ulf.hansson@linaro.org>
 <865xcsyqgs.wl-maz@kernel.org>
 <CAPDyKFq4RgL0=hPhB0cwTQF-A+mXH8dxsZAYTB1CFuLxxxTujg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFq4RgL0=hPhB0cwTQF-A+mXH8dxsZAYTB1CFuLxxxTujg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_025538_660299_3D3CDAE3 
X-CRM114-Status: GOOD (  22.41  )
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

On Fri, Oct 10, 2025 at 10:30:11AM +0200, Ulf Hansson wrote:
> On Mon, 6 Oct 2025 at 17:55, Marc Zyngier <maz@kernel.org> wrote:
> > On Fri, 03 Oct 2025 16:02:44 +0100,
> > Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > To add support for keeping track of whether there may be a pending IPI
> > > scheduled for a CPU or a group of CPUs, let's implement
> > > cpus_has_pending_ipi() for arm64.
> > >
> > > Note, the implementation is intentionally lightweight and doesn't use any
> > > additional lock. This is good enough for cpuidle based decisions.
> > >
> > > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

> > > +bool cpus_has_pending_ipi(const struct cpumask *mask)
> > > +{
> > > +     unsigned int cpu;
> > > +
> > > +     for_each_cpu(cpu, mask) {
> > > +             if (per_cpu(pending_ipi, cpu))
> > > +                     return true;
> > > +     }
> > > +     return false;
> > > +}
> > > +
> >
> > The lack of memory barriers makes me wonder how reliable this is.
> > Maybe this is relying on the IPIs themselves acting as such, but
> > that's extremely racy no matter how you look at it.
> 
> It's deliberately lightweight. I am worried about introducing
> locking/barriers, as those could be costly and introduce latencies in
> these paths.

I think the concern is that the naming implies a precise semantic that
the code doesn't actually provide. As written and commented, this
function definitely has false positives and false negatives.

The commit message says "This is good enough for cpuidle based
decisions", but doesn't say what those decisions require nor why this is
good enough.

If false positives and/or false negatives are ok, add a comment block
above the function to mention that those are acceptable. Presumably
there's some boundary at which incorrectness is not acceptable (e.g. if
it's wrong 50% of the time), and we'd want to understand how we can
ensure that we're the right side of that boundary.

Mark.

