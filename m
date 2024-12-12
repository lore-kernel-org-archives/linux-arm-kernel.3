Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69301E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 22:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUU3k3ndx8hCjIEVI0vAEW5jsu/OGAg5GP0kOz2LdOQ=; b=jtCaWQILi0yO6n7y/7jf3m2ohN
	3fqgVyIEKghfRgYSBNt4+WYsggp1L91jhE9AnX1CMVB6m4ghitD88ojWJ0/3MeynfSP++rzGExQPs
	rdX7PSvelsIxihQUZmKvTia8sT7AKxTbNhDc/I03CuPRFX3CTva19QHGZX0UxoevcxDao+nVwc49C
	r/bfDBaSaTvPdMXrr6qPEZoGyg2QhQtlmLkkcVmI8ed9hq+R2lLVPOLYEBJ17W80LeNezfd1dgQ9t
	rK5DX6+DE5mIInC78NocUlfk/HFP5H2LujtmdUuQvPI5JOuHlfS0SIe62ThGkPG7c3Us6MzjAEgQs
	17lqC2Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLrGP-000000022hD-3ZMg;
	Thu, 12 Dec 2024 22:02:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLrFM-000000022Xx-1AWZ;
	Thu, 12 Dec 2024 22:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nUU3k3ndx8hCjIEVI0vAEW5jsu/OGAg5GP0kOz2LdOQ=; b=vATraj/l7BYi45J3o09OIopaxJ
	C8jNjTPCPsm9QpjuSJ1IY9oPT5mUdBMuSKqTmLPfzVHPEsRg9jIMEmxtX5EH+CBf2Ad5QJkAzCOb0
	QIBWWnrVmjlWPROLIj1nnhmGbebpQ72pM/mYvVSSI7b+XJoia4xx6JsI/qmb+lwoDY8J6kpWtw2sy
	nSq0P9/nMLk51OkHcgu7wfznTwDcJV87JcZ7lYZRgkl/n/cZDkdLwKwkwqCciizJ2Mw/AcIegRxYt
	kYJ96xWeFCCL6IUF+RLxWDxyxyavltxwOVk9mRXBnRhuepZag1Y3wIlzjK2IUkkHDKONd/95VcvEW
	bk/ki6/Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tLrFA-00000008PIi-3DGS;
	Thu, 12 Dec 2024 22:01:12 +0000
Date: Thu, 12 Dec 2024 22:01:12 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Kalesh Singh <kaleshsingh@google.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com,
	riel@surriel.com, david@redhat.com, minchan@kernel.org,
	jyescas@google.com, linux@armlinux.org.uk,
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com,
	ysato@users.sourceforge.jp, dalias@libc.org,
	glaubitz@physik.fu-berlin.de, davem@davemloft.net,
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net,
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com,
	leitao@debian.org, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	kernel-team@android.com, android-mm@google.com
Subject: Re: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
Message-ID: <Z1tdKHFfz-tMTXit@casper.infradead.org>
References: <20241211232754.1583023-1-kaleshsingh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
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

On Wed, Dec 11, 2024 at 03:27:38PM -0800, Kalesh Singh wrote:
> Hi all,
> 
> This is v2 othe the arch_mmap_hint() series.
> 
> Changes in v2:
>   - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
>     special case of the hint addr being "enforced", per Yang Shi.
>   - Consolidate most of the error handling in arch_mmap_hint().
>   - Patch 16 ("mm: Fallback to generic_mmap_hint()") was folded into
>     Patch 2 ("mm: x86: Introduce arch_mmap_hint()")
> 
> v1: https://lore.kernel.org/r/20241210024119.2488608-1-kaleshsingh@google.com/
> 
> =======
> 
> This series introduces arch_mmap_hint() to handle allocating VA space
> for the hint address.

But why?  You're basically forcing me to read the entire series to
figure out what you're doing and why.  I decline.

> Patches 1-16 introduce this new helper and Patch 17 uses it to fix the
> issue of mmap hint being ignored in some cases due to THP alignment [1]
> 
> [1] https://lore.kernel.org/r/20241118214650.3667577-1-kaleshsingh@google.com/
> 
> Thanks,
> Kalesh
> 
> 
> Kalesh Singh (16):
>   mm: Introduce generic_mmap_hint()
>   mm: x86: Introduce arch_mmap_hint()
>   mm: arm: Introduce arch_mmap_hint()
>   mm: alpha: Introduce arch_mmap_hint()
>   mm: arc: Use generic_mmap_hint()
>   mm: csky: Introduce arch_mmap_hint()
>   mm: loongarch: Introduce arch_mmap_hint()
>   mm: mips: Introduce arch_align_mmap_hint()
>   mm: parisc: Introduce arch_align_mmap_hint()
>   mm: s390: Use generic_mmap_hint()
>   mm: sh: Introduce arch_mmap_hint()
>   mm: sparc32: Introduce arch_mmap_hint()
>   mm: sparc64: Introduce arch_mmap_hint()
>   mm: xtensa: Introduce arch_mmap_hint()
>   mm: powerpc: Introduce arch_mmap_hint()
>   mm: Respect mmap hint before THP alignment if allocation is possible
> 
>  arch/alpha/include/asm/pgtable.h           |   1 +
>  arch/alpha/kernel/osf_sys.c                |  31 +++---
>  arch/arc/include/asm/pgtable.h             |   1 +
>  arch/arc/mm/mmap.c                         |  43 +++++----
>  arch/arm/include/asm/pgtable.h             |   1 +
>  arch/arm/mm/mmap.c                         | 107 +++++++++------------
>  arch/csky/abiv1/inc/abi/pgtable-bits.h     |   1 +
>  arch/csky/abiv1/mmap.c                     |  68 +++++++------
>  arch/loongarch/include/asm/pgtable.h       |   1 +
>  arch/loongarch/mm/mmap.c                   |  49 +++++-----
>  arch/mips/include/asm/pgtable.h            |   1 +
>  arch/mips/mm/mmap.c                        |  50 +++++-----
>  arch/parisc/include/asm/pgtable.h          |   1 +
>  arch/parisc/kernel/sys_parisc.c            |  53 +++++-----
>  arch/powerpc/include/asm/book3s/64/slice.h |   1 +
>  arch/powerpc/mm/book3s64/slice.c           |  31 ++++++
>  arch/s390/include/asm/pgtable.h            |   1 +
>  arch/s390/mm/mmap.c                        |  51 +++++-----
>  arch/sh/include/asm/pgtable.h              |   1 +
>  arch/sh/mm/mmap.c                          |  83 ++++++----------
>  arch/sparc/include/asm/pgtable_32.h        |   1 +
>  arch/sparc/include/asm/pgtable_64.h        |   1 +
>  arch/sparc/kernel/sys_sparc_32.c           |  33 ++++---
>  arch/sparc/kernel/sys_sparc_64.c           |  96 +++++++-----------
>  arch/x86/include/asm/pgtable_64.h          |   1 +
>  arch/x86/kernel/sys_x86_64.c               |  64 ++++++------
>  arch/xtensa/kernel/syscall.c               |  31 ++++--
>  include/linux/sched/mm.h                   |   9 ++
>  mm/huge_memory.c                           |  17 ++--
>  mm/mmap.c                                  |  86 +++++++++++------
>  30 files changed, 491 insertions(+), 424 deletions(-)
> 
> -- 
> 2.47.0.338.g60cca15819-goog
> 
> 

