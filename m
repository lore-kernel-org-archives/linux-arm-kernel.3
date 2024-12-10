Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8586CE77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 00:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StSb96QxP9/iNWSVkb/5jVIomgW7WStqt28dyYj6iuc=; b=b2AOWCsMULJjm5m+7ShFYdZqUI
	KGWOEOdJgOfzLWu3wP3M5xqXXYZRerv1wZLZvkCXQO79WGLk6HmcJc0oYuN82gMdgt+zMDygbuhNU
	5RM7dVQl9EWNTFEGrbX06cq2PExNEiJPO/X7kXfO7E4DZViQHuD4AihpwBwn+LIPgQKtc6flK0voc
	sm15qUEKHhcHEfNQX4gCJ+OByNbOneieQf/4M8Q3/RQIXTNqC1DFQwQKS49M0QNdaApD3ue2hGDb1
	eawLJr3j7AIBFF8hbbItQFfwnos2gCzbgI/8q7Z1OlZ+mYiTmppj6cp8BKpImHuiHklSrRxDCQ0AT
	XrMZwY+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKo8o-00000009iOR-0MN3;
	Tue, 10 Dec 2024 00:30:18 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnyZ-00000009gVl-10gW;
	Tue, 10 Dec 2024 00:19:44 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-725f4025e25so1077712b3a.1;
        Mon, 09 Dec 2024 16:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733789983; x=1734394783; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StSb96QxP9/iNWSVkb/5jVIomgW7WStqt28dyYj6iuc=;
        b=gQLdugetxjNmDtp/e1/mrZpAGzpuWlgjaaHZ62uS4lswvZd6tB0vZQBNbAR8iu323p
         NALZhLS9bPMUrL9LLvdyvIDwud8oqlQ4dPr6TmgNssL1fYUBIYVgeNsftDWOhApb3b2H
         p/yiFiI9uetTMBUDjJPu8cuxvGWguGzawRsc7gO9WPP8jmLaJgrV2fCsRG2lVbyQF+73
         aB2sYO3kZI233NP2QeWBr+h8s+T8PhkIl7HhjPAKVsvPrvvVIpCRNy79nK1qH4HZpUqT
         N6/7D5fX+33+bC04nmiNpDAmXbQZ4hVgJ2gVk+IvjqmwUoMLezumEIQPxHRFwVLyoYoq
         o0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733789983; x=1734394783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StSb96QxP9/iNWSVkb/5jVIomgW7WStqt28dyYj6iuc=;
        b=drsa2qAC0SbCgBMTp9ATMEfubyRe45SNbEY1Y1atxmRvoJJ9ORnNbrdQQTwQVwv1Gx
         57rNfVQFOApurlWHAqXfTvVoyjYOpnO0P+b/b4qmQ/W62mBz0exI7CCAFvqAD1wnrzHH
         RiouzCs6VTOCJ9+ToWa95nZfO7S4L6qgdLoafsQqS+cgErMHXheHl6j3f3ocNCMd82wT
         +UNg3zf/f+wopq1xZGcZuPa46C+I3kD1ZlcmQUQy2IJUtbWgFIksCWhP7L8fBQtdEPm5
         8+7DBYBDcUtE2H3X5zeoxd0VmnhqQhQHl+TxtNpTI/R5SmFY0KCA+1/+mxGof1N9FWEe
         G3rw==
X-Forwarded-Encrypted: i=1; AJvYcCUY5bqZqmZ03zmQvJo9ETl4/BP7fyGnF8oalE/YMWTFh3l7JFkpN4cxbmfLPQBcXBlTQ5eaWRLsuy1EAWM=@lists.infradead.org, AJvYcCWL9UCZLzswNbs8WeYnR0AEd9zKqjvgL1l7NVprIKuytur/BGJoLPXyr673Xohw9bWeka70gEt7bZC49j5fI+U9@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwckd3xQLLfTF3gjyDwQxgpitu3mPx7qEtpMU5t+pj+9MASW1m
	rKMvDgBBHMvBFY7pWjVHXquqAUT/pGWiINexzOiCR2qmZgS1AC8P
X-Gm-Gg: ASbGnct9Kp07Y4BhZIE8B+guI2pCOQSWP3Epjm74LlTFM8p2O0w1IvVhCbjb5qAYpiu
	G8EEGLgUzDrdDG0VKy5K8vd12Z0UvYVd4YER1Z97WIX4f2kYMmOZTICR3des7FKWmQ10Qu4SkJy
	wdF8DC04O2eJptDA3JHSzBT0Vniwz2GycGKqVuu7EpftGrmjvNqCViHf5BSFk9mbN0JpaGQLec8
	8+VUxfS9Ykx/MfOzPWyv8voBwuEwXE1m95FBwApniecx6wgFzQcfHG4S22Q9NufQOeR4W3oVEcl
	t1HUoQUIxZGH8oKCwF1w9r/YNb8t
X-Google-Smtp-Source: AGHT+IEAyDAPo8at1XMlk9fsI+urdhbvpydHDU/JmlA7KkIMjf5Ed0t5JYgg2Zppc8mo6aYL53N8NA==
X-Received: by 2002:a05:6a00:2ea9:b0:725:b702:af with SMTP id d2e1a72fcca58-725b81b7b57mr24866139b3a.25.1733789982639;
        Mon, 09 Dec 2024 16:19:42 -0800 (PST)
Received: from mew.. (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725f1fba027sm2005005b3a.3.2024.12.09.16.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 16:19:42 -0800 (PST)
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
Subject: [PATCH v1 5/5] rust: Add warn_on and warn_on_once
Date: Tue, 10 Dec 2024 09:18:01 +0900
Message-ID: <20241210001802.228725-6-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210001802.228725-1-fujita.tomonori@gmail.com>
References: <20241210001802.228725-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_161943_282258_84EBD51D 
X-CRM114-Status: GOOD (  17.93  )
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

Add warn_on and warn_on_once macros. Wrapping the C's WARN_* and BUG_*
macros doesn't work so this uses the assembly code exported by the C
side via ARCH_WARN_ASM macro. Like the static branch code, this
generates the assembly code for rust dynamically by using the C
preprocessor.

file()! macro doesn't work for the Rust inline assembly in the same
way as __FILE__ for the C inline assembly. So the code to handle a
file name is different from the C assembly code (similar to the
arm64/loongarch assembly).

ASM_REACHABLE definition works in the same way to get objtool's
reachable asm code. The architectures which use objtool (x86 and
loongarch) needs it.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/Makefile                                 |   8 ++
 rust/kernel/.gitignore                        |   2 +
 rust/kernel/bug.rs                            | 131 ++++++++++++++++++
 rust/kernel/generated_arch_reachable_asm.rs.S |   7 +
 rust/kernel/generated_arch_warn_asm.rs.S      |   7 +
 rust/kernel/lib.rs                            |   1 +
 6 files changed, 156 insertions(+)
 create mode 100644 rust/kernel/bug.rs
 create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
 create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S

diff --git a/rust/Makefile b/rust/Makefile
index 9da9042fd627..80c9c6b3e491 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -37,6 +37,9 @@ obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.o
 obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.o
 
 always-$(subst y,$(CONFIG_RUST),$(CONFIG_JUMP_LABEL)) += kernel/generated_arch_static_branch_asm.rs
+ifndef CONFIG_UML
+always-$(subst y,$(CONFIG_RUST),$(CONFIG_BUG)) += kernel/generated_arch_warn_asm.rs kernel/generated_arch_reachable_asm.rs
+endif
 
 # Avoids running `$(RUSTC)` for the sysroot when it may not be available.
 ifdef CONFIG_RUST
@@ -436,5 +439,10 @@ $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_error.o \
 ifdef CONFIG_JUMP_LABEL
 $(obj)/kernel.o: $(obj)/kernel/generated_arch_static_branch_asm.rs
 endif
+ifndef CONFIG_UML
+ifdef CONFIG_BUG
+$(obj)/kernel.o: $(obj)/kernel/generated_arch_warn_asm.rs $(obj)/kernel/generated_arch_reachable_asm.rs
+endif
+endif
 
 endif # CONFIG_RUST
diff --git a/rust/kernel/.gitignore b/rust/kernel/.gitignore
index 6ba39a178f30..f1d7f4225332 100644
--- a/rust/kernel/.gitignore
+++ b/rust/kernel/.gitignore
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
 /generated_arch_static_branch_asm.rs
+/generated_arch_warn_asm.rs
+/generated_arch_reachable_asm.rs
\ No newline at end of file
diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
new file mode 100644
index 000000000000..8959a2e94971
--- /dev/null
+++ b/rust/kernel/bug.rs
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 FUJITA Tomonori
+
+//! Support for BUG_* and WARN_* functionality.
+//!
+//! C header: [`include/asm-generic/bug.h`](srctree/include/asm-generic/bug.h)
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
+#[cfg(any(target_arch = "x86_64", target_arch = "riscv64"))]
+macro_rules! warn_flags {
+    ($flags:expr) => {
+        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
+        // SAFETY: Just an FFI call.
+        #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
+        unsafe {
+            $crate::asm!(concat!(
+                ".pushsection .rodata.str1.1, \"aMS\",@progbits, 1\n",
+                "111:\t .string ", "\"", file!(), "\"\n",
+                ".popsection\n",
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
+            line = const line!(),
+            flags = const FLAGS,
+            size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
+            );
+        }
+        // SAFETY: Just an FFI call.
+        #[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
+        unsafe {
+            $crate::asm!(
+            concat!(
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
+#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
+#[cfg(any(target_arch = "aarch64", target_arch = "loongarch64"))]
+macro_rules! warn_flags {
+    ($flags:expr) => {
+        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
+        // SAFETY: Just an FFI call.
+        #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
+        unsafe {
+            $crate::asm!(concat!(
+                ".pushsection .rodata.str1.1, \"aMS\",@progbits, 1\n",
+                "111:\t .string ", "\"", file!(), "\"\n",
+                ".popsection\n",
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
+            line = const line!(),
+            flags = const FLAGS,
+            );
+        }
+        // SAFETY: Just an FFI call.
+        #[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
+        unsafe {
+            $crate::asm!(concat!(
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
+            flags = const FLAGS,
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
+                $crate::c_str!(::core::file!()).as_ptr() as *const ::core::ffi::c_char,
+                line!() as i32,
+                $flags as u32,
+                ::core::ptr::null() as *const ::core::ffi::c_char,
+            );
+        }
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
+#[macro_export]
+macro_rules! bugflag_taint {
+    ($taint:expr) => {
+        $taint << 8
+    };
+}
+
+/// Report a warning only once.
+#[macro_export]
+macro_rules! warn_on_once {
+    ($cond:expr) => {
+        if $cond {
+            $crate::warn_flags!(
+                $crate::bindings::BUGFLAG_ONCE
+                    | $crate::bugflag_taint!($crate::bindings::TAINT_WARN)
+            );
+        }
+        $cond
+    };
+}
+
+/// Report a warning.
+#[macro_export]
+macro_rules! warn_on {
+    ($cond:expr) => {
+        if $cond {
+            $crate::warn_flags!($crate::bugflag_taint!($crate::bindings::TAINT_WARN));
+        }
+        $cond
+    };
+}
diff --git a/rust/kernel/generated_arch_reachable_asm.rs.S b/rust/kernel/generated_arch_reachable_asm.rs.S
new file mode 100644
index 000000000000..4e65525e4464
--- /dev/null
+++ b/rust/kernel/generated_arch_reachable_asm.rs.S
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/objtool.h>
+
+// Cut here.
+
+::kernel::concat_literals!(ASM_REACHABLE)
diff --git a/rust/kernel/generated_arch_warn_asm.rs.S b/rust/kernel/generated_arch_warn_asm.rs.S
new file mode 100644
index 000000000000..8f239b431aa4
--- /dev/null
+++ b/rust/kernel/generated_arch_warn_asm.rs.S
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/bug.h>
+
+// Cut here.
+
+::kernel::concat_literals!(ARCH_WARN_ASM("111b", "{line}",  "{flags}", "{size}"))
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index e1065a7551a3..913f3a5b2a98 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -32,6 +32,7 @@
 pub mod alloc;
 #[cfg(CONFIG_BLOCK)]
 pub mod block;
+pub mod bug;
 mod build_assert;
 pub mod cred;
 pub mod device;
-- 
2.43.0


