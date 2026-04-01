Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7BCD35162
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBJme/iO4lVm0G6mcV1TudUP3n0IE2OofKlHIR5mlyw=; b=D5mwrUuHJ4YULP81kLz+Nz2gwf
	UPQpRZbrzV3tO07FNdokgDCZe6rE0FEzftHQQR76wpsMSgy5FDhvh1imnBR6iiQNa15hqw2eS158d
	E0+EyLfjUwIRBr+Lp2F9tTkLJYZWt7NJErAI6ECfQ/ckSUcNduEPiUgQbpKyAOfMu72jbfarXHY16
	qr5JvrYODEQzBiZtLGY1HqXLcpMvOW31mikRV/qtDbsYFm4RDGRE7avUiB38ykuKC3GCjo4hW0xnF
	zXqE4Kx8zJ6Zbbw3BYDJukfx3QjTA2uMYned52t4T+nA6kHHYeVfZvKdvYquAqNtKAnHkHN55OUx7
	bXDIKDvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u1p-0000000Efxd-0AKw;
	Wed, 01 Apr 2026 11:46:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u1k-0000000Efvp-0Kw2;
	Wed, 01 Apr 2026 11:46:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6868440912;
	Wed,  1 Apr 2026 11:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065A7C4CEF7;
	Wed,  1 Apr 2026 11:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775043987;
	bh=bANzQfGdC4IAbhvKXuBQNZWwfHWEIkonTSD/l3eSFWo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hL4sHbvEsNWJiay38u1aNlo7H43VBJ1sQkn95Zz3Zvo78hQs4urrxoY3PVbkzKt0l
	 lwmTMIaJi+qiU2KMGU6vLKoGsiBAHAkiLOEOtbt9u9OHlSIILM04QabgoVY8JAqGM2
	 ktOh+LvLdSPlD4TAGMErsb3sfuWdamUxchSdksVBIJ38zHPuP7Z3j73xQdW7tKiEjL
	 3P1B2oMo9xQQOERf8nSXdYHlAeXuO4SJJzjQaIXxzPUJD3XBzD1RAtErQhOQJcGTnV
	 k195Z2x0u87K/wOQvxUzbhoRq0DOWDo6GjE0Ys09MiK0M4d5vrYQEjsZvmtaKni/FB
	 Nn2gr6YtVmP8w==
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
Subject: [PATCH 02/33] rust: bump Clippy's MSRV and clean `incompatible_msrv` allows
Date: Wed,  1 Apr 2026 13:45:09 +0200
Message-ID: <20260401114540.30108-3-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_044628_173417_D03BA688 
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

Following the Rust compiler bump, we can now update Clippy's MSRV we
set in the configuration, which will improve the diagnostics it generates.

Thus do so and clean a few of the `allow`s that are not needed anymore.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 .clippy.toml                      | 2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs | 6 +-----
 rust/kernel/ptr.rs                | 1 -
 rust/kernel/transmute.rs          | 2 --
 4 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/.clippy.toml b/.clippy.toml
index a51de9a46380..b0a78cc8be20 100644
--- a/.clippy.toml
+++ b/.clippy.toml
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-msrv = "1.78.0"
+msrv = "1.85.0"
 
 check-private-items = true
 
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 46819a82a51a..d9f69366642a 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -281,7 +281,6 @@ fn allocate_command(&mut self, size: usize) -> Result<GspCommand<'_>> {
         let (slice_1, slice_2) = {
             let (slice_1, slice_2) = self.driver_write_area();
 
-            #[allow(clippy::incompatible_msrv)]
             (slice_1.as_flattened_mut(), slice_2.as_flattened_mut())
         };
 
@@ -572,10 +571,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
             Delta::from_millis(1),
             timeout,
         )
-        .map(|(slice_1, slice_2)| {
-            #[allow(clippy::incompatible_msrv)]
-            (slice_1.as_flattened(), slice_2.as_flattened())
-        })?;
+        .map(|(slice_1, slice_2)| (slice_1.as_flattened(), slice_2.as_flattened()))?;
 
         // Extract the `GspMsgElement`.
         let (header, slice_1) = GspMsgElement::from_bytes_prefix(slice_1).ok_or(EIO)?;
diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index 512e2eabe3ad..bd669e74e1cc 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -81,7 +81,6 @@ pub const fn new_checked(align: usize) -> Option<Self> {
     /// This is equivalent to [`align_of`], but with the return value provided as an [`Alignment`].
     #[inline(always)]
     pub const fn of<T>() -> Self {
-        #![allow(clippy::incompatible_msrv)]
         // This cannot panic since alignments are always powers of two.
         //
         // We unfortunately cannot use `new` as it would require the `generic_const_exprs` feature.
diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
index 5711580c9f9b..b9e6eadc08f5 100644
--- a/rust/kernel/transmute.rs
+++ b/rust/kernel/transmute.rs
@@ -49,7 +49,6 @@ fn from_bytes(bytes: &[u8]) -> Option<&Self>
         let slice_ptr = bytes.as_ptr().cast::<Self>();
         let size = size_of::<Self>();
 
-        #[allow(clippy::incompatible_msrv)]
         if bytes.len() == size && slice_ptr.is_aligned() {
             // SAFETY: Size and alignment were just checked.
             unsafe { Some(&*slice_ptr) }
@@ -92,7 +91,6 @@ fn from_bytes_mut(bytes: &mut [u8]) -> Option<&mut Self>
         let slice_ptr = bytes.as_mut_ptr().cast::<Self>();
         let size = size_of::<Self>();
 
-        #[allow(clippy::incompatible_msrv)]
         if bytes.len() == size && slice_ptr.is_aligned() {
             // SAFETY: Size and alignment were just checked.
             unsafe { Some(&mut *slice_ptr) }
-- 
2.53.0


