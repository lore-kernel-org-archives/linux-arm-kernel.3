Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E125DCCFA1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 06:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUq5DhLUNzIwJ7ckXy2d8jdi42eTB4J+AekOzS1QSkI=; b=zN9xw7sL7GcRqYyerkV2XkznQR
	DfRs8cYf7NqK76DoW6SkjtFs7LokwhSwhnnNzka67ks6YbNeIykZ9rQwRNj7flEb+gRoH1SAFPK9p
	58R5hTm8Iot1gJTpRzpe7aA1ET+jXZtKljc8xWGEnXYYLUgCLBNak3b7SCzkINggxDAbpLkZfl4Wl
	SxVh5YfJonC+tCXAF975EMNgQ5cHB6okYUac/TI+27gJdPEMmQs61YaknN8C9AndBII2sNfH9XyK5
	bceUcIUnVUPkfv+7tLq/VpowjccA3GPFgONjQ4wTaJpXJInBihXH1xsrKzQqTPYzir2lyJCoy5AoQ
	Kee9p24g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHG2I-0000000Gjco-1Vt2;
	Fri, 07 Nov 2025 06:33:26 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHG2D-0000000Gjb4-2H3L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 06:33:23 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=eUq5DhLUNzIwJ7ckXy2d8jdi42eTB4J+AekOzS1QSkI=;
	b=LG1YSPts9TGTqAfppCmTm2PNhvc1OUZjVanF6fB5IWXg8/Cc0K+THrQaEdVaAldTBZa4kW6YP
	qpX61AnnaHC5m6XGf11SGG7mBdHv47u1MyX9pXBP8ZoqQsOkmhuXuTZ5OphLYfMIALYFZ9qDYg1
	HuTjGxf6pvW6STFQnzEl7g8=
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4d2q2r2fz7zpTJm;
	Fri,  7 Nov 2025 14:31:32 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D676180B69;
	Fri,  7 Nov 2025 14:33:06 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 7 Nov
 2025 14:33:05 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <james.morse@arm.com>, <Dave.Martin@arm.com>, <ben.horgan@arm.com>
CC: <sunnanyong@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <zengheng4@huawei.com>,
	<jonathan.cameron@huawei.com>
Subject: [PATCH mpam mpam/snapshot+extras/v6.17-rc2 2/2] fs/resctrl: Migrate iommu_groups back when deleting the group
Date: Fri, 7 Nov 2025 14:33:00 +0800
Message-ID: <20251107063300.1580046-3-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251107063300.1580046-1-zengheng4@huawei.com>
References: <20251107063300.1580046-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.109]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_223321_928671_72F46F0A 
X-CRM114-Status: GOOD (  15.42  )
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

When deleting a control group or unmounting the resctrl file system, it
is necessary to move its all iommu_groups back to the default group. When
removing a monitor group, need to move its iommu_groups back to the parent
control group.

Otherwise, these iommu_groups remain bound to the old PARTID and PMG, and
they will appear to "disappear" from the resctrl fs.

By the way, remove the redundant formal parameter 'of' in
rdtgroup_move_iommu().

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 fs/resctrl/rdtgroup.c | 52 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 49 insertions(+), 3 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 4f4468e11dca..e74e192e9876 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -773,8 +773,7 @@ static int rdtgroup_move_task(pid_t pid, struct rdtgroup *rdtgrp,
 	return ret;
 }
 
-static int rdtgroup_move_iommu(int iommu_group_id, struct rdtgroup *rdtgrp,
-			       struct kernfs_open_file *of)
+static int rdtgroup_move_iommu(int iommu_group_id, struct rdtgroup *rdtgrp)
 {
 	const struct cred *cred = current_cred();
 	struct iommu_group *iommu_group;
@@ -855,7 +854,7 @@ static ssize_t rdtgroup_tasks_write(struct kernfs_open_file *of,
 
 		is_iommu = string_is_iommu_group(pid_str, &iommu_group_id);
 		if (is_iommu) {
-			ret = rdtgroup_move_iommu(iommu_group_id, rdtgrp, of);
+			ret = rdtgroup_move_iommu(iommu_group_id, rdtgrp);
 			if (ret) {
 				rdt_last_cmd_printf("Error while processing iommu_group %d\n",
 						     iommu_group_id);
@@ -3161,6 +3160,44 @@ static void rdt_move_group_tasks(struct rdtgroup *from, struct rdtgroup *to,
 	read_unlock(&tasklist_lock);
 }
 
+static int rdt_move_group_iommus(struct rdtgroup *from, struct rdtgroup *to)
+{
+	int err, iommu_group_id;
+	struct kset *iommu_groups;
+	struct iommu_group *group;
+	struct kobject *group_kobj = NULL;
+
+	if (!IS_ENABLED(CONFIG_RESCTRL_IOMMU))
+		return 0;
+
+	if (from == to)
+		return 0;
+
+	iommu_groups = iommu_get_group_kset();
+
+	while ((group_kobj = kset_get_next_obj(iommu_groups, group_kobj))) {
+		/* iommu_group_get_from_kobj() wants to drop a reference */
+		kobject_get(group_kobj);
+
+		group = iommu_group_get_from_kobj(group_kobj);
+		if (!group)
+			continue;
+
+		if (!from || iommu_matches_rdtgroup(group, from)) {
+			err = kstrtoint(group_kobj->name, 0, &iommu_group_id);
+			if (err)
+				break;
+
+			err = rdtgroup_move_iommu(iommu_group_id, to);
+			if (err)
+				break;
+		}
+	}
+
+	kset_put(iommu_groups);
+	return err;
+}
+
 static void free_all_child_rdtgrp(struct rdtgroup *rdtgrp)
 {
 	struct rdtgroup *sentry, *stmp;
@@ -3188,6 +3225,9 @@ static void rmdir_all_sub(void)
 	/* Move all tasks to the default resource group */
 	rdt_move_group_tasks(NULL, &rdtgroup_default, NULL);
 
+	/* Move all iommu_groups to the default resource group */
+	rdt_move_group_iommus(NULL, &rdtgroup_default);
+
 	list_for_each_entry_safe(rdtgrp, tmp, &rdt_all_groups, rdtgroup_list) {
 		/* Free any child rmids */
 		free_all_child_rdtgrp(rdtgrp);
@@ -4050,6 +4090,9 @@ static int rdtgroup_rmdir_mon(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
 	/* Give any tasks back to the parent group */
 	rdt_move_group_tasks(rdtgrp, prdtgrp, tmpmask);
 
+	/* Give any iommu_groups back to the parent group */
+	rdt_move_group_iommus(rdtgrp, prdtgrp);
+
 	/*
 	 * Update per cpu closid/rmid of the moved CPUs first.
 	 * Note: the closid will not change, but the arch code still needs it.
@@ -4097,6 +4140,9 @@ static int rdtgroup_rmdir_ctrl(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
 	/* Give any tasks back to the default group */
 	rdt_move_group_tasks(rdtgrp, &rdtgroup_default, tmpmask);
 
+	/* Give any iommu_groups back to the default group */
+	rdt_move_group_iommus(rdtgrp, &rdtgroup_default);
+
 	/* Give any CPUs back to the default group */
 	cpumask_or(&rdtgroup_default.cpu_mask,
 		   &rdtgroup_default.cpu_mask, &rdtgrp->cpu_mask);
-- 
2.25.1


