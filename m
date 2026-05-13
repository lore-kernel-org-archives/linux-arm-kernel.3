Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDFCCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 23:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64Gh3XXwwXs+LgEftAHmElSN2hvQJzq0J5o3E2PYSCw=; b=HwpP24Mb3aBbKqwDD6XA1qJoU0
	NcVa7u9f07/3k5G3idLBBaZkZie2w+HCNsfEtXZNONnqXQUn202BUBGQokUtOW7n6lr83kwYjNlwD
	DCwQAXWhzfkm+ZQfeFN9cQaJFReKuRtpzW9LzUul4JXK34kN6Yf07PjQDADblk+RKugEy7ALmZljI
	NBVCi7nJ8wzP76ko8Pn1Ml1z1e7KARyQUScjEsdk9Dl+m3hnRBCtgvxv1wpw0qJUpuRvhYYqXS7LF
	lOQuOQByVT7TKt6Bagzai284EpNBCqC1ADvUaTSEzkAmmBES5ODHfdUZXF2V7zuq1IVKcQYfyhUey
	1D803Hkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJ3q-000000042a7-10nV;
	Wed, 13 May 2026 23:32:18 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJ3i-000000042TH-3uWw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 23:32:14 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-1329791f18fso11005801c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778715130; x=1779319930; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=64Gh3XXwwXs+LgEftAHmElSN2hvQJzq0J5o3E2PYSCw=;
        b=GDk9tjzFW2MqG8X8L5dHASyIhiOSXdR9Ry5j/eh+BTeksKV+ZMvgYZ9v+Y2nsvD+NR
         rEDaexcx6GrNrB7vlGKBNg/MEx3nDGSlXgKHpYTRkpCwECuqXQeqBvprnwKxMbZwSbqs
         8e8HQcAU91UgUCvbbDVCfPJzo3fVd4VFgfkp4rHQnc0GjXSB6fkw39aTXBeFg2Ix20em
         /+9HMqBE9TVovuvm3onpOox2YQeTlmPAvQQoaoB0+DkXqMLFnKfwCiGAF8eFm0bI/WBT
         s28VPwALnkDRpp7p4QG6zLIB7pQAW1Iq3zAYGyxN0WaAjceNTNodXRd5hFOxGnB59iBr
         2jvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778715130; x=1779319930;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=64Gh3XXwwXs+LgEftAHmElSN2hvQJzq0J5o3E2PYSCw=;
        b=VBb311boMCdDNnuF8dlbeRQY4ZuZkXx/6j3MR2Xl/VAXxukqa/pvHm5eNxKk0dRUko
         YZKv2JvkCOpl2carZkDiUA1lBbZF0CUeVJAs47w81vNR4DpC9cmdI/kW6P0krFaJ7H1X
         ku/iKUa8XUM73qU9YhZrQjrVIWCikv8uaaikbbemDwStDpXVcwQ8gRLpOCGvFEQblXIr
         pNWEX/44EQtLEvwHk0I97wLOBlMw4EFo3AqVJyJzQnDJLGfIKuAUl/uUjzyF7FAgmxwM
         GyEeBdCan3dgemdPwxsf++JzfDjur1lG5Rz6tMYouNPmf2shrupcMRAk2oOTHDOw5Eyo
         aKHw==
X-Forwarded-Encrypted: i=1; AFNElJ8m8F7pHrBU5lLQP2TzYFb8R8zbBAvO3ta82tp/jgR2nCby+yFSy1Gf2v4lFeVQeRPMpuS2Ky1PpRTZ9G38DT48@lists.infradead.org
X-Gm-Message-State: AOJu0YzBqYJFp7wlUuNGq2FOk/It2wHsSohwlCLclJUchhXETg1HnGGb
	VQ2jW5V/E7kfzxRh5ygdMOIuqHeA/+hecXcxdeKHoHI8UWRsnhGaF40lbeQB8gZ6s1l5+0GDuNc
	r+0Q266NVSw==
X-Received: from dlbbo27.prod.google.com ([2002:a05:7022:439b:b0:12d:e33d:70da])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:252b:b0:133:1c42:f5d6
 with SMTP id a92af1059eb24-1349ae99352mr3027978c88.41.1778715129802; Wed, 13
 May 2026 16:32:09 -0700 (PDT)
Date: Wed, 13 May 2026 16:31:47 -0700
In-Reply-To: <20260513233151.572332-1-irogers@google.com>
Mime-Version: 1.0
References: <20260413024805.1316480-1-irogers@google.com> <20260513233151.572332-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260513233151.572332-4-irogers@google.com>
Subject: [PATCH v5 3/7] perf build: Be more programmatic when setting up
 libunwind variables
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, 
	james.clark@linaro.org, namhyung@kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Li Guan <guanli.oerv@isrc.iscas.ac.cn>
Cc: 9erthalion6@gmail.com, alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	howardchu95@gmail.com, john.g.garry@oracle.com, jolsa@kernel.org, 
	leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org, 
	shimin.guo@skydio.com, tglozar@redhat.com, tmricht@linux.ibm.com, 
	will@kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_163210_994862_DE17C9C0 
X-CRM114-Status: GOOD (  13.81  )
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
 tools/perf/Makefile.config | 226 ++++++++++++++++---------------------
 1 file changed, 100 insertions(+), 126 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 06d7a3f9990c..7a0e372824c6 100644
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
+      FEATURE_CHECK_LDFLAGS-libunwind-$(1) = -L$(LIBUNWIND_DIR)/lib -lunwind -lunwind-$(1)
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
@@ -739,6 +684,60 @@ ifndef GEN_VMLINUX_H
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
+    EXTLIBS_LIBUNWIND := $(LIBUNWIND_LIBS)
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
+
+  EXTLIBS += $(EXTLIBS_LIBUNWIND)
+
+  ifeq ($(findstring -static,${LDFLAGS}),-static)
+    # gcc -static links libgcc_eh which contains piece of libunwind
+    LIBUNWIND_LDFLAGS += -Wl,--allow-multiple-definition
+  endif
+
+  ifneq ($(have_libunwind), 1)
+    NO_LIBUNWIND := 1
+  endif
+endif
+
 dwarf-post-unwind := 1
 dwarf-post-unwind-text := BUG
 
@@ -761,31 +760,6 @@ ifeq ($(dwarf-post-unwind),1)
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
2.54.0.563.g4f69b47b94-goog


