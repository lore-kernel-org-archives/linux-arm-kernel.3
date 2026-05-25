Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EE8CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 15:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AzwE9k9QJF7DUyRnk+qmGDQkXJ2+kA/q8Ntjxx3//vI=; b=2zDpvB6p+EOJ64rm4sUqgU+VKe
	yLlyYDB0ztlgOsvlxORerhFnSLQamXNzqBclEOXcb4aSBNCAco41L6kaC5WEe/mG8t22n4OTKLJ6D
	mOn7wEuaS3CIbPPKqT0UIC2xeuB5pGu2tDdZGrYkC/8nMSlJ6RSiTgCcYnr9tsuLRuWWl1B4IYOxW
	n7nUzEXKKdqtx4zzAqJKnDDa+u5/LF8XcesruGefxoyZbLTgpWchfJvnibB8ZX1lef3t/KJRtQmt8
	JAcla639utZ+pvRciibmz6JgFQ2aIjWlLaeg+DgzSj815AkisYMBFSvGdsqRZuziVKd9DrGtig+hO
	yER3SuSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRWor-0000000HTdq-09dX;
	Mon, 25 May 2026 15:02:17 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRWon-0000000HTa7-44of
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 15:02:15 +0000
Message-ID: <8edc8cd0-f65c-4456-9b3f-362e744c9a96@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779721303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AzwE9k9QJF7DUyRnk+qmGDQkXJ2+kA/q8Ntjxx3//vI=;
	b=fsSvL3R+HyOLiJBlzetIGjmPzu1GfueYA9lAtGy2Z8SL3+P0kPz1vyGsKd+ewF7+yPqqfC
	/iuy4xlG2sBfvGWm8UGvpe2AWMCyGuQUPrUGljCAmlQ3kSIJHpayjMw01YvtZ7vJP62/sE
	FqH9kKksxanHmBQ196JOJTJSIlyErtA=
Date: Mon, 25 May 2026 16:01:19 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/2] mm: improve large folio readahead for exec memory
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, willy@infradead.org, ryan.roberts@arm.com,
 linux-mm@kvack.org, r@hev.cc, jack@suse.cz,
 Andrew Donnellan <andrew+kernel@donnellan.id.au>, apopple@nvidia.com,
 baohua@kernel.org, baolin.wang@linux.alibaba.com, brauner@kernel.org,
 catalin.marinas@arm.com, dev.jain@arm.com, kees@kernel.org,
 kevin.brodsky@arm.com, lance.yang@linux.dev,
 "Liam R.Howlett" <liam@infradead.org>, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, ljs@kernel.org,
 mhocko@suse.com, npache@redhat.com, pasha.tatashin@soleen.com,
 rmclure@linux.ibm.com, rppt@kernel.org, surenb@google.com,
 vbabka@kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 wilts.infradead.org@hp2.hsd1.ca.comcast.net, ziy@nvidia.com,
 hannes@cmpxchg.org, kas@kernel.org, shakeel.butt@linux.dev,
 kernel-team@meta.com
References: <20260522162422.3856502-1-usama.arif@linux.dev>
 <20260522122052.7b4ad7c482a0e4826296e392@linux-foundation.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20260522122052.7b4ad7c482a0e4826296e392@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_080214_164795_4D0B4EAC 
X-CRM114-Status: GOOD (  15.68  )
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



On 22/05/2026 20:20, Andrew Morton wrote:
> On Fri, 22 May 2026 09:23:46 -0700 Usama Arif <usama.arif@linux.dev> wrote:
> 
>> Two checks in do_sync_mmap_readahead() limit large-folio readahead:
>>
>>   1. The mmap_miss heuristic is meant to throttle wasteful speculative
>>      readahead. It is currently also applied to the VM_EXEC readahead
>>      path, which is targeted rather than speculative. Once mmap_miss exceeds
>>      MMAP_LOTSAMISS, exec readahead - including the large-folio
>>      order requested by exec_folio_order() - is disabled. On
>>      configurations where the mmap_miss decrement paths are not
>>      active (see patch 1) the counter only grows, so exec readahead
>>      is permanently disabled after the first 100 faults.
>>
>>   2. The force_thp_readahead path is gated only on
>>      HPAGE_PMD_ORDER <= MAX_PAGECACHE_ORDER and always drives the
>>      readahead at HPAGE_PMD_ORDER. Configurations where
>>      HPAGE_PMD_ORDER exceeds MAX_PAGECACHE_ORDER never reach this
>>      path, even when the mapping itself supports usefully large
>>      folios well below the cap.
>>
>> Both issues are most visible on arm64 with a 64K base page size,
>> where HPAGE_PMD_ORDER is 13 (512MB) -- above MAX_PAGECACHE_ORDER
>> (11) -- and where fault_around_pages collapses to 1 disabling
>> should_fault_around() (one of the two mmap_miss decrement sites).
>> However the fixes are architecture-agnostic: patch 1 reflects the
>> nature of VM_EXEC readahead regardless of base page size, and
>> patch 2 generalises the gate so any mapping advertising a usefully
>> large maximum folio order can benefit.
>>
>> I created a benchmark that mmaps a large executable file and calls
>> RET-stub functions at PAGE_SIZE offsets across it. "Cold" measures
>> fault + readahead cost. "Random" first faults in all pages with a
>> sequential sweep (not measured), then measures time for calling random
>> offsets, isolating iTLB miss cost for scattered execution.
>>
>> The benchmark results on Neoverse V2 (Grace), arm64 with 64K base pages,
>> 512MB executable file on ext4, averaged over 3 runs:
>>
>>   Phase      | Baseline     | Patched      | Improvement
>>   -----------|--------------|--------------|------------------
>>   Cold fault | 83.4 ms      | 41.3 ms      | 50% faster
>>   Random     | 76.0 ms      | 58.3 ms      | 23% faster
> 
> Well that's nice.
> 
> AI review might have found a few things:
> 	https://sashiko.dev/#/patchset/20260522162422.3856502-1-usama.arif@linux.dev
> 

Thanks Andrew! So sashiko seems to have brought out some interesting problems,
some of which are pre-existing. For example, the decrement sites for mmap_miss
in do_async_mmap_readahead() and filemap_map_pages() dont skip for VM_SEQ_READ.

I have sent this as an independent patch in [1].

I will send the next version of this series on top of [1] in a few days
addressing the rest of the issues raised by sashiko.

[1] https://lore.kernel.org/all/20260525145751.2671248-1-usama.arif@linux.dev/



