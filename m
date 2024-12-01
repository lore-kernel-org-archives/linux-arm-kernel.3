Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C49D49789
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 19:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66+8FlAwY7DVgYaeOj43qC699X56h6Q0qnv9RiYMNuc=; b=nLMloPHTzOJTP1v2CvTSgkHLJB
	t1GJbEUHxT0vFh3S+neJwxCHeR7hYmCYHeUkolXU/Po/COonLVY7OL3Qu4CDwnRGYDhRxv/HKjVNi
	AIh9je+tAIEtk6wXKsjPfssT6guzOdO4mBTJ42zE6FffMThBw0gnvVnBEunacgWNkkk+3l41RT5LX
	kvBrroeCGawEUBLLJuIG0Et97PGnc5+AfXiDCDmgPNIdRXlNp2QPvR88CAZcESAcEHX/TjMgg+g8K
	seip2yK0EFmUgJiPgmzkPR2xYSvDpNwlaZAyWd+kvyYhjFOFdkdShb+5eWXpxCX5kAYpimy9E2D+J
	xmyMBf7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHphc-00000004Gq3-31l9;
	Sun, 01 Dec 2024 19:33:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHpgM-00000004GgI-15Mb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 19:32:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 34D245C635E;
	Sun,  1 Dec 2024 19:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82136C4CECF;
	Sun,  1 Dec 2024 19:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733081556;
	bh=l9RHBC8wCeeRN8ABmdLHDhuo5vPgGKTTEL9xHeuZUpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gn6uQ6V/gcYn6ztVD25Yi6lDzqQB5XNyZbl4SIOnIHmqH0Gr1i5OsxAHt34jbJRkv
	 8P5gfAOR7+eGggDFr8KKpd5cQiPKl3b0ojVBc1w7c15ejd9GC2MNntbq5TeT/hMlwF
	 83HIpBx695idmM17uxZsjDwT+cNWOrgoyi8iYM9HtizFnrsuV7l9MKIx7zjAyHw75y
	 +D4RZ+6QYVhVdZZMLHdFfK8qQbAFcNWETPkhHBuFhppL2rlLeh6V7BArufXyQK3WMd
	 NdtWkMeKpmnXc7Qud9rl6xDHTRTKfUnGMpFxsjwezXF1DKG8dVBNFb1/Wvy9DyKaNt
	 WHQGJodTbweZg==
Date: Sun, 1 Dec 2024 21:32:22 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Dan Williams <dan.j.williams@intel.com>,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2] arch_numa: Restore nid checks before registering a
 memblock with a node
Message-ID: <Z0y5xsGgtJrSkyBe@kernel.org>
References: <20241201092702.3792845-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241201092702.3792845-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_113238_339178_66AE7A5E 
X-CRM114-Status: GOOD (  23.54  )
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

Hi Marc,

On Sun, Dec 01, 2024 at 09:27:02AM +0000, Marc Zyngier wrote:
> Commit 767507654c22 ("arch_numa: switch over to numa_memblks")
> significantly cleaned up the NUMA registration code, but also
> dropped a significant check that was refusing to accept to
> configure a memblock with an invalid nid.

... 
 
> while previous kernel versions were able to recognise how brain-damaged
> the machine is, and only build a fake node.
> 
> Use the memblock_validate_numa_coverage() helper to restore some sanity
> and a "working" system.
> 
> Fixes: 767507654c22 ("arch_numa: switch over to numa_memblks")
> Suggested-by: Mike Rapoport <rppt@kernel.org>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: stable@vger.kernel.org
> ---
>  drivers/base/arch_numa.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> index e187016764265..c63a72a1fed64 100644
> --- a/drivers/base/arch_numa.c
> +++ b/drivers/base/arch_numa.c
> @@ -208,6 +208,10 @@ static int __init numa_register_nodes(void)
>  {
>  	int nid;
>  
> +	/* Check the validity of the memblock/node mapping */
> +	if (!memblock_validate_numa_coverage(1))

I've changed this to memblock_validate_numa_coverage(0) and applied along
with my patch that changed memblock_validate_numa_coverage() to work with
0:

https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git/log/?h=thunderx-fix

Can you please verify that it works on your "quality hardware"?

> +		return -EINVAL;
> +
>  	/* Finally register nodes. */
>  	for_each_node_mask(nid, numa_nodes_parsed) {
>  		unsigned long start_pfn, end_pfn;
> -- 
> 2.39.2

-- 
Sincerely yours,
Mike.

