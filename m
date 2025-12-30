Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9C5E9412E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 09:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gZ+FgszbOmNjP1Y5tdd/BPgkyRM7WgfN7qlfJ3utgA=; b=XCTUldLfdvkQM2Ai1hx47f7clm
	qONN1xWNTiAw8mINYDHbJvkt0EtUsG2BAvkG+m57p8IBITPOewIopORGyhE/cyKQTb5ZTU36IHyyV
	00GiRZ1DbRxCsFOS/V6qH6NwhnkvzglgIUMB68IMiB7ll87WASbqdyxnVfU/KeR1zxNtnwkOV5C9y
	Eferflop/NPH9o8qC5hn+8Ubtgnm1JGyLWVbjR+2p6N5GBPiHmyFcH0tyRJ1W8fSQEAv4244IT8cS
	l+s9x2YGZcdws+iUYB3q51+rYK7LuY99ff6jEwoF3hKVHKqyCg7oEjM0dWpXVVyMCR2eVwVe7rkwn
	MAhqTEwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVkX-00000004ddU-02Dq;
	Tue, 30 Dec 2025 09:10:41 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVkE-00000004dK7-1RJR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 09:10:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1767085820; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=5gZ+FgszbOmNjP1Y5tdd/BPgkyRM7WgfN7qlfJ3utgA=;
	b=jl4z9WAYH3fYWnOFY+uiSSfe2BSpfkp1JdKptEVRRt+TX28+pkzAujgBWpyWJI/LTwjCgoo+kgtcX33EpLUEb0lHyu7JAJwbp7KM6+SoKtOA66pCPtqWn8seHnMARwx+VNf99XgDKX7WigHJElfj7UTbqYzf92e45PwNFrHi9L8=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WvzYJcp_1767085816 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 30 Dec 2025 17:10:17 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lpieralisi@kernel.org,
	guohanjun@huawei.com,
	sudeep.holla@arm.com,
	xueshuai@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	lenb@kernel.org,
	tony.luck@intel.com,
	bp@alien8.de,
	yazen.ghannam@amd.com,
	misono.tomohiro@fujitsu.com,
	fengwei_yin@linux.alibaba.com
Cc: tianruidong@linux.alibaba.com
Subject: [PATCH v5 11/17] ras: AEST: Add error count tracking and debugfs interface
Date: Tue, 30 Dec 2025 17:09:39 +0800
Message-Id: <20251230090945.43969-12-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20251230090945.43969-1-tianruidong@linux.alibaba.com>
References: <20251230090945.43969-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_011022_788444_A1F9CDB9 
X-CRM114-Status: GOOD (  13.51  )
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

This commit introduces error counting functionality for AEST records.
Previously, error statistics were not directly available for individual
error records or AEST nodes.

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 Documentation/ABI/testing/debugfs-aest | 14 ++++++
 drivers/ras/aest/aest-core.c           | 21 +++++++++
 drivers/ras/aest/aest-sysfs.c          | 64 ++++++++++++++++++++++++++
 drivers/ras/aest/aest.h                | 10 ++++
 4 files changed, 109 insertions(+)

diff --git a/Documentation/ABI/testing/debugfs-aest b/Documentation/ABI/testing/debugfs-aest
index 8bacc6bb20b6..295df9e9b455 100644
--- a/Documentation/ABI/testing/debugfs-aest
+++ b/Documentation/ABI/testing/debugfs-aest
@@ -24,9 +24,23 @@ Description:
 		See more at:
 			https://developer.arm.com/documentation/den0085/latest/
 
+What:		/sys/kernel/debug/aest/<name>.<id>/<node_name>/err_count
+Date:		Dec 2025
+KernelVersion	6.19
+Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
+Description:
+		(RO) Outputs error statistics for all error records of this node.
+
 What:		/sys/kernel/debug/aest/<name>.<id>/<node_name>/record<index>/err_*
 Date:		Dec 2025
 KernelVersion:	6.19
 Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
 Description:
 		(RO) Read err_* register and return val.
+
+What:		/sys/kernel/debug/aest/<name>.<id>/<node_name>/record<index>/err_count
+Date:		Dec 2025
+KernelVersion	6.19
+Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
+Description:
+		(RO) Outputs error statistics for all this records.
diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
index 3bcc635cf8e4..75cca98024ad 100644
--- a/drivers/ras/aest/aest-core.c
+++ b/drivers/ras/aest/aest-core.c
@@ -170,6 +170,27 @@ static int aest_node_gen_pool_add(struct aest_device *adev,
 	init_aest_event(event, record, regs);
 	llist_add(&event->llnode, &adev->event_list);
 
+	if (regs->err_status & ERR_STATUS_CE)
+		record->count.ce++;
+	if (regs->err_status & ERR_STATUS_DE)
+		record->count.de++;
+	if (regs->err_status & ERR_STATUS_UE) {
+		switch (regs->err_status & ERR_STATUS_UET) {
+		case ERR_STATUS_UET_UC:
+			record->count.uc++;
+			break;
+		case ERR_STATUS_UET_UEU:
+			record->count.ueu++;
+			break;
+		case ERR_STATUS_UET_UER:
+			record->count.uer++;
+			break;
+		case ERR_STATUS_UET_UEO:
+			record->count.ueo++;
+			break;
+		}
+	}
+
 	return 0;
 }
 
diff --git a/drivers/ras/aest/aest-sysfs.c b/drivers/ras/aest/aest-sysfs.c
index f3b5427ff4f0..b54e879506aa 100644
--- a/drivers/ras/aest/aest-sysfs.c
+++ b/drivers/ras/aest/aest-sysfs.c
@@ -7,6 +7,46 @@
 
 #include "aest.h"
 
+static void
+aest_error_count(struct aest_record *record, void *data)
+{
+	struct record_count *count = data;
+
+	count->ce += record->count.ce;
+	count->de += record->count.de;
+	count->uc += record->count.uc;
+	count->ueu += record->count.ueu;
+	count->uer += record->count.uer;
+	count->ueo += record->count.ueo;
+}
+
+/*******************************************************************************
+ *
+ * Debugfs for AEST node
+ *
+ ******************************************************************************/
+
+static int aest_node_err_count_show(struct seq_file *m, void *data)
+{
+	struct aest_node *node = m->private;
+	struct record_count count = { 0 };
+	int i;
+
+	for (i = 0; i < node->record_count; i++)
+		aest_error_count(&node->records[i], &count);
+
+	seq_printf(m, "CE: %llu\n"
+				"DE: %llu\n"
+				"UC: %llu\n"
+				"UEU: %llu\n"
+				"UEO: %llu\n"
+				"UER: %llu\n",
+				count.ce, count.de, count.uc, count.ueu,
+				count.uer, count.ueo);
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(aest_node_err_count);
+
 /*******************************************************************************
  *
  * Attribute for AEST record
@@ -37,6 +77,25 @@ DEFINE_AEST_DEBUGFS_ATTR(err_misc1, ERXMISC1);
 DEFINE_AEST_DEBUGFS_ATTR(err_misc2, ERXMISC2);
 DEFINE_AEST_DEBUGFS_ATTR(err_misc3, ERXMISC3);
 
+static int aest_record_err_count_show(struct seq_file *m, void *data)
+{
+	struct aest_record *record = m->private;
+	struct record_count count = { 0 };
+
+	aest_error_count(record, &count);
+
+	seq_printf(m, "CE: %llu\n"
+				"DE: %llu\n"
+				"UC: %llu\n"
+				"UEU: %llu\n"
+				"UEO: %llu\n"
+				"UER: %llu\n",
+				count.ce, count.de, count.uc, count.ueu,
+				count.uer, count.ueo);
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(aest_record_err_count);
+
 static void aest_record_init_debugfs(struct aest_record *record)
 {
 	debugfs_create_file("err_fr", 0600, record->debugfs, record,
@@ -55,6 +114,8 @@ static void aest_record_init_debugfs(struct aest_record *record)
 								&err_misc2_ops);
 	debugfs_create_file("err_misc3", 0600, record->debugfs, record,
 								&err_misc3_ops);
+	debugfs_create_file("err_count", 0400, record->debugfs, record,
+						&aest_record_err_count_fops);
 }
 
 static void
@@ -63,6 +124,9 @@ aest_node_init_debugfs(struct aest_node *node)
 	int i;
 	struct aest_record *record;
 
+	debugfs_create_file("err_count", 0400, node->debugfs, node,
+					&aest_node_err_count_fops);
+
 	for (i = 0; i < node->record_count; i++) {
 		record = &node->records[i];
 		if (!record->name)
diff --git a/drivers/ras/aest/aest.h b/drivers/ras/aest/aest.h
index ceb9e32bcee3..802430857dc4 100644
--- a/drivers/ras/aest/aest.h
+++ b/drivers/ras/aest/aest.h
@@ -116,6 +116,15 @@ struct ce_threshold {
 	u64 reg_val;
 };
 
+struct record_count {
+	u64 ce;
+	u64 de;
+	u64 uc;
+	u64 uer;
+	u64 ueo;
+	u64 ueu;
+};
+
 struct aest_record {
 	char *name;
 	int index;
@@ -136,6 +145,7 @@ struct aest_record {
 
 	struct ce_threshold ce;
 	enum ras_ce_threshold threshold_type;
+	struct record_count count;
 	struct dentry *debugfs;
 };
 
-- 
2.47.3


