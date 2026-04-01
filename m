Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14BED35162
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZjiSKXVmjcHn9YoZ/yHco4+/3fGMxFZwKbyij6mW+4=; b=Tr4vTeXJL9gYQ/X1pYKOQkz1tr
	Bbgjsj6MPQCazcJXJYfmEocS6BuY6YlZAxlMyH/x+Aav/GTYs32FJGOrvpRjd7hlNsULCP1weURh2
	/DfgLw03nzlejEXjHvfKUQTkd4fXZqvNiqs2sQxKlMDCaYz7UeuabwCtj3CuIPGxI5/lq5fBh/tAr
	h84U3VNPN6IbqlUPioR9P17bJLq3b6lYRoYPGlK74xPvc/ccrOxr722sGh7NJ7d2dLiuLYdlFxdet
	e7olhF5JMUnf8SNryhbDjMp32pkRdjRuNZ8c0xRRkEdJwRACn7lsa8AvniZgUeCNVbqh43EfHS4Yj
	O8nh92zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u3U-0000000Eh7S-02Gu;
	Wed, 01 Apr 2026 11:48:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u3S-0000000Eh61-1N1R;
	Wed, 01 Apr 2026 11:48:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B495060180;
	Wed,  1 Apr 2026 11:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F73C4CEF7;
	Wed,  1 Apr 2026 11:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044093;
	bh=Pc5ewSafnPFxKHksepcgeyeiYuBuOzddWiUYOLo44fc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BctafedQl739LjER8MXut5f/UHQmwOMgY8eiBY9GPjZTa6UhwF33xTqKAsv/k9Jpr
	 UXZVhOtcmmlzZOYf7Vb8QT5b+Sj/g3QrIBGXZxTM3uNlk/xWwz3doBmOs5UrfpKtV3
	 BYeIBH88Jfn81A8lOQUe/b7L+LFkxTKWrdN5PeuA4bvB3G5atuDiVtTQLpJHRcGIi8
	 078hXEr/7kYFNT7XsI7KvwhnIDxnv/Nf9IHI6ZwVq+LPtCR1GNMcpgdXOerf3ytBI9
	 Tm7z4+ydsRwNHDCQkzUS7eKrnLuo9suwO47RZoBJZ7m1nD1AfOYKE0TTcQdbVpDSUj
	 Rk7BTlqek9WZw==
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
Subject: [PATCH 11/33] rust: alloc: simplify with `NonNull::add()` now that it is stable
Date: Wed,  1 Apr 2026 13:45:18 +0200
Message-ID: <20260401114540.30108-12-ojeda@kernel.org>
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

Currently we need to go through raw pointers and then re-create the
`NonNull` from the result of offsetting the raw pointer.

Thus, now that we bump the Rust minimum version, simplify using
`NonNull::add()` and clean the TODO note.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/alloc/allocator/iter.rs | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/rust/kernel/alloc/allocator/iter.rs b/rust/kernel/alloc/allocator/iter.rs
index 5759f86029b7..e0a70b7a744a 100644
--- a/rust/kernel/alloc/allocator/iter.rs
+++ b/rust/kernel/alloc/allocator/iter.rs
@@ -42,15 +42,9 @@ fn next(&mut self) -> Option<Self::Item> {
             return None;
         }
 
-        // TODO: Use `NonNull::add()` instead, once the minimum supported compiler version is
-        // bumped to 1.80 or later.
-        //
         // SAFETY: `offset` is in the interval `[0, (self.page_count() - 1) * page::PAGE_SIZE]`,
         // hence the resulting pointer is guaranteed to be within the same allocation.
-        let ptr = unsafe { self.buf.as_ptr().add(offset) };
-
-        // SAFETY: `ptr` is guaranteed to be non-null given that it is derived from `self.buf`.
-        let ptr = unsafe { NonNull::new_unchecked(ptr) };
+        let ptr = unsafe { self.buf.add(offset) };
 
         // SAFETY:
         // - `ptr` is a valid pointer to a `Vmalloc` allocation.
-- 
2.53.0


