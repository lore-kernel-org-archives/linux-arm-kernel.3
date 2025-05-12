Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D064C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 11:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=goCNdIPXpmd9jytDCbA84Bed0KYNF17gS9Ylbu3Iw54=; b=2gbwQPGPxoPWzN/Wam/K3RQcRj
	ciS3GB8ZyRtKISpH2EOnCpD4vGvA7/VAOVUxLpJCK1TCZUUQh4Yq/vCsoyX5J3UOcapEb//JUYTrp
	+CW9eOrqrjqdC/f4ipaRiIVAXE389iVNCw5PHfQI225kjc0uOPt8++m6LxSqEIRHGdloBYS6gSDTV
	GNKT6mvVcLXWNVagURXXhSl/YeA7pzydOPiqCtrMZHaKHcA+5Hmt4ysEt/xNckEIyvRoqbKG4g7fx
	2FW3MrpZdpCHiRTI5OHXD6AD2j85wRwYgmHsbkstRnvReejAFc9xXEtxlDm7gtP8pjsimoqbZRHoN
	T2MDaVJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERDf-00000009Eof-2x5J;
	Mon, 12 May 2025 11:21:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQtU-00000009BiS-2SRV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 11:00:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 00F24629C6;
	Mon, 12 May 2025 11:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7EFC4CEEF;
	Mon, 12 May 2025 11:00:20 +0000 (UTC)
Date: Mon, 12 May 2025 12:00:17 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com
Subject: Re: [PATCH] arm64/mm: Disable barrier batching in interrupt contexts
Message-ID: <aCHUwZzeI6sEbg2T@arm.com>
References: <20250512102242.4156463-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512102242.4156463-1-ryan.roberts@arm.com>
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

On Mon, May 12, 2025 at 11:22:40AM +0100, Ryan Roberts wrote:
> Commit 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel
> mappings") enabled arm64 kernels to track "lazy mmu mode" using TIF
> flags in order to defer barriers until exiting the mode. At the same
> time, it added warnings to check that pte manipulations were never
> performed in interrupt context, because the tracking implementation
> could not deal with nesting.
> 
> But it turns out that some debug features (e.g. KFENCE, DEBUG_PAGEALLOC)
> do manipulate ptes in softirq context, which triggered the warnings.
> 
> So let's take the simplest and safest route and disable the batching
> optimization in interrupt contexts. This makes these users no worse off
> than prior to the optimization. Additionally the known offenders are
> debug features that only manipulate a single PTE, so there is no
> performance gain anyway.
> 
> There may be some obscure case of encrypted/decrypted DMA with the
> dma_free_coherent called from an interrupt context, but again, this is
> no worse off than prior to the commit.
> 
> Some options for supporting nesting were considered, but there is a
> difficult to solve problem if any code manipulates ptes within interrupt
> context but *outside of* a lazy mmu region. If this case exists, the
> code would expect the updates to be immediate, but because the task
> context may have already been in lazy mmu mode, the updates would be
> deferred, which could cause incorrect behaviour. This problem is avoided
> by always ensuring updates within interrupt context are immediate.
> 
> Fixes: 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel mappings")
> Reported-by: syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/linux-arm-kernel/681f2a09.050a0220.f2294.0006.GAE@google.com/
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

As per the request in the original report, please also add:

Reported-by: syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com

I'll give it a try as well with my configurations and let you know if
there are any problems. In the meantime:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

