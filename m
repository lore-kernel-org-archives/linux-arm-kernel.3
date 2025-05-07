Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB25AC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 13:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lC+ktlKoRWuVQ406Z311foD+S65DvOr4KvPAMwhmT4Q=; b=BkQpFNeQLOyFGAyp8MYK9/UtJL
	uTgW8J6EOtLIVNzPb5n+utfbkUbSTD6symmIK3CXzPErZlKUTcu66+yQU9HIGuxm/vIZMwjH04aXy
	B7Y7EbPRs7tr42fICh2E4vDqpj2YoEPSsvBl7GHKW5EXEyJ3U+nylZzIf5kQg6j5jodHmEM4I25e7
	IOG9Csl0yvU2NwrKD4H9hCOihiAVXvalCPCfWideXS10GQm6JeQpX/wQi14Gkm5IQUQBjsyz79AC/
	RvxJFmn1alKcoFUMl98eH1RGhFxMsZ2VQR3mTZJ0mESzEJfKMUF4Mo6J7BWMMLyct7pNJQNIEL7zN
	NX5RcX2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeq1-0000000FZo4-29uN;
	Wed, 07 May 2025 13:29:29 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeXa-0000000FWH6-1Gtt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 13:10:27 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cee550af2so7337885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 06:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746623425; x=1747228225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lC+ktlKoRWuVQ406Z311foD+S65DvOr4KvPAMwhmT4Q=;
        b=hqyiGNoFTAk0tE/MAHt5KkP/QvYZ1rdsmVP/r768EAnGwG9olJKdKd3G+17Ily1Hbw
         jctfU/ebAUItTxolJc7Iw5KeF/6/jVB8zGk8JN1s6fFxKP64PBt6R2vKJzNBbU7DhQED
         7b4UWvCNt4DxXrsgs6ZPZFrcBF+MkIF2Dy9Fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746623425; x=1747228225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lC+ktlKoRWuVQ406Z311foD+S65DvOr4KvPAMwhmT4Q=;
        b=stftjmJU8SHdT5h3V3O/dIxEMoPmkTDPt4eDlwGdcPAZ/lyQg9hwzV2kijke0T2WYN
         CyC/5rcC+HAuqQgHN9ETv2eBPqdQU3ixZpdqvKezEZ/tnUGsu1HGygRMOYxnEf9snrh+
         DAiWeRG4h2df0aDhN8BXlatduyM2RoqYGiXvynNJKkIj0oGh7UUStB5kndT9Cj6swGqO
         SYL9dA7vVEJC9N7sSwTEYgPyLRV/opMMui9BkK3A0zPo7TOGrVb2Pvcd5HY6kRGDZpzP
         Es8L4ZkFabufagk+v/9400Anptvz+zv7jJOJohyeWMJGG5ssIBJrvJwFRv1SZlJXqt3t
         TT2A==
X-Gm-Message-State: AOJu0YyWHVNfiOxChKCdvtTtC1qCQLGhA2xzHlLy1/71OrRXK+PHV5uV
	qIlPJ5SpRoHi/LT8uubT+Q81pGbhRLNrRLBQfs2qESyTOjV7gH+29wn25sOQnVNUEwAYzaPc75H
	MQg==
X-Gm-Gg: ASbGncsjCevOsMgrcnj57TzAVUST5Q9r3ycH/goPVE5T2GRjNDppQh02UXJsbNTm2Qw
	3Z7Vcg3WU+I9fwseiUQGyFUQQnKJAQP2B9ra1XLRHDlZCFdJoy1y0SzE2cXYW37x5Q3UJgN3S7P
	3tR+uXSQ7X22DiCzdz9piyf2YCOcKydAa5+3Af3BKFi4IJsxCqmdM7BqciJD50QBFSVQ3p0bgI6
	baCJHio9NVL4crb4nSkWDdJfJ2C1tpGrJPnH/xl/bdvBLvnsbTcKezCZcyC++KeXB6d6BM7eKC7
	oxu9zsx2t8+58stOuD+qWVhOoSSyh+4v+s8zAK/oqN4cF8g54ARH5Z/S
X-Google-Smtp-Source: AGHT+IHfIoz1B8ERUft6e6R9XHeFEZYHizVLysz1ooqXs2VtmpBSdGwrsOUK5GBUxOo0UEdbIamAwA==
X-Received: by 2002:a05:600c:cca:b0:439:a3df:66f3 with SMTP id 5b1f17b1804b1-441d44e57d6mr10555525e9.6.1746623424618;
        Wed, 07 May 2025 06:10:24 -0700 (PDT)
Received: from revest.zrh.corp.google.com ([2a00:79e0:9d:6:558d:e1fb:c2ec:7513])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32adcasm647435e9.6.2025.05.07.06.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:10:24 -0700 (PDT)
From: Florent Revest <revest@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	akpm@linux-foundation.org,
	broonie@kernel.org,
	thiago.bauermann@linaro.org,
	jackmanb@google.com,
	Florent Revest <revest@chromium.org>
Subject: [PATCH v2 2/4] mm: remove CONFIG_ARCH_USES_HIGH_VMA_FLAGS
Date: Wed,  7 May 2025 15:09:58 +0200
Message-ID: <20250507131000.1204175-3-revest@chromium.org>
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
In-Reply-To: <20250507131000.1204175-1-revest@chromium.org>
References: <20250507131000.1204175-1-revest@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_061026_353337_B025331B 
X-CRM114-Status: GOOD (  16.05  )
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

Over the years, include/linux/mm.h has grown to use high VMA flags bits
in various ways. Some usages, like mseal(), are guarded by CONFIG_64BIT
while others like CONFIG_ARM64_MTE select
CONFIG_ARCH_USES_HIGH_VMA_FLAGS and depend on the VM_HIGH_ARCH* macros that
are guarded by that config.

Since CONFIG_ARCH_USES_HIGH_VMA_FLAGS only guards bit mask definitions,
it is safe to use on any CONFIG_64BIT config. Additionally, since all
configs that currently select CONFIG_ARCH_USES_HIGH_VMA_FLAGS depend on
CONFIG_64BIT, there should be no regressions.

Signed-off-by: Florent Revest <revest@chromium.org>
---
 arch/arm64/Kconfig   | 3 ---
 arch/powerpc/Kconfig | 1 -
 arch/x86/Kconfig     | 2 --
 include/linux/mm.h   | 4 ++--
 mm/Kconfig           | 2 --
 5 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a182295e6f08b..2a0d45b16b7fd 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2149,7 +2149,6 @@ config ARM64_MTE
 	# Required for tag checking in the uaccess routines
 	select ARM64_PAN
 	select ARCH_HAS_SUBPAGE_FAULTS
-	select ARCH_USES_HIGH_VMA_FLAGS
 	select ARCH_USES_PG_ARCH_2
 	select ARCH_USES_PG_ARCH_3
 	help
@@ -2196,7 +2195,6 @@ menu "ARMv8.9 architectural features"
 config ARM64_POE
 	prompt "Permission Overlay Extension"
 	def_bool y
-	select ARCH_USES_HIGH_VMA_FLAGS
 	select ARCH_HAS_PKEYS
 	help
 	  The Permission Overlay Extension is used to implement Memory
@@ -2235,7 +2233,6 @@ config ARM64_GCS
 	bool "Enable support for Guarded Control Stack (GCS)"
 	default y
 	select ARCH_HAS_USER_SHADOW_STACK
-	select ARCH_USES_HIGH_VMA_FLAGS
 	depends on !UPROBES
 	help
 	  Guarded Control Stack (GCS) provides support for a separate
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6722625a406a0..e444191206b32 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1043,7 +1043,6 @@ config PPC_MEM_KEYS
 	def_bool y
 	depends on PPC_BOOK3S_64
 	depends on PPC_64S_HASH_MMU
-	select ARCH_USES_HIGH_VMA_FLAGS
 	select ARCH_HAS_PKEYS
 	help
 	  Memory Protection Keys provides a mechanism for enforcing
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 4b9f378e05f6b..e74ba77a066e6 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1818,7 +1818,6 @@ config X86_INTEL_MEMORY_PROTECTION_KEYS
 	def_bool y
 	# Note: only available in 64-bit mode
 	depends on X86_64 && (CPU_SUP_INTEL || CPU_SUP_AMD)
-	select ARCH_USES_HIGH_VMA_FLAGS
 	select ARCH_HAS_PKEYS
 	help
 	  Memory Protection Keys provides a mechanism for enforcing
@@ -1900,7 +1899,6 @@ config X86_USER_SHADOW_STACK
 	bool "X86 userspace shadow stack"
 	depends on AS_WRUSS
 	depends on X86_64
-	select ARCH_USES_HIGH_VMA_FLAGS
 	select ARCH_HAS_USER_SHADOW_STACK
 	select X86_CET
 	help
diff --git a/include/linux/mm.h b/include/linux/mm.h
index fdda6b16263b3..da8f99a026deb 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -297,7 +297,7 @@ extern unsigned int kobjsize(const void *objp);
 #define VM_NOHUGEPAGE	0x40000000	/* MADV_NOHUGEPAGE marked this vma */
 #define VM_MERGEABLE	0x80000000	/* KSM may merge identical pages */
 
-#ifdef CONFIG_ARCH_USES_HIGH_VMA_FLAGS
+#ifdef CONFIG_64BIT
 #define VM_HIGH_ARCH_BIT_0	32	/* bit only usable on 64-bit architectures */
 #define VM_HIGH_ARCH_BIT_1	33	/* bit only usable on 64-bit architectures */
 #define VM_HIGH_ARCH_BIT_2	34	/* bit only usable on 64-bit architectures */
@@ -312,7 +312,7 @@ extern unsigned int kobjsize(const void *objp);
 #define VM_HIGH_ARCH_4	BIT(VM_HIGH_ARCH_BIT_4)
 #define VM_HIGH_ARCH_5	BIT(VM_HIGH_ARCH_BIT_5)
 #define VM_HIGH_ARCH_6	BIT(VM_HIGH_ARCH_BIT_6)
-#endif /* CONFIG_ARCH_USES_HIGH_VMA_FLAGS */
+#endif /* CONFIG_64BIT */
 
 #ifdef CONFIG_ARCH_HAS_PKEYS
 # define VM_PKEY_SHIFT VM_HIGH_ARCH_BIT_0
diff --git a/mm/Kconfig b/mm/Kconfig
index e113f713b4938..1fff7f8bfa96f 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1127,8 +1127,6 @@ config DEVICE_PRIVATE
 config VMAP_PFN
 	bool
 
-config ARCH_USES_HIGH_VMA_FLAGS
-	bool
 config ARCH_HAS_PKEYS
 	bool
 
-- 
2.49.0.987.g0cc8ee98dc-goog


