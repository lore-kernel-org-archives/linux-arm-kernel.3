Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B567C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 16:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRx4dTP+E12UD+buBycIlsaZS3LI+snTNrss8we8dxo=; b=09puA1T4uu6ZCAmNUz/7fX6QOn
	9WRyrki2rEDZnQTLFDUDiyRfNbsEAENGXM+BPc4B04pXNHBpvoOY8XbWV/G6APZA9pzrSMjn7x99O
	iv+/8SDGKq3g5fZI5nBhpgxUCzmiX2DVe0e6HPjS1+hZQyMMYCabAzRQTTs8eFKvaZVwwOnx/WNTx
	4ZnT9pNe136JtFJOtEZk3YMTrGia3IV+TcRPFc3+cbV/duZkjOagB2GX4OcyDfrEuwte9G8A7luI7
	zOOLw7UVRFD1vZt3Z/Y2ihy/GMKiAXyFO47MebJnCmYFh3HUCQ0FEPedAofQpLraFVFdIqC0dSrTC
	OD8LxapA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHzL-00000002KII-3zGa;
	Tue, 04 Aug 2026 16:27:35 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHzJ-00000002KHS-23FY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 16:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1785860155;
	bh=Dl59RvRhg66S6l9o3fECd7i9n0QYeVJJyHFmCxzp8Tg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gUqmmnMjn8LK8++gxC0PClqY6BzDe/pWCOdBqpFhDhrNDnLIaoBqdaji0inZ5xmgM
	 xBRDoszSRajAYTL0dLTCnt4D63IMOqPracIHZoDPPg9rcM+kmTcDpnvbT8u205NFoL
	 5zov5xUI4qkUaC5EBuYpFPWty8G6nvEfuBxw9NGE=
Received: by gentwo.org (Postfix, from userid 1003)
	id 61837408AE; Tue, 04 Aug 2026 09:15:55 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 5D15B40287;
	Tue, 04 Aug 2026 09:15:55 -0700 (PDT)
Date: Tue, 4 Aug 2026 09:15:55 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
    "David Hildenbrand (Arm)" <david@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, 
    Yang Shi <yang@os.amperecomputing.com>, 
    Ryan Roberts <ryan.roberts@arm.com>, dennis@kernel.org, tj@kernel.org, 
    urezki@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
    akpm@linux-foundation.org, hca@linux.ibm.com, gor@linux.ibm.com, 
    agordeev@linux.ibm.com, linux-mm@kvack.org, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
In-Reply-To: <CAHk-=wgJ0wO=T+1G5zJwoeE-N4bAptCNo2TFirK364iPhnGG6A@mail.gmail.com>
Message-ID: <dadd8268-3cef-3a3a-e277-b593bef3b788@gentwo.org>
References: <20260715180455.515692-1-yang@os.amperecomputing.com> <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com> <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com> <amCPBrdltFSE_fEf@J2N7QTR9R3> <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
 <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org> <anHuLy52o5S9Nlwp@lucifer> <CAHk-=wgJ0wO=T+1G5zJwoeE-N4bAptCNo2TFirK364iPhnGG6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_092733_551292_85D72130 
X-CRM114-Status: GOOD (  32.71  )
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

On Tue, 4 Aug 2026, Linus Torvalds wrote:

> On Tue, 4 Aug 2026 at 07:15, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> >
> > Linus - I assume you still find per-cpu page tables totally unacceptable? (had a
> > look around to see your take on this recently and found [0] which seems to
> > confirm it :)
>
> Yes, I still think that per-cpu page tables as some kind of
> architectural design is a horrible idea, because it paints us into a
> corner where you have intentional duplication and then end up having
> to have coherency issues where you need to lock for updates just to
> keep things in sync - and may need to do extra work on hardware that
> may otherwise already have hardware coherency support.

We already have had the intentional duplication, meaning multiple
virtual  addresses  for a single physical address with vmalloc and with
vmemmap for a very long time. Issues with hardware coherency that may have
existed for these cases have been fixed a long time ago.

> I honestly think that people who think that cache coherency in
> software is a great idea in general are misguided and should not work
> on kernels, but should go back to eating crayons and decide if purple
> tastes better than yellow.

Certain a bad idea. The per cpu pagew tables do not rely on cache
coherency in software.

> That said - per-cpu page tables as some kind of internal architecture
> choice that limits the damage to some simpler case is not necessarily
> wrong. We've obviously done things like that for page table isolation
> etc. It can be horribly expensive, but sometimes that is the price you
> are willing to pay - and sometimes you can avoid the expense entirely
> by knowing how the particular hardware works.

Have the same virtual address on all processors to reach the local per cpu
instance of a variable simplifies kernel code and avoids
preempt_enable/disable sections. Especially operations on counters in the
VM become much more efficient.

X86 can accomplish that with a segment override. That is not available on
other platforms. Page tables can be used to do the proper mapping so that
kernel code does not have to theses address calculations. These are
frequent operations in the kernel memory management.


> Very specific example: on 32-bit x86 with PAE, the top-level page
> table directory is fundamentally per-cpu in nature. It's just four
> entries that get loaded into the CPU on page table load, but it means
> that you can do things like having one quarter of the page tables be
> per-cpu, and the rest be shared. Several other architectures have
> similar "regions". So it can be an architectural choice to have some
> kind of per-cpu TLB. But I absolutely do *not* want to see a model
> where the general MM layer dictates that design.

X86 creates highly optimized code for per cpu operations without preempt
enable/disable sections and I hope its ok to use per cpu page table to get
to a similar degress of compactness and performance on ARM64.

> And there are historical reasons to really hate it. Plan-9 had a
> completely broken threading model that depended on per-thread page
> tables. It was literal garbage. It was broken beyond words exactly due
> to coherency issues, and I still do not understand how otherwise very
> smart people ever came up with such a stupid idea.
>
> We are not making _that_ mistake. We have made enough other ones to
> not neet to shoot ourselves in the head that badly.

We certainly do not want to replicate that approach. We are using the per
cpu page tables to avoid address calculations in the VM that other
platforms can do with a segment override.

