Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9D8CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 09:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AK5JNO+tk0EUNoLAagtlVnkvBynllSeAX1mkYPchUeo=; b=wIIycOxa6SGXoFnApL96ctI4Z+
	ccEKyMX1/n3ZiIJrPy0zJSgpxpD/9BPpegUINTQXRI4TvZNRP6vBPyVP0p5OeCrR+fHBvsY26C7mR
	HBWMJhYU91JUNDCj0rnIwI3I1zpVoCLdENQve8NP3Gpw0g69kHyKYCYdoE9Zj9nHo+c01n1L1pBwQ
	k5gSHgjCU5ynmmP8WIAU51sgJyaU9pxTc7Q8luDlvzlxJYoYiUwhY6zydOEv708zwl1T599Z28JfO
	J99zORQH7YAzayMVTqYNxbZWxuUEfjKWbetGQqEzctrm1v8qpTuP0ayeFQS4KIk7Fj8nGEYeCqeOw
	MzrG1Zcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xZI-0000000140N-0ghk;
	Wed, 15 Oct 2025 09:13:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xZF-000000013zg-13E0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 09:13:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D36264172E;
	Wed, 15 Oct 2025 09:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5DDC4CEF8;
	Wed, 15 Oct 2025 09:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519588;
	bh=ywR7wdHo9iJDPAMnOLxx2KSfcpdMYgaVYoeQgeEMVE0=;
	h=From:To:Cc:Subject:Date:From;
	b=T/fn/Q7Et3W/XoUP2+BW/BncjyLdn9Q59dx4I+uKrVGVx83N3CoqpvJHFxWuqRsC+
	 XdbXTMel6OirvBhxiFjPLifrL1qZ1WA1GV0CfnbnyJ0gLcqjgJlrUBUk085bytleC1
	 Ps1/U8qadzNDPEXTFtbAw3rfhPCKp+JJvyNHVNWiVzxBuTqLX4e1h0uwpfnG6FXSGu
	 ahv0t+DTPlJs6QFO33ojzLxd9DpyMUAoYg7u/ZEvqC360GdrnKWc4kvzqrKjjOzNyu
	 sfpnfCdbcfzoWkUMqnORIpnF4VZ9xrYID8Bc3PCTstBRCa5sVe3z7x9f1ejmwsSTxY
	 9ePteT4berpfg==
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
	Magnus Lindholm <linmag7@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: [PATCH v5 00/14] Remove DMA map_page/map_resource and their unmap callbacks
Date: Wed, 15 Oct 2025 12:12:46 +0300
Message-ID: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251015-remove-map-page-a28302e6cc7d
X-Mailer: b4 0.15-dev
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_021309_511212_08003681 
X-CRM114-Status: GOOD (  11.86  )
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

This series is a combination of previous two steps [1, 2] to reduce
number of accesses to struct page in the code "below" DMA layer.

In this series, the DMA .map_page/.map_resource/.unmap_page/.unmap_resource
callbacks are converted to newly introduced .map_phys/.unmap_phys interfaces.

Thanks

[1] https://lore.kernel.org/all/cover.1758203802.git.leon@kernel.org
[2] https://lore.kernel.org/all/cover.1759071169.git.leon@kernel.org

---
Leon Romanovsky (14):
      dma-mapping: prepare dma_map_ops to conversion to physical address
      dma-mapping: convert dummy ops to physical address mapping
      ARM: dma-mapping: Reduce struct page exposure in arch_sync_dma*()
      ARM: dma-mapping: Switch to physical address mapping callbacks
      xen: swiotlb: Switch to physical address mapping callbacks
      dma-mapping: remove unused mapping resource callbacks
      alpha: Convert mapping routine to rely on physical address
      MIPS/jazzdma: Provide physical address directly
      parisc: Convert DMA map_page to map_phys interface
      powerpc: Convert to physical address DMA mapping
      sparc: Use physical address DMA mapping
      x86: Use physical address for DMA mapping
      xen: swiotlb: Convert mapping routine to rely on physical address
      dma-mapping: remove unused map_page callback

 arch/alpha/kernel/pci_iommu.c            |  48 ++++-----
 arch/arm/mm/dma-mapping.c                | 180 +++++++++----------------------
 arch/mips/jazz/jazzdma.c                 |  20 ++--
 arch/powerpc/include/asm/iommu.h         |   8 +-
 arch/powerpc/kernel/dma-iommu.c          |  22 ++--
 arch/powerpc/kernel/iommu.c              |  14 +--
 arch/powerpc/platforms/ps3/system-bus.c  |  33 +++---
 arch/powerpc/platforms/pseries/ibmebus.c |  15 +--
 arch/powerpc/platforms/pseries/vio.c     |  21 ++--
 arch/sparc/kernel/iommu.c                |  30 ++++--
 arch/sparc/kernel/pci_sun4v.c            |  31 +++---
 arch/sparc/mm/io-unit.c                  |  38 +++----
 arch/sparc/mm/iommu.c                    |  46 ++++----
 arch/x86/kernel/amd_gart_64.c            |  19 ++--
 drivers/parisc/ccio-dma.c                |  54 +++++-----
 drivers/parisc/iommu-helpers.h           |  10 +-
 drivers/parisc/sba_iommu.c               |  54 +++++-----
 drivers/xen/grant-dma-ops.c              |  20 ++--
 drivers/xen/swiotlb-xen.c                |  63 +++++------
 include/linux/dma-map-ops.h              |  14 +--
 kernel/dma/dummy.c                       |  13 ++-
 kernel/dma/mapping.c                     |  26 +----
 kernel/dma/ops_helpers.c                 |  12 ++-
 23 files changed, 361 insertions(+), 430 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251015-remove-map-page-a28302e6cc7d

Best regards,
--  
Leon Romanovsky <leon@kernel.org>


