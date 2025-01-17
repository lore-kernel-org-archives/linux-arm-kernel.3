Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7CCC02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 15:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZZpMa2kWOfpgxZ4ZtPrtKZDOSbsgN9dV/rV7uXW3EQ=; b=NaVSTSW4w3xCi+Fxc/PR//Mt2X
	Ace2EeebcP10rZKUSNEQaliR89w172+mXqI/6XDTy4X47apn3/ehATErVXhHk+8VtD+PcC/7gu5Js
	APXLr9smRZYl5hKsiLDIVQ8LHRh4uPKlG8VRK4g4YjDw/QxS/yW2Bc4u/JInHJV3nXY4SmjfQPWlF
	SCsQDY4rGiLRSd7xwwuxi9c8/Csa6wHYMQp/0kRkuCUJJj0toYdv3bADhVII+MjW61QP40QOmgzod
	zNpjCVmBdGruuWeBipQc2D2V86mem4cEwy8aIbumZItx/+Dqd3JW81pjrdcqhvtKc0HUmC0Hgf1j/
	nJZiNNSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYo64-00000000aeH-38xs;
	Fri, 17 Jan 2025 15:17:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYnzs-00000000ZFA-1RF5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 15:10:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E0C922C7;
	Fri, 17 Jan 2025 07:11:24 -0800 (PST)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F98B3F73F;
	Fri, 17 Jan 2025 07:10:55 -0800 (PST)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Zeng Heng <zengheng4@huawei.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH v2 04/11] fs/resctrl: Add arch hook to set up the default CLOSID
Date: Fri, 17 Jan 2025 15:10:14 +0000
Message-Id: <20250117151033.1517882-5-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117151033.1517882-1-Dave.Martin@arm.com>
References: <20250117151033.1517882-1-Dave.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_071056_476048_58151C88 
X-CRM114-Status: GOOD (  16.88  )
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

Currently, the resctrl core code assumes that CLOSID 0 requires no
special initialisation before use.

This is true on x86, but may not be true on other architectures
(including Arm MPAM, in certain configurations).

Since the allocation of CLOSIDs can depend on parameters such as
resctrl filesystem mount options that are not available at arch driver
init time, an arch hook is needed to set up the default CLOSID when
the resctrl filesystem is mounted.

Add a suitable arch hook resctrl_arch_init_domains().

Wire it up to arch stubs that do nothing, for now.
(This is also the right thing for x86.)

No functional change.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
---
 arch/x86/include/asm/resctrl.h | 12 ++++++++++++
 fs/resctrl/rdtgroup.c          | 26 ++++++++++++++++++++++++--
 include/linux/arm_mpam.h       | 10 ++++++++++
 include/linux/resctrl.h        |  2 ++
 4 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
index 332b0617d728..b5fbb94e756a 100644
--- a/arch/x86/include/asm/resctrl.h
+++ b/arch/x86/include/asm/resctrl.h
@@ -50,6 +50,18 @@ DECLARE_STATIC_KEY_FALSE(rdt_enable_key);
 DECLARE_STATIC_KEY_FALSE(rdt_alloc_enable_key);
 DECLARE_STATIC_KEY_FALSE(rdt_mon_enable_key);
 
+/* The default CLOSID needs no special setup on x86: */
+static inline bool resctrl_arch_default_closid_needs_init(void)
+{
+	return false;
+}
+
+/* ... so this won't be needed either: */
+static inline int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid)
+{
+	return 0;
+}
+
 static inline bool resctrl_arch_alloc_capable(void)
 {
 	return rdt_alloc_capable;
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 30f1dd05e10b..200f92e8f619 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -65,6 +65,8 @@ static struct seq_buf last_cmd_status;
 
 static char last_cmd_status_buf[512];
 
+static int rdtgroup_init_first_alloc(struct rdtgroup *rdtgrp);
+
 static int rdtgroup_setup_root(struct rdt_fs_context *ctx);
 
 static void rdtgroup_destroy_root(void);
@@ -2542,6 +2544,9 @@ static int rdt_get_tree(struct fs_context *fc)
 	}
 
 	closid_init();
+	ret = rdtgroup_init_first_alloc(&rdtgroup_default);
+	if (ret)
+		goto out_schemata_free;
 
 	if (resctrl_arch_mon_capable())
 		flags |= RFTYPE_MON;
@@ -3230,7 +3235,7 @@ static void rdtgroup_init_mba(struct rdt_resource *r, u32 closid)
 }
 
 /* Initialize the RDT group's allocations. */
-static int rdtgroup_init_alloc(struct rdtgroup *rdtgrp)
+static int __rdtgroup_init_alloc(struct rdtgroup *rdtgrp, bool first_time_init)
 {
 	struct resctrl_schema *s;
 	struct rdt_resource *r;
@@ -3251,7 +3256,11 @@ static int rdtgroup_init_alloc(struct rdtgroup *rdtgrp)
 				goto out;
 		}
 
-		ret = resctrl_arch_update_domains(r, rdtgrp->closid);
+		if (first_time_init)
+			ret = resctrl_arch_init_domains(r, rdtgrp->closid);
+		else
+			ret = resctrl_arch_update_domains(r, rdtgrp->closid);
+
 		if (ret < 0) {
 			rdt_last_cmd_puts("Failed to initialize allocations\n");
 			goto out;
@@ -3265,6 +3274,19 @@ static int rdtgroup_init_alloc(struct rdtgroup *rdtgrp)
 	return ret;
 }
 
+static int rdtgroup_init_alloc(struct rdtgroup *rdtgrp)
+{
+	return __rdtgroup_init_alloc(rdtgrp, false);
+}
+
+static int rdtgroup_init_first_alloc(struct rdtgroup *rdtgrp)
+{
+	if (!resctrl_arch_default_closid_needs_init())
+		return 0;
+
+	return __rdtgroup_init_alloc(rdtgrp, true);
+}
+
 static int mkdir_rdt_prepare_rmid_alloc(struct rdtgroup *rdtgrp)
 {
 	int ret;
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index c00b5fc1d235..dd5f18474846 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -45,6 +45,16 @@ static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
 	return val;
 }
 
+static inline bool resctrl_arch_default_closid_needs_init(void)
+{
+	return false;
+}
+
+static inline int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid)
+{
+	return 0;
+}
+
 bool resctrl_arch_alloc_capable(void);
 bool resctrl_arch_mon_capable(void);
 bool resctrl_arch_is_llc_occupancy_enabled(void);
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index be9d9f4c7b81..fc00b080f1a1 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -371,6 +371,8 @@ u32 resctrl_arch_system_num_rmid_idx(void);
 
 struct rdt_domain_hdr *resctrl_arch_find_domain(struct list_head *domain_list,
 						int id);
+bool resctrl_arch_default_closid_needs_init(void);
+int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid);
 int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid);
 
 bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt);
-- 
2.34.1


