Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3096C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 19:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKD7xlXfwFoEwiwqHEV4Td7lXumlOXqIMagnoJLqgFA=; b=H64G8nmleb8qZuJTZod03HZ+XC
	doHYuRdYL4NofoAqwzY18tGxcrT2iH+0WLikVpFCmKeKI04uH6ugtOSUGfXcTqwg0wUoddfUegR09
	qAodbi36dhTDmiFVYJhLwfEXiUD21NkHniVYNAuUiOyfidMVBuMMkLvZP182fRgS0+2VKFSNV3jzA
	O5Iz9/SSsMITo86OSaqIl4qv5gAjRCCdXXL6caMTuNiuzVSGCpCfT3wcD4/JZCYAK05IopohYS4mO
	Wz3JB4mlmmGG5uBbr6X83iE9O1wynXZfEMfwlQAA8CEqZ3ED7zBbtagbRbvDWGnNDd8dR1IkkBzBa
	gFdEl55A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrKjM-00000002flR-1Tml;
	Tue, 04 Aug 2026 19:23:16 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrKjK-00000002fkl-0TDr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 19:23:15 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 33AE63E7F;
	Tue,  4 Aug 2026 19:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785871386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BKD7xlXfwFoEwiwqHEV4Td7lXumlOXqIMagnoJLqgFA=;
	b=G0aDHau6+dIF0VH9t1gS8zo/PAE5MUYtI5NFSJa+igRMyfvazx08234PtrB5zhMSqvolUc
	ZRlNH6FMUsNtxJXHp9b423eoHcwb3mWs+HOhqhgA88b0NnBuOftLs9/PFg4+xpFZ3z5suZ
	3Vh14YFjPbLSry6q8o8XstVCgShvlKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785871386;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BKD7xlXfwFoEwiwqHEV4Td7lXumlOXqIMagnoJLqgFA=;
	b=pGC0mHI08b9pOWsQTxcNzgcuiKSFwx/kGcb0oreTd5YmdjxJwS/tXPSu07A9mzE5Xx4M8S
	UOfeAimDR6/I+FBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gvPlR+Hd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9l91suue
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785871382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BKD7xlXfwFoEwiwqHEV4Td7lXumlOXqIMagnoJLqgFA=;
	b=gvPlR+HddGLYBkCQFYlBjwm/5NDohTMacQIo4zdQY5wDSAMNKeIX6GQeE55WveZfb7EOlc
	h9ckoqyZ4MS0TeimEz1GyDiXqUswKlvAOpzQpzZ5vCOqLMRuye6vK7qyKAfuzSnUaoBAn5
	7kl2EZYltPAucG9K3qTn0uxRYtxiIaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785871382;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BKD7xlXfwFoEwiwqHEV4Td7lXumlOXqIMagnoJLqgFA=;
	b=9l91suueSJ/aZk3c7geSquvAlMvZDmI4qlaZrtRMZmI3pJWfN07iE4Cw/pIS9pT1bNtGWT
	cnVYkK+8J3MjuDCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2F36F779BB;
	Tue,  4 Aug 2026 19:23:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GVRHCBQ8cmofZQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Tue, 04 Aug 2026 19:23:00 +0000
Date: Tue, 4 Aug 2026 20:22:58 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Muhammad Usama Anjum <usama.anjum@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] mm: constify the pte_offset_map_ro_nolock()
 return value
Message-ID: <anI6BEyTJFzQY-N9@pedro-suse.lan>
References: <20260803164400.531199-1-pfalcato@suse.de>
 <20260803164400.531199-7-pfalcato@suse.de>
 <anHJ48Glq8EdHatd@lucifer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anHJ48Glq8EdHatd@lucifer>
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmx.de];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,arm.com,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,infradead.org,google.com,suse.com,suse.cz,nvidia.com,linux.alibaba.com,redhat.com,linux.dev,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,kvack.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	R_RATELIMIT(0.00)[to_ip_from(RL764437jfm1qe6abtk9nwyx8m)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim]
X-Rspamd-Queue-Id: 33AE63E7F
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_122314_455614_A8DBBD56 
X-CRM114-Status: GOOD (  35.10  )
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

On Tue, Aug 04, 2026 at 12:22:19PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Mon, Aug 03, 2026 at 05:44:00PM +0100, Pedro Falcato wrote:
> > Constify the pte_t * retval from pte_offset_map_ro_nolock(), for which it is
> > already pledged that accesses must be read-only. With it, convert the three
> > treewide users to use const pte_t *.
> >
> > khugepaged passes the result right down to fault code (do_swap_page()). This
> > leads to a complicated set of conditions that, in order to be correct, must
> > not install anything into *vmf->pte. This is not trivial to work around in
> > fault code, and as such just trivially cast to non-const pte_t* in the
> > meantime.
> >
> > The other users are far more trivial and the conversion is equally
> > trivially simple.
> 
> Ah finally more words! :)

:)

> 
> >
> > Signed-off-by: Pedro Falcato <pfalcato@suse.de>
> 
> With comment updated as below and nits addressed, LGTM so:
> 
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 
> > ---
> >  arch/powerpc/mm/pgtable.c | 2 +-
> >  include/linux/mm.h        | 4 ++--
> >  include/linux/pgtable.h   | 2 +-
> >  mm/filemap.c              | 2 +-
> >  mm/khugepaged.c           | 2 +-
> >  mm/pgtable-generic.c      | 4 ++--
> >  6 files changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> > index a9be337be3e4..e29db41b6043 100644
> > --- a/arch/powerpc/mm/pgtable.c
> > +++ b/arch/powerpc/mm/pgtable.c
> > @@ -390,7 +390,7 @@ void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
> >  	p4d_t *p4d;
> >  	pud_t *pud;
> >  	pmd_t *pmd;
> > -	pte_t *pte;
> > +	const pte_t *pte;
> >  	spinlock_t *ptl;
> >
> >  	if (mm == &init_mm)
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 7fabe6c66b4b..acf5a5e31d34 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -3885,8 +3885,8 @@ static inline pte_t *pte_offset_map(pmd_t *pmd, unsigned long addr)
> >  pte_t *pte_offset_map_lock(struct mm_struct *mm, pmd_t *pmd,
> >  			   unsigned long addr, spinlock_t **ptlp);
> >
> > -pte_t *pte_offset_map_ro_nolock(struct mm_struct *mm, pmd_t *pmd,
> > -				unsigned long addr, spinlock_t **ptlp);
> > +const pte_t *pte_offset_map_ro_nolock(struct mm_struct *mm, pmd_t *pmd,
> > +				      unsigned long addr, spinlock_t **ptlp);
> >  pte_t *pte_offset_map_rw_nolock(struct mm_struct *mm, pmd_t *pmd,
> >  				unsigned long addr, pmd_t *pmdvalp,
> >  				spinlock_t **ptlp);
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index dc418553e57a..dd51e722c535 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -112,7 +112,7 @@ static inline pte_t *__pte_map(pmd_t *pmd, unsigned long address)
> >  {
> >  	return pte_offset_kernel(pmd, address);
> >  }
> > -static inline void pte_unmap(pte_t *pte)
> > +static inline void pte_unmap(const pte_t *pte)
> 
> I was going to question this based on whether the contract holds for
> CONFIG_HIGHPTE but actually:
> 
> #define pte_unmap(pte)	do {	\
> 	kunmap_local((pte));	\
> 	rcu_read_unlock();	\
> } while (0)
> 
> #define kunmap_local(__addr)					\
> do {								\
> 	BUILD_BUG_ON(__same_type((__addr), struct page *));	\
> 	__kunmap_local(__addr);					\
> } while (0)
> 
> static inline void __kunmap_local(const void *vaddr) <-- const!
> {
> 	kunmap_local_indexed(vaddr);
> }
> 
> So nice (CONFIG_HIGHPTE is going to go away at some point though, right? I
> hope... :)
> 
> 
> >  {
> >  	rcu_read_unlock();
> >  }
> > diff --git a/mm/filemap.c b/mm/filemap.c
> > index 6afec636881f..af5d3fcd1b05 100644
> > --- a/mm/filemap.c
> > +++ b/mm/filemap.c
> > @@ -3490,7 +3490,7 @@ static vm_fault_t filemap_fault_recheck_pte_none(struct vm_fault *vmf)
> >  {
> >  	struct vm_area_struct *vma = vmf->vma;
> >  	vm_fault_t ret = 0;
> > -	pte_t *ptep;
> > +	const pte_t *ptep;
> >
> >  	/*
> >  	 * We might have COW'ed a pagecache folio and might now have an mlocked
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index b237f6e7662a..09efac93a8c6 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -1170,7 +1170,7 @@ static enum scan_result __collapse_huge_page_swapin(struct mm_struct *mm,
> >  			 * Here the ptl is only used to check pte_same() in
> >  			 * do_swap_page(), so readonly version is enough.
> >  			 */
> > -			pte = pte_offset_map_ro_nolock(mm, pmd, addr, &ptl);
> > +			pte = (pte_t *) pte_offset_map_ro_nolock(mm, pmd, addr, &ptl);
> 
> Hmm yeah this is nasty, but you explain why in the commit message. Could you
> extend the comment to explain it?

Yep, I'll do it.

> 
> >  			if (!pte) {
> >  				mmap_read_unlock(mm);
> >  				result = SCAN_NO_PTE_TABLE;
> > diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> > index b91b1a98029c..2cfc6e608ef4 100644
> > --- a/mm/pgtable-generic.c
> > +++ b/mm/pgtable-generic.c
> > @@ -308,8 +308,8 @@ pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
> >  	return NULL;
> >  }
> >
> > -pte_t *pte_offset_map_ro_nolock(struct mm_struct *mm, pmd_t *pmd,
> > -				unsigned long addr, spinlock_t **ptlp)
> > +const pte_t *pte_offset_map_ro_nolock(struct mm_struct *mm, pmd_t *pmd,
> 
> Can pmd be const too?

I was going to say "yes but then pmdp_get() also needs to be constfified" but
actually no, it can't:

pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp) {
        if (unlikely(pmd_bad(pmdval))) {
                pmd_clear_bad(pmd);
                goto nomap;
        }
}

so PTE mapping actually needs to write to the pmdp if the pmd looks bad.
Tricky stuff :)

-- 
Pedro

