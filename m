Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC10E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 10:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YT202vcWMtp+2EKqxrAjO7FcKgkCVDe2nROTIesZeCA=; b=Ay4ujLWfrfCOAZqgCQhZ3TrKLd
	j7JDTzhfdluGQSS0RRgMCqoIzQdAP8on3YTGfd722Kn1fvVQF8ktZGSqiXhNVI9GwcWPCpoo5y5cl
	sR1+18K/wAlPsYYxI+5a74AvMz+/1kZcsjX/wEtkp4joAfxKfc1IoOZcCZrnyLPUM4galeHYmOOsv
	pV9iDQFG+P36bYyyT+4e7mqoZDDXtijE5wPLhZ3tk10mKa6SS36n7p90zfeHgQCo2mjRn/Jb0EK0x
	8wjxE8NldQIIG1jaxZx5WYQBwKkL74Q0N0qfoM9hQHNNezkl6o/xdrsomreCMIh5ofm5IaUzsBOFZ
	i83vaBsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU11P-0000000Eq0R-2War;
	Sat, 04 Jan 2025 10:04:43 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU0xu-0000000EpXk-2rST
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 10:01:10 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YQG9p2lz3z22kPr;
	Sat,  4 Jan 2025 17:58:54 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 1A8F91A016C;
	Sat,  4 Jan 2025 18:01:05 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 4 Jan
 2025 18:01:04 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <Dave.Martin@arm.com>, <james.morse@arm.com>
CC: <bobo.shaobowang@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<jonathan.cameron@huawei.com>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v4 5/5] arm_mpam: Automatically synchronize the configuration of all sub-monitoring groups
Date: Sat, 4 Jan 2025 18:12:24 +0800
Message-ID: <20250104101224.873926-6-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250104101224.873926-1-zengheng4@huawei.com>
References: <20250104101224.873926-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_020107_030775_D5B7AECF 
X-CRM114-Status: GOOD (  14.62  )
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
 drivers/platform/arm64/mpam/mpam_devices.c  | 25 ++++++++++++++++++---
 drivers/platform/arm64/mpam/mpam_internal.h |  3 +++
 drivers/platform/arm64/mpam/mpam_resctrl.c  |  4 ++--
 3 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/mpam_devices.c
index 781c9146718d..91c5849f76e3 100644
--- a/drivers/platform/arm64/mpam/mpam_devices.c
+++ b/drivers/platform/arm64/mpam/mpam_devices.c
@@ -1544,6 +1544,7 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 	u32 pri_val = 0;
 	u16 cmax = MPAMCFG_CMAX_CMAX;
 	u16 bwa_fract = MPAMCFG_MBW_MAX_MAX;
+	u16 intpartid = req2intpartid(partid);
 	struct mpam_msc *msc = ris->vmsc->msc;
 	struct mpam_props *rprops = &ris->props;
 	u16 dspri = GENMASK(rprops->dspri_wd, 0);
@@ -1554,8 +1555,14 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 
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
@@ -1615,6 +1622,7 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 
 	mpam_quirk_post_config_change(ris, partid, cfg);
 
+out:
 	mutex_unlock(&msc->part_sel_lock);
 }
 
@@ -3072,9 +3080,20 @@ struct mpam_write_config_arg {
 
 static int __write_config(void *arg)
 {
+	int closid_num = resctrl_arch_get_num_closid(NULL);
 	struct mpam_write_config_arg *c = arg;
+	u32 reqpartid, req_idx;
+
+	WARN_ON(c->partid >= closid_num);
 
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
index 5fc9f09b6945..c02365338b21 100644
--- a/drivers/platform/arm64/mpam/mpam_internal.h
+++ b/drivers/platform/arm64/mpam/mpam_internal.h
@@ -773,4 +773,7 @@ static inline void mpam_resctrl_teardown_class(struct mpam_class *class) { }
  */
 #define MSMON_CAPT_EVNT_NOW    BIT(0)
 
+u32 get_num_reqpartid_per_closid(void);
+u32 req2intpartid(u32 reqpartid);
+
 #endif /* MPAM_INTERNAL_H */
diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c b/drivers/platform/arm64/mpam/mpam_resctrl.c
index 064332e62c4d..62d0e0fc7fd9 100644
--- a/drivers/platform/arm64/mpam/mpam_resctrl.c
+++ b/drivers/platform/arm64/mpam/mpam_resctrl.c
@@ -186,7 +186,7 @@ static u32 get_num_reqpartid(void)
 	return mpam_partid_max + 1;
 }
 
-static u32 get_num_reqpartid_per_closid(void)
+u32 get_num_reqpartid_per_closid(void)
 {
 	return get_num_reqpartid() / resctrl_arch_get_num_closid(NULL);
 }
@@ -260,7 +260,7 @@ static u32 rmid2pmg(u32 rmid)
 	return rmid & pmg_mask;
 }
 
-static u32 req2intpartid(u32 reqpartid)
+u32 req2intpartid(u32 reqpartid)
 {
 	u8 intpartid_shift = fls(mpam_intpartid_max);
 	u32 intpartid_mask = ~(~0 << intpartid_shift);
-- 
2.25.1


