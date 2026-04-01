Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4038D35177
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kT8s722ovhtbxKm8S2E/sotY5kh18huBCi/mWGnKIk=; b=P3oMiy1Vbx67ZYAHX3olMAem8V
	YhGFrxmJWltLdTglC116uiMFJ0qZR/D7dH2DifqB7b321lThJFjJjwOSBqVjPDMjMvvbD6OHJSfgR
	wKP6oqqI68aTR/aKVIx6CX5eyx2R3o1UPfALDBK9KVGhsNxvk7D6Uo2ccv6/vWBsL0nw1mXwJp1Fv
	+8CsieWJEecPYkAIoB8qHG5JDdEDCwCrjB59XkI6C4QqrZyYCy/pAFfD6/WhgIsKUMH5ixgrkOrC3
	Ip/H2iZGo3n9ZUpWTJpCTEK8YG395GhgSn5dIh95JsGSUB6tQ3HcwDDWMytZWW1uqdVRVcM3P/+9E
	jVCqc3Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u7X-0000000Ekcg-2HsQ;
	Wed, 01 Apr 2026 11:52:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u7W-0000000Ekae-0mZL;
	Wed, 01 Apr 2026 11:52:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8kT8s722ovhtbxKm8S2E/sotY5kh18huBCi/mWGnKIk=; b=Uq2cJciFxBBprzR7E1X+aIb1Bd
	HateEefm0gI2mVY+qTkPjrC3LlUa9ydq/Mlp5pp32ySrury3woA22TXB8tePz+QYU0GeadQ+kbhwl
	ElSrYmyKNumbBugLdHXE4ML6jGmx9zRdXWaDAJA8iiNJxixtZfmLdwGozB+blgGYAyM2PgfDx8Up+
	ITM2ks10OHc/TZAuNkjYSt4qXjsG5OeFSJW5n7BLNKOAlXiLgCPnZuJ1j24tzl/6u56Tex/XSD/s6
	Lxp8LIP2nfWGXE+c7HVUVAwKIXFbUxBnltq1S3CoFyrkdGUWgq0rzc0RGnA/86Scdr/lwDlxrTLt3
	Z21Xqz9w==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u7S-00000000GCm-44Cq;
	Wed, 01 Apr 2026 11:52:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B15BE40919;
	Wed,  1 Apr 2026 11:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C32C2BCB2;
	Wed,  1 Apr 2026 11:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044341;
	bh=rmbcm0lGdPnutdStnqg0waumItTikO0U9rMNdtnv3yc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TcBvoubspcdQyo/6SD8RpK23KLdBlZmlyr+Q8oe4E3dFkmpEEorBsmt3GesO7Nl9q
	 YWS4m1in4cZ+dOT++Q1J8Ig3gXZ3l/Hig5Eq0rMW9FYKtKQyhyMus1JqK0WZx6+cBF
	 JUayEvXxkm9IOj16k6bywJiawbKZPnONK55YY01FSqb/NrgkEyVGWBIPdo/SvIYWic
	 U4AVc/BrZqDX7suU+KqtSQ4Q52UqYwQ2LYV11NVcOdsn5R4QiS61WDhULH+KewBvAe
	 /h+DQTiY+hPt11we7Vp7ycNYeVm2Tn/oACaSi3eP098GkbftxBkTZa4EkAWaXiFg9t
	 Bec4c3Sfzej1A==
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
Subject: [PATCH 32/33] rust: kbuild: support global per-version flags
Date: Wed,  1 Apr 2026 13:45:39 +0200
Message-ID: <20260401114540.30108-33-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_125223_411396_2F9DF5BF 
X-CRM114-Status: GOOD (  11.65  )
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

Sometimes it is useful to gate global Rust flags per compiler version.
For instance, we may want to disable a lint that has false positives in
a single version [1].

We already had helpers like `rustc-min-version` for that, which we use
elsewhere, but we cannot currently use them for `rust_common_flags`,
which contains the global flags for all Rust code (kernel and host),
because `rustc-min-version` depends on `CONFIG_RUSTC_VERSION`, which
does not exist when `rust_common_flags` is defined.

Thus, to support that, introduce `rust_common_flags_per_version`,
defined after the `include/config/auto.conf` inclusion (where
`CONFIG_RUSTC_VERSION` becomes available), and append it to
`rust_common_flags`, `KBUILD_HOSTRUSTFLAGS` and `KBUILD_RUSTFLAGS`.

An alternative is moving all those three down, but that would mean
separating them from the other `KBUILD_*` variables.

Link: https://lore.kernel.org/rust-for-linux/CANiq72mWdFU11GcCZRchzhy0Gi1QZShvZtyRkHV2O+WA2uTdVQ@mail.gmail.com/ [1]
Link: https://patch.msgid.link/20260307170929.153892-1-ojeda@kernel.org
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Makefile b/Makefile
index 1a219bf1c771..20c8179d96ee 100644
--- a/Makefile
+++ b/Makefile
@@ -834,6 +834,14 @@ endif # CONFIG_TRACEPOINTS
 
 export WARN_ON_UNUSED_TRACEPOINTS
 
+# Per-version Rust flags. These are like `rust_common_flags`, but may
+# depend on the Rust compiler version (e.g. using `rustc-min-version`).
+rust_common_flags_per_version :=
+
+rust_common_flags += $(rust_common_flags_per_version)
+KBUILD_HOSTRUSTFLAGS += $(rust_common_flags_per_version)
+KBUILD_RUSTFLAGS += $(rust_common_flags_per_version)
+
 include $(srctree)/arch/$(SRCARCH)/Makefile
 
 ifdef need-config
-- 
2.53.0


