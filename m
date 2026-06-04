Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FF6CD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 19:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17A0fGLj3810t+Y/YXXQUqyaPr5NJ91ZX0M+6IS2/zE=; b=pwE8nWtLThYCRGkz6lZRFwwt5N
	Ay3JA+OIQLMvmu6sx/HxQTPKmWIzmick7ZgWkuTPUReAUsA7AmJeSTpvp+RObYg4/a+ifV/nhYCUa
	5uovcK5KY6FneaC1thxnHBMarnUauc47kfIkX26Tiq8YcofXnibigyrZOchaDQAiqj4NT5I0YzKhI
	GaP/yjKnNCBQXy1W6LWZmLYVJQ4PS+iZ1aPJd9MryxmPRUTAN0HV6ZQ3ock+NC2liS/uFNhxeuRv2
	9i/U3kACHigafbWgww7w3/QTVy/a0YmlEF9UVrof5C0+mVNS6Bij1uxfdSPdRiWut8VnSDuZyTcJ9
	zljdVjFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVDou-0000000HDbd-33ik;
	Thu, 04 Jun 2026 19:33:36 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVDos-0000000HDbI-3Rcc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 19:33:36 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 121786B070;
	Thu,  4 Jun 2026 19:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780601613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=17A0fGLj3810t+Y/YXXQUqyaPr5NJ91ZX0M+6IS2/zE=;
	b=WIZh2DVyNF+J88p0RUcOfFrQZtq1yBCwnN3RA6FJxULVMT6skJVz+LwPJjurOLVHJMDP/r
	Mga0TWzFCLlmQhvU2G6x6zAk7kpocfztQRzWKvVwrafWSvgUbUyL6yxtjLMaBZp1KhYnd4
	dNaZQkQ+SxY2xtISp2dgVttb2GqYPIs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780601613;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=17A0fGLj3810t+Y/YXXQUqyaPr5NJ91ZX0M+6IS2/zE=;
	b=qbCYaYttIPyQ8PjOpFOnhqBob8yWUW3rtX5CfN6zNOJm7Cn8y46bqT9urzlCUp+NvpZ3TF
	r/rERYsIDHeu9RBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780601613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=17A0fGLj3810t+Y/YXXQUqyaPr5NJ91ZX0M+6IS2/zE=;
	b=WIZh2DVyNF+J88p0RUcOfFrQZtq1yBCwnN3RA6FJxULVMT6skJVz+LwPJjurOLVHJMDP/r
	Mga0TWzFCLlmQhvU2G6x6zAk7kpocfztQRzWKvVwrafWSvgUbUyL6yxtjLMaBZp1KhYnd4
	dNaZQkQ+SxY2xtISp2dgVttb2GqYPIs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780601613;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=17A0fGLj3810t+Y/YXXQUqyaPr5NJ91ZX0M+6IS2/zE=;
	b=qbCYaYttIPyQ8PjOpFOnhqBob8yWUW3rtX5CfN6zNOJm7Cn8y46bqT9urzlCUp+NvpZ3TF
	r/rERYsIDHeu9RBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 08564779A8;
	Thu,  4 Jun 2026 19:33:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 10u7OAnTIWo3EwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Thu, 04 Jun 2026 19:33:29 +0000
Date: Thu, 4 Jun 2026 20:33:23 +0100
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
Subject: Re: [PATCH v7 2/2] mm: use mapping_max_folio_order() for
 force_thp_readahead order
Message-ID: <aiHSt1uK3ESOU-2O@pedro-suse>
References: <20260601102205.3985788-1-usama.arif@linux.dev>
 <20260601102205.3985788-3-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601102205.3985788-3-usama.arif@linux.dev>
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLxu57a9hfgn7tttf5jiwuqe5o)];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[kernel];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,linux.dev:email,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_123335_032229_2BC31731 
X-CRM114-Status: GOOD (  17.28  )
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

On Mon, Jun 01, 2026 at 03:21:18AM -0700, Usama Arif wrote:
> The force_thp_readahead path in do_sync_mmap_readahead() is gated on
> HPAGE_PMD_ORDER <= MAX_PAGECACHE_ORDER and always requests
> HPAGE_PMD_ORDER / HPAGE_PMD_NR. On configurations where HPAGE_PMD_ORDER
> exceeds MAX_PAGECACHE_ORDER, notably arm64 with a 64K base page size,
> VM_HUGEPAGE mappings cannot use this path and fall back to the non-forced
> mmap readahead path even when the mapping supports useful large folios.
> 
> Enable forced readahead for mappings that support large folios and request
> the max folio order supported by the mapping, capped at 2M.
> 2MB is chosen as the cap because it matches the PMD size on x86_64
> and on arm64 with 4K base pages, so the size/memory-pressure tradeoff
> for folios of that size is already well understood. On arm64 with 16K
> and 64K base page sizes, 2MB is also the contiguous-PTE (contpte)
> block size, so the resulting folios coalesce into a single TLB entry
> and reduce TLB pressure on the readahead path. This will result
> in 32M folios not being faulted in with 16K base page size for arm64,
> but with contpte, the performance difference should be negligible.
> 
> The final allocation order may still be clamped by page_cache_ra_order()
> to the mapping and request geometry, but this gives VM_HUGEPAGE mappings
> on such configurations a large-folio readahead request instead of
> dropping back to base-page readahead.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

Overall LGTM. Lets see if performance doesn't degrade.

/me hides in cover

-- 
Pedro

