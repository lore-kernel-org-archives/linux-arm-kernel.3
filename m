Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9F6CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 20:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKSTkYRGT3zMC8Ee+GmuWnWH8M2jI3T3vBkRLhrE1HY=; b=WYDQEXdi0pUUsl7YVWVycrmUHk
	LgkWywxiV+WGTeawN7/pji4I9iVono4O1ekI4+5tWWLHf1YC+7ZqRpMc8D+1WFF0rvB07SRsKbUCE
	QfIrqTSSWYpwZ7fd506I/z+GKdqOHBWKxukjUok60CA+pHVBiCzAE4A1w4Q9gJOpcKiZBkOh/JYJ0
	9cru5lTTDlwr4/63hiq2AajDFY/fwmvdsYMNxbN4/l/gXxPVo0j3er+CPINn8rDdKX7/Xc7gDBG0P
	WcaM1UBbG6Xw9xVlhOs7SW5hveqg5bo6+1LDN68rVE5z/O12zEc34e9uvgsm7w6iEwfqYEnlnEHt1
	KyesGgEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urjXB-00000003Day-396Z;
	Thu, 28 Aug 2025 20:47:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urfRv-00000002FU7-3qt5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 16:26:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BE69600AA;
	Thu, 28 Aug 2025 16:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F137C4CEEB;
	Thu, 28 Aug 2025 16:26:04 +0000 (UTC)
Date: Thu, 28 Aug 2025 17:26:02 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
	akpm@linux-foundation.org, Miko.Lenczewski@arm.com,
	dev.jain@arm.com, scott@os.amperecomputing.com, cl@gentwo.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v6 1/4] arm64: Enable permission change on arm64
 kernel block mappings
Message-ID: <aLCDGlobH1wG8iqx@arm.com>
References: <20250805081350.3854670-1-ryan.roberts@arm.com>
 <20250805081350.3854670-2-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805081350.3854670-2-ryan.roberts@arm.com>
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

On Tue, Aug 05, 2025 at 09:13:46AM +0100, Ryan Roberts wrote:
> From: Dev Jain <dev.jain@arm.com>
> 
> This patch paves the path to enable huge mappings in vmalloc space and
> linear map space by default on arm64. For this we must ensure that we
> can handle any permission games on the kernel (init_mm) pagetable.
> Currently, __change_memory_common() uses apply_to_page_range() which
> does not support changing permissions for block mappings. We attempt to
> move away from this by using the pagewalk API, similar to what riscv
> does right now; however, it is the responsibility of the caller to
> ensure that we do not pass a range overlapping a partial block mapping
> or cont mapping; in such a case, the system must be able to support
> range splitting.
> 
> This patch is tied with Yang Shi's attempt [1] at using huge mappings in
> the linear mapping in case the system supports BBML2, in which case we
> will be able to split the linear mapping if needed without
> break-before-make. Thus, Yang's series, IIUC, will be one such user of
> my patch; suppose we are changing permissions on a range of the linear
> map backed by PMD-hugepages, then the sequence of operations should look
> like the following:
> 
> split_range(start)
> split_range(end);
> __change_memory_common(start, end);
> 
> However, this patch can be used independently of Yang's; since currently
> permission games are being played only on pte mappings (due to
> apply_to_page_range not supporting otherwise), this patch provides the
> mechanism for enabling huge mappings for various kernel mappings like
> linear map and vmalloc.
[...]

I think some of this text needs to be trimmed down, avoid references to
other series if they are merged at the same time.

> diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
> index 682472c15495..8212e8f2d2d5 100644
> --- a/include/linux/pagewalk.h
> +++ b/include/linux/pagewalk.h
> @@ -134,6 +134,9 @@ int walk_page_range(struct mm_struct *mm, unsigned long start,
>  int walk_kernel_page_table_range(unsigned long start,
>  		unsigned long end, const struct mm_walk_ops *ops,
>  		pgd_t *pgd, void *private);
> +int walk_kernel_page_table_range_lockless(unsigned long start,
> +		unsigned long end, const struct mm_walk_ops *ops,
> +		void *private);
>  int walk_page_range_vma(struct vm_area_struct *vma, unsigned long start,
>  			unsigned long end, const struct mm_walk_ops *ops,
>  			void *private);
> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> index 648038247a8d..18a675ab87cf 100644
> --- a/mm/pagewalk.c
> +++ b/mm/pagewalk.c
> @@ -633,6 +633,30 @@ int walk_kernel_page_table_range(unsigned long start, unsigned long end,
>  	return walk_pgd_range(start, end, &walk);
>  }
>  
> +/*
> + * Use this function to walk the kernel page tables locklessly. It should be
> + * guaranteed that the caller has exclusive access over the range they are
> + * operating on - that there should be no concurrent access, for example,
> + * changing permissions for vmalloc objects.
> + */
> +int walk_kernel_page_table_range_lockless(unsigned long start, unsigned long end,
> +		const struct mm_walk_ops *ops, void *private)
> +{
> +	struct mm_walk walk = {
> +		.ops		= ops,
> +		.mm		= &init_mm,
> +		.private	= private,
> +		.no_vma		= true
> +	};
> +
> +	if (start >= end)
> +		return -EINVAL;
> +	if (!check_ops_valid(ops))
> +		return -EINVAL;
> +
> +	return walk_pgd_range(start, end, &walk);
> +}

More of a nit: we could change walk_kernel_page_table_range() to call
this function after checking the mm lock as they look nearly identical.
The existing function has a pgd argument but it doesn't seem to be used
anywhere and could be removed (or add it here for consistency).

Either way, the patch looks fine.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

