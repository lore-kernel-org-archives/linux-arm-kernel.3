Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2FCC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 15:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBfFhuRinnV9wYPzzoL4MlCiHUDKnmyjaEy4mvMQIbs=; b=kek9zbNoXF0BiR4er2Q655Yz5h
	nU43m3RQ6DQ/S/BNkprqYD/V1zaIu2jJU+DDdgFw++IYFlLl61GhVA0SV8pq0nIDp3CkoO0Y30EcC
	7OxAbhs06yVGKyddmJrU0mPnjsXTE3FCG4LuJ01Gc0vCudsCENpdkW24NgMeUC9EOaI18RRctdGnq
	xP4fmbdEmLwemdkPqx7NV80O9tynCFqrIBlxlxeCTuP/VDjCfrhLOGqHraB/Xr1/00m48CViStT71
	iEIfyL9yodxZU91yDHObJ7YrnS7Yg8VOGvcHxOadWO+q7qe+QNsO/5SedXRrFHLfpHjDyj8FtmIWS
	+KK1xnyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc3z9-000000082mL-3zAE;
	Wed, 16 Jul 2025 15:23:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc3wi-000000082NB-0zvz;
	Wed, 16 Jul 2025 15:21:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B871614AB;
	Wed, 16 Jul 2025 15:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E49C4CEF4;
	Wed, 16 Jul 2025 15:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752679283;
	bh=N9DR2XoFU8LJ40xmBBEoBU+ULNUrw05MSwSTwA269Vw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AmkuWvqLDRyRSNj9dulYvxOc08DmdmzpwoJID//N3AjazJZ5+3yihVYJWly9foRm1
	 pY+kagnCLWU5FkldusKOaJmutDjZLVDbmKDaOK0EU+L1NWR3iVZKWsyEKLR00qbaBQ
	 DGCOL48W401QoXZEsTwlaYRpwzSqXBcgpQ+/5u347J6a8wZ1VXoaRiJuek3fVONzCu
	 fYtcADOp90PCiI43k5jsD6Detk2zD12p+XpVjB4veJrO1Il8bXiOAEw3yeaZ/VtFHh
	 10KIPvNIeKqqaTfmdv7/LVyQmu3qjMGKYbtmETulyzOHcS8N/+LQ0NqROfAmMk5u1g
	 dMl6YmZV1e8Bg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE772383BA33;
	Wed, 16 Jul 2025 15:21:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/1] mm/rmap: make folio unmap batching safe and support
 partial batches
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175267930360.1224517.58776217215607423.git-patchwork-notify@kernel.org>
Date: Wed, 16 Jul 2025 15:21:43 +0000
References: <20250627025214.30887-1-lance.yang@linux.dev>
In-Reply-To: <20250627025214.30887-1-lance.yang@linux.dev>
To: Lance Yang <ioworker0@gmail.com>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 david@redhat.com, 21cnbao@gmail.com, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 huang.ying.caritas@gmail.com, zhengtangquan@oppo.com, riel@surriel.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, harry.yoo@oracle.com,
 mingzhe.yang@ly.com, baohua@kernel.org, lance.yang@linux.dev
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

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Fri, 27 Jun 2025 10:52:14 +0800 you wrote:
> From: Lance Yang <lance.yang@linux.dev>
> 
> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
> can read past the end of a PTE table if a large folio is mapped starting at
> the last entry of that table.
> 
> So let's fix the out-of-bounds read by refactoring the logic into a new
> helper, folio_unmap_pte_batch().
> 
> [...]

Here is the summary with links:
  - [1/1] mm/rmap: make folio unmap batching safe and support partial batches
    https://git.kernel.org/riscv/c/ddd05742b45b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



