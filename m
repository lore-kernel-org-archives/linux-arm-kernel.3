Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877E7CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 11:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1a9WkvtlFuudKbRk3/HnDrqSKmv2hnJGHHDj6ZZi/pM=; b=uTcWue/D0tB/UKGbRJYPSjtE/C
	9Kk+ApuicykkcLBIOtkxRWDexXju8adLjUkbFY+JH09XuJykjWbOoCh5LAKQQLfCxzraGYbWR6JCg
	+9cNvWzSzrW/tQ/TeFRl3fiK0nZ3WYT//koRKsYYRrM7TtULV2ySs4G7t6lJsgPJvXePknxtfGfPe
	s/PIR7yNth+C7/kaMvwDseUm7YufTT6XgUnuh/i0xgVF4BCotNNZESFMHDJIUo4ZCfLFoMoXT7fkw
	ndrXbgxJTM49flpUMzq5nnPe7z2k0s6aGauD6YIrLoiswL5NXTDyyFIXu1FuSTtZKRFghYP65O+bs
	tLTkcMHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsZx-00000002Kbr-1e10;
	Fri, 15 Aug 2025 11:26:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqIn-00000001xyL-3PZr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 09:00:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43FF02D8E;
	Fri, 15 Aug 2025 02:00:37 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AC283F63F;
	Fri, 15 Aug 2025 02:00:40 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Howells <dhowells@redhat.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Maxwell Bland <mbland@motorola.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [RFC PATCH v2 8/8] mm: Add basic tests for kpkeys_hardened_cred
Date: Fri, 15 Aug 2025 10:00:00 +0100
Message-ID: <20250815090000.2182450-9-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250815090000.2182450-1-kevin.brodsky@arm.com>
References: <20250815090000.2182450-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_020045_940044_7575189F 
X-CRM114-Status: GOOD (  19.98  )
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
fails. Also check that prepare_creds, protect_creds,
prepare_protected_creds behave as expected.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 mm/Makefile                           |  1 +
 mm/tests/kpkeys_hardened_cred_kunit.c | 79 +++++++++++++++++++++++++++
 security/Kconfig.hardening            | 11 ++++
 3 files changed, 91 insertions(+)
 create mode 100644 mm/tests/kpkeys_hardened_cred_kunit.c

diff --git a/mm/Makefile b/mm/Makefile
index b1e6cf7f753c..c79af57c0aa5 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -149,3 +149,4 @@ obj-$(CONFIG_TMPFS_QUOTA) += shmem_quota.o
 obj-$(CONFIG_PT_RECLAIM) += pt_reclaim.o
 obj-$(CONFIG_KPKEYS_HARDENED_PGTABLES) += kpkeys_hardened_pgtables.o
 obj-$(CONFIG_KPKEYS_HARDENED_PGTABLES_KUNIT_TEST) += tests/kpkeys_hardened_pgtables_kunit.o
+obj-$(CONFIG_KPKEYS_HARDENED_CRED_KUNIT_TEST) += tests/kpkeys_hardened_cred_kunit.o
diff --git a/mm/tests/kpkeys_hardened_cred_kunit.c b/mm/tests/kpkeys_hardened_cred_kunit.c
new file mode 100644
index 000000000000..ed07469b504c
--- /dev/null
+++ b/mm/tests/kpkeys_hardened_cred_kunit.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <kunit/test.h>
+#include <linux/cred.h>
+#include <linux/sched.h>
+
+static int increment_cred_uid_nofault(struct cred *cred)
+{
+	uid_t val = __kuid_val(cred->uid) + 1;
+
+	return copy_to_kernel_nofault(&cred->uid, &val, sizeof(cred->uid));
+}
+
+static void write_current_creds(struct kunit *test)
+{
+	int ret;
+
+	if (!arch_kpkeys_enabled())
+		kunit_skip(test, "kpkeys are not supported");
+
+	ret = increment_cred_uid_nofault((struct cred *)current->cred);
+	KUNIT_EXPECT_EQ_MSG(test, ret, -EFAULT,
+			    "Write to current->cred wasn't prevented");
+
+	ret = increment_cred_uid_nofault((struct cred *)current->real_cred);
+	KUNIT_EXPECT_EQ_MSG(test, ret, -EFAULT,
+			    "Write to current->real_cred wasn't prevented");
+}
+
+static void write_new_creds(struct kunit *test)
+{
+	struct cred *cred, *protected_cred;
+	int ret;
+
+	if (!arch_kpkeys_enabled())
+		kunit_skip(test, "kpkeys are not supported");
+
+	/* prepare_creds() + protect_creds() */
+	cred = prepare_creds();
+	KUNIT_ASSERT_NOT_NULL(test, cred);
+
+	ret = increment_cred_uid_nofault(cred);
+	KUNIT_EXPECT_EQ_MSG(test, ret, 0,
+			    "Failed to write to unprotected creds");
+
+	protected_cred = protect_creds(cred);
+	KUNIT_EXPECT_PTR_NE_MSG(test, cred, protected_cred,
+				"protect_creds() failed to move creds to protected memory");
+
+	ret = increment_cred_uid_nofault(protected_cred);
+	KUNIT_EXPECT_EQ_MSG(test, ret, -EFAULT,
+			    "Write to protected_cred wasn't prevented");
+
+	put_cred(protected_cred);
+
+	/* prepare_protected_creds() */
+	protected_cred = prepare_protected_creds();
+
+	ret = increment_cred_uid_nofault(protected_cred);
+	KUNIT_EXPECT_EQ_MSG(test, ret, -EFAULT,
+			    "Write to protected_cred wasn't prevented");
+
+	put_cred(protected_cred);
+
+}
+
+static struct kunit_case kpkeys_hardened_cred_test_cases[] = {
+	KUNIT_CASE(write_current_creds),
+	KUNIT_CASE(write_new_creds),
+	{}
+};
+
+static struct kunit_suite kpkeys_hardened_cred_test_suite = {
+	.name = "Hardened credentials using kpkeys",
+	.test_cases = kpkeys_hardened_cred_test_cases,
+};
+kunit_test_suite(kpkeys_hardened_cred_test_suite);
+
+MODULE_DESCRIPTION("Tests for the kpkeys_hardened_cred feature");
+MODULE_LICENSE("GPL");
diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
index cb494448c7ae..7ceb1e6846f2 100644
--- a/security/Kconfig.hardening
+++ b/security/Kconfig.hardening
@@ -302,6 +302,17 @@ config KPKEYS_HARDENED_CRED
 	  This option has no effect if the system does not support
 	  kernel pkeys.
 
+config KPKEYS_HARDENED_CRED_KUNIT_TEST
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


