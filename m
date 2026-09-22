Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAEAC98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 22:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/idt+sdxH5E3LRbrlK4aNJgvUW7z3jw27sNns8vVE/U=; b=EtMd7t0p7CEBwWKX5iwKWPX76D
	KfU3XkmUarda9ZqAmHEnvGRWvjL8ye6UU2s8/js6xlzPvqaNlbDyCwWa350FdXIoD6m05GwUqypua
	44IBFbQtsqB9Ypb0ujbl466GCbvoMEVayJ70nXhCS8sEnsUUjamXJPhtx1q7BnaoUlpTXP9KBZ3ui
	C0be3Z3j4DaDGqVmvcnA3ufm4vZZDvSTnf10ijjcW+9gxFeei4gr1BODeEqVEI+7NCHBRG0EU3n5S
	BYBXq3HrFZRKjpvLY7AFzHDYuGgkT3g6WbWddwQ0anlDdJb1vjJtHLwrJfzS4vmifOv4QLx6eTMPO
	Z630xUzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98ca-00000006ez9-1cG8;
	Tue, 22 Sep 2026 22:05:52 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98cX-00000006eyW-48hf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 22:05:51 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1C68C21DB8;
	Tue, 22 Sep 2026 22:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790114742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/idt+sdxH5E3LRbrlK4aNJgvUW7z3jw27sNns8vVE/U=;
	b=HgT3p/Q5sqm61XXBpEUIgzzB7Ls/zQyb5MZzk24R0tXGY7WjBkvGSq75TjW6sUUDkNDcdK
	PaUN25psfhIuXOh36xvLrn6z3i8vdBUGQUCATIlQUpbyK+8LpvWsvI2ew8CGYOAqKFQ3AS
	n1eIzUhY7LKB/sX7GfExaqpz5NzSPow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790114742;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/idt+sdxH5E3LRbrlK4aNJgvUW7z3jw27sNns8vVE/U=;
	b=/jO71TvPWzmtdAT/UkMKZV0GrG3c9HZgCHe/zEOPcNgUIe8bT1NV0hfCB4YaCtG3HCbYHy
	pN3xLd8QC0ga0MCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790114738; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/idt+sdxH5E3LRbrlK4aNJgvUW7z3jw27sNns8vVE/U=;
	b=quCjMDIbpkNxr60txU8UnKbZsy/fG9P2YANt1iziCXL5FS5k6o4Cc/MabAfPuIjGNUego8
	b0HDvxEBONkrkpotZ8iq+usyuoohMW6dYo6+vh5bQq1OyHWaCU5b3wzjoudTJdx/0qSjkt
	0gd6XMMhXysYwn2qMsbAIJOlSKQ+q/8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790114738;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/idt+sdxH5E3LRbrlK4aNJgvUW7z3jw27sNns8vVE/U=;
	b=9pk6tom4Muc/Koaljtd1EOywH7TPs3I1JanAL5Z6PVIuSV3CwdiVj/v6Y7BiYRtZ3l6AH2
	iGd2dLUEKE6Y97CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F256132D3;
	Tue, 22 Sep 2026 22:05:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9zMiDrH7smp9HQAAD6G6ig
	(envelope-from <krisman@suse.de>); Tue, 22 Sep 2026 22:05:37 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 tglx@kernel.org, mingo@redhat.com, peterz@infradead.org
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for
 blocking inline issue
In-Reply-To: <54310fb2-d4b0-4b97-bc07-68e27e462b29@kernel.dk>
Organization: SUSE
References: <20260911154148.644489-1-axboe@kernel.dk>
 <87tsnv1ynh.fsf@mailhost.krisman.be>
 <54310fb2-d4b0-4b97-bc07-68e27e462b29@kernel.dk>
Date: Tue, 22 Sep 2026 18:05:35 -0400
Message-ID: <871pal0wnk.fsf@mailhost.krisman.be>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_150550_177112_278C0F4C 
X-CRM114-Status: GOOD (  15.48  )
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

Jens Axboe <axboe@kernel.dk> writes:

> On 9/11/26 11:33 AM, Gabriel Krisman Bertazi wrote:
>> It has the downside of still requiring fixes to every path and we need
>> to handle every new case that comes by, but it is much cleaner than
>> plumbing a nonblock flag several layers down the stack across each
>> subsystem or having subsystem-specific details in io_uring, which is
>> what we have today.  On the upper side, it is much less complex than
>> your approach. It also allow us to just back off during memory
>> allocations that would block, solving the memory allocations anywhere in
>> the submission path, not only inside ->issue(), which we discussed
>> recently on discord.
>
> I think you'll find it'll be a lot MORE complicated than my approach!
> Backing out error handling is going to be impossible in some cases,
> think file systems for example. How would those cases be handled?

I understand there are many cases where it would be impossible, most, if
not all of them, involving FS.  But I naively imagine we could back-off
those early, before we get to the critical session, without even trying
the nonblock approach, similar to what we do now, and punt to the io-wq,
which is not going away anyway.  What I'd like to solve is drop the
logic of other parts of the kernel that we need to keep in the io_uring
layer, such as which network protocols will block and which won't.

It is a hard sell, yes. And it does gives off vibes of re-editing the
PF_MEMALLOC_NORECLAIM controversy. Long term, though, it would be much
better for the kernel that can reliably handle failure and back-off than
keep going, including for predictable performance.

-- 
Gabriel Krisman Bertazi

