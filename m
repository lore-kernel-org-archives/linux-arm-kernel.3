Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E2BD35177
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUc5PgEsOu2wBoY2axOQZUDM+mPR0xknbziR5iYRFDo=; b=OvQ2q3Q3vvm6ziSqgutRT779ft
	OkhcY4gYUSIddw5fA3VvUD66BYAa4iFfkSXNnQFspJ1LVLWUyhsnVa6Zf42KCvHG+/miL5Ph/6Cmy
	feQVWzr61NHauQ4IBGbJlVK7BQHSHb30SwYrtTOAwGcOhrS5kgCAdwzmK5U+9I+O9HELy2NFeojJ4
	Q4CqhoHhb/mgvsE3te6WNThRndUZCJS+zEzNjWVQucaeMoyvH0oRhRscjmoCTiKzDRfgorDXvl1Jr
	TNzHslUhbKXAOy9VeZLLwc4a1U4m/1AG20xD0Py8zaTQ6u1oj6TMS13vuEHve6CCZa9ko3wdfETCm
	ehMonljg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u2X-0000000EgR0-10DB;
	Wed, 01 Apr 2026 11:47:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u2V-0000000EgPE-1YmC;
	Wed, 01 Apr 2026 11:47:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C4DB160142;
	Wed,  1 Apr 2026 11:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 439C6C4CEF7;
	Wed,  1 Apr 2026 11:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044034;
	bh=4gM8Ng4dI5voGspd2MW/G8qAzYExygP7OS8buaoRZDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ht/pJf8bo8MwxgismJjbcH0DxRn7Lj//fl6ay0HnlmCjRYtIgG8EVgO1pndmfJvmX
	 knXYuXYh9VlrrWlM4STAZn3sQOBumFGD85l8NUcLqK6B4M8x67BxO2fXILzhN4B2BU
	 awW9tkXIImmGo6T6kf3CMLsydwKRFrCShSbshmJZdMTwdZlS8hx070+c6T0k/sjoJA
	 qrli+3YzdEjOuYYWmi7/eX+fS3nR0X9qLxqa7lkA0sqbxR7ZpQRP16hFBijOa7+Glw
	 UKfSOaXg7JBTS7dRCgMgcJxLilLRa8EraZkF2TMfGDuB2LngUIWnuMKHmQ5S0tMkkv
	 QSVzdTlSUbKJw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	linux-block@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers),
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH 06/33] rust: kbuild: remove skipping of `-Wrustdoc::unescaped_backticks`
Date: Wed,  1 Apr 2026 13:45:13 +0200
Message-ID: <20260401114540.30108-7-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Back in Rust 1.82.0, I cleaned the `rustdoc::unescaped_backticks` lint in
upstream Rust and added tests so that hopefully it would not regress [1].

Thus we can remove it from our side given the Rust minimum version bump.

Link: https://github.com/rust-lang/rust/pull/128307 [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 5eca6a817966..212759b5eb7d 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -75,8 +75,7 @@ core-edition := $(if $(call rustc-min-version,108700),2024,2021)
 
 core-skip_flags := \
     --edition=2021 \
-    -Wunreachable_pub \
-    -Wrustdoc::unescaped_backticks
+    -Wunreachable_pub
 
 core-flags := \
     --edition=$(core-edition) \
@@ -213,8 +212,6 @@ rustdoc-macros: $(src)/macros/lib.rs rustdoc-clean rustdoc-proc_macro2 \
     rustdoc-quote rustdoc-syn FORCE
 	+$(call if_changed,rustdoc)
 
-# Starting with Rust 1.82.0, skipping `-Wrustdoc::unescaped_backticks` should
-# not be needed -- see https://github.com/rust-lang/rust/pull/128307.
 rustdoc-core: private skip_flags = $(core-skip_flags)
 rustdoc-core: private rustc_target_flags = $(core-flags)
 rustdoc-core: $(RUST_LIB_SRC)/core/src/lib.rs rustdoc-clean FORCE
-- 
2.53.0


