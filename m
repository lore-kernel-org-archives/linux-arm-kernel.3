Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E80E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 10:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTg0WQwY2H6K8bWHKgRdkl/IAS/FPcxjG4kq4IYr3t8=; b=2YxjaUKQvcaqjwPcv5w9dSPmOI
	bWANjkdBEpR2ze4w2oUXOxxnbzUYw+0Gwg7iuFd69uxAf1oJroMXW3cNHPOtqbNHeM4wC11D4wN+1
	eqkD/UHd6vg6RLHhyvGhnm+SLbpDvH8D+vc1+j3cMuZsfsP6uV9q4OAHKY1V5KlKXShQyiqv0ORBI
	iJJnmdsCgS4odeO7gojBFrDiu2boJFyIla5ftpqlM+hly+LALFqVV4EwFt1qvvPcpArNfmtqz+P7y
	hddtbPu4ZZUs9MJ68ondtba1RBTCCE81GMR8wa6LeHKU+POEhauNTNcPyVMPIhNDhEDyhjaVaJ+Jn
	2/K1z+hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU12Y-0000000Eq6e-0zTj;
	Sat, 04 Jan 2025 10:05:54 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU0xu-0000000EpXg-2rGl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 10:01:10 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4YQGDj5Qfdz20n8F;
	Sat,  4 Jan 2025 18:01:25 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id D1D6E1A0188;
	Sat,  4 Jan 2025 18:01:03 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 4 Jan
 2025 18:01:03 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <Dave.Martin@arm.com>, <james.morse@arm.com>
CC: <bobo.shaobowang@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<jonathan.cameron@huawei.com>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v4 3/5] arm_mpam: Provide conversion method for new closid/rmid pairs
Date: Sat, 4 Jan 2025 18:12:22 +0800
Message-ID: <20250104101224.873926-4-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250104101224.873926-1-zengheng4@huawei.com>
References: <20250104101224.873926-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_020107_065668_7E22C35F 
X-CRM114-Status: GOOD (  19.73  )
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

The MPAM driver statically assigns all reqPARTIDs to respective intPARTIDs.
For the new rmid allocation strategy, it will check if there is an
available rmid of any reqPARTID which belongs to the input closid, not just
the rmids belonging to the closid.

For a mixture of MSCs system, for MSCs that do not support narrow-partid,
we use the PARTIDs exceeding the number of closids as reqPARTIDs for
expanding the monitoring groups.

In order to keep the existing resctrl API interface, the rmid contains both
req_idx and PMG information instead of PMG only under the MPAM driver. The
req_idx represents the req_idx-th sub-monitoring group under the control
group. The new rmid would be like:

    rmid = (req_idx << shift | pmg).

The mapping relationships between each group's closid/rmid and the
respective MSCs' intPARTID/reqPARTID/PARTID are illustrated:

n - Indicates the total number of intPARTIDs
m - Indicates the number of reqPARTIDs per intPARTID

P - Partition group (control group)
M - Monitoring group

Group closid rmid.req_idx PARTID            MSCs with narrow-partid  MSCs without narrow-partid
P1    0      -            0                   intPARTID_1              PARTID_1
M1_1  0      0            0                       ├── reqPARTID_1_1       ├── PARTID_1_1
M1_2  0      1            0+n                     ├── reqPARTID_1_2       ├── PARTID_1_2
M1_3  0      2            0+n*2                   ├── reqPARTID_1_3       ├── PARTID_1_3
 ...                                              ├── ...                 ├── ...
M1_m  0      (m-1)        0+n*(m-1)               └── reqPARTID_1_m       └── PARTID_1_m

P2    1      -            1                   intPARTID_2              PARTID_2
M2_1  1      0            1                       ├── reqPARTID_2_1       ├── PARTID_2_1
M2_2  1      1            1+n                     ├── reqPARTID_2_2       ├── PARTID_2_2
M2_3  1      2            1+n*2                   ├── reqPARTID_2_3       ├── PARTID_2_3
 ...                                              ├── ...                 ├── ...
M2_m  1      (m-1)        1+n*(m-1)               └── reqPARTID_2_m       └── PARTID_2_m

Pn    (n-1)  -            (n-1)               intPARTID_n              PARTID_n
Mn_1  (n-1)  0            (n-1)                   ├── reqPARTID_n_1       ├── PARTID_n_1
Mn_2  (n-1)  1            (n-1)+n                 ├── reqPARTID_n_2       ├── PARTID_n_2
Mn_3  (n-1)  2            (n-1)+n*2               ├── reqPARTID_n_3       ├── PARTID_n_3
 ...                                              ├── ...                 ├── ...
Mn_m  (n-1)  (m-1)        (n-1)+n*(m-1) = n*m-1   └── reqPARTID_n_m       └── PARTID_n_m

Based on the example provided, the conversion relationship between
closid/rmid and (req)PARTID/PMG is:

    (req)PARTID = (rmid.req_idx * n) + intPARTID
    PMG = rmid.pmg

and still,

    intPARTID = resctrl_get_config_index(closid, resctrl_conf_type)

The resctrl layer uses the new conversion functions(closid_rmid2reqpartid()
and rmid2pmg() respectively) to gain the new (req)PARTID/PMG pair.

It can be noted that the approach of allocating the first n IDs to
intPARTIDs keeps the existing conversion between closid and intPARTID.
We still use the resctrl_get_config_index() for conversion, maintaining
the original semantics during the MPAM configuration updating. Essentially,
the narrowing feature is an enhanced monitoring feature, we only expand the
definition of rmid, while reqPARTID is only used in monitoring-related
processes.

Now each control group has m (req)PARTIDs, which are used to expand the
number of monitoring groups under one control group. Therefore, the number
of monitoring groups is no longer limited by the range of MPAM's PMG, which
enhances the extensibility of the system's monitoring capabilities.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/platform/arm64/mpam/mpam_resctrl.c | 128 +++++++++++++++------
 1 file changed, 95 insertions(+), 33 deletions(-)

diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c b/drivers/platform/arm64/mpam/mpam_resctrl.c
index b9a33001916b..064332e62c4d 100644
--- a/drivers/platform/arm64/mpam/mpam_resctrl.c
+++ b/drivers/platform/arm64/mpam/mpam_resctrl.c
@@ -186,6 +186,11 @@ static u32 get_num_reqpartid(void)
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
@@ -194,24 +199,73 @@ u32 resctrl_arch_system_num_rmid_idx(void)
 	return num_reqpartid << closid_shift;
 }
 
+/*
+ * Under MPAM driver, the rmid contains two pieces of information: one is
+ * req_idx, and the other is pmg. Therefore,
+ *     closid_shift = req_shift + pmg_shift.
+ */
 u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
 {
-	u8 closid_shift = fls(mpam_pmg_max);
+	u32 rmid_mask;
+	u8 closid_shift;
+	u8 pmg_shift = fls(mpam_pmg_max);
+	u8 req_shift = fls(get_num_reqpartid_per_closid() - 1);
+
+	closid_shift = req_shift + pmg_shift;
+	rmid_mask = ~(~0 << closid_shift);
 
 	BUG_ON(closid_shift > 8);
 
-	return (closid << closid_shift) | rmid;
+	return (closid << closid_shift) | (rmid & rmid_mask);
 }
 
 void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
 {
-	u8 closid_shift = fls(mpam_pmg_max);
-	u32 pmg_mask = ~(~0 << closid_shift);
+	u32 rmid_mask;
+	u8 closid_shift;
+	u8 pmg_shift = fls(mpam_pmg_max);
+	u8 req_shift = fls(get_num_reqpartid_per_closid() - 1);
+
+	closid_shift = req_shift + pmg_shift;
+	rmid_mask = ~(~0 << closid_shift);
 
 	BUG_ON(closid_shift > 8);
 
-	*closid = idx >> closid_shift;
-	*rmid = idx & pmg_mask;
+	if (closid)
+		*closid = idx >> closid_shift;
+	if (rmid)
+		*rmid = idx & rmid_mask;
+}
+
+static u32 closid_rmid2reqpartid(u32 closid, u32 rmid)
+{
+	u32 intpartid;
+	u8 pmg_shift = fls(mpam_pmg_max);
+	u32 req_idx = (rmid >> pmg_shift);
+	u8 intpartid_shift = fls(mpam_intpartid_max);
+
+	if (!cdp_enabled)
+		intpartid = resctrl_get_config_index(closid, CDP_NONE);
+	else
+		intpartid = resctrl_get_config_index(closid, CDP_DATA);
+
+	return (req_idx << intpartid_shift) | intpartid;
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
 }
 
 void resctrl_arch_sched_in(struct task_struct *tsk)
@@ -223,20 +277,24 @@ void resctrl_arch_sched_in(struct task_struct *tsk)
 
 void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 rmid)
 {
-	BUG_ON(closid > U16_MAX);
-	BUG_ON(rmid > U8_MAX);
+	u32 reqpartid = closid_rmid2reqpartid(closid, rmid);
+	u32 pmg = rmid2pmg(rmid);
+	u32 partid_d, partid_i;
+
+	BUG_ON(reqpartid > U16_MAX);
+	BUG_ON(pmg > U8_MAX);
 
 	if (!cdp_enabled) {
-		mpam_set_cpu_defaults(cpu, closid, closid, rmid, rmid);
+		mpam_set_cpu_defaults(cpu, reqpartid, reqpartid, pmg, pmg);
 	} else {
 		/*
 		 * When CDP is enabled, resctrl halves the closid range and we
 		 * use odd/even partid for one closid.
 		 */
-		u32 partid_d = resctrl_get_config_index(closid, CDP_DATA);
-		u32 partid_i = resctrl_get_config_index(closid, CDP_CODE);
+		partid_d = reqpartid;
+		partid_i = reqpartid + 1;
 
-		mpam_set_cpu_defaults(cpu, partid_d, partid_i, rmid, rmid);
+		mpam_set_cpu_defaults(cpu, partid_d, partid_i, pmg, pmg);
 	}
 }
 
@@ -256,41 +314,45 @@ void resctrl_arch_sync_cpu_closid_rmid(void *info)
 
 void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid)
 {
-	BUG_ON(closid > U16_MAX);
-	BUG_ON(rmid > U8_MAX);
+	u32 reqpartid = closid_rmid2reqpartid(closid, rmid);
+	u32 pmg = rmid2pmg(rmid);
+	u32 partid_d, partid_i;
+
+	BUG_ON(reqpartid > U16_MAX);
+	BUG_ON(pmg > U8_MAX);
 
 	if (!cdp_enabled) {
-		mpam_set_task_partid_pmg(tsk, closid, closid, rmid, rmid);
+		mpam_set_task_partid_pmg(tsk, reqpartid, reqpartid, pmg, pmg);
 	} else {
-		u32 partid_d = resctrl_get_config_index(closid, CDP_DATA);
-		u32 partid_i = resctrl_get_config_index(closid, CDP_CODE);
+		partid_d = reqpartid;
+		partid_i = partid_d + 1;
 
-		mpam_set_task_partid_pmg(tsk, partid_d, partid_i, rmid, rmid);
+		mpam_set_task_partid_pmg(tsk, partid_d, partid_i, pmg, pmg);
 	}
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
+	u32 tsk_pmg = FIELD_GET(MPAM1_EL1_PMG_D, regval);
+	u32 tsk_partid = FIELD_GET(MPAM1_EL1_PARTID_D, regval);
 
-	return (tsk_closid == closid) && (tsk_rmid == rmid);
+	return (tsk_partid == closid_rmid2reqpartid(closid, rmid)) &&
+	       (tsk_pmg == rmid2pmg(rmid));
 }
 
 struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
@@ -412,7 +474,7 @@ int resctrl_arch_rmid_read(struct rdt_resource	*r, struct rdt_mon_domain *d,
 		cfg.mon = resctrl_arch_rmid_idx_encode(closid, rmid);
 
 	cfg.match_pmg = true;
-	cfg.pmg = rmid;
+	cfg.pmg = rmid2pmg(rmid);
 	cfg.opts = resctrl_evt_config_to_mpam(dom->mbm_local_evt_cfg);
 
 	if (irqs_disabled()) {
@@ -420,7 +482,7 @@ int resctrl_arch_rmid_read(struct rdt_resource	*r, struct rdt_mon_domain *d,
 		err = -EIO;
 	} else {
 		if (cdp_enabled) {
-			cfg.partid = closid << 1;
+			cfg.partid = closid_rmid2reqpartid(closid, rmid);
 			err = mpam_msmon_read(dom->comp, &cfg, type, val);
 			if (err)
 				return err;
@@ -430,7 +492,7 @@ int resctrl_arch_rmid_read(struct rdt_resource	*r, struct rdt_mon_domain *d,
 			if (!err)
 				*val += cdp_val;
 		} else {
-			cfg.partid = closid;
+			cfg.partid = closid_rmid2reqpartid(closid, rmid);
 			err = mpam_msmon_read(dom->comp, &cfg, type, val);
 		}
 	}
@@ -449,18 +511,18 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
 
 	cfg.mon = resctrl_arch_rmid_idx_encode(closid, rmid);
 	cfg.match_pmg = true;
-	cfg.pmg = rmid;
+	cfg.pmg = rmid2pmg(rmid);
 
 	dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
 
 	if (cdp_enabled) {
-		cfg.partid = closid << 1;
+		cfg.partid = closid_rmid2reqpartid(closid, rmid);
 		mpam_msmon_reset_mbwu(dom->comp, &cfg);
 
 		cfg.partid += 1;
 		mpam_msmon_reset_mbwu(dom->comp, &cfg);
 	} else {
-		cfg.partid = closid;
+		cfg.partid = closid_rmid2reqpartid(closid, rmid);
 		mpam_msmon_reset_mbwu(dom->comp, &cfg);
 	}
 }
-- 
2.25.1


