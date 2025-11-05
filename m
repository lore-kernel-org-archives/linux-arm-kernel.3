Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593C6CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 17:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZBsR1JHxSYNon7ld+ChemV4hBxtvOsP0EtGBOfNcMY=; b=GCNJCu4yIBENUPI5ItcxTmrEYR
	ZI3RuYmFCPwddJX8XvQO42/eullX4NqG7VkQDQPH6Gf8eMvsV1TJxGTU9uMjN9QTnOqKuLoFGQYtU
	y09vi2tjwIuomfefRgU/mj/NdZ3L+1DoqWRjTNB++kj31ef/plQ1oV5Zp/vba3vzLJeTuZ+n0nLXH
	0jO64AU9bj8d7MJH7KaEa3qu9PFJmaoNnu+y5myKrXzQuoO1Wo3JrDp7ip8uNB5s2O0EFGGJbyTbD
	EvOR1oor7ABUmLwTrOdTyZXuic3k9d5EJLcRkqskyP91o/HqoBxCccheqCi5wSqDzHFAxOHwCoGka
	Gvun3QzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhUp-0000000EC6o-3XUI;
	Wed, 05 Nov 2025 17:40:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhUo-0000000EC6i-37cP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 17:40:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EEB260207;
	Wed,  5 Nov 2025 17:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C704AC4CEF5;
	Wed,  5 Nov 2025 17:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762364433;
	bh=l8YMmjx9l6QvZujXCOhap8v5878qTeGHSa0UOYxEI4M=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=AP7r/UDsGVeW18RWw1FFNAi87ewYus4tm0DRp0MpL6gjLRDGe0iNJjBg0re/Z4yZ1
	 P+VwqRUc+K4YbitCGiiwxwI9yrsDKbrlpLO9+nOaVp4o2C0jLzT3SW3+LNGKu5WkNO
	 4MVio359BG5bl2nu2NcC4IBUMRm30rME3bKEL8WUgnZS62BZK/kfJMbgJxkmdICa56
	 uzeJealuhPpI2EzHdROZ/8sqYZg5uXi5K/kmgZ+ADaYp6U+6Zo6R7Omut6ElF+bZwl
	 N0vqG8QRqrnhVY6PbG1nAL7/953vF8hENgADkYuod04Q0ZdXtxijSGeTfhInmpBXiG
	 lWkOceCArxleg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 7B064CE0B1D; Wed,  5 Nov 2025 09:40:32 -0800 (PST)
Date: Wed, 5 Nov 2025 09:40:32 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <8ef2390c-e805-4b8c-8417-88a6762f9a54@paulmck-laptop>
References: <31847558-db84-4984-ab43-a5f6be00f5eb@paulmck-laptop>
 <aQU7l-qMKJTx4znJ@arm.com>
 <5ab48722-8323-45af-b585-23b34af3017e@paulmck-laptop>
 <e819db66-7f60-464d-9ee8-4e8ee3e59acf@paulmck-laptop>
 <aQoyPox1DjlBT32O@arm.com>
 <d132771d-3a3f-486c-b674-de4ec976e929@paulmck-laptop>
 <174614f9-70f0-440e-ae68-dc5f540b8454@paulmck-laptop>
 <aQtufeFU-PAE6YDk@arm.com>
 <8f7997f5-fdb3-443b-90be-3c68d796b416@paulmck-laptop>
 <aQuGR1fx2qBrJSA-@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQuGR1fx2qBrJSA-@arm.com>
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Nov 05, 2025 at 05:15:51PM +0000, Catalin Marinas wrote:
> On Wed, Nov 05, 2025 at 08:25:51AM -0800, Paul E. McKenney wrote:
> > On Wed, Nov 05, 2025 at 03:34:21PM +0000, Catalin Marinas wrote:
> > > Given that this_cpu_*() are meant for the local CPU, there's less risk
> > > of cache line bouncing between CPUs, so I'm happy to change them to
> > > either use PRFM or LDADD (I think I prefer the latter). This would not
> > > be a generic change for the other atomics, only the per-CPU ones.
> > 
> > I have easy access to only the one type of ARM system, and of course
> > the choice must be driven by a wide range of systems.  But yes, it
> > would be much better if we can just use this_cpu_inc().  I will use the
> > non-atomics protected by interrupt disabling in the meantime, but look
> > forward to being able to switch back.
> 
> BTW, did you find a problem with this_cpu_inc() in normal use with SRCU
> or just in a microbenchmark hammering them? From what I understand from
> the hardware folk, doing STADD in a loop saturates some queues in the
> interconnect and slows down eventually. In normal use, it's just a
> posted operation not affecting the subsequent instructions (or at least
> that's the theory).

Only in a microbenchmark, and Breno did not find any issues in larger
benchmarks, so good to hear!

Now, some non-arm64 systems deal with it just fine, but perhaps I owe
everyone an apology for the firedrill.

But let me put it this way...  Would you ack an SRCU patch that resulted
in 100ns microbenchmark numbers on arm64 compared to <2ns numbers on
other systems?

							Thanx, Paul

