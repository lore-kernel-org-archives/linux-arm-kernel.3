Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EF1C56205
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 12:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ib/Ij7w0Dy6ao8A0RqFf47+bB4f4UpgPvkTYsD8YBIY=; b=UPZl06yMyGURZ1U/d1fmWmQapz
	j2wY3rgqBw1jz4ZOWKGtjY1KnVEzbrV6VuDfQON4BzP+6BDGBnJ6SqS2lAx8y3jMsB6WxeUiVuCyM
	uDk2pe7PAHM18S7tnJRJlyMRdLDrcGUbnkwCFt8NjgCKNcJLN4bMiSXHiJx74i/uDeGWsbLQA+jKv
	sFanMz84GkyrURf25TLrEhW4IFXkTkzQEKicJp2c+sXj78ipNjWM2Es3SX9Qcj2k4Dayrii963GhX
	0OBnDJLIZuzgzL7o1CK38uzGl16z3o5pzBcpyoBZz9mbQfCYiWaJ1u1bKyKATa1uGZ9DucEH+aio8
	Avhbk+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwoT-00000005hok-2rI8;
	Thu, 06 Aug 2026 12:03:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwoQ-00000005hoF-1o9h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 12:03:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06C4F153B;
	Thu,  6 Aug 2026 05:02:57 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89CED3F66F;
	Thu,  6 Aug 2026 05:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786017781; bh=Pes57n+6v17ZygtCGqVVA3yl7WFgtBkWoGseT7Oe42U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MV3n4NTgx9HTigR5cVdXwcPNeiaG+1rdIG24BewFcVMlSAIwTKvL6D0DQFZunbBCH
	 UXWI9N/29GOOa8TfR+8Ze7pmZGsLupvdF9pOOT+7mq5XM8spEqflVAp/4biOhhTwsc
	 u7z9MuA9JMEXH6pB8m4Y7hbneTmB42rsQ0LyWjCA=
Date: Thu, 6 Aug 2026 13:02:56 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH v2 13/20] arm64: percpu: Add infrastructure for
 preemptible this_cpu_*() ops
Message-ID: <anR38C1uTmU4WYhr@J2N7QTR9R3>
References: <20260804170503.3513916-1-mark.rutland@arm.com>
 <20260804170503.3513916-14-mark.rutland@arm.com>
 <7df18d5e-886e-43d1-b53d-52a1d08aba49@kernel.org>
 <d600d0db-5109-4386-9a49-955be74cc432@kernel.org>
 <anRuT1Psmar9mW5L@J2N7QTR9R3>
 <9c3feb9d-3111-4f37-90f7-3ad3c2e094c7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c3feb9d-3111-4f37-90f7-3ad3c2e094c7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_050302_548856_26B91F77 
X-CRM114-Status: GOOD (  27.89  )
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
Cc: vladimir.murzin@arm.com, ryan.roberts@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Aug 06, 2026 at 01:32:52PM +0200, David Hildenbrand (Arm) wrote:
> On 8/6/26 13:21, Mark Rutland wrote:
> > On Wed, Aug 05, 2026 at 08:47:08AM +0200, David Hildenbrand (Arm) wrote:
> >> On 8/5/26 08:45, David Hildenbrand (Arm) wrote:
> >>>
> >>> FWIW, in a recent discussion on some prototype hacking [1] we saw some overhead
> >>> in micro-benchmarks that would really hammer on a path that would now do a
> >>> preempt_disable()+preempt_enable().
> >>>
> >>> Switching from preempt_disable() to preempt_enable_no_resched() made it turn to
> >>> noise. Of course, that has other undesirable impacts, and I am not sure if we
> >>> are in the territory of code layout changes affecting the numbers.
> >>>
> >>> Just mentioning it as some data point.
> >>
> >> [1] https://lore.kernel.org/linux-mm/20260630174852-mutt-send-email-mst@kernel.org/
> > 
> > Thanks for the pointer.
> > 
> > IIUC in those cases you're using preempt_disable() .. preempt_enable()
> > directly, not this_cpu_*(), right?
> 
> It was purely preempt_disable/preempt_enable experiments without any percpu stuff.
> 
> > If so, patches 5 and 6 of this series [2,3] might have an impact, but I
> > wouldn't expect a significant change unless you're calling
> > preempt_enable a lot.
> > 
> > Please beware that it's not safe to use preempt_enable_no_resched()
> > UNLESS it is immediately followed by a call to schedule(). That's not
> > documented today (and I couldn't find a good reference), so more folk
> > are likely to be tempted to use it...
> Yes, that's also why we abandoned that (including for various other reasons :) ).

:)

> preempt_enable_no_resched() helped to identify that the preempt_enable() was
> really causing the noticeable overhead, not the other minor stuff we added on
> some hot paths.

Understood!
	
If we seeeing particularly noticeable overhead from preempt_enable() in
some workloads, there are some options we could investigate to reduce
that impact (e.g. using __preserve_most or a trampoline like x86's
preempt_schedule_thunk to reduce necessary spills and register
pressure).

Please let me know if you see anything that stands out, as any examples
would be useful for investigation. We'd want to figure out how much of
the overhead comes from register pressure, and how much of it comes from
the conditional call itself.

If you're testing with PREEMPT_DYNAMIC=y, on some architectures
(including arm64) you might see overhead reduced by:

  https://lore.kernel.org/lkml/20260803191731.3244294-1-mark.rutland@arm.com/

... but IIUC on x86 that won't change the cost of
preempt_enable[_notrace](). Today that makes a static call to
preempt_schedule[_notrace]_thunk, and a plain call will be the same
cost.

Mark.

