Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE67AE6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 09:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DnOhC3gDzjPKL1u8Gf/D8zWgsYNDRy9TN8Idu01s0JM=; b=FbnE0EvTrN9cvqofmc4PwefcfD
	RrasMtLeanLRRL3DuswyD4l+LDMvhDyZI7vi0Njmou7HK5SkOLrYZoYL9K0aQ7v6d4KadM1xO3/an
	/kiBncqJgCxDKVopaAPHBa8oRf1ZWRzk3Hko6NUGvAO4I2sq9Tk/1ZATeN1A0aOECIxlgAAkC49ox
	jrHthH0q691J69mFJmfzdZoVBjRjNllNzfThm3RyF9au0oqDJjKTnpUdiLKSLC+6EeI5te1UwLwCx
	iicXoIsyjy/h9KMcTcErm3YGS8cFv2r+jJBowXH2TWeAjgy056qT4meTxdTgfqsEKSImckrKb+N1x
	9wtzL/tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcTA-0000000DXsO-2MJi;
	Mon, 22 Dec 2025 09:44:48 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcT2-0000000DXii-1htS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 09:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1766396678; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=DnOhC3gDzjPKL1u8Gf/D8zWgsYNDRy9TN8Idu01s0JM=;
	b=vEiurCNNtobkHQG2qhfJdjf1bNHNZMUaV9WbJFQlFBdBwqOKr+nh4c0LWbegbvF/LUqIMHA98PPTKReVSRMRrI1TaR7yVa9/5k/GvlSaOjNtYGQOwpLHUGYLr/Ow8WoCF1b/yQmpyzjXEMQOemf10W5Bkh+V+jNTOIc9HvR2cu8=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WvOT.WZ_1766396671 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 22 Dec 2025 17:44:33 +0800
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
	misono.tomohiro@fujitsu.com
Cc: tianruidong@linux.alibaba.com
Subject: [PATCH v4 12/17] ras: AEST: Allow configuring CE threshold via debugfs
Date: Mon, 22 Dec 2025 17:43:45 +0800
Message-Id: <20251222094351.38792-13-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20251222094351.38792-1-tianruidong@linux.alibaba.com>
References: <20251222094351.38792-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_014440_651185_2A576EE9 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

This commit introduces the ability to configure the Corrected Error (CE)
threshold for AEST records through debugfs. This allows administrators to
dynamically adjust the CE threshold for error reporting.

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 Documentation/ABI/testing/debugfs-aest | 16 ++++++++++
 drivers/ras/aest/aest-sysfs.c          | 42 ++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/Documentation/ABI/testing/debugfs-aest b/Documentation/ABI/testing/debugfs-aest
index a984fcedede2..76ba1b77b274 100644
--- a/Documentation/ABI/testing/debugfs-aest
+++ b/Documentation/ABI/testing/debugfs-aest
@@ -23,6 +23,14 @@ Description:
 		See more at:
 			https://developer.arm.com/documentation/den0085/latest/
 
+What:		/sys/kernel/debug/aest/<name>.<id>/<node_name>/ce_threshold
+Date:		Dec 2025
+KernelVersion	6.19
+Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
+Description:
+		(WO) Write the ce threshold to all records of this node. Failed
+		if input exceeded the maximum threshold
+
 What:		/sys/kernel/debug/aest/<name>.<id>/<node_name>/err_count
 Date:		Dec 2025
 KernelVersion	6.19
@@ -37,6 +45,14 @@ Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
 Description:
 		(RO) Read err_* register and return val.
 
+What:		/sys/kernel/debug/aest/<name>.<id>/<node_name>/record<index>/ce_threshold
+Date:		Dec 2025
+KernelVersion	6.19
+Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
+Description:
+		(RW) Read and write the ce threshold to this record. Failed
+		if input exceeded the maximum threshold
+
 What:		/sys/kernel/debug/aest/<name>.<id>/<node_name>/record<index>/err_count
 Date:		Dec 2025
 KernelVersion	6.19
diff --git a/drivers/ras/aest/aest-sysfs.c b/drivers/ras/aest/aest-sysfs.c
index b54e879506aa..392e7ad8328e 100644
--- a/drivers/ras/aest/aest-sysfs.c
+++ b/drivers/ras/aest/aest-sysfs.c
@@ -7,6 +7,25 @@
 
 #include "aest.h"
 
+static void
+aest_store_threshold(struct aest_record *record, void *data)
+{
+	u64 err_misc0, *threshold = data;
+	struct ce_threshold *ce = &record->ce;
+
+	if (*threshold > ce->info->max_count)
+		return;
+
+	ce->threshold = *threshold;
+	ce->count = ce->info->max_count - ce->threshold + 1;
+
+	err_misc0 = record_read(record, ERXMISC0);
+	ce->reg_val = (err_misc0 & ~ce->info->mask) |
+			(ce->count << ce->info->shift);
+
+	record_write(record, ERXMISC0, ce->reg_val);
+}
+
 static void
 aest_error_count(struct aest_record *record, void *data)
 {
@@ -77,6 +96,27 @@ DEFINE_AEST_DEBUGFS_ATTR(err_misc1, ERXMISC1);
 DEFINE_AEST_DEBUGFS_ATTR(err_misc2, ERXMISC2);
 DEFINE_AEST_DEBUGFS_ATTR(err_misc3, ERXMISC3);
 
+static int record_ce_threshold_get(void *data, u64 *val)
+{
+	struct aest_record *record = data;
+
+	*val = record->ce.threshold;
+	return 0;
+}
+
+static int record_ce_threshold_set(void *data, u64 val)
+{
+	u64 threshold = val;
+	struct aest_record *record = data;
+
+	aest_store_threshold(record, &threshold);
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(record_ce_threshold_ops, record_ce_threshold_get,
+					record_ce_threshold_set, "%llu\n");
+
 static int aest_record_err_count_show(struct seq_file *m, void *data)
 {
 	struct aest_record *record = m->private;
@@ -116,6 +156,8 @@ static void aest_record_init_debugfs(struct aest_record *record)
 								&err_misc3_ops);
 	debugfs_create_file("err_count", 0400, record->debugfs, record,
 						&aest_record_err_count_fops);
+	debugfs_create_file("ce_threshold", 0600, record->debugfs, record,
+						&record_ce_threshold_ops);
 }
 
 static void
-- 
2.51.2.612.gdc70283dfc


