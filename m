Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D76D6EBEC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 08:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4P3zYKiW7BBhb+lKRvX5zNC+DpWpX5subj2u3TQcUms=; b=q3bJC2rGoTtNaYqn5urTguGVfB
	J840XsZTANsl+CXgpNIfz5i6fdphkMd0MrMTNd49zybco4wXYfCA4ca7xiklHd0nw4HhoKCC78Jdb
	kam1O8QcE+gyUtfDc7YujpgCkG/rgB+1hErqbOeWvXUIlXGsqbPLKVrPk7BpBelvPQzDHB1gsXi5V
	M1bxrndWmbL/oMvv+P8g5WkYY2S3eN2sSN2eNTLrLApiGtMto0zqODMixKYJ253w26XQq/EPsQziR
	zhsEFeTnGxxEY/uwMUbvw/et4MUczfjJz13b42YxcHHlqH6sof7NbVXBMrD7N3b1Gtsd1LarU2top
	Hi0FlabA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGwJf-0000000HBVl-39rZ;
	Fri, 29 Nov 2024 08:25:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGwIh-0000000HBLE-0AvM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 08:24:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 523B3A43DAE;
	Fri, 29 Nov 2024 08:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C78C4CECF;
	Fri, 29 Nov 2024 08:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732868669;
	bh=TyO2QLua9PMQVGzO0KGbVnq2AiGW+Rw7plyMIVS9Zc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eEUjcVn2rSuMOTb8e39fWrckwFPWTb+56QmvjPUEpyNHm7iuOdCLMol9w+NAc+KMK
	 FIgm/sZVRFGmbxcrIVObeE/Gi+uEvNYLBfSwjICLI776wtvsL3CeLZ0xTC+p1QKyV+
	 ejc+720/GwWj/HNgAxjNyTeU91lMD0iAHxEfupjYY14dqaQqD8rwVZxgjzfnRlanIv
	 +nFnTk7eHghd5DADKRQGspLPpMXaNEIbntMMfTCmKPUGCEZgxFULXzusQHAhMi+L8S
	 9c98jHW3OOcGD2Jnvb232/FeNzbmse1JpxBUg4rjWDd5JDZfTwohDXsqBsj2De2Pmq
	 /sYQZsK7e8KhQ==
Date: Fri, 29 Nov 2024 10:24:16 +0200
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
Message-ID: <Z0l6MPWQ66GjAyOC@kernel.org>
References: <20241127193000.3702637-1-maz@kernel.org>
 <Z0gVxWstZdKvhY6m@kernel.org>
 <87y113s3lt.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y113s3lt.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_002431_167113_E8817559 
X-CRM114-Status: GOOD (  23.30  )
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

On Thu, Nov 28, 2024 at 04:52:14PM +0000, Marc Zyngier wrote:
> Hi Mike,
> 
> On Thu, 28 Nov 2024 07:03:33 +0000,
> Mike Rapoport <rppt@kernel.org> wrote:
> > 
> > Hi Marc,
> > 
> > > diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> > > index e187016764265..5457248eb0811 100644
> > > --- a/drivers/base/arch_numa.c
> > > +++ b/drivers/base/arch_numa.c
> > > @@ -207,7 +207,21 @@ static void __init setup_node_data(int nid, u64 start_pfn, u64 end_pfn)
> > >  static int __init numa_register_nodes(void)
> > >  {
> > >  	int nid;
> > > -
> > > +	struct memblock_region *mblk;
> > > +
> > > +	/* Check that valid nid is set to memblks */
> > > +	for_each_mem_region(mblk) {
> > > +		int mblk_nid = memblock_get_region_node(mblk);
> > > +		phys_addr_t start = mblk->base;
> > > +		phys_addr_t end = mblk->base + mblk->size - 1;
> > > +
> > > +		if (mblk_nid == NUMA_NO_NODE || mblk_nid >= MAX_NUMNODES) {
> > > +			pr_warn("Warning: invalid memblk node %d [mem %pap-%pap]\n",
> > > +				mblk_nid, &start, &end);
> > > +			return -EINVAL;
> > > +		}
> > 
> > We have memblock_validate_numa_coverage() that checks that amount of memory
> > with unset node id is less than a threshold. The loop here can be replaced
> > with something like
> > 
> > 	if (!memblock_validate_numa_coverage(0))
> > 		return -EINVAL;
> 
> Unfortunately, that doesn't seem to result in something that works
> (relevant extract only):
> 
> [    0.000000] NUMA: no nodes coverage for 9MB of 65516MB RAM
> [    0.000000] NUMA: Faking a node at [mem 0x0000000000500000-0x0000000fff0fffff]
> [    0.000000] NUMA: no nodes coverage for 0MB of 65516MB RAM
> [    0.000000] Unable to handle kernel paging request at virtual address 0000000000001d40
> 
> Any idea?

With 0 as the threshold the validation fails for the fake node, but it
should be fine with memblock_validate_numa_coverage(1)
 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

-- 
Sincerely yours,
Mike.

