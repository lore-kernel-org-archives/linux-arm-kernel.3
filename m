Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3FCC55822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 07:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNcg4yLRrAMqVvjh7xGpP76Z6KvGkJyHkRJKm8OCgRY=; b=vhgUWsfjN6jxsH3qF8fgX58/i0
	y4323BnOQBkcuZKh27ZmPo0GyBaG7d4sUtLYXnftvy6WiTCC+AWn+ltniwYV35toB7BTOH0DPbPWf
	70Utx+YpKDu+0sLR9K1o8Or9tvdFN8gQQny+XiOFGKezImjvNOcJ/SeFatwv6LPRSeYoYmM6p53Qu
	AGjrshfOeBKKZ8tWlA+rFjmKJ+wKOdWpUNiZ7baO2abQr7/MqYw6HRBNhFhs4ku11+QdIieFBjEDO
	11MG+aMZh4nz+sXSqcJvoQAdkT83c/3TFkuHDQD/+lIca6bwORYhSKtcEdmeh4hyFfdFE4cBu9Q3a
	7L1Y49yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWQV-00000003QoE-0ucd;
	Wed, 05 Aug 2026 07:52:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWQT-00000003Qo4-3Geb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 07:52:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B454660A6A;
	Wed,  5 Aug 2026 07:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A271F000E9;
	Wed,  5 Aug 2026 07:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785916352;
	bh=SNcg4yLRrAMqVvjh7xGpP76Z6KvGkJyHkRJKm8OCgRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Dj4to2ePMBKxrHS21YueJj81YBvWMmm/zU4B6OTvdGDkTfFp1jwM0gD6RdcKfxGtc
	 PhQq2bw4OGCZxVghhLaRsKjkiPE0ihI0JyxRB4Sc97q31ueKUeQWhvJwJcmVEfL1lM
	 Ynbxbw+z/um1SJYU9jOV32JojP1BxGUIJ3O9qTyFH3RtyZ0VSYHOnIZGHHltBR95c+
	 QYuKxnvSdNIV+hx8vNDOH3xMxpSpfI+09zXkMl7ANBx1/aVeTB22kL9ucuT4Z1wcB4
	 ldYvkVT9eyqfzL3+L8FPelecfDynCcvGFfeM1cWDuUbupTItSpAFtozClYiQ+3W3Jm
	 dF80eOm2m1jpA==
Date: Wed, 5 Aug 2026 08:52:14 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	"Christoph Lameter (Ampere)" <cl@gentwo.org>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, dennis@kernel.org, 
	tj@kernel.org, urezki@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	akpm@linux-foundation.org, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
Message-ID: <anLmaVE5PSh6qmNz@lucifer>
References: <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com>
 <amCPBrdltFSE_fEf@J2N7QTR9R3>
 <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
 <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org>
 <anHuLy52o5S9Nlwp@lucifer>
 <CAHk-=wgJ0wO=T+1G5zJwoeE-N4bAptCNo2TFirK364iPhnGG6A@mail.gmail.com>
 <dadd8268-3cef-3a3a-e277-b593bef3b788@gentwo.org>
 <CAHk-=wha5um2rB9u7EDeEhZJyaWOUFye-wTKzsykQqJH41RNdw@mail.gmail.com>
 <anIXr4Kbn59Ac31Y@lucifer>
 <69f4cd9c-bd6c-4e5d-b8d1-a7be8408a57a@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69f4cd9c-bd6c-4e5d-b8d1-a7be8408a57a@os.amperecomputing.com>
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

On Tue, Aug 04, 2026 at 02:51:54PM -0700, Yang Shi wrote:
>
>
> On 8/4/26 10:23 AM, Lorenzo Stoakes (ARM) wrote:
> > On Tue, Aug 04, 2026 at 09:30:08AM -0700, Linus Torvalds wrote:
> > > On Tue, 4 Aug 2026 at 09:27, Christoph Lameter (Ampere) <cl@gentwo.org> wrote:
> > > > We certainly do not want to replicate that approach. We are using the per
> > > > cpu page tables to avoid address calculations in the VM that other
> > > > platforms can do with a segment override.
> > > Right, and I said that that's ok as long as it's a internal
> > > architecture thing. Not a "this is how the VM works".
> > >
> > > Because people really have wanted to make it a "this is how the VM
> > > works" thing. And that is very much what I object to.
> > Well :) it fundamentally changes how mm works - now we have a whole new set of
> > kernel page tables and PGD's that we have to think about.
> >
> > And the series either tries to hack changes that fundamentally alter how
> > vmalloc works or will add its own duplicative kernel page table code to do the
> > same kind of thing.
>
> I don't think this series fundamentally alter how vmalloc works IMHO.
> vmalloc still works in the same way and the page tables share the same
> contents (except local percpu area), it just needs to sync up kernel page
> tables when the top level is changed. This is not new, x86 has been doing so
> for years, see arch_sync_kernel_mappings(). The patch just added the
> implementation for arm64.

Your patch fundamentally changes how vmalloc works (!init_mm) as I pointed out
in the patch.

Your response was essentially 'OK I'll duplicate the code' which was not really
encouraging.

So either you have a variant of vmalloc that works on a brand new type of kernel
page table mapping, or you have _yet more_ duplicative kernel page table code,
explicitly the kind of code that has caused latent races and issues that I've
very recently had to address.

People have repeatedly treated the ordinary or garden variety kernel page tables
as 'never go away, nobody else touches' and rolled their own
walking/manipulation code which I'm now having to fix up, so I'm really not in
favour of going down that road again.

For instance, there's a contract that kernel mapping manipulation and race
resolution _has_ to happen on init_mm.mmap_lock. I'm not sure exactly how that
will interact with the per CPU page table concept.

arch_sync_kernel_mappings() and friends are different - that's about
synchronising kernel mappings across process PGDs, you're proposing an _entirely
distinct_ set of kernel page tables.

Core mm really does have to worry about this stuff even if only one arch
implements them.

>
> >
> > So now core mm has to worry about TLB coherency and synchronisation, how this
> > might interact with things like page table isolation, and a lot of other
> > headaches (and I'm not really convinced they've been thought through here).
>
> I don't think this series changed how TLB is sync'ed either. When we
> invalidate TLB entries for kernel (i.e. vmalloc area), the TLBI is sent to
> all CPUs, it is unchanged.

The v2 change log which was a laundry list of 'I didn't think about X' (which is
understandable - this stuff is hard) really doesn't fill me with confidence that
you've thought everything through.

And inevitably you have to worry about TLB synchronisation of these page tables,
as you're essentially inventing a new class of page tables that have different
semantics from everything else.

>
> The series does change how percpu area is setup for ARM64, but this is
> already sort of architecture dependent.

The diffstat disagrees with you :) you are changing core percpu and mm for this.

>
> >
> > IOW - breaking fundamental assumptions about kernel page tables is inherently a
> > whole-VM change (See [0] for instance for an example of what can go wrong).
> >
> > If Christoph + Yang can provide compelling data that advocates for this change
> > AND the core mm and arm64 communities agree to move forward with this, then
> > things are different.
>
> We shared some benchmark data in the cover letter. Kernel build is a quite
> common benchmark used by kernel developers. Specjbb and MySQL benchmark
> results are considered important benchmarks as well. I wish I could run
> benchmark on more ARM64 cpus from other vendors, but I do have limited
> access to other hardware.

I understand that and saw them (thanks for that). But can you also run them
against Mark's series?

>
> >
> > However, I think the best approach here is to find the least invasive way of
> > limiting the change to the architecture itself.
> >
> > Mark has put forward an approach that eliminates the exact overhead that this
> > series aims to address but does so without having to fundamentally alter core
> > mm assumptions (v2 posted at [1]).
> >
> > So that seems very clearly to be a better alternative to me.
> >
> > Ultimately we need mm and arm64 maintainer agreement on the way forwards (or in
> > the case of a truly isolated arm64 solution, arm64 maintainer agreement).
> >
> > The LSF session was not encouraging ([2]) and as an mm maintainer I'm not at all
> > happy with this myself, nor does the arm64 community seem all that enthused so I
> > would against gently suggest to Christoph to be a little more open-minded about
> > the the proposed alternative which he seems to have dismissed out of hand.
>
> Nobody disagreed Mark's approach also achieved good result, we just thought
> the series can do better. I agree there is always trade off between gain and
> cost, this is why we are seeking more usecases although there are different
> opinions.

I'm glad you raised tradeoffs, absolutely agree :)

Your proposal incurs high costs in terms of maintenance headaches, so it's not
'which is theoretically quicker based on instruction count' (a poor metric
anyway), but rather an assessment of overall RoI.

And every series must be considered on its own merits, nothing is guaranteed to
be taken.

Let's see how the alternative stacks up based on data please.

>
> Thanks,
> Yang
>
> >
> > >                Linus
> > --
> > Cheers, Lorenzo
> >
> > [0]:https://lore.kernel.org/linux-mm/20260723-series-vmap-race-fix-v6-0-8cc77dcc0018@kernel.org/
> > [1]:https://lore.kernel.org/linux-arm-kernel/20260804170503.3513916-1-mark.rutland@arm.com/
> > [2]:https://lwn.net/Articles/1073395/
>

--
Cheers, Lorenzo

