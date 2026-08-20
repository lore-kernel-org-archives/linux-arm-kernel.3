Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50765C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 15:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=htcCbVVcpzr9rnqnqD+2JN+oKGyPIFBjYCVbhT/SsbE=; b=3Nv1te0lWeBdxk86zYZ0sDQDuI
	VwPM8LFHwpAGs1PT2mMhNFIo9RaWRLNPcIQNocxGULJLUd9IS5YzSRmqHjLk2HN0bfEZa2LwjEULf
	q0Ai4C0X4vqkTDpvZQvnm/Ulo0rXBgB3Y+3M+tKv+Lk+yi5ahp8qOg3SMThQjagrLun7ve0OQLjKY
	KiJFHBMb55aj9MUZYPJ9apePoigc3rDjZvOWIOwhbu3oEhCPkkQUBWcZa9smFu5vAt5WpDcQxgEVu
	cvFUptQx5YRhh8C3ZgZvLM+hxBV20jMzusGof4YB/WYCjR6kShf2661vVFiVjK+1jFsw9G8KBdOjP
	KgyBFpbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4GT-0000000BlK4-1Qiz;
	Thu, 20 Aug 2026 15:01:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4GK-0000000BlHO-0k6G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 15:01:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EED5A153B;
	Thu, 20 Aug 2026 08:00:54 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 220C63F85F;
	Thu, 20 Aug 2026 08:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787238058; bh=W39nx0xUvQJFDw697gXlKmqlgDRLETj5+HJFQQSKQkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AjxZSDWaR3zUDofIoYP4OkhXqP2BE1MDLKVayMvkr6CkpeiVhTModGpFIXVU5R3m9
	 UZG3h8VXUUc7GRZcLrcnLXZEO2ukRZ2b9md9B3SS1FWqF/7jup+TGut3iatGo3wvqH
	 wZnOou0gPsmodKHI9OY3VmAQrwZQtfXDjkBQM0GU=
From: Steven Price <steven.price@arm.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Marc Zyngier <maz@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Steven Price <steven.price@arm.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jiri Pirko <jiri@resnulli.us>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v2 2/4] irqchip/gic-v3-its: Allocate VPE tables from sleepable context
Date: Thu, 20 Aug 2026 16:00:31 +0100
Message-ID: <20260820150034.88729-3-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820150034.88729-1-steven.price@arm.com>
References: <20260820150034.88729-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_080100_313095_A0A0F850 
X-CRM114-Status: GOOD (  14.99  )
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

The VPE L1 table is allocated from the CPU-starting hotplug state,
where interrupts are disabled. Although the page allocation uses
GFP_ATOMIC, its_alloc_pages() subsequently calls
set_memory_decrypted(), which can sleep while splitting the arm64
linear map.

Move the allocation to the existing CPU-online callback, which runs in
sleepable context, and use GFP_KERNEL for both allocations performed
there. Register the callback even without EFI, since it is now also
responsible for VPE table allocation.

Fixes: b08e2f42e86b ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index a055837832bc..71515dbff9ec 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -2932,7 +2932,7 @@ static int allocate_vpe_l1_table(void)
 	if (val & GICR_VPROPBASER_4_1_VALID)
 		goto out;
 
-	gic_data_rdist()->vpe_table_mask = kzalloc_obj(cpumask_t, GFP_ATOMIC);
+	gic_data_rdist()->vpe_table_mask = kzalloc_obj(cpumask_t, GFP_KERNEL);
 	if (!gic_data_rdist()->vpe_table_mask)
 		return -ENOMEM;
 
@@ -2999,7 +2999,7 @@ static int allocate_vpe_l1_table(void)
 
 	pr_debug("np = %d, npg = %lld, psz = %d, epp = %d, esz = %d\n",
 		 np, npg, psz, epp, esz);
-	page = its_alloc_pages(GFP_ATOMIC | __GFP_ZERO, get_order(np * PAGE_SIZE));
+	page = its_alloc_pages(GFP_KERNEL | __GFP_ZERO, get_order(np * PAGE_SIZE));
 	if (!page)
 		return -ENOMEM;
 
@@ -3268,16 +3268,6 @@ static void its_cpu_init_lpis(void)
 		val = its_clear_vpend_valid(vlpi_base, 0, 0);
 	}
 
-	if (allocate_vpe_l1_table()) {
-		/*
-		 * If the allocation has failed, we're in massive trouble.
-		 * Disable direct injection, and pray that no VM was
-		 * already running...
-		 */
-		gic_rdists->has_rvpeid = false;
-		gic_rdists->has_vlpis = false;
-	}
-
 	/* Make sure the GIC has seen the above */
 	dsb(sy);
 	gic_data_rdist()->flags |= RD_LOCAL_LPI_ENABLED;
@@ -5452,6 +5442,19 @@ static int its_cpu_memreserve_lpi(unsigned int cpu)
 	if (gic_data_rdist()->flags & RD_LOCAL_MEMRESERVE_DONE)
 		return 0;
 
+	if (allocate_vpe_l1_table()) {
+		/*
+		 * If the allocation has failed, we're in massive trouble.
+		 * Disable direct injection, and pray that no VM was
+		 * already running...
+		 */
+		gic_rdists->has_rvpeid = false;
+		gic_rdists->has_vlpis = false;
+	}
+
+	if (!efi_enabled(EFI_CONFIG_TABLES))
+		goto out;
+
 	pend_page = gic_data_rdist()->pend_page;
 	if (WARN_ON(!pend_page)) {
 		ret = -ENOMEM;
@@ -5793,9 +5796,6 @@ int __init its_lpi_memreserve_init(void)
 {
 	int state;
 
-	if (!efi_enabled(EFI_CONFIG_TABLES))
-		return 0;
-
 	if (list_empty(&its_nodes))
 		return 0;
 
-- 
2.43.0


