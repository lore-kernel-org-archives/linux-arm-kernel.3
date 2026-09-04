Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43EFC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/zkAw0Mk8GkqlqvyS44GmVtI+30wAgQRZHaj1Ir4nIo=; b=uECisZiVsWMuFc+TxuwRTNRwLI
	GRrPgmiLtkJNT8P+P5txaIOkg9n8jxe3kw6JViE2MCTx311/pVo3SlPgvf8V0saaP6AlgXkoXjpii
	/MiQsKP4+fuycMq94OJFvHKrAwCyII3h2R5+yqpSMDmL+KGx8altWJTWJageRJDU2MSBZZ+W0XDFF
	D+5B4xsLvHOzHPROFyRA3B0pT3UKPWkAI6xVSbki9VgzyablbKzxTtmkFMtvbkA3fPEj0+DMY7jmL
	kmZ67ULDTyEefJuhZSqcFdfYpyGdhsnBwkp8nASJsh4BixEzoHKXqsU9MyVmCyW0WStRhGIGjXTcO
	EnqLQCgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RGN-00000001gQm-2RVE;
	Fri, 04 Sep 2026 10:35:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RGM-00000001gQA-10aH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:35:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AEC096020C;
	Fri,  4 Sep 2026 10:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED601F00A3D;
	Fri,  4 Sep 2026 10:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788518113;
	bh=/zkAw0Mk8GkqlqvyS44GmVtI+30wAgQRZHaj1Ir4nIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=erlD1+uDMTvmkBHPQ5hx5RxALAbZgQ13+Sb+kS0mqKvW7e5jYGpWWh2xzNUnu5uQJ
	 ZSg4GPscYVOTRBVXtgSOMUOVhAXCNypcXz91wqLI6MFAljeyFJMMmQjY9Egjfglg/9
	 k18YENiUpf1s3FOlaeQIMHjByg4dWZuwV1IIejRmuf0Ci3I4oS3MxKB7jSNR/c/6uK
	 /utYsfZCevfUSnXx8MMabqlPwhTWfy0vzD4LW1mB+OiHQF+YCF0KpnVi7hUs3iLdj5
	 5jX39qFoUpal0uFMDTOyaYv4Q1U0DERYHFB/cfddGK0X7rl8ubamTFMUByU28RWSEx
	 pKFHjYeYUzPkA==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v6 2/9] irqchip/gic-v3-its: Align shared ITS allocations to the CoCo shared granule size
Date: Fri,  4 Sep 2026 16:04:45 +0530
Message-ID: <20260904103452.1197239-3-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
References: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
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

ITS tables allocated by the coco guest are shared with the hypervisor.
These allocations must satisfy the host shared-buffer granule size so that
the full converted range is safe for host access.

Allocate ITS pages using a size rounded up to the shared granule size and
use the same allocation order when encrypting, decrypting and freeing the
memory. Also grow the ITT cache in shared-granule sized chunks instead of
assuming PAGE_SIZE is sufficient.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/irqchip/irq-gic-v3-its.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index e9807af23537..98d8fccbf0f2 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -216,6 +216,7 @@ static struct page *its_alloc_pages_node(int node, gfp_t gfp,
 	struct page *page;
 	int ret = 0;
 
+	order = get_order(mem_cc_align_to_shared_granule(PAGE_SIZE << order));
 	page = alloc_pages_node(node, gfp | gfp_flags_quirk, order);
 
 	if (!page)
@@ -241,6 +242,8 @@ static struct page *its_alloc_pages(gfp_t gfp, unsigned int order)
 
 static void its_free_pages(void *addr, unsigned int order)
 {
+
+	order = get_order(mem_cc_align_to_shared_granule(PAGE_SIZE << order));
 	/*
 	 * If the memory cannot be encrypted again then we must leak the pages.
 	 * set_memory_encrypted() will already have WARNed.
@@ -272,7 +275,8 @@ static void *itt_alloc_pool(int node, int size)
 		if (!page)
 			break;
 
-		gen_pool_add(itt_pool, (unsigned long)page_address(page), PAGE_SIZE, node);
+		gen_pool_add(itt_pool, (unsigned long)page_address(page),
+			     mem_cc_align_to_shared_granule(PAGE_SIZE), node);
 	} while (!addr);
 
 	return (void *)addr;
-- 
2.43.0


