Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFCECDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 19:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZIGhBG/8Lw0a5tTbCrM4WR8Uy8BiutNW2JHz4dPgbo=; b=Lt69FnsgWzbbX9aJoN9yiW5Ete
	ABkX38Tp7pI6a38l8TNkBW3ouP6go2+HLoE870i0gUKMUpRawSA3qc//FXWng5QnF9sdSJoCIZDqr
	oJ39/OeR2jrKc/gKqBmQjtghS5KpKawdiQKM08qS4ZJZiT3RnckbOQg+orNQN0UJM25+PrA71opIj
	mlTu+GiLJvRMzL3StKUo/3S3H/+XWJmBWGbMjkTHk/9KytMHi5NPKAHmSSEkddlqt83fBHtivJb+q
	VkFnLBhXc2QrTLZ8X9NZFJMsBVrrA7O7uR6Bepz5uDihuvucSfOsZCJz80JuB73RNXaK5FSnjIHFj
	mbrdHVwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcTDp-00000008GcP-2zBa;
	Wed, 24 Jun 2026 19:25:17 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcTDn-00000008Gbu-03j6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 19:25:16 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6EBF56DCFB;
	Wed, 24 Jun 2026 19:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782329111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZZIGhBG/8Lw0a5tTbCrM4WR8Uy8BiutNW2JHz4dPgbo=;
	b=r4QcG6mhdA8RArfyr4RzLWsdZ62VMaOWod0jhxVp9yJa0FkBdGbZ7182pbjEKU1vLvNOfN
	TuEV8c15lQ2a3ntIDq1xo2PVMGzpPE/uQhBPUUr22yhG396lFk1gtEDG/Z90+RazgtM65f
	SPoSMq3abg3N+IzeKD3OQLY0S8BQ1WE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782329111;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZZIGhBG/8Lw0a5tTbCrM4WR8Uy8BiutNW2JHz4dPgbo=;
	b=eI4FJn9xIGiHGPE2bT0os6X6lTIxKgs42HDiqUq4Q1bpsA8PSNg8dQMIvQEeosXc03CXUg
	Jp/N53lPqM1kLxAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=09mNOUvu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+86KRCmp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782329110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZZIGhBG/8Lw0a5tTbCrM4WR8Uy8BiutNW2JHz4dPgbo=;
	b=09mNOUvueboSyfPMk1LHBeagcrzoNimbuBgvMPdkbkArCJCh2V8waJjdsa0Iqajatb7DMB
	sbUJqxWI3QBvCH1g7vyjwV5tC7mPL2LdzCzFYvLjLSRSEbSEBrSHmt6F4AfBgge8ir5/g9
	KknEBm5nsRArZOmomeiUnl4xB6C9QqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782329110;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZZIGhBG/8Lw0a5tTbCrM4WR8Uy8BiutNW2JHz4dPgbo=;
	b=+86KRCmpXaXmybCmX7a4NNPEFUzGMdP/BaPoVfzJfUnyt/wNa9en2f7WoEodOpSt7wu9kK
	dSQ83Z715QD4BpBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 78D19779A8;
	Wed, 24 Jun 2026 19:25:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Z4J7GRUvPGrIXgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 24 Jun 2026 19:25:09 +0000
Date: Wed, 24 Jun 2026 20:25:07 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Usama Anjum <usama.anjum@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: mm: opaque hardware page-table entry handles
Message-ID: <ajwuKpSnElvwIyhC@pedro-suse>
References: <74182e50-b54f-4d2d-a27f-3a59a538d6bc@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74182e50-b54f-4d2d-a27f-3a59a538d6bc@arm.com>
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 6EBF56DCFB
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_122515_353576_B6C4320B 
X-CRM114-Status: GOOD (  41.57  )
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

On Wed, Jun 24, 2026 at 03:09:08PM +0100, Usama Anjum wrote:
> Hi all,
> 
> This is a direction-check with the wider community before spending time on the
> development. This picks up the idea that was raised and broadly agreed in the
> earlier thread (Ryan Roberts, Lorenzo Stoakes, David Hildenbrand) [1].
> 
> The problem
> -----------
> Core MM code reaches page-table entries by raw pointer dereference (pte_t *,
> pmd_t *, *pud, ...) in places, implicitly assuming a single, uniform
> representation. Sprinkling getters wouldn't solve the problem entirely. The
> problem is one level up: the *pointer type* itself is overloaded. At each level
> there are really three distinct things:
> 
>   1. a page-table entry value (pte_t, pmd_t, ...)
>   2. a pointer to an entry value, e.g. a pXX_t on the stack
>   3. a pointer to a live entry in the hardware page table
> 
> Today (2) and (3) share the same type - pte_t *, pmd_t *, and so on. Nothing
> distinguishes a pointer into a live table from a pointer to a stack copy.
> 
> A pointer to an on-stack entry value and a pointer to a live hardware entry have
> the same type, so the compiler cannot distinguish them. Passing the stack
> pointer to an arch helper that expects a hardware-entry pointer compiles fine,
> but is wrong - a bug class the type system makes invisible. It also blocks
> evolution: an arch helper may need to read beyond the addressed entry (e.g.
> adjacent or contiguous entries), which only makes sense for a real page-table
> pointer, not a stack copy.
> 
> The idea
> --------
> Give (3) its own opaque type that cannot be dereferenced:
> 
>     /* opaque handle to a HW page-table entry; not dereferenceable */
>     typedef struct {
> 	pte_t *ptr;
>     } hw_ptep;

I don't love typedefs that hide pointers.

> 
> With this:
> 
>   - a stack value can no longer masquerade as a hardware table entry,
>   - a hardware handle can no longer be raw-dereferenced,
>   - cases that genuinely operate on a value can be refactored to pass the value
>     and let the caller, which knows whether it holds a handle or a stack copy,
>     read it once.

Just a small passing comment: how about doing it differently? like

typedef struct {
	pte_t *ptep;
} sw_ptep_t;

or something like that. Were I to guess, referring to a pte_t on the stack
is much rarer than all the pte_t references to actual page tables. But maybe
reality doesn't match up with my guess :)

> 
> The overload becomes a compile-time type error instead of a silent runtime bug,
> and converting the tree forces every such site to be made explicit. This gives
> us a framework where the architecture can completely virtualize the pgtable if
> it likes; and the compiler can enforce that higher level code can't accidentally
> work around it.
> 
> It is opt-in by architectures and incremental. The generic definition is
> just an alias, so arches that do not care build unchanged:
> 
>     typedef pte_t *hw_ptep;
> 
> An arch flips to the strong struct type when it is ready, and only then does
> it get the stronger checking. This lets the conversion land gradually.
> 
> Beyond fixing the latent bug class, this abstraction is an enabler for upcoming
> features that need tighter control over how page tables are accessed and
> manipulated.
> 
> Getter flavours
> ---------------
> While converting, it is useful to have two accessor flavours at each level:
> 
>   - pXXp_get(hw_ptep)        plain C dereference (compiler may optimize)
>   - pXXp_get_once(hw_ptep)   single-copy-atomic, not torn, elided or
>                              duplicated by the compiler
> 
> Keeping them distinct simplifies the conversion and avoids re-introducing the
> class of lockless-read bugs seen on 32-bit.
> 
> Example conversion
> ------------------
> Most of the conversion is mechanical.
> 
>   -static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>   -		pte_t *ptep, pte_t pte, unsigned int nr)
>   +static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>   +		hw_ptep ptep, pte_t pte, unsigned int nr)
>    {
>    	page_table_check_ptes_set(mm, addr, ptep, pte, nr);
>    	for (;;) {
>    		set_pte(ptep, pte);
>    		if (--nr == 0)
>    			break;
>   -		ptep++;
>   +		ptep = hw_pte_next(ptep);
>    		pte = pte_next_pfn(pte);
>    	}
>    }
> 
> The bulk of work is this kind of rote substitution. The genuine work is the
> handful of sites that turn out to be operating on a stack copy rather than a
> live entry - those are exactly the ones the new type forces us to surface and 
> fix.
> 
> Estimated churn:
> ----------------
> Half way through the prototyping converting only PTE and PMD levels:
>   77 files changed, +1801 / -1425
>   ~57 files reference the new types

Right, the churn would be very unfortunate.

> 
> So the line count will grow once PUD/P4D/PGD and the remaining call sites are
> converted; expect meaningfully more churn than the numbers above.
> 
> Introduce the type as an alias, convert one helper family per patch, and flip
> an arch to the strong type last - with non-opted arches building unchanged at
> every step.
> 
> Open questions
> --------------
>   - Is the type-safety + future-feature enablement worth the churn?
>   - Naming: hw_ptep/hw_pmdp vs something else?
>   - Should all five levels be converted before merging anything, or is a staged
>     PTE-and-PMD then landing others acceptable?
>   - Do we want the two getter flavours (pXXp_get / pXXp_get_once) at every
>     level?
> 
> [1] https://lore.kernel.org/all/a063f6c5-2785-4a9f-8079-25edb3e54cef@arm.com
> 
> Thanks,
> Usama
> 

-- 
Pedro

