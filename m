Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF4AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 08:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=enyWtChxLifT9CO1+iCJe3PI3c5SIL5ZQ7wN+THBh48=; b=KiWnSMP0+x8Y2DrvnybEYmcCk8
	/f7EYlQRc3qZL9Gz7mUFN2c0iG5Ib9GZfk6AB8txeYDyg3w1EeFNyQahrq1+HooEPFpdU2UawYkJc
	zi1LS4L+pvvEIGhd+nLLYneXWKmxQAc/yFvESDlYVWBcNt1X/+zZTLdTgWZPje/jz/T6e3kDXbBce
	Po11PA4COyzu3eA1ALrlhzOOuSe9h0PinSzaB8ShnBjvDr22t30AzfGQu3Q4hWW6eF04QXZEhJOnD
	yfkWF2+iMETByQdI+efHUz/ZkHDILri0dfIz11U6DIcTtEI8wBq7HbQnT35F6XMAVXwWxC7Jl63O1
	pmT6I9fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wipXH-00000007GCj-3fW4;
	Sun, 12 Jul 2026 08:27:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wipXG-00000007GCY-180v
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 08:27:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 01311600AE;
	Sun, 12 Jul 2026 08:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844B11F000E9;
	Sun, 12 Jul 2026 08:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783844856;
	bh=enyWtChxLifT9CO1+iCJe3PI3c5SIL5ZQ7wN+THBh48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YpiLFbDbz0bHYo0Nbd3BrGFfnFO4xG8aecNSUO1DIa7bjBaf9hmAzUdvqCQnhexG9
	 hlMpdqz3ofJIC6nqqLWRG42hdIckXAL6I+GZJugsXIUWQhGQrLv2mfppOLribndjsG
	 YNg1PwAhBhq/YeeqUPBH2Ec6tZ65DKH3rsGbm9ijvbRCx4ZcgS4z0m2VLkbFHp/mmk
	 X8cVMfVHIeYXPWXxec354SXLL38/PhHyemE6WcxuRJqQUiOtNqOn2H/4a0suxjgchm
	 bXIEEvgR3eZYM3MtRI3CVCktl8o/JtKc1TG5VezFBpdIsVhGF4V0P3JC6BbVg1q0Mf
	 2VAy7TNmEoKUA==
Date: Sun, 12 Jul 2026 09:27:22 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	David Carlier <devnexen@gmail.com>, Dev Jain <dev.jain@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] Revert "arm64: Enable vmalloc-huge with ptdump"
Message-ID: <alNPeT-TUEx1IrwE@lucifer>
References: <20260710-series-vmap-race-fix-v1-0-5b3794c113fe@kernel.org>
 <20260710-series-vmap-race-fix-v1-2-5b3794c113fe@kernel.org>
 <alIX0XoykjTz69sk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alIX0XoykjTz69sk@kernel.org>
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

On Sat, Jul 11, 2026 at 01:15:45PM +0300, Mike Rapoport wrote:
> On Fri, Jul 10, 2026 at 11:49:19AM +0100, Lorenzo Stoakes wrote:
> > Subject: [PATCH 2/2] Revert "arm64: Enable vmalloc-huge with ptdump"
>
> Without reading the full changelog this sounds like you are disabling
> vmalloc-huge with ptdump ;-)
>
> How about "remove redundant locking guarding ptdump against vmalloc-huge"?

I'm just following the standard convention when it comes to partial reverts, as
I revert the majority of the patch and I ran 'git revert' to do it ;)

But then again I do remove the arm64 ifdeffery in the same commit and
you're right it does suggest I revert more than I do so will fix it up!

>
> > This partially reverts commit fa93b45fd397 ("arm64: Enable vmalloc-huge
> > with ptdump"), retaining vmalloc-huge support but eliminating the now
> > redundant mitigation against a race between huge vmap page table freeing
> > and ptdump, as this issue has now been fixed at core.
> >
> > We also simultaneously remove the arm64 ifdeffery when acquiring the mmap
> > read lock upon vmap huge page table promotion as it is no longer required.
> >
> > Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>B
>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Thanks!

>
> > ---
> >  arch/arm64/include/asm/ptdump.h |  2 --
> >  arch/arm64/mm/mmu.c             | 43 ++++-------------------------------------
> >  arch/arm64/mm/ptdump.c          | 11 ++---------
> >  mm/vmalloc.c                    | 15 +++-----------
> >  4 files changed, 9 insertions(+), 62 deletions(-)
>
> --
> Sincerely yours,
> Mike.

Thanks, Lorenzo

