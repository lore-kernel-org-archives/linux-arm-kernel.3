Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E702C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohnM/QTJNZ+57FtwY6l9db7MEahwiXQwpnCOrToPkmg=; b=23d6odIZdpjyv+vL1pJ5lN/cS7
	MSV7MZgKKNIauphWfZ82KzF9og0wtOjP6cJsiZDr/3RClovMpbmecuZrR3rs5830YYxXEn2FWpbAO
	KDcgqsSgh+DK8JQcc8xTbMl2JBkUUmBQVdpDqquJHastSj+E1mulEwbPWmicsRvzDhscqT0tOYvNb
	83s4hcag60XW2dZa0aoiCda7mNoB6vAMs5BFgG/tWBkPwOYZhHcoWXn/UJRvll7jyegszrzUJPetk
	YITyUBINfYCPW8R/MxjEPGiRYgwjRg6l8mMhqZgFallUk6o4wLHdtyIfu+G0TJzDL85yKVbasV+QD
	Dw54Tupg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1h1-00000006LjF-20bE;
	Thu, 06 Aug 2026 17:15:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1h0-00000006Lj9-1HH5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 17:15:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B2C90405C5;
	Thu,  6 Aug 2026 17:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC1A1F00A3A;
	Thu,  6 Aug 2026 17:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786036541;
	bh=ohnM/QTJNZ+57FtwY6l9db7MEahwiXQwpnCOrToPkmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XKcmZebSRKhOclLgWHO9NdRoYzuH0VLZl5rBKrCWL1gXuylkJCeiEchNqSFMmGSM6
	 vH8boDW0vXrJFmVbuai85kPhGyl6ArrCrfWjlu9sMcn5Gt5kOLITQ1IvFv1OG4B3Y+
	 1hqp1gXkTq558qykMk6eRd5lzO9SjG+yoavkuOWP0URRsjZ6Ajjh6QeNyl7evYP7MP
	 YBGIcQfTFygshxRU8t5SlwyurdMjKlk91Nz4F/8VkXHOpLfdhwl2rKLK6h7iowEtu2
	 viI37MTyeJtnNrqaTIKqxlK411bwjGjmdj+RLpA/dcNJnUr71M4oraSGHoTVek3ZR8
	 oZB4vvu1jMVmQ==
Date: Thu, 6 Aug 2026 18:15:35 +0100
From: Will Deacon <will@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	"Christoph Lameter (Ampere)" <cl@gentwo.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Ryan Roberts <ryan.roberts@arm.com>, dennis@kernel.org,
	tj@kernel.org, urezki@gmail.com, catalin.marinas@arm.com,
	akpm@linux-foundation.org, hca@linux.ibm.com, gor@linux.ibm.com,
	agordeev@linux.ibm.com, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
Message-ID: <anTBN7WzVZukl26p@willie-the-truck>
References: <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com>
 <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com>
 <amCPBrdltFSE_fEf@J2N7QTR9R3>
 <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
 <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org>
 <anHuLy52o5S9Nlwp@lucifer>
 <CAHk-=wgJ0wO=T+1G5zJwoeE-N4bAptCNo2TFirK364iPhnGG6A@mail.gmail.com>
 <dadd8268-3cef-3a3a-e277-b593bef3b788@gentwo.org>
 <CAHk-=wha5um2rB9u7EDeEhZJyaWOUFye-wTKzsykQqJH41RNdw@mail.gmail.com>
 <anIXr4Kbn59Ac31Y@lucifer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anIXr4Kbn59Ac31Y@lucifer>
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

On Tue, Aug 04, 2026 at 06:23:48PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Tue, Aug 04, 2026 at 09:30:08AM -0700, Linus Torvalds wrote:
> > On Tue, 4 Aug 2026 at 09:27, Christoph Lameter (Ampere) <cl@gentwo.org> wrote:
> > >
> > > We certainly do not want to replicate that approach. We are using the per
> > > cpu page tables to avoid address calculations in the VM that other
> > > platforms can do with a segment override.
> >
> > Right, and I said that that's ok as long as it's a internal
> > architecture thing. Not a "this is how the VM works".
> >
> > Because people really have wanted to make it a "this is how the VM
> > works" thing. And that is very much what I object to.
> 
> Well :) it fundamentally changes how mm works - now we have a whole new set of
> kernel page tables and PGD's that we have to think about.
> 
> And the series either tries to hack changes that fundamentally alter how
> vmalloc works or will add its own duplicative kernel page table code to do the
> same kind of thing.
> 
> So now core mm has to worry about TLB coherency and synchronisation, how this
> might interact with things like page table isolation, and a lot of other
> headaches (and I'm not really convinced they've been thought through here).
> 
> IOW - breaking fundamental assumptions about kernel page tables is inherently a
> whole-VM change (See [0] for instance for an example of what can go wrong).
> 
> If Christoph + Yang can provide compelling data that advocates for this change
> AND the core mm and arm64 communities agree to move forward with this, then
> things are different.
> 
> However, I think the best approach here is to find the least invasive way of
> limiting the change to the architecture itself.
> 
> Mark has put forward an approach that eliminates the exact overhead that this
> series aims to address but does so without having to fundamentally alter core
> mm assumptions (v2 posted at [1]).
> 
> So that seems very clearly to be a better alternative to me.
> 
> Ultimately we need mm and arm64 maintainer agreement on the way forwards (or in
> the case of a truly isolated arm64 solution, arm64 maintainer agreement).

So the nice thing about having two implementations (i.e. the per-cpu
page-tables *and* the preemption stuff from Mark) is that we can pitch
them against each other to help us make a decision.

However, I don't see how anybody could argue that Mark's series isn't
cleaner and easier to maintain. I've seen it described as "hacky" but I
can't tell whether or not that's supposed to be a criticism. If we
seriously want to consider the per-cpu page-table approach on arm64, the
numbers need to be _really_ good and across a variety of hardware, not
just the stuff with a memory system made of baling twine. That extends
to the kernel text replication efforts too.

Will

