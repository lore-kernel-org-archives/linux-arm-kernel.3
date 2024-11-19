Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23183D4415F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 13:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Bzk1m8Aa2VHrRKPa+fHTJmxNEk78xhjjH1mCgmPl8s=; b=qcsUSWzaSuXzRBrPda9utgHk62
	gGhn59VJBhTYa9xWaEAWWlikBOh/jdCZKSbVKVjrztsEMkpppCM3yhLlWFVpDkcnZvHo++HfY0++L
	W7A23W6IHo+NlJb8TEcReiPZR6iiweHpNsJPPG9paktFTSmt4hwS0uTkRmNV7dhbWX7/QEQqbQbms
	GQLjW6QiRnkUyUCrOatasxh/k0+e1b5ycaefuJ7XUxfIO2RM653Fc/L1Fs3tINJtbEh/PSID9Kjek
	MwN6XonpfMgLW9mGyHWJSmtV3rkHGPi6eR4bVS8NbGDGMs574BP6WcT3C7/O8C3OsVLNqqwit0OFp
	PwlLaPVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOSA-0000000CXrR-1evt;
	Tue, 19 Nov 2024 13:39:38 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOQz-0000000CXRO-0frE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 13:38:27 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Xt59655nCz1V4j6;
	Tue, 19 Nov 2024 21:35:38 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id C77161800CF;
	Tue, 19 Nov 2024 21:38:15 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 19 Nov
 2024 21:38:15 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <james.morse@arm.com>, <Dave.Martin@arm.com>
CC: <linux-kernel@vger.kernel.org>, <jonathan.cameron@huawei.com>,
	<xiexiuqi@huawei.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v2 3/6] arm_mpam: Enhance the rmid allocation strategy
Date: Tue, 19 Nov 2024 21:51:01 +0800
Message-ID: <20241119135104.595630-4-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241119135104.595630-1-zengheng4@huawei.com>
References: <20241119135104.595630-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_053825_581728_3BECBB96 
X-CRM114-Status: GOOD (  18.95  )
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

resctrl_arch_alloc_rmid() provides the similar functionality as
alloc_rmid(), but it is an enhanced version based on different architecture
implementations.

For the new rmid allocation strategy, it will check whether there is an
available rmid of any reqPARTID which belongs to the input intPARTID.

The MPAM driver statically assigns all reqPARTIDs to respective intPARTIDs,
with a specific illustration as follows:

m - Indicates the number of reqPARTIDs per intPARTID
n - Indicates the total number of intPARTIDs
(m * n) - Represents the total number of reqPARTIDs

intPARTID_1 = 0
    ├── reqPARTID_1_1 = 0
    ├── reqPARTID_1_2 = 0 + n
    ├── ...
    └── reqPARTID_1_m = 0 + n * (m - 1)

intPARTID_2 = 1
    ├── reqPARTID_2_1 = 1
    ├── reqPARTID_2_2 = 1 + n
    ├── ...
    └── reqPARTID_2_m = 1 + n * (m - 1)

...

intPARTID_n = (n - 1)

Each intPARTID has m reqPARTIDs, which are used to expand the number of
monitoring groups under the control group. Therefore, the number of
monitoring groups is no longer limited by the range of MPAM PMG, which
enhances the extensibility of the system's monitoring capabilities.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 arch/x86/kernel/cpu/resctrl/core.c         | 15 ++++++++
 drivers/platform/arm64/mpam/mpam_resctrl.c | 41 ++++++++++++++++++++--
 fs/resctrl/internal.h                      |  2 --
 fs/resctrl/pseudo_lock.c                   |  3 +-
 fs/resctrl/rdtgroup.c                      |  3 +-
 include/linux/resctrl.h                    | 16 +++++++++
 6 files changed, 71 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 816d9af6b36b..f9195f1bece0 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -697,6 +697,21 @@ static void domain_remove_cpu(int cpu, struct rdt_resource *r)
 		domain_remove_cpu_mon(cpu, r);
 }
 
+int resctrl_arch_alloc_rmid(u32 *closid, u32 *rmid)
+{
+	int ret;
+
+	if (!closid || !rmid)
+		return -EINVAL;
+
+	ret = alloc_rmid(*closid);
+	if (ret < 0)
+		return ret;
+
+	*rmid = ret;
+	return 0;
+}
+
 static void clear_closid_rmid(int cpu)
 {
 	struct resctrl_pqr_state *state = this_cpu_ptr(&pqr_state);
diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c b/drivers/platform/arm64/mpam/mpam_resctrl.c
index dfd4125875d7..f0fb76b2424a 100644
--- a/drivers/platform/arm64/mpam/mpam_resctrl.c
+++ b/drivers/platform/arm64/mpam/mpam_resctrl.c
@@ -171,6 +171,11 @@ static u32 get_num_reqpartid(void)
 	return mpam_partid_max + 1;
 }
 
+static u32 get_num_reqpartid_per_closid(void)
+{
+	return get_num_reqpartid() / resctrl_arch_get_num_closid(NULL);
+}
+
 u32 resctrl_arch_system_num_rmid_idx(void)
 {
 	u8 closid_shift = fls(mpam_pmg_max);
@@ -182,10 +187,11 @@ u32 resctrl_arch_system_num_rmid_idx(void)
 u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
 {
 	u8 closid_shift = fls(mpam_pmg_max);
+	u32 pmg_mask = ~(~0 << closid_shift);
 
 	BUG_ON(closid_shift > 8);
 
-	return (closid << closid_shift) | rmid;
+	return (closid << closid_shift) | (rmid & pmg_mask);
 }
 
 void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
@@ -195,8 +201,10 @@ void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
 
 	BUG_ON(closid_shift > 8);
 
-	*closid = idx >> closid_shift;
-	*rmid = idx & pmg_mask;
+	if (closid)
+		*closid = idx >> closid_shift;
+	if (rmid)
+		*rmid = idx & pmg_mask;
 }
 
 void resctrl_arch_sched_in(struct task_struct *tsk)
@@ -1032,6 +1040,33 @@ static void reqpartid_destroy(void)
 	bitmap_free(reqpartid_free_map);
 }
 
+int resctrl_arch_alloc_rmid(u32 *closid, u32 *rmid)
+{
+	int closid_num = resctrl_arch_get_num_closid(NULL);
+	int i, reqpartid, pmg;
+
+	if (!closid || !rmid)
+		return -EINVAL;
+
+	/* The closid is out of the range of intPARTIDs */
+	if (*closid >= closid_num)
+		return -EINVAL;
+
+	for (i = 0; i < get_num_reqpartid_per_closid(); i++) {
+		reqpartid = i * closid_num + *closid;
+		pmg = alloc_rmid(reqpartid);
+		if (pmg >= 0)
+			break;
+	}
+
+	if (pmg < 0)
+		return pmg;
+
+	*closid = reqpartid;
+	*rmid = pmg;
+	return 0;
+}
+
 int mpam_resctrl_setup(void)
 {
 	int err = 0;
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index a4288997fb93..f817e67a8cfc 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -325,8 +325,6 @@ int closids_supported(void);
 
 void closid_free(int closid);
 
-int alloc_rmid(u32 closid);
-
 void free_rmid(u32 closid, u32 rmid);
 
 void resctrl_mon_resource_exit(void);
diff --git a/fs/resctrl/pseudo_lock.c b/fs/resctrl/pseudo_lock.c
index 65f3ae15cdfa..ab8d7a36d303 100644
--- a/fs/resctrl/pseudo_lock.c
+++ b/fs/resctrl/pseudo_lock.c
@@ -582,12 +582,11 @@ int rdtgroup_locksetup_exit(struct rdtgroup *rdtgrp)
 	int ret;
 
 	if (resctrl_arch_mon_capable()) {
-		ret = alloc_rmid(rdtgrp->closid);
+		ret = resctrl_arch_alloc_rmid(&rdtgrp->closid, &rdtgrp->mon.rmid);
 		if (ret < 0) {
 			rdt_last_cmd_puts("Out of RMIDs\n");
 			return ret;
 		}
-		rdtgrp->mon.rmid = ret;
 	}
 
 	ret = rdtgroup_locksetup_user_restore(rdtgrp);
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 30f1dd05e10b..7a71fc0b76b5 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3272,12 +3272,11 @@ static int mkdir_rdt_prepare_rmid_alloc(struct rdtgroup *rdtgrp)
 	if (!resctrl_arch_mon_capable())
 		return 0;
 
-	ret = alloc_rmid(rdtgrp->closid);
+	ret = resctrl_arch_alloc_rmid(&rdtgrp->closid, &rdtgrp->mon.rmid);
 	if (ret < 0) {
 		rdt_last_cmd_puts("Out of RMIDs\n");
 		return ret;
 	}
-	rdtgrp->mon.rmid = ret;
 
 	ret = mkdir_mondata_all(rdtgrp->kn, rdtgrp, &rdtgrp->mon.mon_data_kn);
 	if (ret) {
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index be9d9f4c7b81..4fffbe8cd22e 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -506,6 +506,22 @@ static inline void resctrl_arch_rmid_read_context_check(void)
 		might_sleep();
 }
 
+int alloc_rmid(u32 closid);
+/**
+ * resctrl_arch_alloc_rmid() - Providing the similar functionality as
+ *			       alloc_rmid, but this function is an
+ *			       enhanced version based on different
+ *			       architecture implementations.
+ * @closid:	closid that matches the rmid. Depending on the
+ *		architecture, may update new closid and return by the
+ *		pointer.
+ * @rmid:	update available rmid by the pointer.
+ *
+ * Return:
+ * 0 on success, or -EINVAL, -ENOSPC etc on error.
+ */
+int resctrl_arch_alloc_rmid(u32 *closid, u32 *rmid);
+
 /**
  * resctrl_arch_reset_rmid() - Reset any private state associated with rmid
  *			       and eventid.
-- 
2.25.1


