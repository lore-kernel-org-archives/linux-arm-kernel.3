Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFFBCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 09:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bgfPlYm5NnLREwcTJMCLZzRzJFsxcYwx/hKPzErniI=; b=Q96+2w5tSSEi0XF48kI9X1Dd49
	+kZ7SKdgl0NIdS37iEUTIzjvttww5P0QsSoIy/TyCHnFyy798IYqjTlb7VkcN37pxl4wrj0rFoj/r
	m276SEjZ2Ufvx2NpFcqEgelmiroRRzGFNQlNY/5er7i4gc0c7aZI9I3gZZDs1yRrbc8zb+U+tykns
	9m4XSNvOjFELcn2rVlOsNhUYhLT40YcEEHMVWFHR10hhbTv6pxILUGniC3Ir8ETKuehBMGpO8DK5S
	4qGzTaR7fxWS++8GYrkh++3wLyYK1RP8VpQ4mx9tl+7HaJdeGFioHk3NW+rXeutPuKxIQQ1qb+5XP
	AtH7lSng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xZg-000000014Qe-2EfD;
	Wed, 15 Oct 2025 09:13:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xZe-000000014Mu-1odV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 09:13:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C98CB63BF7;
	Wed, 15 Oct 2025 09:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED5FC4CEF9;
	Wed, 15 Oct 2025 09:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519613;
	bh=20pkhPTluVu52SbPzmxmrTfHrn6yEtG7pWga+DsrWIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ig53rDzt8hiBzZZ+zdzkS7cx6K4XFlPakt74zliZ2VuFOxA/v+TKFBvFTWoou1sUN
	 q53E6CiOe35aym9Eqm8SnAer8W1OFJFVkHe3wWEFH4Ithjt31CpiK1AAPn+wYcvsWw
	 LMgdDn2fvxI1mJluK4lYZ292gEC9pr+xl8CZRpwwmz64D7xTeEPTRhwbKU6VeCcRVk
	 LtLSCMxyCZQlEPmtLI/pgkfz+kbl+r9ceDLpdIznTuwex+mPkjdDZ9f8md8PKxM9C4
	 eroP4W9zJU2vT9cO8vlBtQn8KWZOrYYGD9/qePUDi07GGe7B84+AoJ0M7EyrOLjuu+
	 lNptFD7tgV7qw==
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
Subject: [PATCH v5 08/14] MIPS/jazzdma: Provide physical address directly
Date: Wed, 15 Oct 2025 12:12:54 +0300
Message-ID: <20251015-remove-map-page-v5-8-3bbfe3a25cdf@kernel.org>
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

MIPS jazz uses physical addresses for mapping pages, so convert
it to get them directly from DMA mapping routine.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/mips/jazz/jazzdma.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/mips/jazz/jazzdma.c b/arch/mips/jazz/jazzdma.c
index c97b089b9902..eb9fb2f2a720 100644
--- a/arch/mips/jazz/jazzdma.c
+++ b/arch/mips/jazz/jazzdma.c
@@ -521,18 +521,24 @@ static void jazz_dma_free(struct device *dev, size_t size, void *vaddr,
 	__free_pages(virt_to_page(vaddr), get_order(size));
 }
 
-static dma_addr_t jazz_dma_map_page(struct device *dev, struct page *page,
-		unsigned long offset, size_t size, enum dma_data_direction dir,
-		unsigned long attrs)
+static dma_addr_t jazz_dma_map_phys(struct device *dev, phys_addr_t phys,
+		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
-	phys_addr_t phys = page_to_phys(page) + offset;
+	if (unlikely(attrs & DMA_ATTR_MMIO))
+		/*
+		 * This check is included because older versions of the code lacked
+		 * MMIO path support, and my ability to test this path is limited.
+		 * However, from a software technical standpoint, there is no restriction,
+		 * as the following code operates solely on physical addresses.
+		 */
+		return DMA_MAPPING_ERROR;
 
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
 		arch_sync_dma_for_device(phys, size, dir);
 	return vdma_alloc(phys, size);
 }
 
-static void jazz_dma_unmap_page(struct device *dev, dma_addr_t dma_addr,
+static void jazz_dma_unmap_phys(struct device *dev, dma_addr_t dma_addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
@@ -607,8 +613,8 @@ static void jazz_dma_sync_sg_for_cpu(struct device *dev,
 const struct dma_map_ops jazz_dma_ops = {
 	.alloc			= jazz_dma_alloc,
 	.free			= jazz_dma_free,
-	.map_page		= jazz_dma_map_page,
-	.unmap_page		= jazz_dma_unmap_page,
+	.map_phys		= jazz_dma_map_phys,
+	.unmap_phys		= jazz_dma_unmap_phys,
 	.map_sg			= jazz_dma_map_sg,
 	.unmap_sg		= jazz_dma_unmap_sg,
 	.sync_single_for_cpu	= jazz_dma_sync_single_for_cpu,

-- 
2.51.0


