Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B6DC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=acT7QjZNdUmpfnBE9uBNeofdPEPn+BimCrNJZCbn/To=; b=pO/Qp5PXX0fTAPxnSNoNviuFyy
	/TTaJG33+qA7jAc2HGHfj6xoqRLVTfWMVZIiOBv6upeonwyFUIyuat88GJWHWIl4MOSBobaz/mxTb
	BVB4VuZU99sKsLzN4J7G26JUUnKErkrUvXvaI0w2bjF2CcdKg2ZGbvmgA+2vc1+K69zJdwHnqbwgc
	+WUH0fb+P2Q7w921gIeFTVmj6OEgmhu7koDBsIBorkOY4DKctGRBBqO3ZTCivkauj2/YQ062PrAZF
	czSGBAsuxbxXU988ihqDzFWwIZ7MV5xd2A4wSb7E6xJYROTbr8mN5OqmHp+U5EbTxsoVfdiJ2ma8E
	yZDfO7sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2253-0000000GdG0-1ax4;
	Thu, 03 Sep 2026 07:41:53 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224p-0000000Gcnf-04QA;
	Thu, 03 Sep 2026 07:41:44 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=acT7QjZNdUmpfnBE9uBNeofdPEPn+BimCrNJZCbn/To=;
	b=3jP4QdtfvdGKafZk4gV8HAs0JKCcq1g5wS/L1M3Qb1c7h/bp22yYQ4TGtOpk0Mr1S/c40K
	vezg61PPYZqPkMIMi0P+MeWnhIYlWcTdnwH+SRrFrQj+nHm3Q7XiGS+vPJ4prnY7NtnqS4
	Xcm7eDuut8ABcFWFXYthMXqf5wGy9Ccz9usV3DQF9udUqTs+ZSL1h0G/e/uPiHShZ/Ewxu
	mmqEjU6o4o8g1buldyiSf74wUiAqSpfnewCZQA6Jv6yvahNkaYBKs1k4bYgN+RF3gqYYZY
	9mJxAv66dqtq8g2IiUO/pUOHIbenwPQiYRyIjphamnJW3UILkPOqYRUhshZy9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=acT7QjZNdUmpfnBE9uBNeofdPEPn+BimCrNJZCbn/To=;
	b=s2g2u1zE4MoDzQePYnFomJgqRmXe5nRTN2VoD8bDtfLrzofrwt3d1WEshMMUnT7M9XzlRA
	0xw/D3K/rl1yL3Bw==
Date: Thu, 03 Sep 2026 09:41:28 +0200
Subject: [PATCH v2 13/15] sh: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260903-at-vector-size-arch-v2-13-5bc32a71e3d8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421286; l=1608;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=YKN2r1KwV0S2heb/8Y+Jhhyff24Np1SwL0Bw1UDwB4U=;
 b=useSqq1PQgc5jzt7dwdzir5U98FAJIkoH55nFNQGYdoiuFZAdgXYdssF8gR1E00nS8bRYsyyN
 V4+Vyu8LX0EAHidn3hUqdF1MdUf5WBlzeDxA5S/zQiX92l2UKGbW/Vx
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004139_214026_CD7C7473 
X-CRM114-Status: GOOD (  11.58  )
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
index 63fcc39e2c6a..cf0f13da977a 100644
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
@@ -30,6 +30,4 @@
 #define AT_L1D_CACHESHAPE	35
 #define AT_L2_CACHESHAPE	36
 
-#define AT_VECTOR_SIZE_ARCH 5 /* entries in ARCH_DLINFO */
-
-#endif /* __ASM_SH_AUXVEC_H */
+#endif /* __UAPI_ASM_SH_AUXVEC_H */

-- 
2.55.0


