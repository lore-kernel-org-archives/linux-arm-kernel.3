Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22733CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Efe4rm737IVA5IrTZlXXNX1ezcS5CUGeKrMwcf1ris=; b=nAp0HS28EwfNqMjlbfDp4R6nWW
	PMy7E3Br3ANLH96Ibr23pqkTwM5Ve+Gs+F/QEgAKfnh6Y5j2wL72hCJDs4IeAmFTBnvdF7OCosara
	FuZZC1DUK8zWi1cLltMa3kVstxQ0FudhIsxPsLl4Txv/7scaRl1idmUjKmTGyKvGmfgFu+1DBetv7
	peuFArTW/+fYobebfPvSrcRjSiprz8FguO/TQ90Pr0pWcF5OY+ui7zr3aehTUVmqDl5Kiq10IVwq+
	hrv6mBvcQU0Ur1ocsBVBsCwbqm1A/MdFpPlENO2EAIXLClCgJJr4JkDZfRr+uuMkGcHZvFTwoqZQC
	KnIehQRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdPS-00000003PX3-3M8Q;
	Fri, 19 Sep 2025 15:52:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdPP-00000003PWE-3Lag
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 15:52:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1322B169C;
	Fri, 19 Sep 2025 08:52:19 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 615E83F66E;
	Fri, 19 Sep 2025 08:52:26 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Lixiang Mao <lixiang.mao@oss.qualcomm.com>,
	Lixiang Mao <liximao@qti.qualcomm.com>
Subject: [PATCH v2] firmware: arm_ffa: Add support for IMPDEF value in the memory access descriptor
Date: Fri, 19 Sep 2025 16:52:16 +0100
Message-Id: <20250919155216.34074-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_085227_916659_BA8BDB89 
X-CRM114-Status: GOOD (  17.72  )
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

FF-A v1.2 introduced 16 byte IMPLEMENTATION DEFINED value in the endpoint
memory access descriptor to allow any sender could to specify an its any
custom value for each receiver. Also this value must be specified by the
receiver when retrieving the memory region. The sender must ensure it
informs the receiver of this value via an IMPLEMENTATION DEFINED mechanism
such as a partition message.

So the FF-A driver can use the message interfaces to communicate the value
and set the same in the ffa_mem_region_attributes structures when using
the memory interfaces.

The driver ensure that the size of the endpoint memory access descriptors
is set correctly based on the FF-A version.

Fixes: 9fac08d9d985 ("firmware: arm_ffa: Upgrade FF-A version to v1.2 in the driver")
Reported-by: Lixiang Mao <liximao@qti.qualcomm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 37 ++++++++++++++++++++++---------
 include/linux/arm_ffa.h           | 16 ++++++++++++-
 2 files changed, 42 insertions(+), 11 deletions(-)

v1->v2:
	- Fix the size of EMAD in ffa_mem_desc_offset() and the loop
	  increment in ffa_setup_and_transmit()

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index cf6e44429ecd..b68cd9eb09ee 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -654,6 +654,26 @@ static u16 ffa_memory_attributes_get(u32 func_id)
 	return FFA_MEM_NORMAL | FFA_MEM_WRITE_BACK | FFA_MEM_INNER_SHAREABLE;
 }
 
+static void ffa_emad_impdef_value_init(u32 version, void *dst, void *src)
+{
+	struct ffa_mem_region_attributes *ep_mem_access;
+
+	if (version > FFA_VERSION_1_1)
+		memcpy(dst, src, sizeof(ep_mem_access->impdef_val));
+}
+
+static void
+ffa_mem_region_additional_setup(u32 version, struct ffa_mem_region *mem_region)
+{
+	if (version <= FFA_VERSION_1_0) {
+		mem_region->ep_mem_size = 0;
+	} else {
+		mem_region->ep_mem_size = ffa_emad_size_get(version);
+		mem_region->ep_mem_offset = sizeof(*mem_region);
+		memset(mem_region->reserved, 0, 12);
+	}
+}
+
 static int
 ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
 		       struct ffa_mem_ops_args *args)
@@ -672,27 +692,24 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
 	mem_region->flags = args->flags;
 	mem_region->sender_id = drv_info->vm_id;
 	mem_region->attributes = ffa_memory_attributes_get(func_id);
-	ep_mem_access = buffer +
-			ffa_mem_desc_offset(buffer, 0, drv_info->version);
 	composite_offset = ffa_mem_desc_offset(buffer, args->nattrs,
 					       drv_info->version);
 
-	for (idx = 0; idx < args->nattrs; idx++, ep_mem_access++) {
+	for (idx = 0; idx < args->nattrs; idx++) {
+		ep_mem_access = buffer +
+			ffa_mem_desc_offset(buffer, idx, drv_info->version);
 		ep_mem_access->receiver = args->attrs[idx].receiver;
 		ep_mem_access->attrs = args->attrs[idx].attrs;
 		ep_mem_access->composite_off = composite_offset;
 		ep_mem_access->flag = 0;
 		ep_mem_access->reserved = 0;
+		ffa_emad_impdef_value_init(drv_info->version,
+					   ep_mem_access->impdef_val,
+					   args->attrs[idx].impdef_val);
 	}
 	mem_region->handle = 0;
 	mem_region->ep_count = args->nattrs;
-	if (drv_info->version <= FFA_VERSION_1_0) {
-		mem_region->ep_mem_size = 0;
-	} else {
-		mem_region->ep_mem_size = sizeof(*ep_mem_access);
-		mem_region->ep_mem_offset = sizeof(*mem_region);
-		memset(mem_region->reserved, 0, 12);
-	}
+	ffa_mem_region_additional_setup(drv_info->version, mem_region);
 
 	composite = buffer + composite_offset;
 	composite->total_pg_cnt = ffa_get_num_pages_sg(args->sg);
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index 0a0132c6ae3e..6e180fc0e68e 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -347,6 +347,7 @@ struct ffa_mem_region_attributes {
 	 * an `struct ffa_mem_region_addr_range`.
 	 */
 	u32 composite_off;
+	u8 impdef_val[16];
 	u64 reserved;
 };
 
@@ -426,10 +427,23 @@ struct ffa_mem_region {
 #define CONSTITUENTS_OFFSET(x)	\
 	(offsetof(struct ffa_composite_mem_region, constituents[x]))
 
+static inline u32 ffa_emad_size_get(u32 ffa_version)
+{
+	u32 sz;
+	struct ffa_mem_region_attributes *ep_mem_access;
+
+	if (ffa_version <= FFA_VERSION_1_1)
+		sz = sizeof(*ep_mem_access) - sizeof(ep_mem_access->impdef_val);
+	else
+		sz = sizeof(*ep_mem_access);
+
+	return sz;
+}
+
 static inline u32
 ffa_mem_desc_offset(struct ffa_mem_region *buf, int count, u32 ffa_version)
 {
-	u32 offset = count * sizeof(struct ffa_mem_region_attributes);
+	u32 offset = count * ffa_emad_size_get(ffa_version);
 	/*
 	 * Earlier to v1.1, the endpoint memory descriptor array started at
 	 * offset 32(i.e. offset of ep_mem_offset in the current structure)
-- 
2.34.1


