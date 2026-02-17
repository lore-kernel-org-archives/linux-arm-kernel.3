Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D950EE909B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 14:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nMOe4RDxlvvysKllY378Tk/OsQq0qlkIMO2wJcC8mQc=; b=1niWbOIpi1k0HeTZEFzL9ZceWu
	g1mOrSjBTHMUbsKMCXO2F4of6Qy3wZLlWTAGvPMIPB+YgTp1XkC9I16JNlXsHox/fS6AJosEtut+y
	QmGFVkp/cqVWgIy/YnSPpPtX7sBgjk83A1gdoZr3U554Yup2yGU7NnWvq+Bu2ZRfjGACpBTEr0q3m
	a8kYCmY89943DlSARkShKnjS+c17AJlxtCIrM/XDLWe3x3lk9CZL6eeukbzISP6TZFxtOZGooiGRO
	bM9LhYuMK+3f00896JVaNv5NJWJDhJg8OeB/ZuPhHk1VJyg3cYqUCcqF1nhJr9MVUSAup+nrzFfxX
	rmkz+rzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMPU-00000008SqQ-2AtK;
	Tue, 17 Feb 2026 14:50:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMPS-00000008Sq6-23yJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 14:50:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61D741477;
	Tue, 17 Feb 2026 06:50:33 -0800 (PST)
Received: from a080796.blr.arm.com (a080796.arm.com [10.164.21.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3E5A13F62B;
	Tue, 17 Feb 2026 06:50:34 -0800 (PST)
From: Dev Jain <dev.jain@arm.com>
To: lsf-pc@lists.linux-foundation.org,
	ryan.roberts@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	ardb@kernel.org,
	willy@infradead.org,
	hughd@google.com,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Dev Jain <dev.jain@arm.com>
Subject: [LSF/MM/BPF TOPIC] Per-process page size
Date: Tue, 17 Feb 2026 20:20:26 +0530
Message-Id: <20260217145026.3880286-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_065042_700755_EC3F3A4C 
X-CRM114-Status: GOOD (  25.29  )
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

Hi everyone,

We propose per-process page size on arm64. Although the proposal is for
arm64, perhaps the concept can be extended to other arches, thus the
generic topic name.

-------------
INTRODUCTION
-------------
While mTHP has brought the performance of many workloads running on an arm64 4K
kernel closer to that of the performance on an arm64 64K kernel, a performance
gap still remains. This is attributed to a combination of greater number of
pgtable levels, less reach within the walk cache and higher data cache footprint
for pgtable memory. At the same time, 64K is not suitable for general
purpose environments due to it's significantly higher memory footprint.

To solve this, we have been experimenting with a concept called "per-process
page size". This breaks the historic assumption of a single page size for the
entire system: a process will now operate on a page size ABI that is greater
than or equal to the kernel's page size. This is enabled by a key architectural
feature on Arm: the separation of user and kernel page tables.

This can also lead to a future of a single kernel image instead of 4K, 16K
and 64K images.

--------------
CURRENT DESIGN
--------------
The design is based on one core idea; most of the kernel continues to believe
there is only one page size in use across the whole system. That page size is
the size selected at compile-time, as is done today. But every process (more
accurately mm_struct) has a page size ABI which is one of the 3 page sizes
(4K, 16K or 64K) as long as that page size is greater than or equal to the
kernel page size (kernel page size is the macro PAGE_SIZE).

Pagesize selection
------------------
A process' selected page size ABI comes into force at execve() time and
remains fixed until the process exits or until the next execve(). Any forked
processes inherit the page size of their parent.
The personality() mechanism already exists for similar cases, so we propose
to extend it to enable specifying the required page size.

There are 3 layers to the design. The first two are not arch-dependent,
and makes Linux support a per-process pagesize ABI. The last layer is
arch-specific.

1. ABI adapter
--------------
A translation layer is added at the syscall boundary to convert between the
process page size and the kernel page size. This effectively means enforcing
alignment requirements for addresses passed to syscalls and ensuring that
quantities passed as “number of pages” are interpreted relative to the process
page size and not the kernel page size. In this way the process has the illusion
that it is working in units of its page size, but the kernel is working in
units of the kernel page size.

2. Generic Linux MM enlightenment
---------------------------------
We enlighten the Linux MM code to always hand out memory in the granularity
of process pages. Most of this work is greatly simplified because of the
existing mTHP allocation paths, and the ongoing support for large folios
across different areas of the kernel. The process order will be used as the
hard minimum mTHP order to allocate.

File memory
-----------
For a growing list of compliant file systems, large folios can already be
stored in the page cache. There is even a mechanism, introduced to support
filesystems with block sizes larger than the system page size, to set a
hard-minimum size for folios on a per-address-space basis. This mechanism
will be reused and extended to service the per-process page size requirements.

One key reason that the 64K kernel currently consumes considerably more memory
than the 4K kernel is that Linux systems often have lots of small
configuration files which each require a page in the page cache. But these
small files are (likely) only used by certain processes. So, we prefer to
continue to cache those using a 4K page.
Therefore, if a process with a larger page size maps a file whose pagecache
contains smaller folios, we drop them and re-read the range with a folio
order at least that of the process order.

3. Translation from Linux pagetable to native pagetable
-------------------------------------------------------
Assume the case of a kernel pagesize of 4K and app pagesize of 64K.
Now that enlightenment is done, it is guaranteed that every single mapping
in the 4K pagetable (which we call the Linux pagetable) is of granularity
at least 64K. In the arm64 MM code, we maintain a "native" pagetable per
mm_struct, which is based off a 64K geometry. Because of the guarantee
aforementioned, any pagetable operation on the Linux pagetable
(set_ptes, clear_flush_ptes, modify_prot_start_ptes, etc) is going to happen
at a granularity of at least 16 PTEs - therefore we can translate this
operation to modify a single PTE entry in the native pagetable.
Given that enlightenment may miss corner cases, we insert a warning in the
architecture code - on being presented with an operation not translatable
into a native operation, we fallback to the Linux pagetable, thus losing
the benefits borne out of the pagetable geometry but keeping
the emulation intact.

-----------------------
What we want to discuss
-----------------------
 - Are there other arches which could benefit from this?
 - What level of compatibility we can achieve - is it even possible to
   contain userspace within the emulated ABI?
 - Rough edges of compatibility layer - pfnmaps, ksm, procfs, etc. For
   example, what happens when a 64K process opens a procfs file of
   a 4K process?
 - native pgtable implementation - perhaps inspiration can be taken
   from other arches with an involved pgtable logic (ppc, s390)?

-------------
Key Attendees
-------------
 - Ryan Roberts (co-presenter)
 - mm folks (David Hildenbrand, Matthew Wilcox, Liam Howlett, Lorenzo Stoakes,
             and many others)
 - arch folks

