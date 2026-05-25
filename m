Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C80CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 15:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=er8UsZouFFhjk3+GJ7baiqXv2Lc2B7dnsZku6inG5sI=; b=hd710vn7zc+X7tdsw16fVIH/ua
	9D47wCPrTx5vyXFqXYCWPc8Zf0l7dTikq/8Yxrkw6HRvXDkrrle4cuMggSMzax0CBBtYjChBKQF48
	TDb65BIEoKWeAHZ5u8t1F63g7rOv/Mqil+XrWvPcU5klOodFb+OSKD+hDRO3+EK4iW675fuPW8/uj
	ZLeQuPLxG+/OKfSz1wEWcPlZ/6kJ1jl1sqhmKrZmsV2hpDAtkHizXvcXcSewyWSjNKYEdjz0dwwOg
	tLKzhp/rOT/j8LieCl6txEOZwcCQPvntyv9ezK2S7Ql6KHwAEtgsfy5fA9ZghUCWCWoB3LWCHWE3e
	DmWJWsGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRXZB-0000000HYiR-0ITR;
	Mon, 25 May 2026 15:50:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRXZA-0000000HYiE-17gB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 15:50:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CF866008A;
	Mon, 25 May 2026 15:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AFEA1F000E9;
	Mon, 25 May 2026 15:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779724207;
	bh=er8UsZouFFhjk3+GJ7baiqXv2Lc2B7dnsZku6inG5sI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=brMJBmOdnKnF0Zzaqx3KMPwRmWhnrFvJ9fsvRMKS1QqqYYinLPIQx3ln4zUHdNlnW
	 WKzpvsQG2U0W8+bUfXh6XXoGubc33vvVXOtwWNXemRLFrdEM7/53r0nI5jkUh7h5Mi
	 ZDS+jJ6GNIsz4SM6W1NWONn8j/SlHm7ZNOI7MENr9ckh9Zdgm/qgqXzkQEzo0XDimU
	 DqS2uD7a0wQrRM2NKrvZ1vE2r0zaORQFFclfsvScJSwuDdUz+wP1pB54UX9QSoROxb
	 nPLGv/Huo1DAoAnXLD8cOypzfXvtLrKkm6/kZ/g0asgTFFDHppJJactOzD1y6ef2NC
	 1Yu5c5ql2/JBQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19B69380AA66;
	Mon, 25 May 2026 15:50:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/8] mm: Add ptep_try_set() for lockless empty-slot
 installs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177972421364.2623932.4873892825966322227.git-patchwork-notify@kernel.org>
Date: Mon, 25 May 2026 15:50:13 +0000
References: <20260522172219.1423324-2-tj@kernel.org>
In-Reply-To: <20260522172219.1423324-2-tj@kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, arighi@nvidia.com, changwoo@igalia.com,
 ast@kernel.org, andrii@kernel.org, daniel@iogearbox.net,
 martin.lau@linux.dev, memxor@gmail.com, peterz@infradead.org,
 catalin.marinas@arm.com, will@kernel.org, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, akpm@linux-foundation.org,
 david@kernel.org, rppt@kernel.org, emil@etsalapatis.com,
 sched-ext@lists.linux.dev, bpf@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
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

Hello:

This series was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Fri, 22 May 2026 07:22:12 -1000 you wrote:
> Add ptep_try_set(ptep, new_pte): atomically set *ptep to new_pte iff it is
> currently pte_none(). Returns true on success, false if the slot was already
> populated or the arch has no implementation.
> 
> The intended caller is the upcoming bpf_arena kernel-side fault recovery
> path. The install runs from a page fault that can be nested under locks
> held by the faulting kernel caller (e.g. a BPF program holding
> raw_res_spin_lock_irqsave on its arena's spinlock), so trylock-and-retry
> would A-A deadlock. Lock-free cmpxchg is the only viable option, which
> constrains this helper to special kernel page tables where concurrent
> writers cooperate via atomic accessors.
> 
> [...]

Here is the summary with links:
  - [1/8] mm: Add ptep_try_set() for lockless empty-slot installs
    https://git.kernel.org/bpf/bpf-next/c/258df8fce42f
  - [2/8] bpf: Recover arena kernel faults with scratch page
    (no matching commit)
  - [3/8] bpf: Add sleepable variant of bpf_arena_alloc_pages for kernel callers
    https://git.kernel.org/bpf/bpf-next/c/f211c81ddc36
  - [4/8] bpf: Add bpf_struct_ops_for_each_prog()
    https://git.kernel.org/bpf/bpf-next/c/7c48a28c1bbe
  - [5/8] bpf/arena: Add bpf_arena_map_kern_vm_start() and bpf_prog_arena()
    https://git.kernel.org/bpf/bpf-next/c/53cc12a2dc88
  - [6/8] sched_ext: Require an arena for cid-form schedulers
    (no matching commit)
  - [7/8] sched_ext: Sub-allocator over kernel-claimed BPF arena pages
    (no matching commit)
  - [8/8] sched_ext: Convert ops.set_cmask() to arena-resident cmask
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



