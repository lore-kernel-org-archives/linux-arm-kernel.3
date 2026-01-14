Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FEBD31A0F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 05:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n5KJ7xfoSy75xmhqBg1REdpcmm4WLMDw6b5oCQ6qgV4=; b=KJpjEw1V0htIuH4iYytSe/qoeX
	0SHGFqrvqAU+0gTlpFfNfelzHAhEJIniqWbxnHApsrmSpSHbNKlaV1cHbwOfk9qsauFPKM2ZU0aWt
	clrKENeHvbY6NiGZQLmX/nREl1sLtToocsZ26csI1FVnN7Y9O3oPXxK7N4MoB1Q7XrhOo3AteSWJp
	D7A/Fo3TjVwmZ8pdX+LTp3OTbYw7yc4s8h/MiVopeITaiWtglvW6PV0hSqd2xlYJmnr1KDBXUVzd7
	PuRSg5otjxGKAqj6Ut9/kU5ZxtJ+7Tc7QLpeBMBV53ABPjVzKJHeJKOQ8jGtdDF7Ad70X8uNGawS1
	q/lVF0/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vftED-000000085Dr-0wK7;
	Wed, 14 Jan 2026 05:15:33 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vftEA-000000085DZ-3PmH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 05:15:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1768367725; bh=JWtyRdM+P6tjlZl/Fi7+mI2HKpt62sZAbA5v+QE1ZTY=;
	h=From:To:Cc:Subject:Date:From;
	b=Nzkb9AkztrrBUgW2G58ZUWxQ/L1uLbAF58+7XtReHjwaiqMMuf7XEki1rjxx3STZo
	 SxflWxzL6wpz60h4/qNThmCEqNVfUMgTEgV44sKEwFWELJdxfqOHlg/IpdehWmBK1V
	 X0U54QNwUobdmmmhe7HonN++7ZzdaR2kY6cfmMFqZsvo+rUgaafMf/qGYVBpeWIzin
	 B4TpbqElMW3NNrWEOMKTmxV6+Vhw4Sn/PmO9VVUEd0EV7zQbgCzHVOIpAjcWnANWko
	 ysTIVL86wY9LKW7txjYGhvJ6DPDevG0kTsU3orCWuxRISIs4GAk2vGpp9iFAvhLE8p
	 62+XWcgM9GCpw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id C68123EC67A;
	Wed, 14 Jan 2026 05:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1768367725; bh=JWtyRdM+P6tjlZl/Fi7+mI2HKpt62sZAbA5v+QE1ZTY=;
	h=From:To:Cc:Subject:Date:From;
	b=Nzkb9AkztrrBUgW2G58ZUWxQ/L1uLbAF58+7XtReHjwaiqMMuf7XEki1rjxx3STZo
	 SxflWxzL6wpz60h4/qNThmCEqNVfUMgTEgV44sKEwFWELJdxfqOHlg/IpdehWmBK1V
	 X0U54QNwUobdmmmhe7HonN++7ZzdaR2kY6cfmMFqZsvo+rUgaafMf/qGYVBpeWIzin
	 B4TpbqElMW3NNrWEOMKTmxV6+Vhw4Sn/PmO9VVUEd0EV7zQbgCzHVOIpAjcWnANWko
	 ysTIVL86wY9LKW7txjYGhvJ6DPDevG0kTsU3orCWuxRISIs4GAk2vGpp9iFAvhLE8p
	 62+XWcgM9GCpw==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 63B083EC06A;
	Wed, 14 Jan 2026 05:15:25 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Vinod Koul <vkoul@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org
Subject: [PATCH] dma: iop32x-adma: Remove a leftover header file
Date: Wed, 14 Jan 2026 07:14:58 +0200
Message-ID: <20260114051508.3908807-1-vz@mleia.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260114_051525_831279_E0BE60B8 
X-CRM114-Status: GOOD (  13.68  )
/bin/ln: failed to access 'reaver_cache/texts/20260114_051525_831279_E0BE60B8': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_051525_831279_E0BE60B8 
X-CRM114-Status: GOOD (  14.22  )
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

The Intel IOPx3xx platform was completely removed in commit b91a69d162aa
("ARM: iop32x: remove the platform"), and it'd be safe to remove an unused
and leftover platform data specific header file dma-iop32x.h also.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 include/linux/platform_data/dma-iop32x.h | 110 -----------------------
 1 file changed, 110 deletions(-)
 delete mode 100644 include/linux/platform_data/dma-iop32x.h

diff --git a/include/linux/platform_data/dma-iop32x.h b/include/linux/platform_data/dma-iop32x.h
deleted file mode 100644
index ac83cff89549..000000000000
--- a/include/linux/platform_data/dma-iop32x.h
+++ /dev/null
@@ -1,110 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright © 2006, Intel Corporation.
- */
-#ifndef IOP_ADMA_H
-#define IOP_ADMA_H
-#include <linux/types.h>
-#include <linux/dmaengine.h>
-#include <linux/interrupt.h>
-
-#define IOP_ADMA_SLOT_SIZE 32
-#define IOP_ADMA_THRESHOLD 4
-#ifdef DEBUG
-#define IOP_PARANOIA 1
-#else
-#define IOP_PARANOIA 0
-#endif
-#define iop_paranoia(x) BUG_ON(IOP_PARANOIA && (x))
-
-#define DMA0_ID 0
-#define DMA1_ID 1
-#define AAU_ID 2
-
-/**
- * struct iop_adma_device - internal representation of an ADMA device
- * @pdev: Platform device
- * @id: HW ADMA Device selector
- * @dma_desc_pool: base of DMA descriptor region (DMA address)
- * @dma_desc_pool_virt: base of DMA descriptor region (CPU address)
- * @common: embedded struct dma_device
- */
-struct iop_adma_device {
-	struct platform_device *pdev;
-	int id;
-	dma_addr_t dma_desc_pool;
-	void *dma_desc_pool_virt;
-	struct dma_device common;
-};
-
-/**
- * struct iop_adma_chan - internal representation of an ADMA device
- * @pending: allows batching of hardware operations
- * @lock: serializes enqueue/dequeue operations to the slot pool
- * @mmr_base: memory mapped register base
- * @chain: device chain view of the descriptors
- * @device: parent device
- * @common: common dmaengine channel object members
- * @last_used: place holder for allocation to continue from where it left off
- * @all_slots: complete domain of slots usable by the channel
- * @slots_allocated: records the actual size of the descriptor slot pool
- * @irq_tasklet: bottom half where iop_adma_slot_cleanup runs
- */
-struct iop_adma_chan {
-	int pending;
-	spinlock_t lock; /* protects the descriptor slot pool */
-	void __iomem *mmr_base;
-	struct list_head chain;
-	struct iop_adma_device *device;
-	struct dma_chan common;
-	struct iop_adma_desc_slot *last_used;
-	struct list_head all_slots;
-	int slots_allocated;
-	struct tasklet_struct irq_tasklet;
-};
-
-/**
- * struct iop_adma_desc_slot - IOP-ADMA software descriptor
- * @slot_node: node on the iop_adma_chan.all_slots list
- * @chain_node: node on the op_adma_chan.chain list
- * @hw_desc: virtual address of the hardware descriptor chain
- * @phys: hardware address of the hardware descriptor chain
- * @group_head: first operation in a transaction
- * @slot_cnt: total slots used in an transaction (group of operations)
- * @slots_per_op: number of slots per operation
- * @idx: pool index
- * @tx_list: list of descriptors that are associated with one operation
- * @async_tx: support for the async_tx api
- * @group_list: list of slots that make up a multi-descriptor transaction
- *	for example transfer lengths larger than the supported hw max
- * @xor_check_result: result of zero sum
- * @crc32_result: result crc calculation
- */
-struct iop_adma_desc_slot {
-	struct list_head slot_node;
-	struct list_head chain_node;
-	void *hw_desc;
-	struct iop_adma_desc_slot *group_head;
-	u16 slot_cnt;
-	u16 slots_per_op;
-	u16 idx;
-	struct list_head tx_list;
-	struct dma_async_tx_descriptor async_tx;
-	union {
-		u32 *xor_check_result;
-		u32 *crc32_result;
-		u32 *pq_check_result;
-	};
-};
-
-struct iop_adma_platform_data {
-	int hw_id;
-	dma_cap_mask_t cap_mask;
-	size_t pool_size;
-};
-
-#define to_iop_sw_desc(addr_hw_desc) \
-	container_of(addr_hw_desc, struct iop_adma_desc_slot, hw_desc)
-#define iop_hw_desc_slot_idx(hw_desc, idx) \
-	( (void *) (((unsigned long) hw_desc) + ((idx) << 5)) )
-#endif
-- 
2.51.0


