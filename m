Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2E4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCUhcyiwWTmu8QeEJQt1vja0HsbAMaRlJMAEe2Y7DeE=; b=ja2BBkS5EHv8A4o/XBLYOlm/D/
	mnm7ISN7ubNdqhyrl4Yy5LirEXZf0MnJI+krnXS0YOH2WjHRsbBFU3g1E0Mc90O5urXfl31X/9hpC
	MWJLRTLiA4u7BnIZSWn+MhayITE+B+PIoh+7GEs17+IpeSU0gbzB9ZsKI1qEl7W+yzZ0uUy/O/qmj
	kJvbvICQHkW733v0ndc3fSni8U6vuhdRVoLzrN2kRQaMmejsxoCc52jNRClrPASyFNDNdYubCxMwL
	H4oVDkwhhrCPXJxXKOCC50FcwLFuY+Ae9UmNZpjUtoftAJ8Q9jsmbx06eLcTJGp26GJqaCA/5KHdN
	H1A3e9XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjF1H-000000092tP-06kK;
	Mon, 13 Jul 2026 11:40:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjF1F-000000092t8-0UsV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:40:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 942CA433F9;
	Mon, 13 Jul 2026 11:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A9A41F000E9;
	Mon, 13 Jul 2026 11:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783942816;
	bh=OCUhcyiwWTmu8QeEJQt1vja0HsbAMaRlJMAEe2Y7DeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dZGRJauIXmFXIXVKASyA43gR9V2NS35VztGQ8qQBxwH8LNdZxq9XD4tytbLxkdY0n
	 B8D/j/tVmRYXiqNFMDWprsqF4C8N/3yT0IGtZC0WViv0Hy5j2DtOrzlO3v1SVEqURF
	 aKZlD64LLIeCcBPb97NqITp5YwBE8GPonzWR8Y7HP1uRC8V2ZwNcmgO6zQst2vzSDQ
	 bUw4pXb9RBEtnyNT00GtkuXO5eCdq/PnU4JxH6o+9qa25c+6C4tJXsww2lKsULk5ei
	 hMUFiw2xJMIXnlL/MOUBqO9VvQPb3J30DdctzBG7xOoUEJCM66BlhH5cq7Hi7LCGwd
	 xEpAPa9EOjiJw==
Date: Mon, 13 Jul 2026 12:40:08 +0100
From: Will Deacon <will@kernel.org>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Toshi Kani <toshi.kani@hpe.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dev Jain <dev.jain@arm.com>, Ryan Roberts <ryan.roberts@arm.com>,
	David Carlier <devnexen@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH mm-hotfixes v2 4/4] arm64: remove redundant concurrent
 ptdump UAF mitigation
Message-ID: <alTOmMpGVdRMy7NM@willie-the-truck>
References: <20260712-series-vmap-race-fix-v2-0-ad134cc3a12a@kernel.org>
 <20260712-series-vmap-race-fix-v2-4-ad134cc3a12a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712-series-vmap-race-fix-v2-4-ad134cc3a12a@kernel.org>
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

On Sun, Jul 12, 2026 at 11:42:27AM +0100, Lorenzo Stoakes wrote:
> This partially reverts commit fa93b45fd397 ("arm64: Enable vmalloc-huge
> with ptdump"), retaining vmalloc-huge support but eliminating the now
> redundant mitigation against a race between huge vmap page table freeing
> and ptdump, as this issue has now been fixed at core.
> 
> We also simultaneously remove the arm64 if-deffery when acquiring the mmap
> read lock upon vmap huge page table promotion as it is no longer required.
> 
> Note that this patch relies on the preceding vmalloc patch, and should not
> be backported alone.
> 
> Fixes: fa93b45fd397 ("arm64: Enable vmalloc-huge with ptdump")
> Cc: stable@vger.kernel.org
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> ---
>  arch/arm64/include/asm/ptdump.h |  2 --
>  arch/arm64/mm/mmu.c             | 43 ++++-------------------------------------
>  arch/arm64/mm/ptdump.c          | 11 ++---------
>  mm/vmalloc.c                    | 15 +++-----------
>  4 files changed, 9 insertions(+), 62 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

