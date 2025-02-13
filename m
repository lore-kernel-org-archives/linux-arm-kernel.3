Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E032C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wwu/OQkpfuP5TP6urM50yolt8MlR74sxECkYt+Uf2k8=; b=J5hWcNeE6MeNBWrkdP3rUARsSX
	Sk8dETwJw/8TDtaINLQmZUU8gttQDp6zRoJAysf9DLWreEKxBSrzlRrC3QDUKVSzpdBRtenRe2Nhe
	dsBqRtcI9cLcyNV6/kxj4zvqTwuNgiAvtTj89lZN/KNKF42E0MPX4Kv3I3TaEq4yai1VRGhMuBOp8
	vcJpWcmz8xYYx6llwxrlAFBMhPFJgyccdZKWyrAIegSpdVmWSSlZa0Ugl5u6zVigiFTprhCZAJ/N4
	b7jVFKxXjQwt+5ESW5WhLvc5Z7Hqhj4qqiJNxFbICkbYsyCvPGE+eCEomTbxGaitQofNNiFH2btZS
	eyjrZ6dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaIJ-0000000BL1E-0XaT;
	Thu, 13 Feb 2025 14:34:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZmP-0000000BF3n-2Uew;
	Thu, 13 Feb 2025 14:01:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wwu/OQkpfuP5TP6urM50yolt8MlR74sxECkYt+Uf2k8=; b=OZvlToGa3Gjb5PHLfnoc6Wx6Qd
	UY4QmgLraCkMwnkQK9IBuFaylPHWmvVFYok4Sg10dTBL0OYaWkSofUg1kJ1jhiKOwU8K1c7YbiUY+
	BDhy+QhPVFTKy7PoT3PTgQfmedS4JGhybrACVNvop6uRUooMmYT07ArsILJzFOLFI2HjrV0zWbWNh
	lp5+L2E5TyaOFaA1d9cHvc682oX/eeBWerGwovJhqvbp6lTGLA9ID6eDlNH+Lq6Dl4W6IA48zysW/
	bcxQWaDZV3l/p6+7VJS+vqvcms98D9lqaX4+J7g/J+yJOpLnTFu2QVbV78mK8FHyT0ESO764+P2FY
	U4nSMt3w==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZmM-000000010vr-2s17;
	Thu, 13 Feb 2025 14:01:24 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21f48ebaadfso17280925ad.2;
        Thu, 13 Feb 2025 06:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739455280; x=1740060080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwu/OQkpfuP5TP6urM50yolt8MlR74sxECkYt+Uf2k8=;
        b=AeGVt+hVtU7YiyDk4U8NvqzNj4wKDHVBGBzQWaqwM4aAyd/laEVK56WqxXkVE0f7Yb
         UL2JLn1Ef5EMQWtCULsuxtu0w8Sftfp27uwriWVQa6A7cqb2C8PmZeZSx+SQPAixCePy
         4+U6tKO98jMjGoBLm8oI6JIFTE7LxaF+H8lWTBkTjzo91sDn+5FFXchvlGU/n57BrXlI
         sbaiRW5o2FkVfl8StLeLDOI5qhwk1lkMi+rm5D1CsBafSWQL7sBmlaVDECU/IaW/G974
         Ddj/8KMCDSUN9KInkS0nI6qPv2o7BJLIKyvuRmRgAZxtprd0i1+qI/zqrTtPlDG6p7qD
         mr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739455280; x=1740060080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwu/OQkpfuP5TP6urM50yolt8MlR74sxECkYt+Uf2k8=;
        b=WskT/E0HPpG/S+SaG+nX2cMf9x0svMxlO0yY/XNe6V6qJZd2mWrUBaqGpCWZ+Wv3nX
         QpfiYBraeS4hAVcR5CE3zxQBsJ22YRjTS4sdCm/zt68E0gNr0aJHuY+geqxECPX+nZTy
         f/D6IBtRSNnIPmBEUWogt1ChjqmxgmH9xJ2UpEFzjN+lddASWIxLFg+kWr2OPi/3QRVK
         OoAqSoETZnQkQj9PfmNgpJeB5uLOYVufHEqrPD8j4vWy04hw5+6G+NgSxI1+SWj5tCf7
         FBmnUKbwk122tDlLk7jdMXQgn/SabIKy0ot4prgRZ2BEvKYerJTW71KsIwhIYggCptU+
         j5zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIEKfQvn/xP4KTVFr2h3OLWy2ql3VHXgFCnwLRkwFy3yMvjZQ87/omDX22pubLLYcIlVwpXqJBF6Z5R+zs3997@lists.infradead.org, AJvYcCUx+NNMCp/CRzWL5M1tpIYdOuABuJaFBpYNyD4w7NkInf373GuX0zbY60LGUNr6t7nMcEyf6yf8cKZYPxM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4rWco9mSVLaEr5QaHIqqZiVRJoafou7zSpGDWtI9QFxUN/Jrz
	AQoDSr+PzgDHs+AbaEc6+4hMZs7ezJsQTC911pjyr8G22AsmNc9E
X-Gm-Gg: ASbGncuYxUmQVQlMpfrDXQVHYEa29xyI8YfzYQiiVmM80Y3D8JbPKHL1Cnindfb1yR1
	osmp7k3/LBjy+nx4m2qzuNx9KjWBVaezH+oC2zPbQNr43ZZJlQulUF6N9IUtnudgibhm94GL1P1
	29BFLAIXWU/4/J4wMj3yqw+N301Iwyx3v3/CIS206QdCqjpVZKhmWH+6Hb6dYaMG1WUnPah5bAc
	cESYknRU0ilWbB0Oj0+6Dp7GagE37/4ohKbGje3bU3o0bHJ5PlumPF/rv4B+1LscZmDzuFRqUKf
	mdJKPxRsMSzrBKYXeyti5IJRg3u/0F9ZSWP938WyAqf92z+94OHNpkC93xwMIrghI1w=
X-Google-Smtp-Source: AGHT+IFMceABDyWeSunss8UJzVYDb4BU4OkU0X8Hc7JUBpiklvsTg2hC46hEV4uH5kHdO2o6dh/F8A==
X-Received: by 2002:a17:902:eb8d:b0:220:c813:dfd1 with SMTP id d9443c01a7336-220c813e56amr81532275ad.36.1739455279808;
        Thu, 13 Feb 2025 06:01:19 -0800 (PST)
Received: from mew.. (p3882177-ipxg22501hodogaya.kanagawa.ocn.ne.jp. [180.15.148.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55858d6sm12565225ad.223.2025.02.13.06.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:01:19 -0800 (PST)
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
Subject: [PATCH v3 5/5] rust: Add warn_on and warn_on_once
Date: Thu, 13 Feb 2025 22:57:59 +0900
Message-ID: <20250213135759.190006-6-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213135759.190006-1-fujita.tomonori@gmail.com>
References: <20250213135759.190006-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_140122_856192_EA589563 
X-CRM114-Status: GOOD (  17.60  )
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
generates the assembly code for rust at compile time by using the C
preprocessor.

file()! macro doesn't work for the Rust inline assembly in the same
way as __FILE__ for the C inline assembly. So the code to handle a
file name is different from the C assembly code (similar to the
arm64/loongarch assembly).

Similarly, ARCH_WARN_REACHABLE is also used at compile time to
generate the assembly code; objtool's reachable anotation code. Only
architectures that use objtool (x86 and loongarch) need it.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/Makefile                                 |   8 ++
 rust/kernel/.gitignore                        |   2 +
 rust/kernel/bug.rs                            | 100 ++++++++++++++++++
 rust/kernel/generated_arch_reachable_asm.rs.S |   7 ++
 rust/kernel/generated_arch_warn_asm.rs.S      |   7 ++
 rust/kernel/lib.rs                            |   1 +
 6 files changed, 125 insertions(+)
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
index 000000000000..7ffd9cb1ad75
--- /dev/null
+++ b/rust/kernel/bug.rs
@@ -0,0 +1,100 @@
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
+macro_rules! warn_flags {
+    ($flags:expr) => {
+        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
+        // SAFETY: Just an FFI call.
+        #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
+        unsafe {
+            $crate::asm!(concat!(
+                "/* {size} */",
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


