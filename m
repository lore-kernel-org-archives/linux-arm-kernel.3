Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9F6D35177
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LbfzB8uuVItCglxYpXiO+JyX9OGIlx3aDng3MITtwo=; b=mA9Qk8MTDQPMMW0L23FoiWWyYn
	LX7xCw71D62VLvQ4p8CrwQSMhHEB2a+H0x/tcYpT7ttR/e3SuHgan+9e0LWhYG8UoCslvsPvdUsXj
	EU7VA/PugzmpopkkVU1TYS9ndSVoa5zyHpq/KL2/f8MaRz9x/B/kH4VPHI3DS0ZkSnjpgVav9VMaH
	a5ZOLhTKHtWIi2wtQpNMj6OJZjkTBy+FftJtSEM3/WlizgnXcwCBVnYYqA9UqfGfLrZebTYyA3E7b
	G/nRFbruIAMnU7QAAk+Ad+GEdTlK2W4+lZhUxUSYZso/X8QsyZeY6T1nujI/8nxFCPWX96dIILPHk
	a2xRHGFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u4s-0000000EiIa-3BB8;
	Wed, 01 Apr 2026 11:49:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u4q-0000000EiG8-3TNf;
	Wed, 01 Apr 2026 11:49:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7LbfzB8uuVItCglxYpXiO+JyX9OGIlx3aDng3MITtwo=; b=gXYeOhHcfYTEU6znEUyTQfBGy9
	AaXMfQK8Voxtok6GgPpTv2453/HblwC8Prpka6if3yhEOTnNlpWJCU3d9Mi0KKDsqDVVJknDNVd8B
	2gph45aoOWGB7o2K3jz17qhFuTIjBohkE+mmfyoZgTUBWyJQSwIjdSTW0UAau5Elxi7tP4K1lJyc0
	Q+QiGoCiIk1vF7oYT+NbpusZWgaFJ2RafSaVb2zKIc5byUHrXQAQqfMJZHUbbJFoK15BHvc4IiVXw
	fBjoy/Y0CBxTcO7n2KkYFngBj4sgimvMrKUy+4uS3XhFaOJVy41K3LQvahbJcQ/asgO9jBocqYNYn
	dzEzC+5Q==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u4n-00000000F9D-1xLB;
	Wed, 01 Apr 2026 11:49:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B1A540914;
	Wed,  1 Apr 2026 11:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A46ECC4CEF7;
	Wed,  1 Apr 2026 11:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044175;
	bh=xz1grsgb4QE1o4cHB9GesAE8qhJ6lQQFIqn/KID5vfw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tnllc7x6zEKN9F7U+bg8ySDzkF9jSdpxTfoTnbvmk/kuzJ/sYG/NjwfDZ6inHO1Oc
	 /EhJNuqVo+qFFcjj/fjTG4t7FvH7/73DVMk3rItWld3VOFc3hPShkq57juJbvm4yFK
	 OuOjBa/ib79Lo40yyq9wodqBoUB9J2VLVSXnXzelLqcvbIhRvjrsNQYPkeVyJ/hhWe
	 MR9qiIFeLCqngv8TClBhUW1JlJbS5mLTIFM9Ywbs9gwbFcQAsxgy9/WZUAoO8kcySG
	 DH2hQ+Pe5WAD4+4iByp79KxYyFthjqcvoT6ilEd5BiUE6UVqgy7mAfJFJVA5UZvOT/
	 PKMFODChfa0KQ==
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
Subject: [PATCH 18/33] rust: kbuild: remove "dummy parameter" workaround for `bindgen` < 0.71.1
Date: Wed,  1 Apr 2026 13:45:25 +0200
Message-ID: <20260401114540.30108-19-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_124938_109323_6531C880 
X-CRM114-Status: GOOD (  12.22  )
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

Until the version bump of `bindgen`, we needed to pass a dummy parameter
to avoid failing the `--version` call.

Thus remove it.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 init/Kconfig                 | 7 +------
 scripts/rust_is_available.sh | 8 +-------
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index f9fac458e4d4..d9b795f70a38 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2211,12 +2211,7 @@ config RUSTC_VERSION_TEXT
 config BINDGEN_VERSION_TEXT
 	string
 	depends on RUST
-	# The dummy parameter `workaround-for-0.69.0` is required to support 0.69.0
-	# (https://github.com/rust-lang/rust-bindgen/pull/2678) and 0.71.0
-	# (https://github.com/rust-lang/rust-bindgen/pull/3040). It can be removed
-	# when the minimum version is upgraded past the latter (0.69.1 and 0.71.1
-	# both fixed the issue).
-	default "$(shell,$(BINDGEN) --version workaround-for-0.69.0 2>/dev/null)"
+	default "$(shell,$(BINDGEN) --version 2>/dev/null)"
 
 #
 # Place an empty function call at each tracepoint site. Can be
diff --git a/scripts/rust_is_available.sh b/scripts/rust_is_available.sh
index cefc456c2503..551f1ebd0dcb 100755
--- a/scripts/rust_is_available.sh
+++ b/scripts/rust_is_available.sh
@@ -121,14 +121,8 @@ fi
 # Check that the Rust bindings generator is suitable.
 #
 # Non-stable and distributions' versions may have a version suffix, e.g. `-dev`.
-#
-# The dummy parameter `workaround-for-0.69.0` is required to support 0.69.0
-# (https://github.com/rust-lang/rust-bindgen/pull/2678) and 0.71.0
-# (https://github.com/rust-lang/rust-bindgen/pull/3040). It can be removed when
-# the minimum version is upgraded past the latter (0.69.1 and 0.71.1 both fixed
-# the issue).
 rust_bindings_generator_output=$( \
-	LC_ALL=C "$BINDGEN" --version workaround-for-0.69.0 2>/dev/null
+	LC_ALL=C "$BINDGEN" --version 2>/dev/null
 ) || rust_bindings_generator_code=$?
 if [ -n "$rust_bindings_generator_code" ]; then
 	echo >&2 "***"
-- 
2.53.0


