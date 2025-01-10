Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A3BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 16:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDYFOGueTkvy+TGXt7yHjBF4hDSaK2IB0+UVMd/GAfc=; b=j31U+7Up4xKwaFdip4PkoBDbx1
	wQyemOTAI3Ou5MWymHwiHrrdB39Ave6c65OIoX35wLoA2vsfqBXx/jVIGVa8j7uYBDuFpVDJz3lbI
	byfZuac8nQKcRgACHWVQ/hE7EB9ezXPOVJ1tW4Qsqfdz49QrJpQ4sYBMeRgdRS+gBrBbJzCUv1hJx
	r7rLr0+/BKPxf9B6J6v2hP9wLNFfWziByIr9GrFQeq/srunoAdcDpIdh4Cjirgs+clTdeGG/xU63b
	IM4b1z66IUFBhn+Ghkcws1VUAsRVJPF4Lbk3cE1W06FBBnfWB2/kXjbAnS65WsqnGUnNbH6uYsVF4
	a9yYym3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWI90-0000000GJpr-33Vz;
	Fri, 10 Jan 2025 16:45:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWI7j-0000000GJav-2wHq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 16:44:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 15F5B5C4363;
	Fri, 10 Jan 2025 16:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD1CC4CED6;
	Fri, 10 Jan 2025 16:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736527478;
	bh=C4CeHm6Or5VLGEzPlFMQwU1Lqi8VzWhjclCv/3py67E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O5UR+WQTuOopW+m3Pi1zmwj3sDf93V+XjOFJYBM1RzPO3sDZ1K+ormfip92T4e79w
	 U7XfSgY+NLYzXu3FSqu6NPO6Duv551jmp1bCI/QrpFZEE2pZI1sr9JEOmCb6BY1OnU
	 ygd6hC3MnYQ2N+RhjQSfldq11cHroGlaZKiItHVNmIb3DkLT0NVgh6huf2W9+DLo9X
	 YeINgKpATzcjR+uCpeX3HIxD3GxiQDjsZM7pKUDW6Vf7Go2Sgai6ua3WPKo0H4Ox5B
	 AqV/p/rvC1rT0uQQGOw0QzXTSq+PszsSgUN9oJlsXQxouGCrMbf3PP8PksxH6qiYUq
	 YoNvaeUovuyGw==
Date: Fri, 10 Jan 2025 08:44:38 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Alistair Popple <apopple@nvidia.com>
Cc: akpm@linux-foundation.org, dan.j.williams@intel.com, linux-mm@kvack.org,
	alison.schofield@intel.com, lina@asahilina.net,
	zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
	bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca,
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, tytso@mit.edu, linmiaohe@huawei.com,
	david@redhat.com, peterx@redhat.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com, hch@lst.de, david@fromorbit.com,
	chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev
Subject: Re: [PATCH v6 05/26] fs/dax: Create a common implementation to break
 DAX layouts
Message-ID: <20250110164438.GJ6156@frogsfrogsfrogs>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <79936ac15c917f4004397027f648d4fc9c092424.1736488799.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79936ac15c917f4004397027f648d4fc9c092424.1736488799.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_084439_825506_A21A55F4 
X-CRM114-Status: GOOD (  33.57  )
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

On Fri, Jan 10, 2025 at 05:00:33PM +1100, Alistair Popple wrote:
> Prior to freeing a block file systems supporting FS DAX must check
> that the associated pages are both unmapped from user-space and not
> undergoing DMA or other access from eg. get_user_pages(). This is
> achieved by unmapping the file range and scanning the FS DAX
> page-cache to see if any pages within the mapping have an elevated
> refcount.
> 
> This is done using two functions - dax_layout_busy_page_range() which
> returns a page to wait for the refcount to become idle on. Rather than
> open-code this introduce a common implementation to both unmap and
> wait for the page to become idle.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>

So now that Dan Carpenter has complained, I guess I should look at
this...

> ---
> 
> Changes for v5:
> 
>  - Don't wait for idle pages on non-DAX mappings
> 
> Changes for v4:
> 
>  - Fixed some build breakage due to missing symbol exports reported by
>    John Hubbard (thanks!).
> ---
>  fs/dax.c            | 33 +++++++++++++++++++++++++++++++++
>  fs/ext4/inode.c     | 10 +---------
>  fs/fuse/dax.c       | 27 +++------------------------
>  fs/xfs/xfs_inode.c  | 23 +++++------------------
>  fs/xfs/xfs_inode.h  |  2 +-
>  include/linux/dax.h | 21 +++++++++++++++++++++
>  mm/madvise.c        |  8 ++++----
>  7 files changed, 68 insertions(+), 56 deletions(-)
> 
> diff --git a/fs/dax.c b/fs/dax.c
> index d010c10..9c3bd07 100644
> --- a/fs/dax.c
> +++ b/fs/dax.c
> @@ -845,6 +845,39 @@ int dax_delete_mapping_entry(struct address_space *mapping, pgoff_t index)
>  	return ret;
>  }
>  
> +static int wait_page_idle(struct page *page,
> +			void (cb)(struct inode *),
> +			struct inode *inode)
> +{
> +	return ___wait_var_event(page, page_ref_count(page) == 1,
> +				TASK_INTERRUPTIBLE, 0, 0, cb(inode));
> +}
> +
> +/*
> + * Unmaps the inode and waits for any DMA to complete prior to deleting the
> + * DAX mapping entries for the range.
> + */
> +int dax_break_mapping(struct inode *inode, loff_t start, loff_t end,
> +		void (cb)(struct inode *))
> +{
> +	struct page *page;
> +	int error;
> +
> +	if (!dax_mapping(inode->i_mapping))
> +		return 0;
> +
> +	do {
> +		page = dax_layout_busy_page_range(inode->i_mapping, start, end);
> +		if (!page)
> +			break;
> +
> +		error = wait_page_idle(page, cb, inode);
> +	} while (error == 0);

You didn't initialize error to 0, so it could be any value.  What if
dax_layout_busy_page_range returns null the first time through the loop?

> +
> +	return error;
> +}
> +EXPORT_SYMBOL_GPL(dax_break_mapping);
> +
>  /*
>   * Invalidate DAX entry if it is clean.
>   */

<I'm no expert, skipping to xfs>

> diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
> index 42ea203..295730a 100644
> --- a/fs/xfs/xfs_inode.c
> +++ b/fs/xfs/xfs_inode.c
> @@ -2715,21 +2715,17 @@ xfs_mmaplock_two_inodes_and_break_dax_layout(
>  	struct xfs_inode	*ip2)
>  {
>  	int			error;
> -	bool			retry;
>  	struct page		*page;
>  
>  	if (ip1->i_ino > ip2->i_ino)
>  		swap(ip1, ip2);
>  
>  again:
> -	retry = false;
>  	/* Lock the first inode */
>  	xfs_ilock(ip1, XFS_MMAPLOCK_EXCL);
> -	error = xfs_break_dax_layouts(VFS_I(ip1), &retry);
> -	if (error || retry) {
> +	error = xfs_break_dax_layouts(VFS_I(ip1));
> +	if (error) {
>  		xfs_iunlock(ip1, XFS_MMAPLOCK_EXCL);
> -		if (error == 0 && retry)
> -			goto again;

Hmm, so the retry loop has moved into xfs_break_dax_layouts, which means
that we no longer cycle the MMAPLOCK.  Why was the lock cycling
unnecessary?

>  		return error;
>  	}
>  
> @@ -2988,19 +2984,11 @@ xfs_wait_dax_page(
>  
>  int
>  xfs_break_dax_layouts(
> -	struct inode		*inode,
> -	bool			*retry)
> +	struct inode		*inode)
>  {
> -	struct page		*page;
> -
>  	xfs_assert_ilocked(XFS_I(inode), XFS_MMAPLOCK_EXCL);
>  
> -	page = dax_layout_busy_page(inode->i_mapping);
> -	if (!page)
> -		return 0;
> -
> -	*retry = true;
> -	return dax_wait_page_idle(page, xfs_wait_dax_page, inode);
> +	return dax_break_mapping_inode(inode, xfs_wait_dax_page);
>  }
>  
>  int
> @@ -3018,8 +3006,7 @@ xfs_break_layouts(
>  		retry = false;
>  		switch (reason) {
>  		case BREAK_UNMAP:
> -			error = xfs_break_dax_layouts(inode, &retry);
> -			if (error || retry)
> +			if (xfs_break_dax_layouts(inode))

dax_break_mapping can return -ERESTARTSYS, right?  So doesn't this need
to be:
			error = xfs_break_dax_layouts(inode);
			if (error)
				break;

Hm?

--D

>  				break;
>  			fallthrough;
>  		case BREAK_WRITE:
> diff --git a/fs/xfs/xfs_inode.h b/fs/xfs/xfs_inode.h
> index 1648dc5..c4f03f6 100644
> --- a/fs/xfs/xfs_inode.h
> +++ b/fs/xfs/xfs_inode.h
> @@ -593,7 +593,7 @@ xfs_itruncate_extents(
>  	return xfs_itruncate_extents_flags(tpp, ip, whichfork, new_size, 0);
>  }
>  
> -int	xfs_break_dax_layouts(struct inode *inode, bool *retry);
> +int	xfs_break_dax_layouts(struct inode *inode);
>  int	xfs_break_layouts(struct inode *inode, uint *iolock,
>  		enum layout_break_reason reason);
>  
> diff --git a/include/linux/dax.h b/include/linux/dax.h
> index 9b1ce98..f6583d3 100644
> --- a/include/linux/dax.h
> +++ b/include/linux/dax.h
> @@ -228,6 +228,20 @@ static inline void dax_read_unlock(int id)
>  {
>  }
>  #endif /* CONFIG_DAX */
> +
> +#if !IS_ENABLED(CONFIG_FS_DAX)
> +static inline int __must_check dax_break_mapping(struct inode *inode,
> +			    loff_t start, loff_t end, void (cb)(struct inode *))
> +{
> +	return 0;
> +}
> +
> +static inline void dax_break_mapping_uninterruptible(struct inode *inode,
> +						void (cb)(struct inode *))
> +{
> +}
> +#endif
> +
>  bool dax_alive(struct dax_device *dax_dev);
>  void *dax_get_private(struct dax_device *dax_dev);
>  long dax_direct_access(struct dax_device *dax_dev, pgoff_t pgoff, long nr_pages,
> @@ -251,6 +265,13 @@ vm_fault_t dax_finish_sync_fault(struct vm_fault *vmf,
>  int dax_delete_mapping_entry(struct address_space *mapping, pgoff_t index);
>  int dax_invalidate_mapping_entry_sync(struct address_space *mapping,
>  				      pgoff_t index);
> +int __must_check dax_break_mapping(struct inode *inode, loff_t start,
> +				loff_t end, void (cb)(struct inode *));
> +static inline int __must_check dax_break_mapping_inode(struct inode *inode,
> +						void (cb)(struct inode *))
> +{
> +	return dax_break_mapping(inode, 0, LLONG_MAX, cb);
> +}
>  int dax_dedupe_file_range_compare(struct inode *src, loff_t srcoff,
>  				  struct inode *dest, loff_t destoff,
>  				  loff_t len, bool *is_same,
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 49f3a75..1f4c99e 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1063,7 +1063,7 @@ static int guard_install_pud_entry(pud_t *pud, unsigned long addr,
>  	pud_t pudval = pudp_get(pud);
>  
>  	/* If huge return >0 so we abort the operation + zap. */
> -	return pud_trans_huge(pudval) || pud_devmap(pudval);
> +	return pud_trans_huge(pudval);
>  }
>  
>  static int guard_install_pmd_entry(pmd_t *pmd, unsigned long addr,
> @@ -1072,7 +1072,7 @@ static int guard_install_pmd_entry(pmd_t *pmd, unsigned long addr,
>  	pmd_t pmdval = pmdp_get(pmd);
>  
>  	/* If huge return >0 so we abort the operation + zap. */
> -	return pmd_trans_huge(pmdval) || pmd_devmap(pmdval);
> +	return pmd_trans_huge(pmdval);
>  }
>  
>  static int guard_install_pte_entry(pte_t *pte, unsigned long addr,
> @@ -1183,7 +1183,7 @@ static int guard_remove_pud_entry(pud_t *pud, unsigned long addr,
>  	pud_t pudval = pudp_get(pud);
>  
>  	/* If huge, cannot have guard pages present, so no-op - skip. */
> -	if (pud_trans_huge(pudval) || pud_devmap(pudval))
> +	if (pud_trans_huge(pudval))
>  		walk->action = ACTION_CONTINUE;
>  
>  	return 0;
> @@ -1195,7 +1195,7 @@ static int guard_remove_pmd_entry(pmd_t *pmd, unsigned long addr,
>  	pmd_t pmdval = pmdp_get(pmd);
>  
>  	/* If huge, cannot have guard pages present, so no-op - skip. */
> -	if (pmd_trans_huge(pmdval) || pmd_devmap(pmdval))
> +	if (pmd_trans_huge(pmdval))
>  		walk->action = ACTION_CONTINUE;
>  
>  	return 0;
> -- 
> git-series 0.9.1
> 

