Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE2EC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 22:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cc5P5hGT8omPbAoKUs5LB2twNDU/1hPEvDD6Kld6z5Y=; b=HRcowQxgdAxbtAQgcOCFwpZKyM
	FubD4cWvVKrfeT05DRecdAw8XJ5IbS6/rVlNbOH4JJXwDloCK0Zt3gt+bB7hqMsp6NX6NgwYYnuEr
	4ypvwayARQ0PKj5U8Ohn+9gR5hy8YZ8E658eASHmPCutD8ZERyxpUpbL4/MaHncg3GuMau5gYK7oP
	6eBdOud+6Vqp37Jg/k7TCb1g+xXeH1WAYb6DYBi3P6y9RWhLHkGqDSVwndAIJ4+5qShbqWgNKHi0x
	yirlzE7gMFeG0H29UAd3qJtplIyy6Hpss76fJGRWIoMxceZRJ1klZ9kZ1/nS2bs4Qd8gswvVwqrsS
	1AGUYdRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyIYR-0000000EQgo-14UC;
	Fri, 28 Mar 2025 22:51:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyIWi-0000000EQcH-1YSY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 22:50:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06E6E6115E;
	Fri, 28 Mar 2025 22:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C00BC4CEE5;
	Fri, 28 Mar 2025 22:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743202210;
	bh=pIhGQE/1P2w/Z6ls3ujHTWGCRkN+4MM0yocX26uPY40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XJ3f5Km6mArkj8v01eNpCYx7SZ40tboCBXWtdtmqATSFapWM1xgUuCuACHaSmbHrs
	 lD+Ix4vvP0uZAW/7qXQM2aK4fFMJDX0pYiqxyYTNeIWLJfxnvr3WFi806A3XtkWIEr
	 oFdnRYIRlphqA5hM5W6nFw3/eO+eak625GqZ/etC7BFxtPIOtTpSYTwxw4MR0KSJxI
	 b1i8Y2bvPUQKBhleqQWokXdfbePYoU2qW4J9DuA/gebeqg5CJ9WMkTDJB6Zxqr+aP1
	 /1xgWGriqqsBNYs6/fLHFoZD9Pn7Vg6CrjCChlMgfWhv3CEYjN7+p+nCB5rj8pqcwh
	 RKerLvIYlyO6w==
Date: Sat, 29 Mar 2025 01:50:02 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, gshan@redhat.com,
	steven.price@arm.com, suzuki.poulose@arm.com,
	tianyaxiong@kylinos.cn, ardb@kernel.org, david@redhat.com,
	ryan.roberts@arm.com, urezki@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
Message-ID: <Z-cnmklGUojMzsUF@kernel.org>
References: <20250328062103.79462-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328062103.79462-1-dev.jain@arm.com>
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

On Fri, Mar 28, 2025 at 11:51:03AM +0530, Dev Jain wrote:
> arm64 uses apply_to_page_range to change permissions for kernel VA mappings,

                                                     for vmalloc mappings ^

arm64 does not allow changing permissions to any VA address right now.

> which does not support changing permissions for leaf mappings. This function
> will change permissions until it encounters a leaf mapping, and will bail
> out. To avoid this partial change, explicitly disallow changing permissions
> for VM_ALLOW_HUGE_VMAP mappings.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  arch/arm64/mm/pageattr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 39fd1f7ff02a..8337c88eec69 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -96,7 +96,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	 * we are operating on does not result in such splitting.
>  	 *
>  	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
> -	 * Those are guaranteed to consist entirely of page mappings, and
> +	 * Disallow VM_ALLOW_HUGE_VMAP vmalloc mappings so that

I'd keep mention of page mappings in the comment, e.g

	* Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
	* mappings are updated and splitting is never needed.

With this and changelog updates Ryan asked for

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>


>  	 * splitting is never needed.
>  	 *
>  	 * So check whether the [addr, addr + size) interval is entirely
> @@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	area = find_vm_area((void *)addr);
>  	if (!area ||
>  	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
> -	    !(area->flags & VM_ALLOC))
> +	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>  		return -EINVAL;
>  
>  	if (!numpages)
> -- 
> 2.30.2
> 

-- 
Sincerely yours,
Mike.

