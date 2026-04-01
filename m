Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EF5D35177
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfctsG0MEK9DjfOKGfow/kn/X0nicO8wFVvKRFNEt/s=; b=Z7wkcvsgZppzEoi7/8VQ/5PcgB
	WADs1VpDsJVm5XjmlcJIoo13GhptDEFoNFiI8rBmouf/s63tee6rbFXJpSFqh4dL1KHZje1rTHqKO
	12MnoEa9WKq3Gt9/ag7j1mGIz9LPojVbcRtNWqQRr2wLq7q7Td02Wq/hzR6G1OIoD8Jdc/r0+GnLA
	DOHzcBguseNaeCFbsZQEH5zhRNh7heUAE/TptPolAgd1DsnjQfsncrDMPCu4ET7+tIHLm3vJicge9
	piYCGFq7iWSY4Gyuwe3Ni4Cfx6bZFQ8oesYFjRwCdWF6SzZglWbAAI+6gYIsep3+I1JSlQaQVVvbI
	OSaTuIIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u5C-0000000EiaG-2Ksh;
	Wed, 01 Apr 2026 11:50:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u5A-0000000EiYB-3JTN;
	Wed, 01 Apr 2026 11:50:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CAC6560154;
	Wed,  1 Apr 2026 11:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A22C4CEF7;
	Wed,  1 Apr 2026 11:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044199;
	bh=wcbQRLM9qTKpTFYFEosr/1QG1mBAWkf0/gok9PQzPf0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KLZvlL/XgCiazZjeX/Y8Xsx+YBTjea4SwD1HWIceKRTwgPjL3m8jDIKob1H4JBDVK
	 Qv/gfay0rXXO8p6eOYCpHlnWtMyICts5OWSd/EChkJgjnopuAIv2sUN1fDAaxML48n
	 9TIoL+dFCzSt6wkaesp6HqT6gd69LLUqI/fxVyWnZIsvBy/1WzuOrn5BZUxz1qMYIo
	 gaQDh06efSy/bIy5G9jpxAOh5JyNttJWHRH4Q+dopWG8qMbViy2UJZMZeohpUyx+Jz
	 +RDMOn+Rr4uDTVxWPo738niiObo6baL76z0Nght9kLTnVeXGgAA20Xj4aKleoK+drH
	 N2UWk3KxrLXug==
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
Subject: [PATCH 20/33] rust: kbuild: remove unneeded old `allow`s for generated layout tests
Date: Wed,  1 Apr 2026 13:45:27 +0200
Message-ID: <20260401114540.30108-21-ojeda@kernel.org>
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

The issue that required `allow`s for `cfg(test)` code generated by
`bindgen` for layout testing was fixed back in `bindgen` 0.60.0 [1],
so it could have been removed even before the version bump, but it does
not hurt.

Thus remove it now.

Link: https://github.com/rust-lang/rust-bindgen/pull/2203 [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/bindings/lib.rs | 4 ----
 rust/uapi/lib.rs     | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index 19f57c5b2fa2..e18c160dad17 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -9,10 +9,6 @@
 //! using this crate.
 
 #![no_std]
-// See <https://github.com/rust-lang/rust-bindgen/issues/1651>.
-#![cfg_attr(test, allow(deref_nullptr))]
-#![cfg_attr(test, allow(unaligned_references))]
-#![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
 #![allow(
     clippy::all,
     missing_docs,
diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
index 1d5fd9efb93e..821e286e0daa 100644
--- a/rust/uapi/lib.rs
+++ b/rust/uapi/lib.rs
@@ -8,10 +8,6 @@
 //! userspace APIs.
 
 #![no_std]
-// See <https://github.com/rust-lang/rust-bindgen/issues/1651>.
-#![cfg_attr(test, allow(deref_nullptr))]
-#![cfg_attr(test, allow(unaligned_references))]
-#![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
 #![allow(
     clippy::all,
     clippy::cast_lossless,
-- 
2.53.0


