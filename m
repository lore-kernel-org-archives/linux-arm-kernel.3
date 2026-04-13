Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCF7EBFD1D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKZBhbLqvomHQwozvNv6OmQiXZDyI1OApDbhLlPdwx0=; b=4xmpNOhZ7QOEY91IHflgpGDpuE
	La8AM/vXG2FcYtXRHmEw3vzE8sqH7dV5LGDY7uYu58lJixdan1B3sSEq0XuUJGObMnAKQF5raPGmC
	v/ruZ4o0t4RCPT/il8Q6kWtQ0oXJpxdffWYa4CtANUEJy4PSss6vZ4DZUkTyiOFy9lxHDw+wp8y1h
	jJ7PrEOiuCa32NnSmeTpn7hl1c17uHK09stgt4Q3Y7291U6LEDr+gYpgETqgeuxAk9o2DBi4qu7qK
	+jzMMdQBhBTcD0b4wndM64vON53ZbUKkgfDgav2wLu5urpdHmnaxzeUTupA4Pk97uVIx8t4dUd2nS
	EYa/Mfqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD4s-0000000FJWT-0DuS;
	Mon, 13 Apr 2026 08:55:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD4h-0000000FJLv-2ni0
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Apr 2026 08:55:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fKZBhbLqvomHQwozvNv6OmQiXZDyI1OApDbhLlPdwx0=; b=AJmJi/mqzo0RafoMAR1ZC8R8+K
	lupptmXdfglEewFEUOdKpplQ2JttZCsjOVjN+vxZ0FqsA9vx81uPW3a5D5qJqaWFJZWerxGgO663m
	OniJwn8gPR/rzseVtTOZO5IyWnnjCY866xgSo3w5pf18SPnqtyUs5nW8KLmyXUQNMupwtfRZyYefj
	hxEPLtSlyhhZfFN3z3IeUjYpE4LmNDOA5HJUtSbwVxyxk91WjiWR1vfjpaNhQVChy7hM9LTFrFbfn
	wwJq8mKeiSdh+u0OhyDzeliQ7WfS1QPLioPprHlyscTyIeAe0Z93ChmQxXt6UAnvhiiDawgK2tfVn
	RPdNwR2g==;
Received: from [113.46.200.218] (helo=canpmsgout03.his.huawei.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD48-0000000GR5T-3Kgr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 08:55:14 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fKZBhbLqvomHQwozvNv6OmQiXZDyI1OApDbhLlPdwx0=;
	b=jc4kTF6mGt4rwB0E/oP4iBAxB+QRyj9LyMQ+W+3A5TTv09JX4TLfg+SqAxuDrWTizcv1fTDAl
	xyj733V8XDw9v7JLbu7uiymKgF4Qv+HNhRsgxb7oAvoZd52JFnOEvapIJVEmPoQcv1Izc9iu2hq
	mqUs378DQkM3mddqMBTu3vA=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4fvLf00vlgzpStx;
	Mon, 13 Apr 2026 16:48:08 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 133B64048F;
	Mon, 13 Apr 2026 16:54:17 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 13 Apr
 2026 16:54:16 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <ben.horgan@arm.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<tan.shaopeng@jp.fujitsu.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tglx@kernel.org>, <will@kernel.org>, <hpa@zytor.com>,
	<bp@alien8.de>, <babu.moger@amd.com>, <dave.hansen@linux.intel.com>,
	<mingo@redhat.com>, <tony.luck@intel.com>, <gshan@redhat.com>,
	<catalin.marinas@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <wangkefeng.wang@huawei.com>
Subject: [PATCH v8 next 02/10] arm_mpam: Add intPARTID and reqPARTID support for Narrow-PARTID feature
Date: Mon, 13 Apr 2026 16:53:57 +0800
Message-ID: <20260413085405.1166412-3-zengheng4@huawei.com>
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
X-CRM114-CacheID: sfid-20260413_095456_126318_96DC779E 
X-CRM114-Status: GOOD (  20.61  )
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

Introduce Narrow-PARTID (partid_nrw) feature support, which enables
many-to-one mapping of request PARTIDs (reqPARTID) to internal PARTIDs
(intPARTID). This expands monitoring capability by allowing a single
control group to track more task types through multiple reqPARTIDs
per intPARTID, bypassing the PMG limit in some extent.

intPARTID: Internal PARTID used for control group configuration.
Configurations are synchronized to all reqPARTIDs mapped to the same
intPARTID. Count is indicated by MPAMF_PARTID_NRW_IDR.INTPARTID_MAX, or
defaults to PARTID count if Narrow-PARTID is unsupported.

reqPARTID: Request PARTID used to expand monitoring groups. Enables
a single control group to monitor more task types by multiple reqPARTIDs
within one intPARTID, overcoming the PMG count limitation.

For systems with homogeneous MSCs (all supporting Narrow-PARTID), the
driver exposes the full reqPARTID range directly. For heterogeneous
systems where some MSCs lack Narrow-PARTID support, the driver utilizes
PARTIDs beyond the intPARTID range as reqPARTIDs to expand monitoring
capacity.

So, the numbers of control group and monitoring group are calculated as:

  n = min(intPARTID, PARTID)  /* the number of control groups */
  l = min(reqPARTID, PARTID)  /* the number of monitoring groups */
  m = l // n                  /* monitoring groups per control group */

Where:

  intPARTID: intPARTIDs on Narrow-PARTID-capable MSCs
  reqPARTID: reqPARTIDs on Narrow-PARTID-capable MSCs
  PARTID:    PARTIDs on non-Narrow-PARTID-capable MSCs

Example: L3 cache (256 PARTIDs, without Narrow-PARTID feature) +
         MATA (32 intPARTIDs, 256 reqPARTIDs):

  n = min( 32, 256) =  32 intPARTIDs
  l = min(256, 256) = 256 reqPARTIDs
  m = 256 / 32 = 8 reqPARTIDs per intPARTID

Implementation notes:
  * Handle mixed MSC systems (some support Narrow-PARTID, some don't) by
    taking minimum number of intPARTIDs across all MSCs.
  * resctrl_arch_get_num_closid() now returns the number of intPARTIDs
    (was PARTID).

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/resctrl/mpam_devices.c  | 30 ++++++++++++++++++++----------
 drivers/resctrl/mpam_internal.h |  2 ++
 drivers/resctrl/mpam_resctrl.c  |  4 ++--
 3 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 41b14344b16f..cf067bf5092e 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -63,6 +63,7 @@ static DEFINE_MUTEX(mpam_cpuhp_state_lock);
  * Generating traffic outside this range will result in screaming interrupts.
  */
 u16 mpam_partid_max;
+u16 mpam_intpartid_max;
 u8 mpam_pmg_max;
 static bool partid_max_init, partid_max_published;
 static DEFINE_SPINLOCK(partid_max_lock);
@@ -288,10 +289,12 @@ int mpam_register_requestor(u16 partid_max, u8 pmg_max)
 {
 	guard(spinlock)(&partid_max_lock);
 	if (!partid_max_init) {
+		mpam_intpartid_max = partid_max;
 		mpam_partid_max = partid_max;
 		mpam_pmg_max = pmg_max;
 		partid_max_init = true;
 	} else if (!partid_max_published) {
+		mpam_intpartid_max = min(mpam_intpartid_max, partid_max);
 		mpam_partid_max = min(mpam_partid_max, partid_max);
 		mpam_pmg_max = min(mpam_pmg_max, pmg_max);
 	} else {
@@ -931,7 +934,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 		u16 partid_max = FIELD_GET(MPAMF_PARTID_NRW_IDR_INTPARTID_MAX, nrwidr);
 
 		mpam_set_feature(mpam_feat_partid_nrw, props);
-		msc->partid_max = min(msc->partid_max, partid_max);
+		msc->intpartid_max = min(msc->partid_max, partid_max);
+	} else {
+		msc->intpartid_max = msc->partid_max;
 	}
 }
 
@@ -995,6 +1000,7 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 
 	spin_lock(&partid_max_lock);
 	mpam_partid_max = min(mpam_partid_max, msc->partid_max);
+	mpam_intpartid_max = min(mpam_intpartid_max, msc->intpartid_max);
 	mpam_pmg_max = min(mpam_pmg_max, msc->pmg_max);
 	spin_unlock(&partid_max_lock);
 
@@ -1711,7 +1717,7 @@ static int mpam_reset_ris(void *arg)
 		return 0;
 
 	spin_lock(&partid_max_lock);
-	partid_max = mpam_partid_max;
+	partid_max = mpam_intpartid_max;
 	spin_unlock(&partid_max_lock);
 	for (partid = 0; partid <= partid_max; partid++)
 		mpam_reprogram_ris_partid(ris, partid, &reset_cfg);
@@ -1767,7 +1773,7 @@ static void mpam_reprogram_msc(struct mpam_msc *msc)
 	struct mpam_write_config_arg arg;
 
 	/*
-	 * No lock for mpam_partid_max as partid_max_published has been
+	 * No lock for mpam_intpartid_max as partid_max_published has been
 	 * set by mpam_enabled(), so the values can no longer change.
 	 */
 	mpam_assert_partid_sizes_fixed();
@@ -1784,7 +1790,7 @@ static void mpam_reprogram_msc(struct mpam_msc *msc)
 		arg.comp = ris->vmsc->comp;
 		arg.ris = ris;
 		reset = true;
-		for (partid = 0; partid <= mpam_partid_max; partid++) {
+		for (partid = 0; partid <= mpam_intpartid_max; partid++) {
 			cfg = &ris->vmsc->comp->cfg[partid];
 			if (!bitmap_empty(cfg->features, MPAM_FEATURE_LAST))
 				reset = false;
@@ -2607,7 +2613,7 @@ static void mpam_reset_component_cfg(struct mpam_component *comp)
 	if (!comp->cfg)
 		return;
 
-	for (i = 0; i <= mpam_partid_max; i++) {
+	for (i = 0; i <= mpam_intpartid_max; i++) {
 		comp->cfg[i] = (struct mpam_config) {};
 		if (cprops->cpbm_wd)
 			comp->cfg[i].cpbm = GENMASK(cprops->cpbm_wd - 1, 0);
@@ -2627,7 +2633,7 @@ static int __allocate_component_cfg(struct mpam_component *comp)
 	if (comp->cfg)
 		return 0;
 
-	comp->cfg = kzalloc_objs(*comp->cfg, mpam_partid_max + 1);
+	comp->cfg = kzalloc_objs(*comp->cfg, mpam_intpartid_max + 1);
 	if (!comp->cfg)
 		return -ENOMEM;
 
@@ -2694,7 +2700,7 @@ static void mpam_enable_once(void)
 	int err;
 
 	/*
-	 * Once the cpuhp callbacks have been changed, mpam_partid_max can no
+	 * Once the cpuhp callbacks have been changed, mpam_intpartid_max can no
 	 * longer change.
 	 */
 	spin_lock(&partid_max_lock);
@@ -2743,9 +2749,13 @@ static void mpam_enable_once(void)
 	mpam_register_cpuhp_callbacks(mpam_cpu_online, mpam_cpu_offline,
 				      "mpam:online");
 
-	/* Use printk() to avoid the pr_fmt adding the function name. */
-	printk(KERN_INFO "MPAM enabled with %u PARTIDs and %u PMGs\n",
-	       mpam_partid_max + 1, mpam_pmg_max + 1);
+	if (mpam_partid_max == mpam_intpartid_max)
+		/* Use printk() to avoid the pr_fmt adding the function name. */
+		printk(KERN_INFO "MPAM enabled with %u PARTIDs and %u PMGs\n",
+		       mpam_partid_max + 1, mpam_pmg_max + 1);
+	else
+		printk(KERN_INFO "MPAM enabled with %u reqPARTIDs, %u intPARTIDs and %u PMGs\n",
+		       mpam_partid_max + 1, mpam_intpartid_max + 1, mpam_pmg_max + 1);
 }
 
 static void mpam_reset_component_locked(struct mpam_component *comp)
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 1914aefdcba9..790a90a5ccd9 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -81,6 +81,7 @@ struct mpam_msc {
 	 */
 	struct mutex		probe_lock;
 	bool			probed;
+	u16			intpartid_max;
 	u16			partid_max;
 	u8			pmg_max;
 	unsigned long		ris_idxs;
@@ -452,6 +453,7 @@ extern struct list_head mpam_classes;
 
 /* System wide partid/pmg values */
 extern u16 mpam_partid_max;
+extern u16 mpam_intpartid_max;
 extern u8 mpam_pmg_max;
 
 /* Scheduled work callback to enable mpam once all MSC have been probed */
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 161fb8905e28..5f4364c8101a 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -223,7 +223,7 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = false;
 
 	if (enable) {
-		if (mpam_partid_max < 1)
+		if (mpam_intpartid_max < 1)
 			return -EINVAL;
 
 		partid_d = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_DATA);
@@ -254,7 +254,7 @@ static bool mpam_resctrl_hide_cdp(enum resctrl_res_level rid)
  */
 u32 resctrl_arch_get_num_closid(struct rdt_resource *ignored)
 {
-	return mpam_partid_max + 1;
+	return mpam_intpartid_max + 1;
 }
 
 u32 resctrl_arch_system_num_rmid_idx(void)
-- 
2.25.1


