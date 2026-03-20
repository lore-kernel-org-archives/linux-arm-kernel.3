Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CF51098792
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 14:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9VUzKgMf5hNdrzdVMsfw7bOId+n7lQuC+5prwGhXeY=; b=NL0/X8aGX34fpHBYf39LWz/tEN
	n4QhrGWeHU9S96+AcbV3OKMOvVbXT1b4OqnCnks1jhUfesITD2z5w7KfAgwNvXDbNsMyS+kzlHOIi
	oFZsvjLfkKbOIdo8MePksy3CgJTo1LcQO18sFPLSLooarQZNdvXviSeCQokZvOxf+FAfTqzI6/qLh
	YsHiC0NHjE30F52VRMSIr9X2Fi+en2GZljzI3fIUqSiu43hvUerVJYH1/5Uh5KCdqvYORNOtE2YHB
	hbf24g5BDU5T01o56aQSKu+mXiJamL9/eUu0/sNLAwyblneIM4RT1/5XDy+1RhC582+w2ufNuS0XY
	lU3G/1TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3b3Q-0000000CxFo-1oLs;
	Fri, 20 Mar 2026 14:42:24 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3b3O-0000000CxER-1LQV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 14:42:23 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1B6CF5BDDF;
	Fri, 20 Mar 2026 14:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1774017740; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P9VUzKgMf5hNdrzdVMsfw7bOId+n7lQuC+5prwGhXeY=;
	b=K9P8c5j5NeE3nZT/QeFabtQCdAeEYNOJe7rdWMgMxX1SH7CydbSDGlxgTCvA2I0pZecwdL
	I3oDatS8dZeW9UBb146AJjojdUWy9sSHRw79fN1yTzX88OjkcbBe1Y+0qh/nxxzLWsMCu9
	81FS/l6Xf071zw5l8JlHwKsuVjtdo0s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1774017740;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P9VUzKgMf5hNdrzdVMsfw7bOId+n7lQuC+5prwGhXeY=;
	b=HH6SxvqtwWwEXfookhSTKVEw/oisE53rm0nNzkZHFPQLSeoTUAeN5hsZDe2gOFBdg2jwsi
	BlujbfenUIb3vOAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=K9P8c5j5;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=HH6Sxvqt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1774017740; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P9VUzKgMf5hNdrzdVMsfw7bOId+n7lQuC+5prwGhXeY=;
	b=K9P8c5j5NeE3nZT/QeFabtQCdAeEYNOJe7rdWMgMxX1SH7CydbSDGlxgTCvA2I0pZecwdL
	I3oDatS8dZeW9UBb146AJjojdUWy9sSHRw79fN1yTzX88OjkcbBe1Y+0qh/nxxzLWsMCu9
	81FS/l6Xf071zw5l8JlHwKsuVjtdo0s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1774017740;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P9VUzKgMf5hNdrzdVMsfw7bOId+n7lQuC+5prwGhXeY=;
	b=HH6SxvqtwWwEXfookhSTKVEw/oisE53rm0nNzkZHFPQLSeoTUAeN5hsZDe2gOFBdg2jwsi
	BlujbfenUIb3vOAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0AC7042853;
	Fri, 20 Mar 2026 14:42:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3KonAsxcvWnxRwAAD6G6ig
	(envelope-from <jack@suse.cz>); Fri, 20 Mar 2026 14:42:20 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id BDC32A0A81; Fri, 20 Mar 2026 15:42:15 +0100 (CET)
Date: Fri, 20 Mar 2026 15:42:15 +0100
From: Jan Kara <jack@suse.cz>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, 
	willy@infradead.org, ryan.roberts@arm.com, linux-mm@kvack.org, r@hev.cc, jack@suse.cz, 
	ajd@linux.ibm.com, apopple@nvidia.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, brauner@kernel.org, catalin.marinas@arm.com, dev.jain@arm.com, 
	kees@kernel.org, kevin.brodsky@arm.com, lance.yang@linux.dev, 
	Liam.Howlett@oracle.com, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	mhocko@suse.com, npache@redhat.com, pasha.tatashin@soleen.com, 
	rmclure@linux.ibm.com, rppt@kernel.org, surenb@google.com, vbabka@kernel.org, 
	Al Viro <viro@zeniv.linux.org.uk>, wilts.infradead.org@quack3, ziy@nvidia.com, hannes@cmpxchg.org, 
	kas@kernel.org, shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v2 2/4] mm: replace exec_folio_order() with generic
 preferred_exec_order()
Message-ID: <k45xs6btmt62uerbglqe665jozrtkeoklu4rek6odgxjdj63ni@ftw6ef3ug33x>
References: <20260320140315.979307-1-usama.arif@linux.dev>
 <20260320140315.979307-3-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320140315.979307-3-usama.arif@linux.dev>
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL7pfqg7h1m44jupjp7nguhfec)];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,linux.dev:email]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1B6CF5BDDF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_074222_568721_9E3E1392 
X-CRM114-Status: GOOD (  23.94  )
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

On Fri 20-03-26 06:58:52, Usama Arif wrote:
> Replace the arch-specific exec_folio_order() hook with a generic
> preferred_exec_order() that dynamically computes the readahead folio
> order for executable memory. It targets min(PMD_ORDER, 2M) as the
> maximum, which optimally gives the right answer for contpte (arm64),
> PMD mapping (x86, arm64 4K), and architectures with smaller PMDs
> (s390 1M). It adapts at runtime based on:
> 
> - VMA size: caps the order so folios fit within the mapping
> - Memory pressure: steps down the order when the local node's free
>   memory is below the high watermark for the requested order
> 
> This avoids over-allocating on memory-constrained systems while still
> requesting the optimal order when memory is plentiful.
> 
> Since exec_folio_order() is no longer needed, remove the arm64
> definition and the generic default from pgtable.h.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
...
> +static unsigned int preferred_exec_order(struct vm_area_struct *vma)
> +{
> +	int order;
> +	unsigned long vma_len = vma_pages(vma);
> +	struct zone *zone;
> +	gfp_t gfp;
> +
> +	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
> +		return 0;
> +
> +	/* Cap at min(PMD_ORDER, 2M) */
> +	order = min(HPAGE_PMD_ORDER, ilog2(SZ_2M >> PAGE_SHIFT));
> +
> +	/* Don't request folios larger than the VMA */
> +	order = min(order, ilog2(vma_len));

Hum, as far as I'm checking page_cache_ra_order() used in
do_sync_mmap_readahead(), ra->order is the preferred order but it will be
trimmed down to fit both within the file and within ra->size. And ra->size
is set for the readahead to fit within the vma so I don't think any order
trimming based on vma length is needed in this place?

> +	/* Step down under memory pressure */
> +	gfp = mapping_gfp_mask(vma->vm_file->f_mapping);
> +	zone = first_zones_zonelist(node_zonelist(numa_node_id(), gfp),
> +				    gfp_zone(gfp), NULL)->zone;
> +	if (zone) {
> +		while (order > 0 &&
> +		       !zone_watermark_ok(zone, order,
> +					  high_wmark_pages(zone), 0, 0))
> +			order--;
> +	}

It looks wrong for this logic to be here. Trimming order based on memory
pressure makes sense (and we've already got reports that on memory limited
devices large order folios in the page cache have too big memory overhead
so we'll likely need to handle that for page cache allocations in general)
but IMHO it belongs to page_cache_ra_order() or some other common place
like that.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

