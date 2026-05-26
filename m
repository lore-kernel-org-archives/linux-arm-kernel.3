Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A5DCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 11:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQMyTBmvjiPpeVX4Cyb/CofbNEVWc3TSovYmGaEoLwc=; b=NZIyDPedTPMtm5AoJBASAGZOCb
	dnN/anDD/mBhNJxyNrZ9KJYMw6fDeeoSZALba3MxS/dIyk0wjedfCjwzJ3JzyAWFxcPhkT7z32z5I
	LxAW6J3JVBYq2lE9I0VRyn1NErDTGO5D5fz37+MJ4v18b91rfXVlt+s8DlTy7tQqU59rqMxVoV8QL
	Owl27GdYsm0nk3MeWsN7MQGu0nNcE5tMGmoDtS9CZ4fSjBMC67rCVJsA5bQviv6D6HsqGGMTGibwh
	WADLZfDylyEpO7sdzs1VdY645JWO87K3VvXzvHoj1HOdrx59D0CTTlL8TwzmLF8zeI2U8dbIrTMDA
	bwvvoIyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpma-00000001kAP-3tCy;
	Tue, 26 May 2026 11:17:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpmR-00000001k7X-3XSD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 11:17:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2E0D16F2;
	Tue, 26 May 2026 04:16:57 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E94E83F7D8;
	Tue, 26 May 2026 04:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779794222; bh=guqrDTBg9L+rMmzwHLEGhZCrOb5ASxmVe+Yvhw85EsE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mgXyVOhPh5Ym8PaAy/kc/vKjTdJycVt1gR+XQakLOLXLXMPMA9SKf4u2j9sYFRd9i
	 aOEwPgI21nLFRvV6Ia0IoxWtjQG+Vens5CoW5haUDSrRhdGKh1VzI03uWp9YRrz/fh
	 gqptUhdgLtjrDdzyHwRLzOxfYrR8cC3/jIKaYTBs=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Tue, 26 May 2026 12:15:50 +0100
Subject: [PATCH RFC v8 01/24] mm: Introduce kpkeys
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-kpkeys-v8-1-eaaacdacc67c@arm.com>
References: <20260526-kpkeys-v8-0-eaaacdacc67c@arm.com>
In-Reply-To: <20260526-kpkeys-v8-0-eaaacdacc67c@arm.com>
To: linux-hardening@vger.kernel.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, 
 Ira Weiny <ira.weiny@intel.com>, Jann Horn <jannh@google.com>, 
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>, 
 Kees Cook <kees@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Matthew Wilcox <willy@infradead.org>, Maxwell Bland <mbland@motorola.com>, 
 "Mike Rapoport (IBM)" <rppt@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Pierre Langlois <pierre.langlois@arm.com>, 
 Quentin Perret <qperret@google.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-mm@kvack.org, x86@kernel.org, Lorenzo Stoakes <ljs@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779794211; l=6647;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=guqrDTBg9L+rMmzwHLEGhZCrOb5ASxmVe+Yvhw85EsE=;
 b=oPJXA+ORDOej1DfFtYeT+KvUWZRlr0MxVa1EQKUPKgt4IXJnjaOVA4turG7Yc1iDLet8vQuRs
 viYfkErkNpxDLE0InZj9u2G7iaznYEJvG8TQ3z7WrySKrLaXBYgqDXT
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_041703_979675_B4E7A4EC 
X-CRM114-Status: GOOD (  24.05  )
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

kpkeys is a simple framework to enable the use of protection keys
(pkeys) to harden the kernel itself. This patch introduces the basic
API in <linux/kpkeys.h>: a couple of functions to set and restore
the pkey register and macros to define guard objects.

kpkeys introduces a new concept on top of pkeys: the kpkeys context.
Each context is associated to a set of permissions for the pkeys
managed by the kpkeys framework. kpkeys_set_context(ctx) sets those
permissions according to ctx, and returns the original pkey
register, to be later restored by kpkeys_restore_pkey_reg(). To
start with, only KPKEYS_CTX_DEFAULT is available, which is meant to
grant RW access to KPKEYS_PKEY_DEFAULT (i.e. all memory since this
is the only available pkey for now).

Because each architecture implementing pkeys uses a different
representation for the pkey register, and may reserve certain pkeys
for specific uses, support for kpkeys must be explicitly indicated
by selecting ARCH_HAS_KPKEYS and defining the following functions in
<asm/kpkeys.h>, in addition to the macros provided in
<asm-generic/kpkeys.h>:

- arch_kpkeys_set_context()
- arch_kpkeys_restore_pkey_reg()
- arch_supports_kpkeys()

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/asm-generic/kpkeys.h |  17 ++++++
 include/linux/kpkeys.h       | 122 +++++++++++++++++++++++++++++++++++++++++++
 mm/Kconfig                   |   2 +
 3 files changed, 141 insertions(+)

diff --git a/include/asm-generic/kpkeys.h b/include/asm-generic/kpkeys.h
new file mode 100644
index 000000000000..ab819f157d6a
--- /dev/null
+++ b/include/asm-generic/kpkeys.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_KPKEYS_H
+#define __ASM_GENERIC_KPKEYS_H
+
+#ifndef KPKEYS_PKEY_DEFAULT
+#define KPKEYS_PKEY_DEFAULT	0
+#endif
+
+/*
+ * Represents a pkey register value that cannot be used, typically disabling
+ * access to all keys.
+ */
+#ifndef KPKEYS_PKEY_REG_INVAL
+#define KPKEYS_PKEY_REG_INVAL	0
+#endif
+
+#endif	/* __ASM_GENERIC_KPKEYS_H */
diff --git a/include/linux/kpkeys.h b/include/linux/kpkeys.h
new file mode 100644
index 000000000000..0ce0db80b4ee
--- /dev/null
+++ b/include/linux/kpkeys.h
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _LINUX_KPKEYS_H
+#define _LINUX_KPKEYS_H
+
+#include <linux/bug.h>
+#include <linux/cleanup.h>
+
+#define KPKEYS_CTX_DEFAULT	0
+
+#define KPKEYS_CTX_MIN		KPKEYS_CTX_DEFAULT
+#define KPKEYS_CTX_MAX		KPKEYS_CTX_DEFAULT
+
+/*
+ * ... is used to discard extra arguments - this allows users of this macro
+ * to have set_arg default to void.
+ */
+#define __KPKEYS_GUARD(name, set_context, restore_pkey_reg, set_arg, ...) \
+	__DEFINE_CLASS_IS_CONDITIONAL(name, false);			\
+	DEFINE_CLASS(name, u64,						\
+		     restore_pkey_reg, set_context, set_arg);		\
+	static inline void *class_##name##_lock_ptr(u64 *_T)		\
+	{ return _T; }
+
+/**
+ * KPKEYS_GUARD_NOOP() - define a guard type that does nothing
+ * @name: the name of the guard type
+ * @cond_arg: an argument specification (optional)
+ *
+ * Define a guard type that does nothing, useful to match a real guard type
+ * that is defined under an #ifdef. @cond_arg may optionally be passed to match
+ * a guard defined using KPKEYS_GUARD_COND().
+ */
+#define KPKEYS_GUARD_NOOP(name, ...)					\
+	__KPKEYS_GUARD(name, 0, (void)_T, ##__VA_ARGS__, void)
+
+#ifdef CONFIG_ARCH_HAS_KPKEYS
+
+#include <asm/kpkeys.h>
+
+/**
+ * KPKEYS_GUARD_COND() - define a guard type that conditionally switches to
+ *                       a given kpkeys context
+ * @name: the name of the guard type
+ * @ctx: the kpkeys context to switch to
+ * @cond: an expression that is evaluated as condition
+ * @cond_arg: an argument specification for the condition (optional)
+ *
+ * Define a guard type that switches to @ctx if @cond evaluates to true,
+ * and does nothing otherwise. @cond_arg may be specified to give access to a
+ * caller-defined argument to @cond.
+ */
+#define KPKEYS_GUARD_COND(name, ctx, cond, ...)				\
+	__KPKEYS_GUARD(name,						\
+		       (cond) ? kpkeys_set_context(ctx)			\
+			      : KPKEYS_PKEY_REG_INVAL,			\
+		       kpkeys_restore_pkey_reg(_T),			\
+		       ##__VA_ARGS__, void)
+
+/**
+ * KPKEYS_GUARD() - define a guard type that switches to a given kpkeys context
+ *                  if kpkeys are enabled
+ * @name: the name of the guard type
+ * @ctx: the kpkeys context to switch to
+ *
+ * Define a guard type that switches to @ctx if the system supports kpkeys.
+ */
+#define KPKEYS_GUARD(name, ctx)						\
+	KPKEYS_GUARD_COND(name, ctx, kpkeys_enabled())
+
+/**
+ * kpkeys_set_context() - switch kpkeys context
+ * @ctx: the context to switch to
+ *
+ * Switches to specified kpkeys context. @ctx must be a compile-time
+ * constant. The arch-specific pkey register will be updated accordingly, and
+ * the original value returned.
+ *
+ * Return: the original pkey register value if the register was written to, or
+ *         KPKEYS_PKEY_REG_INVAL otherwise (no write to the register was
+ *         required).
+ */
+static __always_inline u64 kpkeys_set_context(int ctx)
+{
+	BUILD_BUG_ON_MSG(!__builtin_constant_p(ctx),
+			 "kpkeys_set_context() only takes constant values");
+	BUILD_BUG_ON_MSG(ctx < KPKEYS_CTX_MIN || ctx > KPKEYS_CTX_MAX,
+			 "Invalid value passed to kpkeys_set_context()");
+
+	return arch_kpkeys_set_context(ctx);
+}
+
+/**
+ * kpkeys_restore_pkey_reg() - restores a pkey register value
+ * @pkey_reg: the pkey register value to restore
+ *
+ * This function is meant to be passed the value returned by
+ * kpkeys_set_context(), in order to restore the pkey register to its original
+ * value (thus restoring the original kpkeys context).
+ */
+static __always_inline void kpkeys_restore_pkey_reg(u64 pkey_reg)
+{
+	if (pkey_reg != KPKEYS_PKEY_REG_INVAL)
+		arch_kpkeys_restore_pkey_reg(pkey_reg);
+}
+
+static inline bool kpkeys_enabled(void)
+{
+	return arch_supports_kpkeys();
+}
+
+#else /* CONFIG_ARCH_HAS_KPKEYS */
+
+#include <asm-generic/kpkeys.h>
+
+static inline bool kpkeys_enabled(void)
+{
+	return false;
+}
+
+#endif /* CONFIG_ARCH_HAS_KPKEYS */
+
+#endif /* _LINUX_KPKEYS_H */
diff --git a/mm/Kconfig b/mm/Kconfig
index e8bf1e9e6ad9..819fb0d7b7bd 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1242,6 +1242,8 @@ config ARCH_USES_HIGH_VMA_FLAGS
 	bool
 config ARCH_HAS_PKEYS
 	bool
+config ARCH_HAS_KPKEYS
+	bool
 
 config ARCH_USES_PG_ARCH_2
 	bool

-- 
2.51.2


