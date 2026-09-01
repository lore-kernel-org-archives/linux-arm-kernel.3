Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD127C624D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HULJndtp0Tjhll/Q5SWktZ6wE7CK9FfHbxH2HGfHzI0=; b=FixUI/vo/ChqtdO/TigkjfDCvv
	rWWjSmNoCf0KepCZqtqIycL536YKSSFTmdKmK/Kr2Ktg+xkbuIiZJNqzblztnSqHerLrBu/Eu8fEX
	gwN9ZYIvd3Ey5wM68U/VF2EZGBiLkZtINROO3AyWJ9G6JfrtfpFQfoSW+hnr5bdTDl7en02vNLHhX
	kSjsG0cgBl9XjSKsO/bFDi3+bdHw90VAbou+nDlkEiItiKUMoofri56roim0AX3nCFjRy6D5DTlSz
	0TwZaLRHK3NdW+A9ZuQ5j1Qwfvgu4Ws5kQ0mZwgAKhUFG9v1oBFpg2uzl0OlyaHQjGyLgCCe8DMit
	z16ZNWdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RzT-0000000Ckyw-1HMO;
	Tue, 01 Sep 2026 17:09:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RzR-0000000Ckxy-0Mg1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:09:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 93A2F43867;
	Tue,  1 Sep 2026 17:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6D91F00A3A;
	Tue,  1 Sep 2026 17:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282580;
	bh=HULJndtp0Tjhll/Q5SWktZ6wE7CK9FfHbxH2HGfHzI0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GfccV3vhxqpptjn1zxNTpPWoJOV3Atdg1depCPnGYPVctGKiKAA697Lr7jZVHjr2K
	 0g/xiZxJs+ElWWJNKebsZNjTF/DuB9UwUhBb6H9mprvTZT5VpEy5hIBnaO7fcI4/Te
	 KuSXLPR404IFX3kAgli/U0DAXgPHeOIsFlOKdzv2K9GUnYVSne+JQPOnDLL/MY/Xcx
	 tsZaHNa40MWFZUJLiDS55LTbD+pZOhv5eWBHud8JfZcItLV7TXivpPN/FjUi3omaX2
	 z55a/Q9kIlSmuh33k0kmiDDn4UkeX2Xb+0jjUGdVSDg3fHTkm3hIXwuJy7fIuxg+9P
	 EOr85rtwwBFuQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 18:06:41 +0100
Subject: [PATCH 01/11] kselftest/arm64: Factor Linux syscalls out of
 asm-utils.S
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-fp-stress-kvm-v1-1-31bce995b49b@kernel.org>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4894; i=broonie@kernel.org;
 h=from:subject:message-id; bh=snKqfqgpbLGblFFfDtlaIFqBjQdPY6+ur0ZqOXC1eJo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlwbFyvxRgj5yarSWfYu94qZF9l6oHxKOlnEtY
 5f/dVPnsm6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcGxQAKCRAk1otyXVSH
 0HNnB/9g5R84rfeuTXzwQkrVqKRjsMHwxgvoL7Lyt1ZPR8rV5/TccRuzRs0a66TBDAwt3erBsj8
 53vI6g2K2BhCdogP65GC4lyK2w1dcWXujK9aaV160czAp8e6YXwrbtOXTQOGBboz+2MjrWKJouT
 Mxt7FpVdo5Zi2z9egSyhGT1OzycedqYvZ12o0oTa0poJoK1R3UD3NjN0Louy69Ylp3mMqLHDHku
 d+iZAhv5E7PztctUD6KDRx+7cBGF6fuPNsswlcjB/CRaLSf7+XVu5NizsHcd5EyxQ3fk2eE9adE
 7/mTP+LxtsJVswom8iQxSWKN9YZ19hTgUEYfrGd0Egz1Q74x
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

In preparation for building versions of the load programs for fp-stress
that run as KVM guests move the functions that perform syscalls out of
the shared code assembly code in asm-utils.S into a new Linux specific
file asm-utils-linux.S.

No functional change.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/Makefile          | 17 +++++----
 tools/testing/selftests/arm64/fp/asm-utils-linux.S | 43 ++++++++++++++++++++++
 tools/testing/selftests/arm64/fp/asm-utils.S       | 36 ------------------
 3 files changed, 53 insertions(+), 43 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/Makefile b/tools/testing/selftests/arm64/fp/Makefile
index d171021e4cdd..183e9d319b65 100644
--- a/tools/testing/selftests/arm64/fp/Makefile
+++ b/tools/testing/selftests/arm64/fp/Makefile
@@ -22,21 +22,24 @@ TEST_GEN_PROGS_EXTENDED := fp-pidbench fpsimd-test \
 	vlset
 TEST_PROGS_EXTENDED := fpsimd-stress sve-stress ssve-stress za-stress
 
-EXTRA_CLEAN += $(OUTPUT)/asm-utils.o $(OUTPUT)/rdvl.o $(OUTPUT)/za-fork-asm.o
+EXTRA_CLEAN += $(OUTPUT)/asm-utils.o $(OUTPUT)/asm-utils-linux.o \
+	$(OUTPUT)/rdvl.o $(OUTPUT)/za-fork-asm.o
+
+ASM_UTILS := $(OUTPUT)/asm-utils.o $(OUTPUT)/asm-utils-linux.o
 
 # Build with nolibc to avoid effects due to libc's clone() support
-$(OUTPUT)/fp-pidbench: fp-pidbench.S $(OUTPUT)/asm-utils.o
+$(OUTPUT)/fp-pidbench: fp-pidbench.S $(ASM_UTILS)
 	$(CC) -nostdlib $^ -o $@
 $(OUTPUT)/fp-ptrace: fp-ptrace.c fp-ptrace-asm.S
-$(OUTPUT)/fpsimd-test: fpsimd-test.S $(OUTPUT)/asm-utils.o
+$(OUTPUT)/fpsimd-test: fpsimd-test.S $(ASM_UTILS)
 	$(CC) -nostdlib $^ -o $@
 $(OUTPUT)/rdvl-sve: rdvl-sve.c $(OUTPUT)/rdvl.o
 $(OUTPUT)/rdvl-sme: rdvl-sme.c $(OUTPUT)/rdvl.o
 $(OUTPUT)/sve-ptrace: sve-ptrace.c
 $(OUTPUT)/sve-probe-vls: sve-probe-vls.c $(OUTPUT)/rdvl.o
-$(OUTPUT)/sve-test: sve-test.S $(OUTPUT)/asm-utils.o
+$(OUTPUT)/sve-test: sve-test.S $(ASM_UTILS)
 	$(CC) -nostdlib $^ -o $@
-$(OUTPUT)/ssve-test: sve-test.S $(OUTPUT)/asm-utils.o
+$(OUTPUT)/ssve-test: sve-test.S $(ASM_UTILS)
 	$(CC) -DSSVE -nostdlib $^ -o $@
 $(OUTPUT)/vec-syscfg: vec-syscfg.c $(OUTPUT)/rdvl.o
 $(OUTPUT)/vlset: vlset.c
@@ -45,10 +48,10 @@ $(OUTPUT)/za-fork: za-fork.c $(OUTPUT)/za-fork-asm.o
 		-include ../../../../include/nolibc/nolibc.h -I../..\
 		-static -ffreestanding -Wall $^ -o $@
 $(OUTPUT)/za-ptrace: za-ptrace.c
-$(OUTPUT)/za-test: za-test.S $(OUTPUT)/asm-utils.o
+$(OUTPUT)/za-test: za-test.S $(ASM_UTILS)
 	$(CC) -nostdlib $^ -o $@
 $(OUTPUT)/zt-ptrace: zt-ptrace.c
-$(OUTPUT)/zt-test: zt-test.S $(OUTPUT)/asm-utils.o
+$(OUTPUT)/zt-test: zt-test.S $(ASM_UTILS)
 	$(CC) -nostdlib $^ -o $@
 
 include ../../lib.mk
diff --git a/tools/testing/selftests/arm64/fp/asm-utils-linux.S b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
new file mode 100644
index 000000000000..e6c22b41dc5e
--- /dev/null
+++ b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2015-2021 ARM Limited.
+// Original author: Dave Martin <Dave.Martin@arm.com>
+//
+// Utility functions for assembly code which use Linux syscalls.
+
+#include <asm/unistd.h>
+#include "assembler.h"
+
+// Print a single character x0 to stdout
+// Clobbers x0-x2,x8
+function putc
+	str	x0, [sp, #-16]!
+
+	mov	x0, #1			// STDOUT_FILENO
+	mov	x1, sp
+	mov	x2, #1
+	mov	x8, #__NR_write
+	svc	#0
+
+	add	sp, sp, #16
+	ret
+endfunction
+.globl	putc
+
+// Print a NUL-terminated string starting at address x0 to stdout
+// Clobbers x0-x3,x8
+function puts
+	mov	x1, x0
+
+	mov	x2, #0
+0:	ldrb	w3, [x0], #1
+	cbz	w3, 1f
+	add	x2, x2, #1
+	b	0b
+
+1:	mov	w0, #1			// STDOUT_FILENO
+	mov	x8, #__NR_write
+	svc	#0
+
+	ret
+endfunction
+.globl	puts
diff --git a/tools/testing/selftests/arm64/fp/asm-utils.S b/tools/testing/selftests/arm64/fp/asm-utils.S
index 4b9728efc18d..6d43eb10e01f 100644
--- a/tools/testing/selftests/arm64/fp/asm-utils.S
+++ b/tools/testing/selftests/arm64/fp/asm-utils.S
@@ -4,44 +4,8 @@
 //
 // Utility functions for assembly code.
 
-#include <asm/unistd.h>
 #include "assembler.h"
 
-// Print a single character x0 to stdout
-// Clobbers x0-x2,x8
-function putc
-	str	x0, [sp, #-16]!
-
-	mov	x0, #1			// STDOUT_FILENO
-	mov	x1, sp
-	mov	x2, #1
-	mov	x8, #__NR_write
-	svc	#0
-
-	add	sp, sp, #16
-	ret
-endfunction
-.globl	putc
-	
-// Print a NUL-terminated string starting at address x0 to stdout
-// Clobbers x0-x3,x8
-function puts
-	mov	x1, x0
-
-	mov	x2, #0
-0:	ldrb	w3, [x0], #1
-	cbz	w3, 1f
-	add	x2, x2, #1
-	b	0b
-
-1:	mov	w0, #1			// STDOUT_FILENO
-	mov	x8, #__NR_write
-	svc	#0
-
-	ret
-endfunction
-.globl	puts
-
 // Print an unsigned decimal number x0 to stdout
 // Clobbers x0-x4,x8
 function putdec

-- 
2.47.3


