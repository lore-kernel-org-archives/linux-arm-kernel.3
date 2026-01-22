Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30E8C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 09:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FceONJwVjg8vdGz5WZuq5fGe+EXqsU2TZx7AP6HAvqc=; b=CBf1C2yvxlAvKubFbM6VjgxiCh
	iKZYIAtWO5xNwZnX7Xtamly6YdPtT+s9cpcsrJWJBzWTF3+ym8mlD9VZl5I3/M6Y3544A3Pe5kPsi
	glq474VHj7GfT1jAVAPPbAyCNPW1U6EyuC5wwXlS3WUiRcLiqJ8f1t8T+MrVCapDU+qfjAIJn6cWW
	aT6XEFFA6POiR49GX6N2fYN1x5jvuovuwZV07/VgqJAn493/tAwlH+MlzoFz5mP/BSAOXYLWEZy/y
	SBbEvBp/teLXgSJNqOfTR6R2iN+9W5ZPkhr6yjc95C2KqPR6gHQahYOtYXRXO3fVbzFpe6ONvjOnB
	IjyQWk/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virJA-00000006m9B-2aMg;
	Thu, 22 Jan 2026 09:48:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virJ7-00000006m6d-2tRe
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 09:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FceONJwVjg8vdGz5WZuq5fGe+EXqsU2TZx7AP6HAvqc=; b=Pate9klqfR4bep8IGZ18lL18ek
	CtwS9wSGM+IYCSAsiFj4/1JKGr0rYifsg0JrEMfzrTu/xOUCjx3pAv6Ek0aA+int04l03g8EU+qbo
	TYxgkdMIG62UrkyX0Dt6U2uKwUXfm6S//XKSXHh8eIiTD0ToLIQD8O+LurnBC1CxQkqd0nNlu2cU8
	q3J2J/ijnOvGLY++aGS4Jt8GpREPF1N3qtSzM/kcg3hRMWXuRaHj1iAz3iX0V7m7uVo0/6Mh6FTwB
	G/OaOPKy9gV8fkFzcigdUYgKPpkJQhnAdltkALOyGC5RB+uONkaFjr1rpl/KO28akTtkA5a1oV2Yf
	MB9G2JSg==;
Received: from out199-12.us.a.mail.aliyun.com ([47.90.199.12])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virIl-000000004vg-3ISX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 09:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769075304; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=FceONJwVjg8vdGz5WZuq5fGe+EXqsU2TZx7AP6HAvqc=;
	b=ds1CjAwLfavFRMRzMTflAik37IA2LcvAGz65rfDUXdgkDFVEo3D07iSDgfrBk+kihygjWeTqV7lDk++f8kB5uK29yXxVhsvi3u0zWfc08yQfQLUut+SUMn5dWBrBHAtrG95BQ2HtfWSdYpvVWdthKNw+cqhLJSYVybiV0x8U+mQ=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0Wxbwgq9_1769075300 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 22 Jan 2026 17:48:23 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lpieralisi@kernel.org,
	guohanjun@huawei.com,
	sudeep.holla@arm.com,
	rafael@kernel.org,
	robin.murphy@arm.com,
	mark.rutland@arm.com,
	tony.luck@intel.com,
	bp@alien8.de,
	tglx@linutronix.de,
	peterz@infradead.org
Cc: lenb@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-edac@vger.kernel.org,
	mchehab@kernel.org,
	xueshuai@linux.alibaba.com,
	zhuo.song@linux.alibaba.com,
	oliver.yang@linux.alibaba.com,
	Ruidong Tian <tianruidong@linux.alibaba.com>
Subject: [PATCH v6 12/16] ras: AEST: Allow configuring CE threshold via debugfs
Date: Thu, 22 Jan 2026 17:46:52 +0800
Message-Id: <20260122094656.73399-13-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20260122094656.73399-1-tianruidong@linux.alibaba.com>
References: <20260122094656.73399-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
2.51.2.612.gdc70283dfc


