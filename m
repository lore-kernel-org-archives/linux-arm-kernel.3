Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E84CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 09:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eE1FTCbPJO6F8EueDMdWrrKJfVX8OHMOkIhf47nagtE=; b=dS5OufeRsCWx1wIUW+mC7XnC8v
	h7qHz8AOatw6YoDNRR1H6gHYThxhbFrs9x32pd/5QvCN+j6G1B69akFNCn/vLUwGKf3LXNc4ZFzTx
	aQS409Evd10faBVKrNa+HJexBkz7eD/knql/LRcQTPllNo3ragK6oV++uYP+gcRS9xzJsjmNcl6Wm
	aZaB4d0ifGdXYEzKroZIQS3iuKMdQzdnzF/W7DIRY7N4Nc3pLUgPOct0ZMdIG0xEiSpnxYrt0YqNE
	bdjT+BfQEAOReX82UIqBP9Z0cuUX3N+Jg9h7tzMmxlY4v7m6JFQNcV+cz0HvuQ1KdZDvg+DtgvvtE
	So5Vba8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xZK-00000001423-49gr;
	Wed, 15 Oct 2025 09:13:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xZJ-00000001419-0wEA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 09:13:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 808BC62555;
	Wed, 15 Oct 2025 09:13:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E0DC4CEF9;
	Wed, 15 Oct 2025 09:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519592;
	bh=fj+wjstxPuu4pe6Ir9X+TCy/RdK5uIxhfZIK9PjQE3s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oQijT4BYDA7G26UJzNdP8FR+Sso17sVT6tLq404JDkxEXIL0SNUGgqKnqLAytRMDc
	 ybAzgl7PHHhZyg6HwZsrKBErF8H9uQdAB918IqBZI2EmZsuuLeHmRsIh/x/CMRPuW/
	 hbuFpAnoTb56m0BmBdt1IW2nKqXOiKg+vIQfCq+mZUZ52Ics6N2shnm0co1H8Ntqpo
	 tYykaD+29yiu12+E8zdxTGe/nfssPj1oRKuBWWpNG9ywOgTVIfeN4yGPnr+Uab0knw
	 e+80KUPBDOcAIVqRMB21aCnj3es2K2B3WII0PdnnK8Q2Rvik9Y2ZxaH3Zx9omBBGbj
	 LHFZbbKctgdsw==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-alpha@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v5 02/14] dma-mapping: convert dummy ops to physical address mapping
Date: Wed, 15 Oct 2025 12:12:48 +0300
Message-ID: <20251015-remove-map-page-v5-2-3bbfe3a25cdf@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev
Content-Transfer-Encoding: 8bit
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

From: Leon Romanovsky <leonro@nvidia.com>

Change dma_dummy_map_page and dma_dummy_unmap_page routines
to accept physical address and rename them.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 kernel/dma/dummy.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/kernel/dma/dummy.c b/kernel/dma/dummy.c
index 92de80e5b057..16a51736a2a3 100644
--- a/kernel/dma/dummy.c
+++ b/kernel/dma/dummy.c
@@ -11,17 +11,16 @@ static int dma_dummy_mmap(struct device *dev, struct vm_area_struct *vma,
 	return -ENXIO;
 }
 
-static dma_addr_t dma_dummy_map_page(struct device *dev, struct page *page,
-		unsigned long offset, size_t size, enum dma_data_direction dir,
-		unsigned long attrs)
+static dma_addr_t dma_dummy_map_phys(struct device *dev, phys_addr_t phys,
+		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	return DMA_MAPPING_ERROR;
 }
-static void dma_dummy_unmap_page(struct device *dev, dma_addr_t dma_handle,
+static void dma_dummy_unmap_phys(struct device *dev, dma_addr_t dma_handle,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	/*
-	 * Dummy ops doesn't support map_page, so unmap_page should never be
+	 * Dummy ops doesn't support map_phys, so unmap_page should never be
 	 * called.
 	 */
 	WARN_ON_ONCE(true);
@@ -51,8 +50,8 @@ static int dma_dummy_supported(struct device *hwdev, u64 mask)
 
 const struct dma_map_ops dma_dummy_ops = {
 	.mmap                   = dma_dummy_mmap,
-	.map_page               = dma_dummy_map_page,
-	.unmap_page             = dma_dummy_unmap_page,
+	.map_phys               = dma_dummy_map_phys,
+	.unmap_phys             = dma_dummy_unmap_phys,
 	.map_sg                 = dma_dummy_map_sg,
 	.unmap_sg               = dma_dummy_unmap_sg,
 	.dma_supported          = dma_dummy_supported,

-- 
2.51.0


