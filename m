Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C7CC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejjj/UktNvHuL6ZfBgZGy2xOjH4lWFO1beWpbKfBw+Y=; b=ZEr6PBfM+9Uz6CRLjc7Th2Q1Lu
	5Sr8lCrVlzaGWSnpEkSpIb5HPbfCO04xjn7WDaG3GkBZcWZhLsX+1UUgf4DwUYkGLBd6vyDph3Efw
	zCri7GoEkO31ljDelxs1DDsJQXc9Y7cFm8moFBh8i5tSRVdPseUX4B/+QbARUNNvPUocZD0GwSFhk
	pUrQlAFifu8twIKejV8EI6WOVayNbV1avGcayRz1JOlNRkbp6oVKa2s1GUyqvStvzDpB/F/7CSgOd
	1zyupNRYItLPBUEjfGOTD+y0t14FsCQ+SrITk+WnGoHrMl84yhCNi3ReEHhu9/MvZD8axR+xjtwwZ
	XczLIpjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3byh-00000007GeZ-0aJh;
	Mon, 07 Sep 2026 16:13:51 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3byd-00000007Gdx-2Dqv;
	Mon, 07 Sep 2026 16:13:49 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E5479219FA;
	Mon,  7 Sep 2026 16:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788797620;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ejjj/UktNvHuL6ZfBgZGy2xOjH4lWFO1beWpbKfBw+Y=;
	b=oeIFSP/L7324gUSNEaYyp0KvjIp3oQI6RVhqgp2FBq0m49WuGeoy1zRIO/5nqzENHG+mG1
	3I9/e7RZBR0bX//gSSRRZHy+4nCa7HrY3t7N7iU9SeMYCFVC4sJVwNbKr6WTuh4G4x2/+I
	ipZtHvSR+tcSiBKdXZn97W8WWTtz+R4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788797620;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ejjj/UktNvHuL6ZfBgZGy2xOjH4lWFO1beWpbKfBw+Y=;
	b=kNANdT9iEIOsfAslKtmL2Q5eOUtU61PuGxDvBbGP3Xy3WUe1CHTjmKw4dOQMHg++xKpkoX
	9F2kXR1wCo97u3Cg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788797615;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ejjj/UktNvHuL6ZfBgZGy2xOjH4lWFO1beWpbKfBw+Y=;
	b=u1sO1jKj1FfYIzynI5bvYBkCHyro3DcF4Brevq/t09F8gGP51aD7yvK3titlL8rwhbmuiI
	A0j0RJcHyqXxzT+B+py3ObaISB8tPQomVAWwRDRUUVudapBz87sohNNZQXmmpCnItWecYc
	8hlFuJ4UpElNyrD13S3AkRRWDsvjQiE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788797615;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ejjj/UktNvHuL6ZfBgZGy2xOjH4lWFO1beWpbKfBw+Y=;
	b=rRrXf8R3i97G0BUMSmSQiLikYTVEvTzIi0tEO54jMomkUPIdivwrpoQwYF7THAPUBMtj1H
	tYUuuZzTr7cEy7Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A6F71339B;
	Mon,  7 Sep 2026 16:13:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id q4uAJa/inmqFDgAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Mon, 07 Sep 2026 16:13:35 +0000
Date: Mon, 7 Sep 2026 18:13:30 +0200
From: David Sterba <dsterba@suse.cz>
To: Song Chen <chensong_2000@126.com>
Cc: arnd@arndb.de, kees@kernel.org, clm@fb.com, dsterba@suse.com,
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	guoren@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, gor@linux.ibm.com, borntraeger@linux.ibm.com,
	agordeev@linux.ibm.com, svens@linux.ibm.com, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, jpoimboe@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/3] btrfs: add error injection support for
 checksum verification
Message-ID: <20260907161330.GX9053@suse.cz>
References: <20260724021229.47302-1-chensong_2000@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724021229.47302-1-chensong_2000@126.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spamd-Result: default: False [-2.50 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[37];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLq7rgjtkhinpjg5fumb6k6gau)];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[126.com];
	FREEMAIL_ENVRCPT(0.00)[126.com,gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,fb.com,suse.com,armlinux.org.uk,arm.com,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,suse.cz:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_091347_754055_8079ABD0 
X-CRM114-Status: GOOD (  19.28  )
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
Reply-To: dsterba@suse.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Jul 24, 2026 at 10:12:26AM +0800, Song Chen wrote:
> This patchset adds fault injection support for btrfs_data_csum_ok,
> enabling controlled simulation of checksum mismatches to test btrfs
> silent data corruption detection and reporting paths.
> 
> The first patch extends the error injection framework with a new type,
> EI_ETYPE_FALSE, which allows bool-returning functions to be overridden
> with a false return value directly.
> 
> The second patch marks btrfs_data_csum_ok with ALLOW_ERROR_INJECTION
> using this new type.
> 
> The third patch adds a parent field to fei_attr to allow fault injection
> on a function only when called from a specific parent function. 
> 
> Song Chen (3):
>   error-injection: Introduce EI_ETYPE_FALSE for fail_function
>   btrfs: Allow error injection on btrfs_data_csum_ok
>   error-injection: Introduce parent in fei_attr

I'm going through my mailbox and found this. No objections to add the
injection point to btrfs, but the rest is generic fault injection code
so I can't take it via btrfs tree without acks.

There are some sashiko comments (as replies in the thread [1]) and there
have been some changes to btrfs code too so the patchset needs a
refresh.

I see maintainers in CC, if somebody could please let us know how to
proceed.

[1] https://lore.kernel.org/all/20260724021229.47302-1-chensong_2000@126.com/

>  arch/arm/lib/error-inject.c           |  6 ++
>  arch/arm64/lib/error-inject.c         |  6 ++
>  arch/csky/lib/error-inject.c          |  6 ++
>  arch/loongarch/lib/error-inject.c     |  6 ++
>  arch/powerpc/lib/error-inject.c       |  6 ++
>  arch/riscv/lib/error-inject.c         |  6 ++
>  arch/s390/lib/error-inject.c          |  6 ++
>  arch/x86/lib/error-inject.c           |  6 ++
>  fs/btrfs/inode.c                      |  1 +
>  include/asm-generic/error-injection.h |  6 ++
>  kernel/fail_function.c                | 98 ++++++++++++++++++++++++++-
>  11 files changed, 152 insertions(+), 1 deletion(-)

