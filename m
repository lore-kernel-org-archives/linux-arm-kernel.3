Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71723CFA765
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 10:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ShEWZDGVfSWGvaWH66N+yVtRbZoEirjG0NK4KU0DrU=; b=HonxE2bhExOEpN1rr/VR6DP0Bi
	l1jtseKd17rInycOBQXP4nPwojGeq0pBYjqBp4DzeDOr/Rql/0f5H/5MHZrvl3lq9Ig7+/+H/Ee/7
	sTdHguhQN6bvxFQXvVQJmGoZRL+pZ4udBX73IMb888UCQKAHrxGkquJG13PDrdJt/ZOGgptUKiGKv
	d31PhZlB/byaCcShkyEDRFrvj7F+3U06jkeWQcmsu8vswc+ButyqR/XimIURZzPnIW5226+oJrDVu
	YIIDXgNdBA8hangosAoZC2Ie8m2psRCai+neiZE9culVq0icArzntLgEKGP2V3KaMECYktCTPu0yL
	I8gfk7OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNxR-00000008Bil-2STt;
	Fri, 21 Nov 2025 10:01:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNxM-00000008Bdl-1Op6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 10:01:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763719291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ShEWZDGVfSWGvaWH66N+yVtRbZoEirjG0NK4KU0DrU=;
	b=Vr29PgQxTeyBgNvEQnX8YvQTBzDGr+fNL2jGd//Y2IR6r4W6A/nd6XWnbar42Kem3vuIYw
	MKUANjawICWMFKV6pYcfWlDx4QKcBOKsrvz6rDySVpb/LkFkzZE8p7GDUD1uSXMHKCCHI9
	58EPuxKIeP8GeaAt85fKvmFtFKN6x2I=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-490-oIKYxLfKPImfcYbrMPco9A-1; Fri,
 21 Nov 2025 05:01:29 -0500
X-MC-Unique: oIKYxLfKPImfcYbrMPco9A-1
X-Mimecast-MFC-AGG-ID: oIKYxLfKPImfcYbrMPco9A_1763719288
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 80A7E195605B;
	Fri, 21 Nov 2025 10:01:28 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.78])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5EFA71955F66;
	Fri, 21 Nov 2025 10:01:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kbuild@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 9/9] treewide: Stop defining __ASSEMBLY__ for assembler files
Date: Fri, 21 Nov 2025 11:00:44 +0100
Message-ID: <20251121100044.282684-10-thuth@redhat.com>
In-Reply-To: <20251121100044.282684-1-thuth@redhat.com>
References: <20251121100044.282684-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_020132_458819_90ECB7F6 
X-CRM114-Status: GOOD (  14.18  )
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

From: Thomas Huth <thuth@redhat.com>

All spots have been changed to __ASSEMBLER__ (i.e. the macro that
gets defined by the compiler), so we don't have to manually define
__ASSEMBLY__ now anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Makefile                                         | 2 +-
 arch/arm64/kernel/vdso32/Makefile                | 1 -
 arch/loongarch/vdso/Makefile                     | 2 +-
 arch/mips/boot/compressed/Makefile               | 2 +-
 arch/mips/vdso/Makefile                          | 2 +-
 arch/powerpc/boot/Makefile                       | 2 +-
 arch/powerpc/platforms/cell/spufs/Makefile       | 2 +-
 arch/s390/Makefile                               | 2 +-
 arch/x86/boot/Makefile                           | 2 +-
 arch/x86/boot/compressed/Makefile                | 2 +-
 arch/x86/realmode/rm/Makefile                    | 2 +-
 arch/xtensa/kernel/Makefile                      | 2 +-
 drivers/firmware/efi/libstub/Makefile            | 2 +-
 drivers/net/wan/Makefile                         | 2 +-
 scripts/Makefile.build                           | 2 +-
 scripts/gfp-translate                            | 2 +-
 tools/testing/selftests/kvm/lib/riscv/handlers.S | 4 ----
 tools/testing/selftests/vDSO/vgetrandom-chacha.S | 2 --
 18 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/Makefile b/Makefile
index d6ee709e45e8b..8e20bd8b1b561 100644
--- a/Makefile
+++ b/Makefile
@@ -581,7 +581,7 @@ LINUXINCLUDE    := \
 		-I$(objtree)/include \
 		$(USERINCLUDE)
 
-KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
+KBUILD_AFLAGS   := -fno-PIE
 
 KBUILD_CFLAGS :=
 KBUILD_CFLAGS += -std=gnu11
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 9d0efed91414c..6e6295f5983dc 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -82,7 +82,6 @@ VDSO_CFLAGS += -marm
 endif
 
 VDSO_AFLAGS := $(VDSO_CAFLAGS)
-VDSO_AFLAGS += -D__ASSEMBLY__
 
 # From arm vDSO Makefile
 VDSO_LDFLAGS += -Bsymbolic --no-undefined -soname=linux-vdso.so.1
diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
index c0cc3ca5da9f4..a5da5b862a3ec 100644
--- a/arch/loongarch/vdso/Makefile
+++ b/arch/loongarch/vdso/Makefile
@@ -24,7 +24,7 @@ cflags-vdso := $(ccflags-vdso) \
 	$(call cc-option, -fno-asynchronous-unwind-tables) \
 	$(call cc-option, -fno-stack-protector)
 aflags-vdso := $(ccflags-vdso) \
-	-D__ASSEMBLY__ -Wa,-gdwarf-2
+	-Wa,-gdwarf-2
 
 ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index e0b8ec9a95162..41ec115d4795b 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -30,7 +30,7 @@ endif
 KBUILD_CFLAGS := $(KBUILD_CFLAGS) -D__KERNEL__ -D__DISABLE_EXPORTS \
 	-DBOOT_HEAP_SIZE=$(BOOT_HEAP_SIZE) -D"VMLINUX_LOAD_ADDRESS_ULL=$(VMLINUX_LOAD_ADDRESS)ull"
 
-KBUILD_AFLAGS := $(KBUILD_AFLAGS) -D__ASSEMBLY__ \
+KBUILD_AFLAGS := $(KBUILD_AFLAGS) \
 	-DBOOT_HEAP_SIZE=$(BOOT_HEAP_SIZE) \
 	-DKERNEL_ENTRY=$(VMLINUX_ENTRY_ADDRESS)
 
diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index 69d4593f64fee..d6685a36c6b43 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -33,7 +33,7 @@ cflags-vdso := $(ccflags-vdso) \
 	-fno-stack-protector -fno-jump-tables -DDISABLE_BRANCH_PROFILING \
 	$(call cc-option, -fno-asynchronous-unwind-tables)
 aflags-vdso := $(ccflags-vdso) \
-	-D__ASSEMBLY__ -Wa,-gdwarf-2
+	-Wa,-gdwarf-2
 
 ifneq ($(c-gettimeofday-y),)
 CFLAGS_vgettimeofday.o = -include $(c-gettimeofday-y)
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index f1a4761ebd44b..5a75d4fd468cb 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -80,7 +80,7 @@ BOOTCFLAGS	:= $(BOOTTARGETFLAGS) \
 		   $(call cc-option,-mno-spe) $(call cc-option,-mspe=no) \
 		   -fomit-frame-pointer -fno-builtin -fPIC
 
-BOOTAFLAGS	:= $(BOOTTARGETFLAGS) -D__ASSEMBLY__
+BOOTAFLAGS	:= $(BOOTTARGETFLAGS)
 
 BOOTARFLAGS	:= -crD
 
diff --git a/arch/powerpc/platforms/cell/spufs/Makefile b/arch/powerpc/platforms/cell/spufs/Makefile
index 52e4c80ec8d03..c13928aea20c6 100644
--- a/arch/powerpc/platforms/cell/spufs/Makefile
+++ b/arch/powerpc/platforms/cell/spufs/Makefile
@@ -16,7 +16,7 @@ SPU_AS		:= $(SPU_CROSS)gcc
 SPU_LD		:= $(SPU_CROSS)ld
 SPU_OBJCOPY	:= $(SPU_CROSS)objcopy
 SPU_CFLAGS	:= -O2 -Wall -I$(srctree)/include -D__KERNEL__
-SPU_AFLAGS	:= -c -D__ASSEMBLY__ -I$(srctree)/include -D__KERNEL__
+SPU_AFLAGS	:= -c -I$(srctree)/include -D__KERNEL__
 SPU_LDFLAGS	:= -N -Ttext=0x0
 
 $(obj)/switch.o: $(obj)/spu_save_dump.h $(obj)/spu_restore_dump.h
diff --git a/arch/s390/Makefile b/arch/s390/Makefile
index 3005f5459f81b..da00d6953efae 100644
--- a/arch/s390/Makefile
+++ b/arch/s390/Makefile
@@ -18,7 +18,7 @@ KBUILD_CFLAGS	+= -fPIC
 LDFLAGS_vmlinux	:= $(call ld-option,-no-pie)
 extra_tools	:= relocs
 aflags_dwarf	:= -Wa,-gdwarf-2
-KBUILD_AFLAGS_DECOMPRESSOR := $(CLANG_FLAGS) -m64 -D__ASSEMBLY__
+KBUILD_AFLAGS_DECOMPRESSOR := $(CLANG_FLAGS) -m64
 ifndef CONFIG_AS_IS_LLVM
 KBUILD_AFLAGS_DECOMPRESSOR += $(if $(CONFIG_DEBUG_INFO),$(aflags_dwarf))
 endif
diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index 3f9fb3698d669..b343ef5ee9951 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -52,7 +52,7 @@ targets += cpustr.h
 # ---------------------------------------------------------------------------
 
 KBUILD_CFLAGS	:= $(REALMODE_CFLAGS) -D_SETUP
-KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
+KBUILD_AFLAGS	:= $(KBUILD_CFLAGS)
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables
 KBUILD_CFLAGS	+= $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
 
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 68f9d7a1683b5..91c68ab20588d 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -52,7 +52,7 @@ KBUILD_CFLAGS += -include $(srctree)/include/linux/hidden.h
 # that the compiler finds it even with out-of-tree builds (make O=/some/path).
 CFLAGS_sev-handle-vc.o += -I$(objtree)/arch/x86/lib/
 
-KBUILD_AFLAGS  := $(KBUILD_CFLAGS) -D__ASSEMBLY__
+KBUILD_AFLAGS  := $(KBUILD_CFLAGS)
 
 KBUILD_LDFLAGS := -m elf_$(UTS_MACHINE)
 KBUILD_LDFLAGS += $(call ld-option,--no-ld-generated-unwind-info)
diff --git a/arch/x86/realmode/rm/Makefile b/arch/x86/realmode/rm/Makefile
index a0fb39abc5c86..20bbe1af05acd 100644
--- a/arch/x86/realmode/rm/Makefile
+++ b/arch/x86/realmode/rm/Makefile
@@ -65,5 +65,5 @@ $(obj)/realmode.relocs: $(obj)/realmode.elf FORCE
 
 KBUILD_CFLAGS	:= $(REALMODE_CFLAGS) -D_SETUP -D_WAKEUP \
 		   -I$(srctree)/arch/x86/boot
-KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
+KBUILD_AFLAGS	:= $(KBUILD_CFLAGS)
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables
diff --git a/arch/xtensa/kernel/Makefile b/arch/xtensa/kernel/Makefile
index d3ef0407401f6..ece4ae6dea97d 100644
--- a/arch/xtensa/kernel/Makefile
+++ b/arch/xtensa/kernel/Makefile
@@ -39,7 +39,7 @@ sed-y = -e ':a; s/\*(\([^)]*\)\.text\.unlikely/*(\1.literal.unlikely .{text}.unl
 	-e 's/\.{text}/.text/g'
 
 quiet_cmd__cpp_lds_S = LDS     $@
-cmd__cpp_lds_S = $(CPP) $(cpp_flags) -P -C -Uxtensa -D__ASSEMBLY__ \
+cmd__cpp_lds_S = $(CPP) $(cpp_flags) -P -C -Uxtensa \
 		 -DLINKER_SCRIPT $< | sed $(sed-y) >$@
 
 $(obj)/vmlinux.lds: $(src)/vmlinux.lds.S FORCE
diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index 7d15a85d579fa..054051c685dd2 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -62,7 +62,7 @@ KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_LTO), $(KBUILD_CFLAGS))
 # `-fdata-sections` flag from KBUILD_CFLAGS_KERNEL
 KBUILD_CFLAGS_KERNEL := $(filter-out -fdata-sections, $(KBUILD_CFLAGS_KERNEL))
 
-KBUILD_AFLAGS			:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
+KBUILD_AFLAGS			:= $(KBUILD_CFLAGS)
 
 lib-y				:= efi-stub-helper.o gop.o secureboot.o tpm.o \
 				   file.o mem.o random.o randomalloc.o pci.o \
diff --git a/drivers/net/wan/Makefile b/drivers/net/wan/Makefile
index 00e9b7ee1e012..4233143534465 100644
--- a/drivers/net/wan/Makefile
+++ b/drivers/net/wan/Makefile
@@ -57,7 +57,7 @@ $(obj)/wanxlfw.bin: $(obj)/wanxlfw.o FORCE
 	$(call if_changed,m68kld_bin_o)
 
 quiet_cmd_m68kas_o_S = M68KAS  $@
-      cmd_m68kas_o_S = $(M68KCC) -D__ASSEMBLY__ -Wp,-MD,$(depfile) -I$(srctree)/include/uapi -c -o $@ $<
+      cmd_m68kas_o_S = $(M68KCC) -Wp,-MD,$(depfile) -I$(srctree)/include/uapi -c -o $@ $<
 
 $(obj)/wanxlfw.o: $(src)/wanxlfw.S FORCE
 	$(call if_changed_dep,m68kas_o_S)
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 52c08c4eb0b9a..09f0142a93656 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -437,7 +437,7 @@ targets += $(lib-y) $(always-y)
 # ---------------------------------------------------------------------------
 quiet_cmd_cpp_lds_S = LDS     $@
       cmd_cpp_lds_S = $(CPP) $(cpp_flags) -P -U$(ARCH) \
-	                     -D__ASSEMBLY__ -DLINKER_SCRIPT -o $@ $<
+	                     -DLINKER_SCRIPT -o $@ $<
 
 $(obj)/%.lds: $(src)/%.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
diff --git a/scripts/gfp-translate b/scripts/gfp-translate
index 8385ae0d5af93..f6353795fdca3 100755
--- a/scripts/gfp-translate
+++ b/scripts/gfp-translate
@@ -73,7 +73,7 @@ echo Parsing: $GFPMASK
 #include <stdio.h>
 
 // Try to fool compiler.h into not including extra stuff
-#define __ASSEMBLY__	1
+#define __ASSEMBLER__	1
 
 #include <generated/autoconf.h>
 #include <linux/gfp_types.h>
diff --git a/tools/testing/selftests/kvm/lib/riscv/handlers.S b/tools/testing/selftests/kvm/lib/riscv/handlers.S
index b787b982e922a..c8cc2d695f483 100644
--- a/tools/testing/selftests/kvm/lib/riscv/handlers.S
+++ b/tools/testing/selftests/kvm/lib/riscv/handlers.S
@@ -3,10 +3,6 @@
  * Copyright (c) 2023 Intel Corporation
  */
 
-#ifndef __ASSEMBLY__
-#define __ASSEMBLY__
-#endif
-
 #include <asm/csr.h>
 
 .macro save_context
diff --git a/tools/testing/selftests/vDSO/vgetrandom-chacha.S b/tools/testing/selftests/vDSO/vgetrandom-chacha.S
index a4a82e1c28a90..cba930f1d0907 100644
--- a/tools/testing/selftests/vDSO/vgetrandom-chacha.S
+++ b/tools/testing/selftests/vDSO/vgetrandom-chacha.S
@@ -3,8 +3,6 @@
  * Copyright (C) 2024 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  */
 
-#define __ASSEMBLY__
-
 #if defined(__aarch64__)
 #include "../../../../arch/arm64/kernel/vdso/vgetrandom-chacha.S"
 #elif defined(__loongarch__)
-- 
2.51.1


