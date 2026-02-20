Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D497C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 13:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+zHk49QRpaemzTykSCmPBW0EJr/6JSBQQF1JLI85QQ=; b=1pomepKFx/Zt3BD3yc/UzGh7X2
	BhtWB3IkezI2NNVPrpKnmvoLiIQE2tnueGYe1lOB75Jk7+ddkQd7DdfHycfv1DI8i6A2iFvl0trWE
	j+ZW4cCneqiSeetNvH6yT7LnlvLR89quDua/bzWZvn/b77qMrKdAPKQqJQlG0WFAklXmC/8AQYZkc
	ZtX1jw5bDv8AYlY9ByTXVr8gOKYyQPxhHp8LwuhijRpCiXUnaJ0HymF1C3/S3o73/v/uEI7oiuyvD
	aBZ68LrU7xzIYmPUZQvH9AMlkJCQm5b+DxMgejYmMbZQQQFDsOs1AyvX5xYzahOX4LNiID3Uq5TYf
	mLDXbjRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQhr-0000000EYYl-1ZVx;
	Fri, 20 Feb 2026 13:38:07 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQho-0000000EYYD-2peE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 13:38:06 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2E07E3E6F4;
	Fri, 20 Feb 2026 13:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771594681; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+zHk49QRpaemzTykSCmPBW0EJr/6JSBQQF1JLI85QQ=;
	b=bebBlfnyt3CpkfFyphEaoYIFLBwm8Z7WeNEpRosnT9XQZZHF4dIeapFcryfea6N/LpIGeK
	f+lacNf2HVovA652mlUoyFMp7O3g8qUf88Wb6vvRKyOLegF8O9nW++ddShuCGj8nzoFjI/
	tWKnFxLUpvBvLwEe4Ot1IkRdPaI5e/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771594681;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+zHk49QRpaemzTykSCmPBW0EJr/6JSBQQF1JLI85QQ=;
	b=oehI10I4eziQ7+nz5CKZjR+/4s1wYN6FgZIHdhtYXCKOw5guMgxV/8y6CJ+faNCCbD0w2x
	IshZP26M9qIjvkCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bebBlfny;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oehI10I4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771594681; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+zHk49QRpaemzTykSCmPBW0EJr/6JSBQQF1JLI85QQ=;
	b=bebBlfnyt3CpkfFyphEaoYIFLBwm8Z7WeNEpRosnT9XQZZHF4dIeapFcryfea6N/LpIGeK
	f+lacNf2HVovA652mlUoyFMp7O3g8qUf88Wb6vvRKyOLegF8O9nW++ddShuCGj8nzoFjI/
	tWKnFxLUpvBvLwEe4Ot1IkRdPaI5e/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771594681;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+zHk49QRpaemzTykSCmPBW0EJr/6JSBQQF1JLI85QQ=;
	b=oehI10I4eziQ7+nz5CKZjR+/4s1wYN6FgZIHdhtYXCKOw5guMgxV/8y6CJ+faNCCbD0w2x
	IshZP26M9qIjvkCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DC2833EA65;
	Fri, 20 Feb 2026 13:37:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +EZsMrdjmGkkawAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Fri, 20 Feb 2026 13:37:59 +0000
Date: Fri, 20 Feb 2026 13:37:58 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: Dev Jain <dev.jain@arm.com>
Cc: lsf-pc@lists.linux-foundation.org, ryan.roberts@arm.com, 
	catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org, willy@infradead.org, 
	hughd@google.com, baolin.wang@linux.alibaba.com, akpm@linux-foundation.org, 
	david@kernel.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, 
	vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [LSF/MM/BPF TOPIC] Per-process page size
Message-ID: <yfe2xbb6qwthg3cf4yr7zszpw5o3mx2v4bv32iwnm7yzxqjsvl@et22s2nuwzzk>
References: <20260217145026.3880286-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260217145026.3880286-1-dev.jain@arm.com>
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 2E07E3E6F4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_053804_886366_E9B4D183 
X-CRM114-Status: GOOD (  44.80  )
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

On Tue, Feb 17, 2026 at 08:20:26PM +0530, Dev Jain wrote:
> Hi everyone,
> 
> We propose per-process page size on arm64. Although the proposal is for
> arm64, perhaps the concept can be extended to other arches, thus the
> generic topic name.
> 
> -------------
> INTRODUCTION
> -------------
> While mTHP has brought the performance of many workloads running on an arm64 4K
> kernel closer to that of the performance on an arm64 64K kernel, a performance
> gap still remains. This is attributed to a combination of greater number of
> pgtable levels, less reach within the walk cache and higher data cache footprint
> for pgtable memory. At the same time, 64K is not suitable for general
> purpose environments due to it's significantly higher memory footprint.

Could this perhaps be because of larger-page-size kernels being able to use
mTHP (and THP) more aggressively? It would be interesting to compare arm64
"4K" vs "4K with mTHP" vs "4K with _only_ mTHP" vs "64K" vs "64K with mTHP".

> 
> To solve this, we have been experimenting with a concept called "per-process
> page size". This breaks the historic assumption of a single page size for the
> entire system: a process will now operate on a page size ABI that is greater
> than or equal to the kernel's page size. This is enabled by a key architectural
> feature on Arm: the separation of user and kernel page tables.
> 
> This can also lead to a future of a single kernel image instead of 4K, 16K
> and 64K images.
> 
> --------------
> CURRENT DESIGN
> --------------
> The design is based on one core idea; most of the kernel continues to believe
> there is only one page size in use across the whole system. That page size is
> the size selected at compile-time, as is done today. But every process (more
> accurately mm_struct) has a page size ABI which is one of the 3 page sizes
> (4K, 16K or 64K) as long as that page size is greater than or equal to the
> kernel page size (kernel page size is the macro PAGE_SIZE).
> 
> Pagesize selection
> ------------------
> A process' selected page size ABI comes into force at execve() time and
> remains fixed until the process exits or until the next execve(). Any forked
> processes inherit the page size of their parent.
> The personality() mechanism already exists for similar cases, so we propose
> to extend it to enable specifying the required page size.
> 
> There are 3 layers to the design. The first two are not arch-dependent,
> and makes Linux support a per-process pagesize ABI. The last layer is
> arch-specific.
> 
> 1. ABI adapter
> --------------
> A translation layer is added at the syscall boundary to convert between the
> process page size and the kernel page size. This effectively means enforcing
> alignment requirements for addresses passed to syscalls and ensuring that
> quantities passed as “number of pages” are interpreted relative to the process
> page size and not the kernel page size. In this way the process has the illusion
> that it is working in units of its page size, but the kernel is working in
> units of the kernel page size.
> 
> 2. Generic Linux MM enlightenment
> ---------------------------------
> We enlighten the Linux MM code to always hand out memory in the granularity
> of process pages. Most of this work is greatly simplified because of the
> existing mTHP allocation paths, and the ongoing support for large folios
> across different areas of the kernel. The process order will be used as the
> hard minimum mTHP order to allocate.
> 
> File memory
> -----------
> For a growing list of compliant file systems, large folios can already be
> stored in the page cache. There is even a mechanism, introduced to support
> filesystems with block sizes larger than the system page size, to set a
> hard-minimum size for folios on a per-address-space basis. This mechanism
> will be reused and extended to service the per-process page size requirements.
> 
> One key reason that the 64K kernel currently consumes considerably more memory
> than the 4K kernel is that Linux systems often have lots of small
> configuration files which each require a page in the page cache. But these
> small files are (likely) only used by certain processes. So, we prefer to
> continue to cache those using a 4K page.
> Therefore, if a process with a larger page size maps a file whose pagecache
> contains smaller folios, we drop them and re-read the range with a folio
> order at least that of the process order.
> 
> 3. Translation from Linux pagetable to native pagetable
> -------------------------------------------------------
> Assume the case of a kernel pagesize of 4K and app pagesize of 64K.
> Now that enlightenment is done, it is guaranteed that every single mapping
> in the 4K pagetable (which we call the Linux pagetable) is of granularity
> at least 64K. In the arm64 MM code, we maintain a "native" pagetable per
> mm_struct, which is based off a 64K geometry. Because of the guarantee
> aforementioned, any pagetable operation on the Linux pagetable
> (set_ptes, clear_flush_ptes, modify_prot_start_ptes, etc) is going to happen
> at a granularity of at least 16 PTEs - therefore we can translate this
> operation to modify a single PTE entry in the native pagetable.
> Given that enlightenment may miss corner cases, we insert a warning in the
> architecture code - on being presented with an operation not translatable
> into a native operation, we fallback to the Linux pagetable, thus losing
> the benefits borne out of the pagetable geometry but keeping
> the emulation intact.

I don't understand. What exactly are you trying to do here? Maintain 2
different paging structures, one for core mm and the other for the arch? As
done in architectures with no radix tree paging structures?

If so, that's wildly inefficient, unless you're willing to go into reclaimable
page tables on the arm64 side. And that brings extra problems and extra fun :)

-- 
Pedro

