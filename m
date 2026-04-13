Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C485BEBFD20
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syaEbXtXRQT7GoR1+WsZALXLm43lQHNnpC9Ahas5V7o=; b=pBGaL9AleSA+ByjN8joIerg/A1
	T+OXb/MVuMjp+kKHce1B+h74ImIfwlGQzD1kB4V1vdGe2fNboH7+aqwAXWCzXPbdT0vl26kqtR3Su
	4B4V6gfYxf+fmBZhWvGSZgTWW7+4EBm7Y58fY8cg04fPHj7Tl6jz4R+t4LP0lt3a0q8iSPjnw2tug
	4AACbNX2ki6NXyvQGDwYH4QmwL5IEylCnDSxz8VNVi87n7CnE+v7UoFLhChSqrNVun+GySVH/281C
	K7HsOH5In5o67JNLGWpeV/dAvR9s2YHXyC9AvwH3XrcjdfElVgJWznHIExUbCrih8L2XQvPyw/fVE
	W8dTi85w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD4h-0000000FJMX-1NPB;
	Mon, 13 Apr 2026 08:55:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD4e-0000000FJK3-1sfq
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Apr 2026 08:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=syaEbXtXRQT7GoR1+WsZALXLm43lQHNnpC9Ahas5V7o=; b=QBZoksIn5LuwjNT68JVplx04Xa
	IY4Pq8LsKALVjiq3GwiMsdRustl50DTgAA2G6eEJKxNQixzByGHGDVwygbEkdoZ6zjxJhJaH3ECYy
	AU4j+qPsgFxIU8OGKn6p+u0LVHvosAx9V7Gr/l+bofsFsahuunES6YfKq/rJTmJQK+bgCwJH0Azki
	aKAYNzPm+3tRVClx7jDJzxIcOgj0QAX+qVOHpUofchB8hCM+rMAxPJNwdslogVnSCIvw1RXVF8B4V
	fMhbq3CulHS1WylErLM9dO5UE2yzxMBnMV8pNkqrV6EuMVMjBwa2VxWnk2++7QTJ1gKZ6/n68+VBy
	zZkjkzVQ==;
Received: from [113.46.200.216] (helo=canpmsgout01.his.huawei.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD47-0000000GR5X-1fiL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 08:54:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=syaEbXtXRQT7GoR1+WsZALXLm43lQHNnpC9Ahas5V7o=;
	b=KukbhkcAQesz583MGG42zXTnuBbIG3K+O1F3naIB/Gdyc+x28PbXz4weLYuCo3KsVhIVaXciH
	/c96sRFVK1O7b0vTv9feIo511+7nJBD7wDFbkqzQGT/mc3Nquk2YvPw3mW6VpX+ySy5mS5Xkxnm
	uMaK9pCo4KrzXDOr+NY8F9Q=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fvLfG0cF0z1T4JS;
	Mon, 13 Apr 2026 16:48:22 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id D700340576;
	Mon, 13 Apr 2026 16:54:19 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 13 Apr
 2026 16:54:19 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <ben.horgan@arm.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<tan.shaopeng@jp.fujitsu.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tglx@kernel.org>, <will@kernel.org>, <hpa@zytor.com>,
	<bp@alien8.de>, <babu.moger@amd.com>, <dave.hansen@linux.intel.com>,
	<mingo@redhat.com>, <tony.luck@intel.com>, <gshan@redhat.com>,
	<catalin.marinas@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <wangkefeng.wang@huawei.com>
Subject: [PATCH v8 next 08/10] arm_mpam: Implement dynamic reqPARTID allocation for monitoring groups
Date: Mon, 13 Apr 2026 16:54:03 +0800
Message-ID: <20260413085405.1166412-9-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260413085405.1166412-1-zengheng4@huawei.com>
References: <20260413085405.1166412-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.109]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_095444_179760_17AF4538 
X-CRM114-Status: GOOD (  21.94  )
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

Replace static reqPARTID allocation with dynamic binding to maximize
the monitoring group utilization. Static allocation wastes resources when
control groups create fewer sub-groups than the pre-allocated limit.

Add a lookup table (reqpartid_map) to dynamically bind reqPARTIDs to
control groups needing extended monitoring capacity:

  * resctrl_arch_rmid_expand(): Find and bind a free reqPARTID to the
    specified closid when creating monitoring groups.

  * resctrl_arch_rmid_reclaim(): Unbind reqPARTID when all monitoring
    groups associated with pmg are freed, making it available for reuse.

Update conversion helpers for dynamic mapping:
  * req2intpartid() switches to lookup table for dynamic allocation.
  * Add partid2closid() and req_pmg2rmid() helpers.

Refactor __write_config() to iterate over all reqPARTIDs that match
by intPARTID, removing fixed per-closid slot assumption.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/resctrl/mpam_devices.c  |  21 ++---
 drivers/resctrl/mpam_internal.h |   2 +
 drivers/resctrl/mpam_resctrl.c  | 141 +++++++++++++++++++++++++++++---
 include/linux/arm_mpam.h        |  17 ++++
 4 files changed, 157 insertions(+), 24 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 2aeff798a865..cf94b45b4f9e 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1764,27 +1764,24 @@ struct mpam_write_config_arg {
 	u16 partid;
 };
 
-static u32 get_num_reqpartid_per_intpartid(void)
-{
-	return (mpam_partid_max + 1) / (mpam_intpartid_max + 1);
-}
-
 static int __write_config(void *arg)
 {
 	int closid_num = resctrl_arch_get_num_closid(NULL);
 	struct mpam_write_config_arg *c = arg;
-	u32 reqpartid, req_idx;
+	u32 reqpartid;
 
 	/* c->partid should be within the range of intPARTIDs */
 	WARN_ON_ONCE(c->partid >= closid_num);
 
-	/* Synchronize the configuration to each sub-monitoring group. */
-	for (req_idx = 0; req_idx < get_num_reqpartid_per_intpartid();
-	     req_idx++) {
-		reqpartid = req_idx * closid_num + c->partid;
+	mpam_reprogram_ris_partid(c->ris, c->partid,
+				 &c->comp->cfg[c->partid]);
 
-		mpam_reprogram_ris_partid(c->ris, reqpartid,
-					 &c->comp->cfg[c->partid]);
+	/* Synchronize the configuration to each sub-monitoring group. */
+	for (reqpartid = closid_num;
+	     reqpartid < get_num_reqpartid(); reqpartid++) {
+		if (req2intpartid(reqpartid) == c->partid)
+			mpam_reprogram_ris_partid(c->ris, reqpartid,
+						 &c->comp->cfg[c->partid]);
 	}
 
 	return 0;
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 790a90a5ccd9..16ce968344d0 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -473,6 +473,8 @@ void mpam_msmon_reset_mbwu(struct mpam_component *comp, struct mon_cfg *ctx);
 int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
 				   cpumask_t *affinity);
 
+u32 get_num_reqpartid(void);
+
 #ifdef CONFIG_RESCTRL_FS
 int mpam_resctrl_setup(void);
 void mpam_resctrl_exit(void);
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 9d0a7a4dffd1..2762462d80e5 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -268,7 +268,7 @@ u32 resctrl_arch_get_num_closid(struct rdt_resource *ignored)
  * The first call occurs in update_rmid_limits(), ensuring the
  * prerequisite initialization is complete.
  */
-static u32 get_num_reqpartid(void)
+u32 get_num_reqpartid(void)
 {
 	struct mpam_resctrl_res *res;
 	struct mpam_props *cprops;
@@ -318,9 +318,34 @@ static u8 rmid2pmg(u32 rmid)
 	return rmid % (mpam_pmg_max + 1);
 }
 
+static u32 req_pmg2rmid(u32 reqpartid, u8 pmg)
+{
+	if (cdp_enabled)
+		reqpartid >>= 1;
+
+	return reqpartid * (mpam_pmg_max + 1) + pmg;
+}
+
+static u32 *reqpartid_map;
+
 u16 req2intpartid(u16 reqpartid)
 {
-	return reqpartid % (mpam_intpartid_max + 1);
+	/*
+	 * Directly return intPartid in case that mpam_reset_ris() access
+	 * NULL pointer.
+	 */
+	if (reqpartid < (mpam_intpartid_max + 1))
+		return reqpartid;
+
+	return reqpartid_map[reqpartid];
+}
+
+static u32 partid2closid(u32 partid)
+{
+	if (cdp_enabled)
+		partid >>= 1;
+
+	return partid;
 }
 
 /*
@@ -334,12 +359,12 @@ u16 req2intpartid(u16 reqpartid)
 u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
 {
 	u32 reqpartid = rmid2reqpartid(rmid);
-	u32 intpartid = req2intpartid(reqpartid);
 
-	if (cdp_enabled)
-		intpartid >>= 1;
+	/* When enable CDP mode, needs to filter invalid rmid entry out */
+	if (reqpartid >= get_num_reqpartid())
+		return U32_MAX;
 
-	if (closid != intpartid)
+	if (closid != partid2closid(req2intpartid(reqpartid)))
 		return U32_MAX;
 
 	return rmid;
@@ -352,11 +377,9 @@ void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
 
 	if (rmid)
 		*rmid = idx;
-	if (closid) {
-		if (cdp_enabled)
-			intpartid >>= 1;
-		*closid = intpartid;
-	}
+
+	if (closid)
+		*closid = partid2closid(intpartid);
 }
 
 void resctrl_arch_sched_in(struct task_struct *tsk)
@@ -1665,6 +1688,93 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)
 	}
 }
 
+static int reqpartid_init(void)
+{
+	int req_num, idx;
+
+	req_num = get_num_reqpartid();
+	reqpartid_map = kcalloc(req_num, sizeof(u32), GFP_KERNEL);
+	if (!reqpartid_map)
+		return -ENOMEM;
+
+	for (idx = 0; idx < req_num; idx++)
+		reqpartid_map[idx] = idx;
+
+	return 0;
+}
+
+static void reqpartid_exit(void)
+{
+	kfree(reqpartid_map);
+}
+
+static void update_rmid_entries_for_reqpartid(u32 reqpartid)
+{
+	int pmg;
+	u32 intpartid = reqpartid_map[reqpartid];
+	u32 closid = partid2closid(intpartid);
+
+	for (pmg = 0; pmg <= mpam_pmg_max; pmg++)
+		rmid_entry_reassign_closid(closid, req_pmg2rmid(reqpartid, pmg));
+}
+
+int resctrl_arch_rmid_expand(u32 closid)
+{
+	int i;
+
+	for (i = resctrl_arch_get_num_closid(NULL);
+	     i < get_num_reqpartid(); i++) {
+
+		/* Here means the reqpartid 'i' is free. */
+		if (reqpartid_map[i] >= resctrl_arch_get_num_closid(NULL)) {
+			if (cdp_enabled) {
+				reqpartid_map[i] = resctrl_get_config_index(closid, CDP_DATA);
+				/*
+				 * Reqpartids are always allocated in
+				 * pairs, never out-of-bounds access.
+				 */
+				reqpartid_map[i + 1] = resctrl_get_config_index(closid, CDP_CODE);
+			} else {
+				reqpartid_map[i] = resctrl_get_config_index(closid, CDP_NONE);
+			}
+			update_rmid_entries_for_reqpartid(i);
+			return i;
+		}
+	}
+
+	return -ENOSPC;
+}
+
+void resctrl_arch_rmid_reclaim(u32 closid, u32 rmid)
+{
+	int pmg;
+	u32 intpartid;
+	int reqpartid = rmid2reqpartid(rmid);
+
+	if (reqpartid < resctrl_arch_get_num_closid(NULL))
+		return;
+
+	if (cdp_enabled)
+		intpartid = resctrl_get_config_index(closid, CDP_DATA);
+	else
+		intpartid = resctrl_get_config_index(closid, CDP_NONE);
+
+	WARN_ON_ONCE(intpartid != req2intpartid(reqpartid));
+
+	for (pmg = 0; pmg <= mpam_pmg_max; pmg++) {
+		if (rmid_is_occupied(closid, req_pmg2rmid(reqpartid, pmg)))
+			break;
+	}
+
+	if (pmg > mpam_pmg_max) {
+		reqpartid_map[reqpartid] = reqpartid;
+		if (cdp_enabled)
+			reqpartid_map[reqpartid + 1] = reqpartid + 1;
+
+		update_rmid_entries_for_reqpartid(reqpartid);
+	}
+}
+
 int mpam_resctrl_setup(void)
 {
 	int err = 0;
@@ -1720,10 +1830,16 @@ int mpam_resctrl_setup(void)
 		return -EOPNOTSUPP;
 	}
 
-	err = resctrl_init();
+	err = reqpartid_init();
 	if (err)
 		return err;
 
+	err = resctrl_init();
+	if (err) {
+		reqpartid_exit();
+		return err;
+	}
+
 	WRITE_ONCE(resctrl_enabled, true);
 
 	return 0;
@@ -1741,6 +1857,7 @@ void mpam_resctrl_exit(void)
 
 	WRITE_ONCE(resctrl_enabled, false);
 	resctrl_exit();
+	reqpartid_exit();
 }
 
 /*
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index f92a36187a52..d45422965907 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -59,6 +59,23 @@ void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 rmid);
 void resctrl_arch_sched_in(struct task_struct *tsk);
 bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid);
 bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
+
+/**
+ * resctrl_arch_rmid_expand() - Expand the RMID resources for the specified closid.
+ * @closid:    closid that matches the rmid.
+ *
+ * Return:
+ * 0 on success, or -ENOSPC etc on error.
+ */
+int resctrl_arch_rmid_expand(u32 closid);
+
+/**
+ * resctrl_arch_rmid_reclaim() - Reclaim the rmid resources for the specified closid.
+ * @closid:    closid that matches the rmid.
+ * @rmid:      Reclaim the rmid specified.
+ */
+void resctrl_arch_rmid_reclaim(u32 closid, u32 rmid);
+
 u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid);
 void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid);
 u32 resctrl_arch_system_num_rmid_idx(void);
-- 
2.25.1


