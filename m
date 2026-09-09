Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF68C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZDvF9mi528xRDbkT0RZ9EfBD5t2cfkdz03k0WhiM1U=; b=YXxww7jLKhTFKoCvsAsehrUz7/
	rG2h5HUWL0NpG1be52WT5i2Do8ropGvMsEp4kzIkzkkgyhC3h+K9XdLyYpWxaaX0Ab0VEl9WO7nrW
	Rmp+O22U2dGznbBwaKYikTL0eIaYXihLttVK4o33VE8WBD7oZ1H1NpDSBR2gtAR0NF2m1nG64tbMI
	+ZlOipDOerBk3aQDMFTjMhmqmroqn92ZZTJ26gCUnAaRXtTV0Ob7qmfOoMjwvhytIMnJnJZLrzYA/
	Ow3ro6zMv7d2AaCB5vy7k61Rbb/ccZQ+HATbfK7mZlnd1ls6Vc0OYz3mFTfRP6xFYonYzGPlw9Zyr
	qtj8chuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4I87-0000000BlNS-0x4j;
	Wed, 09 Sep 2026 13:14:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4I85-0000000BlMo-2kP5
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 13:14:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hZDvF9mi528xRDbkT0RZ9EfBD5t2cfkdz03k0WhiM1U=; b=ihU8Daeub9rsgC1qoX+WTtPoIy
	fGW9+56Jy0DAiYbKW589aYu0OIa8wTURggq0eNPMRoX8muggfbLlyQlrrWnA0AutBp41VzdycKmya
	p5KekcJHKana4W7F0pztyJ/xLJquUhIZOs2eoyCK8f6qgL6f5U5O8AAH7fhBjQTXvcwA/9QJh4sbP
	ZKr1fIVcF3l2vKVVzhnrB7Dl6Y5CH9hiDua1q0T3OmOsa4uka9s+SEmDDrtJ2AzLLcynG+dkXYthQ
	cKe13jtbaMTSWiHQHnWtckUCozHf+m8GSKgOjYdZ7kleKAwnm2Qmf2D/Jhyjsw1RvS8LJOuDQ8VAz
	8NV7IfcQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4I80-00000005gw5-13Hn;
	Wed, 09 Sep 2026 13:14:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C8588300A9A; Wed, 09 Sep 2026 15:14:15 +0200 (CEST)
Date: Wed, 9 Sep 2026 15:14:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
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
Message-ID: <20260909131415.GB4120091@noisy.programming.kicks-ass.net>
References: <20260909062649.469633-1-arighi@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909062649.469633-1-arighi@nvidia.com>
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

On Wed, Sep 09, 2026 at 08:26:07AM +0200, Andrea Righi wrote:

> Andrea Righi (2):
>       arm64: topology: Prefer PE0 on NVIDIA Olympus SMT cores
>       sched/fair: Honor asymmetric SMT priority in idle selection
> 
>  arch/arm64/include/asm/topology.h |  1 +
>  arch/arm64/kernel/smp.c           |  1 +
>  arch/arm64/kernel/topology.c      | 51 +++++++++++++++++++++++
>  kernel/sched/fair.c               | 85 +++++++++++++++++++++++++++++++--------
>  kernel/sched/sched.h              |  6 +++
>  kernel/sched/topology.c           | 36 +++++++++++++++++
>  6 files changed, 163 insertions(+), 17 deletions(-)

I tentatively picked these up, but I need an arm64 ack before I can
merge them, and ideally vingu will bless them too :-)

