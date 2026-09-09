Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C671C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xL4GWNyZy2EEYdBhSmnDddwtNaFG49DB7p0/uhH7nuA=; b=pYOCCzX8LrGswVl3z+RhyQM1+E
	/cavmAodVYhm7HT/Olelu3J4skkVnLoyw6lBwZeFVxssbZK2F1QZM+maGuMM0/eDD3aWzRo3tYgRG
	A/gKqjqhUMxvaZ9UXCE8x3tV86YH5yWZBay+k4ASC/TY7KfyRISC61La+dWlbt4GWux/fksRwfYl8
	07QPNL/NVU0+cYLaNP+NJGpSwpyimpN7PORqvL9hjyIEyDrjo5HJ5fkeQEt10+Z6mc/vLs5OXzRKB
	0xxJClolE+hhfJYyPRYlNpyom+0Y8TCx8if9NfoL37FdyzNmf11B0Og8Z7AcCtTRiHC7NYaJ1C1pE
	k26h85Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KLL-0000000CBjT-0oF4;
	Wed, 09 Sep 2026 15:36:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KLJ-0000000CBj3-1EgO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 15:36:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 97825600CB;
	Wed,  9 Sep 2026 15:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7527A1F00A3A;
	Wed,  9 Sep 2026 15:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788968168;
	bh=xL4GWNyZy2EEYdBhSmnDddwtNaFG49DB7p0/uhH7nuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Md1ebTiocQTMrxL598KX8+yXuKfpi2/4t9URltTQztmgYTDkmpXWohsCheUd6M8n+
	 TCetYdf3jyIRwqDonImBJt7CVh5ix1jItm4hWLEABmfRVyHia67NHfxc3dPm8PzzHZ
	 hoYnMJ2FwHjDldUl1z76houFfC/n+zftd1Uyl1CpBQFdfmDmb+1NtURXUEphvDTQkt
	 7YJzDYM5A2MdQND27l1lUalH+9VMWGz08GLswndGMgSSqOlZXwsb8oI/vnfrrvGJOw
	 yIE86kDbAhAUhhV9YzXvX8nlh1ewMBtNYFg0k+nXikV05lrhFPE0Ydbt7L1GU9w66Y
	 s0Auah+XgnIEg==
Date: Wed, 9 Sep 2026 16:36:01 +0100
From: Will Deacon <will@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
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
Message-ID: <aqF84So9WUQCDgsz@willie-the-truck>
References: <20260909062649.469633-1-arighi@nvidia.com>
 <20260909131415.GB4120091@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909131415.GB4120091@noisy.programming.kicks-ass.net>
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

On Wed, Sep 09, 2026 at 03:14:15PM +0200, Peter Zijlstra wrote:
> On Wed, Sep 09, 2026 at 08:26:07AM +0200, Andrea Righi wrote:
> 
> > Andrea Righi (2):
> >       arm64: topology: Prefer PE0 on NVIDIA Olympus SMT cores
> >       sched/fair: Honor asymmetric SMT priority in idle selection
> > 
> >  arch/arm64/include/asm/topology.h |  1 +
> >  arch/arm64/kernel/smp.c           |  1 +
> >  arch/arm64/kernel/topology.c      | 51 +++++++++++++++++++++++
> >  kernel/sched/fair.c               | 85 +++++++++++++++++++++++++++++++--------
> >  kernel/sched/sched.h              |  6 +++
> >  kernel/sched/topology.c           | 36 +++++++++++++++++
> >  6 files changed, 163 insertions(+), 17 deletions(-)
> 
> I tentatively picked these up, but I need an arm64 ack before I can
> merge them, and ideally vingu will bless them too :-)

We've had five versions of this in five minutes, but the arch code is
pretty filthy tbh. Detecting topology based on MIDR is a non-starter,
sorry.

Will

