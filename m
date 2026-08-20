Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6D8C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 15:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrKwUPeORS8wt2sjjpsZKh/n8E8YlG/FmoB99tvPcuQ=; b=d8hHOZMaRN+834kl7FDXjDXDoo
	K8BYPi5wX6kDWym7NHvs6oKEw0V7wW2fku1/SFdMkm7ZLtaZMWbkiLcLfOc8RzgTgjrswGlV0JDS9
	HM93RYRlGjCf7VEu3942GSdXs3q8pt3iJ4Jbf7kGtg8o0az6MEUhBjxJqMP9U31foaaVOnV/XoamY
	1n63HuTyEMIED0MmO+HqI0Ru2IrBhmC6KWBFUvxYPfCFXhfoN2xzMh9oSiJdxLEGObeSE/LmpPWtE
	20v/vGKQJJzkoGvXWg8hAUQrR3qA2O+uMnuvyWcPPbhY5eGZHOc9XVLFNZMVITC8MYZZsdhvRI0A7
	1ECZO6Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4me-0000000Bome-113V;
	Thu, 20 Aug 2026 15:34:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4mU-0000000BogM-3CiQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 15:34:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 115B41D31;
	Thu, 20 Aug 2026 08:34:09 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1ED753F763;
	Thu, 20 Aug 2026 08:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787240052; bh=D+dw7q4S0N+yJRYhBUe7UafbY5UCUkJuweMW4eXTnyM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hcAJQxBJ99jeN2FBGZx4KLmW6K1tUomD2sPRr/GElxK2E5lma7f/fqEMbOs0gLeRA
	 ycH4w7bs81Xhjqll4F1K+eXNRJsHhUadwAGQC8CmHYBUTHpwXra/9+f8zXTIVAIG8E
	 4cfzSgLjkeHvkfIUyJiEuYLZ92/jZp76UVWSJSPI=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH 2/4] selftest/arm64: Treat KSM merge_across_nodes as optional
Date: Thu, 20 Aug 2026 16:33:24 +0100
Message-ID: <20260820153331.2448875-3-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260820153331.2448875-1-usama.anjum@arm.com>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_083414_891411_2592CDAD 
X-CRM114-Status: GOOD (  12.33  )
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

The MTE KSM test unconditionally saves, enables and restores the
merge_across_nodes sysfs attribute. The kernel only creates this
attribute when CONFIG_NUMA=y. A non-NUMA kernel consequently prints the
following message three times even though all KSM subtests pass:

  # ERR: missing /sys/kernel/mm/ksm/merge_across_nodes

Check whether the attribute exists and only access it when present. This
preserves the existing setup and restore behavior on NUMA kernels without
requiring NUMA or reducing KSM coverage on single-node systems.

Fixes: f981d8fa2646 ("kselftest/arm64: Verify KSM page merge for MTE pages")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 .../testing/selftests/arm64/mte/check_ksm_options.c  | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/arm64/mte/check_ksm_options.c b/tools/testing/selftests/arm64/mte/check_ksm_options.c
index 0cf5faef17248..b36945fc883d3 100644
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
@@ -22,6 +23,7 @@
 
 static size_t page_sz;
 static unsigned long ksm_sysfs[5];
+static bool has_merge_across_nodes;
 
 static unsigned long read_sysfs(char *str)
 {
@@ -56,8 +58,11 @@ static void write_sysfs(char *str, unsigned long val)
 
 static void mte_ksm_setup(void)
 {
-	ksm_sysfs[0] = read_sysfs(PATH_KSM "merge_across_nodes");
-	write_sysfs(PATH_KSM "merge_across_nodes", 1);
+	has_merge_across_nodes = !access(PATH_KSM "merge_across_nodes", F_OK);
+	if (has_merge_across_nodes) {
+		ksm_sysfs[0] = read_sysfs(PATH_KSM "merge_across_nodes");
+		write_sysfs(PATH_KSM "merge_across_nodes", 1);
+	}
 	ksm_sysfs[1] = read_sysfs(PATH_KSM "sleep_millisecs");
 	write_sysfs(PATH_KSM "sleep_millisecs", 0);
 	ksm_sysfs[2] = read_sysfs(PATH_KSM "run");
@@ -70,7 +75,8 @@ static void mte_ksm_setup(void)
 
 static void mte_ksm_restore(void)
 {
-	write_sysfs(PATH_KSM "merge_across_nodes", ksm_sysfs[0]);
+	if (has_merge_across_nodes)
+		write_sysfs(PATH_KSM "merge_across_nodes", ksm_sysfs[0]);
 	write_sysfs(PATH_KSM "sleep_millisecs", ksm_sysfs[1]);
 	write_sysfs(PATH_KSM "run", ksm_sysfs[2]);
 	write_sysfs(PATH_KSM "max_page_sharing", ksm_sysfs[3]);
-- 
2.47.3


