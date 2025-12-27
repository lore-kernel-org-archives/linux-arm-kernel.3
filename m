Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3794E9270E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 20:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qhT//OCVKwyR6gueWyV5xzfqvrNG0O1tZL6g1T1Z9M=; b=wP7BOWJufuyvam07lS4gH+HLQx
	wx+Ow2V70HbI92hVhlJw6UHABwyzoyfvfBXbCF3M51gecF8syyjful/1h/r1SjXK5kNvnyj1aVdGc
	fG7Nwg2cf5g2XXYIbY3B0IAuuqMnhJAa05zEqM/dgMHmP5Jc3Oc54GotEhk3mamV/Sa9sQcDtpVrh
	Pt9tX/fpCYmBCuYIaqxyNNRVwkbp0a4GKaMbQoErJ4TS7sDiNdeOIM2mCyI0OY5bwI2WQTWgzjY2e
	JXV3Jzl/IgtROXSwOfJlkHWDpTuaPXUxs2UQ0JtdhXGbJq5yeNAguCOMBHT6ZBbyFDowxqkUpznqQ
	YGENEGoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZag1-00000002Biq-16Er;
	Sat, 27 Dec 2025 20:14:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZafy-00000002BiT-2AUA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 20:14:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E7B164082A;
	Sat, 27 Dec 2025 20:14:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32314C4CEF1;
	Sat, 27 Dec 2025 20:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766866449;
	bh=5BvZzNPtiik1Rf2hGQJZuruUvtsWoa36oLJFsqbPeIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j8mX/F/qNxveAViAw3M67+ZlSkxoNkRKoE+i7UiDr/K8/lElkqvuc9vkn65DJgg01
	 pF5Pb5lIKx8k8SBZHzueiJEkrfAz9wVBYC3qQhGt74fNQZUGCOWAUc01JwaEYXMdpM
	 FJit8Tv20CSZzdYdRg0UZB+Yo9Gdf3qhLW7C+ke6SKiJj1zsi7T5LNOYlCoMCpxGoE
	 n5D4Asm3R6CzLphE/Xh5kr1cHps3f5Rhemo2HeOJTBRXD1DzwfYcZIWAAXNYWEBlih
	 bSMq1kRI2kpZ5c18WLkXj+BEo8HgxpRnn/JvRkD8SEbP8nnzGwzQaYj+Higdc0Svrv
	 VyCS4ZKkgq3bA==
Date: Sat, 27 Dec 2025 22:14:06 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH v2 6/8] dma-mapping: Support batch mode for
 dma_direct_{map,unmap}_sg
Message-ID: <20251227201406.GP11869@unreal>
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-7-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226225254.46197-7-21cnbao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_121410_575461_231DAAEA 
X-CRM114-Status: GOOD (  11.10  )
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
Cc: Tangquan Zheng <zhengtangquan@oppo.com>, Barry Song <baohua@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>, xen-devel@lists.xenproject.org, robin.murphy@arm.com, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Dec 27, 2025 at 11:52:46AM +1300, Barry Song wrote:
> From: Barry Song <baohua@kernel.org>
> 
> Leon suggested extending a flush argument to

Let's move this sentence out of the commit message and place it in the
changelog instead.

> dma_direct_unmap_phys(), dma_direct_map_phys(), and
> dma_direct_sync_single_for_cpu(). For single-buffer cases, this
> would use flush=true, while for SG cases flush=false would be
> used, followed by a single flush after all cache operations are
> issued in dma_direct_{map,unmap}_sg().
> 
> This ultimately benefits dma_map_sg() and dma_unmap_sg().
> 
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <baohua@kernel.org>
> ---
>  kernel/dma/direct.c  | 17 +++++++++++++----
>  kernel/dma/direct.h  | 16 ++++++++++------
>  kernel/dma/mapping.c |  6 +++---
>  3 files changed, 26 insertions(+), 13 deletions(-)

Thanks,
Reviewed-by: Leon Romanovsky <leon@kernel.org>

