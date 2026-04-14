Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E7AF531EB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 03:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zS5pyTxAhYRFPNVTgqJtOQo9LbOdVKbgxsANQfgKZDQ=; b=mo6OtvREpYNZmaFXkDPpIBysLz
	FwD+eUsjAjRYt4uj2ZD/8MnjwGt7Rc81QHpSA4RwsL+sPHePBHghR+IQ+6bLzxP35t4sT/FtpSow5
	EeTz60JU8kegUxn7PMpSGW4+vwoYkZBlpPgPJwdSK14BX/jDXZtT78syyVFb4iJzAVIw5HpxK+1di
	HvigYerqYKYmInUvB6/4P1AnUNgbtlKBa1AuT1o3I7SuoOzMkdcvGsUeilLLG6zEjF6vGeTq5/1sT
	a49UU4Sd6G7cXYPrkt3N3Kp68apUkEldBT3LkG6wKX9ZTCI2PMngL8dNvpZTqlmgdrQ58DLAz1Aw9
	516N12dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUQQ-0000000GdgH-1rib;
	Tue, 14 Apr 2026 03:26:54 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUQM-0000000Gdet-3MAo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 03:26:52 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zS5pyTxAhYRFPNVTgqJtOQo9LbOdVKbgxsANQfgKZDQ=;
	b=OJVZsqxPbLtDqdHwe/XvbRTndzog1IKsUZw2VIe1wxrpQxrIvp8iasTiChjSR/zvgOiDRkwzj
	+JT4qcz2HiZZ3wEWVMIOfEdZXOheYO/VJH9h/YbTXolplJc05YNoEgkHYVkq9wLKvcFLIVDHQ7+
	0A3DYOqXHI7biJT5Ew7l/a0=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fvqKP1W2fzKm4w;
	Tue, 14 Apr 2026 11:20:25 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id A27EC40572;
	Tue, 14 Apr 2026 11:26:44 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 14 Apr
 2026 11:26:44 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <ben.horgan@arm.com>, <james.morse@arm.com>, <Dave.Martin@arm.com>,
	<fenghuay@nvidia.com>, <reinette.chatre@intel.com>
CC: <xiaqinxin@huawei.com>, <sunnanyong@huawei.com>,
	<jonathan.cameron@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH mpam mpam/snapshot+extras/v6.18-rc1 v2 3/3] fs/resctrl: Migrate IOMMU groups when removing resource groups
Date: Tue, 14 Apr 2026 11:26:10 +0800
Message-ID: <20260414032610.1523958-4-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260414032610.1523958-1-zengheng4@huawei.com>
References: <20260414032610.1523958-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.109]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_202651_316591_3784975C 
X-CRM114-Status: GOOD (  13.99  )
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

When deleting a control group, monitor group, or unmounting the resctrl
filesystem, migrate all associated IOMMU groups to the appropriate
destination:
  * Control group deletion: move IOMMU groups to the default group
  * Monitor group deletion: move IOMMU groups to the parent control group
  * Filesystem unmount: move all IOMMU groups to the default group

Without this migration, IOMMU groups remain bound to stale PARTID/PMG
values of the destroyed group, causing them to "disappear" from the
resctrl interface.

Add rdt_move_group_iommus() to handle this migration, mirroring the
existing rdt_move_group_tasks() pattern for task migration.

When deleting a control group or unmounting the resctrl file system, it
is necessary to move its all iommu_groups back to the default group. When
removing a monitor group, need to move its iommu_groups back to the parent
control group.

Otherwise, these iommu_groups remain bound to the old PARTID and PMG, and
they will appear to "disappear" from the resctrl fs.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 fs/resctrl/rdtgroup.c | 47 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index e92b5dcb6f2e..351e430bde1a 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3292,6 +3292,44 @@ static void rdt_move_group_tasks(struct rdtgroup *from, struct rdtgroup *to,
 	read_unlock(&tasklist_lock);
 }
 
+static int rdt_move_group_iommus(struct rdtgroup *from, struct rdtgroup *to)
+{
+	struct kset *iommu_groups;
+	struct iommu_group *group;
+	int err = 0, iommu_group_id;
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
@@ -3320,6 +3358,9 @@ static void rmdir_all_sub(void)
 	/* Move all tasks to the default resource group */
 	rdt_move_group_tasks(NULL, &rdtgroup_default, NULL);
 
+	/* Move all iommu_groups to the default resource group */
+	rdt_move_group_iommus(NULL, &rdtgroup_default);
+
 	list_for_each_entry_safe(rdtgrp, tmp, &rdt_all_groups, rdtgroup_list) {
 		/* Free any child rmids */
 		free_all_child_rdtgrp(rdtgrp);
@@ -4189,6 +4230,9 @@ static int rdtgroup_rmdir_mon(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
 	/* Give any tasks back to the parent group */
 	rdt_move_group_tasks(rdtgrp, prdtgrp, tmpmask);
 
+	/* Give any iommu_groups back to the parent group */
+	rdt_move_group_iommus(rdtgrp, prdtgrp);
+
 	/*
 	 * Update per cpu closid/rmid of the moved CPUs first.
 	 * Note: the closid will not change, but the arch code still needs it.
@@ -4239,6 +4283,9 @@ static int rdtgroup_rmdir_ctrl(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
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


