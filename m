Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470CEF588CB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c3G7vl254hKLWmCISgkXy81NC1sunGjVh1MU4tFAFiY=; b=wMfKRtTy+Jl91yikvPlUuXYGpv
	DXIHAmRT3i6Hb8T03c/TvRn8Tn21QpSR9rPwbyurzpd2eag9SnogpjaGouGM8EDqLosBBZXbUJC2O
	kxED3yFWDWepsJpD88FEMPu0TI2d5wZtLa1iddZBaynM9vxrcKPey+tbpFGQNNEc/hYghCVf0+V9v
	6opjx979qg/0l86CLf3v0XTy382Oeb+uPp+ici7MAhygFNYzcUNHz92Fz4nZ72wRik/1gpSyk1q8Y
	RTHxe8TmF8636Trrtr4ytJCJlQ5Y5rCQcH7nzZsMIOnJlhQ67R9BGu1Ydmv1+1rXQ3i5B0RJ4zCkv
	Pn5s+R2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEozi-000000075cN-1trb;
	Mon, 20 Apr 2026 13:48:58 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEozf-000000075c0-3sdf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 13:48:57 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 883D25BCD1;
	Mon, 20 Apr 2026 13:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776692932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c3G7vl254hKLWmCISgkXy81NC1sunGjVh1MU4tFAFiY=;
	b=lLOw1NFeI/E4bVnzlRZvuI38z+UOWMiJ6WCTcpZ7bGOxdHC30NjLoPiW+EgsgZl/Pzst6V
	qqY5/ua481n4ZfLe9BpQM7lLgTHMduMezIRA5R/zGegZWQ2wkp2XrVz3v9snvhnbPIKdkH
	AZMDGB1IyMTJ/tZtJPo/Maum0DoAIeU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776692932;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c3G7vl254hKLWmCISgkXy81NC1sunGjVh1MU4tFAFiY=;
	b=pS3fKW/BmxFU27m5F7wLrXMPhRUqPkVS5iBg7mv0bFsGeCijAraUqYAcOgioByN5iNlbUq
	OJM/4gggnCadI6AA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lLOw1NFe;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="pS3fKW/B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776692932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c3G7vl254hKLWmCISgkXy81NC1sunGjVh1MU4tFAFiY=;
	b=lLOw1NFeI/E4bVnzlRZvuI38z+UOWMiJ6WCTcpZ7bGOxdHC30NjLoPiW+EgsgZl/Pzst6V
	qqY5/ua481n4ZfLe9BpQM7lLgTHMduMezIRA5R/zGegZWQ2wkp2XrVz3v9snvhnbPIKdkH
	AZMDGB1IyMTJ/tZtJPo/Maum0DoAIeU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776692932;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c3G7vl254hKLWmCISgkXy81NC1sunGjVh1MU4tFAFiY=;
	b=pS3fKW/BmxFU27m5F7wLrXMPhRUqPkVS5iBg7mv0bFsGeCijAraUqYAcOgioByN5iNlbUq
	OJM/4gggnCadI6AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 61675593AE;
	Mon, 20 Apr 2026 13:48:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id c5N1FMMu5mnXQwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 20 Apr 2026 13:48:51 +0000
Date: Mon, 20 Apr 2026 14:48:49 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Huang Shijie <huangsj@hygon.cn>
Cc: Mateusz Guzik <mjguzik@gmail.com>, akpm@linux-foundation.org, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, muchun.song@linux.dev, osalvador@suse.de, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-parisc@vger.kernel.org, 
	nvdimm@lists.linux.dev, zhongyuan@hygon.cn, fangbaoshun@hygon.cn, yingzhiwei@hygon.cn
Subject: Re: [PATCH 0/3] mm: split the file's i_mmap tree for NUMA
Message-ID: <hshxzebq5y4gavo7mbrgn7qitz5j5wyun73wy7ooiiehzzpcui@hlknbp34sgja>
References: <20260413062042.804-1-huangsj@hygon.cn>
 <76pfiwabdgsej6q2yxfh3efuqvsyg7mt7rvl5itzzjyhdrto5r@53viaxsackzv>
 <aeWLCxru6cLWsxvQ@SH-HV00110.Hygon.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeWLCxru6cLWsxvQ@SH-HV00110.Hygon.cn>
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux-foundation.org,zeniv.linux.org.uk,kernel.org,kvack.org,vger.kernel.org,lists.infradead.org,linux.dev,suse.de,lists.linux.dev,hygon.cn];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 883D25BCD1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_064856_162797_BC3DCACB 
X-CRM114-Status: GOOD (  39.78  )
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

BTW you're missing _a lot_ of CC's here, including the whole of mm/rmap.c
maintainership.

On Mon, Apr 20, 2026 at 10:10:19AM +0800, Huang Shijie wrote:
> On Mon, Apr 13, 2026 at 05:33:21PM +0200, Mateusz Guzik wrote:
> > On Mon, Apr 13, 2026 at 02:20:39PM +0800, Huang Shijie wrote:
> > >   In NUMA, there are maybe many NUMA nodes and many CPUs.
> > > For example, a Hygon's server has 12 NUMA nodes, and 384 CPUs.
> > > In the UnixBench tests, there is a test "execl" which tests
> > > the execve system call.
> > > 
> > >   When we test our server with "./Run -c 384 execl",
> > > the test result is not good enough. The i_mmap locks contended heavily on
> > > "libc.so" and "ld.so". For example, the i_mmap tree for "libc.so" can have 
> > > over 6000 VMAs, all the VMAs can be in different NUMA mode.
> > > The insert/remove operations do not run quickly enough.
> > > 
> > > patch 1 & patch 2 are try to hide the direct access of i_mmap.
> > > patch 3 splits the i_mmap into sibling trees, and we can get better 
> > > performance with this patch set:
> > >     we can get 77% performance improvement(10 times average)
> > > 
> > 
> > To my reading you kept the lock as-is and only distributed the protected
> > state.
> > 
> > While I don't doubt the improvement, I'm confident should you take a
> > look at the profile you are going to find this still does not scale with
> > rwsem being one of the problems (there are other global locks, some of
> > which have experimental patches for).
> > 
> > Apart from that this does nothing to help high core systems which are
> > all one node, which imo puts another question mark on this specific
> > proposal.
> > 
> > Of course one may question whether a RB tree is the right choice here,
> > it may be the lock-protected cost can go way down with merely a better
> > data structure.
> > 
> > Regardless of that, for actual scalability, there will be no way around
> > decentralazing locking around this and partitioning per some core count
> > (not just by numa awareness).
> > 
> > Decentralizing locking is definitely possible, but I have not looked
> > into specifics of how problematic it is. Best case scenario it will
> > merely with separate locks. Worst case scenario something needs a fully
> > stabilized state for traversal, in that case another rw lock can be
> > slapped around this, creating locking order read lock -> per-subset
> > write lock -- this will suffer scalability due to the read locking, but
> > it will still scale drastically better as apart from that there will be
> > no serialization. In this setting the problematic consumer will write
> > lock the new thing to stabilize the state.
> > 
> I thought over again.
> I can change this patch set to support the non-NUMA case by:
>   1.) Still use one rw lock.

No. This doesn't help anything.

>   2.) For NUMA, keep the patch set as it is.

Please no. No NUMA vs non-NUMA case.

>   3.) For non-NUMA case, split the i_mmap tree to several subtrees.
>       For example, if a machine has 192 CPUs, split the 32 CPUs as a tree.

If lock contention is the problem, I don't see how splitting the tree helps,
unless it helps reduce lock hold time in a way that randomly helps your workload.
But that's entirely random.

> 
> So extend the patch set to support both the NUMA and non-NUMA machines.

FYI I've discussed some concrete ideas for reworking file rmap with Mateusz.
I'll be giving them a shot. Note that this needs to be done _carefully_,
particularly as there are some hidden assumptions wrt forking that aren't
very clear as to how they work[1].

[1] https://lore.kernel.org/all/bnukmnuxxuhdfeasjz33miemgr7w35c4aa6pqdmgupx7oxmeeb@gozgc3yxhcdd/
-- 
Pedro

