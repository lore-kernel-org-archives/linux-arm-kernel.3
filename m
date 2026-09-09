Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F78C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBW+NNY2SjZx2bEP4psBPmVHnHPr59CeSsptOJzPpxM=; b=M09iZRJ+nbcxP6BzdGAUVtVYVK
	cD/fzFgD6Xc9PJRXKWuK0WdRgEFYzGvqFsDq9wsSDLcmSKjMslb5lpUpmNts7dBP+yDehH3EGA0lr
	QlbZaV9rqEm+0JgV4GzVIG+Fr9T2aLrEiIj6j+PfifTHvJvgKTChJHthU4M0GwnCi8OtmAts+4kWp
	vqmaUnooJGn9IQHFBbb8tFo3f9kDbVOclW6lBPO8KusnG6Ic9a5kRd9NFKkY7lv2KRIRtGmonBahR
	lAMi8XbdXfKYvpblJ0PEm0yRUIX3w1DH0Z1YW2qUJ41WGDFcRUrc2VQsc1qqM1aAI8tgSJN6P04IQ
	YbwGfphw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E27-0000000BAkq-02Yt;
	Wed, 09 Sep 2026 08:51:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1l-0000000BAG5-2qsv;
	Wed, 09 Sep 2026 08:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZBW+NNY2SjZx2bEP4psBPmVHnHPr59CeSsptOJzPpxM=; b=nvJ/plsbqRDkfN/6X4kR/EHW8l
	dNAD4StTRZ3JNtT5HnLITAKLKazsMFR9w1bphOlrSmi8pKYYIvzwje3ETANU+bz1oVKshXhRknfT2
	VnBcz1bBzBgQuZgwsfQmmAvSiFg6aN2jt5c3ceKWfz/rrU8edq3uwJrcS2USbkpk4jUk1uOU7OgkZ
	2aIfsYGprXV0oOW2xjHndLIphII7zFZIUJC/Zbc+R1VxJdYK1kp2YkqW3RWiGP27ZUSBlAITgPIrN
	fHI0F3hfNYuGnHPkJ7hoPADE1rN7Czgyj2hGC43TlfzsRhV8gMsSx0utOl+kzX6mGtUsZNEg76oXr
	k7t2HkVQ==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4E1g-00000000wHW-2weJ;
	Wed, 09 Sep 2026 08:51:32 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZBW+NNY2SjZx2bEP4psBPmVHnHPr59CeSsptOJzPpxM=;
	b=HRqxeHQrnXZFu+IW6nd8K+TY+LCZR9HvX+RpxOvhst2wYQkKsTY3WEghL3CDlSZ/UMJ9U+
	qClsqE3u5gtUnsC+c/J5mpb5IIBe4D5+R8+ZJApFLO4luQIonxDru0UGAZnWLOoDos0UY1
	vPT7y7D7QRsVuT9MzxZuIdVqpLUhNiLz72FSqYdSxj2RShBxyjgY5PXTSdirYSX0zl29Ep
	EGgrqvBqFnaiWkZo8bzs+n3/0umIANXltxdYplWWoqUmTpi5wgqV0Bfh9XTtj3hddbI1/r
	uYB7p+q3cj1Ew5ADSyyWHuTBSTecRPxvOHhuDBoHmxit+YMutvt6FfKiABLETA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZBW+NNY2SjZx2bEP4psBPmVHnHPr59CeSsptOJzPpxM=;
	b=jHrgCIP/rO/bPwnh+S3RCGy4iJMaIq/Mlhlf+7l8900BurZmy7j2ykoB99Wxkh8OyfH0Dc
	9C9dta5dCibWzWDA==
Date: Wed, 09 Sep 2026 10:51:18 +0200
Subject: [PATCH 05/15] vdso: Delete asm-generic/vdso/vsyscall.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-5-63ae856cc659@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=6201;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=qhKDToRtVgE1seQYerDld7q7s7MqJPXIzQ2BawbRJ8w=;
 b=OFttGqDPceoM6rX7XNSrPCjOJ1o8w2sSyCuFYpcv3XLXp44msE1jDwBI83tyjyEjgR8ippMic
 gm8o53XdU8YBqTvJMqR0P/K8MUsjnsBFmjsyYIwE5HEwFngYTWSn65B
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_095129_095713_4295E971 
X-CRM114-Status: UNSURE (   9.55  )
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

Recent refactoring have made the header empty.

Remove it and its mentions.

Also that header was never a real asm-generic header anyways.
It had no reason to be in the asm-generic directory.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 MAINTAINERS                                |  1 -
 arch/arm/include/asm/vdso/vsyscall.h       |  3 ---
 arch/arm64/include/asm/vdso/vsyscall.h     |  3 ---
 arch/loongarch/include/asm/vdso/vsyscall.h |  3 ---
 arch/mips/include/asm/vdso/vsyscall.h      |  3 ---
 arch/powerpc/include/asm/vdso/vsyscall.h   |  3 ---
 arch/riscv/include/asm/vdso/vsyscall.h     |  3 ---
 arch/s390/include/asm/vdso/vsyscall.h      |  3 ---
 arch/sparc/include/asm/vdso/vsyscall.h     |  2 --
 arch/x86/include/asm/vdso/vsyscall.h       |  3 ---
 include/asm-generic/vdso/vsyscall.h        | 10 ----------
 11 files changed, 37 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 562ace172594..21c590dd28b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11064,7 +11064,6 @@ M:	Vincenzo Frascino <vincenzo.frascino@arm.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso
-F:	include/asm-generic/vdso/vsyscall.h
 F:	include/linux/vdso_datastore.h
 F:	include/linux/vdso_time.h
 F:	include/vdso/
diff --git a/arch/arm/include/asm/vdso/vsyscall.h b/arch/arm/include/asm/vdso/vsyscall.h
index ff1c729af05f..14f2ea9d8640 100644
--- a/arch/arm/include/asm/vdso/vsyscall.h
+++ b/arch/arm/include/asm/vdso/vsyscall.h
@@ -14,9 +14,6 @@ void __arch_sync_vdso_time_data(struct vdso_time_data *vdata)
 }
 #define __arch_sync_vdso_time_data __arch_sync_vdso_time_data
 
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/arm64/include/asm/vdso/vsyscall.h b/arch/arm64/include/asm/vdso/vsyscall.h
index 3f3c8eb74e2e..7d9d6bdd58b2 100644
--- a/arch/arm64/include/asm/vdso/vsyscall.h
+++ b/arch/arm64/include/asm/vdso/vsyscall.h
@@ -19,9 +19,6 @@ void __arch_update_vdso_clock(struct vdso_clock *vc)
 }
 #define __arch_update_vdso_clock __arch_update_vdso_clock
 
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
 #endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/loongarch/include/asm/vdso/vsyscall.h b/arch/loongarch/include/asm/vdso/vsyscall.h
index 558eb9dfda52..db653780519d 100644
--- a/arch/loongarch/include/asm/vdso/vsyscall.h
+++ b/arch/loongarch/include/asm/vdso/vsyscall.h
@@ -6,9 +6,6 @@
 
 #include <vdso/datapage.h>
 
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
 #endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/mips/include/asm/vdso/vsyscall.h b/arch/mips/include/asm/vdso/vsyscall.h
index 0f061a9babd1..f01ab2e15c08 100644
--- a/arch/mips/include/asm/vdso/vsyscall.h
+++ b/arch/mips/include/asm/vdso/vsyscall.h
@@ -8,9 +8,6 @@
 
 #include <vdso/datapage.h>
 
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
 #endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/powerpc/include/asm/vdso/vsyscall.h b/arch/powerpc/include/asm/vdso/vsyscall.h
index bee18e8660a0..6a6510fa8217 100644
--- a/arch/powerpc/include/asm/vdso/vsyscall.h
+++ b/arch/powerpc/include/asm/vdso/vsyscall.h
@@ -6,9 +6,6 @@
 
 #include <asm/vdso_datapage.h>
 
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
 #endif /* !__ASSEMBLER__ */
 
 #endif /* _ASM_POWERPC_VDSO_VSYSCALL_H */
diff --git a/arch/riscv/include/asm/vdso/vsyscall.h b/arch/riscv/include/asm/vdso/vsyscall.h
index 558eb9dfda52..db653780519d 100644
--- a/arch/riscv/include/asm/vdso/vsyscall.h
+++ b/arch/riscv/include/asm/vdso/vsyscall.h
@@ -6,9 +6,6 @@
 
 #include <vdso/datapage.h>
 
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
 #endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/s390/include/asm/vdso/vsyscall.h b/arch/s390/include/asm/vdso/vsyscall.h
index b00acec8ddbc..c74c307c320c 100644
--- a/arch/s390/include/asm/vdso/vsyscall.h
+++ b/arch/s390/include/asm/vdso/vsyscall.h
@@ -8,9 +8,6 @@
 #include <vdso/datapage.h>
 #include <asm/vdso.h>
 
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
 #endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/sparc/include/asm/vdso/vsyscall.h b/arch/sparc/include/asm/vdso/vsyscall.h
index 8bfe703fedc5..b08e0bd5e309 100644
--- a/arch/sparc/include/asm/vdso/vsyscall.h
+++ b/arch/sparc/include/asm/vdso/vsyscall.h
@@ -5,6 +5,4 @@
 
 #define __VDSO_PAGES 4
 
-#include <asm-generic/vdso/vsyscall.h>
-
 #endif /* _ASM_SPARC_VDSO_VSYSCALL_H */
diff --git a/arch/x86/include/asm/vdso/vsyscall.h b/arch/x86/include/asm/vdso/vsyscall.h
index 4aa311a923f2..57598db8763b 100644
--- a/arch/x86/include/asm/vdso/vsyscall.h
+++ b/arch/x86/include/asm/vdso/vsyscall.h
@@ -14,9 +14,6 @@
 #include <vdso/datapage.h>
 #include <asm/vgtod.h>
 
-/* The asm-generic header needs to be included after the definitions above */
-#include <asm-generic/vdso/vsyscall.h>
-
 #endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/include/asm-generic/vdso/vsyscall.h b/include/asm-generic/vdso/vsyscall.h
deleted file mode 100644
index cfb740e82cb5..000000000000
--- a/include/asm-generic/vdso/vsyscall.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_GENERIC_VSYSCALL_H
-#define __ASM_GENERIC_VSYSCALL_H
-
-#ifndef __ASSEMBLER__
-
-
-#endif /* !__ASSEMBLER__ */
-
-#endif /* __ASM_GENERIC_VSYSCALL_H */

-- 
2.55.0


