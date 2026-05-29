Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBAFCD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDCpu1/nuWgxfdw1LsjaHJ9L6YwcwToPNO7yEAIUT+Q=; b=4YcNsLqVxi4n4UcTT85k7c+MVW
	xDZa4Li6FTUFtDIt/hfhk2kuT6ZWyr+fMVyhfeYJfyBB6RMDevh+jmcRuZbEZMtXnQUt9JoBxeGBR
	+RSy+XNXLVmitaCj8bay2mrH+MJLENNLeNtMqeC+023HarhLSVXbBxAEq2kIxhfDRDe2ymyaqtU9y
	qTcwgO2zAqzDPiAHGinvwmUDeJibNJlpcuYvK4y9v4hEm1CogBWNnU1DK5grhjZM5H+5wFDm771/r
	SftaX7BYzOAtFb/aa+gSPf56bKsK+mgFTY0Ro0L4LtH6xTT9EIEuy2KsGPakaZFDZWoKU6p8uVAnv
	FG2/rX9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSu20-000000077vH-19Vw;
	Fri, 29 May 2026 10:01:32 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSu1x-000000077uq-3i91
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 10:01:31 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DDF066AADA;
	Fri, 29 May 2026 10:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780048887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IDCpu1/nuWgxfdw1LsjaHJ9L6YwcwToPNO7yEAIUT+Q=;
	b=reQyoAZggaokCNF1+0IkBjyJV72pNQ5r6ET1CR/g/LQfhNd6xCcPR9XLudh+nM7iUKWBVf
	BuQ1Cpazko0Of4tlGW5M0CH7OTeTuoJe6VwIy8g1nuE71kvaeTCaBnYc1027ZUUimsUJtS
	Hy9cHwMBT6yCLUf2aJZhQZzweUj4JJ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780048887;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IDCpu1/nuWgxfdw1LsjaHJ9L6YwcwToPNO7yEAIUT+Q=;
	b=1ck1i2jT0HYfHibf1hHQDlmVSZbD6UgcIrXbtrCJzfHZuSETmb/WiPxaV6xxJj7MqJiAXi
	3FQNPTLDZGvG3lDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=R9MbOLjn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8dtnSBU8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780048883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IDCpu1/nuWgxfdw1LsjaHJ9L6YwcwToPNO7yEAIUT+Q=;
	b=R9MbOLjnfaB2OW5h+RPzQd1GQdd/hX9knnauDawYIpyznWihIT9ezMl7VjfwWKHA8ehS+7
	5Si53dwcl4+/Xo4JPBj6XnR1v/f4o14yiMnDDiXi22woGtIPSlOXMe21y5gtUcA5s7SwW2
	CBWkiDImwPBOD75ig5qfV1Cgcrao6nI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780048883;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IDCpu1/nuWgxfdw1LsjaHJ9L6YwcwToPNO7yEAIUT+Q=;
	b=8dtnSBU8SRtvS0iRSEMWihwBKq5EHV3pfDBhkQnqsaV46vO3PCbFFla6qu6WdqzEqV9/sv
	DwiELJFLHklF+sAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8797A779A7;
	Fri, 29 May 2026 10:01:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id I2KYHfFjGWrNcwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Fri, 29 May 2026 10:01:21 +0000
Date: Fri, 29 May 2026 11:01:19 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, 
	willy@infradead.org, ryan.roberts@arm.com, linux-mm@kvack.org, r@hev.cc, jack@suse.cz, 
	Andrew Donnellan <andrew+kernel@donnellan.id.au>, apopple@nvidia.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, brauner@kernel.org, catalin.marinas@arm.com, dev.jain@arm.com, 
	kees@kernel.org, kevin.brodsky@arm.com, lance.yang@linux.dev, 
	"Liam R. Howlett" <liam@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, ljs@kernel.org, mhocko@suse.com, 
	npache@redhat.com, pasha.tatashin@soleen.com, rmclure@linux.ibm.com, 
	rppt@kernel.org, surenb@google.com, vbabka@kernel.org, 
	Al Viro <viro@zeniv.linux.org.uk>, wilts.infradead.org@pedro-suse.lan, ziy@nvidia.com, 
	hannes@cmpxchg.org, kas@kernel.org, shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v6 2/2] mm: use mapping_max_folio_order() for
 force_thp_readahead order
Message-ID: <ahlh2vdHEGo6ZSot@pedro-suse.lan>
References: <20260528165635.2068012-1-usama.arif@linux.dev>
 <20260528165635.2068012-3-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528165635.2068012-3-usama.arif@linux.dev>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: DDF066AADA
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	TAGGED_RCPT(0.00)[kernel];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL764437jfm1qe6abtk9nwyx8m)];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,pedro-suse.lan:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_030130_093479_9C641011 
X-CRM114-Status: GOOD (  31.21  )
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

On Thu, May 28, 2026 at 09:55:20AM -0700, Usama Arif wrote:
> The force_thp_readahead path in do_sync_mmap_readahead() is gated on
> HPAGE_PMD_ORDER <= MAX_PAGECACHE_ORDER and always requests
> HPAGE_PMD_ORDER / HPAGE_PMD_NR. On configurations where HPAGE_PMD_ORDER
> exceeds MAX_PAGECACHE_ORDER, notably arm64 with a 64K base page size,
> VM_HUGEPAGE mappings cannot use this path and fall back to the non-forced
> mmap readahead path even when the mapping supports useful large folios.
> 
> Keep the existing PMD-sized behavior when HPAGE_PMD_ORDER fits in the
> page cache. When it does not, enable forced readahead for mappings that
> support large folios and request an order capped by both
> mapping_max_folio_order(mapping) and 2MB.
> 
> 2MB is chosen as the cap because it matches the PMD size on x86_64
> and on arm64 with 4K or 16K base pages, so the size/memory-pressure

16K base page size's PMDs should be 32M, no? Am I misunderstanding what
you mean here?

> tradeoff for folios of that size is already well understood. On arm64
> with a 64K base page size, 2MB is also the contiguous-PTE (contpte)
> block size, so the resulting folios coalesce into a single TLB entry
> and reduce TLB pressure on the readahead path.
> 
> The final allocation order may still be clamped by page_cache_ra_order()
> to the mapping and request geometry, but this gives VM_HUGEPAGE mappings
> on such configurations a large-folio readahead request instead of
> dropping back to base-page readahead.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  mm/filemap.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/filemap.c b/mm/filemap.c
> index a16b33e0fc71..bfb891d9da1f 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -3312,14 +3312,23 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
>  	struct file *fpin = NULL;
>  	vm_flags_t vm_flags = vmf->vma->vm_flags;
>  	bool force_thp_readahead = false;
> +	unsigned int thp_order = 0;
>  	unsigned short mmap_miss;
>  
>  	ractl._max_index = vmf->vma->vm_pgoff + vma_pages(vmf->vma) - 1;
>  
>  	/* Use the readahead code, even if readahead is disabled */
> -	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
> -	    (vm_flags & VM_HUGEPAGE) && HPAGE_PMD_ORDER <= MAX_PAGECACHE_ORDER)
> -		force_thp_readahead = true;
> +	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && (vm_flags & VM_HUGEPAGE)) {
> +		if (HPAGE_PMD_ORDER <= MAX_PAGECACHE_ORDER) {
> +			force_thp_readahead = true;
> +			thp_order = HPAGE_PMD_ORDER;
> +		} else if (mapping_large_folio_support(mapping)) {
> +			force_thp_readahead = true;
> +			thp_order = min_t(unsigned int,
> +					  mapping_max_folio_order(mapping),
> +					  get_order(SZ_2M));

This looks somewhat arbitrary to me (as does the old logic). It seems more
natural (correct?) to do this:

	if (THP_ENABLED && (vm_flags & VM_HUGEPAGE)) {
		if (mapping_large_folio_support(mapping)) {
			force_thp_readahead = true;
			/*
			 * Cap THP readahead to either the max folio order the
			 * mapping supports, or the max order the page cache
			 * supports (useless to try more), or the hugepage PMD
			 * order (CPU can't benefit from larger).
			 */
			thp_order = min3(mapping_max_folio_order(mapping),
					MAX_PAGECACHE_ORDER, HPAGE_PMD_ORDER);
		}
	}

> +		}
> +	}
>  
>  	if (!force_thp_readahead) {
>  		/*
> @@ -3354,17 +3363,19 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
>  	}
>  
>  	if (force_thp_readahead) {
> +		unsigned long folio_nr_pages = 1UL << thp_order;
> +
>  		fpin = maybe_unlock_mmap_for_io(vmf, fpin);
> -		ractl._index &= ~((unsigned long)HPAGE_PMD_NR - 1);
> -		ra->size = HPAGE_PMD_NR;
> +		ractl._index &= ~(folio_nr_pages - 1);
> +		ra->size = folio_nr_pages;
>  		/*
> -		 * Fetch two PMD folios, so we get the chance to actually
> +		 * Fetch two folios so we get the chance to actually
			  ^^ large folios?
>  		 * readahead, unless we've been told not to.
>  		 */
>  		if (!(vm_flags & VM_RAND_READ))
>  			ra->size *= 2;
> -		ra->async_size = HPAGE_PMD_NR;
> -		ra->order = HPAGE_PMD_ORDER;
> +		ra->async_size = folio_nr_pages;
> +		ra->order = thp_order;

This part LGTM.

-- 
Pedro

