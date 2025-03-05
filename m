Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566A4C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZIVwfRNHK6kNeOdoFYJVwWZHHm2mKiUA2qVfu9IUvI=; b=Jyw6LTHOGlYnOHA9Ubi5OQ571T
	r+JXegJUiVFc7tgxABCtCSXlSra3qSnZblXGItIiWr3b2FzgTsPYz6hB4hb26RWIkIYXx7LUXqJW3
	wyPtyPCQO4jISAdldfh65dw3QnCIzAqZdfdOrC9robMZoeSs8f9z1fMT7tkPJOaEl13tjR5dRdb8g
	zpsTamQGpwYErhwAy12F/LieXi+yd9B+IHqi0ztQEE0pDMNO6GMibPqwnlGS/RR56MgVkM9t/b9MJ
	BDtNkHhgjCKg/Vs7CVfQEbsi+xFZ/ftQso8NJ2C1f2oCgo1mVS/BHQFxcQPQQHtyTbIV4UF/n9HFi
	JfSPs6RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnXE-00000007xMC-0gvY;
	Wed, 05 Mar 2025 12:07:36 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpme1-00000007oWY-1wUG;
	Wed, 05 Mar 2025 11:10:35 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2feb9078888so11197059a91.3;
        Wed, 05 Mar 2025 03:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741173033; x=1741777833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZIVwfRNHK6kNeOdoFYJVwWZHHm2mKiUA2qVfu9IUvI=;
        b=E4dinUff6K6uqQBwxTYWW4Yi0MgDSU3rKqN7t8mFgrCR/HBrzYcaSLgL3KJUmo4V1x
         rsVWsQYEWXxn2ad0Q/MEKR9aDBsYLbeB8Wf4naC1dqwgpF4rxmYXdVZPhDSroIXfjLj3
         Kj1lTMFgfRR410uU4p3OUEcss3E8LP4CKmVQBbcyzgFY759CCY/oI43V/Hkvb9VTLF/L
         rMASMscmQ23ZcsrPimEsVJF3e1HA3EZkDgjcvFNMNGH2OH5i8v2daDwzvHM0bRaohfi9
         vg95ZZao5Vkz+zypLlXUzeKYSEU447WbuEFQQaLhQbx/piCzA8BU5kE+FXMqFJWVX7+y
         HQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741173033; x=1741777833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZIVwfRNHK6kNeOdoFYJVwWZHHm2mKiUA2qVfu9IUvI=;
        b=ibZbl4oVdgNcwa7mOwupnjd5rRLjIoLsUAoVkpx6e/3fTOji7pPhZmNrOCiPVAPNy1
         WxRaUJoaFWSjWddZbwN4Exe4vPoVpB7whu12dI3JoybLokdEgbry/zpZEeXOge2QKzcP
         ZP5Kw2Z106uuDL/RAo7i/qLqkPj6WMS7hEC4zkVcDdc+kixX+HWnSrzHKjFIqBwjXn0k
         ZC2ljJlw0phab4ad8uvVR84TZ3m6L9VRKErETgumf7PiJo9SQJq647nd8D1MJOk2nyjO
         KOZuJ7vQqS8ZJFBCDTXCo2VBk+Af580+lQhLhIF3jS/khFbdmf6fxpLlb7UcqqZsK4UH
         umcg==
X-Forwarded-Encrypted: i=1; AJvYcCXG61HLWMelxC1jhW8iKaMt9qvymL1Z+8/1D9bekI+uBGMlPl5fZ4m1Nu3Vsdw4rs/+J3Y+TOzSLqoraJU8xDtY@lists.infradead.org, AJvYcCXwuephuRy8tYmfbnmp2xlA/W9TIvAgJK3mz+TR7niOIidLaChb+vXPXemmVI+mYyjIb/PTk5d+TaIzV18=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPk912oTAiQDx1VL3Vddto6qUKKfMoilE/sNmZvpEHgOojQFPZ
	CNG2DAVr8CPs2o8D+0p2TrcWsWDnTPiuNwZxjAv8unH8/jIwP15D
X-Gm-Gg: ASbGncuMNIzo8P5CEv3YN5EPJxWMc9nOY6NqLYRjcRo9+Z7yAhWltTbnTf0OHXd+tIU
	3iMevOyaQ+idqXAp5kobvDqTrFJOge3UYepeMmHX9KGQfS3bm0fCq5zENL0hSY2/+ITjBeV/kHv
	Dt9rD5xAGDbzjmyHOl3kpeqNvvytuiy/LcxJBMaTDeV2WXYZedIiSBnhRDc+Yhdopnc7TISTHtc
	EKOWlAuyWeRuXqego1HAHN3uq/QgyTnbkYqVjzExrhu/tlG0BiBSqJfDGP68uDpgXWmEP5a97/U
	0xZUNnjKCHNSZknNQBD+DwdJx86SaASHUaCayjqSxXq0OogANjl8Y6SFGApyad8bqaZ7b1YOm8S
	9HUMqA7xBNyP+Fv+4ewJKJA==
X-Google-Smtp-Source: AGHT+IEVpBJoZMey/oq7KQx8VoCm5/CPecSnmaQRffQchUbmPSyo23fN5Nngz82dlmdkqtYGVJHxoA==
X-Received: by 2002:a17:90a:d648:b0:2f8:49ad:4079 with SMTP id 98e67ed59e1d1-2ff4978a5efmr4417181a91.6.1741173032744;
        Wed, 05 Mar 2025 03:10:32 -0800 (PST)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e7737a5sm1060925a91.13.2025.03.05.03.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 03:10:32 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	peterz@infradead.org,
	hpa@zytor.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tangyouling@loongson.cn,
	hejinyang@loongson.cn,
	yangtiezhu@loongson.cn,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Subject: [PATCH v4 4/4] rust: Add warn_on macro
Date: Wed,  5 Mar 2025 20:08:14 +0900
Message-ID: <20250305110814.272792-5-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305110814.272792-1-fujita.tomonori@gmail.com>
References: <20250305110814.272792-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_031033_507646_C99AFFCD 
X-CRM114-Status: GOOD (  18.84  )
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

Add warn_on macro, uses the BUG/WARN feature (lib/bug.c) via assembly
for x86_64/arm64/riscv.

The current Rust code simply wraps BUG() macro but doesn't provide the
proper debug information. The BUG/WARN feature can only be used from
assembly.

This uses the assembly code exported by the C side via ARCH_WARN_ASM
macro. To avoid duplicating the assembly code, this approach follows
the same strategy as the static branch code: it generates the assembly
code for Rust using the C preprocessor at compile time.

Similarly, ARCH_WARN_REACHABLE is also used at compile time to
generate the assembly code; objtool's reachable anotation code. It's
used for only architectures that use objtool.

For now, Loongarch just uses a wrapper for WARN macro.

UML doesn't use the assembly BUG/WARN feature; just wrapping generic
BUG/WARN functions implemented in C works.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/Makefile                                 |   8 ++
 rust/helpers/bug.c                            |   5 +
 rust/kernel/.gitignore                        |   2 +
 rust/kernel/bug.rs                            | 113 ++++++++++++++++++
 rust/kernel/generated_arch_reachable_asm.rs.S |   7 ++
 rust/kernel/generated_arch_warn_asm.rs.S      |   7 ++
 rust/kernel/lib.rs                            |   1 +
 7 files changed, 143 insertions(+)
 create mode 100644 rust/kernel/bug.rs
 create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
 create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S

diff --git a/rust/Makefile b/rust/Makefile
index 8fcfd60447bc..a295b65c43f3 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -34,6 +34,9 @@ obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.o
 obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.o
 
 always-$(subst y,$(CONFIG_RUST),$(CONFIG_JUMP_LABEL)) += kernel/generated_arch_static_branch_asm.rs
+ifndef CONFIG_UML
+always-$(subst y,$(CONFIG_RUST),$(CONFIG_BUG)) += kernel/generated_arch_warn_asm.rs kernel/generated_arch_reachable_asm.rs
+endif
 
 # Avoids running `$(RUSTC)` when it may not be available.
 ifdef CONFIG_RUST
@@ -481,5 +484,10 @@ $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_error.o \
 ifdef CONFIG_JUMP_LABEL
 $(obj)/kernel.o: $(obj)/kernel/generated_arch_static_branch_asm.rs
 endif
+ifndef CONFIG_UML
+ifdef CONFIG_BUG
+$(obj)/kernel.o: $(obj)/kernel/generated_arch_warn_asm.rs $(obj)/kernel/generated_arch_reachable_asm.rs
+endif
+endif
 
 endif # CONFIG_RUST
diff --git a/rust/helpers/bug.c b/rust/helpers/bug.c
index e2d13babc737..a62c96f507d1 100644
--- a/rust/helpers/bug.c
+++ b/rust/helpers/bug.c
@@ -6,3 +6,8 @@ __noreturn void rust_helper_BUG(void)
 {
 	BUG();
 }
+
+bool rust_helper_WARN_ON(bool cond)
+{
+	return WARN_ON(cond);
+}
diff --git a/rust/kernel/.gitignore b/rust/kernel/.gitignore
index 6ba39a178f30..f636ad95aaf3 100644
--- a/rust/kernel/.gitignore
+++ b/rust/kernel/.gitignore
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
 /generated_arch_static_branch_asm.rs
+/generated_arch_warn_asm.rs
+/generated_arch_reachable_asm.rs
diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
new file mode 100644
index 000000000000..a010033be5a2
--- /dev/null
+++ b/rust/kernel/bug.rs
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024, 2025 FUJITA Tomonori <fujita.tomonori@gmail.com>
+
+//! Support for BUG and WARN functionality.
+//!
+//! C header: [`include/asm-generic/bug.h`](srctree/include/asm-generic/bug.h)
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH)))]
+#[cfg(CONFIG_DEBUG_BUGVERBOSE)]
+macro_rules! warn_flags {
+    ($flags:expr) => {
+        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
+        const _FILE: &[u8] = file!().as_bytes();
+        // Plus one for null-terminator.
+        static FILE: [u8; _FILE.len() + 1] = {
+            let mut bytes = [0; _FILE.len() + 1];
+            let mut i = 0;
+            while i < _FILE.len() {
+                bytes[i] = _FILE[i];
+                i += 1;
+            }
+            bytes
+        };
+        // SAFETY: Just an FFI call.
+        unsafe {
+            $crate::asm!(concat!(
+                "/* {size} */",
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
+            file = sym FILE,
+            line = const line!(),
+            flags = const FLAGS,
+            size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
+            );
+        }
+    }
+}
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH)))]
+#[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
+macro_rules! warn_flags {
+    ($flags:expr) => {
+        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
+        // SAFETY: Just an FFI call.
+        unsafe {
+            $crate::asm!(
+            concat!(
+                "/* {size} */",
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
+            flags = const FLAGS,
+            size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
+            );
+        }
+    }
+}
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(all(CONFIG_BUG, CONFIG_UML))]
+macro_rules! warn_flags {
+    ($flags:expr) => {
+        // SAFETY: Just an FFI call.
+        unsafe {
+            $crate::bindings::warn_slowpath_fmt(
+                $crate::c_str!(::core::file!()).as_ptr() as *const ::core::ffi::c_uchar,
+                line!() as i32,
+                $flags as u32,
+                ::core::ptr::null() as *const ::core::ffi::c_uchar,
+            );
+        }
+    };
+}
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(all(CONFIG_BUG, CONFIG_LOONGARCH))]
+macro_rules! warn_flags {
+    ($flags:expr) => {
+        // SAFETY: Just an FFI call.
+        unsafe { $crate::bindings::WARN_ON(true) }
+    };
+}
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(not(CONFIG_BUG))]
+macro_rules! warn_flags {
+    ($flags:expr) => {};
+}
+
+#[doc(hidden)]
+pub const fn bugflag_taint(value: u32) -> u32 {
+    value << 8
+}
+
+/// Report a warning if `cond` is true and return the condition's evaluation result.
+#[macro_export]
+macro_rules! warn_on {
+    ($cond:expr) => {{
+        if $cond {
+            const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
+
+            $crate::warn_flags!(WARN_ON_FLAGS);
+        }
+        $cond
+    }};
+}
diff --git a/rust/kernel/generated_arch_reachable_asm.rs.S b/rust/kernel/generated_arch_reachable_asm.rs.S
new file mode 100644
index 000000000000..3886a9ad3a99
--- /dev/null
+++ b/rust/kernel/generated_arch_reachable_asm.rs.S
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/bug.h>
+
+// Cut here.
+
+::kernel::concat_literals!(ARCH_WARN_REACHABLE)
diff --git a/rust/kernel/generated_arch_warn_asm.rs.S b/rust/kernel/generated_arch_warn_asm.rs.S
new file mode 100644
index 000000000000..409eb4c2d3a1
--- /dev/null
+++ b/rust/kernel/generated_arch_warn_asm.rs.S
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/bug.h>
+
+// Cut here.
+
+::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}",  "{flags}", "{size}"))
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 496ed32b0911..c0720846b249 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -38,6 +38,7 @@
 pub mod alloc;
 #[cfg(CONFIG_BLOCK)]
 pub mod block;
+pub mod bug;
 #[doc(hidden)]
 pub mod build_assert;
 pub mod cred;
-- 
2.43.0


