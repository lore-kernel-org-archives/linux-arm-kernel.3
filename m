Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989FCD35162
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVUhObsMIuARmw6rit5F0KuwYbrwJWJRugI2kGdJxPw=; b=awQ+x8v6KzdNGeLgKzRTidzzDr
	Rc1pmYQ99Yr2G15gUPVkv4ufnSnQbp8ViMBZzDxzz/SI1usTnbOTEDk05p3gjjkXuA3cKz2hq3nWi
	zGekABupAyr8oDi5fqHf/RuaFWv79X/8nI+iboEgVvphx+0r3ZGD1ZrDYLsK1BOsNMpAqQlkNlqnD
	45lfBR+RdymD+KksQrrXcvnutqdn/op8f7H8/HN/HCGFocMJStbJcajHMVLKiuR92Fewz0sYQcwQb
	oku/2MX2DfPMKMWhhhyGGEry8j2oiFG8qXNGa757fD2UsrNMWaghiMw1eEQS1eZzDBdmXIIsg5WBN
	i8tEAniw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u4b-0000000Ei3E-4Anx;
	Wed, 01 Apr 2026 11:49:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u4a-0000000Ei25-4Azx;
	Wed, 01 Apr 2026 11:49:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6734E60142;
	Wed,  1 Apr 2026 11:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC956C4CEF7;
	Wed,  1 Apr 2026 11:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044164;
	bh=6xM/90y2+9K2QK1MXod17VOVsEz3ItyuSJ/mYMv3Drg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V+OxZYCFK/c+WvN/8/uOPoU8cAIkSEfrgXW012jcw/dHW9HOkQ6wsGFDWswV5/fG3
	 B0v0LpVBICRBJRwhLcK22UNCpDeTVTz+otKNFY+bq42zA8C8SUT8eSa1TFfGqDTxZB
	 nTODkVCQiBhlpeCieK0XT3k7C5zp8u0nP4rLD82LlBz9Y/xfcAU7TJG690uB/2PHds
	 RK8eWxpPbkIam179mN9OeSs4s+oG15cb5Q0wUo46IzCRVHLWdbbP/e1PSThZYL6/sj
	 B+l7o2/JFT40jMHsCpebNWLL1wHDkZfzANZ7s+SGh48/K8TUDw4qSBv5D/fytpVz03
	 jqBcyNZwn2UQA==
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
Subject: [PATCH 17/33] rust: kbuild: update `bindgen --rust-target` version and replace comment
Date: Wed,  1 Apr 2026 13:45:24 +0200
Message-ID: <20260401114540.30108-18-ojeda@kernel.org>
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

As the comment in the `Makefile` explains, previously, we needed to
limit ourselves to the list of Rust versions known by `bindgen` for its
`--rust-target` option.

In other words, we needed to consult the versions known by the minimum
version of `bindgen` that we supported.

Now that we bumped the minimum version of `bindgen`, that limitation
does not apply anymore.

Thus replace the comment and simply write our minimum supported Rust
version there, which is much simpler.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 163d2258e93f..34f21b735993 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -446,22 +446,10 @@ endif
 # architecture instead of generating `usize`.
 bindgen_c_flags_final = $(bindgen_c_flags_lto) -fno-builtin -D__BINDGEN__
 
-# Each `bindgen` release may upgrade the list of Rust target versions. By
-# default, the highest stable release in their list is used. Thus we need to set
-# a `--rust-target` to avoid future `bindgen` releases emitting code that
-# `rustc` may not understand. On top of that, `bindgen` does not support passing
-# an unknown Rust target version.
-#
-# Therefore, the Rust target for `bindgen` can be only as high as the minimum
-# Rust version the kernel supports and only as high as the greatest stable Rust
-# target supported by the minimum `bindgen` version the kernel supports (that
-# is, if we do not test the actual `rustc`/`bindgen` versions running).
-#
-# Starting with `bindgen` 0.71.0, we will be able to set any future Rust version
-# instead, i.e. we will be able to set here our minimum supported Rust version.
+# `--rust-target` points to our minimum supported Rust version.
 quiet_cmd_bindgen = BINDGEN $@
       cmd_bindgen = \
-	$(BINDGEN) $< $(bindgen_target_flags) --rust-target 1.68 \
+	$(BINDGEN) $< $(bindgen_target_flags) --rust-target 1.85 \
 		--use-core --with-derive-default --ctypes-prefix ffi --no-layout-tests \
 		--no-debug '.*' --enable-function-attribute-detection \
 		-o $@ -- $(bindgen_c_flags_final) -DMODULE \
-- 
2.53.0


