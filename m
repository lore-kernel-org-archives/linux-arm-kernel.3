Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73036C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZWqgJ4teRUo17pRZx48qbUnmqiDa8be6aGrpRe0ayc=; b=CZCUnK6c8Mq/Kpy34ilJfHNanA
	vsS+iagaL69cFtwqdGY/Gp14qriMpamkRl9bh02lXB9atv+R4mdK1xtcLf3QrYxDChHuILDX9FJ82
	m7TqqNL3SQsigWX77QhRjTcWiXsMF/VTeLi9QJp/QBGKZV2q2TlRuayROACh0FR2vD37gV7WmGGJl
	UXad9fxIkG1MzBmfqpTyAwUlmPzTNzNo7ZNtKZJPA8bsuH3OvhXYO9hyC3hyuC1UYQyrsa33SNdzY
	oQ0b37aQYeeuDkwKeAhkhpRdY42vPuFINLFfG4YddfXxdrHYo1qX5MltWiZLyM4+738i8Im0z4IQW
	Fi5Dvj9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Rzn-0000000ClGC-0RDI;
	Tue, 01 Sep 2026 17:10:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Rzl-0000000ClDy-2HBG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:10:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0172E602D4;
	Tue,  1 Sep 2026 17:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9F51F000E9;
	Tue,  1 Sep 2026 17:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282600;
	bh=FZWqgJ4teRUo17pRZx48qbUnmqiDa8be6aGrpRe0ayc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WXStHWhTD5NAFu6myy0/O/lugU7QgBdT0ANF8Fnww4L64EJDuJbW9KOZUt+LATpPt
	 FOcxqaaBf2i+iKOJ5CTZo0MHd+OVpCGH6Ruv2DLPHbkIZUyjE3W50j3XVw8/LpVYmN
	 p3Oggg2oBFh8gdfgcBYq/eOeKgPLEvqexjNLOgiSMCcVfr5l+xxuCjQ2Aw/37JzZDq
	 fCecEAHIv0M0U7TksBES9orPZosb+L9skis7lY6ZNsq2xlt0TQ6vG0eTLmhEvJIZvw
	 kEblK+FvQHKBzQnlYLJFhqvS0o+qJWClglEagdfYZuNPNOQ/1Jt7+omkmLIKtaVj/3
	 I2ZVyju/Ei9ow==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 18:06:49 +0100
Subject: [PATCH 09/11] kselftest/arm64: Build KVM guest versions of the
 fp-stress loads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-fp-stress-kvm-v1-9-31bce995b49b@kernel.org>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8394; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nsfRN3vA/YB/iklxl04ir42UJyixVBb1znwL44VYW8s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlwbLzPAVC3GKJMpZYrNGubZMa9quDjrjRba7j
 6FJKixCFYmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcGywAKCRAk1otyXVSH
 0K31B/0cIAmaYL8I6tsjl8t22xJsPtW5Is5VY7qEYHvEoZrJqXOfg0YHykFjQqEY051kMW+AKzN
 Vn5ZdT1ArVL6nVQauys4/1T2yeC4QM9zMp9PIjn3e0a7CoRPHX80gm45FUHOSFL6juZSbptDP9V
 YVNGfZF1g+8yAWml5nauzvwPmRajxKh3bXBeuxdmURMmp62Au2GHKP7sPAG23j9X6/kEmY7t/CK
 JtRlHXBsKLFsJUWqiCefOLxUQBszX0GY/if35yg8xFwTqR6iTCNVHXzWRj25c/IfROL7a0gk2p/
 p+UMvwqA8gNkIo/ECxy8vU3TgIlVDQ/7C8TDlOoRPkusERrk
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

Now that all the Linux specifics have been factored out of the load
programs that fp-stress uses and we have a simple VMM we can build
versions for running with that VMM.  Provide an asm-utils-kvm.S with
startup code that's easier in the guest and implementations of the
functions that the programs call, writing output to the fixed address
expected by the VMM and using PSCI to shut down on error.

The programs are built into flat binaries to simplify the VMM, this is a
bit more Makefile effort but it's all fairly standard for bare metal
programming.

We install single instruction BRK handlers for all exceptions with the
expectation that the VMM will trap BRKs and log exception state, we do
not expect to trigger any exceptions in normal operation.

We log the current EL to help with diagnostics.

Since we're constantly reading and writing the contents of the floating
point registers to and from memory there is fairly heavy memory traffic.
We do not currently turn the MMU on so on hardware the number of
iterations a test does will be very much lower that that seen on the
host, this can be addressed in future.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/.gitignore        |  3 +
 tools/testing/selftests/arm64/fp/Makefile          | 40 +++++++++-
 tools/testing/selftests/arm64/fp/asm-utils-kvm.S   | 86 ++++++++++++++++++++++
 .../testing/selftests/arm64/fp/fp-stress-kvm.lds.S | 58 +++++++++++++++
 4 files changed, 186 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/.gitignore b/tools/testing/selftests/arm64/fp/.gitignore
index 229a5c65b65f..7a788b23ae76 100644
--- a/tools/testing/selftests/arm64/fp/.gitignore
+++ b/tools/testing/selftests/arm64/fp/.gitignore
@@ -1,6 +1,7 @@
 fp-pidbench
 fp-ptrace
 fp-stress
+fp-stress-kvm.lds
 fp-stress-vmm
 fpsimd-test
 kernel-test
@@ -17,3 +18,5 @@ za-ptrace
 za-test
 zt-ptrace
 zt-test
+*-kvm.bin
+*-kvm.elf
diff --git a/tools/testing/selftests/arm64/fp/Makefile b/tools/testing/selftests/arm64/fp/Makefile
index 3c4e17a34776..5322cb66f0a9 100644
--- a/tools/testing/selftests/arm64/fp/Makefile
+++ b/tools/testing/selftests/arm64/fp/Makefile
@@ -21,17 +21,41 @@ TEST_GEN_PROGS_EXTENDED := fp-pidbench fp-stress-vmm fpsimd-test \
 	zt-test \
 	vlset
 TEST_PROGS_EXTENDED := fpsimd-stress sve-stress ssve-stress za-stress
+TEST_GEN_FILES := \
+	fpsimd-test-kvm.bin \
+	sve-test-kvm.bin \
+	ssve-test-kvm.bin \
+	za-test-kvm.bin \
+	zt-test-kvm.bin
 
 EXTRA_CLEAN += $(OUTPUT)/asm-utils.o $(OUTPUT)/asm-utils-linux.o \
-	$(OUTPUT)/rdvl.o $(OUTPUT)/za-fork-asm.o
+	$(OUTPUT)/rdvl.o $(OUTPUT)/za-fork-asm.o \
+	$(patsubst %.bin,%.elf,$(TEST_GEN_FILES)) \
+	$(KVM_LDS)
 
 ASM_UTILS_LINUX := $(OUTPUT)/asm-utils.o $(OUTPUT)/asm-utils-linux.o
+ASM_UTILS_KVM := asm-utils.S asm-utils-kvm.S
+
+OBJCOPY ?= $(CROSS_COMPILE)objcopy
 
 # For sysreg definitons
 ARCH_INCLUDES := $(KHDR_INCLUDES) -I$(top_srcdir)/tools/arch/arm64/include \
 	-I$(top_srcdir)/tools/include \
 	-I$(top_srcdir)/tools/include/generated
 
+# The guests run with no OS under them at all, link them as flat binaries
+# with the link script placing them where fp-stress-vmm puts their RAM.
+KVM_LDS := $(OUTPUT)/fp-stress-kvm.lds
+KVM_LDFLAGS := -nostdlib -static $(ARCH_INCLUDES) -D__ASSEMBLY__ \
+	-Wl,-T,$(KVM_LDS)
+
+# Supported/required from GNU ld 2.39, not confirmed LLD but after 22.1.2
+COMMA=,
+KVM_LDFLAGS += $(call try-run,$(LD) --warn-rwx-segments -v,-Wl$(COMMA)--warn-rwx-segments)
+
+$(KVM_LDS): fp-stress-kvm.lds.S fp-stress-vmm.h
+	$(CC) -E -P -x c $< -o $@
+
 $(OUTPUT)/fp-stress-vmm: CFLAGS += $(ARCH_INCLUDES)
 
 # Build with nolibc to avoid effects due to libc's clone() support
@@ -61,4 +85,18 @@ $(OUTPUT)/zt-ptrace: zt-ptrace.c
 $(OUTPUT)/zt-test: zt-test.S $(ASM_UTILS_LINUX)
 	$(CC) -nostdlib $^ -o $@
 
+$(OUTPUT)/fpsimd-test-kvm.elf: fpsimd-test.S $(ASM_UTILS_KVM) $(KVM_LDS)
+	$(CC) $(KVM_LDFLAGS) $(filter %.S,$^) -o $@
+$(OUTPUT)/sve-test-kvm.elf: sve-test.S $(ASM_UTILS_KVM) $(KVM_LDS)
+	$(CC) $(KVM_LDFLAGS) $(filter %.S,$^) -o $@
+$(OUTPUT)/ssve-test-kvm.elf: sve-test.S $(ASM_UTILS_KVM) $(KVM_LDS)
+	$(CC) -DSSVE $(KVM_LDFLAGS) $(filter %.S,$^) -o $@
+$(OUTPUT)/za-test-kvm.elf: za-test.S $(ASM_UTILS_KVM) $(KVM_LDS)
+	$(CC) $(KVM_LDFLAGS) $(filter %.S,$^) -o $@
+$(OUTPUT)/zt-test-kvm.elf: zt-test.S $(ASM_UTILS_KVM) $(KVM_LDS)
+	$(CC) $(KVM_LDFLAGS) $(filter %.S,$^) -o $@
+
+$(OUTPUT)/%-kvm.bin: $(OUTPUT)/%-kvm.elf
+	$(OBJCOPY) -O binary $< $@
+
 include ../../lib.mk
diff --git a/tools/testing/selftests/arm64/fp/asm-utils-kvm.S b/tools/testing/selftests/arm64/fp/asm-utils-kvm.S
new file mode 100644
index 000000000000..422d6425ab56
--- /dev/null
+++ b/tools/testing/selftests/arm64/fp/asm-utils-kvm.S
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Utility functions for assembly code programs run under fp-stress-vmm.
+//
+// Copyright 2026, Arm Ltd
+
+#include <asm/sysreg.h>
+
+#include "assembler.h"
+#include "asm-offsets.h"
+#include "fp-stress-vmm.h"
+
+#define PSCI_0_2_FN_SYSTEM_OFF		0x84000008
+
+// Print a single character x0 to the console
+// Clobbers x1
+function putc
+	movz	x1, #(CONSOLE_BASE >> 16), lsl #16
+	strb	w0, [x1]
+	ret
+endfunction
+.globl	putc
+
+// Print a \0 terminated string starting at address x0 to the console.
+// Doesn't use putc as a slight optimisation.
+// Clobbers x0-x3
+function puts
+	mov	x2, x0
+	movz	x3, #(CONSOLE_BASE >> 16), lsl #16
+
+0:	ldrb	w0, [x2], #1
+	cbz	w0, 1f
+	strb	w0, [x3]
+	b	0b
+
+1:	ret
+endfunction
+.globl	puts
+
+// Report errors to the host by shutting down, there is no other reason one
+// of these test programs should exit.
+function exit_error
+	movz	x0, #(PSCI_0_2_FN_SYSTEM_OFF >> 16), lsl #16
+	movk	x0, #(PSCI_0_2_FN_SYSTEM_OFF & 0xffff)
+	hvc	#0
+
+0:	b	0b		// PSCI should not have returned
+endfunction
+.globl	exit_error
+
+// Exception vectors.  We have no handlers for anything so each entry
+// just BRKs with its own number.
+	.balign	2048
+vectors:
+	.irp	vector, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
+	.balign	0x80
+	brk	#\vector
+	.endr
+
+// Main program entry point.
+//
+// The VMM starts us at the very start of the image so the link script
+// places .text.boot first.
+	.section .text.boot, "ax"
+.globl _start
+function _start
+	// Vectors that report any exception we take to the VMM.
+	adr	x0, vectors
+	msr	VBAR_EL1, x0
+
+	// The VMM sizes our RAM as the image plus GUEST_EXTRA_RAM, put the
+	// stack at the top of that so it grows down away from the image.
+	ldr	x0, =_end
+	ldr	x1, =GUEST_EXTRA_RAM
+	add	x0, x0, x1
+	and	x0, x0, #~15
+	mov	sp, x0
+
+	// Log the current EL for diagnostic purposes.
+	puts	"EL:\t\tEL"
+	mrs	x0, CurrentEL
+	ubfx	x0, x0, #2, #2
+	bl	putdecn
+
+	b	main
+endfunction
diff --git a/tools/testing/selftests/arm64/fp/fp-stress-kvm.lds.S b/tools/testing/selftests/arm64/fp/fp-stress-kvm.lds.S
new file mode 100644
index 000000000000..f1d44f0ae49c
--- /dev/null
+++ b/tools/testing/selftests/arm64/fp/fp-stress-kvm.lds.S
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Link script for the flat binary builds of the fp-stress loads which run
+ * as guests under fp-stress-vmm.
+ *
+ * The VMM loads the image at the start of the guest RAM and starts the
+ * guest there so the startup code has to be first in the image, it is in
+ * .text.boot for that.
+ */
+
+#include "fp-stress-vmm.h"
+
+OUTPUT_ARCH(aarch64)
+ENTRY(_start)
+
+SECTIONS
+{
+	. = GUEST_RAM_BASE;
+
+	.text : {
+		*(.text.boot)
+		*(.text)
+		*(.text.*)
+	}
+
+	.rodata : {
+		*(.rodata)
+		*(.rodata.*)
+	}
+
+	.data : {
+		*(.data)
+		*(.data.*)
+	}
+
+	.bss : {
+		*(.bss)
+		*(.bss.*)
+		*(COMMON)
+	}
+
+	. = ALIGN(16);
+	_end = .;
+
+	/DISCARD/ : {
+		*(.note*)
+		*(.comment)
+		*(.eh_frame*)
+	}
+}
+
+/*
+ * The VMM sizes the guest RAM from the size of the image file and the
+ * guest puts its stack immediately above _end, anything allocated but not
+ * present in the file would leave the two disagreeing about where the RAM
+ * ends.
+ */
+ASSERT(SIZEOF(.bss) == 0, "fp-stress guests must not have a .bss")

-- 
2.47.3


