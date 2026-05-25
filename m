Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F46CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 15:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7DFSewy4HiHsulqVjDY+J795cQvlcQzlXeEXsle8lBQ=; b=XriRKlExdknSgRfll0e9Q0/4we
	HiOoulx66lg/k2H54DnoZ71LQh1jKC7eKbr6q6qT+eBRD4RkNBSZZ/96GcbmwTokvx4X3XHBfeMUa
	xfbEU0XuK3h9+uZaFcwxNaKDHqUraib/qyYgHUQzj1GO3pvGziyWLv7J5pJhwKvxOPuRkii8HGyIO
	+y9bMH30yYhKlsIO3R+V4/dzixWl+bisYMZ/YN9ew0glcC0VDxy/Pk+2nWHYoYiXU4JVL2M5osJTh
	SZ9Cybst38RWilAO/qTCMJNhoFF43DGjCFgMobEky8QJrhJi/4Dd7DY8YDDZxxHQqZ1JGfg0I2VWR
	2rgo2Nbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRXZG-0000000HYje-0e1d;
	Mon, 25 May 2026 15:50:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRXZB-0000000HYiV-44GT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 15:50:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E6F5B601F3;
	Mon, 25 May 2026 15:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944691F000E9;
	Mon, 25 May 2026 15:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779724208;
	bh=7DFSewy4HiHsulqVjDY+J795cQvlcQzlXeEXsle8lBQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=VjYzFiUbbB+KydlfY9Z4MuBygfHZEOhzzF8hqPM3jzuAT12EAGWi4sWZ5Kj7xTBmG
	 /xgXWuskpWqOfF/++ekEIAsipeAeQb3YtnKrQnv1758Mmm97CNXTov68HsnU7ff+cT
	 5WPDO01gr5uSuD8EesHTGnWwfCDqLnLRq9HUAX2SED9u5AdOZxvlTTWIODe+Pntcpi
	 bHQnGL28WCVobvfZpLzPe+XKfGpoDvRcskhXnXu/QJRk1AFBymhjlbuU9uCvSG5UbJ
	 ZqD0nShvHeADxBhybW/GnMY1bwvu6WG8sgtinirBkF0AbNyu6WkTYy1he2ImOo86lK
	 Z8JDU7xInsufQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9389A380AA66;
	Mon, 25 May 2026 15:50:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/8] mm: Add ptep_try_install() for lockless empty-slot
 installs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177972421514.2623932.18366712575128006806.git-patchwork-notify@kernel.org>
Date: Mon, 25 May 2026 15:50:15 +0000
References: <20260517211232.1670594-2-tj@kernel.org>
In-Reply-To: <20260517211232.1670594-2-tj@kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, arighi@nvidia.com, changwoo@igalia.com,
 ast@kernel.org, andrii@kernel.org, daniel@iogearbox.net,
 martin.lau@linux.dev, memxor@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, akpm@linux-foundation.org, david@kernel.org,
 rppt@kernel.org, emil@etsalapatis.com, sched-ext@lists.linux.dev,
 bpf@vger.kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
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

On Sun, 17 May 2026 11:12:25 -1000 you wrote:
> Add ptep_try_install(ptep, new_pte): atomically set *ptep to new_pte
> iff it is currently pte_none(). Returns true on success, false if the
> slot was already populated or the arch has no implementation.
> 
> The intended caller is the upcoming bpf_arena kernel-side fault
> recovery path. The install runs from a page fault and may have to
> contend with locks already held by the faulting kernel caller, so
> keeping it lock-free via cmpxchg is the safe choice.
> 
> [...]

Here is the summary with links:
  - [1/8] mm: Add ptep_try_install() for lockless empty-slot installs
    (no matching commit)
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



