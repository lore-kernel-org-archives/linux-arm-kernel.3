Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2686A606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ljF8xXea;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=VHzR8VF2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rTWaVW6ryuO1+gNeBztug5VeqxBFDC8N/s4o/GE8y3E=; b=ljF8xXeaNFLBsbg6aDTabO+JCL
	3BtOHmsa5HuOXffmti9R9vpYIWGypJMv7ZJevHknxEZ7S2kFfhmP/aREV7RjCBe6lL/Ulnn844waE
	LgmlrWlkJOkH1I+fRixPyJWzbWPl7IXsvKhOPpnC/Up7BlJqsVlNI3mLsPk1RIbjwZ6QxUW84mOoa
	D41nnS2Mnywtzur5MnHwJQ2O69ARY7gypoBIn+AyrbQw4nqT2G0pVJmS7ewBAIa90u4Dj/udlXNSk
	iVYhJPN2IxCOCykrubzPISJLwElb7z0c6WszQpFBA6FmjtmYZe1qK4eFwl/P1jKPjXzEkJ8FYlBEg
	f7fkalIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoTx-0000000DkmX-1Mqe;
	Thu, 22 Oct 2026 08:49:05 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoTt-0000000DkjH-02LZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:49:03 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rTWaVW6ryuO1+gNeBztug5VeqxBFDC8N/s4o/GE8y3E=;
	b=VHzR8VF2NlfpujT5/vow/NhaD/6SelIs2iig+xHa4EUWdTOW2EMrZba48/BHIGuIc7PLCaZkf
	vi8Mpt+I1heg+z8Ea8cIA82nbYJq/okyuSYDhvLnl3CW4knJNY9TZ/49lJpYIE9WQFLnh+jVZak
	n+bdT2Wu4nV9MRDIcN+OYJE=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4j9KZ55XxszRhVQ;
	Thu, 22 Oct 2026 16:48:45 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id AA59F40575;
	Thu, 22 Oct 2026 16:48:50 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 16:48:49 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH 3/7] arm_mpam: resctrl: Split monitor context for code/data
Date: Thu, 22 Oct 2026 16:48:17 +0800
Message-ID: <20261022084821.4014873-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022084821.4014873-1-ruanjinjie@huawei.com>
References: <20261022084821.4014873-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_014901_385085_39D3D0EE 
X-CRM114-Status: GOOD (  17.95  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The arch_mon_ctx passed between resctrl and the driver was a single
monitor index. CDP needs one accumulating monitor per PARTID, as
reprogramming one monitor's filter between the code and data PARTIDs
resets the counter on every read.

Turn the context into a u32[2] indexed by MON_CTX_DATA and MON_CTX_CODE
so a caller can borrow one monitor per PARTID. The L3 flows keep using
a single monitor for both entries.

No functional change.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 49 ++++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 17 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 9d223057953a..9ffee18e657c 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -372,7 +372,18 @@ struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
 	return &mpam_resctrl_controls[l].resctrl_res;
 }
 
-static int resctrl_arch_mon_ctx_alloc_no_wait(enum resctrl_event_id evtid)
+/*
+ * The arch_mon_ctx for borrowed monitors is a u32[2]: index 0 selects the
+ * monitor for CDP_DATA (and non-CDP) reads, index 1 the monitor for CDP_CODE.
+ * With CDP each partid needs its own accumulating monitor; reprogramming a
+ * single monitor's filter for each sub-read would reset the counter every
+ * time. For the pre-allocated events both entries hold USE_PRE_ALLOCATED.
+ */
+#define MON_CTX_DATA	0
+#define MON_CTX_CODE	1
+
+static int resctrl_arch_mon_ctx_alloc_no_wait(enum resctrl_event_id evtid,
+					      u32 *mon_ctx)
 {
 	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];
 
@@ -385,9 +396,14 @@ static int resctrl_arch_mon_ctx_alloc_no_wait(enum resctrl_event_id evtid)
 	switch (evtid) {
 	case QOS_L3_OCCUP_EVENT_ID:
 		/* With CDP, one monitor gets used for both code/data reads */
-		return mpam_alloc_csu_mon(mon->class);
+		mon_ctx[MON_CTX_DATA] = mpam_alloc_csu_mon(mon->class);
+		mon_ctx[MON_CTX_CODE] = mon_ctx[MON_CTX_DATA];
+		return mon_ctx[MON_CTX_DATA];
 	case QOS_L3_MBM_LOCAL_EVENT_ID:
 	case QOS_L3_MBM_TOTAL_EVENT_ID:
+		/* Served by the pre-assigned ABMC counters */
+		mon_ctx[MON_CTX_DATA] = USE_PRE_ALLOCATED;
+		mon_ctx[MON_CTX_CODE] = USE_PRE_ALLOCATED;
 		return USE_PRE_ALLOCATED;
 	default:
 		return -EOPNOTSUPP;
@@ -398,16 +414,16 @@ void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
 				 enum resctrl_event_id evtid)
 {
 	DEFINE_WAIT(wait);
-	int *ret;
+	u32 *ret;
 
-	ret = kmalloc_obj(*ret);
+	ret = kmalloc_array(2, sizeof(*ret), GFP_KERNEL);
 	if (!ret)
 		return ERR_PTR(-ENOMEM);
 
 	do {
 		prepare_to_wait(&resctrl_mon_ctx_waiters, &wait,
 				TASK_INTERRUPTIBLE);
-		*ret = resctrl_arch_mon_ctx_alloc_no_wait(evtid);
+		*ret = resctrl_arch_mon_ctx_alloc_no_wait(evtid, ret);
 		if (*ret == -ENOSPC)
 			schedule();
 	} while (*ret == -ENOSPC && !signal_pending(current));
@@ -417,7 +433,7 @@ void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
 }
 
 static void resctrl_arch_mon_ctx_free_no_wait(enum resctrl_event_id evtid,
-					      u32 mon_idx)
+					      const u32 *mon_ctx)
 {
 	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];
 
@@ -428,7 +444,7 @@ static void resctrl_arch_mon_ctx_free_no_wait(enum resctrl_event_id evtid,
 		return;
 
 	if (evtid == QOS_L3_OCCUP_EVENT_ID)
-		mpam_free_csu_mon(mon->class, mon_idx);
+		mpam_free_csu_mon(mon->class, mon_ctx[MON_CTX_DATA]);
 
 	wake_up(&resctrl_mon_ctx_waiters);
 }
@@ -436,11 +452,9 @@ static void resctrl_arch_mon_ctx_free_no_wait(enum resctrl_event_id evtid,
 void resctrl_arch_mon_ctx_free(struct rdt_resource *r,
 			       enum resctrl_event_id evtid, void *arch_mon_ctx)
 {
-	u32 mon_idx = *(u32 *)arch_mon_ctx;
+	resctrl_arch_mon_ctx_free_no_wait(evtid, arch_mon_ctx);
 
 	kfree(arch_mon_ctx);
-
-	resctrl_arch_mon_ctx_free_no_wait(evtid, mon_idx);
 }
 
 static int __read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
@@ -481,18 +495,18 @@ static int __read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_c
 
 static int read_mon_cdp_safe(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
 			     enum mpam_device_features mon_type,
-			     int mon_idx, u32 closid, u32 rmid, u64 *val)
+			     const u32 *mon_ctx, u32 closid, u32 rmid, u64 *val)
 {
 	if (cdp_enabled) {
 		u64 code_val = 0, data_val = 0;
 		int err;
 
-		err = __read_mon(mon, mon_comp, mon_type, mon_idx,
+		err = __read_mon(mon, mon_comp, mon_type, mon_ctx[MON_CTX_CODE],
 				 CDP_CODE, closid, rmid, &code_val);
 		if (err)
 			return err;
 
-		err = __read_mon(mon, mon_comp, mon_type, mon_idx,
+		err = __read_mon(mon, mon_comp, mon_type, mon_ctx[MON_CTX_DATA],
 				 CDP_DATA, closid, rmid, &data_val);
 		if (err)
 			return err;
@@ -501,7 +515,7 @@ static int read_mon_cdp_safe(struct mpam_resctrl_mon *mon, struct mpam_component
 		return 0;
 	}
 
-	return __read_mon(mon, mon_comp, mon_type, mon_idx,
+	return __read_mon(mon, mon_comp, mon_type, mon_ctx[MON_CTX_DATA],
 			  CDP_NONE, closid, rmid, val);
 }
 
@@ -512,7 +526,6 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
 {
 	struct mpam_resctrl_dom *l3_dom;
 	struct mpam_component *mon_comp;
-	u32 mon_idx = *(u32 *)arch_mon_ctx;
 	enum mpam_device_features mon_type;
 	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
 
@@ -532,7 +545,7 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
 
 	mon_type = mpam_feat_msmon_csu;
 
-	return read_mon_cdp_safe(mon, mon_comp, mon_type, mon_idx,
+	return read_mon_cdp_safe(mon, mon_comp, mon_type, arch_mon_ctx,
 				 closid, rmid, val);
 }
 
@@ -544,6 +557,8 @@ int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
 	struct mpam_resctrl_dom *l3_dom;
 	struct mpam_component *mon_comp;
+	/* The pre-allocated counters resolve their monitor in __read_mon() */
+	u32 mon_ctx_prealloc[2] = { USE_PRE_ALLOCATED, USE_PRE_ALLOCATED };
 
 	if (!mpam_is_enabled())
 		return -EINVAL;
@@ -555,7 +570,7 @@ int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 	mon_comp = l3_dom->mon_comp[eventid];
 
 	return read_mon_cdp_safe(mon, mon_comp, mpam_feat_msmon_mbwu,
-				 USE_PRE_ALLOCATED, closid, rmid, val);
+				 mon_ctx_prealloc, closid, rmid, val);
 }
 
 static void __reset_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
-- 
2.43.0


