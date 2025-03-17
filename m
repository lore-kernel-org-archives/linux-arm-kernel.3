Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6319DC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 13:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXVXYrKcw75VaVyW6xiQ1XmUEA3pjJuZesMTcpr9rww=; b=bDKuB3qLSp7Xjeje74VAxZmra2
	9UcTc6tjk1rfEdYpOM1E7FRgZK4e+2RewqNz8XFc3k4aL6Yr/QbwXjI1ahLe6eEWL8gbHRYHtEOHP
	+dUVZPaxesQv5LBAslj5bIC1WyLrrCCZdCGPpJ45bllU8AQOrP9gfwFDC2+0OHt2HuJe/0ml0ILgV
	ZeGT80PHetDL4/o7GfkcGNjPPUJdIp9PM/TqDWW3/S1NXVoEWouoJIFY5I/oH3LuLZ5T+6jFOhKm3
	GL+snQzuLIUfabRl3gWtqw3cNYv65u7JWhJhCkBf1MsxdpOUs91q+hW0MBhs10LZAr/Iz9Te9nIgD
	3dn6OeKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuADc-00000002gUf-1UnL;
	Mon, 17 Mar 2025 13:09:24 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuABf-00000002g5O-2Eu9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 13:07:24 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4C58421BFD;
	Mon, 17 Mar 2025 13:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742216840; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wXVXYrKcw75VaVyW6xiQ1XmUEA3pjJuZesMTcpr9rww=;
	b=aymI4rjEu3+nyRw0beZ1bFpJRmJaQS4GQXQ3EPzIDqGhzLpfTgDf3aCHSd/44MI36rZtMy
	T6jGhqeQg1k7bfh+/lac+3fgWFKGsTTQXFSrY4MH7WO/JvXf/O/yAQU58SDkCIhKOkiXBw
	l8NZtZwN+I3pGFUM9499NfJQ+tXP9rg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742216840;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wXVXYrKcw75VaVyW6xiQ1XmUEA3pjJuZesMTcpr9rww=;
	b=Elm4+EKoFdGcV0RQQb+KJqh6pX+QUsvYagvqOK9wjZYibOyahb4FzgdlExVwI4AfaB2wKA
	VtKMy9hq4iUuqZBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1ph23rw9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lyvw16is
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742216839; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wXVXYrKcw75VaVyW6xiQ1XmUEA3pjJuZesMTcpr9rww=;
	b=1ph23rw9GLfhlqnKiCJHfeHKxX6n/zT2ZxQIu/lkktJ8Vpag7s91+UevBrvoVOHhxAobaG
	sUARymTKGZj8Lx+EBDoz6POfmD3N3l3pP+3rD91Vik4vSlU8W/7/2HrwiHf2C30uB6iyxo
	WSJcd6rpyTQ1VAoG8QAooM54k+b0yB0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742216839;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wXVXYrKcw75VaVyW6xiQ1XmUEA3pjJuZesMTcpr9rww=;
	b=lyvw16iswgg2RubQR4i0BrLVvr2zvTbD+NhrXCGQCXVFyVx31fJbQ4CfXKdBZndvCjNhwt
	tdQEcv7VVXk8XYCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2929D139D2;
	Mon, 17 Mar 2025 13:07:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G4IECoce2GfCUwAAD6G6ig
	(envelope-from <iivanov@suse.de>); Mon, 17 Mar 2025 13:07:19 +0000
Date: Mon, 17 Mar 2025 15:07:18 +0200
From: "Ivan T. Ivanov" <iivanov@suse.de>
To: Piotr Jaroszynski <pjaroszynski@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>,
	Alistair Popple <apopple@nvidia.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	SeongJae Park <sj@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>, iommu@lists.linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] [arm64/tlb] Fix mmu notifiers for range-based invalidates
Message-ID: <20250317130718.a5wals252gymjlsk@localhost.localdomain>
References: <20250304085127.2238030-1-pjaroszynski@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304085127.2238030-1-pjaroszynski@nvidia.com>
X-Rspamd-Queue-Id: 4C58421BFD
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,localhost.localdomain:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_060723_719295_5CE8C50E 
X-CRM114-Status: GOOD (  13.86  )
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

Hi,

On 03-04 00:51, Piotr Jaroszynski wrote:
> 
> Update the __flush_tlb_range_op macro not to modify its parameters as
> these are unexepcted semantics. In practice, this fixes the call to
> mmu_notifier_arch_invalidate_secondary_tlbs() in
> __flush_tlb_range_nosync() to use the correct range instead of an empty
> range with start=end. The empty range was (un)lucky as it results in
> taking the invalidate-all path that doesn't cause correctness issues,
> but can certainly result in suboptimal perf.
> 
> This has been broken since commit 6bbd42e2df8f ("mmu_notifiers: call
> invalidate_range() when invalidating TLBs") when the call to the
> notifiers was added to __flush_tlb_range(). It predates the addition of
> the __flush_tlb_range_op() macro from commit 360839027a6e ("arm64: tlb:
> Refactor the core flush algorithm of __flush_tlb_range") that made the
> bug hard to spot.
> 
> Fixes: 6bbd42e2df8f ("mmu_notifiers: call invalidate_range() when invalidating TLBs")

I think that strictly speaking this should be:

Fixes: 360839027a6e ("arm64: tlb: Refactor the core flush algorithm of __flush_tlb_range")

Regards,
Ivan


