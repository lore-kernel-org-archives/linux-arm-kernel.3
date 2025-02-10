Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C240AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 16:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nfqPS2lhPU1dzZEUGrsJGI43zV+HOtW8Mmns6MUEHpM=; b=p6UKZZKQ9MnZM+ZctcvtPYAqDa
	mfwYBhZPkhQyVc/q1hKOHxMHkLVadW9YJSg3ow+690Pe1WzI+4IENdgsWZ2sDCsogacA5P9MON0g4
	mAggCFvjLFZ8TnEjYAFk2ez06CUCwsiF4Rl7SEM1p+JsczkK7pTfgrvBpWQqhuLmoX1NCm2B5HzE1
	XRzJ2tVM0G0HnMZIcOt9I5WhUN+vANv1wFM2MBDJyq/Lz0U6sbK83lwW/km68dg9U+6qbEN2JXXCZ
	68ASSlB1KsYkTvgWQkr70+WKqyZZjSqek3/x44GkQrBVzqETWMW8bPDrEt0oA349TvdxDaIHFO98L
	skVq4s+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWqY-00000000YSh-1j4q;
	Mon, 10 Feb 2025 16:41:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWnf-00000000Y1M-0mPs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 16:38:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5F882A41AB4;
	Mon, 10 Feb 2025 16:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF6EC4CEDF;
	Mon, 10 Feb 2025 16:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739205501;
	bh=BrlyBYOHdwmEYDayFxtlpA2iHNc6mrkE85rK5gs1YDc=;
	h=From:To:Cc:Subject:Date:From;
	b=j5rBXBskdQQ38yxaaxqxcwOdrQ2n2Dl6Zq0oIrI3k4mWojL9/cCGlYVeEp5XEJOS7
	 jPngsYrLr1GuSsaEL/WxEmMAUXLp1GtbV4VPsi7DAmD9g1x0jAQpgG1VtrK1O+ED9/
	 7JOvaJJSZhi7B8TbX4SUrdvRZ6ARbeFOmTUkaD5QYU+xk1QUL/uh6sORIBnS8SUk67
	 ult7oNQFW7EQubwCCSO4IbkaZyRPoXApc9QXXUHZit8/w5bgyDLRbH0b2qmTpxWOJa
	 q8F1/Xa/7x2y8pISaNDSMlW4ZbsFGAgWSzraNt6ZRni6ttjiNkg+lN9WnEGUnAzxdx
	 io3Bh9dt7+mBQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org (moderated for non-subscribers),
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	stable@vger.kernel.org,
	Matthew Maurer <mmaurer@google.com>,
	Ralf Jung <post@ralfj.de>,
	Jubilee Young <workingjubilee@gmail.com>
Subject: [PATCH] arm64: rust: clean Rust 1.85.0 warning using softfloat target
Date: Mon, 10 Feb 2025 17:37:32 +0100
Message-ID: <20250210163732.281786-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_083823_353911_E7BE20D3 
X-CRM114-Status: GOOD (  13.55  )
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

Starting with Rust 1.85.0 (to be released 2025-02-20), `rustc` warns
[1] about disabling neon in the aarch64 hardfloat target:

    warning: target feature `neon` cannot be toggled with
             `-Ctarget-feature`: unsound on hard-float targets
             because it changes float ABI
      |
      = note: this was previously accepted by the compiler but
              is being phased out; it will become a hard error
              in a future release!
      = note: for more information, see issue #116344
              <https://github.com/rust-lang/rust/issues/116344>

Thus, instead, use the softfloat target instead.

While trying it out, I found that the kernel sanitizers were not enabled
for that built-in target [2]. Upstream Rust agreed to backport
the enablement for the current beta so that it is ready for
the 1.85.0 release [3] -- thanks!

However, that still means that before Rust 1.85.0, we cannot switch
since sanitizers could be in use. Thus conditionally do so.

Cc: <stable@vger.kernel.org> # Needed in 6.12.y and 6.13.y only (Rust is pinned in older LTSs).
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>
Cc: Ralf Jung <post@ralfj.de>
Cc: Jubilee Young <workingjubilee@gmail.com>
Link: https://github.com/rust-lang/rust/pull/133417 [1]
Link: https://rust-lang.zulipchat.com/#narrow/channel/131828-t-compiler/topic/arm64.20neon.20.60-Ctarget-feature.60.20warning/near/495358442 [2]
Link: https://github.com/rust-lang/rust/pull/135905 [3]
Link: https://github.com/rust-lang/rust/issues/116344
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
Matthew: if you could please give this a go and confirm that it is fine
for Android (with sanitizers enabled, for 1.84.1 and 1.85.0), then a
Tested-by tag would be great. Thanks!

I would like to get this one into -rc3 if possible so that by the time
the compiler releases we are already clean.

I am sending another patch to introduce `rustc-min-version` and use it
here, but I am doing so after this one rather than before so that this
fix can be as simple as possible.

 arch/arm64/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 358c68565bfd..2b25d671365f 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -48,7 +48,11 @@ KBUILD_CFLAGS	+= $(CC_FLAGS_NO_FPU) \
 KBUILD_CFLAGS	+= $(call cc-disable-warning, psabi)
 KBUILD_AFLAGS	+= $(compat_vdso)

+ifeq ($(call test-ge, $(CONFIG_RUSTC_VERSION), 108500),y)
+KBUILD_RUSTFLAGS += --target=aarch64-unknown-none-softfloat
+else
 KBUILD_RUSTFLAGS += --target=aarch64-unknown-none -Ctarget-feature="-neon"
+endif

 KBUILD_CFLAGS	+= $(call cc-option,-mabi=lp64)
 KBUILD_AFLAGS	+= $(call cc-option,-mabi=lp64)

base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
--
2.48.1

