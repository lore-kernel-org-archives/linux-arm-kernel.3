Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534F5FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 12:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47qaqV+mdeqKvFvgNpCp3D9H5gjzcSrJHbkUmsUuFfA=; b=L7WTTy+mVAYBFCDcKed9HnqmoX
	Tm42uNf172eXZvH5wUs1Dys+1RKILQVsPV5wSPWL+1UJFbSejFImKVtHfFRZ6GVkdsSdl9/GO+V2t
	YJrmoaFjUgqmdsU4YBsoNizjSwHcxRuJPJ/JxN2pREK15UzNnwEbd/fBlKNX0cnoCdE8JJwvT7Fv+
	iMNHzCnsmQ1HQhSNjcu1p7ru0AgR7aMGizM4bahsgW6LqgaYPBCHbn5OmXNrj/9d0XghxYDSMwHqY
	not6MbOdNpgaNLXYkjhYgzcOU5x68vcquzc9vKRnO0YqStEoRjljPq4tyfns9+1GwOZPj1JOubjre
	BdS6trpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKhP-0000000Gqkx-2jhA;
	Mon, 27 Apr 2026 12:04:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKh8-0000000GqcG-2MHz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 12:04:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA2391684;
	Mon, 27 Apr 2026 05:04:03 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA1BE3F62B;
	Mon, 27 Apr 2026 05:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777291449; bh=W1D5lSXRtEDeQjde+9XAOouOpPIYvgXYBK0Xv65p3K0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FrcRXtyoVN+V5QnRWUBcPP11+5QJboDFs/HJ+cJcNWlVL73mrj0coeJAWyJ6c00lz
	 Ma1oL+zHBHNZpHbpiurhIeqZM4hAmR80fUOAiPEn+krHPySnbUvDCwR0rEMf0VARDX
	 NM2JVBbf7eizQct9FKyZ/R6dTUecIOJ7Qf9bSXmg=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Mon, 27 Apr 2026 13:03:37 +0100
Subject: [PATCH v2 5/5] kselftest/arm64: Add tests for POR_EL0
 save/reset/restore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-poe_signal-v2-5-2bd9d6f16ab4@arm.com>
References: <20260427-poe_signal-v2-0-2bd9d6f16ab4@arm.com>
In-Reply-To: <20260427-poe_signal-v2-0-2bd9d6f16ab4@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Mark Brown <broonie@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777291437; l=5057;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=W1D5lSXRtEDeQjde+9XAOouOpPIYvgXYBK0Xv65p3K0=;
 b=5XkTdq3N2XGqgMLfy65UGbovi8wThCf1OhK2p3M89xXvnTmO/hRQNDs1NU+gdq2uzLZO9C9BO
 laUnaCvsYZCATe6H8kHpDgAZSU5TxOL+f0VbJZHTFkICzz6VO6ioq6C
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_050410_716411_311E572A 
X-CRM114-Status: GOOD (  18.95  )
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
 .../signal/testcases/poe_missing_poe_context.c     | 73 ++++++++++++++++++++++
 .../selftests/arm64/signal/testcases/poe_restore.c | 64 +++++++++++++++++++
 2 files changed, 137 insertions(+)

diff --git a/tools/testing/selftests/arm64/signal/testcases/poe_missing_poe_context.c b/tools/testing/selftests/arm64/signal/testcases/poe_missing_poe_context.c
new file mode 100644
index 000000000000..3f22d8cf6106
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
+	size_t resv_size = GET_UCP_RESV_SIZE(uc);
+	struct _aarch64_ctx *poe_ctx_head;
+
+	poe_ctx_head = get_header(ctx, POE_MAGIC, resv_size, NULL);
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


