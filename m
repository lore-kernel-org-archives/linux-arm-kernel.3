Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA97ACDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 11:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwkdMTiWvugHzs6IrfwENFnQsqfzh/B/fPgY7/p+aqg=; b=tjX0lfIOzrY2+DOsr0NGzqXAAj
	6IfR/NvvdCg5rYyaU8RqnBz1gydYdR49s7jaZJxsIj2dk900li02AMel+1dQ1WnKUkCRZSdJLdP6c
	++cNIYi1O3TFryaZlrGoCsEfDbnQ5FW+bEYK07JhX8r5mswz4wxZAur18/JPTKqyEzMEAA6lTUumU
	vmvPpGOnuOP/nQmCuSPCPRlDcdf+QQBvoXAB9jRxGgJndZt1+ImlyKDAZeVtCFCiFiePwXN/aEspU
	h2NIr1Da1AdMPlnXqL1cC3TfoPR5Ef9Tw5DPuVAArh28KD50YthSJmRPDsRdPg3LKDMi8735QCtY+
	1HAkDGFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchwZ-000000094at-1L7d;
	Thu, 25 Jun 2026 11:08:27 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchwW-000000094a2-2MPy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 11:08:26 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 82E8376152;
	Thu, 25 Jun 2026 11:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782385702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mwkdMTiWvugHzs6IrfwENFnQsqfzh/B/fPgY7/p+aqg=;
	b=iRdaiodj8qDBymIYoSzwBEVI61jLDNU5NLg2M+6WXFXyOEzuENdABASAeFX4wTBraZzWu1
	B35DDE5XDhG8A7DoulB8e4VYfMwXlFrGVpi4SfA9y66+ro069gR74z0jX8OaV6HzEKUsB6
	2z/h2ERdQ1AZHKRLJrQw8AjpuxkLYkc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782385702;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mwkdMTiWvugHzs6IrfwENFnQsqfzh/B/fPgY7/p+aqg=;
	b=9xL1LFzSm3A0Jjgc4VfxgObjF02/JzMB4Qp81cThxnbaR05ExOIqz/HVJHSRn45z3pYzp9
	ZmouQBHI0RZeXzBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782385702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mwkdMTiWvugHzs6IrfwENFnQsqfzh/B/fPgY7/p+aqg=;
	b=iRdaiodj8qDBymIYoSzwBEVI61jLDNU5NLg2M+6WXFXyOEzuENdABASAeFX4wTBraZzWu1
	B35DDE5XDhG8A7DoulB8e4VYfMwXlFrGVpi4SfA9y66+ro069gR74z0jX8OaV6HzEKUsB6
	2z/h2ERdQ1AZHKRLJrQw8AjpuxkLYkc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782385702;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mwkdMTiWvugHzs6IrfwENFnQsqfzh/B/fPgY7/p+aqg=;
	b=9xL1LFzSm3A0Jjgc4VfxgObjF02/JzMB4Qp81cThxnbaR05ExOIqz/HVJHSRn45z3pYzp9
	ZmouQBHI0RZeXzBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C8BA779A8;
	Thu, 25 Jun 2026 11:08:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VjL6GiUMPWrVUwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Thu, 25 Jun 2026 11:08:21 +0000
Date: Thu, 25 Jun 2026 12:08:19 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: mm: opaque hardware page-table entry handles
Message-ID: <aj0JU-AzsEQBOiQ1@pedro-suse>
References: <74182e50-b54f-4d2d-a27f-3a59a538d6bc@arm.com>
 <ajwuKpSnElvwIyhC@pedro-suse>
 <66310292-f618-4497-bcaa-2a4b1240566c@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66310292-f618-4497-bcaa-2a4b1240566c@arm.com>
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MISSING_XM_UA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_040824_905334_6EFFFD9F 
X-CRM114-Status: GOOD (  37.60  )
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

On Thu, Jun 25, 2026 at 11:50:28AM +0100, Muhammad Usama Anjum wrote:
> On 24/06/2026 8:25 pm, Pedro Falcato wrote:
> > On Wed, Jun 24, 2026 at 03:09:08PM +0100, Usama Anjum wrote:
> >> Hi all,
> >>
> >> This is a direction-check with the wider community before spending time on the
> >> development. This picks up the idea that was raised and broadly agreed in the
> >> earlier thread (Ryan Roberts, Lorenzo Stoakes, David Hildenbrand) [1].
> >>
> >> The problem
> >> -----------
> >> Core MM code reaches page-table entries by raw pointer dereference (pte_t *,
> >> pmd_t *, *pud, ...) in places, implicitly assuming a single, uniform
> >> representation. Sprinkling getters wouldn't solve the problem entirely. The
> >> problem is one level up: the *pointer type* itself is overloaded. At each level
> >> there are really three distinct things:
> >>
> >>   1. a page-table entry value (pte_t, pmd_t, ...)
> >>   2. a pointer to an entry value, e.g. a pXX_t on the stack
> >>   3. a pointer to a live entry in the hardware page table
> >>
> >> Today (2) and (3) share the same type - pte_t *, pmd_t *, and so on. Nothing
> >> distinguishes a pointer into a live table from a pointer to a stack copy.
> >>
> >> A pointer to an on-stack entry value and a pointer to a live hardware entry have
> >> the same type, so the compiler cannot distinguish them. Passing the stack
> >> pointer to an arch helper that expects a hardware-entry pointer compiles fine,
> >> but is wrong - a bug class the type system makes invisible. It also blocks
> >> evolution: an arch helper may need to read beyond the addressed entry (e.g.
> >> adjacent or contiguous entries), which only makes sense for a real page-table
> >> pointer, not a stack copy.
> >>
> >> The idea
> >> --------
> >> Give (3) its own opaque type that cannot be dereferenced:
> >>
> >>     /* opaque handle to a HW page-table entry; not dereferenceable */
> >>     typedef struct {
> >> 	pte_t *ptr;
> >>     } hw_ptep;
> > 
> > I don't love typedefs that hide pointers.
> Nobody likes them. This is the only way so that by mistake stack pointers
> don't get reintroduced. Its also hard to catch such cases during review.

That's not true, you could have:

typedef struct { pteval_t pte; } sw_pte_t;

and

/* only usable by arch code and whoever wants to interpret these
 * types */
static inline sw_to_ptep(sw_pte_t *swptep)
{
	return (pte_t *) swptep;
}

and so on... Also, see Documentation/process/coding-style.rst 5) typedefs, it
explicitly warns against pointer typedefs.

> 
> > 
> >>
> >> With this:
> >>
> >>   - a stack value can no longer masquerade as a hardware table entry,
> >>   - a hardware handle can no longer be raw-dereferenced,
> >>   - cases that genuinely operate on a value can be refactored to pass the value
> >>     and let the caller, which knows whether it holds a handle or a stack copy,
> >>     read it once.
> > 
> > Just a small passing comment: how about doing it differently? like
> > 
> > typedef struct {
> > 	pte_t *ptep;
> > } sw_ptep_t;
> > 
> > or something like that. Were I to guess, referring to a pte_t on the stack
> > is much rarer than all the pte_t references to actual page tables. But maybe
> > reality doesn't match up with my guess :)
> We want to fix the current usages and future usages as well. sw_ptep_t can work
> for current usages, but it'll not force the new code to be written using correct
> notations.

I don't understand what you mean. pte_t is a perfectly correct notation,
it's just currently maybe too ambiguously overloaded.

> Apart from different types, another benefit of hw_pXXp would be that
> it'll become an opaque object which only architecture can manipulate. Hence
> architecture can decide howeverever it wants to manage them in certain cases.

That's already the case. pte_t is fully opaque apart from the little fact
that you can declare one on your stack. Introducing a different sw_pte_t
would further reinforce that. And if you want ways to find raw derefs on
pointers, we can simply slap on __attribute__((noderef)) (available in
sparse and clang) on those types after sw_pte_t is introduced and pte_t
is unambiguously a "hardware" PTE.

I dunno, I'm not convinced that changing around ~450 files is worth it, and
_if_ we want to do something like this I would strongly prefer the way that
is less churny.

-- 
Pedro

