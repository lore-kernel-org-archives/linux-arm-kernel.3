Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C414DC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 10:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKXgpxfD7mmRDEDKIXuu87HZmsIYrRD/fM7ub6mxn3U=; b=lyPH+fetbFWgCKTdgWYQCEUKZt
	xOAlnfgfMz87E5Yx6cXlQX7BgZgBRpetsh2Xm0y/sgTLvvMT0kRAtBRiHemei7bxKd7gA9qvHhCHh
	POkqEjuRELpPvKj3VPAbGYOfYcrXUkzS32fDFaMrGbALTSyvoHrIVP+M9LlsFELLdMmpoIcTrTB15
	DCS5bweLzAFrQvZ+bAOF5HtqBrc51NZWNLuNM2QPAqxaNmO7paUN4yCi8f7Bgs7QHnStMPR+e5Wby
	bSIKC9i81GGxwzxsUqJHqao5JjiXuOAzL79sRLM4QUM3kNhSj4biQy+NVHGqaItwOTwQVtecog10U
	7W0uhLsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLFk-00000003Kof-38Ju;
	Fri, 09 May 2025 10:46:52 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKWu-00000003BkW-3T5H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 10:00:34 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Zv4Hs2XlNz9tmm;
	Fri,  9 May 2025 12:00:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pankajraghav.com;
	s=MBO0001; t=1746784825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aKXgpxfD7mmRDEDKIXuu87HZmsIYrRD/fM7ub6mxn3U=;
	b=BFOgVJ5+QR381y/dIAleHjzFrncarnnRrLIvkfIuVBJoCzdGHilzSjyWwzigpb8OHgcL1S
	brnGWQm/AffVHiQ8fWgJSEzKrzFQOTwCa7uUcc5Sj+NyP7rCPavkdpOduPyEY6jc1fTF7k
	Tmpjpv7hBmtj4HJNLjriLMY6BU8xkEng5hcA2/M7NgpBKfgUvmXjOTj4HbGrCR/LlwcOtE
	6plgndT3N6J46arHCoY0b/igVj5RSLw8x63A/uUKfi97CNG4y69OOeNgxLufVsEM0oz3sJ
	W5dJQA+jmz7kuAPNFd0mAFoIBvHMfPZdw69jnMMtuQwTY17OqpGVMjAkhgp7og==
Date: Fri, 9 May 2025 12:00:09 +0200
From: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Hildenbrand <david@redhat.com>, 
	Dave Chinner <david@fromorbit.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Kalesh Singh <kaleshsingh@google.com>, Zi Yan <ziy@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v4 3/5] mm/readahead: Make space in struct
 file_ra_state
Message-ID: <vyyxrpfhdpz6lg4frvafi2mxpgvlciianyhcfmcvli3yobguy4@zxy5n4pwgbo5>
References: <20250430145920.3748738-1-ryan.roberts@arm.com>
 <20250430145920.3748738-4-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430145920.3748738-4-ryan.roberts@arm.com>
X-Rspamd-Queue-Id: 4Zv4Hs2XlNz9tmm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_030033_019670_58688408 
X-CRM114-Status: GOOD (  24.26  )
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

On Wed, Apr 30, 2025 at 03:59:16PM +0100, Ryan Roberts wrote:
> We need to be able to store the preferred folio order associated with a
> readahead request in the struct file_ra_state so that we can more
> accurately increase the order across subsequent readahead requests. But
> struct file_ra_state is per-struct file, so we don't really want to
> increase it's size.
> 
> mmap_miss is currently 32 bits but it is only counted up to 10 *
> MMAP_LOTSAMISS, which is currently defined as 1000. So 16 bits should be
> plenty. Redefine it to unsigned short, making room for order as unsigned
> short in follow up commit.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Looks good.
Reviewed-by: Pankaj Raghav <p.raghav@samsung.com>

> ---
>  include/linux/fs.h |  2 +-
>  mm/filemap.c       | 11 ++++++-----
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 016b0fe1536e..44362bef0010 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1042,7 +1042,7 @@ struct file_ra_state {
>  	unsigned int size;
>  	unsigned int async_size;
>  	unsigned int ra_pages;
> -	unsigned int mmap_miss;
> +	unsigned short mmap_miss;
>  	loff_t prev_pos;
>  };
>  
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 7b90cbeb4a1a..fa129ecfd80f 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -3207,7 +3207,7 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
>  	DEFINE_READAHEAD(ractl, file, ra, mapping, vmf->pgoff);
>  	struct file *fpin = NULL;
>  	unsigned long vm_flags = vmf->vma->vm_flags;
> -	unsigned int mmap_miss;
> +	unsigned short mmap_miss;
>  
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  	/* Use the readahead code, even if readahead is disabled */
> @@ -3275,7 +3275,7 @@ static struct file *do_async_mmap_readahead(struct vm_fault *vmf,
>  	struct file_ra_state *ra = &file->f_ra;
>  	DEFINE_READAHEAD(ractl, file, ra, file->f_mapping, vmf->pgoff);
>  	struct file *fpin = NULL;
> -	unsigned int mmap_miss;
> +	unsigned short mmap_miss;
>  
>  	/* If we don't want any read-ahead, don't bother */
>  	if (vmf->vma->vm_flags & VM_RAND_READ || !ra->ra_pages)
> @@ -3595,7 +3595,7 @@ static struct folio *next_uptodate_folio(struct xa_state *xas,
>  static vm_fault_t filemap_map_folio_range(struct vm_fault *vmf,
>  			struct folio *folio, unsigned long start,
>  			unsigned long addr, unsigned int nr_pages,
> -			unsigned long *rss, unsigned int *mmap_miss)
> +			unsigned long *rss, unsigned short *mmap_miss)
>  {
>  	vm_fault_t ret = 0;
>  	struct page *page = folio_page(folio, start);
> @@ -3657,7 +3657,7 @@ static vm_fault_t filemap_map_folio_range(struct vm_fault *vmf,
>  
>  static vm_fault_t filemap_map_order0_folio(struct vm_fault *vmf,
>  		struct folio *folio, unsigned long addr,
> -		unsigned long *rss, unsigned int *mmap_miss)
> +		unsigned long *rss, unsigned short *mmap_miss)
>  {
>  	vm_fault_t ret = 0;
>  	struct page *page = &folio->page;
> @@ -3699,7 +3699,8 @@ vm_fault_t filemap_map_pages(struct vm_fault *vmf,
>  	struct folio *folio;
>  	vm_fault_t ret = 0;
>  	unsigned long rss = 0;
> -	unsigned int nr_pages = 0, mmap_miss = 0, mmap_miss_saved, folio_type;
> +	unsigned int nr_pages = 0, folio_type;
> +	unsigned short mmap_miss = 0, mmap_miss_saved;
>  
>  	rcu_read_lock();
>  	folio = next_uptodate_folio(&xas, mapping, end_pgoff);
> -- 
> 2.43.0
> 

