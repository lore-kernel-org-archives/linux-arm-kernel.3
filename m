Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C92EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 08:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPDedMYoIPcbcGvrvY5H+IQoUl1T+mrUVDSGwBtiCbg=; b=FFdykXdHpmcNpTd83J6bufbeOC
	O30KNwFcKVBlsyTauSzyl6moNH2ia5tpIyrs/1Y84ibxbHhlr7t5Nx8O0iIPDg5ykfa95N3GuU7Xw
	Ywi7iHoJhgG81Q4rqKlEQcrBDt0RHTX5REuT8Q6p40wfitHrIA2HsqABCGVkTV+0QY4HiAdALkyK+
	PagVIdM+Xr6YLZI0SkqzJ6Kvy8rQBfODahPVRvJl2LjGk8YU4IEl4pdwfcgSvJiCYyTj9GrUhCjl0
	4B1zMTYaGEKy5JtEOBMTYrqhcrbPGx/LKyUPNUtSvximhYoAcoO3BGhRiBKCCmLFORMfEbhsqgiyj
	B2z1XrGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYmX-0000000BLk7-2bLf;
	Tue, 14 Jul 2026 08:46:25 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYmV-0000000BLim-0y8p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 08:46:24 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5EE133E28;
	Tue, 14 Jul 2026 08:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784018779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WPDedMYoIPcbcGvrvY5H+IQoUl1T+mrUVDSGwBtiCbg=;
	b=DMLbNoNjgWmDIdKbEiPtdPrkH+ld3RlsqcX64XXxxm2RRfUg8MvGJZ92ZgBD27P28wzVAA
	WRSveFEoJOgqWKyZQ6GSxKCLZHtGdMqV1GrwiawGsxptpJoltg8OJztjLYy2/lMw2iBI/P
	fAX3DThYJFKoqdOXrOHqge89JD7L96I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784018779;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WPDedMYoIPcbcGvrvY5H+IQoUl1T+mrUVDSGwBtiCbg=;
	b=lyVlUAK45w4IS5EBJhNIkm2IZu+OwsxYgYOU3pgx6TZtANaLf1fDpxr7lpSfW0kNN+MAcF
	DHuo8dkcwMuEetBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DMLbNoNj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lyVlUAK4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784018779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WPDedMYoIPcbcGvrvY5H+IQoUl1T+mrUVDSGwBtiCbg=;
	b=DMLbNoNjgWmDIdKbEiPtdPrkH+ld3RlsqcX64XXxxm2RRfUg8MvGJZ92ZgBD27P28wzVAA
	WRSveFEoJOgqWKyZQ6GSxKCLZHtGdMqV1GrwiawGsxptpJoltg8OJztjLYy2/lMw2iBI/P
	fAX3DThYJFKoqdOXrOHqge89JD7L96I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784018779;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WPDedMYoIPcbcGvrvY5H+IQoUl1T+mrUVDSGwBtiCbg=;
	b=lyVlUAK45w4IS5EBJhNIkm2IZu+OwsxYgYOU3pgx6TZtANaLf1fDpxr7lpSfW0kNN+MAcF
	DHuo8dkcwMuEetBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 34B25779AE;
	Tue, 14 Jul 2026 08:46:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HaT/CFr3VWphQAAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Tue, 14 Jul 2026 08:46:18 +0000
Date: Tue, 14 Jul 2026 09:46:16 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: James Houghton <jthoughton@google.com>
Cc: Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH 00/18] Another attempt at HVO support on arm64
Message-ID: <alXtiUdmabf1TZgj@pedro-suse>
References: <20260708031129.3503195-1-jthoughton@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708031129.3503195-1-jthoughton@google.com>
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 5EE133E28
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_014623_428541_EB8F3501 
X-CRM114-Status: GOOD (  26.79  )
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

Hello,

On Wed, Jul 08, 2026 at 03:11:10AM +0000, James Houghton wrote:
> Hi everyone,
> 
> This patch series uses a trick with the Access Flag on CPUs that support
> hardware update of the AF to update vmemmap page table entries without
> introducing a time window where CPUs accessing the vmemmap might fault.
> 
> By avoiding faults, the HugeTLB vmemmap optimization (HVO) can be
> implemented correctly on arm64 in a much more straightforward way than
> previously attempted, most recently here[1] (please see [1] for a
> breakdown of the other approaches attempted before).
> 
> For large-memory systems that allocate most of their available memory to
> HugeTLB, HVO saves a huge amount of memory (1.5% of system memory).
> 
> This series has four parts:
>   1. Some preparatory changes (patches 1-3)
>   1. Bare minimum HVO support (patches 4-10)
>   2. Drop BBML2_NOABORT requirement for HVO (patches 11-13)
>   3. Drop the user-configurable Kconfig for HVO (patches 14-18)
> 
> Parts 3 and 4 are technically optional. More details below.
> 
> The main functional caveat with this series is that bootmem HugeTLB
> pages are not "pre-HVOed". They will be HVOed, but because at pre-HVO
> time SMP CPUs have not been enabled, we cannot query for full system
> support.
> 
> This series is based on 7.2-rc2 (0e35b9b6ec0f).
> 
> This series almost 100% cleanly applies to mm-new, which has some of
> Muchun's HVO patches, with one trivial conflict. I imagine this series
> will conflict pretty heavily with some of Muchun's other patches[2].
> 
> -- The AF trick --
> 
> The trick is that translations with the AF unset cannot be cached in the
> TLB (see Rule R_DWZCQ in the Arm ARM), so they can be atomically updated
> without needing a full break-before-make sequence.
> 
> So the PTE update sequence becomes:
>   1. Atomically clear the AF on the existing PTE.
>   2. Invalidate the TLB.
>   3. cmpxchg the AF=0 PTE with the new PTE. If this fails, goto 1.
> 

So, this sounds really cool but I'm not sure if its correct. Looking at
D8.17.1 Using break-before-make when updating translation table entries:
Per IGXGZY:
For a translation stage with AF hardware management enabled, if a translation
table entry is modified and the break-before-make sequence is not followed,
then all of the following failures associated with AF hardware updates can
occur:

- When a memory location associated with that translation table entry is
accessed, the AF is not set.
- When hardware updates to that translation table entry are followed by
stores appearing later in program order, the ordering required is not followed.

So apparently per the ARM ARM you can possibly never observe AF=0 even if it's
cached.

And then other semantics concerns may arise e.g I'm not sure if AF=0 implies
that the walk cache has nothing for that address, or if it's just that
particular translation that's not in the TLB. Though this might not
particularly matter since we're not collapsing the PTEs back to a PMD block
mapping.

Right? Tell me I'm wrong :)

-- 
Pedro

