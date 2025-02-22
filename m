Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E47C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 11:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ivr6DTwkUER46OnOknX4pHF9k0JDAmJQfG2MDOfIQgk=; b=w+PJiTavWAbsNHHWViSl7FaY4A
	9/IJtXsu9HUBlDaXnRq992X2lAfBgDMm8et6Y6JKWZ/RFz+QuUmbP+BfQG7YikTc8SLnCh9qgfe65
	2NMCFBlPGFJcdBNz43toqKtC3YNcsQOOLAgYPi/Qi+Kluvn1m8dWkKgjo/lS/86u2XB4lOVd17Jce
	zrorefqByfWvz2fL8Evj9gIC6NxtV2scYp6pnzvV8takV8V0R/gPg1U0at+TSWCkK8QlJwbZnoS2y
	B6HFaMJvfFwcGvexcVex7Tis2rb6p38ueiVdU3zTr8UdhEROGoiIaED0eUjgJDyRAYPo4xI6DkOtk
	qgTwC3xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlnY4-00000007u08-0Mmr;
	Sat, 22 Feb 2025 11:19:56 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlnTh-00000007tUD-0hIO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 11:15:28 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Z0PWY23jBz1HKdZ;
	Sat, 22 Feb 2025 19:13:45 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 7D8F3180216;
	Sat, 22 Feb 2025 19:15:18 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 22 Feb
 2025 19:15:17 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <Dave.Martin@arm.com>, <james.morse@arm.com>
CC: <bobo.shaobowang@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <jonathan.cameron@huawei.com>
Subject: [PATCH mpam mpam/snapshot/v6.14-rc1 v2 5/5] arm_mpam: Automatically synchronize the configuration of all sub-monitoring groups
Date: Sat, 22 Feb 2025 19:24:48 +0800
Message-ID: <20250222112448.2438586-6-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250222112448.2438586-1-zengheng4@huawei.com>
References: <20250222112448.2438586-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_031525_614212_8E7B1460 
X-CRM114-Status: GOOD (  13.94  )
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

After the system expands the narrow-partid feature and statically assigns
all (req)PARTIDs to each control group, the following scenarios require
configuration synchronization operations:

  1. MSCs that support narrow-partid need to establish a mapping between
     reqPARTID and intPARTID after creating a new monitoring group.
  2. MSCs that do not support narrow-partid need to synchronize the
     configuration of sub-monitoring groups after users update the control
     group configuration.

In __write_config(), we synchronize a control group's configuration to each
sub-monitoring group.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/platform/arm64/mpam/mpam_devices.c  | 26 ++++++++++++++++++---
 drivers/platform/arm64/mpam/mpam_internal.h |  3 +++
 drivers/platform/arm64/mpam/mpam_resctrl.c  |  7 +++++-
 3 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/mpam_devices.c
index a1efd08eb914..6bcab7223b38 100644
--- a/drivers/platform/arm64/mpam/mpam_devices.c
+++ b/drivers/platform/arm64/mpam/mpam_devices.c
@@ -1535,6 +1535,7 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 	u32 pri_val = 0;
 	u16 cmax = MPAMCFG_CMAX_CMAX;
 	u16 bwa_fract = MPAMCFG_MBW_MAX_MAX;
+	u16 intpartid = req2intpartid(partid);
 	struct mpam_msc *msc = ris->vmsc->msc;
 	struct mpam_props *rprops = &ris->props;
 	u16 dspri = GENMASK(rprops->dspri_wd, 0);
@@ -1545,8 +1546,14 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 
 	if (mpam_has_feature(mpam_feat_partid_nrw, rprops)) {
 		mpam_write_partsel_reg(msc, INTPARTID,
-				       MPAMCFG_INTPARTID_INTERNAL | partid);
-		__mpam_intpart_sel(ris->ris_idx, partid, msc);
+				       MPAMCFG_INTPARTID_INTERNAL |
+				       intpartid);
+
+		/* Already finish mapping reqPARTID to intPARTID */
+		if (partid != intpartid)
+			goto out;
+
+		__mpam_intpart_sel(ris->ris_idx, intpartid, msc);
 	}
 
 	if (mpam_has_feature(mpam_feat_cpor_part, rprops)) {
@@ -1606,6 +1613,7 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 
 	mpam_quirk_post_config_change(ris, partid, cfg);
 
+out:
 	mutex_unlock(&msc->part_sel_lock);
 }
 
@@ -3066,9 +3074,21 @@ struct mpam_write_config_arg {
 
 static int __write_config(void *arg)
 {
+	int closid_num = resctrl_arch_get_num_closid(NULL);
 	struct mpam_write_config_arg *c = arg;
+	u32 reqpartid, req_idx;
+
+	/* This partid should be in the range of intPARTIDs */
+	WARN_ON_ONCE(c->partid >= closid_num);
 
-	mpam_reprogram_ris_partid(c->ris, c->partid, &c->comp->cfg[c->partid]);
+	/* Synchronize the configuration to each sub-monitoring group. */
+	for (req_idx = 0; req_idx < get_num_reqpartid_per_closid();
+	     req_idx++) {
+		reqpartid = req_idx * closid_num + c->partid;
+
+		mpam_reprogram_ris_partid(c->ris, reqpartid,
+					 &c->comp->cfg[c->partid]);
+	}
 
 	return 0;
 }
diff --git a/drivers/platform/arm64/mpam/mpam_internal.h b/drivers/platform/arm64/mpam/mpam_internal.h
index 7bc4694df23a..9c9c5587cfb2 100644
--- a/drivers/platform/arm64/mpam/mpam_internal.h
+++ b/drivers/platform/arm64/mpam/mpam_internal.h
@@ -768,4 +768,7 @@ static inline void mpam_resctrl_teardown_class(struct mpam_class *class) { }
  */
 #define MSMON_CAPT_EVNT_NOW    BIT(0)
 
+u32 req2intpartid(u32 reqpartid);
+u32 get_num_reqpartid_per_closid(void);
+
 #endif /* MPAM_INTERNAL_H */
diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c b/drivers/platform/arm64/mpam/mpam_resctrl.c
index af314f6df13e..d55ed48d1939 100644
--- a/drivers/platform/arm64/mpam/mpam_resctrl.c
+++ b/drivers/platform/arm64/mpam/mpam_resctrl.c
@@ -186,6 +186,11 @@ static u32 get_num_reqpartid(void)
 	return mpam_partid_max + 1;
 }
 
+u32 get_num_reqpartid_per_closid(void)
+{
+	return get_num_reqpartid() / resctrl_arch_get_num_closid(NULL);
+}
+
 u32 resctrl_arch_system_num_rmid_idx(void)
 {
 	u8 closid_shift = fls(mpam_pmg_max);
@@ -211,7 +216,7 @@ static u32 rmid2pmg(u32 rmid)
 	return rmid & pmg_mask;
 }
 
-static u32 req2intpartid(u32 reqpartid)
+u32 req2intpartid(u32 reqpartid)
 {
 	u8 intpartid_shift = fls(mpam_intpartid_max);
 	u32 intpartid_mask = ~(~0 << intpartid_shift);
-- 
2.25.1


