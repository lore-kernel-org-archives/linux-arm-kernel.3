Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C74EE9B36A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUatCUMGjSOAYdWwYL9kAf5S0UMPuz+Fx84eRD4pGU4=; b=rPyAcmknIKDrz/rwRa/nTOrM4s
	2JM//PWC9w6NT+VehtZ0JTPwL2zhvQUTvQ8UMuJscLtYht3aMpOxWlvfhY3aovLsSnzXgrjAMbmpt
	/LTLLcuKtEBlcpr7DLRWtJCsXfsCklsY03kYHPZ2LT1Lb766Ots2QOcLshByWWInRUysMya8Rf8hV
	liZcwKgX2pIXQw5Du+ZLbsS+QZjGCTTCQV4o9ffNDqXRI3iAYXO2vnRZ83+YyYzBwZ7IGCK2HN574
	oxg9xhSNY0R6DGqdUZr0Q/92bHAF6HZb7JASSY9ciPjYfo1BAT2yJcQXykSnWqwX31uCEC9LaXSYI
	w3XSXvOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2Ll-0000000CwVE-2xhT;
	Mon, 02 Mar 2026 12:26:13 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LS-0000000Cvuq-27YN;
	Mon, 02 Mar 2026 12:25:55 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rUatCUMGjSOAYdWwYL9kAf5S0UMPuz+Fx84eRD4pGU4=;
	b=MW1bGCsS9DfO9X+v0DSKadvLFn+SWmk1pn+rddicrRlb+25XuZl0eJt6iP0G+BXg34cvQ+
	1Ypq8dU9/4H9JLtsbNLwN5Op4E1bl+T4qCK3Q+t4+bjDkmJqqKq1cZulRp0Q5bjxyuTa47
	wiRCfLK8Jy/Zk+I2mf8sQaKTwx9mwTzg39fMPaeuYCeMY1g5BgCHN7iPogP3geq0eUFj3Z
	1espng2OIo24NrTFZzZJjZfVEZhat3bTP91FgzcChTJq/X8HDD3/SOOdkrO038gUGid1NP
	/TG9xAya313yScFDighxypdFYvV3s2al8OVDGX6NMfe71/7TtA36WV+yKWJIog==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rUatCUMGjSOAYdWwYL9kAf5S0UMPuz+Fx84eRD4pGU4=;
	b=Glqb/iX58ImwLmydqxjJwzbHZqXKn5FJ/rKO/+KdO7fpIDILYZKeypk8G9y+WgL/AIWKQi
	8ZSn2D4OHrttUMCg==
Date: Mon, 02 Mar 2026 13:25:38 +0100
Subject: [PATCH 14/15] alpha: remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260302-at-vector-size-arch-v1-14-a11f03ba2ca8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=1621;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=1k5fCTPjgHXmT1wIddDgmvVMNFYPCfoGbNYiBvOaniE=;
 b=+emcoOjpmCtOGbRKRilDXun4wh9rZo8IxjTkm9zYNPepV3X+fcHLumuZs3KaZBdDmhAbmZz3X
 Sar6SiZRFKiDIiijEXUFkxsbjuuwCItZ6i5gyRlwHoXVec8Fv7oUaT2
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042554_693267_6D16EA06 
X-CRM114-Status: GOOD (  11.74  )
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
 arch/alpha/include/asm/auxvec.h      | 7 +++++++
 arch/alpha/include/uapi/asm/auxvec.h | 8 +++-----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/alpha/include/asm/auxvec.h b/arch/alpha/include/asm/auxvec.h
new file mode 100644
index 000000000000..fa90ee4f899c
--- /dev/null
+++ b/arch/alpha/include/asm/auxvec.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_ALPHA_AUXVEC_H
+#define __ASM_ALPHA_AUXVEC_H
+
+#define AT_VECTOR_SIZE_ARCH 4 /* entries in ARCH_DLINFO */
+
+#endif /* __ASM_ALPHA_AUXVEC_H */
diff --git a/arch/alpha/include/uapi/asm/auxvec.h b/arch/alpha/include/uapi/asm/auxvec.h
index 57cae8780d81..d21b87b6730a 100644
--- a/arch/alpha/include/uapi/asm/auxvec.h
+++ b/arch/alpha/include/uapi/asm/auxvec.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef __ASM_ALPHA_AUXVEC_H
-#define __ASM_ALPHA_AUXVEC_H
+#ifndef __UAPI_ASM_ALPHA_AUXVEC_H
+#define __UAPI_ASM_ALPHA_AUXVEC_H
 
 /* Reserve these numbers for any future use of a VDSO.  */
 #if 0
@@ -22,6 +22,4 @@
 #define AT_L2_CACHESHAPE	36
 #define AT_L3_CACHESHAPE	37
 
-#define AT_VECTOR_SIZE_ARCH 4 /* entries in ARCH_DLINFO */
-
-#endif /* __ASM_ALPHA_AUXVEC_H */
+#endif /* __UAPI_ASM_ALPHA_AUXVEC_H */

-- 
2.53.0


