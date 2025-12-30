Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BF2E9412E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 09:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=523ljnXphvYWyh2qqOkyDzKwty7RiqB2tLyEg8M45UA=; b=ffXMq1ctWR3PclNtnZKr5NDAS/
	XtnxCMfPzC7SE6VMMCDogegYWAPxeIISi0EtW2fmdQ9Hp2yJLrhEwbojk1XQ3yhvp661KkLeoQclg
	aYlaSU8Uv9z9YJH+hg/xmUYhBK7B0m+d8wg6XM8zOH3HUev7WdRqWKhXYshmHkTmLpvbixyrdTTOs
	9I9qj3pB2W6yu1TbB9qgLWHy1ufWFynjstkCiik+df7Bra9yrcwb4j4ZN32xfa809ci8pnAwyWcD2
	3oOaVdq3ZuxwAfQQvRHawZild7I+xrq+w2IDOHjaVfZ7W4piSXk9F7LGULqbbcz1hLJ9nBC8YEJ6l
	Cq9xdzvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVmn-00000004eKK-2SRt;
	Tue, 30 Dec 2025 09:13:01 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVmk-00000004eJg-2O6l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 09:12:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1767085976; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=523ljnXphvYWyh2qqOkyDzKwty7RiqB2tLyEg8M45UA=;
	b=BJIljst1brF51J0SOHKmx/NFucLKChIaeZ7U8gMxZ3/XThTupqmFsyxeB3UlWMprf2q6n4PAZfSRBnCyDRqgbWfMKCWwwcUfCZ7VDfb17UeC+UMSoAnMmZ7gt8tIE5Rz60jeVYcD0KaXOWFtl/xVvjWqQFn2F+zGF2GTdHQmm1U=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WvzUoOF_1767085972 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 30 Dec 2025 17:12:54 +0800
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
Subject: [PATCH v5 12/17] ras: AEST: Allow configuring CE threshold via debugfs
Date: Tue, 30 Dec 2025 17:12:51 +0800
Message-Id: <20251230091251.49205-1-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20251230090945.43969-1-tianruidong@linux.alibaba.com>
References: <20251230090945.43969-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_011258_745984_6F431BA8 
X-CRM114-Status: UNSURE (   9.56  )
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
index 295df9e9b455..4d160072d37a 100644
--- a/Documentation/ABI/testing/debugfs-aest
+++ b/Documentation/ABI/testing/debugfs-aest
@@ -24,6 +24,14 @@ Description:
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
@@ -38,6 +46,14 @@ Contact:	Ruidong Tian <tianruidong@linux.alibaba.com>
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
2.47.3


