Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D949AC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 17:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLc5v44BbBjHGH2R/IosxNm2fZiVevhZk8y6Zg923ko=; b=cC6lwzBizQoknWg7PotBbXiCKT
	/uhI/RyT84RQ6priAycljofd1Begt26gTlX1cPxJAdHmsvQj5/l3ZFXllkO05DS0m0tLt0nXyWYFl
	JRslfBb3BTLkL9dfvK+nshBN2ZGeo4gJ1DSV+rhx2dfD4gaaGrcG7xBCIOh3lD5U5lYBuGwbdGXwJ
	3bURudZfzmb4peXMcT1d3Dl6E9KeInZCf09NTQoYBZinl1UmKNB4ctoW1E64esE0o43QZNHiQYZpF
	gyjOIwvUjt6J8q4gFZFRqxcKlN/JKn+UiiW53cbDa/1BYbl2JQfQbLkVlxnbZm9qhNIiQmSV00QXQ
	ifaKWs9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1q2S-00000001KzV-1jLi;
	Mon, 07 Apr 2025 17:13:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pCm-000000019AP-1uCJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 16:20:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F6E91BCB;
	Mon,  7 Apr 2025 09:20:13 -0700 (PDT)
Received: from u200865.usa.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 784343F694;
	Mon,  7 Apr 2025 09:20:11 -0700 (PDT)
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-trace-kernel@vger.kernel.org
Cc: linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org,
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
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [PATCH v2 4/6] arm64: probes: Add GCS support to bl/blr/ret
Date: Mon,  7 Apr 2025 11:19:49 -0500
Message-ID: <20250407161951.560865-5-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407161951.560865-1-jeremy.linton@arm.com>
References: <20250407161951.560865-1-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_092012_591344_ABF8EFF0 
X-CRM114-Status: GOOD (  13.12  )
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

The arm64 probe simulation doesn't currently have logic in place
to deal with GCS and this results in core dumps if probes are inserted
at control flow locations. Fix-up bl, blr and ret to manipulate the
shadow stack as needed.

While we manipulate and validate the shadow stack correctly, the
hardware provides additional security by only allowing GCS operations
against pages which are marked to support GCS. For writing there is
gcssttr() which enforces this, but there isn't an equivalent for
reading. This means that uprobe users should be aware that probing on
control flow instructions which require reading the shadow stack (ex:
ret) offers lower security guarantees than what is achieved without
the uprobe active.

Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
---
 arch/arm64/kernel/probes/simulate-insn.c | 28 ++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/probes/simulate-insn.c b/arch/arm64/kernel/probes/simulate-insn.c
index 09a0b36122d0..1fc9bb69b1eb 100644
--- a/arch/arm64/kernel/probes/simulate-insn.c
+++ b/arch/arm64/kernel/probes/simulate-insn.c
@@ -13,6 +13,7 @@
 #include <asm/traps.h>
 
 #include "simulate-insn.h"
+#include "asm/gcs.h"
 
 #define bbl_displacement(insn)		\
 	sign_extend32(((insn) & 0x3ffffff) << 2, 27)
@@ -49,6 +50,18 @@ static inline u32 get_w_reg(struct pt_regs *regs, int reg)
 	return lower_32_bits(pt_regs_read_reg(regs, reg));
 }
 
+static inline void update_lr(struct pt_regs *regs, long addr)
+{
+	int err = 0;
+
+	if (user_mode(regs) && task_gcs_el0_enabled(current)) {
+		push_user_gcs(addr + 4,	 &err);
+		if (err)
+			force_sig(SIGSEGV);
+	}
+	procedure_link_pointer_set(regs, addr + 4);
+}
+
 static bool __kprobes check_cbz(u32 opcode, struct pt_regs *regs)
 {
 	int xn = opcode & 0x1f;
@@ -107,9 +120,8 @@ simulate_b_bl(u32 opcode, long addr, struct pt_regs *regs)
 {
 	int disp = bbl_displacement(opcode);
 
-	/* Link register is x30 */
 	if (opcode & (1 << 31))
-		set_x_reg(regs, 30, addr + 4);
+		update_lr(regs, addr);
 
 	instruction_pointer_set(regs, addr + disp);
 }
@@ -133,17 +145,25 @@ simulate_br_blr(u32 opcode, long addr, struct pt_regs *regs)
 	/* update pc first in case we're doing a "blr lr" */
 	instruction_pointer_set(regs, get_x_reg(regs, xn));
 
-	/* Link register is x30 */
 	if (((opcode >> 21) & 0x3) == 1)
-		set_x_reg(regs, 30, addr + 4);
+		update_lr(regs, addr);
 }
 
 void __kprobes
 simulate_ret(u32 opcode, long addr, struct pt_regs *regs)
 {
+	u64 ret_addr;
+	int err = 0;
 	int xn = (opcode >> 5) & 0x1f;
 
 	instruction_pointer_set(regs, get_x_reg(regs, xn));
+
+	if (user_mode(regs) && task_gcs_el0_enabled(current)) {
+		ret_addr = pop_user_gcs(&err);
+		if (err || ret_addr != procedure_link_pointer(regs))
+			force_sig(SIGSEGV);
+	}
+
 }
 
 void __kprobes
-- 
2.49.0


