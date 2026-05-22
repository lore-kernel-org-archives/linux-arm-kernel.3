Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98ACFCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 19:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t41QCwdiqyuL/UKBS3u23I5KZlwdlxk/ylC/Jp2AbcY=; b=j5PTy4Atn3VdruWtT5FvpFmu2A
	9vEnnxjdVzcyC/bI6BxU+ltjmRZDuR37k/zki9U3Sf9H26tnsxMR4t6tiKdfY836wNxMn34etVJ1t
	fRqZhQX+gL9uS+WuUGncIZYI6H/mimvq26Q01+C4sPdXmcIjSXQOujAPB35c35/EFyPU5/58QRhEl
	6bLMRv9rz3QChcVbRJWX4L7Kj2fgkkSDE8XcGKw7Uu/uPdhvHb8HFiTs/q+qdW7yxlHhfKSPCV0Je
	WmEeWMShbIB1SzYjK0JmN5kqBN3IVLdONZvt7QNjaRnc99fXrmy1dRzUr9YeBmwIC7O59FGTsTo2b
	ezHgYZmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVQV-0000000BlVr-371A;
	Fri, 22 May 2026 19:20:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVQU-0000000BlUx-3rDC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 19:20:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B45860138;
	Fri, 22 May 2026 19:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E196D1F000E9;
	Fri, 22 May 2026 19:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779477654;
	bh=t41QCwdiqyuL/UKBS3u23I5KZlwdlxk/ylC/Jp2AbcY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=A/Xjgqyk1TMDW6V1BLTgayE9RCsWIE9yAV8Ahj5igvqc76Y0csCoxRzu3JoPPg0lp
	 yZfvgJZZwy96Mlp4rZuIhW+34vQHUx/TiYBJvlzF4SF1yStcC2+jglAgfkotNCoWgg
	 VVERfOMw5o65zBF/g7at8k/EeS+l8Lmn6oI5XxCY=
Date: Fri, 22 May 2026 12:20:52 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: david@kernel.org, willy@infradead.org, ryan.roberts@arm.com,
 linux-mm@kvack.org, r@hev.cc, jack@suse.cz, Andrew Donnellan
 <andrew+kernel@donnellan.id.au>, apopple@nvidia.com, baohua@kernel.org,
 baolin.wang@linux.alibaba.com, brauner@kernel.org, catalin.marinas@arm.com,
 dev.jain@arm.com, kees@kernel.org, kevin.brodsky@arm.com,
 lance.yang@linux.dev, Liam R.Howlett <liam@infradead.org>,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, ljs@kernel.org, mhocko@suse.com,
 npache@redhat.com, pasha.tatashin@soleen.com, rmclure@linux.ibm.com,
 rppt@kernel.org, surenb@google.com, vbabka@kernel.org, Al Viro
 <viro@zeniv.linux.org.uk>, wilts.infradead.org@hp2.hsd1.ca.comcast.net,
 "linux-fsdevel@vger.kernel.l"@kernel.org, ziy@nvidia.com,
 hannes@cmpxchg.org, kas@kernel.org, shakeel.butt@linux.dev,
 kernel-team@meta.com
Subject: Re: [PATCH v5 0/2] mm: improve large folio readahead for exec
 memory
Message-Id: <20260522122052.7b4ad7c482a0e4826296e392@linux-foundation.org>
In-Reply-To: <20260522162422.3856502-1-usama.arif@linux.dev>
References: <20260522162422.3856502-1-usama.arif@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 22 May 2026 09:23:46 -0700 Usama Arif <usama.arif@linux.dev> wrote:

> Two checks in do_sync_mmap_readahead() limit large-folio readahead:
> 
>   1. The mmap_miss heuristic is meant to throttle wasteful speculative
>      readahead. It is currently also applied to the VM_EXEC readahead
>      path, which is targeted rather than speculative. Once mmap_miss exceeds
>      MMAP_LOTSAMISS, exec readahead - including the large-folio
>      order requested by exec_folio_order() - is disabled. On
>      configurations where the mmap_miss decrement paths are not
>      active (see patch 1) the counter only grows, so exec readahead
>      is permanently disabled after the first 100 faults.
> 
>   2. The force_thp_readahead path is gated only on
>      HPAGE_PMD_ORDER <= MAX_PAGECACHE_ORDER and always drives the
>      readahead at HPAGE_PMD_ORDER. Configurations where
>      HPAGE_PMD_ORDER exceeds MAX_PAGECACHE_ORDER never reach this
>      path, even when the mapping itself supports usefully large
>      folios well below the cap.
> 
> Both issues are most visible on arm64 with a 64K base page size,
> where HPAGE_PMD_ORDER is 13 (512MB) -- above MAX_PAGECACHE_ORDER
> (11) -- and where fault_around_pages collapses to 1 disabling
> should_fault_around() (one of the two mmap_miss decrement sites).
> However the fixes are architecture-agnostic: patch 1 reflects the
> nature of VM_EXEC readahead regardless of base page size, and
> patch 2 generalises the gate so any mapping advertising a usefully
> large maximum folio order can benefit.
> 
> I created a benchmark that mmaps a large executable file and calls
> RET-stub functions at PAGE_SIZE offsets across it. "Cold" measures
> fault + readahead cost. "Random" first faults in all pages with a
> sequential sweep (not measured), then measures time for calling random
> offsets, isolating iTLB miss cost for scattered execution.
> 
> The benchmark results on Neoverse V2 (Grace), arm64 with 64K base pages,
> 512MB executable file on ext4, averaged over 3 runs:
> 
>   Phase      | Baseline     | Patched      | Improvement
>   -----------|--------------|--------------|------------------
>   Cold fault | 83.4 ms      | 41.3 ms      | 50% faster
>   Random     | 76.0 ms      | 58.3 ms      | 23% faster

Well that's nice.

AI review might have found a few things:
	https://sashiko.dev/#/patchset/20260522162422.3856502-1-usama.arif@linux.dev



