Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCCFE6B277
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 13:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxNQLV+YRr0JXxilPc5fJ8f0DhP1zrWW8wgGA+gouV0=; b=rcxNUslbhMd+oDyvjHSt/uH2mo
	EMlNcvSIMOhjEI66YqQG1ZkVsba/bYkolGBGSbA7S+Pjfb/ePpeDrtGaNW6PHaTS+QH3zwojTohKW
	wZLkTRTDkmHljexHppSbswF7us0YOkArJ6PY7YXWikQb6amIuw/jguvTeQoSTbqXs7I5OuAndFudr
	mZ1bheiUGo+WUpHaewF/z53DcvcQWk6NPZWpWoBysV3QTY1ZyEJfJMJ5QH+du1GcK/eZpN9+OSelU
	Bd6Fj56o27tG7rv3fqbbJM81Ms8l4y81qt6ZHKGvDkjej3O9d3FgejQMioHpviwTUATXzsWIgjeHj
	rTXf2xAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rNi-000000077gR-01zR;
	Fri, 01 Nov 2024 13:08:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rLL-000000077PD-2WAe
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 Nov 2024 13:05:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wxNQLV+YRr0JXxilPc5fJ8f0DhP1zrWW8wgGA+gouV0=; b=CorQ444b6BCP+SEckN9Q696yRA
	xrqYlYbKeJZ6jsNKHc+i8mYvWT5i+lQh6/r3GNtARy0TXJ8sOQ/pAMoGBPJxSCI6AWYvNbjfYuk+1
	emgMwnFhnUBrBhWXWa+H2PjOeQmNrkPTcOozEE9LNiUMZP5dXZc4J+Vvd4XaU4DmYneNg2j+qwRAT
	HLdMYE4NNCQXCjcKGqrInJakV3GsKHFCRdJtVNhP2NSULL05843lOv6xwX08zRaFtVaMDmUkw6z1z
	vzd14Xx84ebVv0/I+QVT4t9UG6bzTJxm7TwDRtjzIUrGkqcMJK8I0eArM/RmnMY4JmINpGYUWgkaV
	jqdpgu5w==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rLJ-0000000AgVs-0r8r;
	Fri, 01 Nov 2024 13:05:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 952F1300599; Fri,  1 Nov 2024 14:05:31 +0100 (CET)
Date: Fri, 1 Nov 2024 14:05:31 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Cristian Prundeanu <cpru@amazon.com>
Cc: "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	linux-tip-commits@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bjoern Doebel <doebel@amazon.com>,
	Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>,
	Geoff Blake <blakgeof@amazon.com>, Ali Saidi <alisaidi@amazon.com>,
	Csaba Csoma <csabac@amazon.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [PATCH 0/2] [tip: sched/core] sched: Disable PLACE_LAG and
 RUN_TO_PARITY and move them to sysctl
Message-ID: <20241101130531.GW9767@noisy.programming.kicks-ass.net>
References: <ZxuujhhrJcoYOdMJ@BLRRASHENOY1.amd.com>
 <20241029045749.37257-1-cpru@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029045749.37257-1-cpru@amazon.com>
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

On Mon, Oct 28, 2024 at 11:57:49PM -0500, Cristian Prundeanu wrote:

> My testing with SCHED_BATCH is meanwhile concluded. It did reduce the 
> regression to less than half - but only with WAKEUP_PREEMPTION enabled. 
> When using NO_WAKEUP_PREEMPTION, there was no performance change compared 
> to SCHED_OTHER.

Because BATCH affects wakeup-preemption, and if there isn't any ever, it
makes no difference.

A BATCH task will not preempt another BATCH task, the only thing driving
preemption is slice exhaustion -- and we can now set slice per task to
match with the 'work' cycle.

> (At the risk of stating the obvious, using SCHED_BATCH only to get back to 
> the default CFS performance is still only a workaround,

It is not really -- it is impossible to schedule all the various
workloads without them telling us what they really like. The quest is to
find interfaces that make sense and are implementable. But fundamentally
tasks will have to start telling us what they need. We've long since ran
out of crystal balls.

