Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AF1606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vL/L0Cwu;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=GhqrO+LQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7Mbged9ohUTFh2gXoTA/NXT9Yb48UsIJy14kPrg0dDQ=; b=vL/L0CwusjFxiJ6HhhqC3unlNv
	RotsThlhUOcokV7li3P7754KyfedDnLJn4WSPdruD14AW5AJH7SEwnRgY0GeuIps1inK5tBgdCedp
	7R/QnJXdwlI6QskReVX1Et9NP4wCp7dkIEfnFQUBxyRlPH8sj0Tg8MNNn/EECJMZkeFOxS9q7m9w7
	jfzIbGr8WblV5CQRTdE8kbdlJ9/Bi3pOtjlUGgb2rRpRmYLZ7PpoWw2rUoIyvr9U62k9HkXkkpzgh
	Tv72otnJvL25cbe/XB7eaDVyleDy020zwUt/av6rsoftOKVRm4UTk/CGvG6sJbAY3u9hhXcQ7MiWd
	4n7qAylQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFAq-0000000BXQG-3MNn;
	Fri, 06 Nov 2026 08:19:48 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFAn-0000000BXMT-2mIy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 08:19:48 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7Mbged9ohUTFh2gXoTA/NXT9Yb48UsIJy14kPrg0dDQ=;
	b=GhqrO+LQDITq5vbIGhEXVd9Ohnmlosd9tUiulCU4qU2Do3FHNTQ7PPHM1KYQ92H/aJMM6B7Nc
	7XtUwK1O/8xCOhEe8ab3KXFkCYAAuzGl5KNYEEzTXE7egpJpGKyqYSo/pKI4j0B11vW8Xyu5ILl
	n2bE6R8mff0SxXZLweK3PzU=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jLXCM64kgzmV8X;
	Fri,  6 Nov 2026 16:19:27 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id C214B40561;
	Fri,  6 Nov 2026 16:19:39 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 6 Nov
 2026 16:19:39 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <jic23@kernel.org>,
	<zengheng4@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v3] arm_mpam: resctrl: Limit num_rmids to the CLOSIDs in use
Date: Fri, 6 Nov 2026 16:19:23 +0800
Message-ID: <20261106081923.2333070-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_001946_014185_A8126842 
X-CRM114-Status: GOOD (  19.66  )
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

On MPAM an RMID is a PMG within a PARTID, so resctrl can only allocate
the PMGs of the CLOSIDs it uses. info/L3_MON/num_rmids is instead set
to the whole PARTID and PMG space when the monitors are initialised,
and halved when CDP is enabled. It reports more RMIDs than resctrl can
allocate in two cases:

- With CDP each CLOSID takes two PARTIDs, and resctrl halves the
  CLOSID count rounding down, while MPAM halves the whole RMID space.
  With 5 PARTIDs and 2 PMGs resctrl has 2 CLOSIDs and 4 RMIDs, but
  num_rmids reads 5. The count is too high whenever the number of
  PARTIDs is odd and there is more than one PMG.

- On a monitor-only system there are no control groups and resctrl
  only uses the default CLOSID, but num_rmids still covers every
  PARTID. With 5 PARTIDs and 2 PMGs it reads 10 while only 2 RMIDs
  can be allocated.

RMID allocation is limited to the CLOSIDs in use, so only the value
reported to userspace is too high. Creating as many monitor groups as
num_rmids allows fails with -ENOSPC before that number is reached.

Work out the number of CLOSIDs with the rules resctrl applies when it
is mounted: schemata_list_add() halves a resource's CLOSID count
while CDP is enabled on it, rounding down, closid_init() takes the
smallest across the resources, and a monitor-only system has only the
default CLOSID. Report (pmg_max + 1) RMIDs for each of those CLOSIDs,
counting at monitor initialisation and from
resctrl_arch_set_cdp_enabled(), which resctrl calls whenever a mount
or unmount enables or disables CDP.

Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 7.1.x
Cc: James Morse <james.morse@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>
---
v3:
- Drop resctrl_arch_set_mon_rmid_count() and count the CLOSIDs in the
  MPAM driver instead, as Ben suggested.
- v2: https://lore.kernel.org/all/20261105123304.2281987-1-ruanjinjie@huawei.com/
v2:
- Also fix num_rmids on monitor-only systems, as Ben suggested.
- Retitle from "arm_mpam: Round the CDP RMID count down to whole CLOSIDs".
- v1: https://lore.kernel.org/all/20261104101622.563280-1-ruanjinjie@huawei.com/
---
 drivers/resctrl/mpam_resctrl.c | 45 +++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5468367776e2..6859849f299b 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -191,6 +191,34 @@ static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)
 	 */
 }
 
+/* The RMID count follows the CLOSIDs resctrl uses. */
+static void mpam_resctrl_set_num_rmid(void)
+{
+	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
+	struct rdt_resource *l3 = &res->resctrl_res;
+	enum resctrl_res_level rid;
+	u32 num_closid = UINT_MAX;
+
+	for_each_mpam_resctrl_control(res, rid) {
+		u32 res_num_closid;
+
+		if (!res->resctrl_res.alloc_capable)
+			continue;
+
+		res_num_closid = mpam_partid_max + 1;
+		if (res->cdp_enabled)
+			res_num_closid /= 2;
+
+		num_closid = min(num_closid, res_num_closid);
+	}
+
+	/* Monitor-only systems have only the default CLOSID. */
+	if (num_closid == UINT_MAX)
+		num_closid = 1;
+
+	l3->mon.num_rmid = (mpam_pmg_max + 1) * num_closid;
+}
+
 int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 {
 	u32 partid_i = RESCTRL_RESERVED_CLOSID, partid_d = RESCTRL_RESERVED_CLOSID;
@@ -217,11 +245,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	cdp_enabled = enable;
 	mpam_resctrl_controls[rid].cdp_enabled = enable;
 
-	if (enable)
-		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx() / 2;
-	else
-		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
-
 	/* The mbw_max feature can't hide cdp as it's a per-partid maximum. */
 	if (cdp_enabled && !mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled)
 		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = false;
@@ -238,6 +261,8 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	if (!cdp_enabled && mpam_resctrl_controls[RDT_RESOURCE_MBA].class)
 		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = true;
 
+	mpam_resctrl_set_num_rmid();
+
 	if (enable) {
 		if (mpam_partid_max < 1)
 			return -EINVAL;
@@ -1344,15 +1369,7 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	l3->name = "L3";
 	l3->mon_scope = RESCTRL_L3_CACHE;
 
-	/*
-	 * num-rmid is the upper bound for the number of monitoring groups that
-	 * can exist simultaneously, including the default monitoring group for
-	 * each control group. Hence, advertise the whole rmid_idx space even
-	 * though each control group has its own pmg/rmid space. Unfortunately,
-	 * this does mean userspace needs to know the architecture to correctly
-	 * interpret this value.
-	 */
-	l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
+	mpam_resctrl_set_num_rmid();
 
 	if (type == QOS_L3_MBM_TOTAL_EVENT_ID) {
 		int err;
-- 
2.34.1


