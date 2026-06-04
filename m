Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD7DCD6E77
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 19:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qUhs7nHrVwVahKP19CONWmvueVUZvVfuS2bIUip09cI=; b=e0OcjmgZlVAP5VZaDWRqUTKNY7
	ocwCGr/gqioVWI7hEHiWe2HPSnBXIUqLuYTFIlOKi4UCWuL+SaBqGEvyKOOPPIR5tk/LNJLv3tniv
	3ezMrd849AU1ddkcvOxch51Noy2PuXMfONvqZd+wpzefbn7W6EtKJDfXVBkPa+sF61OCeE+xK94VU
	M3tBB1PctSBoknAMguh51CIs38Ag0QzSdENBZ2W2rzuRUsmSxdP65k+HZH1N/BUJw6HMLGylN3XwF
	jPdFi/ASoONFIv6ARyvy6/sYWFEy20rQHQenNqbe4IEikNQ+BzI27HahIsp/9+VvVBxhQmn7kKQuB
	O6MtC69g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVDmL-0000000HDM0-1dYe;
	Thu, 04 Jun 2026 19:30:57 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVDmJ-0000000HDKt-0KhJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 19:30:56 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 464576B059;
	Thu,  4 Jun 2026 19:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780601451; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qUhs7nHrVwVahKP19CONWmvueVUZvVfuS2bIUip09cI=;
	b=ObOC8E/s242xs8rtpTwzGe9x012+MvEF7x7lQ/QR6XNWcecL57OHhrtEeWyPsgfJtouwRm
	r/n42gf9UvuYj4IifaJnQeipfVgy1n/hZ7i61vVz/u7Txos8K5VRPBinNolwzswD7pdZGP
	YpDCiqRQZOTcXzEL4wHJ8e8d2EVsuuY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780601451;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qUhs7nHrVwVahKP19CONWmvueVUZvVfuS2bIUip09cI=;
	b=xX4TZ1OuGwffZQhiUWMU1DTM3tnSvWvkm1rBX7PCU4Q8hfRmnKjirqbGaF1vpkFnnuitz4
	nO+jU2qDW+3uXKAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780601450; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qUhs7nHrVwVahKP19CONWmvueVUZvVfuS2bIUip09cI=;
	b=B49iZUXGW6b652AdBBs53WABYQQo1Bm8iuEVubc5CLhv/8Ln12qK/PewKxT3ks07cc4uF+
	XO0AKg+pBd4kdBET20ErmxBMU28d3CblKOW3xFJQyhz59r2RADADOBIwfdUVluvGoa+XfU
	3Ij6F6sgc5OJmnmrbkVt5HNnc8J8sgI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780601450;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qUhs7nHrVwVahKP19CONWmvueVUZvVfuS2bIUip09cI=;
	b=AnHU30aDHDytjj8TvaarlGVKqeukhTSpUIVKkDU05ex2/Yq+QWZvQ9FwxAjxVaum5/Ln85
	xVYzWQntN/Jy31Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F15B1779A8;
	Thu,  4 Jun 2026 19:30:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id w/EYD2XSIWpsEQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Thu, 04 Jun 2026 19:30:45 +0000
Date: Thu, 4 Jun 2026 20:30:43 +0100
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
	Al Viro <viro@zeniv.linux.org.uk>, ziy@nvidia.com, hannes@cmpxchg.org, kas@kernel.org, 
	shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v7 1/2] mm: bypass mmap_miss heuristic for VM_EXEC
 readahead
Message-ID: <aiHR2GIhaAh_9ycw@pedro-suse>
References: <20260601102205.3985788-1-usama.arif@linux.dev>
 <20260601102205.3985788-2-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601102205.3985788-2-usama.arif@linux.dev>
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[36];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLxu57a9hfgn7tttf5jiwuqe5o)];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[kernel];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,suse.cz:email,suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_123055_278126_935A4B69 
X-CRM114-Status: GOOD (  30.32  )
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

On Mon, Jun 01, 2026 at 03:21:17AM -0700, Usama Arif wrote:
> The mmap_miss heuristic is intended to stop speculative mmap readahead
> when a file looks like a random-access workload. That does not fit the
> VM_EXEC path very well.
> 
> VM_EXEC readahead is already constrained differently from ordinary mmap
> read-around: it is bounded by the VMA, uses exec_folio_order() to choose
> an order useful for executable mappings, and sets async_size to 0 so it
> does not create follow-on readahead. When VM_HUGEPAGE is also present,
> the larger readahead is an explicit userspace opt-in.
> 
> The mmap_miss counter is decremented from cache-hit paths in
> do_async_mmap_readahead() and filemap_map_pages(). Those paths are not
> always enough to balance the synchronous miss increments for executable
> mappings. In particular, when fault-around is effectively disabled, such
> as configurations where fault_around_pages is 1, filemap_map_pages() is
> not reached from the fault path. The counter can then become a stale
> throttle for VM_EXEC mappings and suppress the readahead behavior that
> the executable-specific path is trying to provide.
> 
> Skip both mmap_miss increments and decrements for VM_EXEC mappings,
> matching the existing VM_SEQ_READ treatment and keeping the counter
> accounting symmetric.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

> ---
>  mm/filemap.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/filemap.c b/mm/filemap.c
> index cca20e350c95..a16b33e0fc71 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -3339,7 +3339,7 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
>  		}
>  	}
>  
> -	if (!(vm_flags & VM_SEQ_READ)) {
> +	if (!(vm_flags & (VM_SEQ_READ | VM_EXEC))) {

Just a side comment: I really hate these adhoc criteria all around
filemap/readahead. One day we ought to actually write things down, and
write things in a way that isn't entirely mysterious. I might see if I send
a patch for this down the line...

>  		/* Avoid banging the cache line if not needed */
>  		mmap_miss = READ_ONCE(ra->mmap_miss);
>  		if (mmap_miss < MMAP_LOTSAMISS * 10)
> @@ -3434,12 +3434,12 @@ static struct file *do_async_mmap_readahead(struct vm_fault *vmf,
>  	 * times for a single folio and break the balance with mmap_miss
>  	 * increase in do_sync_mmap_readahead().
>  	 *
> -	 * VM_SEQ_READ mappings skip the mmap_miss increment in
> +	 * VM_SEQ_READ and VM_EXEC mappings skip the mmap_miss increment in
>  	 * do_sync_mmap_readahead(), so skip the decrement here as well to
>  	 * keep the counter symmetric.
>  	 */
>  	if (likely(!folio_test_locked(folio)) &&
> -	    !(vmf->vma->vm_flags & VM_SEQ_READ)) {
> +	    !(vmf->vma->vm_flags & (VM_SEQ_READ | VM_EXEC))) {
>  		mmap_miss = READ_ONCE(ra->mmap_miss);
>  		if (mmap_miss)
>  			WRITE_ONCE(ra->mmap_miss, --mmap_miss);
> @@ -3941,14 +3941,14 @@ vm_fault_t filemap_map_pages(struct vm_fault *vmf,
>  		 * Don't decrease mmap_miss in this scenario to make sure
>  		 * we can stop read-ahead.
>  		 *
> -		 * VM_SEQ_READ mappings skip the mmap_miss increment in
> -		 * do_sync_mmap_readahead(), so skip the decrement here as
> -		 * well to keep the counter symmetric.
> +		 * VM_SEQ_READ and VM_EXEC mappings skip the mmap_miss
> +		 * increment in do_sync_mmap_readahead(), so skip the
> +		 * decrement here as well to keep the counter symmetric.
>  		 */
>  		if ((map_ret & VM_FAULT_NOPAGE) &&
>  		    !(vmf->flags & FAULT_FLAG_TRIED) &&
>  		    !folio_test_workingset(folio) &&
> -		    !(vma->vm_flags & VM_SEQ_READ)) {
> +		    !(vma->vm_flags & (VM_SEQ_READ | VM_EXEC))) {
>  			unsigned short mmap_miss;
>  
>  			mmap_miss = READ_ONCE(file->f_ra.mmap_miss);
> -- 
> 2.52.0
> 

-- 
Pedro

