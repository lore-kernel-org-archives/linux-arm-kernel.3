Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B296F8FA86
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 14:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBwT+erepDCtp/NJXdEbfzevdiqPrDpyKfL5BCi1TGI=; b=fZyaE5nHaV7yJHYAbs5XK8a1Ge
	/ir0daHd6+F1urPd4RIk9as8XciekGhTTjfRyI8yoDZRo8jxPhfHH/e0NpGN5gNwlmiq23aLHM/o8
	4Meg4O0hJu1Xxvxj4zPvSL+Gt08aqG4WqUXju4xYoch7k2HieQMVrxKG8y+GL4RB1oFAtbXPeXylf
	bMXacRUIes8+XZzXZcHM5S6y8G67XISW5Z/1bvoMo3wXMcYHI2+dJRKCsQHFzMXcIqqVDElkwcRC/
	FDunT+U394ter6W+EEu9PUY8k2caNGOfmU3Z+heAi3/qnVvzATCnKcVrXvZ+RAw9L/OsfE2Y+XZSR
	y/GuhVjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCK7-00000008kyG-2BPw;
	Tue, 21 Apr 2026 14:43:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCJx-00000008ksY-2pRX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 14:43:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 710D0302C;
	Tue, 21 Apr 2026 07:43:18 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D0B33FAF5;
	Tue, 21 Apr 2026 07:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776782604; bh=uE9jQ5/Tb87+KKebRJWQfQzQewWOPhLdHfsan5xetdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qtIUWYBPqWf7sC8xIKXk5VB1ZWrtTT315ZiLzg6GMj8nJbfXKYT3L3JFll6h2JxbI
	 3Ozcg+t0YoLIqWgc1REnoQxGagMc9FSGm4IAUyZ/5ZCxGQcfLAYcljpQqk6raDH1zk
	 J4Mz1EixN1jNaT/o37E6VhSWfHlFayjbJDHMcdJk=
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 4/4] kselftest/arm64: Add tests for POR_EL0 save/reset/restore
Date: Tue, 21 Apr 2026 15:42:52 +0100
Message-ID: <20260421144252.1440365-5-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260421144252.1440365-1-kevin.brodsky@arm.com>
References: <20260421144252.1440365-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_074325_802658_B2E0D174 
X-CRM114-Status: GOOD (  20.61  )
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

POR_EL0 is expected to be:
- Saved in the poe_context record
- Reset to POR_EL0_INIT when invoking the signal handler
- Restored from poe_context when returning from the signal handler

Add a new test, poe_restore, to check that the save/reset/restore
mechanism is working as intended. See commit 2e8a1acea859 ("arm64:
signal: Improve POR_EL0 handling to avoid uaccess failures") for
more details.

This commit did not handle the case where poe_context is missing
correctly. This was recently fixed; add a new test,
poe_missing_poe_context, to check this case.

Note: td->pass is only set to true at the very end, as an unexpected
signal may occur in case of failure (especially in
poe_missing_poe_context if POR_EL0 is restored to an invalid value).
Failures are tracked with a global, failed_check.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 .../testcases/poe_missing_poe_context.c       | 73 +++++++++++++++++++
 .../arm64/signal/testcases/poe_restore.c      | 64 ++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 tools/testing/selftests/arm64/signal/testcases/poe_missing_poe_context.c
 create mode 100644 tools/testing/selftests/arm64/signal/testcases/poe_restore.c

diff --git a/tools/testing/selftests/arm64/signal/testcases/poe_missing_poe_context.c b/tools/testing/selftests/arm64/signal/testcases/poe_missing_poe_context.c
new file mode 100644
index 000000000000..abab7400d9df
--- /dev/null
+++ b/tools/testing/selftests/arm64/signal/testcases/poe_missing_poe_context.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Arm Ltd
+ *
+ * Verify that the POR_EL0 register is left untouched on sigreturn if the
+ * POE frame record is missing.
+ */
+
+#include <asm/sigcontext.h>
+
+#include "test_signals_utils.h"
+#include "testcases.h"
+
+#define POR_EL0_INIT	0x07ul
+#define POR_EL0_CUSTOM	0x77ul
+
+static bool failed_check;
+
+static bool modify_por_el0(struct tdescr *td)
+{
+	set_por_el0(POR_EL0_CUSTOM);
+
+	return true;
+}
+
+static int signal_remove_poe_context(struct tdescr *td, siginfo_t *si,
+				      ucontext_t *uc)
+{
+	struct _aarch64_ctx *ctx = GET_UC_RESV_HEAD(uc);
+	struct _aarch64_ctx *poe_ctx_head;
+
+	poe_ctx_head = get_header(ctx, POE_MAGIC, sizeof(uc->uc_mcontext),
+				  NULL);
+	if (!poe_ctx_head) {
+		fprintf(stderr, "Missing poe_context record\n");
+		failed_check = true;
+		return 0;
+	}
+
+	/*
+	 * Actually removing the record would require moving down the next
+	 * records. An easier option is to turn it into an ESR record, which is
+	 * ignored by sigreturn().
+	 */
+	poe_ctx_head->magic = ESR_MAGIC;
+
+	return 0;
+}
+
+static void check_por_el0_preserved(struct tdescr *td)
+{
+	uint64_t por_el0 = get_por_el0();
+
+	if (por_el0 == POR_EL0_INIT) {
+		fprintf(stderr, "POR_EL0 preserved\n");
+	} else {
+		fprintf(stderr, "POR_EL0 unexpectedly set to %lx\n", por_el0);
+		failed_check = true;
+	}
+
+	td->pass = !failed_check;
+}
+
+struct tdescr tde = {
+	.name = "POR_EL0 missing poe_context",
+	.descr = "Remove poe_context record and check POR_EL0 is preserved",
+	.feats_required = FEAT_POE,
+	.timeout = 3,
+	.sig_trig = SIGUSR1,
+	.init = modify_por_el0,
+	.run = signal_remove_poe_context,
+	.check_result = check_por_el0_preserved,
+};
diff --git a/tools/testing/selftests/arm64/signal/testcases/poe_restore.c b/tools/testing/selftests/arm64/signal/testcases/poe_restore.c
new file mode 100644
index 000000000000..9f9a61a4214d
--- /dev/null
+++ b/tools/testing/selftests/arm64/signal/testcases/poe_restore.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Arm Ltd
+ *
+ * Verify that the POR_EL0 register is saved and restored as expected on signal
+ * entry/return.
+ */
+
+#include <asm/sigcontext.h>
+
+#include "test_signals_utils.h"
+#include "testcases.h"
+
+#define POR_EL0_INIT	0x07ul
+#define POR_EL0_CUSTOM	0x77ul
+
+static bool failed_check;
+
+static bool modify_por_el0(struct tdescr *td)
+{
+	set_por_el0(POR_EL0_CUSTOM);
+
+	return true;
+}
+
+static int signal_check_por_el0_reset(struct tdescr *td, siginfo_t *si,
+				      ucontext_t *uc)
+{
+	uint64_t signal_por_el0 = get_por_el0();
+
+	if (signal_por_el0 != POR_EL0_INIT) {
+		fprintf(stderr, "POR_EL0 is %lx in signal handler (expected %lx)\n",
+			signal_por_el0, POR_EL0_INIT);
+		failed_check = true;
+	}
+
+	return 0;
+}
+
+static void check_por_el0_restored(struct tdescr *td)
+{
+	uint64_t por_el0 = get_por_el0();
+
+	if (por_el0 == POR_EL0_CUSTOM) {
+		fprintf(stderr, "POR_EL0 restored\n");
+	} else {
+		fprintf(stderr, "POR_EL0 was %lx but is now %lx\n",
+			POR_EL0_CUSTOM, por_el0);
+		failed_check = true;
+	}
+
+	td->pass = !failed_check;
+}
+
+struct tdescr tde = {
+	.name = "POR_EL0 restore",
+	.descr = "Validate that POR_EL0 is saved/restored on signal entry/return",
+	.feats_required = FEAT_POE,
+	.timeout = 3,
+	.sig_trig = SIGUSR1,
+	.init = modify_por_el0,
+	.run = signal_check_por_el0_reset,
+	.check_result = check_por_el0_restored,
+};
-- 
2.51.2


