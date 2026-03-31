Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C774FF60DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 07:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwY78gYNpf388OFjzzX16QE/Cco/4CSsRPLh29K8HMo=; b=e576nc62Q+iyfFJHn0fKNo+TEt
	fg87ao/70WRLpj+e/Xwg53UXc8uMMnTQirhBRGoPe5GKmPe8dheSDkL8+NnVDuadfo6ATKRIg6Alq
	SiCZiXXHZesvj/M3V86v3ziwuy122wS6GxIGOCqXc9Q2T5YN86l8xai8OTwAcR95cQFzBM8MavOEF
	8x7jjXhhYcP0Zzd/JE7YE8At4TraL3yi10clrCQvUWR22JQkoQ1IEz1c0CO/FCWW3wsS4V5qRRBVv
	QSD06KsYeBuvfKQV4mb3G6oY6KpRo0PWTBx+R0pXXUXBiKiaN/jWlJoPmEXVMr8mEllTpGTS0ue4T
	R8Aj4gHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TrO-0000000CWRJ-1Wv9;
	Tue, 31 Mar 2026 07:50:02 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TrG-0000000CWNv-3sAt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 07:49:56 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b9417a552d0so728128066b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 00:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774943392; x=1775548192; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nwY78gYNpf388OFjzzX16QE/Cco/4CSsRPLh29K8HMo=;
        b=sm5h5HvQJz0ufwrjwNyRwdmdHypNOk8TGS7dqEN3TqmGqWfbq4wIYoSfV5vr873MXx
         sGoNhUwbFSWyIPq2U9mHbCkbFeCE0+crk0RsGG01m1H0SXN7+D1IOB7uH9KZYsmqOtyK
         fqz424VIsTYRDVMe5Wop9ousALiPAW09FaC2GeB8cobf/2INzy1APuh0O7rI1jG8yXe3
         aozX19xKd4XM3O+oLnRSWZmXMO46coSsTf/CVfW4cemxDtk94+hRP9J1KDUjl7IcioqX
         qml3yDsP+IT9UKwHM+UmNw9kBhgxnu2ceSO2BRNVhtBjaOkSGLAl2F95yJ5U6PfPkhp1
         Pc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774943392; x=1775548192;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nwY78gYNpf388OFjzzX16QE/Cco/4CSsRPLh29K8HMo=;
        b=tOgv237BLWCikH754QgYWY3bTbdZ8fKevRJCxqdZvpdbliOEMfVglY2oWAqxywSzIf
         x4q1LVs1U4vilr0E6KraQIidlmQT6byX4N+Q3uL8hB22YFxoMsX0HGRoLYmCinQxKR5h
         wuMSmUNSwU1lvpKt/g6DPbZ1rxCZZsGnde1JpNyaofbIHvNRtQzXyyj2qcr5kcJNHwsv
         Cy7/mig4TnsKQuMy/3vwIJytTReXZ3D/7fl3QKlSrphycKm95ZMNafg1++H3/Zy7Zqlu
         57TQD4WctB/Gj5diacxgYSmKHkVFlRnCLJgc2cunPBaa7UiA48wlHmaPdMPJLOMp65Uv
         DLHA==
X-Gm-Message-State: AOJu0YzHbLsHzH+rQartML6+tnCKcowkJs+2/b53s78GbnR4ABBqEiVx
	gugvTsFFzU7fIIVv5tZqRb9yBqT2pGu8myunpXsK+/wuFtkHBy49Fkf96yUuQx6/xKI7rLra4g=
	=
X-Received: from ejcho13.prod.google.com ([2002:a17:907:e8d:b0:b97:a2a0:2673])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:9c07:b0:b9b:308f:d9ad
 with SMTP id a640c23a62f3a-b9b502e30edmr912242166b.19.1774943392226; Tue, 31
 Mar 2026 00:49:52 -0700 (PDT)
Date: Tue, 31 Mar 2026 09:49:41 +0200
In-Reply-To: <20260331074940.55502-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20260331074940.55502-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3550; i=ardb@kernel.org;
 h=from:subject; bh=IgBoKSALuAo6iW9gXWXETgLj0vEk1rAPv2EwB03g89w=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfN0zTQhxS3vnuW3bfz4+NKZHz95fGQ3zlz+crtQ6PXVt
 9+eOnHzZEcpC4MYF4OsmCKLwOy/73aenihV6zxLFmYOKxPIEAYuTgGYiIMfI8ODrReceheJnAvO
 SOe+VX/iwLpP8r7uF9f+me/wOETkTegXRobW5Ztc5//K2x7vPv1kZjNfnP52id8/mmcxtHIWv89 MmcYEAA==
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260331074940.55502-8-ardb+git@google.com>
Subject: [PATCH v2 1/5] ARM: Add a neon-intrinsics.h header like on arm64
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-raid@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_004954_970901_26FE2C4F 
X-CRM114-Status: GOOD (  19.69  )
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
 arch/arm/include/asm/neon-intrinsics.h      | 64 ++++++++++++++++++++
 2 files changed, 67 insertions(+), 1 deletion(-)

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
index 000000000000..3fe0b5ab9659
--- /dev/null
+++ b/arch/arm/include/asm/neon-intrinsics.h
@@ -0,0 +1,64 @@
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
+#ifdef CONFIG_CC_IS_CLANG
+#pragma clang diagnostic ignored "-Wincompatible-pointer-types"
+#endif
+
+#endif /* __ASM_NEON_INTRINSICS_H */
-- 
2.53.0.1018.g2bb0e51243-goog


