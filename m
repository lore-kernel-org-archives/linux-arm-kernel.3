Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6FCCD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 17:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRhng7ZwRas2P1ADM7h74381kykfPa3pcL8IR8Sgsag=; b=pfGIoHGVPlpa5pYdSCo2w1SCnS
	uV6O7cWqv6aMM6kknqLrOorWhtCBYi5e8fpTVxfWIgOp1uqN5J1J09twCRkbmK1vIt29OdF2pd+PR
	dO9xfvHKJZr/RBpxWpPlWVzEtyjO46Y5yG2GHd9QLT5wzFATjptsQhj9RporcSf8OKBp6fEooMX8J
	PXh/AmKN1EK0Zyu2dKHhnPbj2oe95OGU19G6Iq9+GS/yUySFRPph+59mUduFNHbdUueXxIc8KI0eT
	f8CQ05mxmE97EX8huoyTWphIcWoZZn/K5sSglXzx7rFCfgSeGo06PsfCG8Nr6rKw82wZvOpZyZBeI
	ltrflGSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTkGZ-00000009nkD-0KRs;
	Sun, 31 May 2026 17:48:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTkGX-00000009nk6-2OdO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 17:48:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CDA4D6008A;
	Sun, 31 May 2026 17:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA811F00893;
	Sun, 31 May 2026 17:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780249679;
	bh=SRhng7ZwRas2P1ADM7h74381kykfPa3pcL8IR8Sgsag=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=iuDXv0f1iop3nim+N4Thcks0PngriNRgeVPiAgKtBxzypHnxoTMMjLjp/89E9JBRZ
	 J7oClLQY++qvZPFaL7cOm6gepiOYfT3domo4RNKpi6RmfTbt4FORCfaHxm2ETsL/xi
	 NqGfxszFTID7uGZw41CWjkVP7+KI1W5ueUQrg5fHeWOpaiKiMbpzVIWCNV/G3S/Kfz
	 uXzOBEF+equVHqy2k6NFGA1UG/FPQnRZteKEQgm4iUUEcJYruwNY4f+ZMsHxOi6u5J
	 GhlaseKU9FawVQ+Iy2xlZSW+1IvWgPYeLqfjhqyspX4s4XfERaakiGk82QYGyeXAx+
	 lTa3BvBR6Kovw==
Date: Sun, 31 May 2026 07:47:58 -1000
Message-ID: <8cc56c7a4aa29628b7d17d85be7eadb9@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Alexei Starovoitov <ast@kernel.org>, David Hildenbrand <david@kernel.org>
Cc: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>, Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, sched-ext@lists.linux.dev, bpf@vger.kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] bpf: Recover arena kernel faults with scratch page
In-Reply-To: <ahnedQ33ZH8ogjbC@slm.duckdns.org>
References: <20260522172219.1423324-1-tj@kernel.org> <20260522172219.1423324-3-tj@kernel.org> <7fd673df-22f3-4d70-a779-ea0b878188b3@kernel.org> <DIUMP21RASZI.2VNQV45RIL209@gmail.com> <3901fe0537edee9d7acdfd91695ead28@kernel.org> <CAADnVQJ+CqAszS2sSVu7gSfA_g4oaTR+SWmLNMX3_8c=OdR7NQ@mail.gmail.com> <ahnedQ33ZH8ogjbC@slm.duckdns.org>
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

I posted the check removal [1], and Sashiko's review flagged a
break-before-make problem with it [2] that I think is real.

The scratch page is a present PAGE_KERNEL mapping, so having
apply_range_set_cb() overwrite it via set_pte_at() during
bpf_arena_alloc_pages() is a valid->valid PFN change. I'm not familiar with
arm at all. David, my understanding is that's a break-before-make violation
on arm64, and that on any arch the stale TLB entry keeps resolving to the
shared scratch page until it's flushed, so a later access can hit scratch
instead of the new page. Is that what you were worried about?

So instead of just dropping the check, the install should route through an
invalid entry rather than overwrite in place:

	while (!ptep_try_set(pte, mk_pte(page, PAGE_KERNEL))) {
		old = ptep_get(pte);
		if (pte_none(old))
			continue;
		if (WARN_ON_ONCE(pte_page(old) != arena->scratch_page))
			return -EBUSY;
		ptep_get_and_clear(&init_mm, addr, pte);
		broke_scratch = true;
	}

ptep_try_set() only fills a none slot, so the slot goes scratch->none->page
and never valid->valid, and the loop copes with a concurrent fault
re-scratching it. This also closes the set_pte_at()-vs-ptep_try_set() race
I raised earlier, since both sides are now cmpxchg. A broken scratch entry
was live, so the caller flush_tlb_kernel_range()s those pages when
broke_scratch is set, like arena_free_pages() already does after clearing.

[1] https://lore.kernel.org/r/20260531165852.555930-1-tj@kernel.org
[2] https://lore.kernel.org/r/20260531170854.31EA51F00893@smtp.kernel.org

Thanks.
--
tejun

