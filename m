Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AC0D35162
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XpNiZbKMnz0WVLpbCNeryZrQ6cmLTD9Vgw6NfDDf7kk=; b=kA3h2ohfmtkjDjHqNnZqQyKHN6
	t2+E/aDxwWjiCYgeZT503ZdN8z2dq9PPOXlCIX1E5z2g3CAW+j+2sMsYWbnyNZ8CbmfqVrxeyutPt
	JiJy+I4ZyYSMOe/N+HEiNYM3C3wtcts3N22f8+Io5vhI8itrRTynaJyvccCBdXGkbQctnnGix7jIE
	gMLFhyGZHaUEDUVZxzlqdMCtRLEV34PYTR13E7KXSrO2xnXtr9BUrO5595vZAC7aZnTqC2PYdr96k
	iBP0n9VOKkfrxEGGaF8dE2wSFF0eCRHAFdq7hefwNhNwGGKycfkGHNorWO/DpKh4K6VgN9UfUFRUU
	AT2ttf4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u5r-0000000Ej7A-09AM;
	Wed, 01 Apr 2026 11:50:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u5p-0000000Ej5a-2aOv;
	Wed, 01 Apr 2026 11:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XpNiZbKMnz0WVLpbCNeryZrQ6cmLTD9Vgw6NfDDf7kk=; b=U8Y0jWkWh70re5aa1SVQ1ghMZ5
	/sbD7SY4yiNuggW2avMc7N9H1XJRIGmUnX7FWj2+6hgZcvV/pSEelSSHGsphSMZHD6l5UoCRAXfxI
	HErvIT1c6AHoTrg55ojiRpysh6xzxbBVklKb4KiqP1k4V6tHU7t5NWahwZg+oOmJs1NE0Mpyim+El
	JN5Or+z2YVDNnLrPhKvrZcuelWDjDtnB580y1taYIL1We7Op5iaa2Rs/DaPJ1bdiC7T9Xo4BhJ+Wq
	yHlcY3DSynSxLhdJlr7UIFOO5Svos7M9iKDQsYOyLY4RxEm21DKvNHcshuuVFV6Bh7gw1BwPFa+EQ
	liPStAgA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u5m-00000000FZe-03lA;
	Wed, 01 Apr 2026 11:50:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 415E540572;
	Wed,  1 Apr 2026 11:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC3B0C2BCB3;
	Wed,  1 Apr 2026 11:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044235;
	bh=KXEoYDiY4tZg0azDFGHapuIK6YBUiFWm2HgKzXD3/qA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z6epqT/35SK/XW00qh/dGMEY8eQVcyHYx4INTRg3DGJwwZO2DEpfLPeoC6WbWMBWj
	 fOBMfjA+2XvvlHd77JbpGAWDf4jvDSWUSLaonqCi4v/JbkT9B3AGle1XggFswn+a2w
	 Ck4aCqW9LerCrHjefnrFVAcqf1Pvnb0JE9Mp4FXEvuvoBDMYEYvChLTBRxv5YFk+Yb
	 XfA2+ROngYg8eVEzlQ/9BscCvvEDBa5fxhsFNA1Y29pdLbXSbNsilKjFii99Mi3RCN
	 NKgUqcGQQxj72UVwLp60Qzyy8WMCyoqrtqAsDBb2a9muO/Ua87fRO8oi7B5V5/t/kE
	 Bl6pQowZGrc8Q==
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
Subject: [PATCH 23/33] docs: rust: quick-start: update Ubuntu versioned packages
Date: Wed,  1 Apr 2026 13:45:30 +0200
Message-ID: <20260401114540.30108-24-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_125038_754514_B3462E80 
X-CRM114-Status: GOOD (  12.47  )
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

Now that the minimum supported Rust version is bumped, bump the versioned
Rust packages [1][2][3][4] to that version for Ubuntu in the Quick
Start guide.

In addition, add "may" to the `RUST_LIB_SRC` line since it does not look
like it is needed from a quick test in a Ubuntu 24.04 LTS container.

Link: https://packages.ubuntu.com/search?suite=all&searchon=names&keywords=rustc [1]
Link: https://packages.ubuntu.com/search?suite=all&searchon=names&keywords=bindgen [2]
Link: https://launchpad.net/ubuntu/+source/rustc-1.85 [3]
Link: https://launchpad.net/ubuntu/+source/rust-bindgen-0.71 [4]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/quick-start.rst | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index 642efce04ee8..54fe491deb7d 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -112,33 +112,33 @@ Though Ubuntu 24.04 LTS and older versions still provide recent Rust
 releases, they require some additional configuration to be set, using
 the versioned packages, e.g.::
 
-	apt install rustc-1.80 rust-1.80-src bindgen-0.65 rustfmt-1.80 \
-		rust-1.80-clippy
-	ln -s /usr/lib/rust-1.80/bin/rustfmt /usr/bin/rustfmt-1.80
-	ln -s /usr/lib/rust-1.80/bin/clippy-driver /usr/bin/clippy-driver-1.80
+	apt install rustc-1.85 rust-1.85-src bindgen-0.71 rustfmt-1.85 \
+		rust-1.85-clippy
+	ln -s /usr/lib/rust-1.85/bin/rustfmt /usr/bin/rustfmt-1.85
+	ln -s /usr/lib/rust-1.85/bin/clippy-driver /usr/bin/clippy-driver-1.85
 
 None of these packages set their tools as defaults; therefore they should be
 specified explicitly, e.g.::
 
-	make LLVM=1 RUSTC=rustc-1.80 RUSTDOC=rustdoc-1.80 RUSTFMT=rustfmt-1.80 \
-		CLIPPY_DRIVER=clippy-driver-1.80 BINDGEN=bindgen-0.65
+	make LLVM=1 RUSTC=rustc-1.85 RUSTDOC=rustdoc-1.85 RUSTFMT=rustfmt-1.85 \
+		CLIPPY_DRIVER=clippy-driver-1.85 BINDGEN=bindgen-0.71
 
-Alternatively, modify the ``PATH`` variable to place the Rust 1.80 binaries
+Alternatively, modify the ``PATH`` variable to place the Rust 1.85 binaries
 first and set ``bindgen`` as the default, e.g.::
 
-	PATH=/usr/lib/rust-1.80/bin:$PATH
+	PATH=/usr/lib/rust-1.85/bin:$PATH
 	update-alternatives --install /usr/bin/bindgen bindgen \
-		/usr/bin/bindgen-0.65 100
-	update-alternatives --set bindgen /usr/bin/bindgen-0.65
+		/usr/bin/bindgen-0.71 100
+	update-alternatives --set bindgen /usr/bin/bindgen-0.71
 
-``RUST_LIB_SRC`` needs to be set when using the versioned packages, e.g.::
+``RUST_LIB_SRC`` may need to be set when using the versioned packages, e.g.::
 
-	RUST_LIB_SRC=/usr/src/rustc-$(rustc-1.80 --version | cut -d' ' -f2)/library
+	RUST_LIB_SRC=/usr/src/rustc-$(rustc-1.85 --version | cut -d' ' -f2)/library
 
 For convenience, ``RUST_LIB_SRC`` can be exported to the global environment.
 
-In addition, ``bindgen-0.65`` is available in newer releases (24.04 LTS and
-24.10), but it may not be available in older ones (20.04 LTS and 22.04 LTS),
+In addition, ``bindgen-0.71`` is available in newer releases (24.04 LTS),
+but it may not be available in older ones (20.04 LTS and 22.04 LTS),
 thus ``bindgen`` may need to be built manually (please see below).
 
 
-- 
2.53.0


