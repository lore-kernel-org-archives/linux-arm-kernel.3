Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB90CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 15:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SE90/JszZ/IRjGrWEI0Bz20FnK4+6DcEq7PwC6UmGJk=; b=GU5AdDUye0tRbKY77PS1Mff0ZK
	SAOfcZMf7eB+G9vcvfBZzF6xeAlmi0T2epGggztIx/fx7rMwVRFaD0XC0nLzj8Snm35wX1GmTFexA
	Rd72V3LqkAFg90YJT+GF0gC35fi/rTardGC+TaFcIQ72cn1qrqyw48frHx3Qg3a8roYPD58UY5c8o
	esi3N9H+/0dCAyhviva1+FOGwClVULyHSlJ6f88V+owHampJcnd3Y5zLz9WTlv1JopbsWUFT/oKVL
	VrTE+/Iq+3xjauHeQUNokMxUTchWKgRDH5Zc7YY3XzwUgWGj0bREOK39OES8aO5dE/fZL7uyaY7EK
	5jWRweOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTLQT-00000008sK1-1XOx;
	Sat, 30 May 2026 15:16:37 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTLQQ-00000008sJW-01ej
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 15:16:35 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 443A86BB03;
	Sat, 30 May 2026 15:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1780154190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SE90/JszZ/IRjGrWEI0Bz20FnK4+6DcEq7PwC6UmGJk=;
	b=Qa+LcmTW0ZOv9LibRf4M14HYx6ONzmia57kRHvqcPwTd3BcxiGBEeG6TM8YKzB+RKO8H2n
	PZw8uaca7wIUEt0oSClLTTozzT8ZwSJFgeVqU2OBk5dNGZiji2PDHA1w3PVqlrLjX8ul34
	gLdIrfF0XCXJgrSiHsUxfgs9b0aFqUI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1780154190;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SE90/JszZ/IRjGrWEI0Bz20FnK4+6DcEq7PwC6UmGJk=;
	b=PFpj0hi2yZT/rs7ItscQI1gzyO9nEwyIjbHSvtCf+NkEtx0A9KaNoFgp53A3WJWGc08WSW
	v4b6RbI4syEl2xCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=Qa+LcmTW;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=PFpj0hi2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1780154190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SE90/JszZ/IRjGrWEI0Bz20FnK4+6DcEq7PwC6UmGJk=;
	b=Qa+LcmTW0ZOv9LibRf4M14HYx6ONzmia57kRHvqcPwTd3BcxiGBEeG6TM8YKzB+RKO8H2n
	PZw8uaca7wIUEt0oSClLTTozzT8ZwSJFgeVqU2OBk5dNGZiji2PDHA1w3PVqlrLjX8ul34
	gLdIrfF0XCXJgrSiHsUxfgs9b0aFqUI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1780154190;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SE90/JszZ/IRjGrWEI0Bz20FnK4+6DcEq7PwC6UmGJk=;
	b=PFpj0hi2yZT/rs7ItscQI1gzyO9nEwyIjbHSvtCf+NkEtx0A9KaNoFgp53A3WJWGc08WSW
	v4b6RbI4syEl2xCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2EDC7779A7;
	Sat, 30 May 2026 15:16:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MAHOCk7/GmoTBwAAD6G6ig
	(envelope-from <jack@suse.cz>); Sat, 30 May 2026 15:16:30 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 83C05A0EBD; Sat, 30 May 2026 17:16:29 +0200 (CEST)
Date: Sat, 30 May 2026 17:16:29 +0200
From: Jan Kara <jack@suse.cz>
To: Usama Arif <usama.arif@linux.dev>
Cc: Pedro Falcato <pfalcato@suse.de>, willy@infradead.org, jack@suse.cz, 
	Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org, 
	r@hev.cc, Andrew Donnellan <andrew+kernel@donnellan.id.au>, 
	apopple@nvidia.com, baohua@kernel.org, baolin.wang@linux.alibaba.com, 
	brauner@kernel.org, catalin.marinas@arm.com, dev.jain@arm.com, kees@kernel.org, 
	kevin.brodsky@arm.com, lance.yang@linux.dev, "Liam R. Howlett" <liam@infradead.org>, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ljs@kernel.org, mhocko@suse.com, npache@redhat.com, pasha.tatashin@soleen.com, 
	rmclure@linux.ibm.com, rppt@kernel.org, surenb@google.com, vbabka@kernel.org, 
	Al Viro <viro@zeniv.linux.org.uk>, wilts.infradead.org@pedro-suse.lan, ziy@nvidia.com, 
	hannes@cmpxchg.org, kas@kernel.org, shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v6 2/2] mm: use mapping_max_folio_order() for
 force_thp_readahead order
Message-ID: <u52xvwk2fjjk2izdb4wvuqq2zhc5neb4q6usimcxejluuyngxw@d64sc6rvojyp>
References: <20260528165635.2068012-1-usama.arif@linux.dev>
 <20260528165635.2068012-3-usama.arif@linux.dev>
 <ahlh2vdHEGo6ZSot@pedro-suse.lan>
 <cc9a1cf7-7b96-439a-b0be-ecdcf27b5da5@linux.dev>
 <ahmSolHvUChl-3vM@pedro-suse.lan>
 <185f1caf-b33d-4467-beb5-51bd8520ac78@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <185f1caf-b33d-4467-beb5-51bd8520ac78@linux.dev>
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 443A86BB03
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.cz:dkim];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TAGGED_RCPT(0.00)[kernel];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	R_RATELIMIT(0.00)[to_ip_from(RL7pfqg7h1m44jupjp7nguhfec)];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_081634_198489_71DE3D3B 
X-CRM114-Status: GOOD (  34.48  )
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

On Fri 29-05-26 15:11:54, Usama Arif wrote:
> On 29/05/2026 14:40, Pedro Falcato wrote:
> > On Fri, May 29, 2026 at 01:19:03PM +0100, Usama Arif wrote:
> >>
> >> which means mapping_max_folio_order(mapping) <= MAX_PAGECACHE_ORDER <= HPAGE_PMD_ORDER is always
> >> true, and you dont need the min3(..) in your diff.
> >>
> >> Now the question is if then why not just do:
> >>
> >> 	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && (vm_flags & VM_HUGEPAGE)) {
> >> 		if (mapping_large_folio_support(mapping)) {
> >> 			force_thp_readahead = true;
> >> 			thp_order = min_t(unsigned int,
> >> 					  mapping_max_folio_order(mapping),
> >> 					  get_order(SZ_2M));
> >> 		}
> >> 	}
> >>
> >>
> >> This is because this will regress the 16K ARM case where we already got 32M
> >> folios. Someone might upgrade the kernel and start getting 2M folios now.
> > 
> > So maybe limit to 32MB? It's still arbitrary but at least you get simpler
> > logic. If the architecture does not support 32MiB folios, it will clamp
> > the maximum folio order to HPAGE_PMD_ORDER, and you get the same result.
> > 
> > Does this sound correct?
> > 
> 
> Yes, so if we replace it with SZ_32M, it sounds correct. I just think
> the 32M size is too large. But as you pointed out, even 2M can be too large...

So AFAIU the practical discussion is about two options:

1) limiting at 2MB with a slighly more complicated logic to keep mapping at
PMD order for 16k pagesize on ARM but use 2MB pages for 64k pagesize on ARM

or

2) limit at 32MB with simple logic which results in larger (32MB) folios
with 16k and 64k pagesize on ARM and thus larger memory overhead.

I'd like to maybe offer option 3): limit at 2MB with simple logic. This
will reduce folio size on 16k pagesize ARM compared to 1) but do we really
care? I.e., is there big enough practical performance impact with conpte
and other tricks ARM is playing?

> > Bottom line is that changing things will always affect someone :) Particularly
> > since the logic we have is not too careful at deciding what should or should
> > not be a THP (both in anon and file cases). And if (once?) we make it smarter,
> > it will surely also regress someone!
> 
> Yes completely agree on this as well.
> 
> So personally I do have a preference of keeping the cap at 2M atleast initially
> while we currently try and solve the issues we see with 2M alone. As we are already
> seeing reports of thrashing and compaction with just 2M, I dont think the logic
> in this patch with just an if else is that complicated.
> 
> Matthew, Jan, do you have any thoughts or strong preferences on cap size?

Frankly, no strong opinion. I'd think 3) is worth trying for its simplicity
and seeing whether somebody complains, otherwise I can live with both 1)
and 2).

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

