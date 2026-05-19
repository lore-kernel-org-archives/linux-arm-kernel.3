Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EDCCD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 08:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SH+YPF95/zLwMr5N6vP1dVxD0qTdJr5+mf2xNfP+q0=; b=LPKn14WehCBAqfFRhyHqBESbBP
	khEgYsdeBkeD7i/+TyUzSP8iKhLyWFvwX1mH7ZrFZWXt1UWYrBJC+ew6jZli4q7RzDg411ja0v8c4
	4BtMnanrH+9wWOXEYX65V8aHmHFjMUp8W1sWvw0Vo3hbFdJqn36wJayFIkK4jFxIiFA2xa4i6rPy+
	hKTarZg9ST/EFrJ1XDdYGjjHum/S8ZM/G7Rew+/mniFs1/S2Mz4WFqEJcoPFi3Rsa+PwH9cxxlXFu
	arvP6hZsnQLMa3su2E3BP1Nal60NKHI0l9HJB0mUvgYvD0Jgd5PLjda3sM3biFEXMge0D5Y7oKLbt
	7cQBeJ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGHH-00000000mAd-0M2l;
	Tue, 19 May 2026 08:58:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGHG-00000000mAD-02cZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 08:58:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35E59600AE;
	Tue, 19 May 2026 08:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8029C2BCB3;
	Tue, 19 May 2026 08:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779181092;
	bh=gauNbmJGhz8SMUOs2xoEyEo5YiMVdKM4Tk3hN8N4jDY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OIQ+VgifWcStlS5toMmZGu84EdGLCtmmnLn3Ob3jognZffsMTzc/DJEggAgX+G8GF
	 gfXNpBlOAUMaNuJe9AtOT/v5b/oebVSMZIx3zMHhjtWXCiv7fi10XdKZkOB2uy6vB0
	 efEsR/C9/1Yi/v/sOFKfbAf3ry0bfSdYJ++0AuKQwIqLG+z057qPvsDwpVQXffOll/
	 KOaJDFoh8mi0pv5pkUtjWLO+6PnBcJ0+oBFBk11sntZi7sVHF8Qr13ZiGb7Pxi+jZS
	 SggTQz761MHciv8LbGkZHWQ+0ROYb8U0S0OUmBVl3yj/UjdDwGaZBKr0hvRoiMoU4x
	 EO+uDPznm51EA==
Date: Mon, 18 May 2026 22:58:11 -1000
Message-ID: <297658c4ae2d6e7103f5968efc936224@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: David Vernet <void@manifault.com>,
 Andrea Righi <arighi@nvidia.com>,
 Changwoo Min <changwoo@igalia.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 sched-ext@lists.linux.dev,
 bpf@vger.kernel.org,
 x86@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] mm: Add ptep_try_install() for lockless empty-slot installs
In-Reply-To: <2f02d90d-cdc9-48ef-abe3-99e00f22595f@kernel.org>
References: <20260517211232.1670594-1-tj@kernel.org>
 <20260517211232.1670594-2-tj@kernel.org>
 <9ba50fd2-077e-4291-9276-9adb18186873@kernel.org>
 <agtuPrgIDNKSu2Oo@slm.duckdns.org>
 <2f02d90d-cdc9-48ef-abe3-99e00f22595f@kernel.org>
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

Hello, David.

On Tue, May 19, 2026 at 10:00:39AM +0200, David Hildenbrand (Arm) wrote:
> Is that really possible? I'd much rather prefer to trylock and retry, unless
> that can really result in deadlocks. But I have the feeling that such deadlocks
> should be impossible here.

I'm not well versed in either mm or BPF, so the BPF folks will have a
better take. But here's a scenario that seemed plausible to me:

1. A bpf prog calls bpf_arena_alloc_pages() on its arena. The kernel
   takes arena->spinlock via raw_res_spin_lock_irqsave().
2. Under the lock, the alloc path goes through bpf_map_alloc_pages()
   -> alloc_pages_node(), which fires trace_mm_page_alloc().
3. A BPF tracepoint program on mm_page_alloc that shares the arena
   starts running with the lock still held.
4. The tracepoint program calls a kfunc, passing an arena pointer
   one entry past the array it meant to touch.
5. The kfunc dereferences. The kernel-side address is unbacked, so
   the CPU faults.

trylock + retry at 5 would A-A deadlock.

> For example, staring at apply_range_set_cb(), what prevents:
>
> (1) apply_range_set_cb() finding pte_none(ptep_get(pte)
> (2) apply_range_set_scratch_cb() succeeding ptep_try_install()
> (3) apply_range_set_cb() overwriting the pte with set_pte_at()
>
> Between (2) and (3) CPUs could access the scratch PTE.

Scratch only gets installed when BPF passes an unallocated arena
address to the kernel side, which is itself the violation, reported
through the program's BPF stream. Behavior at that addr is then
undefined. For scx, the scheduler should be aborted and torn down.

The only requirements are that the kernel doesn't oops and the
violation gets caught. Beyond that, behavior at the address is
unspecified, and which installer wins the race doesn't matter as
long as kernel integrity holds.

Thanks.

--
tejun

