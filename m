Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987AFCD4855
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 09:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=piaqFytxUkR7fwUD1Gmkhx+SmTmed3hfV993jUzNySY=; b=g7KVAAXHX+e7NWSd5rkX23lKek
	6lLBzTKhJ6vkTAWcheSIO1Ih4425bNd7rVpRffu3st+9z71doZdjXoWZdlwJM78dqSyaRaJFIYnIE
	XerlK6fKGkXDyHb8VQ+Hc56eRI7a1Ot9Hz/ePwV5KtMe3PBP/2+xYv8dMwhrP5TSBx0XVDRegrM5q
	c5TORhkSZ+CIW4uSA6Q5T8zq0yco1tuOrU04Q3bhaK+ERX+K7G5JJrc7bhORL9I9I6XCHwxzX8uXz
	lw41pMDi7CWM3AGQg3nlZuFULBq5ucZo/38xRKVuLvsvwsYlzZE93R1xoi3r0NsBu+Pe5Pp2WId1X
	bc/g4gSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMj4Q-0000000GCMs-2duN;
	Tue, 12 May 2026 09:06:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMj4P-0000000GCLq-1Bho
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 09:06:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8141600CB;
	Tue, 12 May 2026 09:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C140BC2BCC7;
	Tue, 12 May 2026 09:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778576788;
	bh=veSEmK9Ug4szH3v0qgbFOODgpY5EJGxq5OFtSmQEZoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hfEmbaD1vx0OtPyt/2zEwcfXvzz2enHIUHpU/ddgBvzPmsG0FKkM8cGvnL6yBHpxk
	 4jHpHHoYShzlZH9rztYvxJBggVXmDlGdmaU2VTP1Twa68ti+ABZKBLBjOyGE2Glmva
	 4eLsOWHe3HEgbKtQeVTPtBwyxACwv0llrWmj024jJKEohKuYvakIwLhtsSCD/y7/Z+
	 0Alxpd03yhdikbAyeOllS8BT/tFi2PamwbpCUvLLoPmv81EyPHdPMxORvnuulZP/8B
	 v3ozOATeqYxIv/FKeuK5uxsHLgCPQeZgin3CqA4AOi9eOLu3iXFg7ZWbifu1AU0/gT
	 cmtPif0ZHnFIw==
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
Subject: [PATCH v4 10/13] dma-pool: fix page leak in atomic_pool_expand() cleanup
Date: Tue, 12 May 2026 14:34:05 +0530
Message-ID: <20260512090408.794195-11-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512090408.794195-1-aneesh.kumar@kernel.org>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
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
index 75f0eba48a23..5abd30c5119f 100644
--- a/kernel/dma/pool.c
+++ b/kernel/dma/pool.c
@@ -149,8 +149,8 @@ static int atomic_pool_expand(struct dma_gen_pool *dma_pool, size_t pool_size,
 #ifdef CONFIG_DMA_DIRECT_REMAP
 	dma_common_free_remap(addr, pool_size);
 free_page:
-	__free_pages(page, order);
 #endif
+	__free_pages(page, order);
 out:
 	return ret;
 }
-- 
2.43.0


