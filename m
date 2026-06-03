Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DCDCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIeJZpdX8FCDjWAXiU77ogVQ0B8VkYFjD6D0OQC7A18=; b=QZqT03b0RhtDvFBZDC4KUmpb0S
	w6RbLQ5jy3E8OPfHECPKt86KKKmqUW3vlFQ6Ws+KQSZsTC6xTh5gOTZBGacCkRNlKTmAJh2BOCYOC
	0ergNE5dv0WsW64SKmIs9nrOmjvOdeLGwOfXox4uaAN82PwNGb4YvzpDi2LEosvJY2PrCpZr9D5PR
	NUPfU3EkBhYtwzbWSBW1e/QjN5YVwsfc/HI4mc5FjS+mk81pADwGrnCISOsdSkBv+SNMdrUVlolkD
	gaCFZNGqpVDWPcR4+RQe4iYyzoGdEh3E09I+iLngOoM6SV2a14oci9BMECM7pV4cWDulwu9WgPuvb
	wFXw9Zmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUk89-0000000Eyyg-1CYt;
	Wed, 03 Jun 2026 11:51:29 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUk87-0000000Eyy9-1vpZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:51:28 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EC7C56A967;
	Wed,  3 Jun 2026 11:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780487485; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uIeJZpdX8FCDjWAXiU77ogVQ0B8VkYFjD6D0OQC7A18=;
	b=QbdYIxe/Gs/9/BoTeN7ibvY7dS8gkSD+ySmZXR3ZJiaWbT4eVFOcZf/Jj9iwSY0dtbs5fG
	Q9m6Ep6bYwT1tl9MDgjfLwj46KNaDwmJX95T4RaOS4tZmxmTInBiiSG7+w7y25DWFf0Ah2
	K8G40+l3/dVpOh8xBDjwoyCWP1Xusp8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780487485;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uIeJZpdX8FCDjWAXiU77ogVQ0B8VkYFjD6D0OQC7A18=;
	b=z08nhYPV1E3pSjmY8dnj/KUsuV7AN17ldgtTRzfkW/DiBQD8dzONmIhC46Q7J8idHUlHkt
	JUUY+3VLSPA4/mCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780487484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uIeJZpdX8FCDjWAXiU77ogVQ0B8VkYFjD6D0OQC7A18=;
	b=oFyz+dhjaeqWT7Truzwz4h9no5m6xSisEeu7H4N6wTmSn4R3Y/OsJi0AQ1HpeF/tAKk5Ye
	TmdCqKwT/sbDV/a5iQUF21TUBq3QdDVCh8ZKiWVwNaBniEuMghV7dLEUNde6yIFVttdnqB
	bIaatVvaryXEIZxJ3tKzs6NR9L6I9U8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780487484;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uIeJZpdX8FCDjWAXiU77ogVQ0B8VkYFjD6D0OQC7A18=;
	b=8+ubzr4LKhjqgIw6B8HAYIBMlI/o1uUjb6pNV7y8iq23Vl/Go3QS/QWW5T0LjX8dhS5mS2
	+hI0sxVvmnd7LeDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D22DC779A7;
	Wed,  3 Jun 2026 11:51:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id doglMDoVIGo+YwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 03 Jun 2026 11:51:22 +0000
Date: Wed, 3 Jun 2026 12:51:21 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Usama Arif <usama.arif@linux.dev>
Cc: Jan Kara <jack@suse.cz>, willy@infradead.org, 
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
Message-ID: <aiAUoWiXNpUY_iIg@pedro-suse.lan>
References: <20260528165635.2068012-1-usama.arif@linux.dev>
 <20260528165635.2068012-3-usama.arif@linux.dev>
 <ahlh2vdHEGo6ZSot@pedro-suse.lan>
 <cc9a1cf7-7b96-439a-b0be-ecdcf27b5da5@linux.dev>
 <ahmSolHvUChl-3vM@pedro-suse.lan>
 <185f1caf-b33d-4467-beb5-51bd8520ac78@linux.dev>
 <u52xvwk2fjjk2izdb4wvuqq2zhc5neb4q6usimcxejluuyngxw@d64sc6rvojyp>
 <ah8Qcxuugn5tTilK@pedro-suse>
 <68ca2764-ca7c-482e-8e78-8c112ce01f99@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68ca2764-ca7c-482e-8e78-8c112ce01f99@linux.dev>
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[kernel];
	R_RATELIMIT(0.00)[to_ip_from(RLxu57a9hfgn7tttf5jiwuqe5o)];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,pedro-suse.lan:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_045127_646383_8B31A05E 
X-CRM114-Status: GOOD (  36.18  )
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

On Wed, Jun 03, 2026 at 11:10:45AM +0100, Usama Arif wrote:
> 
> 
> On 02/06/2026 18:35, Pedro Falcato wrote:
> > On Sat, May 30, 2026 at 05:16:29PM +0200, Jan Kara wrote:
> >> On Fri 29-05-26 15:11:54, Usama Arif wrote:
> >>> On 29/05/2026 14:40, Pedro Falcato wrote:
> >>>> On Fri, May 29, 2026 at 01:19:03PM +0100, Usama Arif wrote:
> >>>>>
> >>>>> which means mapping_max_folio_order(mapping) <= MAX_PAGECACHE_ORDER <= HPAGE_PMD_ORDER is always
> >>>>> true, and you dont need the min3(..) in your diff.
> >>>>>
> >>>>> Now the question is if then why not just do:
> >>>>>
> >>>>> 	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && (vm_flags & VM_HUGEPAGE)) {
> >>>>> 		if (mapping_large_folio_support(mapping)) {
> >>>>> 			force_thp_readahead = true;
> >>>>> 			thp_order = min_t(unsigned int,
> >>>>> 					  mapping_max_folio_order(mapping),
> >>>>> 					  get_order(SZ_2M));
> >>>>> 		}
> >>>>> 	}
> >>>>>
> >>>>>
> >>>>> This is because this will regress the 16K ARM case where we already got 32M
> >>>>> folios. Someone might upgrade the kernel and start getting 2M folios now.
> >>>>
> >>>> So maybe limit to 32MB? It's still arbitrary but at least you get simpler
> >>>> logic. If the architecture does not support 32MiB folios, it will clamp
> >>>> the maximum folio order to HPAGE_PMD_ORDER, and you get the same result.
> >>>>
> >>>> Does this sound correct?
> >>>>
> >>>
> >>> Yes, so if we replace it with SZ_32M, it sounds correct. I just think
> >>> the 32M size is too large. But as you pointed out, even 2M can be too large...
> >>
> >> So AFAIU the practical discussion is about two options:
> >>
> >> 1) limiting at 2MB with a slighly more complicated logic to keep mapping at
> >> PMD order for 16k pagesize on ARM but use 2MB pages for 64k pagesize on ARM
> >>
> >> or
> >>
> >> 2) limit at 32MB with simple logic which results in larger (32MB) folios
> >> with 16k and 64k pagesize on ARM and thus larger memory overhead.
> >>
> >> I'd like to maybe offer option 3): limit at 2MB with simple logic. This
> >> will reduce folio size on 16k pagesize ARM compared to 1) but do we really
> >> care? I.e., is there big enough practical performance impact with conpte
> >> and other tricks ARM is playing?
> >>
> > 
> > arm64 16K contpte tops out at 256KB TLB entries. It's quite a lot smaller than
> > a PMD entry. Also, something that was discussed at LSFMM was its effectiveness.
> > Apparently, most of the gains seem to sit on actually having a larger page size
> > (perhaps Dev/Ryan can comment; sadly the slides were not posted anywhere on
> > the ML, so I don't have numbers).
> > 
> > To me, the question is quite clear: do we trust users that say "please give me
> > hugepages" enough to unconditionally give them hugepages? I would assume the
> > answer lies somewhere between "yes" and "no", but 32MB I would say is not
> > particularly excessive. 512MB is... much worse.
> > 
> 
> I think the other question also is, if the userspace asks for hugepages, is it asking
> for the biggest possible one? I think the answer is yes on 4K base page size when
> largest is 2M, but maybe not the case for 16K and 64K. 

Yep, fully agree, the interface itself is limited. Though perhaps userspace
itself would not know...

> 
> /sys/kernel/mm/transparent_hugepage/hugepages-* is supposed to be used
> for anon only, but maybe in the future we could use that to determine the size
> of THP to give to the user for file over here? For e.g. over here we could have
> used it to determine what the biggest size is that has madvise (or always) set
> and used it over here. Its probably a much bigger discussion.

Hmm, I'm not a huge fan of those toggles (that not many people know how to
toggle), maybe using those would be a mistake. Do note that shmem already has
its own set of confusing toggles, which work similarly to these anon ones.

But, yes, it's a much bigger discussion :)

-- 
Pedro

