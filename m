Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC388C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 11:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fe+vTeuIVkMBIA4IKccF/gz9ndMpBV+z0ccWPAw1XX4=; b=B9EQWSyuHfuSkG8MtNAwb0yMBk
	yivc/r9SV0nyj/tmNuMfsA9e65Tt9Gm60sIxp2z1nHIbV/JcsNhE+A/CtEZwAwqVoF+AZjCNKlg6A
	nfiKDkMfwXAeaBiOBy+Jkj5lHq7al+lg4KsK8zJn2NIq6V/FdMFEzP8Q7FVN8gZGDs8j0S/lZjBex
	QIyvcKpm6oM6hYYHBXVbx2Erxp1GrdwK19cvCGR15wMQOvLEJX7mjseZ2TH0oCkh1zn1WO3PBONYx
	uytrwcEV7f3ZICxB5L2KfDegLpGv2y/GO/M5nEFvAhx8YSDuxO1GtvTbt61Xpc6eBjU4mIdrhT5vx
	f2KgAqjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypBs-00000000fu0-2LER;
	Tue, 25 Aug 2026 11:19:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypBq-00000000fss-1OZl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 11:19:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D62B1153B;
	Tue, 25 Aug 2026 04:19:32 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F3FDD3F66F;
	Tue, 25 Aug 2026 04:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787656776; bh=Y1Jm9L8yq2zLLxZ+1oux911Vfzwh3bqWb+6GBVfCttY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MGRmZ9//+KJRAOFuhZSDw7Zy4T/DqMF4lMScreEy/Cj23WmOGrqxFWASnk+UyXAz+
	 B8dSJDnH4kJ+4jWZnsEIjc7jCbyNHsA7siRCPcHSgYYFUhASkBFWPEYdZtyOYqZngr
	 6F7c+WfXtF6w7rkL+brmd7jriOF1y3WS9g2nXCow=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH v3 2/4] selftests/arm64: Treat KSM merge_across_nodes as optional
Date: Tue, 25 Aug 2026 12:18:35 +0100
Message-ID: <20260825111929.2882324-3-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825111929.2882324-1-usama.anjum@arm.com>
References: <20260825111929.2882324-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_041938_456359_32B7C638 
X-CRM114-Status: GOOD (  17.42  )
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

The MTE KSM test requires write access to KSM sysfs but does not check
that it is running as root. It also unconditionally saves, enables and
restores the merge_across_nodes attribute. The kernel only creates this
attribute when CONFIG_NUMA=y, so a non-NUMA kernel prints the following
message three times even though every KSM subtest passes:

  # ERR: missing /sys/kernel/mm/ksm/merge_across_nodes

Skip the test when it is not running as root. Check that the optional
attribute is readable and writable, treating ENOENT as its expected
absence on non-NUMA kernels and skipping the test for other access
failures. Only save, enable and restore the attribute when it is
available.

Check MTE availability before the privilege and sysfs checks so systems
without MTE retain the existing feature-unavailable skip result.

This preserves the existing behavior on NUMA kernels without requiring
NUMA or reducing KSM coverage on single-node systems.

Fixes: f981d8fa2646 ("kselftest/arm64: Verify KSM page merge for MTE pages")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
Changes since v2:
- Skip on merge_across_nodes access errors other than ENOENT.

Changes since v1:
- Check MTE availability before requiring root and validating
  merge_across_nodes access.
- Use the selftests/arm64 subject prefix.
---
 .../selftests/arm64/mte/check_ksm_options.c   | 29 +++++++++++++++++--
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/arm64/mte/check_ksm_options.c b/tools/testing/selftests/arm64/mte/check_ksm_options.c
index 866f0929b6647..4855b737d5507 100644
--- a/tools/testing/selftests/arm64/mte/check_ksm_options.c
+++ b/tools/testing/selftests/arm64/mte/check_ksm_options.c
@@ -6,6 +6,7 @@
 #include <errno.h>
 #include <fcntl.h>
 #include <signal.h>
+#include <stdbool.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -22,6 +23,20 @@
 
 static size_t page_sz;
 static unsigned long ksm_sysfs[5];
+static bool has_merge_across_nodes;
+
+static bool merge_across_nodes_available(void)
+{
+	const char *path = PATH_KSM "merge_across_nodes";
+
+	if (!access(path, R_OK | W_OK))
+		return true;
+	if (errno == ENOENT)
+		return false;
+
+	ksft_exit_skip("Unable to read and write %s: %s\n", path,
+		       strerror(errno));
+}
 
 static unsigned long read_sysfs(char *str)
 {
@@ -56,8 +71,10 @@ static void write_sysfs(char *str, unsigned long val)
 
 static void mte_ksm_setup(void)
 {
-	ksm_sysfs[0] = read_sysfs(PATH_KSM "merge_across_nodes");
-	write_sysfs(PATH_KSM "merge_across_nodes", 1);
+	if (has_merge_across_nodes) {
+		ksm_sysfs[0] = read_sysfs(PATH_KSM "merge_across_nodes");
+		write_sysfs(PATH_KSM "merge_across_nodes", 1);
+	}
 	ksm_sysfs[1] = read_sysfs(PATH_KSM "sleep_millisecs");
 	write_sysfs(PATH_KSM "sleep_millisecs", 0);
 	ksm_sysfs[2] = read_sysfs(PATH_KSM "run");
@@ -70,7 +87,8 @@ static void mte_ksm_setup(void)
 
 static void mte_ksm_restore(void)
 {
-	write_sysfs(PATH_KSM "merge_across_nodes", ksm_sysfs[0]);
+	if (has_merge_across_nodes)
+		write_sysfs(PATH_KSM "merge_across_nodes", ksm_sysfs[0]);
 	write_sysfs(PATH_KSM "sleep_millisecs", ksm_sysfs[1]);
 	write_sysfs(PATH_KSM "run", ksm_sysfs[2]);
 	write_sysfs(PATH_KSM "max_page_sharing", ksm_sysfs[3]);
@@ -137,6 +155,11 @@ int main(int argc, char *argv[])
 	err = mte_default_setup();
 	if (err)
 		return err;
+
+	if (geteuid() != 0)
+		ksft_exit_skip("Please run the test as root\n");
+
+	has_merge_across_nodes = merge_across_nodes_available();
 	page_sz = getpagesize();
 	if (!page_sz) {
 		ksft_print_msg("ERR: Unable to get page size\n");
-- 
2.47.3


