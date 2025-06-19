Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C911C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 11:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+XNSvZbWjpBGiyn2+C6g1oWjvS2/pETqArF+mwNeSw=; b=Z0fEOQC7zmeAPy3N8TAAZXPM0I
	euHeU9Y5YgQd+p2rN64izGBd7MoLuD2nbGYFwA5Kmc4X9Ga7B6/ll8h25ysR4RTi2I1laU0SaM/kf
	730vES/vbACfIG4vE4IJSpEKgce4xtzdd6r1/6kB2nMs5YZ4rfaHK3CmuV+EOVIS+5yynVwh6vj7+
	PYfPnBexuGZnyEzin6MxDUgaynBnts/qkaz9xUihv8iIAl5gBBPq6pY5qWMNKnTpnewWznnJlSXJc
	0/3P7/542903GzsAov1FqAQC2NEOWVmfCGRqgViq1k799L7GqUd6aIWbmkessTphwWu8OZi/XFnZK
	8t+r0SAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDh6-0000000CvnO-3MWj;
	Thu, 19 Jun 2025 11:44:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSD6r-0000000CoUI-405J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 11:07:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C13C8113E;
	Thu, 19 Jun 2025 04:06:48 -0700 (PDT)
Received: from [10.57.84.221] (unknown [10.57.84.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BC913F58B;
	Thu, 19 Jun 2025 04:07:06 -0700 (PDT)
Message-ID: <ea7f9da7-9a9f-4b85-9d0a-35b320f5ed25@arm.com>
Date: Thu, 19 Jun 2025 12:07:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] mm/filemap: Allow arch to request folio size for
 exec memory
Content-Language: en-GB
To: Andrew Morton <akpm@linux-foundation.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 David Hildenbrand <david@redhat.com>, Dave Chinner <david@fromorbit.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Kalesh Singh <kaleshsingh@google.com>, Zi Yan <ziy@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
References: <20250609092729.274960-1-ryan.roberts@arm.com>
 <20250609092729.274960-6-ryan.roberts@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250609092729.274960-6-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_040710_085138_B29FB403 
X-CRM114-Status: GOOD (  35.62  )
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

Hi Andrew,

On 09/06/2025 10:27, Ryan Roberts wrote:
> Change the readahead config so that if it is being requested for an
> executable mapping, do a synchronous read into a set of folios with an
> arch-specified order and in a naturally aligned manner. We no longer
> center the read on the faulting page but simply align it down to the
> previous natural boundary. Additionally, we don't bother with an
> asynchronous part.
> 
> On arm64 if memory is physically contiguous and naturally aligned to the
> "contpte" size, we can use contpte mappings, which improves utilization
> of the TLB. When paired with the "multi-size THP" feature, this works
> well to reduce dTLB pressure. However iTLB pressure is still high due to
> executable mappings having a low likelihood of being in the required
> folio size and mapping alignment, even when the filesystem supports
> readahead into large folios (e.g. XFS).
> 
> The reason for the low likelihood is that the current readahead
> algorithm starts with an order-0 folio and increases the folio order by
> 2 every time the readahead mark is hit. But most executable memory tends
> to be accessed randomly and so the readahead mark is rarely hit and most
> executable folios remain order-0.
> 
> So let's special-case the read(ahead) logic for executable mappings. The
> trade-off is performance improvement (due to more efficient storage of
> the translations in iTLB) vs potential for making reclaim more difficult
> (due to the folios being larger so if a part of the folio is hot the
> whole thing is considered hot). But executable memory is a small portion
> of the overall system memory so I doubt this will even register from a
> reclaim perspective.
> 
> I've chosen 64K folio size for arm64 which benefits both the 4K and 16K
> base page size configs. Crucially the same amount of data is still read
> (usually 128K) so I'm not expecting any read amplification issues. I
> don't anticipate any write amplification because text is always RO.
> 
> Note that the text region of an ELF file could be populated into the
> page cache for other reasons than taking a fault in a mmapped area. The
> most common case is due to the loader read()ing the header which can be
> shared with the beginning of text. So some text will still remain in
> small folios, but this simple, best effort change provides good
> performance improvements as is.
> 
> Confine this special-case approach to the bounds of the VMA. This
> prevents wasting memory for any padding that might exist in the file
> between sections. Previously the padding would have been contained in
> order-0 folios and would be easy to reclaim. But now it would be part of
> a larger folio so more difficult to reclaim. Solve this by simply not
> reading it into memory in the first place.
> 
> Benchmarking
> ============
> 
> The below shows pgbench and redis benchmarks on Graviton3 arm64 system.
> 
> First, confirmation that this patch causes more text to be contained in
> 64K folios:
> 
> +----------------------+---------------+---------------+---------------+
> | File-backed folios by|  system boot  |    pgbench    |     redis     |
> | size as percentage of+-------+-------+-------+-------+-------+-------+
> | all mapped text mem  |before | after |before | after |before | after |
> +======================+=======+=======+=======+=======+=======+=======+
> | base-page-4kB        |   78% |   30% |   78% |   11% |   73% |   14% |
> | thp-aligned-8kB      |    1% |    0% |    0% |    0% |    1% |    0% |
> | thp-aligned-16kB     |   17% |    4% |   17% |    3% |   20% |    4% |
> | thp-aligned-32kB     |    1% |    1% |    1% |    2% |    1% |    1% |
> | thp-aligned-64kB     |    3% |   63% |    3% |   81% |    4% |   77% |
> | thp-aligned-128kB    |    0% |    1% |    1% |    1% |    1% |    2% |
> | thp-unaligned-64kB   |    0% |    0% |    0% |    1% |    0% |    1% |
> | thp-unaligned-128kB  |    0% |    1% |    0% |    0% |    0% |    0% |
> | thp-partial          |    0% |    0% |    0% |    1% |    0% |    1% |
> +----------------------+-------+-------+-------+-------+-------+-------+
> | cont-aligned-64kB    |    4% |   65% |    4% |   83% |    6% |   79% |
> +----------------------+-------+-------+-------+-------+-------+-------+
> 
> The above shows that for both workloads (each isolated with cgroups) as
> well as the general system state after boot, the amount of text backed
> by 4K and 16K folios reduces and the amount backed by 64K folios
> increases significantly. And the amount of text that is contpte-mapped
> significantly increases (see last row).
> 
> And this is reflected in performance improvement. "(I)" indicates a
> statistically significant improvement. Note TPS and Reqs/sec are rates
> so bigger is better, ms is time so smaller is better:
> 
> +-------------+-------------------------------------------+------------+
> | Benchmark   | Result Class                              | Improvemnt |
> +=============+===========================================+============+
> | pts/pgbench | Scale: 1 Clients: 1 RO (TPS)              |  (I) 3.47% |
> |             | Scale: 1 Clients: 1 RO - Latency (ms)     |     -2.88% |
> |             | Scale: 1 Clients: 250 RO (TPS)            |  (I) 5.02% |
> |             | Scale: 1 Clients: 250 RO - Latency (ms)   | (I) -4.79% |
> |             | Scale: 1 Clients: 1000 RO (TPS)           |  (I) 6.16% |
> |             | Scale: 1 Clients: 1000 RO - Latency (ms)  | (I) -5.82% |
> |             | Scale: 100 Clients: 1 RO (TPS)            |      2.51% |
> |             | Scale: 100 Clients: 1 RO - Latency (ms)   |     -3.51% |
> |             | Scale: 100 Clients: 250 RO (TPS)          |  (I) 4.75% |
> |             | Scale: 100 Clients: 250 RO - Latency (ms) | (I) -4.44% |
> |             | Scale: 100 Clients: 1000 RO (TPS)         |  (I) 6.34% |
> |             | Scale: 100 Clients: 1000 RO - Latency (ms)| (I) -5.95% |
> +-------------+-------------------------------------------+------------+
> | pts/redis   | Test: GET Connections: 50 (Reqs/sec)      |  (I) 3.20% |
> |             | Test: GET Connections: 1000 (Reqs/sec)    |  (I) 2.55% |
> |             | Test: LPOP Connections: 50 (Reqs/sec)     |  (I) 4.59% |
> |             | Test: LPOP Connections: 1000 (Reqs/sec)   |  (I) 4.81% |
> |             | Test: LPUSH Connections: 50 (Reqs/sec)    |  (I) 5.31% |
> |             | Test: LPUSH Connections: 1000 (Reqs/sec)  |  (I) 4.36% |
> |             | Test: SADD Connections: 50 (Reqs/sec)     |  (I) 2.64% |
> |             | Test: SADD Connections: 1000 (Reqs/sec)   |  (I) 4.15% |
> |             | Test: SET Connections: 50 (Reqs/sec)      |  (I) 3.11% |
> |             | Test: SET Connections: 1000 (Reqs/sec)    |  (I) 3.36% |
> +-------------+-------------------------------------------+------------+
> 
> Reviewed-by: Jan Kara <jack@suse.cz>
> Acked-by: Will Deacon <will@kernel.org>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>


A use-after-free issue was reported againt this patch, which I believe is still
in mm-unstable? The problem is that I'm accessing the vma after unlocking it. So
the fix is to move the unlock to after the if/else. Would you mind squashing
this into the patch?

The report is here:
https://lore.kernel.org/linux-mm/hi6tsbuplmf6jcr44tqu6mdhtyebyqgsfif7okhnrzkcowpo4d@agoyrl4ozyth/

---8<---
diff --git a/mm/filemap.c b/mm/filemap.c
index 93fbc2ef232a..eaf853d6b719 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3265,7 +3265,6 @@ static struct file *do_sync_mmap_readahead(struct vm_fault
*vmf)
 	if (mmap_miss > MMAP_LOTSAMISS)
 		return fpin;

-	fpin = maybe_unlock_mmap_for_io(vmf, fpin);
 	if (vm_flags & VM_EXEC) {
 		/*
 		 * Allow arch to request a preferred minimum folio order for
@@ -3299,6 +3298,8 @@ static struct file *do_sync_mmap_readahead(struct vm_fault
*vmf)
 		ra->async_size = ra->ra_pages / 4;
 		ra->order = 0;
 	}
+
+	fpin = maybe_unlock_mmap_for_io(vmf, fpin);
 	ractl._index = ra->start;
 	page_cache_ra_order(&ractl, ra);
 	return fpin;
---8<---

Thanks,
Ryan


