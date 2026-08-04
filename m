Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3AB9C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 14:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJcR7YXWrmqdZ6avQy5eZ7W5n6FvlWwC3YY2riy4eDo=; b=kZvXhBQhds0RBWz/AMfJ2c4QAC
	JIO90UyXqJpR7uhqWLjlP0tyNJGq3djMKIV3T+DZD6/DH/9AQTYZFtk/1X9sL4/D3EbgG6btidwPJ
	PltGvka56AQzZqT6CbfiJ+TC/ZjCHxIUM8RiGPdIjRqqgXTnp+GnoMydWytbsjjT1jla7xMijmlx6
	WCCeW30dlFdIMpiLyp7uM+/dNG52D8MGgJuiDSMXrUhq8MdHBvAuGPmlYqjvEpAIza9uykM6NJD+2
	7WBCztoYXp+DA0etSIDThVKl0F3+sM5WwoZ6B/iOuicY0Xjxc0Gs7opUtjMjR4kLpit5b15/FQYTV
	tUDBIgyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFvQ-000000021xC-2v65;
	Tue, 04 Aug 2026 14:15:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFvP-000000021wk-3Nmj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 14:15:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BB6560A8C;
	Tue,  4 Aug 2026 14:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396951F000E9;
	Tue,  4 Aug 2026 14:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785852922;
	bh=qJcR7YXWrmqdZ6avQy5eZ7W5n6FvlWwC3YY2riy4eDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BnF3lgKMxDaKGMfseCBsysay5w1WAhXZwaefobS1+NlG9tpktpOCz3c/7EuUBIr5L
	 Nku+ESaLfFmLB/UkDOOnJTp4FK+SIUH/whZfKiQDAfdhFABb4vFMkL6fg9c3EaxtyN
	 JQO0goEGVAQGH5hQXlCxtYmh95VAyy9u8sdQOw0yZ2wni6JYmtRasSR5PfNywQU4RK
	 Zmu62yC10jpcnXCb+4mfrkza2JmpRMTVvmXYuaaruwweWmg2HVYJbawtzLswJO6fvF
	 Lhx+DQClat2sSGDOkf6y6oHJVVfD5VN+xjIAQGuQCghSq/BJ25yZ8LaElY8YDbuy+S
	 5LrLdS9PwYrow==
Date: Tue, 4 Aug 2026 15:15:03 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>, 
	Mark Rutland <mark.rutland@arm.com>, Yang Shi <yang@os.amperecomputing.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, dennis@kernel.org, tj@kernel.org, urezki@gmail.com, 
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
Message-ID: <anHuLy52o5S9Nlwp@lucifer>
References: <20260715180455.515692-1-yang@os.amperecomputing.com>
 <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com>
 <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com>
 <amCPBrdltFSE_fEf@J2N7QTR9R3>
 <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
 <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org>
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

+cc Linus, Jason

On Wed, Jul 29, 2026 at 11:28:02AM +0200, David Hildenbrand (Arm) wrote:
> On 7/28/26 00:06, Christoph Lameter (Ampere) wrote:
> > On Wed, 22 Jul 2026, Mark Rutland wrote:
> >
> >> I expect that should come with a reasonable benefit, but I don't have
> >> benchmark figures yet as I haven't finished converting the xchg and
> >> cmpxchg implementations.
> >>
> >>> It sounds like it just moved the cost from one place to the other
> >>> place and it also seems hacky TBH.
> >
> >
> > Yang Shi's patch has *no* critical section. There is no additional code
> > for the RMV instruction. The RMV instruction is executed on the correct
> > per cpu area. One of the reasons for the performance win is the
> > eliminattion of these critical sections. Your approach still has some form
> > of prologue and posthandling like the current preempt approach and
> > therefore will not be able to have the same performance gains.
> >
> > The code is more efficient, there is no restart necessary and the
> > technique is already widely used on x86 for a long time.
> >
> > Having the ability in general to map mmemory differently depending on the
> > cpu opens up a number of other optimization like
> >
> > 1. Per Node areas. Calculations of addresses for per node data and RMV
> > operations on per node data becomes as trivial as the per cpu data
> > handling. This will further reduce and eliminate critical sections
> > currently necessary to handle per node data modifications for NUMA
> > configurations which are increasingly becoming important for large core
> > configurations on ARM64.
> >
> > 2. Kernel text replication. Kernel text can be replicated per node or
> > per whatever memory is closer to the executing code. This avoids transfers
> > via the on chip memory busses and increases performance. We have seen
> > 20-50% on that one.
> >
> > 3. Readonly data replication. A similar approach is possible for kernel
> > read only data.
> >
> > 3. Read-mostly replication. This is a bit more complex and the writes
> > become more expensive since updates have to be made to all copies but
> > a read-mostly variable is rarely written and the replication will reduce
> > the latencies to reach these variables.
> >
> >
> > 4. Custom sets of cores that operate on shared data that is replicated
> > per node or some custom set of cores. This is for example
> > useful for network devices that have the ability to do I/O via a split
> > PCI bus or other construct where I/O lanes are duplicated to sets of
> > cores.
> >
> >
> > What we are proposing here is a basic new feature that simplifies code and
> > allows addititonal performance and functional features that are so far not
> > possible on ARM64.
>
> Most of the features you mentioned above are not supposed to be
> architecture-specific things. IIUC, Linus strongly objected per-cpu page tables
> in the past, which suggests to me that such an arm64-only thing is not the way
> to go?

Linus - I assume you still find per-cpu page tables totally unacceptable? (had a
look around to see your take on this recently and found [0] which seems to
confirm it :)

Yang/Christoph - You ran a LSF session on this but it seems there was
significant push-back there also - https://lwn.net/Articles/1073395/ - it seemed
pretty damning on the approach as a whole, so given Linus's and the community's
rejection of it is it really worth pursuing this any further?

(Adding Jason as he was involved in that discussion.)

From my side, having recently done a bunch of work with kernel page tables and
the absolute mess they're in, with intent to move to RCU kernel page table
freeing, I'm very concerned about this adding additional complexity and making
the already very fraught page table situation we have in the kernel even worse.

Since this work seems to be very much arm64-focused, perhaps it's therefore
worth looking at an alterative solution that's specific to the arch, like the
one suggested by Mark ([1])?

[0]:https://lore.kernel.org/all/CAHk-=wire3dzhHx=KiL_f5Rj0=1u9ustsa33QoR-F9-v-NU9Ng@mail.gmail.com/
[1]:https://lore.kernel.org/linux-arm-kernel/al_DpFJFcmVhxpvW@J2N7QTR9R3/

>
> --
> Cheers,
>
> David
>

--
Cheers, Lorenzo

