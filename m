Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9F1E9B373
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IuCsvm2cGfELoFVj6dzhBy1SObe9G7IuVP1EF/2gXo=; b=N8LiHEBPOJA6D6nXUn2lN7ZjNW
	cQddyRtt9OHWeec++t0/dyZ8f+LlCxiTQqdT0Ei5AKPdgxdGWEUAPJzwxDF4gPshN9QUoA6tF6Uba
	OdXJQ6hVRnH4wUgPTa/SE9OQGOxNKHZRZANdDGRDYQK6fKKb2oJDMiMotF5piiGQIU23Bp8epPivo
	kfqe6n2zn4/ZDnyBBTWs5VMNPMgK9crLo1pRMBsJU4oh2xV2hSwhRhTFrISz4x1n1JHu4nUAYZZDj
	dUuEQ2k1MjLKGyzflH+LUn4Y4PJ8x4ukSwnxSSCfDJSSMPcbMICUesmOCd/gOAfdJUj71a0Tf2fy1
	WrAj6NOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2Lj-0000000CwRf-26mR;
	Mon, 02 Mar 2026 12:26:11 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LR-0000000Cvtg-42e7;
	Mon, 02 Mar 2026 12:25:55 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6IuCsvm2cGfELoFVj6dzhBy1SObe9G7IuVP1EF/2gXo=;
	b=da6EZmSfUm9111bFjIM3F+dNlZNGWPW1eN0BtOHAmyUkek/S4ApnyYsLAvQDTs3BfD8bNR
	olHyAq4d14aPCG7ZVsMhzqZcxVZhq3SlX2/LZCZ6bRx/FXwxP01+/B9YgUVTVhxcjQD3Xe
	2QVGzitWwT+eK+uYSrOBd3wPjWBv6oX0WxUiljKTgs5w4p1AATrCcykQEjpm7Wckv9EzS4
	R+prsnzd1PNt3Wn0W+ZeBl5H6RAhXbXQNmrGKr9HD5az0J/a+4xWjV23G7X5AoolJFcj9Z
	JCL0A7KseyQ+esU0vtZv29qwN6j6gzV74ezeGydEcvB+RCAX1FY+gd/IX8cYpQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6IuCsvm2cGfELoFVj6dzhBy1SObe9G7IuVP1EF/2gXo=;
	b=l0hZVyeqGYmKCh8kKgBW2VcGXwDLfx5b9Gdrnegn+TBMrdFjh/F3qGt4TKfpLXDUNM+pxG
	6dNRMGZ/nruazVAg==
Date: Mon, 02 Mar 2026 13:25:37 +0100
Subject: [PATCH 13/15] sh: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260302-at-vector-size-arch-v1-13-a11f03ba2ca8@linutronix.de>
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
In-Reply-To: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=1566;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=H/m8MEbscz6WrH/+FAiysHkWJ0RcGdw589TTpDmII/4=;
 b=70FaFWSkNZh4Bigz/FCzkj6Q189+PNtssX+j5xte676xMOG9LLtUgl7gGtydm5ZgSwLz8qm7a
 m8JP07HyaioCw989TZl/9nlUAJ4kPMiJ3LDiNOJB7E4QpPK9Lg7q5Qc
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042554_171034_6B4A7CCE 
X-CRM114-Status: GOOD (  11.22  )
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
---
 arch/sh/include/asm/auxvec.h      | 7 +++++++
 arch/sh/include/uapi/asm/auxvec.h | 8 +++-----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/sh/include/asm/auxvec.h b/arch/sh/include/asm/auxvec.h
new file mode 100644
index 000000000000..f0830808eb19
--- /dev/null
+++ b/arch/sh/include/asm/auxvec.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_SH_AUXVEC_H
+#define __ASM_SH_AUXVEC_H
+
+#define AT_VECTOR_SIZE_ARCH 5 /* entries in ARCH_DLINFO */
+
+#endif /* __ASM_SH_AUXVEC_H */
diff --git a/arch/sh/include/uapi/asm/auxvec.h b/arch/sh/include/uapi/asm/auxvec.h
index 8eb47ede7193..1b07c4bfe160 100644
--- a/arch/sh/include/uapi/asm/auxvec.h
+++ b/arch/sh/include/uapi/asm/auxvec.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef __ASM_SH_AUXVEC_H
-#define __ASM_SH_AUXVEC_H
+#ifndef __UAPI_ASM_SH_AUXVEC_H
+#define __UAPI_ASM_SH_AUXVEC_H
 
 /*
  * Architecture-neutral AT_ values in 0-17, leave some room
@@ -34,6 +34,4 @@
 #define AT_L1D_CACHESHAPE	35
 #define AT_L2_CACHESHAPE	36
 
-#define AT_VECTOR_SIZE_ARCH 5 /* entries in ARCH_DLINFO */
-
-#endif /* __ASM_SH_AUXVEC_H */
+#endif /* __UAPI_ASM_SH_AUXVEC_H */

-- 
2.53.0


