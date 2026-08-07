Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61632C5AD05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 22:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fTBBp/gNut3PNIaiIMKAtMdux5qfIbqgE4sHisRqcBA=; b=A2NCPlJf9jrVJI34j8U2/nS7FZ
	xKljTMdIWj4xLrAp+HFIy1EmCCwc/umDtNOXYAf/GWnWjeFEmQeCHLY2hv+d4FXnQ4bG/SF3PU/lm
	VoDbeN9qAfiWFKWAeTF3kCJ/BgpGiV9Pj4nTgmkimzApkjh6o9Gx0OeGhw5lnLyMyl7w83Z0oWcv3
	SufvzvbLenKkge/tnX82VfuM/4caOz0IVwZffivZdOxFJeHA6p+XwHTcvbIQkvN9EUI9b8kmmUjtC
	X0MW28i2vpAJ9kwWwxQAzZjQNqmRTWNPgfx2jbRBbfWvb9gr1/x7cJkBdHydeEHR6GA36p5MCEYiS
	/w4q8y4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsSpu-00000008nkr-3B4G;
	Fri, 07 Aug 2026 22:14:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsSpt-00000008nke-2I1N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 22:14:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B161643864;
	Fri,  7 Aug 2026 22:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193981F000E9;
	Fri,  7 Aug 2026 22:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786140880;
	bh=fTBBp/gNut3PNIaiIMKAtMdux5qfIbqgE4sHisRqcBA=;
	h=From:To:Cc:Subject:Date;
	b=Q9HEd20vmC6B7tE6GWWGc/regbVKdRgKtew6QPAE46eqklmJhR8R4TorjdsI/LiDR
	 0e9cldaGfdL/2laVsmkEoD55us3nn2mhX2H4Ef09Xk+CYH0cwX7F48rO3PyiFNCRg4
	 uEgmBMbFdgGYS2VaZP22ZSg6yXArJIBjUHoEMZvdO6ZcemWzbcXi0+iw2YP3MTSpWv
	 QyFic0TGkC6AsPpkKscfhcpg1550TvAV9NqvU85VaNhK0QkneIDpeKmfP7+/cdyPmw
	 h1qxrYCTgVLM+Wm/zJAvnNqf0kSzFoApUIL/wjmoXiuH6LC60XDxg8mx4fMBld5IsT
	 RYlqDJfJFmRxA==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
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
	rust-for-linux@vger.kernel.org,
	Drew Fustini <fustini@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers),
	soc@lists.linux.dev,
	WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH] rust: bug: fix `dead_code` warning in `warn_on!`
Date: Sat,  8 Aug 2026 00:14:29 +0200
Message-ID: <20260807221429.155946-1-ojeda@kernel.org>
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

On arm and loongarch64, or under `CONFIG_BUG=n`, the upcoming SRCU
abstractions from commit

  59cf3a5bda61 ("rust: sync: add SRCU abstraction")

use `warn_on!`, which in turn warns:

    error: constant `WARN_ON_FLAGS` is never used
       --> rust/kernel/bug.rs:126:19
        |
    126 |               const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
        |                     ^^^^^^^^^^^^^
        |
       ::: rust/kernel/sync/srcu.rs:106:12
        |
    106 |           if crate::warn_on!(
        |  ____________-
    107 | |             // SAFETY: By the type invariants, `self` contains a valid and pinned `struct srcu_struct`
    108 | |             // and `srcu_readers_active()` only checks the active reader count.
    109 | |             unsafe { bindings::srcu_readers_active(ptr) }
    110 | |         ) {
        | |_________- in this macro invocation
        |
        = note: `-D dead-code` implied by `-D warnings`
        = help: to override `-D warnings` add `#[allow(dead_code)]`
        = note: this error originates in the macro `crate::warn_on` (in Nightly builds, run with -Z macro-backtrace for more info)

The reason is that `warn_flags!` discards both arguments in those cases,
and so the `const` becomes unused. And since it is a macro, it went
unnoticed so far.

Thus fix it by simplifying by removing the `const`.

Cc: stable@vger.kernel.org
Fixes: dff64b072708 ("rust: Add warn_on macro")
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
Either this or adding an underscore.

 rust/kernel/bug.rs | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
index ed943960f851..874adb93cdfe 100644
--- a/rust/kernel/bug.rs
+++ b/rust/kernel/bug.rs
@@ -123,9 +123,10 @@ macro_rules! warn_on {
         const _COND_STR: &str = file!();

         if cond {
-            const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
-
-            $crate::warn_flags!(_COND_STR, WARN_ON_FLAGS);
+            $crate::warn_flags!(
+                _COND_STR,
+                $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN)
+            );
         }
         cond
     }};

base-commit: dc01dfb37b34beeefcfe1c3055364d41a4070c7e
--
2.55.0

