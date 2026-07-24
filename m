Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA369C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 12:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwqlQxogPnZR3j3vZatDYSH4YbGvS2weAZ8abPdxsk8=; b=peoB25ThgijqOsskVweXV2MmoX
	TVotecrTfGv5vS4eDMxypFahN/R1Yvpe288BtYahnBQS1WVPN4xJHwOSYE7GgO6EKOed/3+uK1rjh
	G2LO98VLE4w+hfx1aPT52I5DGrZi8KJ19b7sOtd6INl9tAsouuaoBqTdS+FM+sz1g/sBmR/4v26Pg
	Pa3KzeEvUuzUqx0KmQ8PztbamyE0KLTqdNenEYUJNThEWIJZSkDcMiIczOFJHXr8/CupR44RMYMij
	kXFoZFmrojqSo66nbm8j8ga7v4giq9JacU46vJ3wOqRnrd7hIzZxPn4Cu3NSBURRCB4uDJOoV04ml
	fv9oNTAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFTM-0000000GQyB-31Jq;
	Fri, 24 Jul 2026 12:57:52 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFTK-0000000GQxV-2OIn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 12:57:51 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 134753ECD;
	Fri, 24 Jul 2026 12:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784897868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jwqlQxogPnZR3j3vZatDYSH4YbGvS2weAZ8abPdxsk8=;
	b=tpg/AegWEEyQF9NL3NQe2dNMX5JujfVpqG5fC1Nc4EXxmT5E4LtC5ahHxaM7OXE8D40XUV
	VwAZMPotr2+KQx5XFISeCjDTQYMCrKsvycbLLpqToRj5oRBo2zDFi8rrdj5ato0KWxXq3e
	ItdiDPtlV2Mms3c2Gx90skTbZ0vvBXI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784897868;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jwqlQxogPnZR3j3vZatDYSH4YbGvS2weAZ8abPdxsk8=;
	b=wYjmyrL6U3rCCRtwBOXDHGnCz5StpbG4eKz69wfh3VCRU/PAF30jeR51gKTW3uKue0JZgm
	86ndZlfes+8ZpGAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="tpg/AegW";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wYjmyrL6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784897868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jwqlQxogPnZR3j3vZatDYSH4YbGvS2weAZ8abPdxsk8=;
	b=tpg/AegWEEyQF9NL3NQe2dNMX5JujfVpqG5fC1Nc4EXxmT5E4LtC5ahHxaM7OXE8D40XUV
	VwAZMPotr2+KQx5XFISeCjDTQYMCrKsvycbLLpqToRj5oRBo2zDFi8rrdj5ato0KWxXq3e
	ItdiDPtlV2Mms3c2Gx90skTbZ0vvBXI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784897868;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jwqlQxogPnZR3j3vZatDYSH4YbGvS2weAZ8abPdxsk8=;
	b=wYjmyrL6U3rCCRtwBOXDHGnCz5StpbG4eKz69wfh3VCRU/PAF30jeR51gKTW3uKue0JZgm
	86ndZlfes+8ZpGAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE4F0779BA;
	Fri, 24 Jul 2026 12:57:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hn4FM0phY2ogBAAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Fri, 24 Jul 2026 12:57:46 +0000
Date: Fri, 24 Jul 2026 13:57:45 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-s390@vger.kernel.org
Subject: Re: mm: opaque hardware page-table entry handles
Message-ID: <amNgK4WYP9yZe7iM@pedro-suse.lan>
References: <31d36023-d728-4eee-90f8-158c7066f565@kernel.org>
 <e22407d8-4509-4a53-9ba4-491b9d5c5ef7@arm.com>
 <4bfeb697-9c1f-4316-96bb-9bfd66f959df@kernel.org>
 <6110202c-057b-4701-8c04-1a76ee7bb9ab@arm.com>
 <20260721124057.2820903Adf-agordeev@linux.ibm.com>
 <3c21586c-0ffe-4ebc-97f1-803e8acfc5c1@arm.com>
 <716f73c1-41cc-48a5-b0e1-a47403a30da1@kernel.org>
 <47b4e62e-b001-465c-9c3b-ea0636925387@arm.com>
 <amMvuPZ0tglCoi1M@pedro-suse.lan>
 <67ee9da4-cbf9-40d1-92c7-49710fb15f1d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67ee9da4-cbf9-40d1-92c7-49710fb15f1d@arm.com>
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 134753ECD
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_055750_767264_BF2F2280 
X-CRM114-Status: GOOD (  32.13  )
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

On Fri, Jul 24, 2026 at 11:34:52AM +0100, Muhammad Usama Anjum wrote:
> On 24/07/2026 10:30 am, Pedro Falcato wrote:
> > On Thu, Jul 23, 2026 at 06:01:49PM +0100, Muhammad Usama Anjum wrote:
> >> On 23/07/2026 5:38 pm, David Hildenbrand (Arm) wrote:
> >>>
> >>>> So after the conversion, it doesn't makes sense to keep STRICT_MM_TYPECHECKS
> >>>> around. Please correct me if I'm wrong.
> >>>>
> >>>> This brings another thing in my mind that in ideal world we would just
> >>>> turn STRICT_MM_TYPECHECKS on for all arches all the time. But the problem
> >>>> with it is that STRICT_MM_TYPECHECKS defines pte_t which will stay double
> >>>> meaning still. So we want sort of STRICT_MM_TYPECHECKS with different name
> >>>> and separate stack and hardware types.
> >>>
> >>> I think STRICT_MM_TYPECHECKS is also to avoid catching when passing a pte_t into
> >>> a function that consumes a pmd_t, and vice versa.
> >>>
> >>> STRICT_MM_TYPECHECKS makes the compiler generate worse code today, which is why
> >>> we don't enable it always.
> >>>
> >>>>
> >>>>>
> >>>>> We would like to keep it, and I guess some other architectures too.
> >>>> David had summarized it well. We'll convert generic code to use hw_p*_t
> >>>> types which would be typedef to p*_t for those architectures which don't
> >>>> care about. But if an architecture wants to interpret these types
> >>>> differently or want to make sure the type is enforced and not directly
> >>>> dereferenced, they need to convert the arch code a well. But it can be
> >>>> done slowly.
> >>>
> >>> I think what Alexander meant is: they want to keep STRICT_MM_TYPECHECKS (or
> >>> something that achieves something similar :) ). So as long as that keeps on
> >>> working, all good :)
> >> Thank you for clarifying.
> >>
> >> It has been a month since I started this discussion. We don't have any
> >> disagreement on it. Should I proceed to post first part patch series considering
> >> most people must already have viewed these emails and are on-board with it?
> > 
> > Besides the vague disagreement I have (about whether this is worth it or
> > not), I have an actual objection: I've been doing some constifying of pte_t*
> > for various reasons lately, and something that just just came up is how
> > hw_ptep will _not_ work with const, unless you do something like
> > const_hw_ptep, in which case welcome to Win32 programming or something :|
> > 
> > (I'm assuming the idea still is typedef struct { pte_t *pte; } hw_ptep;)
> We have moved on from this as it was very disruptive. Now we envision the
> following:
> 
> typedef struct {pte_t __pte;} hw_pte_t;
> 
> With this, const wouldn't be a problem.

Ok, great!

> 
> > 
> > Have you tried sparse instead?
> We want to ensure safety during compile time. Without going into more detail,
> more features would be build on top of this type conversion. 

I understand corporate/business goals may be tying your hands together, but
it's really difficult to think about your proposal critically if we don't have
all the details.

-- 
Pedro

