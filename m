Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79487C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 11:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=20fbRSawlf2G2W2NxOEzLzejvn/QLxfCbAzZzdBb13c=; b=ZCw+HsceR+g8cXCndQHfU4AZwe
	hu13Lui4eW6nFg3XV7fd0QO2vSnL/NCezS+NphtoSgDKn2Fky7tKejf3hk2GT0o+SkiG5YzpbDVmJ
	TlAHmKH6cgbq7H8LQ+g6Vi37Yadn0SRZ+yC680ZAIcW0nMyAXT4bmnIBQd5biWL60dh3kfKBl8PZi
	r83eBk8twZeHv/dzyZiKy3IHC7PkuNQTiVXyPVzvlm/wFbdfVsHIWaVG1F+vloltPyUKgFN7S7ygm
	v7wPEOoX6v+DQMEGGx4eBRUIw0Y+RAcUywppbRA7dV4yEx/d8GdmjdSMTiDn97sJPjD+jDxdJFklD
	73xHrPHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlncO-00000007uIa-1bdG;
	Sat, 22 Feb 2025 11:24:24 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlnTi-00000007tUC-3AHg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 11:15:29 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Z0PSk4y1rz2JvT8;
	Sat, 22 Feb 2025 19:11:18 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 532791A0188;
	Sat, 22 Feb 2025 19:15:17 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 22 Feb
 2025 19:15:16 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <Dave.Martin@arm.com>, <james.morse@arm.com>
CC: <bobo.shaobowang@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <jonathan.cameron@huawei.com>
Subject: [PATCH mpam mpam/snapshot/v6.14-rc1 v2 3/5] arm_mpam: Expand the composition of RMID
Date: Sat, 22 Feb 2025 19:24:46 +0800
Message-ID: <20250222112448.2438586-4-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250222112448.2438586-1-zengheng4@huawei.com>
References: <20250222112448.2438586-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_031527_096300_1B11C424 
X-CRM114-Status: GOOD (  19.65  )
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

The Narrow Partid feature supports for the MPAM driver statically or
dynamically allocates all reqPARTIDs to various intPARTIDs. The new RMID
allocation strategy will check whether there are available reqPARTIDs for
the incoming closid, rather than simply checking for available PMGs.

For a mixture of MSCs system, for MSCs that do not support narrow-partid,
we use the PARTIDs exceeding the number of closids as reqPARTIDs for
expanding the monitoring groups.

Therefore, we will expand the information contained in the RMID, so that it
includes not only PMG, but also reqPARTIDs information. The new RMID would
be like:

    RMID = (reqPARTID << shift | PMG).

In order to keep the existing resctrl layer interfaces, the reqPARTIDs are
allocated statically. Here req2intpartid() linearly binds each reqPARTID to
the corresponding intPARTID. If reqPARTID needs to support dynamic
allocation in the future, then simply rewrite req2intpartid() and can be
replaced with a table-lookup approach.

The static mapping relationships between each group's closid/rmid and the
respective MSCs' intPARTID/reqPARTID/PARTID are illustrated:

n - Indicates the total number of intPARTIDs
m - Indicates the number of reqPARTIDs per intPARTID

P - Partition group
M - Monitoring group

Group closid rmid.reqPARTID     MSCs with narrow-partid  MSCs without narrow-partid
P1     0                          intPARTID_1              PARTID_1
M1_1   0      0                       ├── reqPARTID_1_1       ├── PARTID_1
M1_2   0      0+n                     ├── reqPARTID_1_2       ├── PARTID_1_2
M1_3   0      0+n*2                   ├── reqPARTID_1_3       ├── PARTID_1_3
 ...                                  ├── ...                 ├── ...
M1_m   0      0+n*(m-1)               └── reqPARTID_1_m       └── PARTID_1_m

P2     1                          intPARTID_2              PARTID_2
M2_1   1      1                       ├── reqPARTID_2_1       ├── PARTID_2
M2_2   1      1+n                     ├── reqPARTID_2_2       ├── PARTID_2_2
M2_3   1      1+n*2                   ├── reqPARTID_2_3       ├── PARTID_2_3
 ...                                  ├── ...                 ├── ...
M2_m   1      1+n*(m-1)               └── reqPARTID_2_m       └── PARTID_2_m

Pn    (n-1)                       intPARTID_n              PARTID_n
Mn_1  (n-1)  (n-1)                    ├── reqPARTID_n_1       ├── PARTID_n
Mn_2  (n-1)  (n-1)+n                  ├── reqPARTID_n_2       ├── PARTID_n_2
Mn_3  (n-1)  (n-1)+n*2                ├── reqPARTID_n_3       ├── PARTID_n_3
 ...                                  ├── ...                 ├── ...
Mn_m  (n-1)  (n-1)+n*(m-1) = n*m-1    └── reqPARTID_n_m       └── PARTID_n_m

The resctrl layer uses the new conversion functions rmid2reqpartid()
and rmid2pmg() respectively to gain the new reqPARTID/PMG pair by RMID.

And still, the translation between closid and intPARTID follows the
original conversion logic of closid:

    intPARTID = resctrl_get_config_index(closid, resctrl_conf_type).

It can be noted that the approach of allocating the first n IDs to
intPARTIDs keeps the existing conversion between closid and intPARTID.
We still use the resctrl_get_config_index() for conversion, maintaining
the original semantics during the MPAM configuration updating.

Essentially, the narrowing feature is an enhanced monitoring feature, we
only expand the definition of rmid, while reqPARTID is only used in
monitoring-related processes.

Now each control group has m (req)PARTIDs, which are used to expand the
number of monitoring groups under one control group. Therefore, the number
of monitoring groups is no longer limited by the range of MPAM's PMG, which
enhances the extensibility of the system's monitoring capabilities.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/platform/arm64/mpam/mpam_resctrl.c | 126 ++++++++++++++-------
 1 file changed, 83 insertions(+), 43 deletions(-)

diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c b/drivers/platform/arm64/mpam/mpam_resctrl.c
index f3f8fb0ff421..af314f6df13e 100644
--- a/drivers/platform/arm64/mpam/mpam_resctrl.c
+++ b/drivers/platform/arm64/mpam/mpam_resctrl.c
@@ -194,24 +194,65 @@ u32 resctrl_arch_system_num_rmid_idx(void)
 	return num_reqpartid << closid_shift;
 }
 
+static u32 rmid2reqpartid(u32 rmid)
+{
+	u8 pmg_shift = fls(mpam_pmg_max);
+
+	WARN_ON_ONCE(pmg_shift > 8);
+
+	return rmid >> pmg_shift;
+}
+
+static u32 rmid2pmg(u32 rmid)
+{
+	u8 pmg_shift = fls(mpam_pmg_max);
+	u32 pmg_mask = ~(~0 << pmg_shift);
+
+	return rmid & pmg_mask;
+}
+
+static u32 req2intpartid(u32 reqpartid)
+{
+	u8 intpartid_shift = fls(mpam_intpartid_max);
+	u32 intpartid_mask = ~(~0 << intpartid_shift);
+
+	return reqpartid & intpartid_mask;
+}
+
+/*
+ * To avoid the reuse of rmid across multiple control groups, we will
+ * check the incoming closid to prevent rmid from being reallocated by
+ * resctrl_find_free_rmid().
+ *
+ * If the closid and rmid do not match upon inspection, immediately
+ * returns an invalid rmid. A valid rmid will not exceed 24 bits.
+ */
 u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
 {
-	u8 closid_shift = fls(mpam_pmg_max);
+	u32 reqpartid = rmid2reqpartid(rmid);
+	u32 intpartid = req2intpartid(reqpartid);
+
+	if (cdp_enabled)
+		intpartid >>= 1;
 
-	WARN_ON_ONCE(closid_shift > 8);
+	if (closid != intpartid)
+		return U32_MAX;
 
-	return (closid << closid_shift) | rmid;
+	return rmid;
 }
 
 void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
 {
-	u8 closid_shift = fls(mpam_pmg_max);
-	u32 pmg_mask = ~(~0 << closid_shift);
+	u32 reqpartid = rmid2reqpartid(idx);
+	u32 intpartid = req2intpartid(reqpartid);
 
-	WARN_ON_ONCE(closid_shift > 8);
-
-	*closid = idx >> closid_shift;
-	*rmid = idx & pmg_mask;
+	if (rmid)
+		*rmid = idx;
+	if (closid) {
+		if (cdp_enabled)
+			intpartid >>= 1;
+		*closid = intpartid;
+	}
 }
 
 void resctrl_arch_sched_in(struct task_struct *tsk)
@@ -223,21 +264,20 @@ void resctrl_arch_sched_in(struct task_struct *tsk)
 
 void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 rmid)
 {
-	WARN_ON_ONCE(closid > U16_MAX);
-	WARN_ON_ONCE(rmid > U8_MAX);
+	u32 reqpartid = rmid2reqpartid(rmid);
+	u32 pmg = rmid2pmg(rmid);
 
-	if (!cdp_enabled) {
-		mpam_set_cpu_defaults(cpu, closid, closid, rmid, rmid);
-	} else {
+	WARN_ON_ONCE(reqpartid > U16_MAX);
+	WARN_ON_ONCE(pmg > U8_MAX);
+
+	if (!cdp_enabled)
+		mpam_set_cpu_defaults(cpu, reqpartid, reqpartid, pmg, pmg);
+	else
 		/*
 		 * When CDP is enabled, resctrl halves the closid range and we
 		 * use odd/even partid for one closid.
 		 */
-		u32 partid_d = resctrl_get_config_index(closid, CDP_DATA);
-		u32 partid_i = resctrl_get_config_index(closid, CDP_CODE);
-
-		mpam_set_cpu_defaults(cpu, partid_d, partid_i, rmid, rmid);
-	}
+		mpam_set_cpu_defaults(cpu, reqpartid, reqpartid + 1, pmg, pmg);
 }
 
 void resctrl_arch_sync_cpu_closid_rmid(void *info)
@@ -256,41 +296,41 @@ void resctrl_arch_sync_cpu_closid_rmid(void *info)
 
 void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid)
 {
-	WARN_ON_ONCE(closid > U16_MAX);
-	WARN_ON_ONCE(rmid > U8_MAX);
+	u32 reqpartid = rmid2reqpartid(rmid);
+	u32 pmg = rmid2pmg(rmid);
 
-	if (!cdp_enabled) {
-		mpam_set_task_partid_pmg(tsk, closid, closid, rmid, rmid);
-	} else {
-		u32 partid_d = resctrl_get_config_index(closid, CDP_DATA);
-		u32 partid_i = resctrl_get_config_index(closid, CDP_CODE);
+	WARN_ON_ONCE(reqpartid > U16_MAX);
+	WARN_ON_ONCE(pmg > U8_MAX);
+
+	if (!cdp_enabled)
+		mpam_set_task_partid_pmg(tsk, reqpartid, reqpartid, pmg, pmg);
+	else
+		mpam_set_task_partid_pmg(tsk, reqpartid, reqpartid + 1, pmg, pmg);
 
-		mpam_set_task_partid_pmg(tsk, partid_d, partid_i, rmid, rmid);
-	}
 }
 
 bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid)
 {
 	u64 regval = mpam_get_regval(tsk);
-	u32 tsk_closid = FIELD_GET(MPAM1_EL1_PARTID_D, regval);
+	u32 tsk_partid = FIELD_GET(MPAM1_EL1_PARTID_D, regval);
+
+	tsk_partid = req2intpartid(tsk_partid);
 
 	if (cdp_enabled)
-		tsk_closid >>= 1;
+		tsk_partid >>= 1;
 
-	return tsk_closid == closid;
+	return tsk_partid == closid;
 }
 
 /* The task's pmg is not unique, the partid must be considered too */
 bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid)
 {
 	u64 regval = mpam_get_regval(tsk);
-	u32 tsk_closid = FIELD_GET(MPAM1_EL1_PARTID_D, regval);
-	u32 tsk_rmid = FIELD_GET(MPAM1_EL1_PMG_D, regval);
-
-	if (cdp_enabled)
-		tsk_closid >>= 1;
+	u32 tsk_partid = FIELD_GET(MPAM1_EL1_PARTID_D, regval);
+	u32 tsk_pmg = FIELD_GET(MPAM1_EL1_PMG_D, regval);
 
-	return (tsk_closid == closid) && (tsk_rmid == rmid);
+	return (tsk_partid == rmid2reqpartid(rmid)) &&
+	       (tsk_pmg == rmid2pmg(rmid));
 }
 
 struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
@@ -412,7 +452,7 @@ int resctrl_arch_rmid_read(struct rdt_resource	*r, struct rdt_mon_domain *d,
 		cfg.mon = resctrl_arch_rmid_idx_encode(closid, rmid);
 
 	cfg.match_pmg = true;
-	cfg.pmg = rmid;
+	cfg.pmg = rmid2pmg(rmid);
 	cfg.opts = resctrl_evt_config_to_mpam(dom->mbm_local_evt_cfg);
 
 	if (irqs_disabled()) {
@@ -420,7 +460,7 @@ int resctrl_arch_rmid_read(struct rdt_resource	*r, struct rdt_mon_domain *d,
 		err = -EIO;
 	} else {
 		if (cdp_enabled) {
-			cfg.partid = closid << 1;
+			cfg.partid = rmid2reqpartid(rmid);
 			err = mpam_msmon_read(dom->comp, &cfg, type, val);
 			if (err)
 				return err;
@@ -430,7 +470,7 @@ int resctrl_arch_rmid_read(struct rdt_resource	*r, struct rdt_mon_domain *d,
 			if (!err)
 				*val += cdp_val;
 		} else {
-			cfg.partid = closid;
+			cfg.partid = rmid2reqpartid(rmid);
 			err = mpam_msmon_read(dom->comp, &cfg, type, val);
 		}
 	}
@@ -449,18 +489,18 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
 
 	cfg.mon = resctrl_arch_rmid_idx_encode(closid, rmid);
 	cfg.match_pmg = true;
-	cfg.pmg = rmid;
+	cfg.pmg = rmid2pmg(rmid);
 
 	dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
 
 	if (cdp_enabled) {
-		cfg.partid = closid << 1;
+		cfg.partid = rmid2reqpartid(rmid);
 		mpam_msmon_reset_mbwu(dom->comp, &cfg);
 
 		cfg.partid += 1;
 		mpam_msmon_reset_mbwu(dom->comp, &cfg);
 	} else {
-		cfg.partid = closid;
+		cfg.partid = rmid2reqpartid(rmid);
 		mpam_msmon_reset_mbwu(dom->comp, &cfg);
 	}
 }
-- 
2.25.1


