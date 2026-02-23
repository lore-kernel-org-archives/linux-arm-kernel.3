Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E10EA4FBA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 12:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFN7V026lnmVlaoqZPmxvQqPSRV+rY5RviyiO7CZHLE=; b=MUnNnRWgUlP/3uIG+jerj9dgcI
	jkuCUzCUiI53CKdcxnChh86uGffHP3pgWGrdROCnO1uhM/fSjp7OnRPMQ9O0skvWM/dqIFWplO5kj
	hxtPLGVHrnrEPlLddp4DxyL9cpq/8i0T2cHHWMM2ipNlTfahTZKwICEjSnbPxCpUarK5jUb1j7XJ4
	FKHgbUuRhzkEH9tX6jfp+ZOH6ksvHasf2oI83WVnj4+4j5R5OFyTxAxhEcFNG5E8U3xlpVqs3x2vs
	B77bLjH1B5zRylAi+Wm+hSBKGvdo/cJo0KP3sasmLouNwRqY74VaLrtYDEhwjRsNLdEWpd55ZZg03
	bQQdtvig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVNO-00000000J5n-30LG;
	Mon, 23 Feb 2026 12:49:26 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVNM-00000000J5K-19SB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 12:49:25 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0AD655BD1A;
	Mon, 23 Feb 2026 12:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771850961; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vFN7V026lnmVlaoqZPmxvQqPSRV+rY5RviyiO7CZHLE=;
	b=hWCh/fcnYbWOr0SnKn+8Gvp9MsGvJLNT9fHklv1eZtUszRDIHovvz85EMEjwHNGndCJJFq
	yKsJQRxQEfsfCq1SzEwcovuaP0m47F3E2kwUn+Mqc1rXsI+fKEwVdClkxApqUGmEyT23ht
	wREDMy+J+vw6Jb8dMd7IBYXp9yi4Ltw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771850961;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vFN7V026lnmVlaoqZPmxvQqPSRV+rY5RviyiO7CZHLE=;
	b=730yGY6dEaj+Z3/XQywCS/aZE3fxtDGf7MGWUwWGhX4N8yLwFrbffzt/Bon2lXIlNw3a/B
	LzAwqbD5sjsSz9AQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="hWCh/fcn";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=730yGY6d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771850961; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vFN7V026lnmVlaoqZPmxvQqPSRV+rY5RviyiO7CZHLE=;
	b=hWCh/fcnYbWOr0SnKn+8Gvp9MsGvJLNT9fHklv1eZtUszRDIHovvz85EMEjwHNGndCJJFq
	yKsJQRxQEfsfCq1SzEwcovuaP0m47F3E2kwUn+Mqc1rXsI+fKEwVdClkxApqUGmEyT23ht
	wREDMy+J+vw6Jb8dMd7IBYXp9yi4Ltw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771850961;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vFN7V026lnmVlaoqZPmxvQqPSRV+rY5RviyiO7CZHLE=;
	b=730yGY6dEaj+Z3/XQywCS/aZE3fxtDGf7MGWUwWGhX4N8yLwFrbffzt/Bon2lXIlNw3a/B
	LzAwqbD5sjsSz9AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ACC2A3EA68;
	Mon, 23 Feb 2026 12:49:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id c4qlJs9MnGmJfgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 23 Feb 2026 12:49:19 +0000
Date: Mon, 23 Feb 2026 12:49:18 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: Dev Jain <dev.jain@arm.com>
Cc: lsf-pc@lists.linux-foundation.org, ryan.roberts@arm.com, 
	catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org, willy@infradead.org, 
	hughd@google.com, baolin.wang@linux.alibaba.com, akpm@linux-foundation.org, 
	david@kernel.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, 
	vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [LSF/MM/BPF TOPIC] Per-process page size
Message-ID: <fqsd4x5oqavouhwawmsmpanaszvr6xsboc2oeqzs3fafrtovpk@gfnqznoqlabk>
References: <20260217145026.3880286-1-dev.jain@arm.com>
 <yfe2xbb6qwthg3cf4yr7zszpw5o3mx2v4bv32iwnm7yzxqjsvl@et22s2nuwzzk>
 <a778d249-afea-4488-b045-beff3492a48a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a778d249-afea-4488-b045-beff3492a48a@arm.com>
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 0AD655BD1A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_044924_468070_0AA9B892 
X-CRM114-Status: GOOD (  26.07  )
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

On Mon, Feb 23, 2026 at 10:37:55AM +0530, Dev Jain wrote:
> >>
> >> 3. Translation from Linux pagetable to native pagetable
> >> -------------------------------------------------------
> >> Assume the case of a kernel pagesize of 4K and app pagesize of 64K.
> >> Now that enlightenment is done, it is guaranteed that every single mapping
> >> in the 4K pagetable (which we call the Linux pagetable) is of granularity
> >> at least 64K. In the arm64 MM code, we maintain a "native" pagetable per
> >> mm_struct, which is based off a 64K geometry. Because of the guarantee
> >> aforementioned, any pagetable operation on the Linux pagetable
> >> (set_ptes, clear_flush_ptes, modify_prot_start_ptes, etc) is going to happen
> >> at a granularity of at least 16 PTEs - therefore we can translate this
> >> operation to modify a single PTE entry in the native pagetable.
> >> Given that enlightenment may miss corner cases, we insert a warning in the
> >> architecture code - on being presented with an operation not translatable
> >> into a native operation, we fallback to the Linux pagetable, thus losing
> >> the benefits borne out of the pagetable geometry but keeping
> >> the emulation intact.
> > I don't understand. What exactly are you trying to do here? Maintain 2
> > different paging structures, one for core mm and the other for the arch? As
> > done in architectures with no radix tree paging structures?
> 
> The mm->pgd will be the software pagetable. So suppose that do_anonymous_page is
> doing set_ptes on the PTE table belonging to the software pagetable. We will
> hook a "native_set_ptes" into set_ptes, which will set the ptes on a different
> pagetable maintained by arm64 code (probably mm_context_t->native_pgd).

Traditionally, you do this kind of funky manipulation in update_mmu_cache.

But this is still an extremely complex and invasive change (that I assume most
people would not like to see) with dubious benefit.

> 
> >
> > If so, that's wildly inefficient, unless you're willing to go into reclaimable
> > page tables on the arm64 side. And that brings extra problems and extra fun :)
> 
> I didn't understand the reclaimable reference, but yes we need to make this efficient.

I'm not talking about CPU runtime efficiency, but memory efficiency. Doing
this makes you essentially duplicate page tables - not exactly ideal. This is
a Known Problem in classic UNIX systems which do something similar
(but not the same): anonymous memory pointers are stored in some intermediary
structure (SunOS and UVM call it "amap"), and paging structures are entirely
redundant there. They can freely tear down a page table because they can freely
put it together from the amap and file mappings (what they call vm_object and
we call address_space).

Anyway, I'm boring you with these funny historical details so you can understand
the similarities: the Linux page table format generally matches hardware, and
we store anonymous memory "state" there, so you can't ever tear-down a pgtable
without losing state of whatever was mapped there before. However, if you go
down the "arm64 now has a separate pgtable structure", the roles switch:
arm64's internal page table format makes for the real page tables, and linux's
pgtable structure is nothing more than an "amap". So you could (and perhaps
should) freely reclaim arm64 MMU page tables once memory pressure hits, because
they are freely discardable.

Does this make sense?

-- 
Pedro

