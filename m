Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFBBC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 12:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tzJ1joMpGHHtzyOpZkkHUWdfelYxBi+wFF4CRWn/mU=; b=ovvTxpwA2063wprf/U68R6S4NH
	p8ngw5wUEW8E0exBZPwow4A8rkRBISlEGUoTfT8UWFSeOEDDDMRT+oMxFIvIuTuon5JqIMs0f47Pc
	h2+o9k+in/qpIaTsvPZQyg8dE0I7szR5UQGpl5D1VFgRyAW0dJEAK/iIbQzEAI080A/8ql3UbHcag
	XuvEK2NjoQMSLuBKb7OCzcgULzyLCWFNlBlCk4xKPcK/mi7wVfc55f8hXxM2E+B4ga/jYGOQuwmoH
	ozdvV2C0WBgx1FDubgk/fMEpWLH5NJ36O7rbEp3q5laASCO4wt2XQBib2Si1LausHsemgEDkOUCVp
	794uKBow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHlC-00000000MkE-3jvr;
	Tue, 04 Feb 2025 12:10:34 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHgw-00000000LIk-2UpS;
	Tue, 04 Feb 2025 12:06:12 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738670767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8tzJ1joMpGHHtzyOpZkkHUWdfelYxBi+wFF4CRWn/mU=;
	b=V6j2Bzb2DRgaHKVvoWqEOL27zB3QtKLt4Ore8/SsczLQALyCenL5OFwapQzwhVdu9y3xpS
	cQZ+JuxIu/XEMKB1mzXgFUoT//0mHMJrlQ8TJjZwZo9zlNbx14A2PPb5aJBk1W5j89SAxb
	EVhLcE8hXrCivq28hrHiRQ1xEfuNLDPVNINkY4d9wRgP5UaeYmhW7aAoGtrfytI/i9/+vj
	a3kh1Nt9Zoanzv0bYnYotnou88oNxhxhBN1ygL6Zo1eAoEJkYzwj5+vPuPzCeR89CKaVSs
	SNewuZIe/x5/y5ufhjaVUvNysR6R/QcCwwGobQLPGhS/T8V4NEahAkE7SBq+JA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738670767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8tzJ1joMpGHHtzyOpZkkHUWdfelYxBi+wFF4CRWn/mU=;
	b=iOtKH3oskjcSYbCDgYKpSYB56t2sXU+wplGvT0jFC1YW0MQDUGoJvdNFOaiB4UvAdBeCPc
	PMh3pscdXS1SjCCA==
Date: Tue, 04 Feb 2025 13:05:35 +0100
Subject: [PATCH v3 03/18] vdso: Introduce vdso/align.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250204-vdso-store-rng-v3-3-13a4669dfc8c@linutronix.de>
References: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
In-Reply-To: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, 
 Guo Ren <guoren@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 linux-csky@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738670761; l=2181;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=pGC6jdjVpB6TSU5BlYOrn0adCU6n5QZjbS9JPsjrItg=;
 b=OW2mHbyRnxefuX9jtydaC4QPubDcM1IK1QS/suztcpEYCSk6R4TQGGJNZXsgYPfuJtL8zaYiV
 Ee44hOKuVaIBGyEHrG4dGlROwx8aYEK2YSDNoaAJcuGYVPNnBTi2GLG
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_040610_937491_E29E2172 
X-CRM114-Status: GOOD (  12.00  )
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

The vDSO implementation can only include headers from the vdso/
namespace. To enable the usage of the ALIGN() macro from the vDSO, move
linux/align.h to vdso/align.h wholly.
As the only dependency linux/const.h is only a wrapper around
vdso/const.h anyways adapt that dependency.

Also provide a compatibility wrapper linux/align.h.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/linux/align.h | 10 +---------
 include/vdso/align.h  | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/include/linux/align.h b/include/linux/align.h
index 2b4acec7b95a27b6768d48f46519abc584c94d5d..55debf105a5d610c592e5c53a4153018ea1ae2c6 100644
--- a/include/linux/align.h
+++ b/include/linux/align.h
@@ -2,14 +2,6 @@
 #ifndef _LINUX_ALIGN_H
 #define _LINUX_ALIGN_H
 
-#include <linux/const.h>
-
-/* @a is a power of 2 value */
-#define ALIGN(x, a)		__ALIGN_KERNEL((x), (a))
-#define ALIGN_DOWN(x, a)	__ALIGN_KERNEL((x) - ((a) - 1), (a))
-#define __ALIGN_MASK(x, mask)	__ALIGN_KERNEL_MASK((x), (mask))
-#define PTR_ALIGN(p, a)		((typeof(p))ALIGN((unsigned long)(p), (a)))
-#define PTR_ALIGN_DOWN(p, a)	((typeof(p))ALIGN_DOWN((unsigned long)(p), (a)))
-#define IS_ALIGNED(x, a)		(((x) & ((typeof(x))(a) - 1)) == 0)
+#include <vdso/align.h>
 
 #endif	/* _LINUX_ALIGN_H */
diff --git a/include/vdso/align.h b/include/vdso/align.h
new file mode 100644
index 0000000000000000000000000000000000000000..02dd8626b5c5aa59d2ee0b15799b6e9adb343f65
--- /dev/null
+++ b/include/vdso/align.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __VDSO_ALIGN_H
+#define __VDSO_ALIGN_H
+
+#include <vdso/const.h>
+
+/* @a is a power of 2 value */
+#define ALIGN(x, a)		__ALIGN_KERNEL((x), (a))
+#define ALIGN_DOWN(x, a)	__ALIGN_KERNEL((x) - ((a) - 1), (a))
+#define __ALIGN_MASK(x, mask)	__ALIGN_KERNEL_MASK((x), (mask))
+#define PTR_ALIGN(p, a)		((typeof(p))ALIGN((unsigned long)(p), (a)))
+#define PTR_ALIGN_DOWN(p, a)	((typeof(p))ALIGN_DOWN((unsigned long)(p), (a)))
+#define IS_ALIGNED(x, a)		(((x) & ((typeof(x))(a) - 1)) == 0)
+
+#endif	/* __VDSO_ALIGN_H */

-- 
2.48.1


