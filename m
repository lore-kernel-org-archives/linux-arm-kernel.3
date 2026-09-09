Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCDAC79FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMVMS5fB9cOPA4POT3k9FrIUmWVPCjnIMj07aQx41TA=; b=AD11nbOeiBJ+qoebOsNrmx6pZE
	dnkUkNzrRg/XemS/SGF8FinatBDWY6aVg/4QkLaB3+xW9Uo14VGwU3KFrA+XtA9p4FMmJcvuMNQs2
	U5xbsSKOK/7hDCBUQX5L7aZVGaGbU2zbjz+tScx6cMem64mVZwQ1HZigvOB8w33NyDgbIJXGqGjlb
	SoDM0W+bxPKJH3+yUgMQ2+f0fjsN/jooJPyyJKyPVNfm7eWcZAr38hGnN1tUSY2fMzHw/C5gCpSrH
	rkmJbVfC4oPzuuK7ow8SC/ywghMV2MoAi00nus7FN7g4di6POnft0w5IaG+sKe/trr+YXoYgHpkCN
	Q7WCv0fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E23-0000000BAbS-0zqr;
	Wed, 09 Sep 2026 08:51:51 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1i-0000000BADT-386k;
	Wed, 09 Sep 2026 08:51:33 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JMVMS5fB9cOPA4POT3k9FrIUmWVPCjnIMj07aQx41TA=;
	b=PBnltHouqiLd0vZKnEktzgXmmVWj9E/rgINg+MiWTjeKITcztp+Zs/R13kZurmAKB598p4
	kddIj8zs+mThxi0y1LOe5Ah2DoBWqyt7r6P+8YyxJlafdIhLoo6yaKWvWFbuwAnV8UJa9+
	2t63vt1DbGY4E1IaJujjBIhN1MeJAXY+mMvFRhspG6cpN1YGpcKx5eb8u+adsTk7vQ5JjG
	JFW2Uy4Vy3WyoTXTFZRKk1+zsRveZDTBJT4cK1mWfo7GCoDzh2Y0SX7/53JxGrJvO5p2Tq
	3VdybOHbhTLd1PX2P6BepZhrOPUVFmlZshdcWktTvhB6XBpzkyhmyJ1t6NAwGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JMVMS5fB9cOPA4POT3k9FrIUmWVPCjnIMj07aQx41TA=;
	b=OsR9+ePJ4YG9lbDvs0TVFng2Lc1FxhDap7d8efI2GntHBjwnUbhw+GFc+EwXBu2WJtvwC4
	bCPFZo80XHJHmfAA==
Date: Wed, 09 Sep 2026 10:51:27 +0200
Subject: [PATCH 14/15] vdso: Add asm-generic/vdso/vsyscall.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-14-63ae856cc659@linutronix.de>
References: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
In-Reply-To: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=4765;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=RN6cYJUEQdRxuBEqqYhIPB2SE0TZGxcBuEAXLBMYDtE=;
 b=d6YgCC9mOtzM/HCu/dlX+VOf6yWQ71CH6LOM9NRJDlKLcjm2on0tmi0kD6UBUtMzkFELguk6T
 12bpP+ouE5+ALngtyStONC+dPoOfbs2V+mh5GeDN2fzMK207HnGAZQL
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_015130_981545_27AC88C5 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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

Most architectures' asm/vdso/vsyscall.h do not define any symbols.

Add an empty asm-generic variant and replace the pointless
architecture-specific copies.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/loongarch/include/asm/vdso/vsyscall.h | 11 -----------
 arch/mips/include/asm/vdso/vsyscall.h      | 13 -------------
 arch/powerpc/include/asm/vdso/vsyscall.h   | 11 -----------
 arch/riscv/include/asm/vdso/vsyscall.h     | 11 -----------
 arch/s390/include/asm/vdso/vsyscall.h      | 13 -------------
 arch/sparc/include/asm/vdso/vsyscall.h     |  6 ------
 arch/x86/include/asm/vdso/vsyscall.h       | 12 ------------
 include/asm-generic/Kbuild                 |  1 +
 include/asm-generic/vdso/vsyscall.h        |  0
 9 files changed, 1 insertion(+), 77 deletions(-)

diff --git a/arch/loongarch/include/asm/vdso/vsyscall.h b/arch/loongarch/include/asm/vdso/vsyscall.h
deleted file mode 100644
index db653780519d..000000000000
--- a/arch/loongarch/include/asm/vdso/vsyscall.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_VDSO_VSYSCALL_H
-#define __ASM_VDSO_VSYSCALL_H
-
-#ifndef __ASSEMBLER__
-
-#include <vdso/datapage.h>
-
-#endif /* !__ASSEMBLER__ */
-
-#endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/mips/include/asm/vdso/vsyscall.h b/arch/mips/include/asm/vdso/vsyscall.h
deleted file mode 100644
index f01ab2e15c08..000000000000
--- a/arch/mips/include/asm/vdso/vsyscall.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_VDSO_VSYSCALL_H
-#define __ASM_VDSO_VSYSCALL_H
-
-#include <asm/page.h>
-
-#ifndef __ASSEMBLER__
-
-#include <vdso/datapage.h>
-
-#endif /* !__ASSEMBLER__ */
-
-#endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/powerpc/include/asm/vdso/vsyscall.h b/arch/powerpc/include/asm/vdso/vsyscall.h
deleted file mode 100644
index 6a6510fa8217..000000000000
--- a/arch/powerpc/include/asm/vdso/vsyscall.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_POWERPC_VDSO_VSYSCALL_H
-#define _ASM_POWERPC_VDSO_VSYSCALL_H
-
-#ifndef __ASSEMBLER__
-
-#include <asm/vdso_datapage.h>
-
-#endif /* !__ASSEMBLER__ */
-
-#endif /* _ASM_POWERPC_VDSO_VSYSCALL_H */
diff --git a/arch/riscv/include/asm/vdso/vsyscall.h b/arch/riscv/include/asm/vdso/vsyscall.h
deleted file mode 100644
index db653780519d..000000000000
--- a/arch/riscv/include/asm/vdso/vsyscall.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_VDSO_VSYSCALL_H
-#define __ASM_VDSO_VSYSCALL_H
-
-#ifndef __ASSEMBLER__
-
-#include <vdso/datapage.h>
-
-#endif /* !__ASSEMBLER__ */
-
-#endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/s390/include/asm/vdso/vsyscall.h b/arch/s390/include/asm/vdso/vsyscall.h
deleted file mode 100644
index c74c307c320c..000000000000
--- a/arch/s390/include/asm/vdso/vsyscall.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_VDSO_VSYSCALL_H
-#define __ASM_VDSO_VSYSCALL_H
-
-#ifndef __ASSEMBLER__
-
-#include <linux/hrtimer.h>
-#include <vdso/datapage.h>
-#include <asm/vdso.h>
-
-#endif /* !__ASSEMBLER__ */
-
-#endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/sparc/include/asm/vdso/vsyscall.h b/arch/sparc/include/asm/vdso/vsyscall.h
deleted file mode 100644
index ff62b291e4eb..000000000000
--- a/arch/sparc/include/asm/vdso/vsyscall.h
+++ /dev/null
@@ -1,6 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef _ASM_SPARC_VDSO_VSYSCALL_H
-#define _ASM_SPARC_VDSO_VSYSCALL_H
-
-#endif /* _ASM_SPARC_VDSO_VSYSCALL_H */
diff --git a/arch/x86/include/asm/vdso/vsyscall.h b/arch/x86/include/asm/vdso/vsyscall.h
deleted file mode 100644
index 65d10f4cc718..000000000000
--- a/arch/x86/include/asm/vdso/vsyscall.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_VDSO_VSYSCALL_H
-#define __ASM_VDSO_VSYSCALL_H
-
-#ifndef __ASSEMBLER__
-
-#include <vdso/datapage.h>
-#include <asm/vgtod.h>
-
-#endif /* !__ASSEMBLER__ */
-
-#endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index 2bc00c67dc54..b7a388bef6ea 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -63,6 +63,7 @@ mandatory-y += trace_clock.h
 mandatory-y += uaccess.h
 mandatory-y += unwind_user.h
 mandatory-y += vdso/clocksource.h
+mandatory-y += vdso/vsyscall.h
 mandatory-y += vermagic.h
 mandatory-y += vga.h
 mandatory-y += video.h
diff --git a/include/asm-generic/vdso/vsyscall.h b/include/asm-generic/vdso/vsyscall.h
new file mode 100644
index 000000000000..e69de29bb2d1

-- 
2.55.0


