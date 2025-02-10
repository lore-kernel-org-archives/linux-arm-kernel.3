Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB04CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 16:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CXlu5F/nzx95ppJRU4wR0AFKAT7/lyZB4t2YyL6z/8Q=; b=UlhrSXzgHfXktcyXa64j1kr2RL
	S6E4VXrUgX4+N26TWTXJu4mnHfjZg+ZeqfllV9yxo1M4F9oImKrJHrTYOTRUPjpSk+SL0UDbuHxNM
	8eDqIrrDEr8g7TBpZV60bYZKGFA6Qtzpn8E+BNM6oa78BmPegc902J6z40EixdabyldZN3MosYwyR
	GqDMd6kEEL8anuCskPZg26NXUD3JhTT2odiUPY39OGHQaIAES7ntGz+LAs/NCkVO5BcwYOmkrtdkj
	gZ+Cp+NOqxahGhgS+aYv2b24RvkzX/riWT4SzxLqhQicwcTLMGCYYTuqXZIU6JQWGNFcWkGWVHzn6
	HzyVcipA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWug-00000000ZQY-2Lue;
	Mon, 10 Feb 2025 16:45:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWs9-00000000Yrn-2XnH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 16:43:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 55BBA5C5BDB;
	Mon, 10 Feb 2025 16:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C473DC4CEDF;
	Mon, 10 Feb 2025 16:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739205780;
	bh=mPMQ/r2tER76Ym5c2/i5WaN/wRM3LmL3waxtdryUaBY=;
	h=From:To:Cc:Subject:Date:From;
	b=k6CRwpAPipNwWpQaCTXwPnOf+2w1rmiKX2u5l+E1Q1r5ljg/P/XjX6IS0mX4MhujU
	 5TqJcCFPlfx7GwKz7qhusSce6nnF3jpC9D0EEkZKzMuE+k/Ngn40ywJwpfQjVyGgQF
	 rh5y75r08I3w8BHA+QZwVUrEeJgbF6aLnK6rA73lflq0uRD4QLx2pVn+WQzQwXHvYb
	 c2cLn37NpyS3GcWcpXzexsjK+hL1eXOCVkGjPqBjr8j+3v9cxciV4A6ZmkS45HoEnI
	 hLGd9teilbBneYgcfDlngYP9it6EX+6bY3EkvCWptfgv2mpfeJKk/xW0VB4kTjTPRy
	 I5F/AWrtmlEow==
From: Miguel Ojeda <ojeda@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers),
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH] kbuild: rust: add rustc-min-version support function
Date: Mon, 10 Feb 2025 17:42:45 +0100
Message-ID: <20250210164245.282886-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_084301_826712_2A4DDD24 
X-CRM114-Status: GOOD (  12.91  )
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

Introduce `rustc-min-version` support function that mimics
`{gcc,clang}-min-version` ones, following commit 88b61e3bff93
("Makefile.compiler: replace cc-ifversion with compiler-specific macros").

In addition, use it in the first use case we have in the kernel (which
was done independently to minimize the changes needed for the fix).

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
This is based on top of the fix so that the fix remains as simple as
possible:

    https://lore.kernel.org/rust-for-linux/20250210163732.281786-1-ojeda@kernel.org/

 Documentation/kbuild/makefiles.rst | 14 ++++++++++++++
 arch/arm64/Makefile                |  2 +-
 scripts/Makefile.compiler          |  4 ++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index d36519f194dc..2608aa32c762 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -670,6 +670,20 @@ cc-cross-prefix
             endif
     endif

+$(RUSTC) support functions
+--------------------------
+
+rustc-min-version
+  rustc-min-version tests if the value of $(CONFIG_RUSTC_VERSION) is greater
+  than or equal to the provided value and evaluates to y if so.
+
+  Example::
+
+    rustflags-$(call rustc-min-version, 108500) := -Cfoo
+
+  In this example, rustflags-y will be assigned the value -Cfoo if
+  $(CONFIG_RUSTC_VERSION) is >= 1.85.0.
+
 $(LD) support functions
 -----------------------

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 2b25d671365f..1d5dfcd1c13e 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -48,7 +48,7 @@ KBUILD_CFLAGS	+= $(CC_FLAGS_NO_FPU) \
 KBUILD_CFLAGS	+= $(call cc-disable-warning, psabi)
 KBUILD_AFLAGS	+= $(compat_vdso)

-ifeq ($(call test-ge, $(CONFIG_RUSTC_VERSION), 108500),y)
+ifeq ($(call rustc-min-version, 108500),y)
 KBUILD_RUSTFLAGS += --target=aarch64-unknown-none-softfloat
 else
 KBUILD_RUSTFLAGS += --target=aarch64-unknown-none -Ctarget-feature="-neon"
diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 8c1029687e2e..8956587b8547 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -67,6 +67,10 @@ gcc-min-version = $(call test-ge, $(CONFIG_GCC_VERSION), $1)
 # Usage: cflags-$(call clang-min-version, 110000) += -foo
 clang-min-version = $(call test-ge, $(CONFIG_CLANG_VERSION), $1)

+# rustc-min-version
+# Usage: rustc-$(call rustc-min-version, 108500) += -Cfoo
+rustc-min-version = $(call test-ge, $(CONFIG_RUSTC_VERSION), $1)
+
 # ld-option
 # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
 ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
--
2.48.1

