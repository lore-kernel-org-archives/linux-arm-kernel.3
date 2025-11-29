Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DD8CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 03:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DpznAaRjUo2w7LZxf6lAxjAHm9eksDcdz1NUq6/1gPM=; b=lMrzOuLBLs1SAxT3adohAUn8N2
	xraznZ3qZJOiDhE0J9IV5V+9r9GuAECw9rsQj2qzT6ti1/8d76uv/x1xi/sB3HqlpQ6e8CL4ytezS
	ic6blQ8bBuh0V/I38sHv1ddZXTiBGOCpCy4W7uZIuUYm1LjscKRj1ZlyuQL3ZbP93dTaVZAFJ/zbE
	gvuqQ4mPtbM+ZXYX1q9X+4YjoQdnP2DurUvLGnqDSB9StWjd1UvbPrJbHGYOeU+uLDG/Lo/oARtSU
	hmCV5RHGk95oRORZ0DgWFDIEwebmOiP9HHiy9PyCsb8OGbvSJpZiletVI/uaiegUiyDNy9zPLU3Iv
	5tOd/Lrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPBmF-00000001EVg-3VYy;
	Sat, 29 Nov 2025 03:37:39 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPBmC-00000001EV4-0OH9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 03:37:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
	bh=DpznAaRjUo2w7LZxf6lAxjAHm9eksDcdz1NUq6/1gPM=; b=RM2AAmHbiWWjdBAvIAJPpFqKzC
	w+Imm2LS97uAx/g//eMP3HpFYUydE6Y+w3JM2a8/zUe++dKTeDANZDiDhhpz9RQhopbF5FS4u59BP
	PE1d3GCCezRATySQWYeccgXjEG2ISRJhV3jEJRAJQYUiOg1uEdQI1PcGSSQoXR3sE3gEGjYo6X1b0
	ZZAydgZNX+ONMdWvNoVHkaZNl6k/IZqlWnoW2ttA3YJ+Rq3v6tUpaDiuCU6m1/7ylKfhX+vhWnevn
	rwQhQ8i4Asi+235RfCe1TE0fqCW9cuyaCfk0NCspPUUaeA0kvHilMf+ySBiCfQyouT10czoJRpVrE
	xFYsYKig==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vPBm4-000000008wo-3AES;
	Sat, 29 Nov 2025 03:37:28 +0000
Date: Sat, 29 Nov 2025 03:37:28 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Zizhi Wo <wozizhi@huaweicloud.com>
Cc: torvalds@linux-foundation.org, jack@suse.com, brauner@kernel.org,
	hch@lst.de, akpm@linux-foundation.org, linux@armlinux.org.uk,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	yangerkun@huawei.com, wangkefeng.wang@huawei.com,
	pangliyuan1@huawei.com, xieyuanbin1@huawei.com
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
 sleep in RCU context
Message-ID: <20251129033728.GH3538@ZenIV>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <20251126185545.GC3538@ZenIV>
 <c375dd22-8b46-404b-b0c2-815dbd4c5ec8@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c375dd22-8b46-404b-b0c2-815dbd4c5ec8@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_193736_415402_5E028CFE 
X-CRM114-Status: GOOD (  17.58  )
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

On Thu, Nov 27, 2025 at 10:24:19AM +0800, Zizhi Wo wrote:

> Why does x86 have special handling in do_kern_addr_fault(), including
> logic for vmalloc faults? For example, on CONFIG_X86_32, it still takes
> the vmalloc_fault path. As noted in the x86 comments, "We can fault-in
> kernel-space virtual memory on-demand"...
> 
> But on arm64, I don’t see similar logic — is there a specific reason
> for this difference? Maybe x86's vmalloc area is mapped lazily, while
> ARM maps it fully during early boot?

x86 MMU uses the same register for kernel and userland top-level page
tables; arm64 MMU has separate page tables for those - TTBR0 and TTBR1
point to the table to be used for translation, depending upon the bit
55 of virtual address.

vmalloc works with page table of init_mm (see pgd_offset_k() uses in
there).  On arm64 that's it - TTBR1 is set to that and it stays that way,
so access to vmalloc'ed area will do the right thing.

On 32bit x86 you need to propagate the change into top-level page tables
of every thread.  That's what arch_sync_kernel_mappings() is for; look for
the calls in mm/vmalloc.c and see the discussion of race in the comment in
front of x86 vmalloc_fault().  Nothing of that sort is needed of arm64,
since all threads are using the same page table for kernel part of the
address space.

The reason why 64bit x86 doesn't need to bother is different - there we
fill all relevant top-level page table slots in preallocate_vmalloc_pages()
before any additional threads could be created.  The pointers in those
slots are not going to change and they will be propagated to all subsequent
threads by pgd_alloc(), so the page tables actually modified by vmalloc()
are shared by all threads.

AFAICS, 32bit arm is similar to 32bit x86 in that respect; propagation
is lazier, though - there arch_sync_kernel_mappings() bumps a counter
in init_mm and context switches use that to check if propagation needs
to be done.  No idea how well does that work on vfree() side of things -
hadn't looked into that rabbit hole...

