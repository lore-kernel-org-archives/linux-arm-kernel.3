Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E43C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 20:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1sMx/P6rvXZQfj+O4YcXxMquCMUQe8GP2E9TP/qDKbA=; b=fiQzN+6pHQ7NqtiMEzKoxtUD1m
	4sx5SVlIHizWZdzsnkReNenMA31EsVR6/DYUB3Umd+Z3Vnu4vabrOqe5K+KzFzccUSsMlpdC747t8
	diO7qv157jPw0fvESk/oA8DmFBZCa6TOTQSJoKHpsrlGYRse332vvE7rHnOixo8Jvm2tLLxx63+8R
	FMpTPjNaBxb44V1i2vWzUjJV9fbiB1ExTCCayx6wWG1m7bVbcxmUO2YNRegwBcNxcUqbd3v6DV0Xe
	KfXJBxgioEZ/J52Ff+5jUCOMEIWn1SjZRbwHJMBbYmZDKGGrT9aGHuUseyehQj9P6p3LO2L1TFCsa
	N2w391Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tudzZ-000000074Jb-0Kn5;
	Tue, 18 Mar 2025 20:56:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tudrr-000000073Ad-441h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 20:48:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1606B1515;
	Tue, 18 Mar 2025 13:49:02 -0700 (PDT)
Received: from u200865.usa.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2386E3F694;
	Tue, 18 Mar 2025 13:48:53 -0700 (PDT)
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
Subject: [PATCH 2/7] arm64: probes: Break ret out from bl/blr
Date: Tue, 18 Mar 2025 15:48:36 -0500
Message-ID: <20250318204841.373116-3-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318204841.373116-1-jeremy.linton@arm.com>
References: <20250318204841.373116-1-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_134856_086713_C5C3393B 
X-CRM114-Status: GOOD (  10.89  )
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

Prepare for GCS by breaking RET out into its own function, where
it makes more sense to encapsulate the new behavior independent
from the branch instructions.

Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
---
 arch/arm64/kernel/probes/decode-insn.c   |  7 ++++---
 arch/arm64/kernel/probes/simulate-insn.c | 10 +++++++++-
 arch/arm64/kernel/probes/simulate-insn.h |  3 ++-
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/probes/decode-insn.c b/arch/arm64/kernel/probes/decode-insn.c
index 6438bf62e753..4137cc5ef031 100644
--- a/arch/arm64/kernel/probes/decode-insn.c
+++ b/arch/arm64/kernel/probes/decode-insn.c
@@ -108,9 +108,10 @@ arm_probe_decode_insn(u32 insn, struct arch_probe_insn *api)
 	    aarch64_insn_is_bl(insn)) {
 		api->handler = simulate_b_bl;
 	} else if (aarch64_insn_is_br(insn) ||
-	    aarch64_insn_is_blr(insn) ||
-	    aarch64_insn_is_ret(insn)) {
-		api->handler = simulate_br_blr_ret;
+		aarch64_insn_is_blr(insn)) {
+		api->handler = simulate_br_blr;
+	} else if (aarch64_insn_is_ret(insn)) {
+		api->handler = simulate_ret;
 	} else {
 		/*
 		 * Instruction cannot be stepped out-of-line and we don't
diff --git a/arch/arm64/kernel/probes/simulate-insn.c b/arch/arm64/kernel/probes/simulate-insn.c
index 4c6d2d712fbd..09a0b36122d0 100644
--- a/arch/arm64/kernel/probes/simulate-insn.c
+++ b/arch/arm64/kernel/probes/simulate-insn.c
@@ -126,7 +126,7 @@ simulate_b_cond(u32 opcode, long addr, struct pt_regs *regs)
 }
 
 void __kprobes
-simulate_br_blr_ret(u32 opcode, long addr, struct pt_regs *regs)
+simulate_br_blr(u32 opcode, long addr, struct pt_regs *regs)
 {
 	int xn = (opcode >> 5) & 0x1f;
 
@@ -138,6 +138,14 @@ simulate_br_blr_ret(u32 opcode, long addr, struct pt_regs *regs)
 		set_x_reg(regs, 30, addr + 4);
 }
 
+void __kprobes
+simulate_ret(u32 opcode, long addr, struct pt_regs *regs)
+{
+	int xn = (opcode >> 5) & 0x1f;
+
+	instruction_pointer_set(regs, get_x_reg(regs, xn));
+}
+
 void __kprobes
 simulate_cbz_cbnz(u32 opcode, long addr, struct pt_regs *regs)
 {
diff --git a/arch/arm64/kernel/probes/simulate-insn.h b/arch/arm64/kernel/probes/simulate-insn.h
index efb2803ec943..9e772a292d56 100644
--- a/arch/arm64/kernel/probes/simulate-insn.h
+++ b/arch/arm64/kernel/probes/simulate-insn.h
@@ -11,7 +11,8 @@
 void simulate_adr_adrp(u32 opcode, long addr, struct pt_regs *regs);
 void simulate_b_bl(u32 opcode, long addr, struct pt_regs *regs);
 void simulate_b_cond(u32 opcode, long addr, struct pt_regs *regs);
-void simulate_br_blr_ret(u32 opcode, long addr, struct pt_regs *regs);
+void simulate_br_blr(u32 opcode, long addr, struct pt_regs *regs);
+void simulate_ret(u32 opcode, long addr, struct pt_regs *regs);
 void simulate_cbz_cbnz(u32 opcode, long addr, struct pt_regs *regs);
 void simulate_tbz_tbnz(u32 opcode, long addr, struct pt_regs *regs);
 void simulate_ldr_literal(u32 opcode, long addr, struct pt_regs *regs);
-- 
2.48.1


