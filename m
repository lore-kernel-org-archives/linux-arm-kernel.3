Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E7FC624DD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=elVYzhuCvmXJBPRZ3gCfrokksTC2QjbDZG7uOX6NqdE=; b=mAr8pkeCoXXmkeNyeLXopLYNyR
	CvIn4piS3ByjaeiLD3rI/L7LzPiet31VSzgayucSkBaV0ZdVcZ2zm9uKveCLq8NXw3g++mH3TMGPj
	lWkHeai1Ws63mznb2qTk4ZK9fxhKtP4bNAGX6Teslw2U+A/0M/0V8t7zrnS3M1Hbg0Kagkk6QnqDm
	qPWuIeG404dZ7jZu4LnU5n2QC/Wd5xZ12fNXJTG/8xF+DexEPz6ry5bPehm/VOyRgNtvADyWmufm1
	gE7iaV1jfGFbaCF7lMw13Fddgj1oTAOumpoW+aCYDuFsPzec6Nu3XOMz+38/sqbb9WcYlF+fAVPqG
	vyK6eFrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224u-0000000Gd0H-2p3M;
	Thu, 03 Sep 2026 07:41:44 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224n-0000000Gckp-1iKT;
	Thu, 03 Sep 2026 07:41:39 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=elVYzhuCvmXJBPRZ3gCfrokksTC2QjbDZG7uOX6NqdE=;
	b=x98/uR++5TGb1kE9DatfjBc7vccpt9Tv6Ybqo6Jpm1/OJSJD5KyNHVs69DNPs/A+utplx1
	kfB4ZZcdBUdFM9kNfHH3RmU8srMZxawE9tJ81+G0De8/k90wTz77UrJ/ZA5huABZSnoy1W
	8xIHZGOtgbMGRjdhG/MspxM5XvQ4jhFgE4/OvO5PFuyRioaV0ToxHelPuUjUoJCxVs1jmi
	a7XdgCUGnmhgYMH5GlU6reqy7m0j89/Z9cAyKN5l/lKlSrtK7RD4b4rQQwaWdRJ7D8nqy/
	x1IhVuGARBmfGfthpyoY88Qljhzj8StgQwCNy0bgCdFb3X+pqYUiWXjLOXJGQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=elVYzhuCvmXJBPRZ3gCfrokksTC2QjbDZG7uOX6NqdE=;
	b=16lypqC7rW9J+MkVv+rFbiDQP8PUbNH9MQTLL3JpXOtqRwqdnyUyndlvLnhpDqwpWve5tX
	0DkewKfU+GC6NTBA==
Date: Thu, 03 Sep 2026 09:41:25 +0200
Subject: [PATCH v2 10/15] powerpc: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260903-at-vector-size-arch-v2-10-5bc32a71e3d8@linutronix.de>
References: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
In-Reply-To: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421286; l=1614;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=YIjNA9GHIeGKIog+4ZRlNVoTyE7Q6c9+vbExkNBbN7U=;
 b=tzh2nu86F+qh+b32xMEyYGMszxVH1qArmLc3sUe8halsMjfnsH1mlrvaUFUosJPsV2OmaGV3H
 9t4yw1mYDMtDty4LZwJAm85bi7LB7ZA/JDYQ5/xehieYzIxhOCKT4g4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004137_593357_ADD3A288 
X-CRM114-Status: GOOD (  11.53  )
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

There is nothing userspace can do with this value. In the kernel is
always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
userspace and also changes from time to time.

Move the symbol to a kernel-internal header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Kees Cook <kees@kernel.org>
---
 arch/powerpc/include/asm/auxvec.h      | 7 +++++++
 arch/powerpc/include/uapi/asm/auxvec.h | 6 ++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/auxvec.h b/arch/powerpc/include/asm/auxvec.h
new file mode 100644
index 000000000000..d6c180e9ac2c
--- /dev/null
+++ b/arch/powerpc/include/asm/auxvec.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_POWERPC_AUXVEC_H
+#define _ASM_POWERPC_AUXVEC_H
+
+#define AT_VECTOR_SIZE_ARCH	15 /* entries in ARCH_DLINFO */
+
+#endif
diff --git a/arch/powerpc/include/uapi/asm/auxvec.h b/arch/powerpc/include/uapi/asm/auxvec.h
index aa7c16215453..9ab5b6d17929 100644
--- a/arch/powerpc/include/uapi/asm/auxvec.h
+++ b/arch/powerpc/include/uapi/asm/auxvec.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _ASM_POWERPC_AUXVEC_H
-#define _ASM_POWERPC_AUXVEC_H
+#ifndef _UAPI_ASM_POWERPC_AUXVEC_H
+#define _UAPI_ASM_POWERPC_AUXVEC_H
 
 /*
  * We need to put in some extra aux table entries to tell glibc what
@@ -50,6 +50,4 @@
 
 #define AT_MINSIGSTKSZ		51      /* stack needed for signal delivery */
 
-#define AT_VECTOR_SIZE_ARCH	15 /* entries in ARCH_DLINFO */
-
 #endif

-- 
2.55.0


