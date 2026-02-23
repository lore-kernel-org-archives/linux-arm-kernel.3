Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED620EC1116
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5UiHaU7JB6bcAvtfe4WqQZKw1ol5QCH++YImk1YGWc=; b=sKx2T3yuAzR7sY+MiqQbN+d6+o
	sCP/HH8myqsr7ZbhnCB7iuEQ/Sj+79NdgKk+X10zLOSC418ULGEXfiY5eAShXKGOcPXRG9HMhkrBV
	8W/J385Tj0TV3cvoIRAj9965LmS0ebnwbeybjAIjUBWrHWyjtyUU2IU8wVaUu1Re2HZIFQj6QTTRb
	rp875E+ybWibdq3utR14ib+pDAm2DhYA/Nwa66y0YvqQCI0jAxTFRKkpJtQUHryZvsWBuWsvz1bVZ
	Cr3sw/zWiTS2DMysfk/Vr8EoZXHrWyM+b1o/jEI8RK4QHj+/pGbQgZBNU1NBesJkrH+sI/2U2MGrr
	JYIXAlew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vua0F-00000000oP0-0gMA;
	Mon, 23 Feb 2026 17:45:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vua09-00000000oLw-3ERt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 17:45:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CD0B4450D;
	Mon, 23 Feb 2026 17:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9984C19423;
	Mon, 23 Feb 2026 17:45:42 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>,
	Will Deacon <will@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Emanuele Rocca <emanuele.rocca@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 3/3] kselftest: arm64: Check access to GCS after mprotect(PROT_NONE)
Date: Mon, 23 Feb 2026 17:45:32 +0000
Message-ID: <20260223174533.1478164-4-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223174533.1478164-1-catalin.marinas@arm.com>
References: <20260223174533.1478164-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_094545_846327_861693EA 
X-CRM114-Status: GOOD (  15.24  )
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

A GCS mapping should not be accessible after mprotect(PROT_NONE). Add a
kselftest for this scenario.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: David Hildenbrand <david@kernel.org>
---
 .../signal/testcases/gcs_prot_none_fault.c    | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 tools/testing/selftests/arm64/signal/testcases/gcs_prot_none_fault.c

diff --git a/tools/testing/selftests/arm64/signal/testcases/gcs_prot_none_fault.c b/tools/testing/selftests/arm64/signal/testcases/gcs_prot_none_fault.c
new file mode 100644
index 000000000000..2259f454a202
--- /dev/null
+++ b/tools/testing/selftests/arm64/signal/testcases/gcs_prot_none_fault.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 ARM Limited
+ */
+
+#include <errno.h>
+#include <signal.h>
+#include <unistd.h>
+
+#include <sys/mman.h>
+#include <sys/prctl.h>
+
+#include "test_signals_utils.h"
+#include "testcases.h"
+
+static uint64_t *gcs_page;
+static bool post_mprotect;
+
+#ifndef __NR_map_shadow_stack
+#define __NR_map_shadow_stack 453
+#endif
+
+static bool alloc_gcs(struct tdescr *td)
+{
+	long page_size = sysconf(_SC_PAGE_SIZE);
+
+	gcs_page = (void *)syscall(__NR_map_shadow_stack, 0,
+				   page_size, 0);
+	if (gcs_page == MAP_FAILED) {
+		fprintf(stderr, "Failed to map %ld byte GCS: %d\n",
+			page_size, errno);
+		return false;
+	}
+
+	return true;
+}
+
+static int gcs_prot_none_fault_trigger(struct tdescr *td)
+{
+	/* Verify that the page is readable (ie, not completely unmapped) */
+	fprintf(stderr, "Read value 0x%lx\n", gcs_page[0]);
+
+	if (mprotect(gcs_page, sysconf(_SC_PAGE_SIZE), PROT_NONE) != 0) {
+		fprintf(stderr, "mprotect(PROT_NONE) failed: %d\n", errno);
+		return 0;
+	}
+	post_mprotect = true;
+
+	/* This should trigger a fault if PROT_NONE is honoured for the GCS page */
+	fprintf(stderr, "Read value after mprotect(PROT_NONE) 0x%lx\n", gcs_page[0]);
+	return 0;
+}
+
+static int gcs_prot_none_fault_signal(struct tdescr *td, siginfo_t *si,
+				      ucontext_t *uc)
+{
+	ASSERT_GOOD_CONTEXT(uc);
+
+	/* A fault before mprotect(PROT_NONE) is unexpected. */
+	if (!post_mprotect)
+		return 0;
+
+	return 1;
+}
+
+struct tdescr tde = {
+	.name = "GCS PROT_NONE fault",
+	.descr = "Read from GCS after mprotect(PROT_NONE) segfaults",
+	.feats_required = FEAT_GCS,
+	.timeout = 3,
+	.sig_ok = SIGSEGV,
+	.sanity_disabled = true,
+	.init = alloc_gcs,
+	.trigger = gcs_prot_none_fault_trigger,
+	.run = gcs_prot_none_fault_signal,
+};

