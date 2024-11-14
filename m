Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BFED68B19
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 13:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hlukbRcGK6foTZEM9wlyNxrgIpobwxVv71eGziTF4OE=; b=ysD+O8cm2HMr0j9xPadAB8sJLP
	1j0+7I8N9wwgqqyKU4W++1mQ69TL08Z3/kLBKrJriWoe+F16knMy5WP3Kd8qiwbb5Um60EAKouwg6
	sZ6HMBvCT7pwgamT8seU2mrMy97o3iITiprA8NMy86SAQCYA33cSYfo4jUT/dZclfMw6sae1CFGeB
	JpeSmF1vLnvotXCQ+lPuSuJOPXk3NAqmKvybAzG3OcSpB2AT1jTDt0n8MklFiRrTlqe/EsCxaPMRg
	bjJ0MyO9gENhn+xF2dUXOQkC8EA73GjcqAI2n5C0NapNeiBJHtsR1o0JNVgviJYGReX6Nhehzbmmv
	01xD9mPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBaDi-0000000A6sD-2X0q;
	Thu, 14 Nov 2024 13:49:14 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBa2e-0000000A50F-2q0J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 13:37:53 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xq1Pd2rVjz2Dh42;
	Thu, 14 Nov 2024 21:35:49 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id D3422140153;
	Thu, 14 Nov 2024 21:37:40 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 14 Nov
 2024 21:37:40 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <james.morse@arm.com>, <Dave.Martin@arm.com>
CC: <bobo.shaobowang@huawei.com>, <linux-kernel@vger.kernel.org>,
	<jonathan.cameron@huawei.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [RFC PATCH mpam mpam/snapshot/v6.11-rc1 6/6] fs/resctrl: Add the helper to check if the task exists in the target group
Date: Thu, 14 Nov 2024 21:50:37 +0800
Message-ID: <20241114135037.918470-7-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241114135037.918470-1-zengheng4@huawei.com>
References: <20241114135037.918470-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_053749_125439_F99D879C 
X-CRM114-Status: GOOD (  16.22  )
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

After introducing the extension for monitoring feature, to check if a
closid exists within the target control group, it is not only check if the
closid of the control group is the same, but also to recursively check if
there is a closid of sub-monitor groups is the same. Therefore, a new
helper task_belongs_to_ctrl_group() is added.

On the x86 side, the closid of the child monitor group is the same as its
parent control group's (only the rmid is different), hence
resctrl_arch_match_rmid() can directly use the closid of the child monitor
group. Meanwhile, task_belongs_to_ctrl_group() can replace
resctrl_arch_match_closid() to be compatible with the x86 arch.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 fs/resctrl/rdtgroup.c | 52 +++++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 19 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 2e8ec20f0415..03c5c9eb9298 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -589,19 +589,38 @@ static void update_task_closid_rmid(struct task_struct *t)
 
 static bool task_in_rdtgroup(struct task_struct *tsk, struct rdtgroup *rdtgrp)
 {
-	u32 closid, rmid = rdtgrp->mon.rmid;
+	u32 closid, rmid;
 
-	if (rdtgrp->type == RDTCTRL_GROUP)
-		closid = rdtgrp->closid;
-	else if (rdtgrp->type == RDTMON_GROUP)
-		closid = rdtgrp->mon.parent->closid;
-	else
-		return false;
+	closid = rdtgrp->closid;
+	rmid = rdtgrp->mon.rmid;
 
 	return resctrl_arch_match_closid(tsk, closid) &&
 	       resctrl_arch_match_rmid(tsk, closid, rmid);
 }
 
+/**
+ * task_belongs_to_ctrl_group - the helper to check if the task exists in
+ *				the target control group.
+ * @tsk: task to be checked
+ * @rdtgrp: target control group
+ */
+static bool task_belongs_to_ctrl_group(struct task_struct *tsk, struct rdtgroup *rdtgrp)
+{
+	struct rdtgroup *crdtgrp;
+
+	/* Check whether exists in contrl group self */
+	if (resctrl_arch_match_closid(tsk, rdtgrp->closid))
+		return true;
+
+	/* Check if exists in one of children monitor groups */
+	list_for_each_entry(crdtgrp, &rdtgrp->mon.crdtgrp_list, mon.crdtgrp_list) {
+		if (resctrl_arch_match_closid(tsk, crdtgrp->closid))
+			return true;
+	}
+
+	return false;
+}
+
 static int __rdtgroup_move_task(struct task_struct *tsk,
 				struct rdtgroup *rdtgrp)
 {
@@ -618,17 +637,13 @@ static int __rdtgroup_move_task(struct task_struct *tsk,
 	 * their parent CTRL group.
 	 */
 	if (rdtgrp->type == RDTMON_GROUP &&
-	    !resctrl_arch_match_closid(tsk, rdtgrp->mon.parent->closid)) {
+	   !task_belongs_to_ctrl_group(tsk, rdtgrp->mon.parent)) {
 		rdt_last_cmd_puts("Can't move task to different control group\n");
 		return -EINVAL;
 	}
 
-	if (rdtgrp->type == RDTMON_GROUP)
-		resctrl_arch_set_closid_rmid(tsk, rdtgrp->mon.parent->closid,
-					     rdtgrp->mon.rmid);
-	else
-		resctrl_arch_set_closid_rmid(tsk, rdtgrp->closid,
-					     rdtgrp->mon.rmid);
+	resctrl_arch_set_closid_rmid(tsk, rdtgrp->closid,
+				     rdtgrp->mon.rmid);
 
 	/*
 	 * Ensure the task's closid and rmid are written before determining if
@@ -652,14 +667,13 @@ static int __rdtgroup_move_task(struct task_struct *tsk,
 static bool is_closid_match(struct task_struct *t, struct rdtgroup *r)
 {
 	return (resctrl_arch_alloc_capable() && (r->type == RDTCTRL_GROUP) &&
-		resctrl_arch_match_closid(t, r->closid));
+		task_belongs_to_ctrl_group(t, r));
 }
 
 static bool is_rmid_match(struct task_struct *t, struct rdtgroup *r)
 {
 	return (resctrl_arch_mon_capable() && (r->type == RDTMON_GROUP) &&
-		resctrl_arch_match_rmid(t, r->mon.parent->closid,
-					r->mon.rmid));
+		resctrl_arch_match_rmid(t, r->closid, r->mon.rmid));
 }
 
 /**
@@ -909,7 +923,7 @@ int proc_resctrl_show(struct seq_file *s, struct pid_namespace *ns,
 		    rdtg->mode != RDT_MODE_EXCLUSIVE)
 			continue;
 
-		if (!resctrl_arch_match_closid(tsk, rdtg->closid))
+		if (!task_belongs_to_ctrl_group(tsk, rdtg))
 			continue;
 
 		seq_printf(s, "res:%s%s\n", (rdtg == &rdtgroup_default) ? "/" : "",
@@ -917,7 +931,7 @@ int proc_resctrl_show(struct seq_file *s, struct pid_namespace *ns,
 		seq_puts(s, "mon:");
 		list_for_each_entry(crg, &rdtg->mon.crdtgrp_list,
 				    mon.crdtgrp_list) {
-			if (!resctrl_arch_match_rmid(tsk, crg->mon.parent->closid,
+			if (!resctrl_arch_match_rmid(tsk, crg->closid,
 						     crg->mon.rmid))
 				continue;
 			seq_printf(s, "%s", crg->kn->name);
-- 
2.25.1


