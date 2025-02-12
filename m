Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD75C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEALg1IGx6/LckpOQHDyFWyXlK0VFMy3UaS9Vl8dN20=; b=1oUb38Uw7tHk0If5OpBgVQfd6u
	Gk2tDAJnCyRGVq2woFBMOo8tZyOgjk3Q3JJyPSmhD7eucZVxMXd9EHasbU9MiRwIS6zj1ib+NSfbI
	t+5ZXGaWjWLPXLX+UosMBUuaS+XWLtS2dKs4CqFAP91qUSTh3jBZV+ix6UmjRGP+zjb7IWVr49Aal
	RMYSztsPu3esQVps9sMp+PCkPbN6W+t4wfzAS023OyW1FXMjlMHyVa6ZUdfC8WB6EyFx+waxAGAMj
	xINsNqV/s/kIiFnN1IzyXzJNGCQo004g6Cd3l9uVjTpRW0eX7+kSqOy9ISGBZhj3GroXgHhrme2s4
	0A0D5vcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9Y6-00000006tqR-1nn5;
	Wed, 12 Feb 2025 10:00:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9BN-00000006oPG-42PI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Feb 2025 09:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HEALg1IGx6/LckpOQHDyFWyXlK0VFMy3UaS9Vl8dN20=; b=WvUfhgYz5XWHXsspF+k3YI8aZ3
	Ex1OmuY1woiRJBeky/G9aVU6xWErS6aj+eDCxkrGzdLnr7WP2AikaGyY9ZdqKHKt98eolDfwI+ZJn
	e1UVj+K3kYJqRHTWWjTDZou/zlw5NpYotKiFCVgCVSIl8KvVdKjysmc+pCfit/jln3RSRvLiOuGjY
	45i8k4eJHxYTY+bYQVU882JiQ6bDm1w/29XxLY0tokFHs9dR8s7QtyCpLE5G1usTCLm7nQMxduXAX
	g32qE61Zjx0/xVSjOcoyVad7nWD9LXMcK5/6ay5invyY/zSSP0Hn515KxVwoKyhcWjJR4jRdMoKzg
	61t7SDlg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9BL-00000004AIA-0oYB;
	Wed, 12 Feb 2025 09:37:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8F84E300318; Wed, 12 Feb 2025 10:37:21 +0100 (CET)
Date: Wed, 12 Feb 2025 10:37:21 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Cristian Prundeanu <cpru@amazon.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
	Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>,
	Ali Saidi <alisaidi@amazon.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Geoff Blake <blakgeof@amazon.com>, Csaba Csoma <csabac@amazon.com>,
	Bjoern Doebel <doebel@amazon.com>,
	Gautham Shenoy <gautham.shenoy@amd.com>,
	Joseph Salisbury <joseph.salisbury@oracle.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2] [tip: sched/core] sched: Move PLACE_LAG and
 RUN_TO_PARITY to sysctl
Message-ID: <20250212093721.GA24784@noisy.programming.kicks-ass.net>
References: <20250119110410.GAZ4zcKkx5sCjD5XvH@fat_crate.local>
 <20250212053644.14787-1-cpru@amazon.com>
 <20250212091711.GA19118@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212091711.GA19118@noisy.programming.kicks-ass.net>
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

On Wed, Feb 12, 2025 at 10:17:11AM +0100, Peter Zijlstra wrote:
> On Tue, Feb 11, 2025 at 11:36:44PM -0600, Cristian Prundeanu wrote:
> > Replacing CFS with the EEVDF scheduler in kernel 6.6 introduced
> > significant performance degradation in multiple database-oriented
> > workloads. This degradation manifests in all kernel versions using EEVDF,
> > across multiple Linux distributions, hardware architectures (x86_64,
> > aarm64, amd64), and CPU generations.
> > 
> > Testing combinations of available scheduler features showed that the
> > largest improvement (short of disabling all EEVDF features) came from
> > disabling both PLACE_LAG and RUN_TO_PARITY.
> > 
> > Moving PLACE_LAG and RUN_TO_PARITY to sysctl will allow users to override
> > their default values and persist them with established mechanisms.
> 
> Nope -- you have knobs in debugfs, and that's where they'll stay. Esp.
> PLACE_LAG is super dodgy and should not get elevated to anything
> remotely official.

Just to clarify, the problem with NO_PLACE_LAG is that by discarding
lag, a task can game the system to 'gain' time. It fundamentally breaks
fairness, and the only reason I implemented it at all was because it is
one of the 'official' placement strategies in the original paper.

But ideally, it should just go, it is not a sound strategy and relies on
tasks behaving themselves.

That is, assuming your tasks behave like the traditional periodic or
sporadic tasks, then it works, but only because the tasks are limited by
the constraints of the task model.

If the tasks are unconstrained / aperiodic, this goes out the window and
the placement strategy becomes unsound. And given we must assume
userspace to be malicious / hostile / unbehaved, the whole thing is just
not good.

It is for this same reason that SCHED_DEADLINE has a constant bandwidth
server on top of the earliest deadline first policy. Pure EDF is only
sound for periodic / sporadic tasks, but we cannot assume userspace will
behave themselves, so we have to put in guard-rails, CBS in this case.


