Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DDAC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 11:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NGd39kNyH5imgbx4iJNuF/o2b5vxFS/Ovh2fwMTeXE=; b=bUAjqBkTOeO+GtQzg9tLygGZBr
	BTx926rNvcTL8ALC7PqZDPGvMdTcNBkVUPu98kx6SvuqQCFAW5aHe7n+0Q9A1qALm/7p+lGc8zag3
	uRy0Ahji+ODRiYLGqWvWJPXx+wAO7o/VOBONjCTKIp42cCTv82dtKJewkAL2MLJEKdvztQLvMv2So
	L3jpGLWaBY3jzmLGwqa7RkwT/jw7P7Gaaati1HcN28de5cheMCfmqKHgb5+YzHE0/NVGZEb0JaUux
	bzOF74ccsZruxfM34v518Eod+21EIt0ggWqZQsk1UPoigXhRKqZr1buRo2vcRdt1M40tI45AKcRKk
	1UYcAo8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGSH-0000000BjZq-1H8B;
	Tue, 06 May 2025 11:27:21 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEyz-0000000BSwD-31pk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:53:02 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-39127effa72so367359f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 02:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746525180; x=1747129980; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NGd39kNyH5imgbx4iJNuF/o2b5vxFS/Ovh2fwMTeXE=;
        b=NgW00nPV46JGsLed9kccjHxilmLN8YfnbEje9ONqOQH7yozxmBI5n7fl/R3aB7qRIS
         g2DYx7zjU2BKUadBzJw1fc7QxZBO+JR8Pf8SwsAfrTbHl9d5CZmeZeSMGw5y8qze4dOL
         LTHDneH6yl0p5FuiKPTziUvf2cjRwMY3Hy9OI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746525180; x=1747129980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4NGd39kNyH5imgbx4iJNuF/o2b5vxFS/Ovh2fwMTeXE=;
        b=wcaLQHy8AKMRQfobR3N6Fwr9xgEbFvn0gZdxIZ7DoH7Ls3vS2mbyyJcvGnw4cA1vtZ
         1kJcd0xmppHqZbOoZLPfYe3wrVdGwuV6sDWHOUxYoPpJIeL5LM37/QjCB+CpSwAjerhF
         Xw9TAcNSEuyog1Mmr+iDmz/paahf2+yLVTpdrHCycaABYz4sJbC0Xd8WUxWSfOik5i6l
         nkiJZWiNz6lDCxMszf1q4SaAWHHB7NREe55uoAycKj8B3i725WvheBE79buNb9gZCYPu
         1YvnbGTu1UkFAExBcZL4kNmeh+1XtzAvaYdxUqrAEzqFmohX3R5inbFvudp40AAcZV7P
         ZosQ==
X-Gm-Message-State: AOJu0Yy/YmbotfbSWGqWcD0GL6Yn2FArVIcuhbKVkKjPv87OenfNA2A2
	tOfA+4TI/bvLrl3XVQhn9kBYpRwdxPX8MgHp7qfm9s6Yw64wLA9EqeP1OALsc35ovR61uBHqcP4
	=
X-Gm-Gg: ASbGnctnyd0f6nz5UPLv6aZFPZ0r96oUbkET3ptGHHf3cKa4oiAVM7vUtKfdSBxM/of
	6b0zbQ3yOwgCesaD4NsKpO0p9rBm2LBBJ+FBFd4CpAcXLZDFv+AIzJajTB+cNnOELIAIqTzkgsa
	MTmmoAYmeofpYbVInoGLeg/FWBB6/KRTCHMI2lIawN2xzQSXbDWGVWfum3bHz3DfP7z+cODzRck
	JcK3RWqTYpRURuH/8gHeOPi4HHgF2Nbj/kjgKeyyVDo9juqwzvimtuFfurdT3tcWqFEU0HualfF
	w9otw+T2vAgeeq+5aKPJdYXanYfs1bkzr8wP0Mk3sNlbl8QE4LILz+Ur
X-Google-Smtp-Source: AGHT+IFvoJ9VWnqzz0zwnnsYUFSbSXpLp8LA0nWbcwEm8mbzOzc2XLDUuiuHDk1KqlBG5f0OAuY0kw==
X-Received: by 2002:a5d:64ef:0:b0:3a0:86f3:451f with SMTP id ffacd0b85a97d-3a099af1f69mr4374591f8f.12.1746525179837;
        Tue, 06 May 2025 02:52:59 -0700 (PDT)
Received: from revest.zrh.corp.google.com ([2a00:79e0:9d:6:7196:3093:b0e3:1016])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7a46sm12879860f8f.44.2025.05.06.02.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:52:59 -0700 (PDT)
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
Subject: [PATCH 2/4] mm: remove CONFIG_ARCH_USES_HIGH_VMA_FLAGS
Date: Tue,  6 May 2025 11:52:22 +0200
Message-ID: <20250506095224.176085-3-revest@chromium.org>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
In-Reply-To: <20250506095224.176085-1-revest@chromium.org>
References: <20250506095224.176085-1-revest@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_025301_756958_52C38831 
X-CRM114-Status: GOOD (  15.70  )
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
2.49.0.967.g6a0df3ecc3-goog


