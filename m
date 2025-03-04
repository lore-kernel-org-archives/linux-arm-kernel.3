Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8F6C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1iGbelaTALv5TJMxtK+qrnTKCCp2cmpTL/B5DdK1Vs=; b=JWlO1k/1PRip9aTD1tCzGkbV7/
	k31app7wvaeeQyxqODYratjM2uzSopOT7GJy2By+dbneU4/G80SQ4RTLJTasB12YywvJEjgSnYPOq
	aRL+uioq7aIxdMhhCYdp7RL60BxXHafTcZgVg6OyFqRkMUDqGZ6NGZh8yrXUvrK1v5e/lY/DFwWEh
	FK7l7pHOvvpGNzL39boufxQZRruEyG1648XDRGVg4xy3aYPKlKKi5y42oO82xUZxlWjmtyV5C0tm/
	XKlZF/xLLL7bbDs0KWLfcGFmHE0r3pWnMjg92qwnXM6GE4TBjAMgS40Jw4V1iGTKVDfpiIb+6z/xO
	xuHNGt2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOas-00000003tIX-2iCY;
	Tue, 04 Mar 2025 09:29:42 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNXb-00000003bzI-3mOZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 08:22:17 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E7F952116B;
	Tue,  4 Mar 2025 08:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741076533; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A1iGbelaTALv5TJMxtK+qrnTKCCp2cmpTL/B5DdK1Vs=;
	b=pTtO6DWOv7HVdk0DopBnr7FBs8lw+CeB94qhhMw2AzEQL9sxfuWr1xxuh2gI7tyg65XGmX
	+c42tFVFn7IWwsRc8SVNt0n6BuwUOlQWF4/M1LWtK/L9xs+DOWi6dq/FVS480S5BGvJMpy
	eHepKA2WZaFZfy9d3+PZat0r0eCGW6o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741076533;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A1iGbelaTALv5TJMxtK+qrnTKCCp2cmpTL/B5DdK1Vs=;
	b=RZjuCsUd4QbjDaC7142C8e/UHlSC76MGn1CSiUWw1dBFOm9j2W6ql1HL0oqVlHlbjAUNfi
	98ackGqGs6RjQ5CA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="y3mrGdx/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AwW4QRns
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741076532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A1iGbelaTALv5TJMxtK+qrnTKCCp2cmpTL/B5DdK1Vs=;
	b=y3mrGdx/kdMYr18Ca1TcbYYDL0goAAGV9UL34f4VsfPiCg1ZrWG8tMfXnCSZc6yw97BgqW
	pJNuoF1opafT1K6XudP9sCdAAbsof70pwSmB1vHWdKF4Y2/KHPSKvup/sVnGsbS5NVOuhP
	p/eBEihk36BtBbOJ4FCIKBNgEnopXOE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741076532;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A1iGbelaTALv5TJMxtK+qrnTKCCp2cmpTL/B5DdK1Vs=;
	b=AwW4QRnsWlUItyWFe4fUIeV27z/cVT8byjaRV6l7ZXGtlYgoLGAH4lxFqGYx4BA0GOJokC
	WyMOnHCCirCzu+Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 635121393C;
	Tue,  4 Mar 2025 08:22:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dfxzFTO4xmfRNgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 04 Mar 2025 08:22:11 +0000
Date: Tue, 4 Mar 2025 09:22:09 +0100
From: Oscar Salvador <osalvador@suse.de>
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>
Cc: anshuman.khandual@arm.com, catalin.marinas@arm.com, david@redhat.com,
	will@kernel.org, ardb@kernel.org, ryan.roberts@arm.com,
	mark.rutland@arm.com, joey.gouly@arm.com,
	dave.hansen@linux.intel.com, akpm@linux-foundation.org,
	chenfeiyang@loongson.cn, chenhuacai@kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	quic_tingweiz@quicinc.com, stable@vger.kernel.org
Subject: Re: [PATCH v9] arm64: mm: Populate vmemmap at the page level if not
 section aligned
Message-ID: <Z8a4MWPpTKm2FAce@localhost.localdomain>
References: <20250304072700.3405036-1-quic_zhenhuah@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304072700.3405036-1-quic_zhenhuah@quicinc.com>
X-Rspamd-Queue-Id: E7F952116B
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_002216_096222_E4AF16A2 
X-CRM114-Status: GOOD (  15.41  )
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

On Tue, Mar 04, 2025 at 03:27:00PM +0800, Zhenhua Huang wrote:
> On the arm64 platform with 4K base page config, SECTION_SIZE_BITS is set
> to 27, making one section 128M. The related page struct which vmemmap
> points to is 2M then.
> Commit c1cc1552616d ("arm64: MMU initialisation") optimizes the
> vmemmap to populate at the PMD section level which was suitable
> initially since hot plug granule is always one section(128M). However,
> commit ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
> introduced a 2M(SUBSECTION_SIZE) hot plug granule, which disrupted the
> existing arm64 assumptions.
> 
> The first problem is that if start or end is not aligned to a section
> boundary, such as when a subsection is hot added, populating the entire
> section is wasteful.
> 
> The next problem is if we hotplug something that spans part of 128 MiB
> section (subsections, let's call it memblock1), and then hotplug something
> that spans another part of a 128 MiB section(subsections, let's call it
> memblock2), and subsequently unplug memblock1, vmemmap_free() will clear
> the entire PMD entry which also supports memblock2 even though memblock2
> is still active.
> 
> Assuming hotplug/unplug sizes are guaranteed to be symmetric. Do the
> fix similar to x86-64: populate to pages levels if start/end is not aligned
> with section boundary.
> 
> Cc: <stable@vger.kernel.org> # v5.4+
> Fixes: ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs

