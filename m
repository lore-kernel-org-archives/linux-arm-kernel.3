Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC46C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 13:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFFedIQoVt5THh/dDr0azukH/sRWNDMHFAQOWykjhMU=; b=TXdrXpyZ74ImRYo/nkj4vfV1IE
	IUfAkBfVdkxYQ+Ig3Ipi622LGE8Y1rDnEjVVuXXK3TTXOxGUG9MSaHtzKOXGB5ta812tbKPrCvSNG
	8Q3N0JFh26rvNx57y1/o92zq+GtNVQAGb3Kn5wR4bnGTtyDfYFKskRS6O5KeyIf3nje+jnPyzXUud
	5CkRDTHyZXpdaR98VQJ4PVjShr+OgQ0GH11fsZrDFlqlOpmb72XTn/JrfVhIgOkNtYcRxBqxeYXEY
	aLsW3GbJjZOwKm31l0fbLAw04r3SvRceqGv+IMV6ekwBNduwkN/Mtxci+F7c4fObfwCD0stsNCSJm
	1ugGSevg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCets-0000000FaIv-1ARx;
	Wed, 07 May 2025 13:33:28 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeXe-0000000FWJj-0JfH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 13:10:31 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43e9ccaa1ebso8650885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 06:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746623428; x=1747228228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFFedIQoVt5THh/dDr0azukH/sRWNDMHFAQOWykjhMU=;
        b=TYzGP9vK11nDbzRfzz408gjflo/4Qp5CteAowIy8ioK7406pVmgTwIkfW26mHZdfFk
         6ZnD4SzgHIrNHMJTroM/SsNbvPAueCy8x23JGANrwN+VSkljhlmJIN+Gy+EVf5rlpMd6
         Wx0VacRhF2arq+fAp1tdK2ckdMtTXVDewc3Ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746623428; x=1747228228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFFedIQoVt5THh/dDr0azukH/sRWNDMHFAQOWykjhMU=;
        b=ZSNpw+jyJCT0B8tDOxFQ9CijpU+rostBQZvbj6Ds6YtnUzpn59iFsErPdm0t0yOivO
         N3fGPOfV8C0zf+Y4PwW4AwTFBZnOdMrAaePFoHqE8Hz4nO3HF69+5nlh29IV+AVa00uY
         Quoy7ObnUg7jaj5kGXAqClpeDRtp6KPBBC+9J4uOCtBH/ksdU36mjYu+JLzfEfVYzBSc
         HpxfsuhXyKPOrP11f+JxTq7NJjh4D6GkCOjQInGFDzSywh6I8ZHXaiQvxgeKm1YhsVo+
         EO9dGB2BAWw+MhU0WvJ5OSqw51ZOoyOEsCCOhflWbrp3iv2wF7+yElxdj3d4torkeDCQ
         JV0w==
X-Gm-Message-State: AOJu0Yzub1Y1RNYvGRCCkqQVgNj4vCwdg+VBrhjOizD8IYvHam4LgNd+
	MioT5aVVrckHHXDNaznKYV0sO8rYaMGvIkRihOkldmk985beQnXd3TUZ42Xl3Lc/VD9eWRzrvfj
	wgA==
X-Gm-Gg: ASbGnctqhj+3GFJN60gzkluTc9EWHCnnsYVUhCHm9EBTBY+JtSTFphNZ4yY7weSq6Ds
	mXSUhrbVZWNp9e+m5F5pGM6OcuhDv5ErTWICrJiqAUQobA90D1WxcIbNPYyO14MdgPsaeh66REv
	2nzOIf5kewbE5E6padfNVLY6ojaaFLXA6Bwf9ij4D1vrKKa2xKWWxkzc8kbBGdBzKp/KI+SEXA5
	HtuRhhZK8PJroEvWxor2B9jaA+na9RZWdkpCTtQrlc3J7nQDGqID2ZIwWNIEr0RGdRJ8mYTuhOE
	8xNAjOd+ZY0nWw+ukOLtGKFwzHq4qIKXGentmQWr0lDKYcVtzUhunwxZ
X-Google-Smtp-Source: AGHT+IElR75OEHwMKC4gYQ5ikVeEAK7dbCSsz3voaw3tMaHSvQvvHy+t/om+lnqAq9lqYbAjHGVGzw==
X-Received: by 2002:a05:600c:1ca3:b0:439:94f8:fc7b with SMTP id 5b1f17b1804b1-441d448b936mr9664875e9.0.1746623428057;
        Wed, 07 May 2025 06:10:28 -0700 (PDT)
Received: from revest.zrh.corp.google.com ([2a00:79e0:9d:6:558d:e1fb:c2ec:7513])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32adcasm647435e9.6.2025.05.07.06.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:10:27 -0700 (PDT)
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
Subject: [PATCH v2 4/4] mm: consolidate VM_HIGH_ARCH_* macros into parametric macros
Date: Wed,  7 May 2025 15:10:00 +0200
Message-ID: <20250507131000.1204175-5-revest@chromium.org>
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
In-Reply-To: <20250507131000.1204175-1-revest@chromium.org>
References: <20250507131000.1204175-1-revest@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_061030_111195_0A9DF463 
X-CRM114-Status: GOOD (  12.86  )
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

This reduces code duplication and chances of mistakes.

Signed-off-by: Florent Revest <revest@chromium.org>
---
 include/linux/mm.h | 52 ++++++++++++++--------------------------------
 1 file changed, 16 insertions(+), 36 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index b12549f0a6dce..a53394d928585 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -298,42 +298,22 @@ extern unsigned int kobjsize(const void *objp);
 #define VM_MERGEABLE	0x80000000	/* KSM may merge identical pages */
 
 #ifdef CONFIG_64BIT
-#define VM_HIGH_ARCH_BIT_0	32	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_1	33	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_2	34	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_3	35	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_4	36	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_5	37	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_6	38	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_7	39	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_8	40	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_9	41	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_10	42	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_0	BIT(VM_HIGH_ARCH_BIT_0)
-#define VM_HIGH_ARCH_1	BIT(VM_HIGH_ARCH_BIT_1)
-#define VM_HIGH_ARCH_2	BIT(VM_HIGH_ARCH_BIT_2)
-#define VM_HIGH_ARCH_3	BIT(VM_HIGH_ARCH_BIT_3)
-#define VM_HIGH_ARCH_4	BIT(VM_HIGH_ARCH_BIT_4)
-#define VM_HIGH_ARCH_5	BIT(VM_HIGH_ARCH_BIT_5)
-#define VM_HIGH_ARCH_6	BIT(VM_HIGH_ARCH_BIT_6)
-#define VM_HIGH_ARCH_7	BIT(VM_HIGH_ARCH_BIT_7)
-#define VM_HIGH_ARCH_8	BIT(VM_HIGH_ARCH_BIT_8)
-#define VM_HIGH_ARCH_9	BIT(VM_HIGH_ARCH_BIT_9)
-#define VM_HIGH_ARCH_10	BIT(VM_HIGH_ARCH_BIT_10)
+#define VM_HIGH_ARCH_BIT(i)	(32+i)	/* bit only usable on 64-bit architectures */
+#define VM_HIGH_ARCH(i)		BIT(VM_HIGH_ARCH_BIT(i))
 #endif /* CONFIG_64BIT */
 
 #ifdef CONFIG_ARCH_HAS_PKEYS
-# define VM_PKEY_SHIFT VM_HIGH_ARCH_BIT_0
-# define VM_PKEY_BIT0  VM_HIGH_ARCH_0
-# define VM_PKEY_BIT1  VM_HIGH_ARCH_1
-# define VM_PKEY_BIT2  VM_HIGH_ARCH_2
+# define VM_PKEY_SHIFT VM_HIGH_ARCH_BIT(0)
+# define VM_PKEY_BIT0  VM_HIGH_ARCH(0)
+# define VM_PKEY_BIT1  VM_HIGH_ARCH(1)
+# define VM_PKEY_BIT2  VM_HIGH_ARCH(2)
 #if CONFIG_ARCH_PKEY_BITS > 3
-# define VM_PKEY_BIT3  VM_HIGH_ARCH_3
+# define VM_PKEY_BIT3  VM_HIGH_ARCH(3)
 #else
 # define VM_PKEY_BIT3  0
 #endif
 #if CONFIG_ARCH_PKEY_BITS > 4
-# define VM_PKEY_BIT4  VM_HIGH_ARCH_4
+# define VM_PKEY_BIT4  VM_HIGH_ARCH(4)
 #else
 # define VM_PKEY_BIT4  0
 #endif
@@ -349,7 +329,7 @@ extern unsigned int kobjsize(const void *objp);
  * (x86). See the comments near alloc_shstk() in arch/x86/kernel/shstk.c
  * for more details on the guard size.
  */
-# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+# define VM_SHADOW_STACK	VM_HIGH_ARCH(5)
 #endif
 
 #if defined(CONFIG_ARM64_GCS)
@@ -357,7 +337,7 @@ extern unsigned int kobjsize(const void *objp);
  * arm64's Guarded Control Stack implements similar functionality and
  * has similar constraints to shadow stacks.
  */
-# define VM_SHADOW_STACK	VM_HIGH_ARCH_6
+# define VM_SHADOW_STACK	VM_HIGH_ARCH(6)
 #endif
 
 #ifndef VM_SHADOW_STACK
@@ -381,8 +361,8 @@ extern unsigned int kobjsize(const void *objp);
 #endif
 
 #if defined(CONFIG_ARM64_MTE)
-# define VM_MTE		VM_HIGH_ARCH_4	/* Use Tagged memory for access control */
-# define VM_MTE_ALLOWED	VM_HIGH_ARCH_5	/* Tagged memory permitted */
+# define VM_MTE		VM_HIGH_ARCH(4)	/* Use Tagged memory for access control */
+# define VM_MTE_ALLOWED	VM_HIGH_ARCH(5)	/* Tagged memory permitted */
 #else
 # define VM_MTE		VM_NONE
 # define VM_MTE_ALLOWED	VM_NONE
@@ -393,7 +373,7 @@ extern unsigned int kobjsize(const void *objp);
 #endif
 
 #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
-# define VM_UFFD_MINOR		VM_HIGH_ARCH_9	/* UFFD minor faults */
+# define VM_UFFD_MINOR		VM_HIGH_ARCH(9)	/* UFFD minor faults */
 #else /* !CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
 # define VM_UFFD_MINOR		VM_NONE
 #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
@@ -406,13 +386,13 @@ extern unsigned int kobjsize(const void *objp);
  * if KVM does not lock down the memory type.
  */
 #ifdef CONFIG_64BIT
-#define VM_ALLOW_ANY_UNCACHED		VM_HIGH_ARCH_7
+#define VM_ALLOW_ANY_UNCACHED		VM_HIGH_ARCH(7)
 #else
 #define VM_ALLOW_ANY_UNCACHED		VM_NONE
 #endif
 
 #ifdef CONFIG_64BIT
-#define VM_DROPPABLE		VM_HIGH_ARCH_8
+#define VM_DROPPABLE		VM_HIGH_ARCH(8)
 #elif defined(CONFIG_PPC32)
 #define VM_DROPPABLE		VM_ARCH_1
 #else
@@ -421,7 +401,7 @@ extern unsigned int kobjsize(const void *objp);
 
 #ifdef CONFIG_64BIT
 /* VM is sealed, in vm_flags */
-#define VM_SEALED	VM_HIGH_ARCH_10
+#define VM_SEALED	VM_HIGH_ARCH(10)
 #endif
 
 /* Bits set in the VMA until the stack is in its final location */
-- 
2.49.0.987.g0cc8ee98dc-goog


