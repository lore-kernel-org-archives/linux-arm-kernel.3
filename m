Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60201EBFD16
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=op08HCqJ4u4oJC1zLRF5Zh2ZqxSUZczSTa3QNhH8QVA=; b=IR4ibVwesoH5BKjY1Da9ZTpBXu
	cbsXh2mEVoHm8y4BJJTUOCAEmj9rQ54QuKxZZ9ZsEtWaF7LXgckyvn5+BpSAZB5nMSMmFmNxddvgW
	kYfGwmbRB3UHuYAEPeYzge7z3FZ6BqgLSkmjUL/vNeSiBK0BdSBQt4qLqTsjQIyclJ5irf/ncS1YT
	x61SHCulaYEUPVUJrH0agZNxbIpV7L0BR+rwdRKMCgx0uefT3Axv37l4YCrnfZEsONFeuiz7liUlB
	0G7EEeRdBKzLmC+9pniOJWoNKSqzDetKgRGXr6s/NFVIV0TVH37gvXwhGOratMoRljlgLEojR4aJH
	Y/V7p+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD4g-0000000FJLI-1KA7;
	Mon, 13 Apr 2026 08:55:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD4e-0000000FJK4-22CB
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Apr 2026 08:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=op08HCqJ4u4oJC1zLRF5Zh2ZqxSUZczSTa3QNhH8QVA=; b=pyuzoVYC+6H0M4W83FxzaHX7GB
	2BwVkZftd+4Y8mYu9aLXzRpLX7jnjA2+a9Da/wOhJAYj1seN5GvqeAp9SgTNtF1mJyJyKLwcZcq3J
	MfTODHHOy3w1m+KDzSE0izTlhULTEwKp+LI+25X+f9xy4eD51GKv/rKIU3CADeNfYA1rmTr4/Yccn
	RMIS0UK7w6JYFrT3hjgwcK83ZlkM0MjZyyY/USs2vqrhoiOKNJrtSORjVaZ6QNR2/9zLpG8ArsuEo
	VjJnTUImBCz2DYTpftyKf80BhwnLZGj91aTK5YMZcWjxbJJKc7OnvsSw+LBbdYOGcJd7uiCWsNnTJ
	1/YhWYWw==;
Received: from [113.46.200.219] (helo=canpmsgout04.his.huawei.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD47-0000000GR5R-1SS3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 08:54:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=op08HCqJ4u4oJC1zLRF5Zh2ZqxSUZczSTa3QNhH8QVA=;
	b=G2FLyrGrPKf+8n2pI2yjcDLwbWNb6INdPxOhRr6yWLH71z2EQondVn7PF1bd6al4gjqmGE/E4
	Cef/wBNiNoPrycoMuwQn9j8JES9tGwR1GzorG8WFLDb9KC0wtLKW3AYw0BLg3EhsgCadNf9AJpp
	2SyrGg5C9yO+/ySKohZ2ePY=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fvLdm54zxz1prNH;
	Mon, 13 Apr 2026 16:47:56 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 97BDD40561;
	Mon, 13 Apr 2026 16:54:16 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 13 Apr
 2026 16:54:15 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <ben.horgan@arm.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<tan.shaopeng@jp.fujitsu.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tglx@kernel.org>, <will@kernel.org>, <hpa@zytor.com>,
	<bp@alien8.de>, <babu.moger@amd.com>, <dave.hansen@linux.intel.com>,
	<mingo@redhat.com>, <tony.luck@intel.com>, <gshan@redhat.com>,
	<catalin.marinas@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <wangkefeng.wang@huawei.com>
Subject: [PATCH v8 next 01/10] fs/resctrl: Fix MPAM Partid parsing errors by preserving CDP state during umount
Date: Mon, 13 Apr 2026 16:53:56 +0800
Message-ID: <20260413085405.1166412-2-zengheng4@huawei.com>
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
X-CRM114-CacheID: sfid-20260413_095444_116522_008C244C 
X-CRM114-Status: GOOD (  13.02  )
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

This patch fixes a pre-existing issue in the resctrl filesystem teardown
sequence where premature clearing of cdp_enabled could lead to MPAM Partid
parsing errors.

The closid to partid conversion logic inherently depends on the global
cdp_enabled state. However, rdt_disable_ctx() clears this flag early in
the umount path, while free_rmid() operations will reference after that.
This creates a window where partid parsing operates with inconsistent CDP
state, potentially makes monitor reads with wrong partid mapping.

Additionally, rmid_entry remaining in limbo between mount sessions may
trigger potential partid out-of-range errors, leading to MPAM fault
interrupts and subsequent MPAM disablement.

Reorder rdt_kill_sb() to delay rdt_disable_ctx() until after
rmdir_all_sub() and resctrl_fs_teardown() complete. This ensures
all rmid-related operations finish with correct CDP state.

Introduce rdt_flush_limbo() to flush and cancel limbo work before the
filesystem teardown completes. An alternative approach would be to cancel
limbo work on umount and restart it on remount with remaked bitmap.
However, this would require substantial changes in the resctrl layer to
handle CDP state transitions across mount sessions, which is beyond the
scope of the reqpartid feature work this patchset focuses on. The current
fix addresses the immediate correctness issue with minimal churn.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 fs/resctrl/rdtgroup.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5dfdaa6f9d8f..69966589713f 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3169,6 +3169,25 @@ static void resctrl_fs_teardown(void)
 	rdtgroup_destroy_root();
 }
 
+static void rdt_flush_limbo(void)
+{
+	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	struct rdt_l3_mon_domain *d;
+
+	if (!IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID))
+		return;
+
+	if (!resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
+		return;
+
+	list_for_each_entry(d, &r->mon_domains, hdr.list) {
+		if (has_busy_rmid(d)) {
+			__check_limbo(d, true);
+			cancel_delayed_work(&d->cqm_limbo);
+		}
+	}
+}
+
 static void rdt_kill_sb(struct super_block *sb)
 {
 	struct rdt_resource *r;
@@ -3176,13 +3195,14 @@ static void rdt_kill_sb(struct super_block *sb)
 	cpus_read_lock();
 	mutex_lock(&rdtgroup_mutex);
 
-	rdt_disable_ctx();
-
 	/* Put everything back to default values. */
 	for_each_alloc_capable_rdt_resource(r)
 		resctrl_arch_reset_all_ctrls(r);
 
 	resctrl_fs_teardown();
+	rdt_flush_limbo();
+	rdt_disable_ctx();
+
 	if (resctrl_arch_alloc_capable())
 		resctrl_arch_disable_alloc();
 	if (resctrl_arch_mon_capable())
-- 
2.25.1


