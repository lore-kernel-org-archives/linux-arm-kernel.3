Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F710C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5iW4jdWMi73lQm0xNAN3vvMpxq+9yLkV/tkClyyUkd0=; b=lt06Il7n9YM3EJ0cyRD0m8WSbc
	8P7Cpr4/1IvTcwDwJrXXVYhWrCJFjeXufIoHDkgh1AJEvmEInUeB++iEDpgpA9tfjz5A8sHEz1O0x
	t8uExunvORESjOSksF5VAFMBXcBCGHC1CsIEFdt/CiYafxlOStLH3aPnEqMrjGElmpLBJxcHfkUC4
	GfJhSmTYF8R8vtxoI2MPoHxiJmir/3PA7RnvfjeoZ2cUYLaX9o5V+KufcS3tPMhsVcmSFd+dlr+e8
	pnVyw6W91XiW0/jJRWmHfkETKssJCN98bUFVTGkjMz/qeMIGFZqVUG3km7WqYckrfdN8Kmcl+OHaS
	wiZqVBFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224s-0000000Gcw7-2qCy;
	Thu, 03 Sep 2026 07:41:42 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224m-0000000GckQ-1lwY;
	Thu, 03 Sep 2026 07:41:37 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5iW4jdWMi73lQm0xNAN3vvMpxq+9yLkV/tkClyyUkd0=;
	b=epr8s8vLWpnga42EE26n/anTxvrFGHH4F82vRsZ686O+FbHTEyfL38Jbyrw33Fao8FUOgP
	YvfpgVnoZnX8uTI0qolELM6IsguWl2qCqGWFBHlWnTJgmPYquNQMwRJfi9XWi6Y5mRGle4
	KW3ueTspexywSZl3IKwRJHiOmkWiXh3Az2QaFtgBu2ylyRNKRnXLJSb4gZuN3or+uhXc+C
	FD6GRaP/A1NC0OFndLerATSc2J8oWgw0KbM/ig2+8dvbYbF0vV+qJArn7vMmZZ7Ov6GROG
	AQU6MqZCgZtTEo2NvDq+V4aCkcTPEMlQGt5c46v4ztQOs+3dQoiiMOY1XvcXvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5iW4jdWMi73lQm0xNAN3vvMpxq+9yLkV/tkClyyUkd0=;
	b=/TtDngCq8exQVQLXPVtjCK54BDhStRy2GTyEEXPtifFWiN3MyDpaRwkn0f1Dw6U+PBq7Nh
	AeLBrYQ9oaU/umAw==
Date: Thu, 03 Sep 2026 09:41:20 +0200
Subject: [PATCH v2 05/15] x86: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260903-at-vector-size-arch-v2-5-5bc32a71e3d8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421286; l=1994;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=b7W/p77P/YlmxuUHtTjOCqsXrUn80Pb/0CSphAb3eXc=;
 b=8bCm4iBaPTW9zBWat/+m5Ee1rmwD4EqMaEgVhxezGGaTPE5ECabv+Lrj7OAgMtDB5ybLV0Bjy
 LrdI/FLc2B7BI3Ex+/EIsufonLKjzeY5VOZWKidM6LruyvF2pR3gqlh
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004136_665700_43C0F350 
X-CRM114-Status: GOOD (  10.73  )
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
 arch/x86/include/asm/auxvec.h      | 12 ++++++++++++
 arch/x86/include/uapi/asm/auxvec.h | 13 +++----------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/auxvec.h b/arch/x86/include/asm/auxvec.h
new file mode 100644
index 000000000000..ed26ad09f3e3
--- /dev/null
+++ b/arch/x86/include/asm/auxvec.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_AUXVEC_H
+#define _ASM_X86_AUXVEC_H
+
+/* entries in ARCH_DLINFO: */
+#if defined(CONFIG_IA32_EMULATION) || !defined(CONFIG_X86_64)
+# define AT_VECTOR_SIZE_ARCH 3
+#else /* else it's non-compat x86-64 */
+# define AT_VECTOR_SIZE_ARCH 2
+#endif
+
+#endif /* _ASM_X86_AUXVEC_H */
diff --git a/arch/x86/include/uapi/asm/auxvec.h b/arch/x86/include/uapi/asm/auxvec.h
index bdde9e18f94e..6677c9ace117 100644
--- a/arch/x86/include/uapi/asm/auxvec.h
+++ b/arch/x86/include/uapi/asm/auxvec.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _ASM_X86_AUXVEC_H
-#define _ASM_X86_AUXVEC_H
+#ifndef _UAPI_ASM_X86_AUXVEC_H
+#define _UAPI_ASM_X86_AUXVEC_H
 /*
  * Architecture-neutral AT_ values in 0-17, leave some room
  * for more of them, start the x86-specific ones at 32.
@@ -10,11 +10,4 @@
 #endif
 #define AT_SYSINFO_EHDR		33
 
-/* entries in ARCH_DLINFO: */
-#if defined(__KERNEL__) && (defined(CONFIG_IA32_EMULATION) || !defined(CONFIG_X86_64))
-# define AT_VECTOR_SIZE_ARCH 3
-#else /* else it's non-compat x86-64 */
-# define AT_VECTOR_SIZE_ARCH 2
-#endif
-
-#endif /* _ASM_X86_AUXVEC_H */
+#endif /* _UAPI_ASM_X86_AUXVEC_H */

-- 
2.55.0


