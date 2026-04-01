Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C55D35162
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1rCDLTwpSzKMkgmhG01RsHnD5W+0ketztA3YcW+P+g=; b=z5UI6WIkL/sdYXcTtF9wGc0bWj
	2pQ6jKnqiBAyfWzGvhIqcXHa6f7j5fB8frOtTGT8b1lbKFqfRgK3XMKHMwdyBFo+AB3bmtfV9db0S
	xhdnXAi1BnbpEMBtMPR3XwMIguq22x6+rzAk8Ddx5oYlNw1ANnH8UFEa4ihOXFANejS/NxbqNqXVa
	V8C3GeAMTSP98EqBF6OS/h/MstzlwlyEYnnluPPEW4aS3IQqPJ7wmfqryakC69dc7ihAIfAXgZqNd
	P1ce7A4FAkjDpN3hKXqH3JN8oF/D3QzWA0V9fAyAdUjisUuifTwh5rw+0ENRrPfDYPki83dKfEV8I
	RKT4UtuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u6c-0000000Ejmr-1AVo;
	Wed, 01 Apr 2026 11:51:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u6Z-0000000Ejkk-42B0;
	Wed, 01 Apr 2026 11:51:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=i1rCDLTwpSzKMkgmhG01RsHnD5W+0ketztA3YcW+P+g=; b=aALvyaEqUZFeiE4ITDZpGZGyWB
	p2J7LzbOQKs+9Zz0naG2xjGoFOJbWzhq6Di2zF98uYiXfVW0BPEPlBsV28QnQfIJ8gOEmUQJ+zahx
	Den90KfbT4wFRsvTP9ToJHyK3I+TSOU944a1+FGemyAbDuo4I2fDgKPYxbFjJS8qUZo9+5GRU+dqI
	gSaLR3Wr4qF8/rMBv24k1fIPfQe7D4n6rqclsiM1L/jkkEW1MfR+vs1vA8y/SvwTmp3kbFrDdfTzE
	J+/aHmUfwv80M24I/832bVGzxi1FUefVC+t9RKcga3L7uDY5pIFYPt2GLiLfxD70gVOt++s2dmk3x
	vNBIRXAg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u6V-00000000FpQ-3paD;
	Wed, 01 Apr 2026 11:51:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A71D404D6;
	Wed,  1 Apr 2026 11:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AAF0C116C6;
	Wed,  1 Apr 2026 11:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044282;
	bh=zBRgkfbt3hF9WvqxM8XN0aG8ALClzrJ4tfRHlURA+/8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iITjMsfhfcTYUWXW6qoQkraYuvMY0slG34Cknkq2VHyvat3oaJRuW0fZ+/koONznL
	 SPdU99XrlrEP5k8CChuk0LAjmH1IitsUhLZv2gSSl2RW0XxgMpM2bkRAYRJAr4LAca
	 lwlWeeG0+4pPPo3E5MWDbDXuJv07Vcm+IFEzC12fdTyQYiMlmOdOIBZyVwEYiVs+T0
	 mvSRJh8CrjRcRnyHxBcF/zH6E1feLSaQUx3OPc8l5NRdZGdjusjdGfUPQF6ij/n0KC
	 eeR+DlUNUhIyF+MboRGXbUUdBuglvWFtU/G4DG9cD0Wrr6a6k9Twbor59rqsvwp1T4
	 2MDeXpey3+CMA==
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
Subject: [PATCH 27/33] docs: rust: quick-start: remove Nix "unstable channel" note
Date: Wed,  1 Apr 2026 13:45:34 +0200
Message-ID: <20260401114540.30108-28-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_125124_413810_0A6044D0 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

Nix does not need the "unstable channel" note, since its packages are
recent enough even in the stable channel [1][2].

Thus remove it to simplify the documentation.

Link: https://search.nixos.org/packages?channel=25.11&query=rust [1]
Link: https://search.nixos.org/packages?channel=25.11&query=bindgen [2]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/quick-start.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index 1518367324fe..5bbe059a8fa3 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -68,8 +68,8 @@ of the box, e.g.::
 Nix
 ***
 
-Nix (unstable channel) provides recent Rust releases and thus it should
-generally work out of the box, e.g.::
+Nix provides recent Rust releases and thus it should generally work out of the
+box, e.g.::
 
 	{ pkgs ? import <nixpkgs> {} }:
 	pkgs.mkShell {
-- 
2.53.0


