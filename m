Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E621E73159
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 11:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YK1bIPZnnWv7pQYIyhk35+mOVNMBab8mq9bTqqdASAg=; b=SomGv6diGKLIovozZaRPV+KSYG
	/xi5UTkaNKcQ7bX9ZwvXVrzetNTp5lm3HxzfeCMWPSWTWkzgx4QcilPo9j1u6AJqMsCHL+30UiUgV
	J2mZpRnHWQTkMbHa5bpRN+Q/YMV8/zFj0mAflTaqG2TvLrG5sQY3e2wh0GYrmD7JOaAr6Ut9/CGPg
	eH4hmntDGrF5dLu4gdxtG6hmxrbEC+n6q9aldn/0spcbKeo7nsTqkJZr1Op/3Bs1MHhnVVtwLtHSL
	bw74VQKZpCPBab8lg/NLB7fCRY2B2L2JNcnBw47El5JnUIcWMcgWcRHcUSY8J288mcNNAyh9Tmr69
	yU0kTQTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrlU-00000004sGg-27yR;
	Mon, 02 Feb 2026 11:06:44 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrlR-00000004sFZ-42HD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 11:06:43 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.19])
	by linux.microsoft.com (Postfix) with ESMTPSA id 2C45720B7167;
	Mon,  2 Feb 2026 03:06:34 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2C45720B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1770030400;
	bh=YK1bIPZnnWv7pQYIyhk35+mOVNMBab8mq9bTqqdASAg=;
	h=From:To:Cc:Subject:Date:From;
	b=rDLRrBIC+PuwHWuZRDUn1bNSeLTo7bn6JCiV/ZM1HvjeiM6WLaX53h53yDp6MvcWb
	 vXyWWf4Moz8HSk4Ogpv1PSyNJ3j1GZOIWriHLA7pVpZWmpfotYkVhOAxbknZEK/kTL
	 mGi7sIcvYoGJMxF5ZqiIHh8Lf0Hp3cZYreq6HUEU=
From: Naman Jain <namjain@linux.microsoft.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	thomas.weissschuh@linutronix.de,
	Tamir Duberstein <tamird@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Naman Jain <namjain@linux.microsoft.com>,
	Kees Cook <kees@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Saurabh Singh Sengar <ssengar@linux.microsoft.com>
Subject: [RFC PATCH] kbuild: Make --build-id linker flag configurable
Date: Mon,  2 Feb 2026 11:06:31 +0000
Message-ID: <20260202110631.978412-1-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_030642_075677_5E783943 
X-CRM114-Status: GOOD (  16.08  )
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

Build ID hashes include file paths, so building the same source from
different directories produces different binaries. This breaks
reproducible builds.

Add KBUILD_BUILD_ID variable (default: sha1) to allow overriding:

    make KBUILD_BUILD_ID=none

The variable is exported to VDSO Makefiles which also include a
fallback default for standalone invocation.

Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
---
Hi,
Sending this change for RFC, as it is quite possible that this is a
generic problem and I may be missing something.

I am trying to implement reproducible builds for one of my product
kernel. I referred https://reproducible-builds.org/docs/build-path/
and tried to use both -fdebug-prefix-map=OLD=NEW and
-fmacro-prefix-map=OLD=NEW, but still could not achieve bit by bit
binary reproducibility without overwriting build-id to none. 
If I move the kernel to same path in other setup, I was able to create
same binary hash, however, without it, there is some difference in
build-id hash values.

Reproducibility wiki says "In most cases however, post-processing is
required to either remove the build path or to normalize it to a
predefined value.". I have tried that, and it works, but wanted to
conclude if that is my last option here.

Thanks.

---
 Makefile                          | 8 ++++++--
 arch/arm64/kernel/vdso/Makefile   | 5 ++++-
 arch/arm64/kernel/vdso32/Makefile | 5 ++++-
 arch/x86/entry/vdso/Makefile      | 5 ++++-
 4 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 3373308d2217c..3fcff4af200d7 100644
--- a/Makefile
+++ b/Makefile
@@ -1132,8 +1132,12 @@ KBUILD_AFLAGS   += $(KAFLAGS)
 KBUILD_CFLAGS   += $(KCFLAGS)
 KBUILD_RUSTFLAGS += $(KRUSTFLAGS)
 
-KBUILD_LDFLAGS_MODULE += --build-id=sha1
-LDFLAGS_vmlinux += --build-id=sha1
+# Can be overridden for reproducible builds by using "make KBUILD_BUILD_ID=none"
+KBUILD_BUILD_ID ?= sha1
+export KBUILD_BUILD_ID
+
+KBUILD_LDFLAGS_MODULE += --build-id=$(KBUILD_BUILD_ID)
+LDFLAGS_vmlinux += --build-id=$(KBUILD_BUILD_ID)
 
 KBUILD_LDFLAGS	+= -z noexecstack
 ifeq ($(CONFIG_LD_IS_BFD),y)
diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index 7dec05dd33b70..b3ee5982b4676 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -9,6 +9,9 @@
 # Include the generic Makefile to check the built vdso.
 include $(srctree)/lib/vdso/Makefile.include
 
+# Fallback for standalone builds, normally inherited from top-level Makefile
+KBUILD_BUILD_ID ?= sha1
+
 obj-vdso := vgettimeofday.o note.o sigreturn.o vgetrandom.o vgetrandom-chacha.o
 
 # Build rules
@@ -22,7 +25,7 @@ btildflags-$(CONFIG_ARM64_BTI_KERNEL) += -z force-bti
 # routines, as x86 does (see 6f121e548f83 ("x86, vdso: Reimplement vdso.so
 # preparation in build-time C")).
 ldflags-y := -shared -soname=linux-vdso.so.1 \
-	     -Bsymbolic --build-id=sha1 -n $(btildflags-y)
+	     -Bsymbolic --build-id=$(KBUILD_BUILD_ID) -n $(btildflags-y)
 
 ifdef CONFIG_LD_ORPHAN_WARN
   ldflags-y += --orphan-handling=$(CONFIG_LD_ORPHAN_WARN_LEVEL)
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 9d0efed91414c..991aed67e65a2 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -5,6 +5,9 @@
 
 include $(srctree)/lib/vdso/Makefile.include
 
+# Fallback for standalone builds, normally inherited from top-level Makefile
+KBUILD_BUILD_ID ?= sha1
+
 # Same as cc-*option, but using CC_COMPAT instead of CC
 ifeq ($(CONFIG_CC_IS_CLANG), y)
 CC_COMPAT ?= $(CC)
@@ -87,7 +90,7 @@ VDSO_AFLAGS += -D__ASSEMBLY__
 # From arm vDSO Makefile
 VDSO_LDFLAGS += -Bsymbolic --no-undefined -soname=linux-vdso.so.1
 VDSO_LDFLAGS += -z max-page-size=4096 -z common-page-size=4096
-VDSO_LDFLAGS += -shared --build-id=sha1
+VDSO_LDFLAGS += -shared --build-id=$(KBUILD_BUILD_ID)
 VDSO_LDFLAGS += --orphan-handling=$(CONFIG_LD_ORPHAN_WARN_LEVEL)
 
 
diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
index f247f5f5cb44d..fefddc91b41ea 100644
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@ -6,6 +6,9 @@
 # Include the generic Makefile to check the built vDSO:
 include $(srctree)/lib/vdso/Makefile.include
 
+# Fallback for standalone builds, normally inherited from top-level Makefile
+KBUILD_BUILD_ID ?= sha1
+
 # Files to link into the vDSO:
 vobjs-y := vdso-note.o vclock_gettime.o vgetcpu.o vgetrandom.o vgetrandom-chacha.o
 vobjs32-y := vdso32/note.o vdso32/system_call.o vdso32/sigreturn.o
@@ -155,7 +158,7 @@ quiet_cmd_vdso = VDSO    $@
 		       $(VDSO_LDFLAGS) $(VDSO_LDFLAGS_$(filter %.lds,$(^F))) \
 		       -T $(filter %.lds,$^) $(filter %.o,$^)
 
-VDSO_LDFLAGS = -shared --hash-style=both --build-id=sha1 --no-undefined \
+VDSO_LDFLAGS = -shared --hash-style=both --build-id=$(KBUILD_BUILD_ID) --no-undefined \
 	$(call ld-option, --eh-frame-hdr) -Bsymbolic -z noexecstack
 
 quiet_cmd_vdso_and_check = VDSO    $@

base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
-- 
2.43.0


