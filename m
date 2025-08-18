Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382E7CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 22:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJ1IhpjVXdktHJnr+Tk7tE9vUwx0Y10aAV273hiy/tI=; b=UmtBnTpuPorXDuBiOqTgypWpiu
	Zg5p0aCkD9Db5BswzKb55XPAIugp6T4lnDu0kPHDVjMo8Sd9xCYSBcI9aFPoRKnRWJ7UTekfVDsWu
	4JIKz2cQvISpukiFWnu5pBPXrT3Py9YTeQ4iTMJ+Twpcefsfa4bwlsk56bZa+OrjbKq1y/fZ+orWH
	PNL/A/RNoYBu04u6bmvXU71qFtwX4PYYu8idRbZ2XqAzI9Xa8rZzynpYrWOkPuMKB9YUPUpM69r5f
	MFAYWn6FjyGLM1aP+96f3A+ud3LvTCEwUehvJy6rw0N3u2lCy5i4YQXbOT9rXs54JL959j7fKfoe4
	lewnD5gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo8aD-00000008r4x-06YX;
	Mon, 18 Aug 2025 22:44:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7Vr-00000008l7Z-3Ey3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 21:35:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03AB619F0;
	Mon, 18 Aug 2025 14:35:23 -0700 (PDT)
Received: from u200865.usa.arm.com (U203867.austin.arm.com [10.118.30.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D1903F738;
	Mon, 18 Aug 2025 14:35:30 -0700 (PDT)
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-trace-kernel@vger.kernel.org
Cc: linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	thiago.bauermann@linaro.org,
	broonie@kernel.org,
	yury.khrustalev@arm.com,
	kristina.martsenko@arm.com,
	liaochang1@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>,
	Steve Capper <steve.capper@arm.com>
Subject: [PATCH v6 5/7] arm64: uprobes: Add GCS support to uretprobes
Date: Mon, 18 Aug 2025 16:34:50 -0500
Message-ID: <20250818213452.50439-6-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818213452.50439-1-jeremy.linton@arm.com>
References: <20250818213452.50439-1-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_143531_842725_6A17733E 
X-CRM114-Status: GOOD (  17.45  )
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

Ret probes work by changing the value in the link register at
the probe location to return to the probe rather than the calling
routine. Thus the GCS needs to be updated with this address as well.

Since its possible to insert probes at locations where the
current value of the LR doesn't match the GCS state this needs
to be detected and handled in order to maintain the existing
no-fault behavior.

Co-developed-by: Steve Capper <steve.capper@arm.com>
Signed-off-by: Steve Capper <steve.capper@arm.com>
(updated to use new gcs accessors, and handle LR/GCS mismatches)
Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/kernel/probes/uprobes.c | 33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/kernel/probes/uprobes.c b/arch/arm64/kernel/probes/uprobes.c
index 1f91fd2a8187..6b98503a0198 100644
--- a/arch/arm64/kernel/probes/uprobes.c
+++ b/arch/arm64/kernel/probes/uprobes.c
@@ -6,6 +6,7 @@
 #include <linux/ptrace.h>
 #include <linux/uprobes.h>
 #include <asm/cacheflush.h>
+#include <asm/gcs.h>
 
 #include "decode-insn.h"
 
@@ -159,11 +160,43 @@ arch_uretprobe_hijack_return_addr(unsigned long trampoline_vaddr,
 				  struct pt_regs *regs)
 {
 	unsigned long orig_ret_vaddr;
+	unsigned long gcs_ret_vaddr;
+	int err = 0;
+	u64 gcspr;
 
 	orig_ret_vaddr = procedure_link_pointer(regs);
+
+	if (task_gcs_el0_enabled(current)) {
+		gcspr = read_sysreg_s(SYS_GCSPR_EL0);
+		gcs_ret_vaddr = get_user_gcs((unsigned long __user *)gcspr, &err);
+		if (err) {
+			force_sig(SIGSEGV);
+			goto out;
+		}
+
+		/*
+		 * If the LR and GCS return addr don't match, then some kind of PAC
+		 * signing or control flow occurred since entering the probed function.
+		 * Likely because the user is attempting to retprobe on an instruction
+		 * that isn't a function boundary or inside a leaf function. Explicitly
+		 * abort this retprobe because it will generate a GCS exception.
+		 */
+		if (gcs_ret_vaddr != orig_ret_vaddr) {
+			orig_ret_vaddr = -1;
+			goto out;
+		}
+
+		put_user_gcs(trampoline_vaddr, (unsigned long __user *)gcspr, &err);
+		if (err) {
+			force_sig(SIGSEGV);
+			goto out;
+		}
+	}
+
 	/* Replace the return addr with trampoline addr */
 	procedure_link_pointer_set(regs, trampoline_vaddr);
 
+out:
 	return orig_ret_vaddr;
 }
 
-- 
2.50.1


