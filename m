Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98680C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 13:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRtiFa3E3rYiWsT4spswVI90f+55TGqnRsyWDvt/R9s=; b=shynzfcHY/6ECFhWC0Whp309m1
	O3N/Be78bmA2zGro8S5i932UelQhToMbJl4GHVQwRCIwPSIl+ED93qancrPp4/sQ1HFBoj0UGfyki
	98L1qZ1TGHVnIyI2l3VZNKsRveXr0lALNS9vFF+gjc9gz/Qu8VzwQ7SLquP/UPAXSl8160Du9lXOu
	WIZpZVSm9DHN/xAdqfAj/jhfjbfRcKC4xwYlIGmlstiHWtIN1sZZ1JcSlMlF82hUPlH4dFozFqNEW
	TCaY45wBADmBQRrsvhzR3IxyGYr52U3bS6wiO2priX41VAuP/fAlnvn34bbjQe6R/5i3aeK0K1EY4
	Vyh5loqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCerx-0000000Fa4Z-1wDo;
	Wed, 07 May 2025 13:31:29 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeXc-0000000FWIQ-1Mey
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 13:10:29 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cee550af2so7337975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 06:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746623426; x=1747228226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRtiFa3E3rYiWsT4spswVI90f+55TGqnRsyWDvt/R9s=;
        b=USajcbC+KWYfuRqWLHneSV2DRqS0K+FxGuYMLJ0ZXf7Gtnzz4ANscMuU+r45YZI3iD
         Oi7dZYFABa0kmZUBL4D7yNy6BNiRq1nDCfGlBJtr/lYWDi5JpnloR0yyyl4aP0VVO/K5
         qK+KaAvP/u+5RWwc5QOVMidlsXF0BeB2sLISY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746623426; x=1747228226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kRtiFa3E3rYiWsT4spswVI90f+55TGqnRsyWDvt/R9s=;
        b=Rnl5T4n+v4ZfJ/yFafP1QDD45pEQ3FX9+RJMzM+sZXrETuDqNG9csTKqYtm5cvtHJO
         eodPUgb/n37sXJUY/5kpzTxNf8bFIVodOaEnS9e7uBSG8DaNwZlnG4NBFpDPO6gmPLdT
         +fUqq9z38rwBohdQ4ukXe2/RwHhJlM1vU4tIbWGl3Jm7076qIuP9kK9MjH9cztysvJQ4
         rVI3x39mF/9l5t2v2pNaWXrhU15XMkg1UiJIg6vsIQ5idoZbUtm9dEMApwKCJ/dyQI8M
         NDN1zb/I8eiVUYLhOlIuf6jcsUVUxto+BW2c10EPQ3YAZeYpQisf+LQxf+cQx6BEoJnd
         rOew==
X-Gm-Message-State: AOJu0Yxmc1SnuazIGPyI8W+sHCfBKCabS+sPJ1UQp91g3u3rsBQ19/N3
	Vy7KPYY6j+woFjJ//hKmhcwlVyUBBHKpsLumHuM0H3ZvE5BHqBYqBgmCqbCnpj3bT5q2923rVus
	nMg==
X-Gm-Gg: ASbGnctUIeQbVl2QUWEOCGyDiKC2/Q9asMIjgo5De2rBxJujZ31bJLL204qpuA+D1bC
	+Vvw9XIx6eIwrxYqpWzAPFwwaxkRuQZ7trmtFYX1Tu8yrmKO5r9Z4hDWPkxxHIzvJ7b1jDYzGRz
	UZqKDgYWF3Ikue/57mfirFdJQ+dm8M/hLlIk/b3ofu4rilst6OEm6GOIaXZYd9gvdl/l8BM/4cE
	Qad0VUtrsvhF0WEwFyf+b/tgoafWEzhGiRQox08k9ATrlB97/ym2UWK7z1EYnsrPRLDhMYKVR16
	Qqhv6S+jhYnXOCp00GI7K1mILjX8UmLmm8rdD1PjlF+z14mcJEce4vpbRxRv9kDilTM=
X-Google-Smtp-Source: AGHT+IEkfIUkSWwoMahO6sAWL+HQVuKxqSNR1F791+ucIG23d1nTuEaaK/HEHbufmrKGP/mYe+538A==
X-Received: by 2002:a05:600c:cca:b0:439:a3df:66f3 with SMTP id 5b1f17b1804b1-441d44e57d6mr10556235e9.6.1746623426384;
        Wed, 07 May 2025 06:10:26 -0700 (PDT)
Received: from revest.zrh.corp.google.com ([2a00:79e0:9d:6:558d:e1fb:c2ec:7513])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32adcasm647435e9.6.2025.05.07.06.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:10:26 -0700 (PDT)
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
Subject: [PATCH v2 3/4] mm: use VM_HIGH_ARCH_* macros consistently
Date: Wed,  7 May 2025 15:09:59 +0200
Message-ID: <20250507131000.1204175-4-revest@chromium.org>
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
In-Reply-To: <20250507131000.1204175-1-revest@chromium.org>
References: <20250507131000.1204175-1-revest@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_061028_361841_72591B88 
X-CRM114-Status: GOOD (  13.34  )
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

Currently, some high vma flag bits are defined using VM_HIGH_ARCH_*
helper macros but others are not. Use the macros consistently so it's
easier to spot which ones are used/free.

To keep the VMA flags space easier to read and think about, VM_SEALED is
also shifted down from a very high bit (63rd) to a lower one (42nd).

Signed-off-by: Florent Revest <revest@chromium.org>
---
 include/linux/mm.h | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index da8f99a026deb..b12549f0a6dce 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -305,6 +305,10 @@ extern unsigned int kobjsize(const void *objp);
 #define VM_HIGH_ARCH_BIT_4	36	/* bit only usable on 64-bit architectures */
 #define VM_HIGH_ARCH_BIT_5	37	/* bit only usable on 64-bit architectures */
 #define VM_HIGH_ARCH_BIT_6	38	/* bit only usable on 64-bit architectures */
+#define VM_HIGH_ARCH_BIT_7	39	/* bit only usable on 64-bit architectures */
+#define VM_HIGH_ARCH_BIT_8	40	/* bit only usable on 64-bit architectures */
+#define VM_HIGH_ARCH_BIT_9	41	/* bit only usable on 64-bit architectures */
+#define VM_HIGH_ARCH_BIT_10	42	/* bit only usable on 64-bit architectures */
 #define VM_HIGH_ARCH_0	BIT(VM_HIGH_ARCH_BIT_0)
 #define VM_HIGH_ARCH_1	BIT(VM_HIGH_ARCH_BIT_1)
 #define VM_HIGH_ARCH_2	BIT(VM_HIGH_ARCH_BIT_2)
@@ -312,6 +316,10 @@ extern unsigned int kobjsize(const void *objp);
 #define VM_HIGH_ARCH_4	BIT(VM_HIGH_ARCH_BIT_4)
 #define VM_HIGH_ARCH_5	BIT(VM_HIGH_ARCH_BIT_5)
 #define VM_HIGH_ARCH_6	BIT(VM_HIGH_ARCH_BIT_6)
+#define VM_HIGH_ARCH_7	BIT(VM_HIGH_ARCH_BIT_7)
+#define VM_HIGH_ARCH_8	BIT(VM_HIGH_ARCH_BIT_8)
+#define VM_HIGH_ARCH_9	BIT(VM_HIGH_ARCH_BIT_9)
+#define VM_HIGH_ARCH_10	BIT(VM_HIGH_ARCH_BIT_10)
 #endif /* CONFIG_64BIT */
 
 #ifdef CONFIG_ARCH_HAS_PKEYS
@@ -385,8 +393,7 @@ extern unsigned int kobjsize(const void *objp);
 #endif
 
 #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
-# define VM_UFFD_MINOR_BIT	41
-# define VM_UFFD_MINOR		BIT(VM_UFFD_MINOR_BIT)	/* UFFD minor faults */
+# define VM_UFFD_MINOR		VM_HIGH_ARCH_9	/* UFFD minor faults */
 #else /* !CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
 # define VM_UFFD_MINOR		VM_NONE
 #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
@@ -399,15 +406,13 @@ extern unsigned int kobjsize(const void *objp);
  * if KVM does not lock down the memory type.
  */
 #ifdef CONFIG_64BIT
-#define VM_ALLOW_ANY_UNCACHED_BIT	39
-#define VM_ALLOW_ANY_UNCACHED		BIT(VM_ALLOW_ANY_UNCACHED_BIT)
+#define VM_ALLOW_ANY_UNCACHED		VM_HIGH_ARCH_7
 #else
 #define VM_ALLOW_ANY_UNCACHED		VM_NONE
 #endif
 
 #ifdef CONFIG_64BIT
-#define VM_DROPPABLE_BIT	40
-#define VM_DROPPABLE		BIT(VM_DROPPABLE_BIT)
+#define VM_DROPPABLE		VM_HIGH_ARCH_8
 #elif defined(CONFIG_PPC32)
 #define VM_DROPPABLE		VM_ARCH_1
 #else
@@ -416,7 +421,7 @@ extern unsigned int kobjsize(const void *objp);
 
 #ifdef CONFIG_64BIT
 /* VM is sealed, in vm_flags */
-#define VM_SEALED	_BITUL(63)
+#define VM_SEALED	VM_HIGH_ARCH_10
 #endif
 
 /* Bits set in the VMA until the stack is in its final location */
-- 
2.49.0.987.g0cc8ee98dc-goog


