Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8008BCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 15:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vlHZgzAbzGv2RDVxmL81ejyLn+cnwO5n/jdABZ3GZjk=; b=QtRqFHSztYpaWlikATgkVuyDbz
	QJVX38uI6n8t5qQ0cUytHmx9JIaLQ0ceP7PrUjZ9E/LF2c0MXBwhzsZqXq0k6kPSd4yZQPe/g7iV3
	VtzZfJflUGTRb1nddTW+vFoinetW1hK6uOct4Wt+I5mamQBh/In9pUqpo5UktaNOLO5zz2p9zwmCB
	zccZC5+h3JTkVZaS5oonO7XbuMGe7AFWhrfpxefdX4kV255d8cTELAw4IyBoNsQecX/qou8IcGY5+
	QLTEjfO2UUTVKhD+WgaurcUEOQojMiaTXIzif7N3evCW9dyZHWc3l8SF2X8bVvosn1O4ZwLAwVc9R
	6kG2Anxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAhp-00000004p1w-3SA5;
	Mon, 15 Sep 2025 15:01:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAhn-00000004p1H-1Vek
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 15:01:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F6231424;
	Mon, 15 Sep 2025 08:01:14 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A40F63F694;
	Mon, 15 Sep 2025 08:01:21 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Lixiang Mao <liximao@qti.qualcomm.com>
Subject: [PATCH] firmware: arm_ffa: Add support for IMPDEF value in the memory access descriptor
Date: Mon, 15 Sep 2025 16:01:19 +0100
Message-Id: <20250915150119.3106344-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_080123_529932_EA391BA0 
X-CRM114-Status: GOOD (  16.77  )
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
 drivers/firmware/arm_ffa/driver.c | 46 ++++++++++++++++++++++++++-----
 include/linux/arm_ffa.h           |  1 +
 2 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index cf6e44429ecd..2ea30ce93d78 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -654,6 +654,41 @@ static u16 ffa_memory_attributes_get(u32 func_id)
 	return FFA_MEM_NORMAL | FFA_MEM_WRITE_BACK | FFA_MEM_INNER_SHAREABLE;
 }
 
+static u32 ffa_emad_size_get(u32 version)
+{
+	struct ffa_mem_region_attributes *ep_mem_access;
+	u32 sz;
+
+	if (version <= FFA_VERSION_1_1)
+		sz = sizeof(*ep_mem_access) - sizeof(ep_mem_access->impdef_val);
+	else
+		sz = sizeof(*ep_mem_access);
+
+	return sz;
+}
+
+static void ffa_emad_impdef_value_init(u32 version, void *dst, void *src)
+{
+	struct ffa_mem_region_attributes *ep_mem_access;
+
+	if (version > FFA_VERSION_1_1)
+		memcpy(dst, src, sizeof(ep_mem_access->impdef_val));
+	else
+		memset(dst, 0, sizeof(ep_mem_access->impdef_val));
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
@@ -683,16 +718,13 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
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
index 0a0132c6ae3e..a1b0ee11c4a6 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -347,6 +347,7 @@ struct ffa_mem_region_attributes {
 	 * an `struct ffa_mem_region_addr_range`.
 	 */
 	u32 composite_off;
+	u8 impdef_val[16];
 	u64 reserved;
 };
 
-- 
2.34.1


