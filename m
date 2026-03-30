Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A870810D14AD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 12:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ABb3mCmxINvfC74mwIx/aFMr/5W/YrJg7LRCk/iB4A=; b=gdcsKkdmkdDsXg78FDKD6Jmolc
	Y1sl2tH3yKmPRGbS58IfQF2/AygHIzVBSW6B+atxmlsi3qQQArM997uq/H72diHkqiVJf2RViyl9S
	l+9Kc3MCcFZ8rOG2GIOMOyq6vf9EqsLFS7fHfIk0YN49srM5C2CJBtdjbJyIIZFi1VFmkl1S0v4Ky
	TRdpyETfX68Ps+Qs8bLlS4SByMjNN2KDySwVHTg2pKXeS429xf7IQ+aoKju/6ZHmCy0t1XlTSQUre
	yFcGcNcfamWomyohSbi9GTjvCeiYQrT047LZtQ212SJBGf7UImLe44Cx46rlTE27m57klqhJQOktP
	41+Updew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CAE-0000000BIZM-1lV7;
	Mon, 30 Mar 2026 12:56:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CAD-0000000BIYp-07Q4
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Mar 2026 12:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6ABb3mCmxINvfC74mwIx/aFMr/5W/YrJg7LRCk/iB4A=; b=HIqM33CROqAhISIXKTEGIZr+1O
	bfqwa7rBYHRXXoGMNNncKV7ZqE/BQVqqNEY1+Vb4vLrFrpdabkJVms6fUnwJr5c1yMrzTIJgWV0ZK
	DVffrdyimh2J265xgwjnUlEkVa9ZyAomWfYJ8bsS3b097CgBA8e568vhSyMBl2xIvtO8GHH8XQJuF
	7v6bhdX97EaFCxpQ/pFgL14hRrYowpHKUF4Vi0v2DaDbugPZsiwh7a3MNLMG9ODGO9r6TOjOPdn4c
	MOiUJ8nhTS2w3wDLH0/nHuIO5uPc1MYZHLHeyFhK5ECQN/DF0+yLRGlim+PAOoYcVwpAXSARgi+X+
	/r/DNaEA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CA4-00000006gVN-2Qj0;
	Mon, 30 Mar 2026 12:56:08 +0000
Date: Mon, 30 Mar 2026 13:56:08 +0100
From: Matthew Wilcox <willy@infradead.org>
To: WANG Rui <r@hev.cc>
Cc: usama.arif@linux.dev, Liam.Howlett@oracle.com, ajd@linux.ibm.com,
	akpm@linux-foundation.org, apopple@nvidia.com, baohua@kernel.org,
	baolin.wang@linux.alibaba.com, brauner@kernel.org,
	catalin.marinas@arm.com, david@kernel.org, dev.jain@arm.com,
	jack@suse.cz, kees@kernel.org, kevin.brodsky@arm.com,
	lance.yang@linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, lorenzo.stoakes@oracle.com, mhocko@suse.com,
	npache@redhat.com, pasha.tatashin@soleen.com, rmclure@linux.ibm.com,
	rppt@kernel.org, ryan.roberts@arm.com, surenb@google.com,
	vbabka@kernel.org, viro@zeniv.linux.org.uk
Subject: Re: [PATCH v2 3/4] elf: align ET_DYN base to max folio size for PTE
 coalescing
Message-ID: <acpy6DLjPVXXzwJX@casper.infradead.org>
References: <0725ce97-b8a3-47c9-952f-7b512873cc35@linux.dev>
 <20260329043700.19355-1-r@hev.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329043700.19355-1-r@hev.cc>
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

On Sun, Mar 29, 2026 at 12:37:00PM +0800, WANG Rui wrote:
> > mapping_max_folio_size() reflects what the page cache will actually
> > allocate for a given filesystem, since readahead caps folio allocation
> > at mapping_max_folio_order() (in page_cache_ra_order()). If btrfs
> > reports PAGE_SIZE, readahead won't allocate large folios for it, so
> > there are no large folios to coalesce PTEs for, aligning the binary
> > beyond that would only reduce ASLR entropy for no benefit.
> > 
> > I don't think we should over-align binaries on filesystems that can't
> > take advantage of it.
> 
> Ah, it looks like this might be overlooking another path that can create
> huge page mappings for read-only code segments: even when the filesystem
> (e.g. btrfs without experimental) didn't support large folios,
> READ_ONLY_THP_FOR_FS still allowed read-only file-backed code segments
> to be collapsed into huge page mappings via khugepaged.
> 
> As Wilcox pointed out, it may take quite some time for many filesystems
> to gain full large folio support? So what I'm trying to clarify is that
> using mapping_max_folio_size() on this path is not favorable for
> khugepaged-based optimizations.

Nono, that's not what I'm pointing out!  btrfs is simply not putting
in the effort to support large folios, and that needs to change.
READ_ONLY_THP_FOR_FS unnecessaily burdens the rest of the kernel.
It was a great hack for its time and paved the path for a lot of what
we have today, but it's time to remove it.

