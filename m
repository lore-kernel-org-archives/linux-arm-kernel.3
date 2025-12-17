Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04084D65559
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLu9GhT5PvVPx29sDrvUSaHgK97g2v19OQHYiqFZ81U=; b=OcxYNE0n5BpNUVCmyHBbXwo5KH
	BxDwZYNGvdVUiBBPbWzsAhbeMW/jGZtX+8ViBRzg8yvUdCNkk31N3P8IU1F0QrHQEr9zGpHj2jrfa
	ItmGvEEqwYTa016ZHXFAItSDF2uoDH9X4vdLFcVN4rA0Fpc7/prpMnFbxByJVNrwaga5pYlGKrRNB
	luQBgfXbJ2GhCwyDoC3tw2p1QSk55qbsBbSrxbKhD3a2JtD2bszfJxZBkT+bOw4sSEUSH+/EYDVyR
	cLe0hPhs8o6GvkSCzRd9TtYwUDJ3jMwN9ukEcnQh1D5QScK8MGrxOjyH9ouHMgVOrKn4oEIjYdswo
	5J9Quaog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrNd-00000006qBQ-3VtE;
	Wed, 17 Dec 2025 13:15:49 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrNa-00000006qAu-38Ah
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 13:15:48 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 71918336D4;
	Wed, 17 Dec 2025 13:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1765977343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DLu9GhT5PvVPx29sDrvUSaHgK97g2v19OQHYiqFZ81U=;
	b=GD9SeG1r6d1p/w0FZ7ZXI1TakOvU+F8ag417Nq3QS9RGm8plLS734WMJbVVkVO16VxGdcz
	G1NGdh0Tb/B3mMdYuR/wGVi6mjbUXK4kiV/+ho1aSGcGUFjfucP7HFwjVPJAsYAN5sUWYD
	zpmQQKKyCg8W7cA8L+BRtYs4yD3Xaw0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1765977343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DLu9GhT5PvVPx29sDrvUSaHgK97g2v19OQHYiqFZ81U=;
	b=+kQSWOa6FDCSrmWnyNe4rb/LXXcsZlMu8TxhWE4eSaSjPL+k0lmP28zfCt3JaSEXZ6iifY
	sg9Xt0QmNGhptYDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=GD9SeG1r;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=+kQSWOa6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1765977343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DLu9GhT5PvVPx29sDrvUSaHgK97g2v19OQHYiqFZ81U=;
	b=GD9SeG1r6d1p/w0FZ7ZXI1TakOvU+F8ag417Nq3QS9RGm8plLS734WMJbVVkVO16VxGdcz
	G1NGdh0Tb/B3mMdYuR/wGVi6mjbUXK4kiV/+ho1aSGcGUFjfucP7HFwjVPJAsYAN5sUWYD
	zpmQQKKyCg8W7cA8L+BRtYs4yD3Xaw0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1765977343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DLu9GhT5PvVPx29sDrvUSaHgK97g2v19OQHYiqFZ81U=;
	b=+kQSWOa6FDCSrmWnyNe4rb/LXXcsZlMu8TxhWE4eSaSjPL+k0lmP28zfCt3JaSEXZ6iifY
	sg9Xt0QmNGhptYDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B5F43EA63;
	Wed, 17 Dec 2025 13:15:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XpkMBf+sQmkURwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 17 Dec 2025 13:15:43 +0000
Message-ID: <d912480a-5229-4efe-9336-b31acded30f5@suse.cz>
Date: Wed, 17 Dec 2025 14:15:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] introduce pagetable_alloc_nolock()
Content-Language: en-US
To: Yeoreum Yun <yeoreum.yun@arm.com>, Ryan Roberts <ryan.roberts@arm.com>
Cc: akpm@linux-foundation.org, david@kernel.org, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, jackmanb@google.com,
 hannes@cmpxchg.org, ziy@nvidia.com, bigeasy@linutronix.de,
 clrkwllms@kernel.org, rostedt@goodmis.org, catalin.marinas@arm.com,
 will@kernel.org, kevin.brodsky@arm.com, dev.jain@arm.com,
 yang@os.amperecomputing.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20251212161832.2067134-1-yeoreum.yun@arm.com>
 <916c17ba-22b1-456e-a184-cb3f60249af7@arm.com>
 <aUGOPd7gNRf1xHEc@e129823.arm.com>
 <100cc8da-b826-4fc2-a624-746bf6fb049d@arm.com>
 <aUKKZR0u22KOPfd7@e129823.arm.com>
 <d96ac977-222e-4e8d-9487-da1306198419@arm.com>
 <aUKnfU/3FREY13g1@e129823.arm.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <aUKnfU/3FREY13g1@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 71918336D4
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,oracle.com,google.com,suse.com,iogearbox.net,linux.dev,gmail.com,fomichev.me,cmpxchg.org,nvidia.com,linutronix.de,goodmis.org,arm.com,os.amperecomputing.com,kvack.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	R_RATELIMIT(0.00)[to_ip_from(RLo39o19myzc71a6h1g6fiybuc)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_051547_090199_9ACEFB90 
X-CRM114-Status: GOOD (  27.28  )
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

On 12/17/25 13:52, Yeoreum Yun wrote:
>> On 17/12/2025 10:48, Yeoreum Yun wrote:
>> > Hi Ryan,
>> >
>> >> On 16/12/2025 16:52, Yeoreum Yun wrote:
>> >>> Hi Ryan,
>> >>>
>> >>>> On 12/12/2025 16:18, Yeoreum Yun wrote:
>> >>>>> Some architectures invoke pagetable_alloc() or __get_free_pages()
>> >>>>> with preemption disabled.
>> >>>>> For example, in arm64, linear_map_split_to_ptes() calls pagetable_alloc()
>> >>>>> while spliting block entry to ptes and __kpti_install_ng_mappings()
>> >>>>> calls __get_free_pages() to create kpti pagetable.
>> >>>>>
>> >>>>> Under PREEMPT_RT, calling pagetable_alloc() with
>> >>>>> preemption disabled is not allowed, because it may acquire
>> >>>>> a spin lock that becomes sleepable on RT, potentially
>> >>>>> causing a sleep during page allocation.
>> >>>>>
>> >>>>> Since above two functions is called as callback of stop_machine()
>> >>>>> where its callback is called in preemption disabled,
>> >>>>> They could make a potential problem. (sleeping in preemption disabled).
>> >>>>>
>> >>>>> To address this, introduce pagetable_alloc_nolock() API.
>> >>>>
>> >>>> I don't really understand what the problem is that you're trying to fix. As I
>> >>>> see it, there are 2 call sites in arm64 arch code that are calling into the page
>> >>>> allocator from stop_machine() - one via via pagetable_alloc() and another via
>> >>>> __get_free_pages(). But both of those calls are passing in GFP_ATOMIC. It was my
>> >>>> understanding that the page allocator would ensure it never sleeps when
>> >>>> GFP_ATOMIC is passed in, (even for PREEMPT_RT)?
>> >>>
>> >>> Although GFP_ATOMIC is specify, it only affects of "water mark" of the
>> >>> page with __GFP_HIGH. and to get a page, it must grab the lock --
>> >>> zone->lock or pcp_lock in the rmqueue().
>> >>>
>> >>> This zone->lock and pcp_lock is spin_lock and it's a sleepable in
>> >>> PREEMPT_RT that's why the memory allocation/free using general API
>> >>> except nolock() version couldn't be called since
>> >>> if "contention" happens they'll sleep while waiting to get the lock.
>> >>>
>> >>> The reason why "nolock()" can use, it always uses "trylock" with
>> >>> ALLOC_TRYLOCK flags. otherwise GFP_ATOMIC also can be sleepable in
>> >>> PREEMPT_RT.
>> >>>
>> >>>>
>> >>>> What is the actual symptom you are seeing?
>> >>>
>> >>> Since the place where called while smp_cpus_done() and there seems no
>> >>> contention, there seems no problem. However as I mention in another
>> >>> thread
>> >>> (https://lore.kernel.org/all/aT%2FdrjN1BkvyAGoi@e129823.arm.com/),
>> >>> This gives a the false impression --
>> >>> GFP_ATOMIC are “safe to use in preemption disabled”
>> >>> even though they are not in PREEMPT_RT case, I've changed it.
>> >>>
>> >>>>
>> >>>> If the page allocator is somehow ignoring the GFP_ATOMIC request for PREEMPT_RT,
>> >>>> then isn't that a bug in the page allocator? I'm not sure why you would change
>> >>>> the callsites? Can't you just change the page allocator based on GFP_ATOMIC?
>> >>>
>> >>> It doesn't ignore the GFP_ATOMIC feature:
>> >>>   - __GFP_HIGH: use water mark till min reserved
>> >>>   - __GFP_KSWAPD_RECLAIM: wake up kswapd if reclaim required.
>> >>>
>> >>> But, it's a restriction -- "page allocation / free" API cannot be called
>> >>> in preempt-disabled context at PREEMPT_RT.
>> >>>
>> >>> That's why I think it's wrong usage not a page allocator bug.
>> >>
>> >> I've taken a look at this and I agree with your analysis. Thanks for explaining.
>> >>
>> >> Looking at other stop_machine() callbacks, there are some that call printk() and
>> >> I would assume that spinlocks could be taken there which may present the same
>> >> kind of issue or PREEMPT_RT? (I'm guessing). I don't see any others that attempt
>> >> to allocate memory though.
>> >
>> > IIRC, there was a problem related for printk while try to grab
>> > pl011_console related lock (spin_lock) while holding
>> > console_lock(raw_spin_lock) in v6.10.0-rc7 at rpi5:
>> >
>> >     [  230.381263] CPU: 2 PID: 5574 Comm: syz.4.1695 Not tainted 6.10.0-rc7-01903-g52828ea60dfd #3
>> >     [  230.381479] Hardware name: linux,dummy-virt (DT)
>> >     [  230.381565] Call trace:
>> >     [  230.381607]  dump_backtrace+0x318/0x348
>> >     [  230.381727]  show_stack+0x4c/0x80
>> >     [  230.381875]  dump_stack_lvl+0x214/0x328
>> >     [  230.382159]  dump_stack+0x3c/0x58
>> >     [  230.382456]  __lock_acquire+0x4398/0x4720
>> >     [  230.382683]  lock_acquire+0x648/0xb70
>> >     [  230.382928]  _raw_spin_lock_irqsave+0x138/0x240
>> >     [  230.383121]  pl011_console_write+0x240/0x8a0
>> >     [  230.383356]  console_flush_all+0x708/0x1368
>> >     [  230.383571]  console_unlock+0x180/0x440
>> >     [  230.383742]  vprintk_emit+0x1f8/0x9d0
>> >     [  230.383832]  vprintk_default+0x64/0x90
>> >     [  230.383914]  vprintk+0x2d0/0x400
>> >     [  230.383971]  _printk+0xdc/0x128
>> >     [  230.384229]  hrtimer_interrupt+0x8f0/0x920
>> >     [  230.384414]  arch_timer_handler_virt+0xc0/0x100
>> >     [  230.384812]  handle_percpu_devid_irq+0x20c/0x4e0
>> >     [  230.385053]  generic_handle_domain_irq+0xc0/0x120
>> >     [  230.385367]  gic_handle_irq+0x88/0x360
>> >     [  230.385559]  call_on_irq_stack+0x24/0x70
>> >     [  230.385801]  do_interrupt_handler+0xf8/0x200
>> >     [  230.386092]  el1_interrupt+0x68/0xc0
>> >     [  230.386434]  el1h_64_irq_handler+0x18/0x28
>> >     [  230.386716]  el1h_64_irq+0x64/0x68
>> >     [  230.386853]  __sanitizer_cov_trace_const_cmp2+0x30/0x68
>> >     [  230.387026]  alloc_pages_mpol_noprof+0x170/0x698
>> >     [  230.387309]  vma_alloc_folio_noprof+0x128/0x2a8
>> >     [  230.387610]  vma_alloc_zeroed_movable_folio+0xa0/0xe0
>> >     [  230.387822]  folio_prealloc+0x5c/0x280
>> >     [  230.388008]  do_wp_page+0xc30/0x3bc0
>> >     [  230.388206]  __handle_mm_fault+0xdb8/0x2ba0
>> >     [  230.388448]  handle_mm_fault+0x194/0x8a8
>> >     [  230.388676]  do_page_fault+0x6bc/0x1030
>> >     [  230.388924]  do_mem_abort+0x8c/0x240
>> >     [  230.389056]  el0_da+0xf0/0x3f8
>> >     [  230.389178]  el0t_64_sync_handler+0xb4/0x130
>> >     [  230.389452]  el0t_64_sync+0x190/0x198
>> >
>> > But this problem is gone when I try with some of patches in rt-tree
>> > related for printk which are merged in current tree
>> > (https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/log/?h=linux-6.10.y-rt-rebase).
>> >
>> > So I think printk() wouldn't be a problem.
>> >
>> >>
>> >> Anyway, to fix the 2 arm64 callsites, I see 2 possible approaches:
>> >>
>> >> - Call the nolock variant (as you are doing). But that would just convert a
>> >> deadlock to a panic; if the lock is held when stop_machine() runs, without your
>> >> change, we now have a deadlock due to waiting on the lock inside stop_machine().
>> >> With your change, we notice the lock is already taken and panic. I guess it is
>> >> marginally better, but not by much. Certainly I would just _always_ call the
>> >> nolock variant regardless of PREEMPT_RT if we take this route; For !PREEMPT_RT,
>> >> the lock is guarranteed to be free so nolock will always succeed.
>> >>
>> >> - Preallocate the memory before entering stop_machine(). I think this would be
>> >> much more robust. For kpti_install_ng_mappings() I think you could hoist the
>> >> allocation/free out of stop_machine() and pass the pointer in pretty easily. For
>> >> linear_map_split_to_ptes() its a bit more complex; Perhaps, we need to walk the
>> >> pgtable to figure out how much to preallocate, allocate it, then set it up as a
>> >> special allocator, wrapped by an allocation function and modify the callchain to
>> >> take a callback function instead of gfp flags.
>> >>
>> >> What do you think?
>> >
>> > Definitely, second suggestoin is much better.
>> > My question is whether *memory contention* really happen in the point
>> > both functions are called.
>>
>> My guess would be that it's unlikely, but not impossible. The secondary CPUs are
>> up, and presumably running their idle thread. I think various power management
>> things can be plugged into the idle thread; if so, then I guess it's possible
>> that the CPU could be running some hook as part of a power state transition, and
>> that could be dynamically allocating memory? That's all just a guess though; I
>> don't know the details of that part of the system.
>>
>> >
>> > Above two functions are called as last step of "smp_init()" -- smp_cpus_done().
>> > If we can be sure, I think we don't need to go to complex way and
>> > I believe the reason why we couldn't find out this problem,
>> > even using GFP_ATOMIC in PREEMPT_RT since there was *no contection*
>> > in this time of both functions are called.
>> > > That's why I first try with the "simple way".
>> >
>> > What do you think?
>>
>> As far as linear_map_split_to_ptes() is concerned, it was implemented under the
>> impression that doing allocation with GFP_ATOMIC was safe, even in
>> stop_machine(). Given that's an incorrect assumption, I think we should fix it
>> to pre-allocate outside of stop_machine() regardless of the likelihood of
>> actually hitting the race.
>>
> 
> Yeap. It’s better to be certain than uncertain. Thanks for checking.
> I'll repsin with the preallocate way.

Note this is explained in Documentation/core-api/real-time/differences.rst:

Memory allocation
-----------------

The memory allocation APIs, such as kmalloc() and alloc_pages(), require a
gfp_t flag to indicate the allocation context. On non-PREEMPT_RT kernels, it is
necessary to use GFP_ATOMIC when allocating memory from interrupt context or
from sections where preemption is disabled. This is because the allocator must
not sleep in these contexts waiting for memory to become available.

However, this approach does not work on PREEMPT_RT kernels. The memory
allocator in PREEMPT_RT uses sleeping locks internally, which cannot be
acquired when preemption is disabled. Fortunately, this is generally not a
problem, because PREEMPT_RT moves most contexts that would traditionally run
with preemption or interrupts disabled into threaded context, where sleeping is
allowed.

What remains problematic is code that explicitly disables preemption or
interrupts. In such cases, memory allocation must be performed outside the
critical section.

This restriction also applies to memory deallocation routines such as kfree()
and free_pages(), which may also involve internal locking and must not be
called from non-preemptible contexts.


