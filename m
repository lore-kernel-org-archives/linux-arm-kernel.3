Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87612E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 09:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMGv0ogzwTzqM1qsPrEMSHmzmUnMDMAlQ/kWd11H0Mw=; b=mN/GFd4XzcR5YyxtMh9y1fMMrj
	OUYyIQ0v5B0kbh3MWLC90XCcvhyMjh/DTs6b6By5KIzItaLfAPdeky7C+cnjFWvlZPpTlDrpgYgHI
	XOZDjBCKcT6tsRshmv35sPkj/PfSE7BuAoy0YtVoNg/PsTKhAVauA2G7mFMncdkH6ntff4K8CCqVn
	S2d5H+rzxkIWrVGlpM+YmWMOP0P7RTuWxNvGj4WVaRx7zpqK/KQTK8kinMjJVgBQWu2/dlk2Jv6H7
	8PgeHzryNpxR1R09spQLqLv8dvZy3Modqc8mfELNKyPQHbRPJd3kB4uO7y6Kp7TkiZ8eZ6Y9B6r+z
	W64mlLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJqrg-00000003l6L-3nS3;
	Sat, 07 Dec 2024 09:12:40 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJqoe-00000003kZw-3Old
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 09:09:34 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Y52Ls6H0hz1T6bp;
	Sat,  7 Dec 2024 17:07:01 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 1113C140136;
	Sat,  7 Dec 2024 17:09:23 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 7 Dec
 2024 17:09:22 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <Dave.Martin@arm.com>, <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<jonathan.cameron@huawei.com>, <xiexiuqi@huawei.com>
Subject: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v3 5/5] arm_mpam: Adapting the closid/rmid matching determination functions
Date: Sat, 7 Dec 2024 17:21:36 +0800
Message-ID: <20241207092136.2488426-6-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241207092136.2488426-1-zengheng4@huawei.com>
References: <20241207092136.2488426-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_010933_184454_7AD05646 
X-CRM114-Status: GOOD (  12.00  )
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

According to the previous patches, add the inverse functions for the
closid/rmid conversion functions to serve as the conversion functions for
reqpartid/pmg. And adapt the matching determination functions
resctrl_arch_match_closid() and resctrl_arch_match_rmid() by the inverse
functions.

For the same reason, when updating the (req)PARTID/PMG pair for a task,
the new conversion functions also are used for adaptation.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 arch/arm64/include/asm/mpam.h              |  6 ++-
 drivers/platform/arm64/mpam/mpam_resctrl.c | 63 +++++++++++++++-------
 2 files changed, 47 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
index e5f385767174..9fc095530671 100644
--- a/arch/arm64/include/asm/mpam.h
+++ b/arch/arm64/include/asm/mpam.h
@@ -93,6 +93,8 @@ static inline u64 mpam_get_regval(struct task_struct *tsk)
 #endif
 }
 
+u32 rmid2pmg(u32 rmid);
+
 static inline void resctrl_arch_set_rmid(struct task_struct *tsk, u32 rmid)
 {
 #ifdef CONFIG_ARM64_MPAM
@@ -100,8 +102,8 @@ static inline void resctrl_arch_set_rmid(struct task_struct *tsk, u32 rmid)
 
 	regval &= ~MPAM1_EL1_PMG_D;
 	regval &= ~MPAM1_EL1_PMG_I;
-	regval |= FIELD_PREP(MPAM1_EL1_PMG_D, rmid);
-	regval |= FIELD_PREP(MPAM1_EL1_PMG_I, rmid);
+	regval |= FIELD_PREP(MPAM1_EL1_PMG_D, rmid2pmg(rmid));
+	regval |= FIELD_PREP(MPAM1_EL1_PMG_I, rmid2pmg(rmid));
 
 	WRITE_ONCE(task_thread_info(tsk)->mpam_partid_pmg, regval);
 #endif
diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c b/drivers/platform/arm64/mpam/mpam_resctrl.c
index 47e3a51b0942..cb5da3de907a 100644
--- a/drivers/platform/arm64/mpam/mpam_resctrl.c
+++ b/drivers/platform/arm64/mpam/mpam_resctrl.c
@@ -239,7 +239,7 @@ static u32 closid_rmid2reqpartid(u32 closid, u32 rmid)
 	return (req_idx << intpartid_shift) | closid;
 }
 
-static u32 rmid2pmg(u32 rmid)
+u32 rmid2pmg(u32 rmid)
 {
 	u8 pmg_shift = fls(mpam_pmg_max);
 	u32 pmg_mask = ~(~0 << pmg_shift);
@@ -247,6 +247,20 @@ static u32 rmid2pmg(u32 rmid)
 	return rmid & pmg_mask;
 }
 
+static u32 reqpartid2closid(u32 reqpartid)
+{
+	return req2intpartid(reqpartid);
+}
+
+static u32 reqpartid_pmg2rmid(u32 reqpartid, u32 pmg)
+{
+	u8 pmg_shift = fls(mpam_pmg_max);
+	u8 intpartid_shift = fls(mpam_intpartid_max);
+	u32 req_idx = (reqpartid >> intpartid_shift);
+
+	return (req_idx << pmg_shift) | pmg;
+}
+
 void resctrl_arch_sched_in(struct task_struct *tsk)
 {
 	lockdep_assert_preemption_disabled();
@@ -256,20 +270,24 @@ void resctrl_arch_sched_in(struct task_struct *tsk)
 
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
+		partid_d = resctrl_get_config_index(reqpartid, CDP_DATA);
+		partid_i = resctrl_get_config_index(reqpartid, CDP_CODE);
 
-		mpam_set_cpu_defaults(cpu, partid_d, partid_i, rmid, rmid);
+		mpam_set_cpu_defaults(cpu, partid_d, partid_i, pmg, pmg);
 	}
 }
 
@@ -289,41 +307,46 @@ void resctrl_arch_sync_cpu_closid_rmid(void *info)
 
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
+		partid_d = resctrl_get_config_index(reqpartid, CDP_DATA);
+		partid_i = resctrl_get_config_index(reqpartid, CDP_CODE);
 
-		mpam_set_task_partid_pmg(tsk, partid_d, partid_i, rmid, rmid);
+		mpam_set_task_partid_pmg(tsk, partid_d, partid_i, pmg, pmg);
 	}
 }
 
 bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid)
 {
 	u64 regval = mpam_get_regval(tsk);
-	u32 tsk_closid = FIELD_GET(MPAM1_EL1_PARTID_D, regval);
+	u32 tsk_partid = FIELD_GET(MPAM1_EL1_PARTID_D, regval);
 
 	if (cdp_enabled)
-		tsk_closid >>= 1;
+		tsk_partid >>= 1;
 
-	return tsk_closid == closid;
+	return reqpartid2closid(tsk_partid) == closid;
 }
 
 /* The task's pmg is not unique, the partid must be considered too */
 bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid)
 {
 	u64 regval = mpam_get_regval(tsk);
-	u32 tsk_closid = FIELD_GET(MPAM1_EL1_PARTID_D, regval);
-	u32 tsk_rmid = FIELD_GET(MPAM1_EL1_PMG_D, regval);
+	u32 tsk_pmg = FIELD_GET(MPAM1_EL1_PMG_D, regval);
+	u32 tsk_partid = FIELD_GET(MPAM1_EL1_PARTID_D, regval);
 
 	if (cdp_enabled)
-		tsk_closid >>= 1;
+		tsk_partid >>= 1;
 
-	return (tsk_closid == closid) && (tsk_rmid == rmid);
+	return (reqpartid2closid(tsk_partid) == closid) &&
+	       (reqpartid_pmg2rmid(tsk_partid, tsk_pmg) == rmid);
 }
 
 struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
-- 
2.25.1


