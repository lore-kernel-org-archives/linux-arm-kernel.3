Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD55E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 09:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIicETS8u4s434iN+wMN6ZEKorFAtMH4IqAJLeKjDRc=; b=Bn3Eak9Sk0VQK9YuY24j4wuDcv
	xUNTrY0wZLz0thLqMqp8p0Q0yOYOTQFeqZroTmD8kESL+IyTR89zRm0NiyoJb4D+bq7RHm/GBKwkJ
	Fu+ZkGL09fvSC6PzEOYn3ZiGs0O1XdBfYzuiST7gi5pZCpI5OKV99HYbrzhhVm02NcU/UinuLgYOS
	7QeDrIxXXc58gmQS0HSIQY0v2EUlub/M5sqPiRAQicMuSOSg8mtxAhubV3CTBM1T8YZjQuoSVeYcT
	WLJcL+uaNWuIhYpSoLAv52NY+tk0f8hTSVoVEE8zqBTlbrPtX5qikGAQOZHwlbD2q2pk3S5KEbEsV
	liMqgnBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJqsg-00000003lCe-2PTd;
	Sat, 07 Dec 2024 09:13:42 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJqod-00000003kZy-466r
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 09:09:35 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Y52LG09pjzgZ7S;
	Sat,  7 Dec 2024 17:06:30 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 3E274140135;
	Sat,  7 Dec 2024 17:09:21 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 7 Dec
 2024 17:09:20 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <Dave.Martin@arm.com>, <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<jonathan.cameron@huawei.com>, <xiexiuqi@huawei.com>
Subject: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v3 2/5] arm_mpam: Read monitor value with new closid/rmid pair
Date: Sat, 7 Dec 2024 17:21:33 +0800
Message-ID: <20241207092136.2488426-3-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241207092136.2488426-1-zengheng4@huawei.com>
References: <20241207092136.2488426-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_010932_339272_E61B56C2 
X-CRM114-Status: GOOD (  16.04  )
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

Group closid rmid.req_idx (req)PARTID      MSCs with narrow-partid  MSCs without narrow-partid
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

    (req)PARTID = (rmid.req_idx * n) + closid,
    PMG = rmid.pmg.

When the resctrl layer uses the new closid/rmid pair to read or reset the
monitoring values, these new conversion functions(closid_rmid2reqpartid()
and rmid2pmg()) would be utilized to gain the new (req)PARTID/PMG pair.

Since the rmid no longer contains only PMG information, it includes both
*req_idx* and *pmg*. Therefore, the conversion between rmid_idx and
closid/rmid needs to be adapted accordingly too.

Each control group has m (req)PARTIDs, which are used to expand the number
of monitoring groups under the control group. Therefore, the number of
monitoring groups is no longer limited by the range of MPAM's PMG, which
enhances the extensibility of the system's monitoring capabilities.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/platform/arm64/mpam/mpam_resctrl.c | 64 ++++++++++++++++++----
 1 file changed, 52 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c b/drivers/platform/arm64/mpam/mpam_resctrl.c
index ac3d228befcf..965ff9fd45d3 100644
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
@@ -179,24 +184,59 @@ u32 resctrl_arch_system_num_rmid_idx(void)
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
+	u8 pmg_shift = fls(mpam_pmg_max);
+	u32 req_idx = (rmid >> pmg_shift);
+	u8 intpartid_shift = fls(mpam_intpartid_max);
+
+	return (req_idx << intpartid_shift) | closid;
+}
+
+static u32 rmid2pmg(u32 rmid)
+{
+	u8 pmg_shift = fls(mpam_pmg_max);
+	u32 pmg_mask = ~(~0 << pmg_shift);
+
+	return rmid & pmg_mask;
 }
 
 void resctrl_arch_sched_in(struct task_struct *tsk)
@@ -397,7 +437,7 @@ int resctrl_arch_rmid_read(struct rdt_resource	*r, struct rdt_mon_domain *d,
 		cfg.mon = resctrl_arch_rmid_idx_encode(closid, rmid);
 
 	cfg.match_pmg = true;
-	cfg.pmg = rmid;
+	cfg.pmg = rmid2pmg(rmid);
 	cfg.opts = resctrl_evt_config_to_mpam(dom->mbm_local_evt_cfg);
 
 	if (irqs_disabled()) {
@@ -405,7 +445,7 @@ int resctrl_arch_rmid_read(struct rdt_resource	*r, struct rdt_mon_domain *d,
 		err = -EIO;
 	} else {
 		if (cdp_enabled) {
-			cfg.partid = closid << 1;
+			cfg.partid = closid_rmid2reqpartid(closid, rmid) << 1;
 			err = mpam_msmon_read(dom->comp, &cfg, type, val);
 			if (err)
 				return err;
@@ -415,7 +455,7 @@ int resctrl_arch_rmid_read(struct rdt_resource	*r, struct rdt_mon_domain *d,
 			if (!err)
 				*val += cdp_val;
 		} else {
-			cfg.partid = closid;
+			cfg.partid = closid_rmid2reqpartid(closid, rmid);
 			err = mpam_msmon_read(dom->comp, &cfg, type, val);
 		}
 	}
@@ -434,18 +474,18 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
 
 	cfg.mon = resctrl_arch_rmid_idx_encode(closid, rmid);
 	cfg.match_pmg = true;
-	cfg.pmg = rmid;
+	cfg.pmg = rmid2pmg(rmid);
 
 	dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
 
 	if (cdp_enabled) {
-		cfg.partid = closid << 1;
+		cfg.partid = closid_rmid2reqpartid(closid, rmid) << 1;
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


