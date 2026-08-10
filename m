Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC023C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:Reply-To:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:From:
	Date:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVnOlzSpulIWHtQW1ir4jWff4eV35n1TqHNmWVy5I8A=; b=NHGgu2gJnC66sv4nHKoOQZ3aKV
	vvqU1uwyh+xICD/cPGqcbo21tUfhu3TZgoHwm7B8G8gk23qThT/+DCZLw7HqYFuCSUgFJSBdcAXzz
	eC0qJ3E66ej/+YtW49M+llxCB77Cv9Z3NkllmuQZ6SrSMx2W3h3+lepZNuIwuQ3Rr4DaP27GsBDNR
	WE9t2v60BFxN69NRJ2JlH3g9EQoIxQIQ/q3H6dMI8mwX8rFhFBf0xNd7Z4eGKg82ukeJIdFzvo30T
	vuQJ9vgMi9CuF36TSMdTcqtfpEWFowThDscsxZoicveGOKVfSDZ9QwF1VQJjlIQ2N9HdOAvnYM4ZW
	CKRKUCrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtV1i-0000000CevR-478Q;
	Mon, 10 Aug 2026 18:47:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtV1f-0000000Ceui-1qru
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:47:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DE278600AD;
	Mon, 10 Aug 2026 18:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914CA1F000E9;
	Mon, 10 Aug 2026 18:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387626;
	bh=TVnOlzSpulIWHtQW1ir4jWff4eV35n1TqHNmWVy5I8A=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=b681DeOKQEc9xqv52hO14Tp7EHPzXVGW79mqYMepvdDtw6CuaLtG4M9zbFDGX1pMl
	 uS6Kv8JNdhwEe4NMd0Kk/3smBxTkoTmF/mTgE3ZJl/z7sE3jnFrezfQiD7IyWftIgY
	 Sq7JVqsV67Ox1HcXPxA3NiAmnds0bXW0JHu2qYq5x/FQO6O4YarG5ndA8DTk3EnKmP
	 tSlGHiK7hzCq9BqBVzXYTOjNoFoD4AXf0Y4u76lbst6Hd3xjTvZzyEt25QxWzB6Epi
	 leJttzfUaGihHK66AZoR7DJto2ZX2B5A7Au3BOdlHyDvbtglnzjq1e5hOSfGwhJkBE
	 KTUGBS623cYZw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 51A13CE0B65; Mon, 10 Aug 2026 11:47:06 -0700 (PDT)
Date: Mon, 10 Aug 2026 11:47:06 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH RFC] arm64: Mark set_preempt_need_resched() access to
 .need_resched
Message-ID: <213a34d0-9ac5-4afd-88b6-0b7594439078@paulmck-laptop>
References: <13df4ff4-8594-4c37-b25f-860248a222cf@paulmck-laptop>
 <4fa802e7-6cfc-4cce-afee-c29b28171ad3@paulmck-laptop>
 <anR28GyRtCpApQYX@willie-the-truck>
 <ca54b283-3349-43d4-9460-32b084709d67@paulmck-laptop>
 <anXKRdA9sUziFda5@willie-the-truck>
 <CANpmjNPCM0NV1EN2pNBf3EBBk8eLjbGGAiZ_+rJkoROJtG3jFQ@mail.gmail.com>
 <anXbTwhaWZCIxxTg@willie-the-truck>
 <anXheKZ7zKNw1oD_@elver.google.com>
 <5c607693-7fce-4b24-a648-95ab96db6691@paulmck-laptop>
 <annq-ldauKsp1wq5@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <annq-ldauKsp1wq5@willie-the-truck>
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
Reply-To: paulmck@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Marco Elver <elver@google.com>, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, dvyukov@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Aug 10, 2026 at 04:15:06PM +0100, Will Deacon wrote:
> On Fri, Aug 07, 2026 at 11:44:56AM -0700, Paul E. McKenney wrote:
> > On Fri, Aug 07, 2026 at 01:45:28PM +0000, Marco Elver wrote:
> > > On Fri, Aug 07, 2026 at 02:19PM +0100, Will Deacon wrote:
> > > [...]
> > > > Ok, but then I don't understand how these accesses can race. They appear
> > > > to be on the same CPU, in the same IPI handler.
> > > 
> > > The only way this could happen is with an NMI, but that's not the case
> > > here? I should have looked at the 2nd stack trace, and it seems to be
> > > clear that this is a false positive: KCSAN sets up a watchpoint on an
> > > address that is also accessed by __delay.
> > > 
> > > One problem with disabling KCSAN in this CPU's context is that we'd fail
> > > to detect data races from nested interrupts.
> > > 
> > > So yes, the best way forward is to disable KCSAN in the delay
> > > implementation. And I recall doing this for x86, which has this:
> > > 
> > > 	[arch/x86/lib/Makefile]
> > > 	...
> > > 
> > > 	# KCSAN uses udelay for introducing watchpoint delay; avoid recursion.
> > > 	KCSAN_SANITIZE_delay.o := n
> > > 
> > > So let's do this for arm64, too. Sorry for the noise.
> > 
> > Thank you both!
> > 
> > I will revert my arm64-specific patch and apply this one.  Testing will
> > take some time, and I will get you know how it goes.
> 
> Cheers, Paul.
> 
> I've queued it up in the arm64 tree, so please shout if you run into any
> problems.

Thank you, Will!  So far so good on the testing.

							Thanx, Paul

