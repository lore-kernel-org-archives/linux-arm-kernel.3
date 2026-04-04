Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0163AE88D85
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 05:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjM/Qu3OIgvMlw6Ybfuzi2HOP0QWKIrv6KqEfslPyd8=; b=CsXwbQDhgJWGaQvREP2dEli8hJ
	rG8/XKoGUTAHSPwgX44tM2Lb8KNk3jUbBpEcxcB+KlhEH2jvvQoL7mxDfBDMxVJkK8tDKYvgqnEiw
	PMtWPXThH+JDAG558S0EibXjBi+Ruq/evlvrzWTg65/crQWD0LL9nSNMgCkqGnSKAAEtgLP5YqoLu
	a2HPBPsfgxKDmPlCv9V3Q0dzGnHMUXRVK3wS3MKu7Pg241EKz+g4Xa2/Fg/+LPcY4dmlRP4oHHMuB
	0Sy0+zp5/xqxChFvv/hntLdU7b8liGizlvHGr7/zZkR10vhKKQWcgEx83UVAg347d89P3WwNTaIso
	ntjtnlKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8tkg-00000003AGy-3OtQ;
	Sat, 04 Apr 2026 05:40:58 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8tkd-00000003ADA-3H9C
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 05:40:57 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2c16233ee11so3577062eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 22:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775281254; x=1775886054; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NjM/Qu3OIgvMlw6Ybfuzi2HOP0QWKIrv6KqEfslPyd8=;
        b=hbBRNj7DG0MS9qqVE5Tv0ER1qJ7Uuj4EFp0y/UXXdgLVZLWqJxU6N54iXiHXyXxBi1
         JobZO6ma6LU0CJ9pVi+KaXhmC6FMAud4QSyOCH1w8ogslk7NxjuoPnci7F/LKyE6Jk1V
         hVxxERv9rW1LqPfIr7ZV+pzmQEhyfDRPhrkO+5h3QzAKBSV3OtWIW0XlaYYLKVwQdOd6
         mZFGP4ii8TxlHclbFQQ85MBEzb8nMGB5af2PibqU6iVrkTe/gK9ldWcVCnCGSIL/ZOcJ
         TCSgJfUKGyrwyWWcrsDhHf58kXIUGEtvm8EX6XoHs8QLsl/1KIdQ07+khyiimwqpkZB0
         hijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775281254; x=1775886054;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NjM/Qu3OIgvMlw6Ybfuzi2HOP0QWKIrv6KqEfslPyd8=;
        b=Z9pV/HfL1poVH8f9S8CbXaM5KAa2tvSKyaK5ogJXm3Mcjofyv1QritSCmm64d4KbJ5
         zWH41MkToY4lSRjz7bGtq7kAPkJq0T9vyPyyklnGhYwcSMDTrrYHCHZzJr2yYasi3m91
         xMxW2q817FoGQqCPfJdRDEPtZ5i05EMZD8Rqrun3rDdlKwWMaSzY4eTaeZcMkcJcObUU
         M5FfP3PkJptpZF94fYNkF/b/2FOtwXN0mjqjpTJ2cE7nIpSgjU4+9HnKQMhanXShmXKO
         Fq8eUzP/N6/hDpDDpePVPiXWmTNXdnFWLCANGSzwQaXigOmd+U14odRBJdDK5q5k/1h4
         c63A==
X-Forwarded-Encrypted: i=1; AJvYcCUINtI95yrnV9irrSTloGxReHeGqxD7bk5E6MXvh4qXTfOBpMtpYFQqdorw5YxP5lXH6BSIXT3j9FjUsQFfW5eE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3i+bNoocDfs2ozkUONzmQYwY2BmCPxaHEbK+vwmZz2PRoKrCj
	z3iHWbwZJ+dtJMMnHTvy16hE9Jm4mJ7qnnpZlTe5Tznsz8n30DsD9t4XnJD/1i0cqIiDzv7TzLj
	I+zZmoxabPg==
X-Received: from dyu4.prod.google.com ([2002:a05:693c:8104:b0:2cb:5486:3ae3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:fd15:b0:2c6:7f49:a86d
 with SMTP id 5a478bee46e88-2cbfaaab106mr2503737eec.15.1775281254305; Fri, 03
 Apr 2026 22:40:54 -0700 (PDT)
Date: Fri,  3 Apr 2026 22:40:28 -0700
In-Reply-To: <20260404054032.1538095-1-irogers@google.com>
Mime-Version: 1.0
References: <20260305221927.3237145-1-irogers@google.com> <20260404054032.1538095-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260404054032.1538095-5-irogers@google.com>
Subject: [PATCH v3 4/8] perf build: Be more programmatic when setting up
 libunwind variables
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org
Cc: irogers@google.com, 9erthalion6@gmail.com, adrian.hunter@intel.com, 
	alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	blakejones@google.com, ctshao@google.com, dapeng1.mi@linux.intel.com, 
	howardchu95@gmail.com, james.clark@linaro.org, john.g.garry@oracle.com, 
	jolsa@kernel.org, leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com, 
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com, 
	tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org, yuzhuo@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_224056_078298_29BCE559 
X-CRM114-Status: GOOD (  13.36  )
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

Iterate LIBUNWIND_ARCHS when setting up CONFIG_ and HAVE_ definitions
rather than treating each architecture individually. This sets up the
libunwind build variables and C definitions beyond x86 and
arm/aarch64. The existing naming convention is followed for
compatibility.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 215 +++++++++++++++----------------------
 1 file changed, 89 insertions(+), 126 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 333ddd0e4bd8..9d31d0f6f52a 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -65,95 +65,83 @@ $(call detected_var,SRCARCH)
 
 CFLAGS += -I$(OUTPUT)arch/$(SRCARCH)/include/generated
 
-# Additional ARCH settings for ppc
-ifeq ($(SRCARCH),powerpc)
-  ifndef NO_LIBUNWIND
-    LIBUNWIND_LIBS := -lunwind -lunwind-ppc64
-  endif
-endif
-
 # Additional ARCH settings for x86
 ifeq ($(SRCARCH),x86)
   $(call detected,CONFIG_X86)
   ifeq (${IS_64_BIT}, 1)
     CFLAGS += -DHAVE_ARCH_X86_64_SUPPORT
     ARCH_INCLUDE = ../../arch/x86/lib/memcpy_64.S ../../arch/x86/lib/memset_64.S
-    ifndef NO_LIBUNWIND
-      LIBUNWIND_LIBS = -lunwind-x86_64 -lunwind -llzma
-    endif
     $(call detected,CONFIG_X86_64)
-  else
-    ifndef NO_LIBUNWIND
-      LIBUNWIND_LIBS = -lunwind-x86 -llzma -lunwind
-    endif
   endif
 endif
 
-ifeq ($(SRCARCH),arm)
-  ifndef NO_LIBUNWIND
-    LIBUNWIND_LIBS = -lunwind -lunwind-arm
-  endif
+ifeq ($(ARCH),s390)
+  CFLAGS += -fPIC
 endif
 
-ifeq ($(SRCARCH),arm64)
-  ifndef NO_LIBUNWIND
-    LIBUNWIND_LIBS = -lunwind -lunwind-aarch64
-  endif
+ifneq ($(LIBUNWIND),1)
+  NO_LIBUNWIND := 1
 endif
 
-ifeq ($(SRCARCH),loongarch)
-  ifndef NO_LIBUNWIND
+ifndef NO_LIBUNWIND
+  ifeq ($(SRCARCH),arm)
+    LIBUNWIND_LIBS = -lunwind -lunwind-arm
+  endif
+  ifeq ($(SRCARCH),arm64)
+    LIBUNWIND_LIBS = -lunwind -lunwind-aarch64
+  endif
+  ifeq ($(SRCARCH),loongarch)
     LIBUNWIND_LIBS = -lunwind -lunwind-loongarch64
   endif
-endif
-
-ifeq ($(ARCH),s390)
-  CFLAGS += -fPIC
-endif
-
-ifeq ($(ARCH),mips)
-  ifndef NO_LIBUNWIND
+  ifeq ($(ARCH),mips)
     LIBUNWIND_LIBS = -lunwind -lunwind-mips
   endif
+  ifeq ($(SRCARCH),powerpc)
+    LIBUNWIND_LIBS := -lunwind -lunwind-ppc64
+  endif
+  ifeq ($(SRCARCH),riscv)
+    LIBUNWIND_LIBS := -lunwind -lunwind-riscv
+  endif
+  ifeq ($(SRCARCH),s390)
+    LIBUNWIND_LIBS := -lunwind -lunwind-s390x
+  endif
+  ifeq ($(SRCARCH),x86)
+    ifeq (${IS_64_BIT}, 1)
+      LIBUNWIND_LIBS = -lunwind-x86_64 -lunwind -llzma
+    else
+      LIBUNWIND_LIBS = -lunwind-x86 -lunwind -llzma
+    endif
+  endif
+  ifeq ($(LIBUNWIND_LIBS),)
+    NO_LIBUNWIND := 1
+  endif
 endif
 
-ifneq ($(LIBUNWIND),1)
-  NO_LIBUNWIND := 1
-endif
-
-ifeq ($(LIBUNWIND_LIBS),)
-  NO_LIBUNWIND := 1
-endif
 #
 # For linking with debug library, run like:
 #
 #   make DEBUG=1 LIBUNWIND_DIR=/opt/libunwind/
 #
-
-libunwind_arch_set_flags = $(eval $(libunwind_arch_set_flags_code))
-define libunwind_arch_set_flags_code
-  FEATURE_CHECK_CFLAGS-libunwind-$(1)  = -I$(LIBUNWIND_DIR)/include
-  FEATURE_CHECK_LDFLAGS-libunwind-$(1) = -L$(LIBUNWIND_DIR)/lib
-endef
-
-ifdef LIBUNWIND_DIR
-  LIBUNWIND_CFLAGS  = -I$(LIBUNWIND_DIR)/include
-  LIBUNWIND_LDFLAGS = -L$(LIBUNWIND_DIR)/lib
-  LIBUNWIND_ARCHS = x86 x86_64 arm aarch64 debug-frame-arm debug-frame-aarch64 loongarch
-  $(foreach libunwind_arch,$(LIBUNWIND_ARCHS),$(call libunwind_arch_set_flags,$(libunwind_arch)))
-endif
+LIBUNWIND_ARCHS:=aarch64 arm loongarch64 mips ppc32 ppc64 riscv s390x x86 x86_64
 
 ifndef NO_LIBUNWIND
-  # Set per-feature check compilation flags
   FEATURE_CHECK_CFLAGS-libunwind = $(LIBUNWIND_CFLAGS)
   FEATURE_CHECK_LDFLAGS-libunwind = $(LIBUNWIND_LDFLAGS) $(LIBUNWIND_LIBS)
   FEATURE_CHECK_CFLAGS-libunwind-debug-frame = $(LIBUNWIND_CFLAGS)
   FEATURE_CHECK_LDFLAGS-libunwind-debug-frame = $(LIBUNWIND_LDFLAGS) $(LIBUNWIND_LIBS)
-  
-  FEATURE_CHECK_LDFLAGS-libunwind-arm += -lunwind -lunwind-arm
-  FEATURE_CHECK_LDFLAGS-libunwind-aarch64 += -lunwind -lunwind-aarch64
-  FEATURE_CHECK_LDFLAGS-libunwind-x86 += -lunwind -llzma -lunwind-x86
-  FEATURE_CHECK_LDFLAGS-libunwind-x86_64 += -lunwind -llzma -lunwind-x86_64
+
+  ifdef LIBUNWIND_DIR
+    LIBUNWIND_CFLAGS  = -I$(LIBUNWIND_DIR)/include
+    LIBUNWIND_LDFLAGS = -L$(LIBUNWIND_DIR)/lib
+
+    define libunwind_arch_set_flags
+      FEATURE_CHECK_CFLAGS-libunwind-$(1)  = -I$(LIBUNWIND_DIR)/include
+      FEATURE_CHECK_LDFLAGS-libunwind-$(1) = -L$(LIBUNWIND_DIR)/lib
+    endef
+    $(foreach arch,$(LIBUNWIND_ARCHS), \
+      $(eval $(call libunwind_arch_set_flags,$(arch))) \
+    )
+  endif
 endif
 
 ifdef CSINCLUDES
@@ -638,49 +626,6 @@ ifeq ($(SRCARCH),powerpc)
   endif
 endif
 
-ifndef NO_LIBUNWIND
-  have_libunwind :=
-
-  $(call feature_check,libunwind)
-
-  $(call feature_check,libunwind-x86)
-  ifeq ($(feature-libunwind-x86), 1)
-    $(call detected,CONFIG_LIBUNWIND_X86)
-    CFLAGS += -DHAVE_LIBUNWIND_X86_SUPPORT
-    LDFLAGS += -lunwind-x86
-    EXTLIBS_LIBUNWIND += -lunwind-x86
-    have_libunwind = 1
-  endif
-
-  $(call feature_check,libunwind-aarch64)
-  ifeq ($(feature-libunwind-aarch64), 1)
-    $(call detected,CONFIG_LIBUNWIND_AARCH64)
-    CFLAGS += -DHAVE_LIBUNWIND_AARCH64_SUPPORT
-    LDFLAGS += -lunwind-aarch64
-    EXTLIBS_LIBUNWIND += -lunwind-aarch64
-    have_libunwind = 1
-    $(call feature_check,libunwind-debug-frame-aarch64)
-    ifneq ($(feature-libunwind-debug-frame-aarch64), 1)
-      $(warning No debug_frame support found in libunwind-aarch64)
-      CFLAGS += -DNO_LIBUNWIND_DEBUG_FRAME_AARCH64
-    endif
-  endif
-
-  ifneq ($(feature-libunwind), 1)
-    $(warning No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR and set LIBUNWIND=1 in the make command line as it is opt-in now)
-    NO_LOCAL_LIBUNWIND := 1
-  else
-    have_libunwind := 1
-    $(call detected,CONFIG_LOCAL_LIBUNWIND)
-  endif
-
-  ifneq ($(have_libunwind), 1)
-    NO_LIBUNWIND := 1
-  endif
-else
-  NO_LOCAL_LIBUNWIND := 1
-endif
-
 ifndef NO_LIBBPF
   ifneq ($(feature-bpf), 1)
     $(warning BPF API too old. Please install recent kernel headers. BPF support in 'perf record' is disabled.)
@@ -739,6 +684,49 @@ ifndef GEN_VMLINUX_H
   VMLINUX_H=$(src-perf)/util/bpf_skel/vmlinux/vmlinux.h
 endif
 
+ifndef NO_LIBUNWIND
+  have_libunwind :=
+
+  $(call feature_check,libunwind)
+  ifneq ($(feature-libunwind), 1)
+    $(warning No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR and set LIBUNWIND=1 in the make command line as it is opt-in now)
+    NO_LOCAL_LIBUNWIND := 1
+  else
+    have_libunwind := 1
+    $(call detected,CONFIG_LOCAL_LIBUNWIND)
+    CFLAGS  += -DHAVE_LIBUNWIND_SUPPORT
+    CFLAGS  += $(LIBUNWIND_CFLAGS)
+    LDFLAGS += $(LIBUNWIND_LDFLAGS)
+    EXTLIBS += $(EXTLIBS_LIBUNWIND)
+    $(call feature_check,libunwind-debug-frame)
+    ifneq ($(feature-libunwind-debug-frame), 1)
+      CFLAGS += -DNO_LIBUNWIND_DEBUG_FRAME
+    endif
+  endif
+
+  define PROCESS_REMOTE_LIBUNWIND_ARCH
+    $(call feature_check,libunwind-$(1))
+
+    ifeq ($$(feature-libunwind-$(1)), 1)
+      upper_arch := $$(shell echo $(1) | tr '[:lower:]' '[:upper:]')
+      $$(call detected,CONFIG_LIBUNWIND_$$(upper_arch))
+
+      CFLAGS += -DHAVE_LIBUNWIND_$$(upper_arch)_SUPPORT
+      LDFLAGS += -lunwind-$(1)
+      EXTLIBS_LIBUNWIND += -lunwind-$(1)
+      have_libunwind := 1
+
+      $$(call feature_check,libunwind-debug-frame-$(1))
+      ifneq ($$(feature-libunwind-debug-frame-$(1)), 1)
+        CFLAGS += -DNO_LIBUNWIND_DEBUG_FRAME_$$(upper_arch)
+      endif
+    endif
+  endef
+  $(foreach arch,$(LIBUNWIND_ARCHS), \
+    $(eval $(call PROCESS_REMOTE_LIBUNWIND_ARCH,$(arch))) \
+  )
+endif
+
 dwarf-post-unwind := 1
 dwarf-post-unwind-text := BUG
 
@@ -761,31 +749,6 @@ ifeq ($(dwarf-post-unwind),1)
   $(call detected,CONFIG_DWARF_UNWIND)
 endif
 
-ifndef NO_LIBUNWIND
-  ifndef NO_LOCAL_LIBUNWIND
-    ifeq ($(SRCARCH),$(filter $(SRCARCH),arm arm64))
-      $(call feature_check,libunwind-debug-frame)
-      ifneq ($(feature-libunwind-debug-frame), 1)
-        $(warning No debug_frame support found in libunwind)
-        CFLAGS += -DNO_LIBUNWIND_DEBUG_FRAME
-      endif
-    else
-      # non-ARM has no dwarf_find_debug_frame() function:
-      CFLAGS += -DNO_LIBUNWIND_DEBUG_FRAME
-    endif
-    EXTLIBS += $(LIBUNWIND_LIBS)
-    LDFLAGS += $(LIBUNWIND_LIBS)
-  endif
-  ifeq ($(findstring -static,${LDFLAGS}),-static)
-    # gcc -static links libgcc_eh which contans piece of libunwind
-    LIBUNWIND_LDFLAGS += -Wl,--allow-multiple-definition
-  endif
-  CFLAGS  += -DHAVE_LIBUNWIND_SUPPORT
-  CFLAGS  += $(LIBUNWIND_CFLAGS)
-  LDFLAGS += $(LIBUNWIND_LDFLAGS)
-  EXTLIBS += $(EXTLIBS_LIBUNWIND)
-endif
-
 ifneq ($(NO_LIBTRACEEVENT),1)
   $(call detected,CONFIG_TRACE)
 endif
-- 
2.53.0.1213.gd9a14994de-goog


