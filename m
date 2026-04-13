Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AA9EBFD1C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SjTYAujVa/A1hWxH09DYRfGcLYteC9tZu8XAO6gZGMY=; b=SXe7WKWl+noCpQz8OShHrHrT5I
	zw5L0xNcKy7f0ND0jZ3ssD5pb9zyQMxegvPAKbQJZoRTNXWywfAVturTP+/OY9IKpweoPTkJnRZzw
	Y/To06iqCsuvQTi64eyLJlLEQOyfaKNgiL5VRNiuf1qvtXwAVgk3g/9T6AoBMlqGzG9Y13DHMqpmh
	71M609UU5k2J9aEu3PfO4zHYBrXzFobRFqe88f5zF4MuECNYZt7Bi+IkjGFBCP0C/UltywUJUiVJf
	UdVAzGh66SUNq5bkX/hmC34CI84z88l5DNyukS072sjanI0Te6WGxJbx5fGl3TFxrBt2DYDfVRMmZ
	DZ4/+x+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD4g-0000000FJLe-2igl;
	Mon, 13 Apr 2026 08:55:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD4e-0000000FJK5-25SU
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Apr 2026 08:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SjTYAujVa/A1hWxH09DYRfGcLYteC9tZu8XAO6gZGMY=; b=lO5YhFdGnsVnvCWBWO9/GPi54t
	CQh7g6HP7SFKhoz8t9cNgb1u+N/nufvfTwNiII+b4SaudbyyfiXApR6UlEwjFsscli03vx4engbtw
	Dwi23aguCxkWr9NT8rjQyGB6YGEBo7vlHlhvnFCENfH+vrEi7ecSI4qEIe2egaTiK3HWPqsl6Iwbw
	7p2K1dnDHscMdCtZ2TBRhqJNcncQZsoSBGHeYvDBDidlfXQhG4blxiUR3IkfA+f6t/AXElH4IMfcX
	yBK7oJhH0Lu4E1SdbhVyGhpfrkVQxIbyqAnveEIyADmbTCUvrxqQuolzA4Q+9nAIrDXfpHtMe6QR0
	ACen1iEA==;
Received: from [113.46.200.220] (helo=canpmsgout05.his.huawei.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD47-0000000GR5Q-18Ll
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 08:54:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=SjTYAujVa/A1hWxH09DYRfGcLYteC9tZu8XAO6gZGMY=;
	b=CQ0z8kKNwuQUWaS4RbL+qkujXltU53WtXe0JF34u9tA92LFMSF6++lQrl6pNOLtmJoiNw5Alp
	zHaaJErt75lw2chMNGQztCu/cOtnjk6Azw+Vrb/KV4Xb+7tDSgyr7sxsvr0oDNXuyaxHi+qLJe2
	Q4cTHw0Vcy8siWESzwHtTII=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fvLdp63B8z12LDP;
	Mon, 13 Apr 2026 16:47:58 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id EFD9F40576;
	Mon, 13 Apr 2026 16:54:17 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 13 Apr
 2026 16:54:17 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <ben.horgan@arm.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<tan.shaopeng@jp.fujitsu.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tglx@kernel.org>, <will@kernel.org>, <hpa@zytor.com>,
	<bp@alien8.de>, <babu.moger@amd.com>, <dave.hansen@linux.intel.com>,
	<mingo@redhat.com>, <tony.luck@intel.com>, <gshan@redhat.com>,
	<catalin.marinas@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <wangkefeng.wang@huawei.com>
Subject: [PATCH v8 next 04/10] arm_mpam: Refactor rmid to reqPARTID/PMG mapping
Date: Mon, 13 Apr 2026 16:53:59 +0800
Message-ID: <20260413085405.1166412-5-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260413085405.1166412-1-zengheng4@huawei.com>
References: <20260413085405.1166412-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.50.87.109]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_095444_050091_BCA7CAD7 
X-CRM114-Status: GOOD (  16.64  )
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

The Narrow-PARTID feature allows the MPAM driver to statically or
dynamically allocate request PARTIDs (reqPARTIDs) to internal
PARTIDs (intPARTIDs). This enables expanding the number of monitoring
groups beyond the hardware PMG limit.

For systems with mixed MSCs (Memory System Components), MSCs that do
not support Narrow-PARTID use PARTIDs exceeding the minimum number of
intPARTIDs as reqPARTIDs to expand monitoring groups.

Expand RMID to include reqPARTID information:

  RMID = reqPARTID * NUM_PMG + PMG

To maintain compatibility with the existing resctrl layer, reqPARTIDs
are allocated statically with a linear mapping to intPARTIDs via
req2intpartid().

Mapping relationships (n = intPARTID count, m = reqPARTIDs per intPARTID):

P - Partition group
M - Monitoring group

Group  closid rmid.reqPARTID  MSCs w/ Narrow-PARTID  MSCs w/o Narrow-PARTID
P1     0                      intPARTID_1            PARTID_1
M1_1   0      0               ├── reqPARTID_1_1      ├── PARTID_1
M1_2   0      0+n             ├── reqPARTID_1_2      ├── PARTID_1_2
M1_3   0      0+n*2           ├── reqPARTID_1_3      ├── PARTID_1_3
...                           ├── ...                ├── ...
M1_m   0      0+n*(m-1)       └── reqPARTID_1_m      └── PARTID_1_m

P2     1                      intPARTID_2            PARTID_2
M2_1   1      1               ├── reqPARTID_2_1      ├── PARTID_2
M2_2   1      1+n             ├── reqPARTID_2_2      ├── PARTID_2_2
M2_3   1      1+n*2           ├── reqPARTID_2_3      ├── PARTID_2_3
...                           ├── ...                ├── ...
M2_m   1      1+n*(m-1)       └── reqPARTID_2_m      └── PARTID_2_m

Pn     n-1                    intPARTID_n            PARTID_n
Mn_1   n-1    n-1             ├── reqPARTID_n_1      ├── PARTID_n
Mn_2   n-1    n-1+n           ├── reqPARTID_n_2      ├── PARTID_n_2
Mn_3   n-1    n-1+n*2         ├── reqPARTID_n_3      ├── PARTID_n_3
...                           ├── ...                ├── ...
Mn_m   n-1    n*m-1           └── reqPARTID_n_m      └── PARTID_n_m

Refactor the glue layer between resctrl abstractions (rmid) and MPAM
hardware registers (reqPARTID/PMG) to support Narrow-PARTID. The resctrl
layer uses rmid2reqpartid() and rmid2pmg() to extract components from
rmid. The closid-to-intPARTID translation remains unchanged via
resctrl_get_config_index().

Since Narrow-PARTID is a monitoring enhancement, reqPARTID is only
used in monitoring paths while configuration paths maintain the original
semantics of closid.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 arch/arm64/include/asm/mpam.h  |  12 +++-
 drivers/resctrl/mpam_resctrl.c | 101 +++++++++++++++++++++++----------
 2 files changed, 82 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
index 70d396e7b6da..40d60b0ab0fd 100644
--- a/arch/arm64/include/asm/mpam.h
+++ b/arch/arm64/include/asm/mpam.h
@@ -63,6 +63,15 @@ static inline void mpam_set_task_partid_pmg(struct task_struct *tsk,
 	WRITE_ONCE(task_thread_info(tsk)->mpam_partid_pmg, regval);
 }
 
+u16 req2intpartid(u16 reqpartid);
+
+static inline u16 mpam_get_regval_partid(u64 regval)
+{
+	u16 reqpartid = (regval & MPAMSM_EL1_PARTID_D_MASK) >> MPAMSM_EL1_PARTID_D_SHIFT;
+
+	return req2intpartid(reqpartid);
+}
+
 static inline void mpam_thread_switch(struct task_struct *tsk)
 {
 	u64 oldregval;
@@ -72,7 +81,8 @@ static inline void mpam_thread_switch(struct task_struct *tsk)
 	if (!static_branch_likely(&mpam_enabled))
 		return;
 
-	if (regval == READ_ONCE(arm64_mpam_global_default))
+	if (regval == READ_ONCE(arm64_mpam_global_default) ||
+	   !mpam_get_regval_partid(regval))
 		regval = READ_ONCE(per_cpu(arm64_mpam_default, cpu));
 
 	oldregval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 56859f354efa..9d0a7a4dffd1 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -303,15 +303,60 @@ u32 resctrl_arch_system_num_rmid_idx(void)
 	return (mpam_pmg_max + 1) * get_num_reqpartid();
 }
 
+static u16 rmid2reqpartid(u32 rmid)
+{
+	rmid /= (mpam_pmg_max + 1);
+
+	if (cdp_enabled)
+		return resctrl_get_config_index(rmid, CDP_DATA);
+
+	return resctrl_get_config_index(rmid, CDP_NONE);
+}
+
+static u8 rmid2pmg(u32 rmid)
+{
+	return rmid % (mpam_pmg_max + 1);
+}
+
+u16 req2intpartid(u16 reqpartid)
+{
+	return reqpartid % (mpam_intpartid_max + 1);
+}
+
+/*
+ * To avoid the reuse of rmid across multiple control groups, check
+ * the incoming closid to prevent rmid from being reallocated by
+ * resctrl_find_free_rmid().
+ *
+ * If the closid and rmid do not match upon inspection, immediately
+ * returns an invalid rmid. A valid rmid must not exceed 24 bits.
+ */
 u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
 {
-	return closid * (mpam_pmg_max + 1) + rmid;
+	u32 reqpartid = rmid2reqpartid(rmid);
+	u32 intpartid = req2intpartid(reqpartid);
+
+	if (cdp_enabled)
+		intpartid >>= 1;
+
+	if (closid != intpartid)
+		return U32_MAX;
+
+	return rmid;
 }
 
 void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
 {
-	*closid = idx / (mpam_pmg_max + 1);
-	*rmid = idx % (mpam_pmg_max + 1);
+	u32 reqpartid = rmid2reqpartid(idx);
+	u32 intpartid = req2intpartid(reqpartid);
+
+	if (rmid)
+		*rmid = idx;
+	if (closid) {
+		if (cdp_enabled)
+			intpartid >>= 1;
+		*closid = intpartid;
+	}
 }
 
 void resctrl_arch_sched_in(struct task_struct *tsk)
@@ -323,21 +368,17 @@ void resctrl_arch_sched_in(struct task_struct *tsk)
 
 void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 rmid)
 {
-	WARN_ON_ONCE(closid > U16_MAX);
-	WARN_ON_ONCE(rmid > U8_MAX);
+	u32 reqpartid = rmid2reqpartid(rmid);
+	u8 pmg = rmid2pmg(rmid);
 
-	if (!cdp_enabled) {
-		mpam_set_cpu_defaults(cpu, closid, closid, rmid, rmid);
-	} else {
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
@@ -356,17 +397,16 @@ void resctrl_arch_sync_cpu_closid_rmid(void *info)
 
 void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid)
 {
-	WARN_ON_ONCE(closid > U16_MAX);
-	WARN_ON_ONCE(rmid > U8_MAX);
+	u32 reqpartid = rmid2reqpartid(rmid);
+	u8 pmg = rmid2pmg(rmid);
 
-	if (!cdp_enabled) {
-		mpam_set_task_partid_pmg(tsk, closid, closid, rmid, rmid);
-	} else {
-		u32 partid_d = resctrl_get_config_index(closid, CDP_DATA);
-		u32 partid_i = resctrl_get_config_index(closid, CDP_CODE);
+	WARN_ON_ONCE(reqpartid > U16_MAX);
+	WARN_ON_ONCE(pmg > U8_MAX);
 
-		mpam_set_task_partid_pmg(tsk, partid_d, partid_i, rmid, rmid);
-	}
+	if (!cdp_enabled)
+		mpam_set_task_partid_pmg(tsk, reqpartid, reqpartid, pmg, pmg);
+	else
+		mpam_set_task_partid_pmg(tsk, reqpartid, reqpartid + 1, pmg, pmg);
 }
 
 bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid)
@@ -374,6 +414,8 @@ bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid)
 	u64 regval = mpam_get_regval(tsk);
 	u32 tsk_closid = FIELD_GET(MPAM0_EL1_PARTID_D, regval);
 
+	tsk_closid = req2intpartid(tsk_closid);
+
 	if (cdp_enabled)
 		tsk_closid >>= 1;
 
@@ -384,13 +426,11 @@ bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid)
 bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid)
 {
 	u64 regval = mpam_get_regval(tsk);
-	u32 tsk_closid = FIELD_GET(MPAM0_EL1_PARTID_D, regval);
-	u32 tsk_rmid = FIELD_GET(MPAM0_EL1_PMG_D, regval);
-
-	if (cdp_enabled)
-		tsk_closid >>= 1;
+	u32 tsk_partid = FIELD_GET(MPAM0_EL1_PARTID_D, regval);
+	u32 tsk_pmg = FIELD_GET(MPAM0_EL1_PMG_D, regval);
 
-	return (tsk_closid == closid) && (tsk_rmid == rmid);
+	return (tsk_partid == rmid2reqpartid(rmid)) &&
+	       (tsk_pmg == rmid2pmg(rmid));
 }
 
 struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
@@ -478,6 +518,7 @@ static int __read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_c
 		      enum resctrl_conf_type cdp_type, u32 closid, u32 rmid, u64 *val)
 {
 	struct mon_cfg cfg;
+	u32 reqpartid = rmid2reqpartid(rmid);
 
 	if (!mpam_is_enabled())
 		return -EINVAL;
@@ -493,8 +534,8 @@ static int __read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_c
 	cfg = (struct mon_cfg) {
 		.mon = mon_idx,
 		.match_pmg = true,
-		.partid = closid,
-		.pmg = rmid,
+		.partid = (cdp_type == CDP_CODE) ? reqpartid + 1 : reqpartid,
+		.pmg = rmid2pmg(rmid),
 	};
 
 	return mpam_msmon_read(mon_comp, &cfg, mon_type, val);
-- 
2.25.1


