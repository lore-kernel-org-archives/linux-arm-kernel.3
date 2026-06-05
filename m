Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339B4CD6E7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 15:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BFFFgB57ZAob11PrIhvgonvaYPbDjOxXtuYXVUomG0=; b=TJBgSj6p/lF507if2pUXg/IwMH
	dfHteycyVfYpraR+fExaYHHFAlX7XdvSitBizKOYi+DOeUOrNAQedJmjr4OBkNKOzF/8cvXfb7BG9
	p1PL9Ooa+jFMpCEhDY5qLDvl1V5gMFroyQmcuRQ6wF7+5N0FzFoc3XU56/K9YWZb4tHH1utohEnTt
	E5e3EpfjVLDWwwpQj0aFHLrr0eAptkogHY4q19NlgVmJZq74KiIFE0iqG+OBCDxGPVEua+PXteSY0
	637nWLXiocenXe7XpNK6yzjoCPdcFF3x/GFvdVCmdwk7rFMJCDQYvrnv4tX/ARUBIWVir45mYnLTl
	QkiwggWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWUr-00000000p0h-0V2R;
	Fri, 05 Jun 2026 15:30:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWUq-00000000p0E-04Hx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 15:30:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BB1942B14;
	Fri,  5 Jun 2026 15:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C001F00893;
	Fri,  5 Jun 2026 15:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780673407;
	bh=1BFFFgB57ZAob11PrIhvgonvaYPbDjOxXtuYXVUomG0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=RayKJ7ncq0sZEb9vdqzRVX7YDpHvVxSzRbkdFFpFXx+JmNyRvyody6M/TZBC+J1mC
	 aijEDSFOVz044vXnDL+FBwplQJdbIFbUpu/BmIKdN10yjwCnxeqA3tttPoUnDrCfXj
	 jJ77iJAoRNuPuAW5vKVhA6bptbyqojfT4V6HHh7zbnAH5oeRGBECqR9A8H+BWuiNEy
	 xndf4zIX/VXugdxNVUP/9oD1IQfp6KuVrUa/LGQ+/TVcncmYM63Jcd3akd8jng6r8x
	 16RFTi1oRG6rL/FWWoe+DWiKMkGU1UMQ8HFvlAKpM2e4qVOhrcaGRY+GkrU8dwNl9q
	 jRADb53t0lpNg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AF53930BA5;
	Fri,  5 Jun 2026 15:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next] bpf: Replace scratch PTE atomically when
 allocating
 arena pages
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178067340741.3804693.1794735582974531631.git-patchwork-notify@kernel.org>
Date: Fri, 05 Jun 2026 15:30:07 +0000
References: <20260601183728.1800490-1-tj@kernel.org>
In-Reply-To: <20260601183728.1800490-1-tj@kernel.org>
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

This patch was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Mon,  1 Jun 2026 08:37:28 -1000 you wrote:
> apply_range_set_cb() maps the pages for a new arena allocation and returned
> -EBUSY when the target PTE was already populated. Kernel-fault recovery
> leaves the per-arena scratch page in unallocated arena PTEs, so a later
> bpf_arena_alloc_pages() over such a page hits that -EBUSY, and every
> subsequent allocation of it fails the same way. Allocation must install the
> real page over scratch instead.
> 
> [...]

Here is the summary with links:
  - [bpf-next] bpf: Replace scratch PTE atomically when allocating arena pages
    https://git.kernel.org/bpf/bpf-next/c/f64c723741c9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



