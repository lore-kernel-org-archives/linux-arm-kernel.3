Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF23CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61cm65tTBt8gA6EzsR6TozmSlJ9MaKD7Rm9rRfskrNw=; b=SRmty995ntzy1VOwjlwZWV96mK
	ArT/RDPPWIxDIWNthOYTKlN2DFZui2ZPa9JdoBtlmBU8mVHFHZtywQpXujqbURQoCfzi+39yujk8A
	f0zyRdDpVPgbvwDmpGoXb5cRlR3hts1GoyS3wudzmermiW242e+/5UNsDmYmyWukcbo33aU2IXgWm
	tm9wx9Vdz3eHKGHp1htm943ewTABCkIaWd+HpbjXpOZ2GwqRM05B6M5vQ+Gbb7ecdyAExlivY4GIT
	ejfr56oyWb0Lv7r4nUI8EjvUjTSHrCbEHiAsk/8Idw7kYgkhFPPT9zhThT+7/vSxIbEMTHRop8Bzw
	sH13pCOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulriK-0000000BI6o-1iba;
	Tue, 12 Aug 2025 16:19:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulmCK-0000000AVSY-0WLz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 10:25:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5DE5A5C55F1;
	Tue, 12 Aug 2025 10:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60766C4CEF0;
	Tue, 12 Aug 2025 10:25:35 +0000 (UTC)
Date: Tue, 12 Aug 2025 11:25:33 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Gavin Shan <gshan@redhat.com>,
	Mike Rapoport <rppt@kernel.org>, Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>, Dev Jain <dev.jain@arm.com>,
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2] dma/pool: Ensure DMA_DIRECT_REMAP allocations are
 decrypted
Message-ID: <aJsWnSm7un-EUmed@arm.com>
References: <20250811181759.998805-1-sdonthineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811181759.998805-1-sdonthineni@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_032540_200098_A8435B73 
X-CRM114-Status: GOOD (  12.11  )
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

On Mon, Aug 11, 2025 at 01:17:59PM -0500, Shanker Donthineni wrote:
> When CONFIG_DMA_DIRECT_REMAP is enabled, atomic pool pages are
> remapped via dma_common_contiguous_remap() using the supplied
> pgprot. Currently, the mapping uses
> pgprot_dmacoherent(PAGE_KERNEL), which leaves the memory encrypted
> on systems with memory encryption enabled (e.g., ARM CCA Realms).
> 
> This can cause the DMA layer to fail or crash when accessing the
> memory, as the underlying physical pages are not configured as
> expected.
> 
> Fix this by requesting a decrypted mapping in the vmap() call:
> pgprot_decrypted(pgprot_dmacoherent(PAGE_KERNEL))
> 
> This ensures that atomic pool memory is consistently mapped
> unencrypted.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

