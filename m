Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B496C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 21:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYuwB6DL5qoXxnem2Sh49UaLWIq/5mk6bF4glzH7dyA=; b=hZ6SQHbIOea+kOgS6QHDqfCVmH
	xhzZ60KXBBRVbgTit7P8V5PLU9paqI3/rqUVTaIyN7vRvpYMDMpZLuCfCARpmko+ytiZ5sAoUcHH0
	eOwaUjA2DERz35LJJC1EmNz50krFA0w1VfmePYHRzVkqNcczfAJa/C35t9DcKqqgmd7QvnPNZKOhg
	rcON1sz93+qoliqNa1w9hAt0iU2eplf/eVgjNqI3j/K7TCSGXq1KPMWg4fUfkrkXvo9HVXJ68V8T8
	Wlp+ZQAhRDdjFywkYiXGhwbH9WYxDIZYs2iofOLn9GsHijKFvjy5rTvjih55k1RthtAR8y+KYFWSC
	uUHczOow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QCT-0000000Cwlx-3MuD;
	Wed, 09 Sep 2026 21:51:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QCQ-0000000Cwl6-1Cdk
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 21:51:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DYuwB6DL5qoXxnem2Sh49UaLWIq/5mk6bF4glzH7dyA=; b=aWbMEsGXXdzPU/bx+iCtaVcm8e
	nRg2aqSvGS3f4uve5u3Ke2K4GEO+BE93YcSEFve6tsM7QLcgvDpPg/q4wx8Im5J1Mwy/pLJx9g9pS
	jgROHSedbRoJ6EqqhPXHI1qFLxlIskGJeoGXTY54fo+jKQfS0+MahJzA5uTyrrnLgFBuailVAOylH
	j5lGomeixCyu8vSf0Z7F8fv/bZnKXIKpVjv9gpFYYUPHPZ64RfMdnL6R67s/YIcx5SO50G4DOHDBy
	YJ40ynKuYYisOAFmRlgPyWKvxjM7E02SVl05cWmTFCWWpxZM2RoGW+A5qeplnqiXqgY8EPx2pCEpB
	mqjJlybg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QCM-0000000A1ca-3w9W;
	Wed, 09 Sep 2026 21:51:19 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 016EE300A9A; Wed, 09 Sep 2026 23:51:17 +0200 (CEST)
Date: Wed, 9 Sep 2026 23:51:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Will Deacon <will@kernel.org>
Cc: Andrea Righi <arighi@nvidia.com>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] sched: Enable preferred SMT siblings on NVIDIA
 Olympus
Message-ID: <20260909215117.GO776954@noisy.programming.kicks-ass.net>
References: <20260909062649.469633-1-arighi@nvidia.com>
 <20260909131415.GB4120091@noisy.programming.kicks-ass.net>
 <aqF84So9WUQCDgsz@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqF84So9WUQCDgsz@willie-the-truck>
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

On Wed, Sep 09, 2026 at 04:36:01PM +0100, Will Deacon wrote:
> On Wed, Sep 09, 2026 at 03:14:15PM +0200, Peter Zijlstra wrote:
> > On Wed, Sep 09, 2026 at 08:26:07AM +0200, Andrea Righi wrote:
> > 
> > > Andrea Righi (2):
> > >       arm64: topology: Prefer PE0 on NVIDIA Olympus SMT cores
> > >       sched/fair: Honor asymmetric SMT priority in idle selection
> > > 
> > >  arch/arm64/include/asm/topology.h |  1 +
> > >  arch/arm64/kernel/smp.c           |  1 +
> > >  arch/arm64/kernel/topology.c      | 51 +++++++++++++++++++++++
> > >  kernel/sched/fair.c               | 85 +++++++++++++++++++++++++++++++--------
> > >  kernel/sched/sched.h              |  6 +++
> > >  kernel/sched/topology.c           | 36 +++++++++++++++++
> > >  6 files changed, 163 insertions(+), 17 deletions(-)
> > 
> > I tentatively picked these up, but I need an arm64 ack before I can
> > merge them, and ideally vingu will bless them too :-)
> 
> We've had five versions of this in five minutes, but the arch code is
> pretty filthy tbh. Detecting topology based on MIDR is a non-starter,
> sorry.

Yeah, Andrea is a wee bit fast with re-posting. I'll drop this, no
worries.

