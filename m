Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E52C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jF5y9L+l3jNt20qPhgwwrkHDJKBrYSzsOIzrzqXhq2w=; b=ylxAFl+hvd4PzEx8c8v3oGHC+Z
	xYri7eKO6VcjME0rr5nmM6nxaS+MVaxnnzqnLT2A+qgk8teBa5q7C2026msAcsY1zmlyNQ0+XJd2k
	z2dlb7/zg8WSiVXhwDKCo4b84BSwZ1/iKB5+568gEEGFXsKOcL1ebiS0buypPnr7EcGwJwRyAgNK1
	8Ui/w4E2loXAuXQF+oCdCeFJf+useENJM2QtikXN9vT8SKn59AuuABX1ENVMRpDJoA1PQCMGD9/Ns
	2Ab2M1fLOdFdxEpS+kqGX/xiAO2UtaXR+Ln7wkNIw3R3X+ds62D0DAPOE1hBWz85LNwT6W/yPOfMB
	2NgFC3lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RzU-0000000Ckzx-1lpI;
	Tue, 01 Sep 2026 17:09:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RzT-0000000CkzE-3RVQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:09:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 47D7F6020D;
	Tue,  1 Sep 2026 17:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E494C1F000E9;
	Tue,  1 Sep 2026 17:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282583;
	bh=jF5y9L+l3jNt20qPhgwwrkHDJKBrYSzsOIzrzqXhq2w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=M8dNKu3/YOT7vpbR9f4HLYY4F751R7JlZIubqKgxCTrnrN86cMUnzO2FQK6+JhI9c
	 GoZWLX92lk9Jaffs06LfbPBZGBEX+YqSuIqAPQXzScpbeMw0fOcwqPkeFryxkD6JYg
	 va0V+i5cbDtFcjtsJLc1T9pLialrMv3fbbys8mckyms3C+wB6kSylg8JheNfF0iP0R
	 JvfIq18FLBSO6IgFDvR3nOKZ4Qch8KSfXZsUIpaTBX7cavQMck/AxA5JndX7ZVM/ye
	 DtQcUI3zG9qqRFLwByUMmKBuBPOtkWbncQ/MFN89frLFf8fOfVy48jBuBujuLNSwOl
	 C3F26wvFrfbsQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 18:06:42 +0100
Subject: [PATCH 02/11] kselftest/arm64: Factor shared signal handlers out
 of fp-stress loads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-fp-stress-kvm-v1-2-31bce995b49b@kernel.org>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8112; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RUm+OmsCqb1Gk0GBEixjr9Ge7JmaFMl9sztHiFSBLFk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlwbG/hXeR6h2D1b6d8tkkH+2fP8TFm0f8NWHs
 7r+mE7iMAmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcGxgAKCRAk1otyXVSH
 0CKuB/9JKo1etOWICqzLxdOFGeZTIBxbPPlSLA7tedxD9XUR+ktF9V01dk7HVFxWcr6SwFhxNwt
 ZnE2URyXMyHr7fJ7iftTwlUoL88PY2vNTFCqrZDOev4P3kbT29WHhS151Ea4bzA5/Ug2Dce2FKZ
 7dUjpK3FZaZvCKM/Y3bP7bk9gmGs3/QeLRhYvDo0pp8FsEHPuq2tsCQN7/4ZVCmP0xJT38vH/7a
 SAOoodPBT4X38ewzldXYhWfMGKdmFLpHQneiPAvr8z6jCADOoxE9jmMKdQjCkHeARYuWUT5IpyM
 y3OeT63WnlOzoP/YgguGZsVQw9Nq5y5BCays+wP2sSk3xEcA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

The assembly programs run by fp-stress all have identical signal
handlers for cleanly exiting the program and simply countil signal
deliveries, consolidate them into a single copies in asm-utils-linux.S.

No functional change.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/Makefile          | 14 +++----
 tools/testing/selftests/arm64/fp/asm-utils-linux.S | 43 ++++++++++++++++++++++
 tools/testing/selftests/arm64/fp/fpsimd-test.S     | 28 --------------
 tools/testing/selftests/arm64/fp/sve-test.S        | 28 --------------
 tools/testing/selftests/arm64/fp/za-test.S         | 28 --------------
 tools/testing/selftests/arm64/fp/zt-test.S         | 28 --------------
 6 files changed, 50 insertions(+), 119 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/Makefile b/tools/testing/selftests/arm64/fp/Makefile
index 183e9d319b65..d92a755837ff 100644
--- a/tools/testing/selftests/arm64/fp/Makefile
+++ b/tools/testing/selftests/arm64/fp/Makefile
@@ -25,21 +25,21 @@ TEST_PROGS_EXTENDED := fpsimd-stress sve-stress ssve-stress za-stress
 EXTRA_CLEAN += $(OUTPUT)/asm-utils.o $(OUTPUT)/asm-utils-linux.o \
 	$(OUTPUT)/rdvl.o $(OUTPUT)/za-fork-asm.o
 
-ASM_UTILS := $(OUTPUT)/asm-utils.o $(OUTPUT)/asm-utils-linux.o
+ASM_UTILS_LINUX := $(OUTPUT)/asm-utils.o $(OUTPUT)/asm-utils-linux.o
 
 # Build with nolibc to avoid effects due to libc's clone() support
-$(OUTPUT)/fp-pidbench: fp-pidbench.S $(ASM_UTILS)
+$(OUTPUT)/fp-pidbench: fp-pidbench.S $(ASM_UTILS_LINUX)
 	$(CC) -nostdlib $^ -o $@
 $(OUTPUT)/fp-ptrace: fp-ptrace.c fp-ptrace-asm.S
-$(OUTPUT)/fpsimd-test: fpsimd-test.S $(ASM_UTILS)
+$(OUTPUT)/fpsimd-test: fpsimd-test.S $(ASM_UTILS_LINUX)
 	$(CC) -nostdlib $^ -o $@
 $(OUTPUT)/rdvl-sve: rdvl-sve.c $(OUTPUT)/rdvl.o
 $(OUTPUT)/rdvl-sme: rdvl-sme.c $(OUTPUT)/rdvl.o
 $(OUTPUT)/sve-ptrace: sve-ptrace.c
 $(OUTPUT)/sve-probe-vls: sve-probe-vls.c $(OUTPUT)/rdvl.o
-$(OUTPUT)/sve-test: sve-test.S $(ASM_UTILS)
+$(OUTPUT)/sve-test: sve-test.S $(ASM_UTILS_LINUX)
 	$(CC) -nostdlib $^ -o $@
-$(OUTPUT)/ssve-test: sve-test.S $(ASM_UTILS)
+$(OUTPUT)/ssve-test: sve-test.S $(ASM_UTILS_LINUX)
 	$(CC) -DSSVE -nostdlib $^ -o $@
 $(OUTPUT)/vec-syscfg: vec-syscfg.c $(OUTPUT)/rdvl.o
 $(OUTPUT)/vlset: vlset.c
@@ -48,10 +48,10 @@ $(OUTPUT)/za-fork: za-fork.c $(OUTPUT)/za-fork-asm.o
 		-include ../../../../include/nolibc/nolibc.h -I../..\
 		-static -ffreestanding -Wall $^ -o $@
 $(OUTPUT)/za-ptrace: za-ptrace.c
-$(OUTPUT)/za-test: za-test.S $(ASM_UTILS)
+$(OUTPUT)/za-test: za-test.S $(ASM_UTILS_LINUX)
 	$(CC) -nostdlib $^ -o $@
 $(OUTPUT)/zt-ptrace: zt-ptrace.c
-$(OUTPUT)/zt-test: zt-test.S $(ASM_UTILS)
+$(OUTPUT)/zt-test: zt-test.S $(ASM_UTILS_LINUX)
 	$(CC) -nostdlib $^ -o $@
 
 include ../../lib.mk
diff --git a/tools/testing/selftests/arm64/fp/asm-utils-linux.S b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
index e6c22b41dc5e..3effeb1fbf50 100644
--- a/tools/testing/selftests/arm64/fp/asm-utils-linux.S
+++ b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
@@ -6,6 +6,7 @@
 
 #include <asm/unistd.h>
 #include "assembler.h"
+#include "asm-offsets.h"
 
 // Print a single character x0 to stdout
 // Clobbers x0-x2,x8
@@ -41,3 +42,45 @@ function puts
 	ret
 endfunction
 .globl	puts
+
+// Signal handler which reports a clean exit and terminates the program.
+// The tests keep their iteration count in x22 and their signal count in
+// x23, report those from the interrupted context.
+//
+// w0: signal number
+// x2: ucontext
+function terminate_handler
+	mov	w21, w0
+	mov	x20, x2
+
+	puts	"Terminated by signal "
+	mov	w0, w21
+	bl	putdec
+	puts	", no error, iterations="
+	ldr	x0, [x20, #ucontext_regs + 8 * 22]
+	bl	putdec
+	puts	", signals="
+	ldr	x0, [x20, #ucontext_regs + 8 * 23]
+	bl	putdecn
+
+	mov	x0, #0
+	mov	x8, #__NR_exit
+	svc	#0
+endfunction
+.globl	terminate_handler
+
+// Signal handler which only records that the program was interrupted.
+// The tests keep their signal count in x23, update that in the
+// interrupted context.
+//
+// w0: signal number
+// x2: ucontext
+function tickle_handler
+	// Increment the signal count (x23):
+	ldr	x0, [x2, #ucontext_regs + 8 * 23]
+	add	x0, x0, #1
+	str	x0, [x2, #ucontext_regs + 8 * 23]
+
+	ret
+endfunction
+.globl	tickle_handler
diff --git a/tools/testing/selftests/arm64/fp/fpsimd-test.S b/tools/testing/selftests/arm64/fp/fpsimd-test.S
index f89d67894c2e..9db7b5419397 100644
--- a/tools/testing/selftests/arm64/fp/fpsimd-test.S
+++ b/tools/testing/selftests/arm64/fp/fpsimd-test.S
@@ -149,34 +149,6 @@ function irritator_handler
 	ret
 endfunction
 
-function tickle_handler
-	// Increment the signal count (x23):
-	ldr	x0, [x2, #ucontext_regs + 8 * 23]
-	add	x0, x0, #1
-	str	x0, [x2, #ucontext_regs + 8 * 23]
-
-	ret
-endfunction
-
-function terminate_handler
-	mov	w21, w0
-	mov	x20, x2
-
-	puts	"Terminated by signal "
-	mov	w0, w21
-	bl	putdec
-	puts	", no error, iterations="
-	ldr	x0, [x20, #ucontext_regs + 8 * 22]
-	bl	putdec
-	puts	", signals="
-	ldr	x0, [x20, #ucontext_regs + 8 * 23]
-	bl	putdecn
-
-	mov	x0, #0
-	mov	x8, #__NR_exit
-	svc	#0
-endfunction
-
 // w0: signal number
 // x1: sa_action
 // w2: sa_flags
diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
index 7ef7835389e7..2aadb5c3c0f3 100644
--- a/tools/testing/selftests/arm64/fp/sve-test.S
+++ b/tools/testing/selftests/arm64/fp/sve-test.S
@@ -317,34 +317,6 @@ function irritator_handler
 	ret
 endfunction
 
-function tickle_handler
-	// Increment the signal count (x23):
-	ldr	x0, [x2, #ucontext_regs + 8 * 23]
-	add	x0, x0, #1
-	str	x0, [x2, #ucontext_regs + 8 * 23]
-
-	ret
-endfunction
-
-function terminate_handler
-	mov	w21, w0
-	mov	x20, x2
-
-	puts	"Terminated by signal "
-	mov	w0, w21
-	bl	putdec
-	puts	", no error, iterations="
-	ldr	x0, [x20, #ucontext_regs + 8 * 22]
-	bl	putdec
-	puts	", signals="
-	ldr	x0, [x20, #ucontext_regs + 8 * 23]
-	bl	putdecn
-
-	mov	x0, #0
-	mov	x8, #__NR_exit
-	svc	#0
-endfunction
-
 // w0: signal number
 // x1: sa_action
 // w2: sa_flags
diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
index 9c33e13e9dc4..84e63e510f23 100644
--- a/tools/testing/selftests/arm64/fp/za-test.S
+++ b/tools/testing/selftests/arm64/fp/za-test.S
@@ -162,34 +162,6 @@ function irritator_handler
 	ret
 endfunction
 
-function tickle_handler
-	// Increment the signal count (x23):
-	ldr	x0, [x2, #ucontext_regs + 8 * 23]
-	add	x0, x0, #1
-	str	x0, [x2, #ucontext_regs + 8 * 23]
-
-	ret
-endfunction
-
-function terminate_handler
-	mov	w21, w0
-	mov	x20, x2
-
-	puts	"Terminated by signal "
-	mov	w0, w21
-	bl	putdec
-	puts	", no error, iterations="
-	ldr	x0, [x20, #ucontext_regs + 8 * 22]
-	bl	putdec
-	puts	", signals="
-	ldr	x0, [x20, #ucontext_regs + 8 * 23]
-	bl	putdecn
-
-	mov	x0, #0
-	mov	x8, #__NR_exit
-	svc	#0
-endfunction
-
 // w0: signal number
 // x1: sa_action
 // w2: sa_flags
diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
index a8df05771670..afcadb5aff23 100644
--- a/tools/testing/selftests/arm64/fp/zt-test.S
+++ b/tools/testing/selftests/arm64/fp/zt-test.S
@@ -131,34 +131,6 @@ function irritator_handler
 	ret
 endfunction
 
-function tickle_handler
-	// Increment the signal count (x23):
-	ldr	x0, [x2, #ucontext_regs + 8 * 23]
-	add	x0, x0, #1
-	str	x0, [x2, #ucontext_regs + 8 * 23]
-
-	ret
-endfunction
-
-function terminate_handler
-	mov	w21, w0
-	mov	x20, x2
-
-	puts	"Terminated by signal "
-	mov	w0, w21
-	bl	putdec
-	puts	", no error, iterations="
-	ldr	x0, [x20, #ucontext_regs + 8 * 22]
-	bl	putdec
-	puts	", signals="
-	ldr	x0, [x20, #ucontext_regs + 8 * 23]
-	bl	putdecn
-
-	mov	x0, #0
-	mov	x8, #__NR_exit
-	svc	#0
-endfunction
-
 // w0: signal number
 // x1: sa_action
 // w2: sa_flags

-- 
2.47.3


