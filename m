Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E29E9D82C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 23:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+7TAYOgTbawp+VUyk8RMZ3LzNgzoO9sNdptEQ5bi4A=; b=ACM2YFbXhKg9tQt8Ylh+fr9maj
	5C+Qr+u0kLc4/isRAGdYvfftShQj9DWwFYzxRmmoRj8ISnPBwoCLZxxXEmV1NxFAoee/JzAW1CE9I
	nSvRvwH0kDDdJrecgALfmF2cGSgAyArzulKptx37RbwDCkXm4Fj9TtSp6gSZiyBPkeaUKFTSfv+Tz
	OQ0RGWtEmC3DwBxaritKTPwykcKEuIssDh7MtGurvtkR0C+UGLtlMrBUzV1xl1S2NHUgEF1q++rUj
	G6jaP2I52kfIJ05Ow7QCbcQW3+nykaG6pyb+33JppLBnxLZRF5ZX4WtybSsKKyz67oi0sIEHFPyyP
	8PXoG4wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9XKK-00000004aup-2zu9;
	Sun, 05 Apr 2026 23:56:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9XKJ-00000004au3-2Fqx;
	Sun, 05 Apr 2026 23:56:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=x+7TAYOgTbawp+VUyk8RMZ3LzNgzoO9sNdptEQ5bi4A=; b=n9kl07TKlA67Z8hhQ2M8CaCVCt
	ljWfYCt3iCs7DUbA+zEsobv2r9BdCCIiaGH803cEnd12AJaxqCbInA/68jJEghjwVrv7K/TDdX+QI
	IaF7zoKjbx7Hed6uVBnnO4FPJQTYIFkC1O7K4q0TilNbRYsBtRfQVfD8HKPiA+oFHBxda35EEaJTH
	xqtlUNZlGBqr5fvZJBaPx5kubJgFRICfMWX/2GjM5+rXnaUNTaefK68lBxU6+6HVsUNFvVe1uXUoR
	7J/spVJVJWZr9wE11NTPhbKp0D3Fwvvhi7x1uAiW8oNVQR8G522ab5K3/Lj2M9ZguLQpByUk1kVqS
	vod1qGhg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9XKF-00000006E07-3Gk1;
	Sun, 05 Apr 2026 23:56:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE4F9417BD;
	Sun,  5 Apr 2026 23:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA99C116C6;
	Sun,  5 Apr 2026 23:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433375;
	bh=k9fgvKqzt3CcMjpByOnUKIVw60bYTXCQ8WCT/cyECdY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZaVpVUGO29xolVVSHHDaY6zc64XoWTVURD4wmowEYx41c+Wyvxg2ZvbRUDBr5NSQM
	 qnQ7znq5xPGmdnTPdcYVaZC7vnG5CdMVAK8esq+ZQUqP5fhEE9eEYKap4bE1TE6jn4
	 tBmF/lQcMvqLIbmPK7hFkihBrJN3xVu01fVsz+MN4SzEjt8l16fIDNn69GQncl9Yl+
	 Iz0ORhzjuBLkOlJxT/Q92ItzFvNRq1IEAlPAFGwQoUdailI/ja4qppsGHHJ+cazKlw
	 zeuH4jXdUNlzyLPBG4DfcSUb8nvgueaNnyXHPAthjZQRgSoxFxQLDP6Ba6EFq9edcZ
	 rD1Bo7j0WdTjg==
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
Subject: [PATCH v2 15/33] rust: macros: simplify code using `feature(extract_if)`
Date: Mon,  6 Apr 2026 01:52:51 +0200
Message-ID: <20260405235309.418950-16-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_005620_224641_DB2C3057 
X-CRM114-Status: GOOD (  11.85  )
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

`feature(extract_if)` [1] was stabilized in Rust 1.87.0 [2], and the last
significant change happened in Rust 1.85.0 [3] when the range parameter
was added.

That is, with our new minimum version, we can start using the feature.

Thus simplify the code using the feature and remove the TODO comment.

Suggested-by: Gary Guo <gary@garyguo.net>
Link: https://lore.kernel.org/rust-for-linux/DHHVSX66206Y.3E7I9QUNTCJ8I@garyguo.net/
Link: https://github.com/rust-lang/rust/issues/43244 [1]
Link: https://github.com/rust-lang/rust/pull/137109 [2]
Link: https://github.com/rust-lang/rust/pull/133265 [3]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/macros/kunit.rs | 9 +++++----
 rust/macros/lib.rs   | 3 +++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index 6be880d634e2..ae20ed6768f1 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -87,10 +87,11 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
             continue;
         };
 
-        // TODO: Replace below with `extract_if` when MSRV is bumped above 1.85.
-        let before_len = f.attrs.len();
-        f.attrs.retain(|attr| !attr.path().is_ident("test"));
-        if f.attrs.len() == before_len {
+        if f.attrs
+            .extract_if(.., |attr| attr.path().is_ident("test"))
+            .count()
+            == 0
+        {
             processed_items.push(Item::Fn(f));
             continue;
         }
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 0c36194d9971..2cfd59e0f9e7 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -6,6 +6,9 @@
 // and thus add a dependency on `include/config/RUSTC_VERSION_TEXT`, which is
 // touched by Kconfig when the version string from the compiler changes.
 
+// Stable since Rust 1.87.0.
+#![feature(extract_if)]
+//
 // Stable since Rust 1.88.0 under a different name, `proc_macro_span_file`,
 // which was added in Rust 1.88.0. This is why `cfg_attr` is used here, i.e.
 // to avoid depending on the full `proc_macro_span` on Rust >= 1.88.0.
-- 
2.53.0


