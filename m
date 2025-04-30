Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4543C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 16:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V1qsu6fkrd6uduOladyyR4ZyoWD5vL8Q+jaWgw+feE0=; b=444pmpHIoqB+5gHixylX2zl/Ow
	k1xtm2IFWhXfrOFH2UY0n41J+bGfyzQOlixV9+hzn5Nm3DnhZ0fk+r/JlTrPUNM2nS/1ARDgsbEzo
	IiSluQqHPHyNnPgVMLj7wXwpr+RslyN62/+EKkM40AUBv+Jnb8d5aLpZ7qg/z2fP3FhRCYrvhuwno
	7jJK4qu+hbKnUT7VyYY0QAi8EyuK7qAVXkjufyP1IP9GEb1wDMIywde78EvH3o9qInC+ec2R7JLZh
	A0gmtptZmisGpAxv0IRo3peakV/Gbsr9pMW8tWiXKTzFdgQPG/knh5nvHBptHJa/YW7G54v/HTMJL
	r2ha7qRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAATc-0000000DShD-0awY;
	Wed, 30 Apr 2025 16:40:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAHa-0000000DR88-3PVe
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 16:27:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=V1qsu6fkrd6uduOladyyR4ZyoWD5vL8Q+jaWgw+feE0=; b=GCEfu9iGMNcun6Aj+nSgc0lh5F
	nk0kFeZlTWdqYsAQNrZ55p0LJ7/2WE/P23IJPYc/i19EmSpnPVj7TZ/JqRGRH1v5HXheFJ3Zzs8FE
	CcbU8tGiDGyT/8tQCajupAnJLI1BmeJD/mUHlwzATC3Tk1VViclANWv1ezXIiFOCFrNCv2zVRETgu
	stnkULlcp+cCpD0DhSubTDBTjGBMmCEtXTZUW9LR19/LbwXz6LiPm2nrTYUJqaTnGuX0ZPhvxCVZB
	XJhm1GVQEORO+hah+meHhYsJfzQ3qC4gyYqN5n8rlnR7S3lSDD94z/VzCtZRwRy9NnUrh5DpkkavI
	H4Gw8pPA==;
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uAAHX-0000000DoE4-06UP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 16:27:37 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-39ac9b0cb6aso3197227f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 09:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746030450; x=1746635250; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V1qsu6fkrd6uduOladyyR4ZyoWD5vL8Q+jaWgw+feE0=;
        b=I+vTaXBi8EZ2L6PrYMB+/Rwb+SEO4Pc9Jpd7AuNtesBwZCxsHn75U3zXF5f7lpZvhx
         l7YOC40S67odLfe7Tm3X0xyRw8/UtUB8P9TrjGFgR6Pxov8PQZ+VB3f+zHkbCdqOGLyn
         ESEOk4+VI/wksBNJfyj3NWJTLrBVfFDSNxcNaCgEtVDgdpmuzYigeUaKEncGPPqzB686
         iEENBQm5ZKogDVgO3qkBTBx+fM6IrF3rXsvqenKAKQPgqzraj1hDGJHWdfqDogrrnuPS
         QU3sRLYIF/8JJxwa/CqZpDJUQWa6oq7pbiLMd9U2kYk37LSq/z1Z6tynw8B8b3CutISc
         5gUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746030450; x=1746635250;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V1qsu6fkrd6uduOladyyR4ZyoWD5vL8Q+jaWgw+feE0=;
        b=NZRdvXOhxwHVu/WDwxQ8inFuneEhA21p2rm3mwVcTc4lApXeKHtpTivJI8nFri2kfx
         EhMFrE6/13m1fHw7LzqAJLxfgm2j5QBpD6X2HzTnTmzqvm2o7rBOumMp63L8Hqzk7EJ7
         IjbLM6J0O0CffE1+hUm5SDkb4xEx6RTJV5JzQb6WqJKOogNn7zPcB0tQcWulikxSsDWW
         yablS83SCYYSOOEngHVLuRAwm2uiw848dyPIcntqDjds6+U2eKktHNe5pNDrtM1TMBLE
         mVpOKjfKZwNGf3B7jm8p4aIL7gse34RpcQ26w0uNaoUgB4Ftz0QyzeCW8z9Dnkcbv5Ga
         ZGDw==
X-Forwarded-Encrypted: i=1; AJvYcCWsPZZwnL4Djl4uOMNAsXFF4VNCiUqQ2nLj/wEilgCQb3rtGW+Acjp7i/N8iPQiv6WRGwJH8IXhGEJGY3exaRfx@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd4syH+fQo2QH0pVdDJxGOvg/qfHtLKmpQb+CJ4QrFa4wN0ubE
	X1s5NsLBOr25wHkku9K3/AC3m2ujgy0GIfiIdC6K1efmUMmNSHVnNpVFaXv2zBOqqKaAye4vSA5
	FubDmIqkqgQ==
X-Google-Smtp-Source: AGHT+IG4BlUgz6HW2Kxnd0khlJFiLyO62h9ryy5TwZM3R2e0jq/UJyUCK2ECwVgEFsDnoXM94u24uHZ/XOF4Lw==
X-Received: from wrbbh10.prod.google.com ([2002:a05:6000:5ca:b0:391:434a:b7c9])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:fbc4:0:b0:3a0:7fd4:2848 with SMTP id ffacd0b85a97d-3a08f7a4abamr2805108f8f.52.1746030450479;
 Wed, 30 Apr 2025 09:27:30 -0700 (PDT)
Date: Wed, 30 Apr 2025 16:27:10 +0000
In-Reply-To: <20250430162713.1997569-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250430162713.1997569-1-smostafa@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250430162713.1997569-4-smostafa@google.com>
Subject: [PATCH v2 3/4] KVM: arm64: Introduce CONFIG_UBSAN_KVM_EL2
From: Mostafa Saleh <smostafa@google.com>
To: kvmarm@lists.linux.dev, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	broonie@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, kees@kernel.org, elver@google.com, andreyknvl@gmail.com, 
	ryabinin.a.a@gmail.com, akpm@linux-foundation.org, yuzenghui@huawei.com, 
	suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org, 
	nathan@kernel.org, nicolas.schier@linux.dev, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_172735_283282_984D59CD 
X-CRM114-Status: GOOD (  15.72  )
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

Add a new Kconfig CONFIG_UBSAN_KVM_EL2 for KVM which enables
UBSAN for EL2 code (in protected/nvhe/hvhe) modes.
This will re-use the same checks enabled for the kernel for
the hypervisor. The only difference is that for EL2 it always
emits a "brk" instead of implementing hooks as the hypervisor
can't print reports.

The KVM code will re-use the same code for the kernel
"report_ubsan_failure()" so #ifdefs are changed to also have this
code for CONFIG_UBSAN_KVM_EL2

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/Makefile | 6 ++++++
 include/linux/ubsan.h            | 2 +-
 lib/Kconfig.ubsan                | 9 +++++++++
 lib/ubsan.c                      | 6 ++++--
 scripts/Makefile.ubsan           | 5 ++++-
 5 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index b43426a493df..a76522d63c3e 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -99,3 +99,9 @@ KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS), $(KBUILD_CFLAG
 # causes a build failure. Remove profile optimization flags.
 KBUILD_CFLAGS := $(filter-out -fprofile-sample-use=% -fprofile-use=%, $(KBUILD_CFLAGS))
 KBUILD_CFLAGS += -fno-asynchronous-unwind-tables -fno-unwind-tables
+
+ifeq ($(CONFIG_UBSAN_KVM_EL2),y)
+UBSAN_SANITIZE := y
+# Always use brk and not hooks
+ccflags-y += $(CFLAGS_UBSAN_TRAP)
+endif
diff --git a/include/linux/ubsan.h b/include/linux/ubsan.h
index c843816f5f68..3ab8d38aedb8 100644
--- a/include/linux/ubsan.h
+++ b/include/linux/ubsan.h
@@ -2,7 +2,7 @@
 #ifndef _LINUX_UBSAN_H
 #define _LINUX_UBSAN_H
 
-#ifdef CONFIG_UBSAN_TRAP
+#if defined(CONFIG_UBSAN_TRAP) || defined(CONFIG_UBSAN_KVM_EL2)
 const char *report_ubsan_failure(u32 check_type);
 #else
 static inline const char *report_ubsan_failure(u32 check_type)
diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index f6ea0c5b5da3..42ed41804644 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -165,4 +165,13 @@ config TEST_UBSAN
 	  This is a test module for UBSAN.
 	  It triggers various undefined behavior, and detect it.
 
+config UBSAN_KVM_EL2
+	bool "UBSAN for KVM code at EL2"
+	depends on ARM64
+	help
+	  Enable UBSAN when running on ARM64 with KVM in a split mode
+	  (nvhe/hvhe/protected) for the hypervisor code running in EL2.
+	  In this mode, any UBSAN violation in EL2 would panic the kernel
+	  and information similar to UBSAN_TRAP would be printed.
+
 endif	# if UBSAN
diff --git a/lib/ubsan.c b/lib/ubsan.c
index 17993727fc96..a6ca235dd714 100644
--- a/lib/ubsan.c
+++ b/lib/ubsan.c
@@ -19,7 +19,7 @@
 
 #include "ubsan.h"
 
-#ifdef CONFIG_UBSAN_TRAP
+#if defined(CONFIG_UBSAN_TRAP) || defined(CONFIG_UBSAN_KVM_EL2)
 /*
  * Only include matches for UBSAN checks that are actually compiled in.
  * The mappings of struct SanitizerKind (the -fsanitize=xxx args) to
@@ -97,7 +97,9 @@ const char *report_ubsan_failure(u32 check_type)
 	}
 }
 
-#else
+#endif
+
+#ifndef CONFIG_UBSAN_TRAP
 static const char * const type_check_kinds[] = {
 	"load of",
 	"store to",
diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
index 9e35198edbf0..73c7a9be0796 100644
--- a/scripts/Makefile.ubsan
+++ b/scripts/Makefile.ubsan
@@ -1,5 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
+# Shared with KVM/arm64.
+export CFLAGS_UBSAN_TRAP := $(call cc-option,-fsanitize-trap=undefined,-fsanitize-undefined-trap-on-error)
+
 # Enable available and selected UBSAN features.
 ubsan-cflags-$(CONFIG_UBSAN_ALIGNMENT)		+= -fsanitize=alignment
 ubsan-cflags-$(CONFIG_UBSAN_BOUNDS_STRICT)	+= -fsanitize=bounds-strict
@@ -10,7 +13,7 @@ ubsan-cflags-$(CONFIG_UBSAN_DIV_ZERO)		+= -fsanitize=integer-divide-by-zero
 ubsan-cflags-$(CONFIG_UBSAN_UNREACHABLE)	+= -fsanitize=unreachable
 ubsan-cflags-$(CONFIG_UBSAN_BOOL)		+= -fsanitize=bool
 ubsan-cflags-$(CONFIG_UBSAN_ENUM)		+= -fsanitize=enum
-ubsan-cflags-$(CONFIG_UBSAN_TRAP)		+= $(call cc-option,-fsanitize-trap=undefined,-fsanitize-undefined-trap-on-error)
+ubsan-cflags-$(CONFIG_UBSAN_TRAP)		+= $(CFLAGS_UBSAN_TRAP)
 
 export CFLAGS_UBSAN := $(ubsan-cflags-y)
 
-- 
2.49.0.967.g6a0df3ecc3-goog


