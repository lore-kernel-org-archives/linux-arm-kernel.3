Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90635C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 15:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJE8Z/H7J911tEqHgg8UXTtDxDjLj0/T7U8n3BJQXOM=; b=bsaIsPQ6GcjSx0Ceo3iCVi7WGZ
	qitOLFYFlbUvbfUE/YHJJDvAVgcNBSbgLnCYdT/tTYRTuT0oGnKvcbyTIcbmC0HHbJQ7WkRo1St3R
	IwXVcIoIjZ+yKHwm9nwe1q7DF3/MS9eV2Zj0OKdosWzomh6CuC56kaGTypjluGTC/fvkIvnk9gWCK
	XOLxUfMdX/djIpzWcL8NEvKiYq3qt+bc4i8ItI2eREPqUcZZMHNuETTGKBxMNIlrUxO908B++2MJR
	8J1AipoouQ+G1QCIcagrvsRhMej9R6I5TDxlWkUG+vrExoT+WQQT3CWNbB2HpFdiR/JFEpXj7P9ty
	/WfLLPrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc41c-000000083OS-1X66;
	Wed, 16 Jul 2025 15:26:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc3wk-000000082NS-0DOk;
	Wed, 16 Jul 2025 15:21:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D79975C65F0;
	Wed, 16 Jul 2025 15:21:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D866C4CEF0;
	Wed, 16 Jul 2025 15:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752679284;
	bh=p2u05dLVtqQJ3foGrWJXooMdrDiQBdBaUfjuYdOfRI8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GXNZqmiM3oopAWeII/q3vlE8pvrAug8t7A6wOb+mZy/DJcXF/RELXBzf30puyUdIf
	 PEw3d7vZ5vmLIX2Xq09I4ZyXuSbI+5Pb8N8RV42b//+EXK/W3DbyLLQ0pOHTYanHAY
	 JX92xf8rrx7lZTC1MHYEAbzX2ArWb5myVqPJ8Y5D5R4cukMaQcrRysKjKUP32iu5Et
	 0ia8x2NEVTIQyrzRq0MEJ91tTnQFlcvFQ0p79hJ/naQEIGYFF6FVO33VJmuPXKLqVn
	 Dk+2KGtpQmzs4PjxM/G+VrGjhCvYY+0TvMLLvdNb0bqZPI1fta3xN4Eas7KfSsVOMd
	 atDjSa1cvJyqA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 2B757383BA33;
	Wed, 16 Jul 2025 15:21:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 1/1] mm/rmap: fix potential out-of-bounds page table
 access
 during batched unmap
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175267930477.1224517.13373842337541537594.git-patchwork-notify@kernel.org>
Date: Wed, 16 Jul 2025 15:21:44 +0000
References: <20250701143100.6970-1-lance.yang@linux.dev>
In-Reply-To: <20250701143100.6970-1-lance.yang@linux.dev>
To: Lance Yang <ioworker0@gmail.com>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 david@redhat.com, 21cnbao@gmail.com, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 huang.ying.caritas@gmail.com, zhengtangquan@oppo.com, riel@surriel.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, harry.yoo@oracle.com,
 mingzhe.yang@ly.com, stable@vger.kernel.org, baohua@kernel.org,
 lance.yang@linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_082126_128770_D0662F76 
X-CRM114-Status: GOOD (  10.34  )
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

On Tue,  1 Jul 2025 22:31:00 +0800 you wrote:
> From: Lance Yang <lance.yang@linux.dev>
> 
> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
> may read past the end of a PTE table when a large folio's PTE mappings
> are not fully contained within a single page table.
> 
> While this scenario might be rare, an issue triggerable from userspace must
> be fixed regardless of its likelihood. This patch fixes the out-of-bounds
> access by refactoring the logic into a new helper, folio_unmap_pte_batch().
> 
> [...]

Here is the summary with links:
  - [v4,1/1] mm/rmap: fix potential out-of-bounds page table access during batched unmap
    https://git.kernel.org/riscv/c/ddd05742b45b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



