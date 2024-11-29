Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87345D6EBF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 09:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uE1m/qeDr/INGl80kqbsD1pNbFA3dcGoa0vVXT4ZHyQ=; b=N/IdONXJZ+dZ7WiDALs5OKzc/8
	hBGvxBr2xDXnJ6FBHOuxV3aBtPGUZG98/Msa4KS/99M+ymoK/bfR/EPz2pfmOU4g1FkFoJVKRFwOA
	kE/tTEOVHj+6Zadaw5lws6NaKdtNWBZGxRmyyB6rwgNrXajTe//X09vRwbCdF0/sY3NbPGJMu33BR
	yJmLhOr5hv4nFdKSMXUKZBxo27G5nyBmIKvQACiFqb41bQ4Rnetv7+AiffgEF0tOLjQl5/8j0b03b
	CmCotxkb7jSVs/AJdG2btRNCPqTlW2Sj4+1bOmHwo/o9IFpeWJUwhFKyJ/V/t47i/FtnJHYs4BmS2
	5zGuYYbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGxEt-0000000HJzP-2ny2;
	Fri, 29 Nov 2024 09:24:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGxDu-0000000HJnY-42Cu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 09:23:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 236445C5703;
	Fri, 29 Nov 2024 09:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2AB0C4CECF;
	Fri, 29 Nov 2024 09:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732872218;
	bh=U7SnWYNG5aseGqVDBZQRYjC0oqz+X5HcHgFpn1GDLNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pznCXRW2tZpLBh+VwvXQ7WwJezCk6QmC77dABI64Et9uQaIICuScdtVpLmUukNVG4
	 GDhutLyfl/afUkQ3DtLsGD+4SA6+AZO7QL+hVSs+t8AzMsRLyrw9ioGq3kNGGN5RRl
	 i7Gn4ceCeC0qTy3wbN9EWMLemStK6lzANyn/Kx9xO1sImX+sVlXhgN1AKyQ1OWFTCS
	 zTOaVMAr+pGF4Uc3+46Jaaj8GkbgdBKVWbwZ9I2In6EQshOlZXG57XAtWNGm1diE7l
	 uPO59QKZ/8/wjwV+awom/hW6lLY3SngBAdF7yjSM5ijglrfuv4ckjvXWVRKAmJ/jMh
	 XaKioSwRGgCeg==
Date: Fri, 29 Nov 2024 11:23:24 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Dan Williams <dan.j.williams@intel.com>,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org
Subject: Re: [PATCH] arch_numa: Restore nid checks before registering a
 memblock with a node
Message-ID: <Z0mIDBD4KLyxyOCm@kernel.org>
References: <20241127193000.3702637-1-maz@kernel.org>
 <Z0gVxWstZdKvhY6m@kernel.org>
 <87y113s3lt.wl-maz@kernel.org>
 <Z0l6MPWQ66GjAyOC@kernel.org>
 <87v7w6sa5s.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7w6sa5s.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_012339_093844_20FBFF3A 
X-CRM114-Status: GOOD (  35.72  )
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

On Fri, Nov 29, 2024 at 08:42:55AM +0000, Marc Zyngier wrote:
> On Fri, 29 Nov 2024 08:24:16 +0000,
> Mike Rapoport <rppt@kernel.org> wrote:
> > 
> > On Thu, Nov 28, 2024 at 04:52:14PM +0000, Marc Zyngier wrote:
> > > Hi Mike,
> > > 
> > > On Thu, 28 Nov 2024 07:03:33 +0000,
> > > Mike Rapoport <rppt@kernel.org> wrote:
> > > > 
> > > > Hi Marc,
> > > > 
> > > > > diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> > > > > index e187016764265..5457248eb0811 100644
> > > > > --- a/drivers/base/arch_numa.c
> > > > > +++ b/drivers/base/arch_numa.c
> > > > > @@ -207,7 +207,21 @@ static void __init setup_node_data(int nid, u64 start_pfn, u64 end_pfn)
> > > > >  static int __init numa_register_nodes(void)
> > > > >  {
> > > > >  	int nid;
> > > > > -
> > > > > +	struct memblock_region *mblk;
> > > > > +
> > > > > +	/* Check that valid nid is set to memblks */
> > > > > +	for_each_mem_region(mblk) {
> > > > > +		int mblk_nid = memblock_get_region_node(mblk);
> > > > > +		phys_addr_t start = mblk->base;
> > > > > +		phys_addr_t end = mblk->base + mblk->size - 1;
> > > > > +
> > > > > +		if (mblk_nid == NUMA_NO_NODE || mblk_nid >= MAX_NUMNODES) {
> > > > > +			pr_warn("Warning: invalid memblk node %d [mem %pap-%pap]\n",
> > > > > +				mblk_nid, &start, &end);
> > > > > +			return -EINVAL;
> > > > > +		}
> > > > 
> > > > We have memblock_validate_numa_coverage() that checks that amount of memory
> > > > with unset node id is less than a threshold. The loop here can be replaced
> > > > with something like
> > > > 
> > > > 	if (!memblock_validate_numa_coverage(0))
> > > > 		return -EINVAL;
> > > 
> > > Unfortunately, that doesn't seem to result in something that works
> > > (relevant extract only):
> > > 
> > > [    0.000000] NUMA: no nodes coverage for 9MB of 65516MB RAM
> > > [    0.000000] NUMA: Faking a node at [mem 0x0000000000500000-0x0000000fff0fffff]
> > > [    0.000000] NUMA: no nodes coverage for 0MB of 65516MB RAM
> > > [    0.000000] Unable to handle kernel paging request at virtual address 0000000000001d40
> > > 
> > > Any idea?
> > 
> > With 0 as the threshold the validation fails for the fake node, but it
> > should be fine with memblock_validate_numa_coverage(1)
> 
> Huh, subtle. This indeed seems to work. I'll respin the patch next week.

With the patch below memblock_validate_numa_coverage(0) should also work
and it makes more sense.

@Andrew, I can take both this and Marc's new patch via memblock tree if you
prefer.

From de55af44c02bc9aa43f05a785ac66a5aafa43354 Mon Sep 17 00:00:00 2001
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Fri, 29 Nov 2024 11:13:47 +0200
Subject: [PATCH] memblock: allow zero threshold in validate_numa_converage()

Currently memblock validate_numa_converage() returns false negative when
threshold set to zero.

Make the check if the memory size with invalid node ID is greater than
the threshold exclusive to fix that.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/memblock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/memblock.c b/mm/memblock.c
index 0389ce5cd281..095c18b5c430 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -735,7 +735,7 @@ int __init_memblock memblock_add(phys_addr_t base, phys_addr_t size)
 /**
  * memblock_validate_numa_coverage - check if amount of memory with
  * no node ID assigned is less than a threshold
- * @threshold_bytes: maximal number of pages that can have unassigned node
+ * @threshold_bytes: maximal memory size that can have unassigned node
  * ID (in bytes).
  *
  * A buggy firmware may report memory that does not belong to any node.
@@ -755,7 +755,7 @@ bool __init_memblock memblock_validate_numa_coverage(unsigned long threshold_byt
 			nr_pages += end_pfn - start_pfn;
 	}
 
-	if ((nr_pages << PAGE_SHIFT) >= threshold_bytes) {
+	if ((nr_pages << PAGE_SHIFT) > threshold_bytes) {
 		mem_size_mb = memblock_phys_mem_size() >> 20;
 		pr_err("NUMA: no nodes coverage for %luMB of %luMB RAM\n",
 		       (nr_pages << PAGE_SHIFT) >> 20, mem_size_mb);
-- 
2.45.2

 
> Thanks for your help,
> 
> 	M.

-- 
Sincerely yours,
Mike.

