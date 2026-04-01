Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5C2D35162
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3mxjFFO2Y93Wv3FsX31SAqouVteB5Kqt+bvkPFKp+0=; b=m7SQaqpbFkXBnsy+/nen5Tx3Ra
	/FrTmZ+lIQ5xtwthq+UW/skMaAlBvxooIZQXgIVIR9gIL/1wkl8ISBgTFpAjqbjGzASA2d2cq8Kkk
	Q2K7a1Qrbj85C1oQOdaoXYYZqzV6pwrGd1RRm8VUXA3MT0Zi0e/LUca8+rX48iHhRX615bNLCn4AF
	5yUVICOkebE74ZukMmkQMF0Z2b/tjewf1iekA5UNOFjEkKnYYaTgOIMvNHa84XSxmQsh0QseXmJy4
	8A7JYsrAVZ2AnGCgSojitIoCiJ0FSlOl0Ew2cVzrgGcO7174MUyvE7i+y+5eANxioiOVxTjlWp2f4
	SWm6tSOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u76-0000000EkEK-0JA1;
	Wed, 01 Apr 2026 11:52:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u74-0000000EkCI-1WrS;
	Wed, 01 Apr 2026 11:51:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04B9C408B9;
	Wed,  1 Apr 2026 11:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C070C4CEF7;
	Wed,  1 Apr 2026 11:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044317;
	bh=aZ7CkV02m73TgymHW6id2ohHebQcMp+UooNV/WCpxYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a2tJ6c9W9iABHNjYNfL/0mBtFgGwAUtGo9jT4oJbjkTLOc0Yo+AEpPKIParMZ1LNj
	 0sANrmLte5HVlY/RSowfUU1n6HJVpsbzGcrRxFYwfBYM+mr5AsX8sQv1gk5sj4H7wt
	 Dw7M4GzLoUzHr41RJA4HSozfVBTZlvmb01WCmT7Cpg4oqA0MoM9u8F3rYEJ84ZlHa/
	 l6ZHQwkSMoXTmsP6WHnxky2MzbKxBsA9VRTh/QtS8r/wLVDjLYI1nc1ywv3yacbrWe
	 OUhyb3YotIxHBUCZq8fmNmrB8uzKk1sfz69jzjTz+KCMR7GzlinoB3zsZ7EklUMIKY
	 cppDn06YQZSHg==
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
Subject: [PATCH 30/33] docs: rust: general-information: use real example
Date: Wed,  1 Apr 2026 13:45:37 +0200
Message-ID: <20260401114540.30108-31-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_045158_453901_AAEF0E48 
X-CRM114-Status: GOOD (  12.13  )
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

Currently the example in the documentation shows a version-based name
for the Kconfig example:

    RUSTC_VERSION_MIN_107900

The reason behind it was to possibly avoid repetition in case several
features used the same minimum.

However, we ended up preferring to give them a descriptive name for each
feature added even if that could lead to some repetition. In practice,
the repetition has not happened so far, and even if it does at some point,
it is not a big deal.

Thus replace the example in the documentation with one of our current
examples (after removing previous ones from the bump), to show how they
actually look like, and in case someone `grep`s for it.

In addition, it has the advantage that it shows the `RUSTC_HAS_*`
pattern we follow in `init/Kconfig`, similar to the C side.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/general-information.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/rust/general-information.rst b/Documentation/rust/general-information.rst
index 91535b2306ed..09234bed272c 100644
--- a/Documentation/rust/general-information.rst
+++ b/Documentation/rust/general-information.rst
@@ -157,5 +157,5 @@ numerical comparisons, one may define a new Kconfig symbol:
 
 .. code-block:: kconfig
 
-	config RUSTC_VERSION_MIN_107900
-		def_bool RUSTC_VERSION >= 107900
+	config RUSTC_HAS_SPAN_FILE
+		def_bool RUSTC_VERSION >= 108800
-- 
2.53.0


