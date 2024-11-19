Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B1AD4415F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 13:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=apNEKqsLDM4Ri7hgob0Yhdw/qa3kz4niROBe5J4FIJ0=; b=DF4bz024GE1179WIXkowlAA+1G
	eC7kVrUNwD2eqj92ERLDfac3gOWjVp9yMdSweMBsi/jrIxY1uo6jF9agWmgh875NsucxT6RUifu1+
	FnVXer4xANL7rTqDgAIeLAzBkXEm48bj053eFuGWwkg4VYIr4fEXo6qorksMlHgzmkmxpyAKoQowd
	3S+ZXorqXxhF9xH6XIFKcRg8ICYFrP47OGuiewx+wA1bwMae07vECIcv8uCJxx+mpuK/aLabO0nQ9
	p1MuSg085o0hlsOaWHRunrc4pZ2etUYclHmgsHi4JLmnJw1k3Sul/SnbCamaCtXwE9bWB8VtwNvoP
	/kZOG6nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOXg-0000000CZ1U-1JZG;
	Tue, 19 Nov 2024 13:45:20 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOQz-0000000CXRZ-1Iuu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 13:38:29 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Xt5BY1XngzQtwp;
	Tue, 19 Nov 2024 21:36:53 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 95FF6180064;
	Tue, 19 Nov 2024 21:38:14 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 19 Nov
 2024 21:38:13 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <james.morse@arm.com>, <Dave.Martin@arm.com>
CC: <linux-kernel@vger.kernel.org>, <jonathan.cameron@huawei.com>,
	<xiexiuqi@huawei.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v2 1/6] arm_mpam: Introduce the definitions of intPARTID and reqPARTID
Date: Tue, 19 Nov 2024 21:50:59 +0800
Message-ID: <20241119135104.595630-2-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241119135104.595630-1-zengheng4@huawei.com>
References: <20241119135104.595630-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_053825_780202_5A9CF8F4 
X-CRM114-Status: GOOD (  20.16  )
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

The narrow-partid feature in MPAM allows for a more efficient use of
PARTIDs by enabling a many-to-one mapping of reqpartids (requested PARTIDs)
to intpartids (internal PARTIDs). This mapping reduces the number of unique
PARTIDs needed, thus allowing more tasks or processes to be monitored and
managed with the available resources.

Intpartid(Internal PARTID) is an internal identifier used by the hardware
to represent a specific resource partition. It is a low-level identifier
that the hardware uses to track and manage resource allocation and
monitoring.

Reqpartid(Request PARTID) is an identifier provided by the software when
requesting resources from the memory system. It indicates the desired
partition for resource monitoring. By using reqpartids, software can
monitor specific resources or allow the system to subdivide smaller
granularity partitions within existing partitions to serve as monitoring
partitions.

Regarding intPARTID, MPAM uses it as the unit for control group
configuration delivery. MPAM will synchronize the delivered configuration
to all reqPARTIDs mapped to the same intPARTIDs. The number of intPARTIDs
is indicated by MPAMF_PARTID_NRW_IDR.INTPARTID_MAX if implemented, or
directly use the number of PARTID as intpartid_max.

reqPARTIDs can be used to expand the number of monitors, for each control
group is no longer simply restricted by the range of PMG. By mapping
between intPARTID and reqPARTID, the number of monitors would be greatly
expanded and more fine-grained monitoring under a control group will be
achieved.

After initialization, MPAM driver would select the minimum intpartid_max
among all classes of MSCs as the number of CLOSIDs, and use partid_max as
the number of reqPARTIDs.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/platform/arm64/mpam/mpam_devices.c  | 12 +++++++++++-
 drivers/platform/arm64/mpam/mpam_internal.h |  2 ++
 drivers/platform/arm64/mpam/mpam_resctrl.c  |  9 +++++++--
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/mpam_devices.c
index 9463045c0011..ca621bb132e9 100644
--- a/drivers/platform/arm64/mpam/mpam_devices.c
+++ b/drivers/platform/arm64/mpam/mpam_devices.c
@@ -67,6 +67,7 @@ static DEFINE_MUTEX(mpam_cpuhp_state_lock);
  * Generating traffic outside this range will result in screaming interrupts.
  */
 u16 mpam_partid_max;
+u16 mpam_intpartid_max;
 u8 mpam_pmg_max;
 static bool partid_max_init, partid_max_published;
 static DEFINE_SPINLOCK(partid_max_lock);
@@ -222,10 +223,16 @@ int mpam_register_requestor(u16 partid_max, u8 pmg_max)
 	spin_lock(&partid_max_lock);
 	if (!partid_max_init) {
 		mpam_partid_max = partid_max;
+		/*
+		 * Update mpam_intpartid_max here, in case the
+		 * system doesn't have narrow-partid feature.
+		 */
+		mpam_intpartid_max = partid_max;
 		mpam_pmg_max = pmg_max;
 		partid_max_init = true;
 	} else if (!partid_max_published) {
 		mpam_partid_max = min(mpam_partid_max, partid_max);
+		mpam_intpartid_max = min(mpam_intpartid_max, partid_max);
 		mpam_pmg_max = min(mpam_pmg_max, pmg_max);
 	} else {
 		/* New requestors can't lower the values */
@@ -984,7 +991,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 		u16 partid_max = FIELD_GET(MPAMF_PARTID_NRW_IDR_INTPARTID_MAX, nrwidr);
 
 		mpam_set_feature(mpam_feat_partid_nrw, props);
-		msc->partid_max = min(msc->partid_max, partid_max);
+		msc->intpartid_max = min(msc->partid_max, partid_max);
+	} else {
+		msc->intpartid_max = msc->partid_max;
 	}
 
 	mpam_mon_sel_outer_unlock(msc);
@@ -1046,6 +1055,7 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 
 	spin_lock(&partid_max_lock);
 	mpam_partid_max = min(mpam_partid_max, msc->partid_max);
+	mpam_intpartid_max = min(mpam_intpartid_max, msc->intpartid_max);
 	mpam_pmg_max = min(mpam_pmg_max, msc->pmg_max);
 	spin_unlock(&partid_max_lock);
 
diff --git a/drivers/platform/arm64/mpam/mpam_internal.h b/drivers/platform/arm64/mpam/mpam_internal.h
index 5af6ed60272e..5fc9f09b6945 100644
--- a/drivers/platform/arm64/mpam/mpam_internal.h
+++ b/drivers/platform/arm64/mpam/mpam_internal.h
@@ -86,6 +86,7 @@ struct mpam_msc
 	bool			error_irq_requested;
 	bool			error_irq_hw_enabled;
 	u16			partid_max;
+	u16			intpartid_max;
 	u8			pmg_max;
 	unsigned long		ris_idxs[128 / BITS_PER_LONG];
 	u32			ris_max;
@@ -466,6 +467,7 @@ static inline void mpam_assert_srcu_read_lock_held(void)
 
 /* System wide partid/pmg values */
 extern u16 mpam_partid_max;
+extern u16 mpam_intpartid_max;
 extern u8 mpam_pmg_max;
 
 /* Scheduled work callback to enable mpam once all MSC have been probed */
diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c b/drivers/platform/arm64/mpam/mpam_resctrl.c
index 76ddbce0ea9c..ac3d228befcf 100644
--- a/drivers/platform/arm64/mpam/mpam_resctrl.c
+++ b/drivers/platform/arm64/mpam/mpam_resctrl.c
@@ -162,6 +162,11 @@ static bool mpam_resctrl_hide_cdp(enum resctrl_res_level rid)
  * only the system wide safe value is safe to use.
  */
 u32 resctrl_arch_get_num_closid(struct rdt_resource *ignored)
+{
+	return mpam_intpartid_max + 1;
+}
+
+static u32 get_num_reqpartid(void)
 {
 	return mpam_partid_max + 1;
 }
@@ -169,9 +174,9 @@ u32 resctrl_arch_get_num_closid(struct rdt_resource *ignored)
 u32 resctrl_arch_system_num_rmid_idx(void)
 {
 	u8 closid_shift = fls(mpam_pmg_max);
-	u32 num_partid = resctrl_arch_get_num_closid(NULL);
+	u32 num_reqpartid = get_num_reqpartid();
 
-	return num_partid << closid_shift;
+	return num_reqpartid << closid_shift;
 }
 
 u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
-- 
2.25.1


