Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF7BC3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 09:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWwTYv3OuQyqBw6PFnlRc2w3UN+NoCmVRkA1ASlyyn0=; b=j8np4n2Z7DgSyG17qy7anh8ntN
	Wvm4054sNnURjZNv/RU/cEvdgI0sbVfyoe0d9l85Rca0iKOOPEjubKrbBygBGA9V/V5iWxJEZ10RH
	czwI6dh17kUbN8hrAcEDDVOQENF8ii5nrvNJWedOmyjvh2BIBfKcaf/uehc1l2TI1VmyW/55Z3aRT
	FtFFLpnZL/S/tiaOkvy4HuiZjs7tBbpGpy4P3CjConG3DH58e51kgmJHCd4EqCBGrTl8NQczPhQIX
	wS6zXeN7sFdaNsk9h/osLFR6kzSw9l2kQgg3LUrsRhaI/HMcNtI0f1sorZ4fKnypRqo6PigfXb/Yc
	FS46rw/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAn7z-00000001RYp-109S;
	Fri, 02 May 2025 09:56:19 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmz8-00000001Oy5-08uP;
	Fri, 02 May 2025 09:47:11 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2295d78b45cso25133145ad.0;
        Fri, 02 May 2025 02:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746179229; x=1746784029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWwTYv3OuQyqBw6PFnlRc2w3UN+NoCmVRkA1ASlyyn0=;
        b=YzaiYDyfCQnHHHQ55bPN5d6iEFSt4OGlppOt5RjVe/+k+Xc8bGzHxKuNUQyzPhTvjC
         nX1v4VJSkNrPVyrJHmIwMUVgGPzlxgOHF8P+weSfN57jR3hIQxVxhwAXomnD/L1ZPncI
         nQrL8R04uHHGTkDnnlWSpit+dVFfjCYriF2bUN9h/cvVGoG8Hf2pWr1MDWGvyXBY3hnI
         4vNgKAMsfi/yJ3yuhVQNxx6tw/g+TbnCy7kBLXIHFT/fmQfih3GV7H+hJbxie4yzlEEz
         u36cFDyceep5MCxFVzKf/eLgEQLLlwOead0EDmAHYQrdT060bx7JK99+dfQqP9tS3MHj
         kLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746179229; x=1746784029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWwTYv3OuQyqBw6PFnlRc2w3UN+NoCmVRkA1ASlyyn0=;
        b=VilxJRhUsLCWFKtFYqHLPmmiHve9uRn5JAr6v5GwwsNr+8ufIg4ZxAqWpawy3stEEK
         L+COpBrCuhKLba5zMKCzvpCpt4s12eT0+wa2utQQiyFXwB2CUcMwr8XEgwcmrlwDl1Y/
         bCEDaMUP8K/0DfpvxzzGo9+oKhP4Y5RcwbcknAnK3yAPeUJdTgh9xJLaIlGByhnOj/Xc
         shxY+X46NLonBQrU+LLbIhKSu1Z4IJewxBxKtzpoTXMzk6fi39olKLfAHwxbVcrLWnbq
         9GfcltbE0fXwcBR6tTLzbv+S4TmniFIEF2V45vhdTTsVYJCIGWJHVe7mZ+V6sdvVM5Jy
         dnVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCNrEZJMusJtJYWFdPls0xEGpukAslwtmweiiFrJ0lB6w7mv7N7hIMDInEZFZ4WE1UeG4qbmkWeqo9kYU=@lists.infradead.org, AJvYcCXJgHLYKWQBtZpgParbg+gW5nJfXrppXUkEUpHXse34sZRiqrEBLYO003E/eU94RY++Rf3ZBg5Dkwfu6q1JohYO@lists.infradead.org
X-Gm-Message-State: AOJu0YzMqzib/ePMspxZOnIRZPUjz+6S+Tz8WdeRtRpVPo63Cit6X94F
	PbVuz0N7f0spnRv7RVaSWd9Lv7jSCNAhhDkllk+5cogx2a4t3lQL
X-Gm-Gg: ASbGncujsy4KPzybgmSefTNDdLceB1cLa6O7nef5RFfKxQvhvdSKahUyTpSTkkLJd6a
	SPT69Gn6vrrTg6fT/MtBwVwwePMkj04mOHKSTyHyBpdCxrNkNQ/fEmAExjRjX/prH+s313R/pE+
	k8Y5nTmnkx/Wtg72soTvCIChussb1kkhsBmhVgdy7RbqJK4flmBvls9dQK4HOIHTmOaEno6cBcE
	xiyYJGRzPaI+YUchJ4euz030e5Hlx4WCFXOhnVwer1IWr5n8pvCrj6mtU8saWJKz9bXNoQN4Q/9
	QqPWkq13AFH4FKpdO9jlklscoVlM8Hf5jx73F4PSjgVx+oCH0oWL0Mp+AMyfgyV+BDaASy4Brt7
	hH38AQatiQrXk6QYDvg==
X-Google-Smtp-Source: AGHT+IGbwIKmjfJSvIlalpwpU81DyeocVw//dhZVAVqySp6/OCnXJS9YDEVoTaJ2tYPhS7J096/sbA==
X-Received: by 2002:a17:903:40d0:b0:220:c178:b2e with SMTP id d9443c01a7336-22e102c722bmr39746555ad.17.1746179229387;
        Fri, 02 May 2025 02:47:09 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151eb166sm3273565ad.96.2025.05.02.02.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:47:09 -0700 (PDT)
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
	tmgross@umich.edu,
	dakr@kernel.org
Subject: [PATCH v6 4/4] rust: Add warn_on macro
Date: Fri,  2 May 2025 18:45:36 +0900
Message-ID: <20250502094537.231725-5-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502094537.231725-1-fujita.tomonori@gmail.com>
References: <20250502094537.231725-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_024710_091514_4A19A99B 
X-CRM114-Status: GOOD (  20.83  )
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
generate the assembly code; objtool's reachable annotation code. It's
used for only architectures that use objtool.

For now, Loongarch and arm just use a wrapper for WARN macro.

UML doesn't use the assembly BUG/WARN feature; just wrapping generic
BUG/WARN functions implemented in C works.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/Makefile                                 |   8 ++
 rust/helpers/bug.c                            |   5 +
 rust/kernel/.gitignore                        |   2 +
 rust/kernel/bug.rs                            | 125 ++++++++++++++++++
 rust/kernel/generated_arch_reachable_asm.rs.S |   7 +
 rust/kernel/generated_arch_warn_asm.rs.S      |   7 +
 rust/kernel/lib.rs                            |   1 +
 7 files changed, 155 insertions(+)
 create mode 100644 rust/kernel/bug.rs
 create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
 create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S

diff --git a/rust/Makefile b/rust/Makefile
index 3aca903a7d08..0b795cf05a34 100644
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
@@ -536,5 +539,10 @@ $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_error.o $(obj)/pin_init.o \
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
index 000000000000..1191391eb2cb
--- /dev/null
+++ b/rust/kernel/bug.rs
@@ -0,0 +1,125 @@
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
+#[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
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
+
+        // SAFETY:
+        // - `file`, `line`, `flags`, and `size` are all compile-time constants or
+        // symbols, preventing any invalid memory access.
+        // - The asm block has no side effects and does not modify any registers
+        // or memory. It is purely for embedding metadata into the ELF section.
+        unsafe {
+            $crate::asm!(
+                concat!(
+                    "/* {size} */",
+                    include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
+                    include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
+                file = sym FILE,
+                line = const line!(),
+                flags = const FLAGS,
+                size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
+            );
+        }
+    }
+}
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
+#[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
+macro_rules! warn_flags {
+    ($flags:expr) => {
+        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
+
+        // SAFETY:
+        // - `flags` and `size` are all compile-time constants, preventing
+        // any invalid memory access.
+        // - The asm block has no side effects and does not modify any registers
+        // or memory. It is purely for embedding metadata into the ELF section.
+        unsafe {
+            $crate::asm!(
+                concat!(
+                    "/* {size} */",
+                    include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
+                    include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
+                flags = const FLAGS,
+                size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
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
+        // SAFETY: It is always safe to call `warn_slowpath_fmt()`
+        // with a valid null-terminated string.
+        unsafe {
+            $crate::bindings::warn_slowpath_fmt(
+                $crate::c_str!(::core::file!()).as_ptr() as *const $crate::ffi::c_char,
+                line!() as i32,
+                $flags as u32,
+                ::core::ptr::null() as *const $crate::ffi::c_char,
+            );
+        }
+    };
+}
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(all(CONFIG_BUG, any(CONFIG_LOONGARCH, CONFIG_ARM)))]
+macro_rules! warn_flags {
+    ($flags:expr) => {
+        // SAFETY: It is always safe to call `WARN_ON()`.
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
index de07aadd1ff5..bc13e92bdb1e 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -40,6 +40,7 @@
 pub mod alloc;
 #[cfg(CONFIG_BLOCK)]
 pub mod block;
+pub mod bug;
 #[doc(hidden)]
 pub mod build_assert;
 pub mod cred;
-- 
2.43.0


