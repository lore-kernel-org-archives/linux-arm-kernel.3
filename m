Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F34DCD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 04:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRoOTjIXEIfZY33xB/HfCrHMNoIMuz43xHMqdbl/MXA=; b=m+HyeXxu2xNGTOTF17jhyanPkB
	Shti9h3sB/Od5ii6cPRaH3OZgcGucHkg8neIT1tTEY47Ph3/0AohexTrUdknVgW3KFuBXLc+A3YSo
	JNYVY8zFHFTP58NEcB/HvkcmbydQto3/qyBiePGsSEUco2Lhqk318w4lnViB2G6l+8TIaWOwJ4JWp
	1L/XdaFMHmprA0m4NFxhHgDr50ck1Fi9G4aVX6zOwOM3xyriPTiD15ITIKxfxqaAKZHsJ4bFp4BzJ
	FmVOhsreb48EbbSk4DmVDauz5tDf1oVyvmGIvZZX0j9fC/YVih55EDtjzEildUQBEhhMzc+kc4tu4
	BMszegwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQHXP-00000009kad-1RNI;
	Fri, 22 May 2026 04:31:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQHXO-00000009ka0-0n89
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 04:31:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A08E560172;
	Fri, 22 May 2026 04:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295411F00A3D;
	Fri, 22 May 2026 04:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779424265;
	bh=BRoOTjIXEIfZY33xB/HfCrHMNoIMuz43xHMqdbl/MXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QJqOdGXUzoeK/2txik8hoWdiGyYw3ctMEtyPvywn3Wu8DCk3sMglax3QlyOPFYUVm
	 8R8/BKN2Pb5a9JjZcGIh2+8jAI+HZzKk1myOUuKKFuVs4/Xi969HK3/F0ktmoU8hwr
	 vQazAEaw5n9TwQ9VvmkrjlczEPvakOpbQd3Z69nW22XSfcxfiRCFxQkyRiwzUbM56D
	 Wrsqr4HHYb8mXz7NwrbgrDRNxbXy9s3hw+8PPcBENymcvkPLcF6Jwfzh3kTnal2jDl
	 xMuN2HcG+gwdFOdUIPxeDkD4gKLcj/208Gaf84OvuNRB0uDd08BUx/z1Db+drjlkGm
	 c2tylJmWR1M+A==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
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
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	x86@kernel.org
Subject: [PATCH v5 13/20] dma-pool: fix page leak in atomic_pool_expand() cleanup
Date: Fri, 22 May 2026 09:58:08 +0530
Message-ID: <20260522042815.370873-14-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522042815.370873-1-aneesh.kumar@kernel.org>
References: <20260522042815.370873-1-aneesh.kumar@kernel.org>
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

atomic_pool_expand() frees the allocated pages from the remove_mapping
error path only when CONFIG_DMA_DIRECT_REMAP is enabled.

When CONFIG_DMA_DIRECT_REMAP is disabled, failures after page allocation,
such as gen_pool_add_virt(), jump to remove_mapping and return without
freeing the pages.

Move __free_pages(page, order) out of the CONFIG_DMA_DIRECT_REMAP block so
that cleanup paths always release the allocation.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 kernel/dma/pool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
index be78474a6c49..e7df8d279e75 100644
--- a/kernel/dma/pool.c
+++ b/kernel/dma/pool.c
@@ -146,9 +146,9 @@ static int atomic_pool_expand(struct dma_gen_pool *dma_pool, size_t pool_size,
 #ifdef CONFIG_DMA_DIRECT_REMAP
 	dma_common_free_remap(addr, pool_size);
 free_page:
+#endif
 	if (!leak_pages)
 		__free_pages(page, order);
-#endif
 out:
 	return ret;
 }
-- 
2.43.0


