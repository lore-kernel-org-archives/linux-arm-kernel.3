Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384EAE909BA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 15:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3v3iihKPRUq2lJ7DpDwis3kzOh/HRjfIlqh2T2bN4Go=; b=F0315cYTzT8Bm5BsGaXWB3aDqR
	xJZkrJ17RTsna09lAquIGqllnsJmaR9Arq9rDis0wU4qoWJDAbiykrDCNvBtx/9CFh/JEb3LZN3Ht
	aLmMUZFTpHZtI9GqcuqF/YkNM+B6tDzPt7yi3yoUmXLnP49W7SKV4Z1Edz8AHfAzzMPm6qT6WobYS
	bSOqYrLi+97eRSCJ5Sz36N2TnmPcasayHZMXWSQMWqW4erbR3FxBriqAOGrl3qQsZALYjuVqElI+9
	q9nz9awacAkZE/1qmFIrZ8ofbkX3jvYf2Umwd0FRk4i4Qkmj+ceqm7vrjBEP+LovPv2iwuYox2pGZ
	BMags9Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMuU-00000008VJI-2SPI;
	Tue, 17 Feb 2026 15:22:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMuT-00000008VJC-0v4j
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Feb 2026 15:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3v3iihKPRUq2lJ7DpDwis3kzOh/HRjfIlqh2T2bN4Go=; b=cJhz2onesJWPuSPL6UovTP28i0
	YWnL2OjoVBVS3poln5ga6VoZExz7eNAGEfM4FuokslPZdMLlJFPjHjaEo6wAe+9oyBjseHroeEcMq
	D99BawkmyMO07Tjk+u4sm0GGA7M7WQ/MGKb4QKcuUmtMWuEQVWosFadafbHFUUO5iyVC6pHcVxQwU
	bSTrXdA5pYkE9riOouKrtZev5ZjrnzEYwbs0yDS4wYpTWUA5wkbjo2YFNuq9i4xaccVb0wLMzCuZ1
	po8qhRcjhPoOB8ryWMxC60GtPzIRAGxFemilPIBdgp6KKDlTbhRm/I3gBmVEZOJUj9QsjWWAz9gjJ
	vybrXPjw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMuM-00000004am9-3gxc;
	Tue, 17 Feb 2026 15:22:38 +0000
Date: Tue, 17 Feb 2026 15:22:38 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Dev Jain <dev.jain@arm.com>
Cc: lsf-pc@lists.linux-foundation.org, ryan.roberts@arm.com,
	catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org,
	hughd@google.com, baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org, david@kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [LSF/MM/BPF TOPIC] Per-process page size
Message-ID: <aZSHvt9Trlq7k7aH@casper.infradead.org>
References: <20260217145026.3880286-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217145026.3880286-1-dev.jain@arm.com>
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

On Tue, Feb 17, 2026 at 08:20:26PM +0530, Dev Jain wrote:
> 2. Generic Linux MM enlightenment
> ---------------------------------
> We enlighten the Linux MM code to always hand out memory in the granularity

Please don't use the term "enlighten".  Tht's used to describe something
something or other with hypervisors.  Come up with a new term or use one
that already exists.

> File memory
> -----------
> For a growing list of compliant file systems, large folios can already be
> stored in the page cache. There is even a mechanism, introduced to support
> filesystems with block sizes larger than the system page size, to set a
> hard-minimum size for folios on a per-address-space basis. This mechanism
> will be reused and extended to service the per-process page size requirements.
> 
> One key reason that the 64K kernel currently consumes considerably more memory
> than the 4K kernel is that Linux systems often have lots of small
> configuration files which each require a page in the page cache. But these
> small files are (likely) only used by certain processes. So, we prefer to
> continue to cache those using a 4K page.
> Therefore, if a process with a larger page size maps a file whose pagecache
> contains smaller folios, we drop them and re-read the range with a folio
> order at least that of the process order.

That's going to be messy.  I don't have a good idea for solving this
problem, but the page cache really isn't set up to change minimum folio
order while the inode is in use.

>  - Are there other arches which could benefit from this?

Some architectures walk the page tables entirely in software, but on the
other hand, those tend to be, er, "legacy" architectures these days and
it's doubtful that anybody would invest in adding support.

Sounds like a good question for Arnd ;-)

>  - What level of compatibility we can achieve - is it even possible to
>    contain userspace within the emulated ABI?
>  - Rough edges of compatibility layer - pfnmaps, ksm, procfs, etc. For
>    example, what happens when a 64K process opens a procfs file of
>    a 4K process?
>  - native pgtable implementation - perhaps inspiration can be taken
>    from other arches with an involved pgtable logic (ppc, s390)?

I question who decides what page size a particular process will use.
The programmer?  The sysadmin?  It seems too disruptive for the kernel
to monitor and decide for the app what page size it will use.

