Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2224FCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 17:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzdYszYKaK4b4vH0SnQI6TUiWFf8bFm1Ogb1TfiqgZs=; b=JNDF35ccupm2c44dAS2C7JfLZb
	p/wAD4r1ThE6SpFK6jCQWaezcGHQECRqOOeoEl2SjSeUGrNEKjS0T9e6rQeZoYIsCpeHuMigBbAL7
	8woJfA/zqhknvpNXmeOwYyzeD+Hdc6e4NDYl128O4I2v8QZ+SaPL41bfIjYk+KaBrxkc8ZcI05hNG
	S7LsMFY/FArdH1YYthZiDrm5awvnl9ODTknhoCvdmlq3hFPqp520Z0q5KxTWxns1gF0xqblNn837Z
	VWsntow+tjeYAR+DG01buoVuJq+42HDoReu+CsjRII0ajdqA4R/oa5RtxC+eInrW4sobWWkAT6Upi
	DNz92KoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUT1z-0000000Darr-3Zdk;
	Tue, 02 Jun 2026 17:35:59 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUT1x-0000000Daqj-0geE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 17:35:58 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C33E275BE7;
	Tue,  2 Jun 2026 17:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780421753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PzdYszYKaK4b4vH0SnQI6TUiWFf8bFm1Ogb1TfiqgZs=;
	b=oJcmiZ+IRDb0Vl8+5HTv2yX/FDF9rGccWP37o6YhmvUhiE2iOxo3tg5UegmyBF2vhhgR4b
	Bn0yWmBg2jeI/af12tSnXAWoTv6YHiNlxM75JHnWcI0qPQ6m/dQe/olnfe5LbEpVl48w1F
	Zn5QLciVSgcBoN4ANRIvAu6btk/OF6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780421753;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PzdYszYKaK4b4vH0SnQI6TUiWFf8bFm1Ogb1TfiqgZs=;
	b=jhN2GYkSZ6ZmL7SlhUTGxGK8CGKvahfHmS6TdWBw2sjqUP11uu8YbNTC0yD4ZwQRc7jxoy
	7y47Oyq0haBSpRCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CjoN6ud0;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=d+8GAyg8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780421752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PzdYszYKaK4b4vH0SnQI6TUiWFf8bFm1Ogb1TfiqgZs=;
	b=CjoN6ud0xM6zZLHHr+iDUEJvlRR5Tcqe7CvaIG+t31o4cy6J/x5ZZFE/0EuCt9l70ftEzF
	4L2SgHs9MheGVMjLGRN+ReW6rIzJF3ziG39/Txnz/q21ehkbfyJulncwGEdvfmSZt2Eu6v
	YN3wdIaK7Ymkb7hLrFH7QvFmi3zUJcM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780421752;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PzdYszYKaK4b4vH0SnQI6TUiWFf8bFm1Ogb1TfiqgZs=;
	b=d+8GAyg8Gv/8dblHxs6OE+NHkcm59mYKFHrOEl4A53724DsuXV2AEYoC1YVWXKOJkRxAv6
	CItYWAayJ3znFBBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D53F779A7;
	Tue,  2 Jun 2026 17:35:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TNkpE3YUH2oqKgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Tue, 02 Jun 2026 17:35:50 +0000
Date: Tue, 2 Jun 2026 18:35:48 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Jan Kara <jack@suse.cz>
Cc: Usama Arif <usama.arif@linux.dev>, willy@infradead.org, 
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
Message-ID: <ah8Qcxuugn5tTilK@pedro-suse>
References: <20260528165635.2068012-1-usama.arif@linux.dev>
 <20260528165635.2068012-3-usama.arif@linux.dev>
 <ahlh2vdHEGo6ZSot@pedro-suse.lan>
 <cc9a1cf7-7b96-439a-b0be-ecdcf27b5da5@linux.dev>
 <ahmSolHvUChl-3vM@pedro-suse.lan>
 <185f1caf-b33d-4467-beb5-51bd8520ac78@linux.dev>
 <u52xvwk2fjjk2izdb4wvuqq2zhc5neb4q6usimcxejluuyngxw@d64sc6rvojyp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <u52xvwk2fjjk2izdb4wvuqq2zhc5neb4q6usimcxejluuyngxw@d64sc6rvojyp>
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: C33E275BE7
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[kernel];
	R_RATELIMIT(0.00)[to_ip_from(RL764437jfm1qe6abtk9nwyx8m)];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_103557_498045_CA54A8C8 
X-CRM114-Status: GOOD (  29.87  )
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

On Sat, May 30, 2026 at 05:16:29PM +0200, Jan Kara wrote:
> On Fri 29-05-26 15:11:54, Usama Arif wrote:
> > On 29/05/2026 14:40, Pedro Falcato wrote:
> > > On Fri, May 29, 2026 at 01:19:03PM +0100, Usama Arif wrote:
> > >>
> > >> which means mapping_max_folio_order(mapping) <= MAX_PAGECACHE_ORDER <= HPAGE_PMD_ORDER is always
> > >> true, and you dont need the min3(..) in your diff.
> > >>
> > >> Now the question is if then why not just do:
> > >>
> > >> 	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && (vm_flags & VM_HUGEPAGE)) {
> > >> 		if (mapping_large_folio_support(mapping)) {
> > >> 			force_thp_readahead = true;
> > >> 			thp_order = min_t(unsigned int,
> > >> 					  mapping_max_folio_order(mapping),
> > >> 					  get_order(SZ_2M));
> > >> 		}
> > >> 	}
> > >>
> > >>
> > >> This is because this will regress the 16K ARM case where we already got 32M
> > >> folios. Someone might upgrade the kernel and start getting 2M folios now.
> > > 
> > > So maybe limit to 32MB? It's still arbitrary but at least you get simpler
> > > logic. If the architecture does not support 32MiB folios, it will clamp
> > > the maximum folio order to HPAGE_PMD_ORDER, and you get the same result.
> > > 
> > > Does this sound correct?
> > > 
> > 
> > Yes, so if we replace it with SZ_32M, it sounds correct. I just think
> > the 32M size is too large. But as you pointed out, even 2M can be too large...
> 
> So AFAIU the practical discussion is about two options:
> 
> 1) limiting at 2MB with a slighly more complicated logic to keep mapping at
> PMD order for 16k pagesize on ARM but use 2MB pages for 64k pagesize on ARM
> 
> or
> 
> 2) limit at 32MB with simple logic which results in larger (32MB) folios
> with 16k and 64k pagesize on ARM and thus larger memory overhead.
> 
> I'd like to maybe offer option 3): limit at 2MB with simple logic. This
> will reduce folio size on 16k pagesize ARM compared to 1) but do we really
> care? I.e., is there big enough practical performance impact with conpte
> and other tricks ARM is playing?
> 

arm64 16K contpte tops out at 256KB TLB entries. It's quite a lot smaller than
a PMD entry. Also, something that was discussed at LSFMM was its effectiveness.
Apparently, most of the gains seem to sit on actually having a larger page size
(perhaps Dev/Ryan can comment; sadly the slides were not posted anywhere on
the ML, so I don't have numbers).

To me, the question is quite clear: do we trust users that say "please give me
hugepages" enough to unconditionally give them hugepages? I would assume the
answer lies somewhere between "yes" and "no", but 32MB I would say is not
particularly excessive. 512MB is... much worse.

-- 
Pedro

