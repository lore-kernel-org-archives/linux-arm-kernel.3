Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0381BCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 03:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1J2uckq1ceYQtZJOLa08fgiSGD2o2Pwd1eOygx1NvNI=; b=wqbJfNa0Lsfc3uXvJisfN51Eqa
	41GA4+j/4drtwg73KlMMJCKJbfOcXVVyfLTlSyOX+GJIlCEy0s2zX8MbIfAoqtuwzLVbzmu1XwDKd
	VnYxYQco1m4JcDq3oCAEviw6BD0CmUchbUHM4jjXmiswrSZMOjDBPzYM6gTtvbSSFqohGyxcj+EU1
	P59VpDKok7AnKJ0YWNJnHdVaGXA7c4rlVuDBiq/wt56F6GKH7JQBc02HL+l+JtCHcPvvubRzUFWS0
	JIaloloWkShWODbvmJ+wjHiiKH2QS0qJzSWjGLm2+AZIqE7+3PfUIDtVpxjfcEvUNSvp8KADQrACz
	eByZmkhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqOCP-00000006qNi-2hxO;
	Mon, 25 Aug 2025 03:48:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqNyg-00000006ojL-30fC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 03:34:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 465532BC0;
	Sun, 24 Aug 2025 20:34:28 -0700 (PDT)
Received: from u200865.usa.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 636663F63F;
	Sun, 24 Aug 2025 20:34:35 -0700 (PDT)
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
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [PATCH v7 4/7] arm64: probes: Add GCS support to bl/blr/ret
Date: Sun, 24 Aug 2025 22:34:18 -0500
Message-ID: <20250825033421.463669-5-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825033421.463669-1-jeremy.linton@arm.com>
References: <20250825033421.463669-1-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_203438_865213_8539B644 
X-CRM114-Status: GOOD (  14.26  )
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
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/kernel/probes/simulate-insn.c | 44 +++++++++++++++++++-----
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kernel/probes/simulate-insn.c b/arch/arm64/kernel/probes/simulate-insn.c
index 09a0b36122d0..97ed4db75417 100644
--- a/arch/arm64/kernel/probes/simulate-insn.c
+++ b/arch/arm64/kernel/probes/simulate-insn.c
@@ -13,6 +13,7 @@
 #include <asm/traps.h>
 
 #include "simulate-insn.h"
+#include "asm/gcs.h"
 
 #define bbl_displacement(insn)		\
 	sign_extend32(((insn) & 0x3ffffff) << 2, 27)
@@ -49,6 +50,21 @@ static inline u32 get_w_reg(struct pt_regs *regs, int reg)
 	return lower_32_bits(pt_regs_read_reg(regs, reg));
 }
 
+static inline int update_lr(struct pt_regs *regs, long addr)
+{
+	int err = 0;
+
+	if (user_mode(regs) && task_gcs_el0_enabled(current)) {
+		push_user_gcs(addr, &err);
+		if (err) {
+			force_sig(SIGSEGV);
+			return err;
+		}
+	}
+	procedure_link_pointer_set(regs, addr);
+	return err;
+}
+
 static bool __kprobes check_cbz(u32 opcode, struct pt_regs *regs)
 {
 	int xn = opcode & 0x1f;
@@ -107,9 +123,9 @@ simulate_b_bl(u32 opcode, long addr, struct pt_regs *regs)
 {
 	int disp = bbl_displacement(opcode);
 
-	/* Link register is x30 */
 	if (opcode & (1 << 31))
-		set_x_reg(regs, 30, addr + 4);
+		if (update_lr(regs, addr + 4))
+			return;
 
 	instruction_pointer_set(regs, addr + disp);
 }
@@ -129,21 +145,31 @@ void __kprobes
 simulate_br_blr(u32 opcode, long addr, struct pt_regs *regs)
 {
 	int xn = (opcode >> 5) & 0x1f;
+	int b_target = get_x_reg(regs, xn);
 
-	/* update pc first in case we're doing a "blr lr" */
-	instruction_pointer_set(regs, get_x_reg(regs, xn));
-
-	/* Link register is x30 */
 	if (((opcode >> 21) & 0x3) == 1)
-		set_x_reg(regs, 30, addr + 4);
+		if (update_lr(regs, addr + 4))
+			return;
+
+	instruction_pointer_set(regs, b_target);
 }
 
 void __kprobes
 simulate_ret(u32 opcode, long addr, struct pt_regs *regs)
 {
+	u64 ret_addr;
+	int err = 0;
 	int xn = (opcode >> 5) & 0x1f;
-
-	instruction_pointer_set(regs, get_x_reg(regs, xn));
+	unsigned long r_target = get_x_reg(regs, xn);
+
+	if (user_mode(regs) && task_gcs_el0_enabled(current)) {
+		ret_addr = pop_user_gcs(&err);
+		if (err || ret_addr != r_target) {
+			force_sig(SIGSEGV);
+			return;
+		}
+	}
+	instruction_pointer_set(regs, r_target);
 }
 
 void __kprobes
-- 
2.50.1


