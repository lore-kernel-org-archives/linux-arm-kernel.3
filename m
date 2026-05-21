Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CF2CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pD0fOleLGtMZWQZM5IjkVWaILUmpBQdIk/ofxjGBsAg=; b=39scuAH9dEfMtMyPgvhYjqm5by
	hfLbcTSc59WQFuOpiMw9aS441wQHlwdKZFzqrVPJyeBJ0f9wFTZRdKyJ5+Fle6bfjkqJ6WNZ3jrj2
	i1f8eBwrTbdAWmhNIzjc/rPIG/hgIl9cwqJmNZgat55va5ZfxhTinpJFgzqHKuZbmhy8whtGTUinQ
	Uenh2USgR8r6rHDUOnrlQggZjTqfptBadQ3BH+qtcuB8T/oK2ZbbKWSE/2fDIugVGMqa5R0KWhXs2
	SRR/Mxxea7uZlqxJPt3FGPmWCQcoV/v3n9EGEAPDdAglfEGR/jchloz1F/833nqlbGBOp1naUxkzC
	jzEHZDdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzvy-00000007LYP-08tH;
	Thu, 21 May 2026 09:43:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzvf-00000007LPH-3hVE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 09:43:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0D753D54;
	Thu, 21 May 2026 02:42:53 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A51633F7B4;
	Thu, 21 May 2026 02:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779356578; bh=7D/kyQpHByVhOcr2Vc5VHIxUFgAkyoFd0mFRjxOclS8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X2eDxc6VG5vrJpFTueTpjTZ7t3M6UancjNJQhuTzMrK2mBIo5bRoeDQM8e1iB3Ham
	 ewk47nU5oYBimvkEgpW/4H3hGkr5FMyrUhopRjAfNnT3T7ZxxV1aFIc2KwTWvrGaM7
	 OsLC23bI1kPRXPISqWZmGn2tOVEGLw7qlLKXCRYo=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Thu, 21 May 2026 10:42:31 +0100
Subject: [PATCH 2/2] kselftest/arm64: Add test for atomic futex uaccess
 with POE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-poe_futex-v1-2-1da286b8f9b2@arm.com>
References: <20260521-poe_futex-v1-0-1da286b8f9b2@arm.com>
In-Reply-To: <20260521-poe_futex-v1-0-1da286b8f9b2@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
 Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779356574; l=4151;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=7D/kyQpHByVhOcr2Vc5VHIxUFgAkyoFd0mFRjxOclS8=;
 b=AX8w+7rYCwgx63giwi1vaQ06pljn9EZhnnZkpliBg2S9sgC/pXKMVBQDfQIN4NcjiQ3gDsKRL
 Tfcd3RJ/BXoD9/WhorbEcFSuxW1JJRxYHRFBern3UzfMrAhAFwjINu+
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_024300_019202_7C4B8A34 
X-CRM114-Status: GOOD (  18.01  )
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

Add a new test to ensure that atomic futex uaccess succeeds on
memory mapped with a non-default POIndex/pkey.

In the absence of FEAT_LSUI, atomic futex uaccess operations such as
those triggered by FUTEX_WAKE_OP use privileged atomic load/store
instructions and thus cannot have user permission overlays applied
(as per POR_EL0). In case the kernel enabled POE at EL1, it is worth
checking that PIR_EL1 isn't mistakenly configured to have kernel
overlays (POR_EL1) applied instead, as that would fail for non-zero
pkeys.

Note that if such misconfiguration occurs, futex_wake_op() may get
stuck in an infinite loop because futex_atomic_op_inuser() will fail
but fault_in_user_writeable() will still report success.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/arm64/Makefile        |  2 +-
 tools/testing/selftests/arm64/poe/.gitignore  |  2 +
 tools/testing/selftests/arm64/poe/Makefile    |  6 +++
 tools/testing/selftests/arm64/poe/poe_futex.c | 62 +++++++++++++++++++++++++++
 4 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/Makefile b/tools/testing/selftests/arm64/Makefile
index e456f3b62fa1..bad5c3b33dce 100644
--- a/tools/testing/selftests/arm64/Makefile
+++ b/tools/testing/selftests/arm64/Makefile
@@ -4,7 +4,7 @@
 ARCH ?= $(shell uname -m 2>/dev/null || echo not)
 
 ifneq (,$(filter $(ARCH),aarch64 arm64))
-ARM64_SUBTARGETS ?= tags signal pauth fp mte bti abi gcs
+ARM64_SUBTARGETS ?= tags signal pauth fp mte bti abi gcs poe
 else
 ARM64_SUBTARGETS :=
 endif
diff --git a/tools/testing/selftests/arm64/poe/.gitignore b/tools/testing/selftests/arm64/poe/.gitignore
new file mode 100644
index 000000000000..0dce4a3aa38b
--- /dev/null
+++ b/tools/testing/selftests/arm64/poe/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+poe_futex
diff --git a/tools/testing/selftests/arm64/poe/Makefile b/tools/testing/selftests/arm64/poe/Makefile
new file mode 100644
index 000000000000..2af2bbf3f6d3
--- /dev/null
+++ b/tools/testing/selftests/arm64/poe/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+CFLAGS += $(KHDR_INCLUDES)
+TEST_GEN_PROGS := poe_futex
+
+include ../../lib.mk
diff --git a/tools/testing/selftests/arm64/poe/poe_futex.c b/tools/testing/selftests/arm64/poe/poe_futex.c
new file mode 100644
index 000000000000..21a2e109ee43
--- /dev/null
+++ b/tools/testing/selftests/arm64/poe/poe_futex.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <stdint.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+#include <linux/futex.h>
+#include <sys/syscall.h>
+
+#include "kselftest_harness.h"
+
+static int sys_pkey_alloc(unsigned long flags, unsigned long init_val)
+{
+	return syscall(__NR_pkey_alloc, flags, init_val);
+}
+
+static int sys_pkey_mprotect(void *ptr, size_t size, int prot, int pkey)
+{
+	return syscall(__NR_pkey_mprotect, ptr, size, prot, pkey);
+}
+
+static int futex_wake_op(uint32_t *uaddr, uint32_t val, uint32_t val2,
+			 uint32_t *uaddr2, uint32_t val3)
+{
+	return syscall(SYS_futex, uaddr, FUTEX_WAKE_OP, val, val2,
+		       uaddr2, val3);
+}
+
+/*
+ * Trigger some atomic uaccess on a page mapped with a non-default pkey.
+ *
+ * This ensures that such access is not mistakenly checked against the
+ * kernel's POR_EL1 register.
+ */
+TEST(poe_futex)
+{
+	int ret, pkey;
+	void *ptr;
+	size_t size = getpagesize();
+
+	pkey = sys_pkey_alloc(0, 0);
+
+	if (pkey == -1 && errno == ENOSPC)
+		SKIP(return, "pkeys are not supported");
+
+	ASSERT_GT(pkey, 0);
+
+	ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
+		   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	ret = sys_pkey_mprotect(ptr, size, PROT_READ | PROT_WRITE, pkey);
+	ASSERT_EQ(ret, 0);
+
+	/*
+	 * There is no one to wake up so this syscall boils down to *(ptr+4) = 0
+	 * (arch_futex_atomic_op_inuser() called with FUTEX_OP_SET and op_arg=0).
+	 */
+	ret = futex_wake_op(ptr, 1, 1, ptr + sizeof(uint32_t), 0);
+	ASSERT_EQ(ret, 0);
+}
+
+TEST_HARNESS_MAIN

-- 
2.51.2


