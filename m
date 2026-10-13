Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42666CC6B1C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 20:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsJzxzIv3ovo09qKikb4d108MqzJHNidveoqqS4rQ/k=; b=3tlwH8ur2y7PjZiSFs4dinM10J
	GPfzo1vXhm1govgFafnlMB/3XU5zssifrD3buMVB2w2pW3oHkxlRBdt1+TxkJPWLmwKMfoek97CTE
	87P6i+na5yOeF5fXXNKHmLCrCNfmccBGNdnMFXNjyCfZP/aaUegdnM9ck0QiHNrQihjS5lR4sM07m
	ufaDjJVNaa1hxc3Py+Hf8i1rII0Yf56FK/zGqDOarepP4ve+2kV9TLUfRitzYf4xWX6g+C5W/afKM
	r+HJ9bMXTmw9glh+06v9Gqet1jSQ85LJ2LmRLDsheGh/9UYyTzKQZdnvO/y/wuYma0MB58X6lYIQ5
	KAc1fZ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGjAO-0000000E0Sn-059Q;
	Tue, 13 Oct 2026 20:32:08 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGjAI-0000000E0Pq-3bry
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 20:32:04 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so28238395e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 13:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923521; x=1792528321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AsJzxzIv3ovo09qKikb4d108MqzJHNidveoqqS4rQ/k=;
        b=fmaxhbs3u07SZCBWJwEp0pQ6SgZSAJclh9aItMCQ9zy3b6XXK1BxHcNnHbJfdrLDpl
         lo7B3lc4rf0oU5Of8QsAbJYsa9XqqL1VPRmNqErFz5wuPvsvpfD+nK8WqDFHMmm90Wdk
         1RfHhfV5Wf6Wc/jpU3y8MOEQHLZowoXjbPEN3JFMjIaneZ3X3ZOfgp24Aqd0PTiXATKE
         QtKWMbydzG8wp7HAlW9sf6txN3hJO1p98t5HZL8sEYbqIALyjagELQoyr4BU3sg6Y401
         Y8bG6ASlsurkTiQT6B8moOIFA8OSTlElK745yzlGrBAEvIBHXuatJkSjJnze9RMPZPYb
         wbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923521; x=1792528321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AsJzxzIv3ovo09qKikb4d108MqzJHNidveoqqS4rQ/k=;
        b=vJENZEi954GPjcLnJLvsvIskv3qUh0KA1pTK3nVKGg7WuvH9BeKAmXUl5dKcgSkHR8
         nXyNdTRjWleeX9pQkfYAYx0ieRx0j2kc/f6y2BZ228wrJQL0csWeC02AvHqrQhjsVnCS
         hmFMh+JYz6JlQE0rKSQ8Qd86T42PhHfOerjdoJhO6uYPh7C/27d/5/kILnfp4fFIf8Ow
         ctMShZ4XBLgnIollj+NUJ3IrjKq/rviRFaqO/5/sKFM9OXR/z9j6JTFMn0idblO0SUQD
         mqGwcqrPMW5wtFkFSH186eEaC/g7EkK5/TxzWQyeTiFc3zyvNqjpCTMUPhdqD5BANWNx
         e9vQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfFlmvXwFihmH9jqGn4HTaTnufFKL12FIgzEzML4NUXlWOkg67ip9MWgrld/Yww3Ct1PrCxWCHviK2rwHtOQfd@lists.infradead.org
X-Gm-Message-State: AFq9FYKK88XCpMNLm4VAm4eAHRpniVLPUKEfrVdDmn0RuIZ+S7qoUgDb
	BA1obAkZiEdHAJKDgRPdHihaXRWXYemFH++76HMfIoaSOzrNGkypTXS0
X-Gm-Gg: AYBFou0vKZdjuLsv77zFa0nxgYwJUXdMHm8UbkK3nVJunoG8QpUmIEqexv6rQXQGQTd
	WNBGgK1375zM3Ls8Wt15VaF9rZh60DPEmmC7UjrAiXGfeM0b9xoPiQADg0M2xqf+eKUB5mXWvnD
	poIwi7kGEmjvEOrms1N0wXLdKDbidiqjNP+syNcz+Kk06UYukHbCJ2j9bPKcSN9FxXgpAxD/B6h
	QY/78r86ND0m6OfsrG/JBcILWRcoleR1GzvfLK25hpENS2YSjimxIb3RHoshJajAPi9UzQcS2dc
	dBFeR4lbYKYppmOhNBqOeg8TLmu5YTFW4I8IGR32uhdJi1ojo/qZda2h9sIY0YdAOp8cUAAZI7t
	qgTHYxE5MvKqg83dKhQtSl0xdWeJ2kBYIrh2zRkSp3pHKJR6y9pUYr4CvmdROik4GRRp6RAh5Op
	09TI0y/GueuSgcIvdiFQYEwKpWKH553V4eqqS/XUsagMedFZFz3ro6rcE9/e/GP4ECy0z3/uzKo
	Wx6VqvvRqQG6Wo4N+/ktD4Nw/0tLHpQ+rxLDYGymS9wgnWrrFWkNV7bWoCRfyZch1teLWlwtZLP
	oTP3XGsNGYqJ6Bf6RIZJKbyOzI8mEKtBQC1wiA5X+uae+cVnaNv9mlRP8za5BZx4QOFYEte5OrS
	ri7o3iw==
X-Received: by 2002:a05:600c:524d:b0:4a1:80d8:aeb3 with SMTP id 5b1f17b1804b1-4a18e4a95c2mr270482865e9.12.1791923520806;
        Tue, 13 Oct 2026 13:32:00 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.31.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:32:00 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] ARM: rust: Enable Rust support for ARMv6K-only kernels
Date: Tue, 13 Oct 2026 22:31:37 +0200
Message-Id: <20261013203140.31741-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261013203140.31741-1-kmehltretter@gmail.com>
References: <20261013203140.31741-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_133202_926192_4512BE4B 
X-CRM114-Status: GOOD (  14.21  )
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

HAVE_RUST currently requires CPU_32v7, excluding ARMv6K-only kernels
even though arm-unknown-linux-gnueabi already builds ARMv6 code.

Select HAVE_RUST for CPU_32v6K. CPU_V7 selects CPU_32v6K, so ARMv7
remains covered.

Keep plain ARMv6 (CPU_V6, ARM1136r0) excluded. It lacks 1- and 2-byte
xchg() and 2-byte cmpxchg(), which the Rust atomic helpers need. The old
condition exposes Rust on combined CPU_V6 and ARMv7 kernels, which do
not link.

Tested the Rust samples, KUnit suites and doctests in QEMU raspi0
(ARM1176) with bcm2835_defconfig without ARCH_MULTI_V7.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested the full six-patch series on a Raspberry Pi 1 Model B+
Rev 1.2 (ARM1176JZF-S), with bcm2835_defconfig without ARCH_MULTI_V7,
clang 22.1.8, rustc 1.99.0 and bindgen 0.73.2.

All 368 doctests and the Rust KUnit suites passed. The intentionally
disabled KUnit selftest was skipped. Ten Rust modules loaded and
unloaded. Misc ioctls, configfs, scoped debugfs and rnull read/write
checks passed. No warnings or oopses in the test kernel.

 Documentation/rust/arch-support.rst | 2 +-
 arch/arm/Kconfig                    | 2 +-
 rust/helpers/atomic_ext.c           | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 4f980815e92a..bdc42a24bf30 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -15,7 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 =============  ================  ==============================================
 Architecture   Level of support  Constraints
 =============  ================  ==============================================
-``arm``        Maintained        ARMv7 Little Endian only.
+``arm``        Maintained        ARMv6K and ARMv7, Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ffbc7f386131..b5816f28783a 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -138,7 +138,7 @@ config ARM
 	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
-	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7 && !KASAN
+	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v6K && !CPU_V6 && !KASAN
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_UID16
diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index c267d5190529..1d157df29229 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -42,7 +42,7 @@ GEN_READ_SET_HELPERS(ptr, const void *)
  * xchg helpers depend on ARCH_SUPPORTS_ATOMIC_RMW and on the
  * architecture provding xchg() support for i8 and i16.
  *
- * The architectures that currently support Rust (x86_64, armv7,
+ * The architectures that currently support Rust (x86_64, arm,
  * arm64, riscv, and loongarch) satisfy these requirements.
  */
 #define GEN_XCHG_HELPER(tname, type, suffix)					\
@@ -66,7 +66,7 @@ GEN_XCHG_HELPERS(ptr, const void *)
  * try_cmpxchg helpers depend on ARCH_SUPPORTS_ATOMIC_RMW and on the
  * architecture provding try_cmpxchg() support for i8 and i16.
  *
- * The architectures that currently support Rust (x86_64, armv7,
+ * The architectures that currently support Rust (x86_64, arm,
  * arm64, riscv, and loongarch) satisfy these requirements.
  */
 #define GEN_TRY_CMPXCHG_HELPER(tname, type, suffix)				\
-- 
2.39.5 (Apple Git-154)


