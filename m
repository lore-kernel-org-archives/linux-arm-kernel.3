Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82365CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 18:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4bTLrYcdGviHL8Gi8iTccxKPkHb0A01pNfuP/UlxY48=; b=gDvRdpLzgpFgWI04Da2NuArJXL
	g6GuYNMv3KIncK0qx2hyvH8PAb5HRhJJn+p68mRKugQlYaju+wMLgqAyTdMomARVC5wYOdqef6ifX
	BHq+brga+l4YtUO9lx2NkET9un48NJ6Io6wvGjOpgiSyZE4ZZ7+7/PL6ZuC4z1Qkm9MMBLve3AGOM
	OL4HFL6yGwcae1QjLR+IN/pbroBU93VlPS6BFwD4Vi5Zy4/ekZctKr2SqKPaDqqXPxjBcsIeeDI/0
	5PGPKFQrOdZWf6SVDQ1C2GKyfkMkAhZSNkZN7H4MLkGqXeFF/jioD6gT6xDnzK/jB9qqtCUQxr5bv
	TrFHZ/Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFzfZ-0000000AVdJ-11Yo;
	Mon, 03 Nov 2025 18:52:45 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFzfX-0000000AVcw-02vR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 18:52:44 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3414de5b27eso641215a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 10:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762195962; x=1762800762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4bTLrYcdGviHL8Gi8iTccxKPkHb0A01pNfuP/UlxY48=;
        b=ZNi7Q3cR4yMzdIekeaev7WUOaElqqq4ADrDEVutMj68zo2rXH20zD2luXQuGO62PhB
         av3sdT2jhP0X+aA1mcyLqs6O4ykni8k5IOYs8bdEt2u3M4o9gHA/s3GJzQ1BF28wsewB
         W9B6oWie039EE2atZtY2yk72peOYyGrJAiDJuNbJJRYVEBmQ4nUlzBpvk6e3DT6S3pTE
         JIM0GahtftahktSdDXWyarP33IW19pkcllb3yB634ZQzxsPjr/4bbhaauitxxBeFSLr5
         VeCZ9kECG7wjJ6pO7h14tcYfpvLb6z0gFVMMcXNHtqpXQ4f3NeBUpP0ojsi9QWU+dS68
         g+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762195962; x=1762800762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4bTLrYcdGviHL8Gi8iTccxKPkHb0A01pNfuP/UlxY48=;
        b=XHBH7XXH/yMM+rIXrld0RqF2+N1s84/qzEjcz/3nEVDzPHdd7r4KvRuhuX+Pp+jtZ9
         apH8psj0gDEp4Y+HpYWLrBGyTWfKeyRK6tYN/Lh8e7tygsaVUCpfyOhPHXXp4Kjlgctu
         Cj92tdhapbOfo9tW4uE8JSLr5L+g9fyeighJ2akY4dqPQbBhl7GwWoCXQTnRXdPUQgwH
         x5vKqazGSa0o7zXPQBQlKH1ct8TByp0CUGXfZgBHwRFyEvGACYMepFgpS67Gbf5x32sz
         lC3Y8vbYRZWta7Mt/o+vHVyjzkJ0/RhYc9mgIZ/P4tYTZa6BiBslBfzT84j2y4IBAgSN
         it5g==
X-Forwarded-Encrypted: i=1; AJvYcCWeaz+7p/7VO6Wk9ZXjGN3T91HKmSG2njFM9M+KCSui1mklDkzRN13JSuV7NuDgNmYOM7aYWmvflwu91lO5Xzeq@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3IbltDE+KSKxBq/RGZqrsLRAtZOUroph+Azu27pAH4QLpfII4
	qJ5DAwdIKryn1MTKHQ28QXLecjgpoydw24wgS2SVzSIxUDCvT3oHYnhE
X-Gm-Gg: ASbGncsT917WbUcIxcQMuDqDhwc+RgvorkMPBXGnim7E4wj/7ixAU3zMGxkmLSAndJ/
	zkN60JCTcml7xgS80XUfzufHqMWF+MEzkHdMeJ4oHmeEdBY5theTZKPY0jpSztX/CrVISOFevf7
	BA8+5ro7+lxPodlceyPMBWZfV93gzosjF+FJkfVxBpVs6v1i2J0sy9xiqqSML5n9Ey8SfVq3KKy
	Baz9hIkHsEmIepEaVFKCNMjjbJXKvt4r3YWiGbWL3Uq9LFtKhLFJ9DZbFFEkad0bcPVKF7B757g
	s079xhRoxLIWJzQKzLqYig1Ye+eRLNGyWKcNbThihcEW6QV2vsAFlW1Zt42Y6asNu93YiHF8UrL
	q6aLfpkSUt4469s0tI9LPO8fqy0oCCyq+BrsuaEWqKblj+EMH96Zh3J/ogvS54ztSpT1jwLnZ91
	HXEQmt23LwIxZa4RwnGqMS+VBxs791
X-Google-Smtp-Source: AGHT+IEoJGgdDYDkKXdr+CYpLYlhkWn/9DscVQmfV05umliaGx7nf5rDXxZHqyJxi65KxiLM+AdQJw==
X-Received: by 2002:a17:90a:c2cc:b0:33b:d74b:179 with SMTP id 98e67ed59e1d1-3408308ccebmr15462822a91.27.1762195961473;
        Mon, 03 Nov 2025 10:52:41 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:4::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93bf44e233sm11232213a12.34.2025.11.03.10.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 10:52:41 -0800 (PST)
From: Ben Niu <niuben003@gmail.com>
X-Google-Original-From: Ben Niu <benniu@meta.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	tytso@mit.edu,
	Jason@zx2c4.com,
	Ben Niu <benniu@meta.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] tracing: Enable kprobe for selected Arm64 assembly
Date: Mon,  3 Nov 2025 10:52:35 -0800
Message-ID: <20251103185237.2284456-1-benniu@meta.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_105243_079705_EF44092E 
X-CRM114-Status: GOOD (  15.89  )
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

When ftrace is enabled, a function can only be kprobe'd if
  (1) the function has proper nops inserted at the beginning
  (2) the first inserted nop's address is added in section
      __patchable_function_entries.

See function within_notrace_func in kernel/trace/trace_kprobe.c
for more details.

This patch adds a new asm function macro SYM_FUNC_START_TRACE
that makes an asm funtion satisfy the above two conditions so that
it can be kprobe'd. In addition, the macro is applied to
__arch_copy_to_user and __arch_copy_from_user, which were found
to be hot in certain workloads.

Note: although this patch unblocks kprobe tracing, fentry is still
broken because no BTF info gets generated from assembly files. A
separate patch is needed to fix that.

This patch was built with different combos of the following
features and kprobe tracing for asm functions __arch_copy_to_user
and __arch_copy_from_user worked in all cases:

CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
CONFIG_DYNAMIC_FTRACE_WITH_ARGS
CONFIG_ARM64_BTI_KERNEL

Signed-off-by: Ben Niu <benniu@meta.com>
---
v2: only opt-in __arch_copy_from_user and __arch_copy_to_user for
    tracing since tracing asm functions in general may be unsafe

v1: aQOpd14RXnyQLOWR@meta.com
---
 arch/arm64/include/asm/linkage.h | 91 ++++++++++++++++++++++++--------
 arch/arm64/lib/copy_from_user.S  |  2 +-
 arch/arm64/lib/copy_to_user.S    |  2 +-
 3 files changed, 70 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/include/asm/linkage.h b/arch/arm64/include/asm/linkage.h
index d3acd9c87509..b9a7513dc7d9 100644
--- a/arch/arm64/include/asm/linkage.h
+++ b/arch/arm64/include/asm/linkage.h
@@ -5,8 +5,47 @@
 #include <asm/assembler.h>
 #endif
 
-#define __ALIGN		.balign CONFIG_FUNCTION_ALIGNMENT
-#define __ALIGN_STR	".balign " #CONFIG_FUNCTION_ALIGNMENT
+#define __ALIGN .balign CONFIG_FUNCTION_ALIGNMENT
+#define __ALIGN_STR ".balign " #CONFIG_FUNCTION_ALIGNMENT
+
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
+
+#define PRE_FUNCTION_NOPS                                                   \
+	ALIGN;                                                              \
+	nops CONFIG_FUNCTION_ALIGNMENT / 4 - 2;                             \
+	.pushsection __patchable_function_entries, "awo", @progbits, .text; \
+	.p2align 3;                                                         \
+	.8byte 1f;                                                          \
+	.popsection;                                                        \
+	1 :;                                                                \
+	nops 2;
+
+#define PRE_PROLOGUE_NOPS nops 2;
+
+#elif defined(CONFIG_DYNAMIC_FTRACE_WITH_ARGS)
+
+#define PRE_FUNCTION_NOPS
+
+#define PRE_PROLOGUE_NOPS                                                   \
+	.pushsection __patchable_function_entries, "awo", @progbits, .text; \
+	.p2align 3;                                                         \
+	.8byte 1f;                                                          \
+	.popsection;                                                        \
+	1 :;                                                                \
+	nops 2;
+
+#else
+
+#define PRE_FUNCTION_NOPS
+#define PRE_PROLOGUE_NOPS
+
+#endif
+
+#ifdef CONFIG_ARM64_BTI_KERNEL
+#define BTI_C bti c;
+#else
+#define BTI_C
+#endif
 
 /*
  * When using in-kernel BTI we need to ensure that PCS-conformant
@@ -15,32 +54,38 @@
  * everything, the override is done unconditionally so we're more
  * likely to notice any drift from the overridden definitions.
  */
-#define SYM_FUNC_START(name)				\
-	SYM_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
-	bti c ;
+#define SYM_FUNC_START_TRACE(name)                 \
+	PRE_FUNCTION_NOPS                          \
+	SYM_START(name, SYM_L_GLOBAL, SYM_A_ALIGN) \
+	BTI_C                                      \
+	PRE_PROLOGUE_NOPS
+
+#define SYM_FUNC_START(name)                       \
+	SYM_START(name, SYM_L_GLOBAL, SYM_A_ALIGN) \
+	BTI_C
 
-#define SYM_FUNC_START_NOALIGN(name)			\
-	SYM_START(name, SYM_L_GLOBAL, SYM_A_NONE)	\
-	bti c ;
+#define SYM_FUNC_START_NOALIGN(name)              \
+	SYM_START(name, SYM_L_GLOBAL, SYM_A_NONE) \
+	BTI_C                                     \
 
-#define SYM_FUNC_START_LOCAL(name)			\
-	SYM_START(name, SYM_L_LOCAL, SYM_A_ALIGN)	\
-	bti c ;
+#define SYM_FUNC_START_LOCAL(name)                \
+	SYM_START(name, SYM_L_LOCAL, SYM_A_ALIGN) \
+	BTI_C                                     \
 
-#define SYM_FUNC_START_LOCAL_NOALIGN(name)		\
-	SYM_START(name, SYM_L_LOCAL, SYM_A_NONE)	\
-	bti c ;
+#define SYM_FUNC_START_LOCAL_NOALIGN(name)       \
+	SYM_START(name, SYM_L_LOCAL, SYM_A_NONE) \
+	BTI_C                                    \
 
-#define SYM_FUNC_START_WEAK(name)			\
-	SYM_START(name, SYM_L_WEAK, SYM_A_ALIGN)	\
-	bti c ;
+#define SYM_FUNC_START_WEAK(name)                \
+	SYM_START(name, SYM_L_WEAK, SYM_A_ALIGN) \
+	BTI_C                                    \
 
-#define SYM_FUNC_START_WEAK_NOALIGN(name)		\
-	SYM_START(name, SYM_L_WEAK, SYM_A_NONE)		\
-	bti c ;
+#define SYM_FUNC_START_WEAK_NOALIGN(name)       \
+	SYM_START(name, SYM_L_WEAK, SYM_A_NONE) \
+	BTI_C                                   \
 
-#define SYM_TYPED_FUNC_START(name)				\
-	SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
-	bti c ;
+#define SYM_TYPED_FUNC_START(name)                       \
+	SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN) \
+	BTI_C                                            \
 
 #endif
diff --git a/arch/arm64/lib/copy_from_user.S b/arch/arm64/lib/copy_from_user.S
index 400057d607ec..07b6d6c9573f 100644
--- a/arch/arm64/lib/copy_from_user.S
+++ b/arch/arm64/lib/copy_from_user.S
@@ -61,7 +61,7 @@
 
 end	.req	x5
 srcin	.req	x15
-SYM_FUNC_START(__arch_copy_from_user)
+SYM_FUNC_START_TRACE(__arch_copy_from_user)
 	add	end, x0, x2
 	mov	srcin, x1
 #include "copy_template.S"
diff --git a/arch/arm64/lib/copy_to_user.S b/arch/arm64/lib/copy_to_user.S
index 819f2e3fc7a9..e7e663aea8ca 100644
--- a/arch/arm64/lib/copy_to_user.S
+++ b/arch/arm64/lib/copy_to_user.S
@@ -60,7 +60,7 @@
 
 end	.req	x5
 srcin	.req	x15
-SYM_FUNC_START(__arch_copy_to_user)
+SYM_FUNC_START_TRACE(__arch_copy_to_user)
 	add	end, x0, x2
 	mov	srcin, x1
 #include "copy_template.S"
-- 
2.47.3


