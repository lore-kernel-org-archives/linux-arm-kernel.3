Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB16C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 10:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FVNjqM+zwy4QYexnpN/41yp4Y21cpzfvt2MhMZndR8w=; b=mzkA9RsdpsWtCnjDhljrDT5aV/
	oRVk1EqTyHJakCo2kFhLeGNEg2yoYiPeCunjjfB2cyFA4xYUjA3OFQsg3P50etIjOwLlOM6CfT1Hu
	bAnEJWPS0vFIGxzStGFlZeLMBcxOSmzpgsH199JRY99BCq3gV5kU4k0JxSPETZCxpslEyUr7oSMa1
	16Xe5VScvVfkD4z3AzUSz8sS7pDplkPSgOelkr6C8/jNhT9uK8f9Jw4KisC9gfajPSmF8RgzGXK0r
	vCw72UjDIg1/J6MHr2DN8CFWpWU+AcszJLjupqlUn/Pyvx20lmFgfTFFxwbwJvoPfwMVstkQMGJPz
	X1wqI8aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSd5-00000000TFJ-3t6N;
	Thu, 13 Aug 2026 10:25:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSd5-00000000TF3-0QnP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 10:25:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F7DC4068A;
	Thu, 13 Aug 2026 10:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C402D1F000E9;
	Thu, 13 Aug 2026 10:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786616742;
	bh=FVNjqM+zwy4QYexnpN/41yp4Y21cpzfvt2MhMZndR8w=;
	h=From:To:Cc:Subject:Date;
	b=aMbBUmmdjZgu5lCS1WS9hyBaTLJtu5WeLInClKtcETAgtdsa7oT78Xoo4MYmEWcMk
	 ce0CMx4pQSLjG/zl16WJ5eHQTGg/ULfDMsXRiu6aTjft7uODu51SJLodq2dDWjc2ZG
	 TxSsQnaqidxriuLm8klE37n3/8crAKvY6lRdMvkRPo/IW2u6HiNWljLK4uvFrefGlp
	 cgYugSEDYb0tcM5oA3lFaQj4Z5Q6GDz8mjd5aVi0mTyUPkq1f6592AItSK/PKG8uzh
	 9LzjYlThZCxpb1suwn2oG4sACwFRlHapPhhI3FJiloWVbbtz0tWBqcTwaZUMpZJkRW
	 SeyruFS2PkVLA==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev
Cc: Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	x86@kernel.org,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: [RFC PATCH v2 0/2] dma: swiotlb: Centralize default pool sizing
Date: Thu, 13 Aug 2026 15:55:19 +0530
Message-ID: <20260813102521.1367737-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Hi,

This series centralizes swiotlb default-pool initialization and sizing.

The first patch replaces the addressing-limit argument with initialization
flags. It also moves the reduced kmalloc-bounce sizing policy into the
swiotlb core.

The second patch centralizes swiotlb sizing for memory-encrypted systems.
It moves the existing x86 guest-sizing policy into the core. Host memory
encryption retains the normal pool size. A shared default pool is not
needed when a restricted DMA pool is present.

SWIOTLB_INIT_CC_SHARED keeps the first patch self-contained. It is removed
by the second patch when the policy moves into the core.

This series is based on the dma-mapping-for-next branch of:
https://git.kernel.org/pub/scm/linux/kernel/git/mszyprowski/linux.git

Aneesh Kumar K.V (Arm) (2):
  dma: swiotlb: Centralize default pool initialization and sizing
  dma: swiotlb: Initialize and size shared default pools for memory
    encryption

 arch/arm/mm/init.c                   |   6 +-
 arch/arm64/mm/init.c                 |  14 +---
 arch/loongarch/kernel/setup.c        |   2 +-
 arch/mips/cavium-octeon/dma-octeon.c |   2 +-
 arch/mips/loongson64/dma.c           |   2 +-
 arch/mips/sibyte/common/dma.c        |   2 +-
 arch/powerpc/kernel/dma-swiotlb.c    |   4 +-
 arch/powerpc/mm/mem.c                |  15 +++-
 arch/powerpc/platforms/pseries/svm.c |  10 ---
 arch/powerpc/sysdev/fsl_pci.c        |   1 +
 arch/riscv/mm/init.c                 |  18 +----
 arch/s390/mm/init.c                  |   2 +-
 arch/x86/include/asm/iommu.h         |   2 +
 arch/x86/kernel/amd_gart_64.c        |   1 +
 arch/x86/kernel/pci-dma.c            |  17 +++--
 arch/x86/mm/mem_encrypt.c            |  24 ------
 include/linux/swiotlb.h              |  10 ++-
 kernel/dma/swiotlb.c                 | 110 ++++++++++++++++++++++-----
 18 files changed, 146 insertions(+), 96 deletions(-)

-- 
2.43.0


