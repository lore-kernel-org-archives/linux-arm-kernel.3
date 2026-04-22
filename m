Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C6DFA1FD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 17:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deqUl/0DmpTgTWRSS3T6H4sZGghf3sR2Je/I0n4Iar8=; b=EYKxY34aH6metkaAITVJ2QVqwU
	Uf+0dV9BV3GEW80Pd1A21lMDUGCNPz+t5bXDjKHlAp9kzNbnV8iTgzogYnrnfb5BRObkzM+HlIl3R
	0JDCVSnr/4czlZxGCiT4vJLUB1MfN/qeZnZ1F0SxnxoB/6WxzRjvnV7TPUTU8FojANb9iqw5G1RJ5
	w0HRRTG54LPj9YObiZadYNWZeXag6kLyyb5k378mpC/twG/qsr1ecCHkCxAmqaGLAQXvk9NYKR/Hr
	DGK2UDt8uYtQuMX8iAnq63VcMeVvxDjK89FU6XFkRO3cGaqGSjdcbiq7ZknFHvhNvz0fr0qbwBM/5
	7CpAQ7BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbCX-0000000AYX9-3tjc;
	Wed, 22 Apr 2026 17:17:25 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbCS-0000000AYSy-0ijv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 17:17:21 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48a548b585cso17316335e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 10:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776878238; x=1777483038; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=deqUl/0DmpTgTWRSS3T6H4sZGghf3sR2Je/I0n4Iar8=;
        b=ddqnFvxQppFAWfd8XOiVYzf7ryhiQuzb9wikMdFSXhhAisiNwCCZJSOdeuZ1+xfflU
         HTXGjpDgFyaYnM7vrSyFCFXZoXeC1LxH8wJUpZ71DUrJqxYzKnJeZ2igHcdKxb8Aew9t
         1dXCXSjpi59gcSJRHxx+NMNd8HN+ybHQRWE0kudESlvMarfcWBnttIXa9SLDQX4kJkkH
         prrBWm9c6OeAvX2ADm0YM7Wvxeu3PK+BbzRMhPMlGsNpXf+Tgz1PUPp3iFxcPWfSCifU
         dEyC2WuhgF5eFADuWWv84JNvcCRqZt0dkhofDXTun1TxA2ht4RbLtqZAi0ZK9WYZT6kL
         Or4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776878238; x=1777483038;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=deqUl/0DmpTgTWRSS3T6H4sZGghf3sR2Je/I0n4Iar8=;
        b=cQTp2TpxB9ktOI68mEhnVlcV2OVl/+mHzDdTmAZV25Rc00K9gdv6rYDUTIUfzdF7EO
         tSY6TY5vZR3QSdMqIx1AYtKlhioBd78xW0jfS43PraEbmqas5T+U7IuqAPoSGhnWm2lz
         jwpo6PF6dN/zsh1xDdhSbfHNgXBndMnkAytzya+hjwJw4Nrc1vZpMSiQQaIHJ/y0pQKD
         goludJvZxf+339jDl65b5wni1yEjeSiuRpIyl3PH6tqkbo4Viq7kpeQyOP2ubN9c7C6E
         VCuVhZ6oC0LxRgOY8gOTTJTRsZnS8bRSi+HcxDmOvLf9s8yysZke2NC0/VW9FcRih5NO
         pjPg==
X-Gm-Message-State: AOJu0YxRSmrqEeMcRtxecb7eB8KOPsLMU6qF5uSQ0JUTwIEwH3tHvgTi
	Hr+mtNsxSajvIUqy9WZhLO3rh8ZiSllZRBpBsv2zgXL/bZ199oBMkcYcl1KzV5Z0P96pcUKkAso
	KRn0QwyE7yRGzqrPncW+U3s7xhla2oMW62LEx4EWoiR+JT3EZAPpVonvSdWdJ8ba7nx+q0urwH2
	miGeFnSmSx0Th+Zb/kQtHzenmisxNQZHX4ewRnXasNEcOk
X-Received: from wmer5.prod.google.com ([2002:a05:600c:4345:b0:48a:5970:2007])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8183:b0:488:ab26:8fe0
 with SMTP id 5b1f17b1804b1-488fb765b1dmr277032245e9.15.1776878237613; Wed, 22
 Apr 2026 10:17:17 -0700 (PDT)
Date: Wed, 22 Apr 2026 19:16:57 +0200
In-Reply-To: <20260422171655.3437334-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20260422171655.3437334-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3447; i=ardb@kernel.org;
 h=from:subject; bh=zwZvU5669f7aDZao7jQAWD9kIr1c+dLuC0i1hvVVKpM=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfMlU1fb9UNFytb8/R6yr4vqjz276L+i5vzFZq2Wf/tWX
 9rcrejRUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbSE8/IsLv09KSzW4LMjrcF
 vT9w5UcO17XrYrsvqJgKT3Qy69N+wsXwT6MhqrhI3mZtitiK1Gsx4jVWPX92NrKk/To9cTZrxKU YLgA=
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260422171655.3437334-11-ardb+git@google.com>
Subject: [PATCH 1/8] ARM: Add a neon-intrinsics.h header like on arm64
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org, linux-raid@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_101720_231864_B3F179D9 
X-CRM114-Status: GOOD (  20.02  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Add a header asm/neon-intrinsics.h similar to the one that arm64 has.
This makes it possible for NEON intrinsics code to be shared seamlessly
between ARM and arm64.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 Documentation/arch/arm/kernel_mode_neon.rst |  4 +-
 arch/arm/include/asm/neon-intrinsics.h      | 60 ++++++++++++++++++++
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/arm/kernel_mode_neon.rst b/Documentation/arch/arm/kernel_mode_neon.rst
index 9bfb71a2a9b9..1efb6d35b7bd 100644
--- a/Documentation/arch/arm/kernel_mode_neon.rst
+++ b/Documentation/arch/arm/kernel_mode_neon.rst
@@ -121,4 +121,6 @@ observe the following in addition to the rules above:
 * Compile the unit containing the NEON intrinsics with '-ffreestanding' so GCC
   uses its builtin version of <stdint.h> (this is a C99 header which the kernel
   does not supply);
-* Include <arm_neon.h> last, or at least after <linux/types.h>
+* Do not include <arm_neon.h> directly: instead, include <asm/neon-intrinsics.h>,
+  which tweaks some macro definitions so that system headers can be included
+  safely.
diff --git a/arch/arm/include/asm/neon-intrinsics.h b/arch/arm/include/asm/neon-intrinsics.h
new file mode 100644
index 000000000000..8b80c05ce1d7
--- /dev/null
+++ b/arch/arm/include/asm/neon-intrinsics.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_NEON_INTRINSICS_H
+#define __ASM_NEON_INTRINSICS_H
+
+#ifndef __ARM_NEON__
+#error You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
+#endif
+
+#include <asm-generic/int-ll64.h>
+
+/*
+ * The C99 types uintXX_t that are usually defined in 'stdint.h' are not as
+ * unambiguous on ARM as you would expect. For the types below, there is a
+ * difference on ARM between GCC built for bare metal ARM, GCC built for glibc
+ * and the kernel itself, which results in build errors if you try to build
+ * with -ffreestanding and include 'stdint.h' (such as when you include
+ * 'arm_neon.h' in order to use NEON intrinsics)
+ *
+ * As the typedefs for these types in 'stdint.h' are based on builtin defines
+ * supplied by GCC, we can tweak these to align with the kernel's idea of those
+ * types, so 'linux/types.h' and 'stdint.h' can be safely included from the
+ * same source file (provided that -ffreestanding is used).
+ *
+ *                    int32_t     uint32_t          intptr_t     uintptr_t
+ * bare metal GCC     long        unsigned long     int          unsigned int
+ * glibc GCC          int         unsigned int      int          unsigned int
+ * kernel             int         unsigned int      long         unsigned long
+ */
+
+#ifdef __INT32_TYPE__
+#undef __INT32_TYPE__
+#define __INT32_TYPE__		int
+#endif
+
+#ifdef __UINT32_TYPE__
+#undef __UINT32_TYPE__
+#define __UINT32_TYPE__		unsigned int
+#endif
+
+#ifdef __INTPTR_TYPE__
+#undef __INTPTR_TYPE__
+#define __INTPTR_TYPE__		long
+#endif
+
+#ifdef __UINTPTR_TYPE__
+#undef __UINTPTR_TYPE__
+#define __UINTPTR_TYPE__	unsigned long
+#endif
+
+/*
+ * genksyms chokes on the ARM NEON instrinsics system header, but we
+ * don't export anything it defines anyway, so just disregard when
+ * genksyms execute.
+ */
+#ifndef __GENKSYMS__
+#include <arm_neon.h>
+#endif
+
+#endif /* __ASM_NEON_INTRINSICS_H */
-- 
2.54.0.rc1.555.g9c883467ad-goog


