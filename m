Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFBEC71150
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 07:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVvYXz6wUvp3En0Ra38+d3WL0JSdDoIIFx/YyoeGpK0=; b=R6gtxycUt250nWgjgM9d+xmXc9
	4kCcc8x4y7WTd9k4574m5lZAONLO3MAwlWsMbwBeKqk1HXaOzM3OTSMKWBiN0EYODyKsIpdnFh9iV
	Hx3fVzCopExopC8CUGoDnCowm/IpOIIj0R7D7e9nnBY6frD4BbJKTxl/87hcDEMZz3/JTwDq5QxMZ
	QggE2EmNSJ4wy+nJL/k6ZU514BKBIotbCt/5/dkYBBbs4FrgXq/QOmxGxHFrdNUr0lnEOMovRU20X
	7Tj+z8y3ZsjL4N22CvWJnCczYTCWt6Yjtdo+VX7fw/Hk2ylOUuCQC82N6S0ti1XOSSUMVAGi9fbQd
	5c2CKENA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQhth-00000002KUu-2JIe;
	Sun, 15 Jun 2025 07:35:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQhrV-00000002KPn-1nyD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Jun 2025 07:33:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 682FF5C4105;
	Sun, 15 Jun 2025 07:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208D4C4CEE3;
	Sun, 15 Jun 2025 07:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749972783;
	bh=ykudC0+no0iilN4butkJwk8mXZbTEnB+zY/KM0JFPEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IJuElzMUTv8SfPQxgLvhjHzJ3f9fOBrzL+zteUNVUtl4xBR8FZL2lgfNDLQBXGMQ7
	 0zUJt93LVEtexmyyc26exBRT/Zznt3xjQXl6o4d4xYLYriKfRdzKIWZ9vEm7lZeqeC
	 9NSHNEz0c59zdQUgFm9u3ThPQjXn+bSmqIoKhgvSv/OcAwoH/XW4R5nJtW5BMIwJiv
	 TVd8mkbVwEERuR6VGAHcnhdcMVJuxy9C3VUfLcm4dH4PAb499sl/yY/RkpGnI7TROa
	 Aplxjxbgav6cylupbND1LduzSHFqAkZsKqpc6M1gsxOVr0e1Oan/l4lHkxYtI7yc2g
	 ZtNUkhSSPzK7Q==
Date: Sun, 15 Jun 2025 10:32:54 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
	will@kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com, steven.price@arm.com, gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com,
	ryan.roberts@arm.com, anshuman.khandual@arm.com
Subject: Re: [PATCH v3 1/2] arm64: pageattr: Use pagewalk API to change
 memory permissions
Message-ID: <aE53Jp7ZGgTxtxwG@kernel.org>
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-2-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134352.65994-2-dev.jain@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_003305_515952_F26D37EB 
X-CRM114-Status: GOOD (  13.19  )
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

On Fri, Jun 13, 2025 at 07:13:51PM +0530, Dev Jain wrote:
> -/*
> - * This function assumes that the range is mapped with PAGE_SIZE pages.
> - */
> -static int __change_memory_common(unsigned long start, unsigned long size,
> +static int ___change_memory_common(unsigned long start, unsigned long size,
>  				pgprot_t set_mask, pgprot_t clear_mask)
>  {
>  	struct page_change_data data;
> @@ -61,9 +140,28 @@ static int __change_memory_common(unsigned long start, unsigned long size,
>  	data.set_mask = set_mask;
>  	data.clear_mask = clear_mask;
>  
> -	ret = apply_to_page_range(&init_mm, start, size, change_page_range,
> -					&data);
> +	arch_enter_lazy_mmu_mode();
> +
> +	/*
> +	 * The caller must ensure that the range we are operating on does not
> +	 * partially overlap a block mapping. Any such case should either not
> +	 * exist, or must be eliminated by splitting the mapping - which for
> +	 * kernel mappings can be done only on BBML2 systems.
> +	 *
> +	 */
> +	ret = walk_kernel_page_table_range_lockless(start, start + size,
> +						    &pageattr_ops, NULL, &data);

x86 has a cpa_lock for set_memory/set_direct_map to ensure that there's on
concurrency in kernel page table updates. I think arm64 has to have such
lock as well.

> +	arch_leave_lazy_mmu_mode();
> +
> +	return ret;
> +}

-- 
Sincerely yours,
Mike.

