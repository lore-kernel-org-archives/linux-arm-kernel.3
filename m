Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EE0C02196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 10:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zoyyTWy8+Zu7JkfSAKSCzAU5xw+8zxp6lIz7/LeWBsU=; b=Jngtw8WXnMgQWyVPVaFX5m++cu
	F26RaWAtU9/6VhWCUMm1+15VQ8+5w0TgCHycaNTNy/zYbASjEf90qG4nbFltvQMOIMD9pvA1lUhEZ
	WaH7T3V6J2ILf+k4Dh/q+33bM8MgF/1uLGA0m4zl75l9DsmBXLPaj7tXzkvedv3FbY1VTaSOV3AB5
	DZf5u6HonkCC3sbGPbfJUf6Rt0366BHpWattA4381YsW5VIO/B9lJ2InQ3BLk8c+nlKJ22v4IJZcA
	A43oBjEb4Kygyc6JUu+XAIcY5mGDRnKERtnSDQ2GFjChGyKBFh7ffnOR9N8zdvMd0qzXRc2X1/kCQ
	lNSWYM+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teu8m-0000000FAlZ-3uao;
	Mon, 03 Feb 2025 10:57:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tethP-0000000F7WE-3TTe
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 10:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zoyyTWy8+Zu7JkfSAKSCzAU5xw+8zxp6lIz7/LeWBsU=; b=NqhUCjVzzNH9IYAYME2YURfEs+
	10+BBOC2Lv61RFNIHywHyCixVHcLyCnxaTqT7VpIBS/hFYt3UjUwJ44ocnvbavu2mjK0in8J39chd
	tdGegS9+NhqwlZShrDnu0GG4ZHpADkKpfvc4CbH18ZquEWiU/t1roilPZY6V3Llr9iQ/PJYZCpacJ
	UBK30uH3HfuNTFKfmFlkOfzKulSIK1J5wF7K0rXmbNQ8UYMqj6bJu4vnaUBJRvDEwuPsjSItaruvt
	0d0KeFMJ0NUJqyPG/qlSQOVBffYdXhNvvECrWEFfIxIIGPX3gFdck+2gDwgEB6MVNnUZ9j3sUMeE0
	Z7V6sCgg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tethM-0000000G3y1-2q4F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 10:29:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5909D1BCA;
	Mon,  3 Feb 2025 02:29:24 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AE363F7BD;
	Mon,  3 Feb 2025 02:28:56 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Howells <dhowells@redhat.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [RFC PATCH 8/8] mm: Add basic tests for kpkeys_hardened_cred
Date: Mon,  3 Feb 2025 10:28:09 +0000
Message-ID: <20250203102809.1223255-9-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250203102809.1223255-1-kevin.brodsky@arm.com>
References: <20250203102809.1223255-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_102901_044221_CB0E2635 
X-CRM114-Status: GOOD (  18.44  )
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

Add basic tests for the kpkeys_hardened_pgtables feature: try to
perform a direct write to current->{cred,real_cred} and ensure it
fails.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 mm/Makefile                    |  1 +
 mm/kpkeys_hardened_cred_test.c | 42 ++++++++++++++++++++++++++++++++++
 security/Kconfig.hardening     | 11 +++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 mm/kpkeys_hardened_cred_test.c

diff --git a/mm/Makefile b/mm/Makefile
index f7263b7f45b8..2024226902d4 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -149,3 +149,4 @@ obj-$(CONFIG_TMPFS_QUOTA) += shmem_quota.o
 obj-$(CONFIG_PT_RECLAIM) += pt_reclaim.o
 obj-$(CONFIG_KPKEYS_HARDENED_PGTABLES) += kpkeys_hardened_pgtables.o
 obj-$(CONFIG_KPKEYS_HARDENED_PGTABLES_TEST) += kpkeys_hardened_pgtables_test.o
+obj-$(CONFIG_KPKEYS_HARDENED_CRED_TEST) += kpkeys_hardened_cred_test.o
diff --git a/mm/kpkeys_hardened_cred_test.c b/mm/kpkeys_hardened_cred_test.c
new file mode 100644
index 000000000000..46048098f99d
--- /dev/null
+++ b/mm/kpkeys_hardened_cred_test.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <kunit/test.h>
+#include <linux/sched.h>
+
+static void write_cred(struct kunit *test)
+{
+	long zero = 0;
+	int ret;
+
+	ret = copy_to_kernel_nofault((unsigned long *)current->cred, &zero, sizeof(zero));
+	KUNIT_EXPECT_EQ_MSG(test, ret, -EFAULT,
+			    "Write to current->cred wasn't prevented");
+
+	ret = copy_to_kernel_nofault((unsigned long *)current->real_cred, &zero, sizeof(zero));
+	KUNIT_EXPECT_EQ_MSG(test, ret, -EFAULT,
+			    "Write to current->real_cred wasn't prevented");
+}
+
+static int kpkeys_hardened_cred_suite_init(struct kunit_suite *suite)
+{
+	if (!arch_kpkeys_enabled()) {
+		pr_err("Cannot run kpkeys_hardened_cred tests: kpkeys are not supported\n");
+		return 1;
+	}
+
+	return 0;
+}
+
+static struct kunit_case kpkeys_hardened_cred_test_cases[] = {
+	KUNIT_CASE(write_cred),
+	{}
+};
+
+static struct kunit_suite kpkeys_hardened_cred_test_suite = {
+	.name = "Hardened credentials using kpkeys",
+	.test_cases = kpkeys_hardened_cred_test_cases,
+	.suite_init = kpkeys_hardened_cred_suite_init,
+};
+kunit_test_suite(kpkeys_hardened_cred_test_suite);
+
+MODULE_DESCRIPTION("Tests for the kpkeys_hardened_cred feature");
+MODULE_LICENSE("GPL");
diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
index 1af3a9dae645..9b0563a03ab4 100644
--- a/security/Kconfig.hardening
+++ b/security/Kconfig.hardening
@@ -338,6 +338,17 @@ config KPKEYS_HARDENED_CRED
 	  This option has no effect if the system does not support
 	  kernel pkeys.
 
+config KPKEYS_HARDENED_CRED_TEST
+	tristate "KUnit tests for kpkeys_hardened_cred" if !KUNIT_ALL_TESTS
+	depends on KPKEYS_HARDENED_CRED
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Enable this option to check that the kpkeys_hardened_cred feature
+	  functions as intended, i.e. prevents arbitrary writes to live credentials.
+
+	  If unsure, say N.
+
 endmenu
 
 config CC_HAS_RANDSTRUCT
-- 
2.47.0


