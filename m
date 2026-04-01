Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799ABD3517A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JxXn14BS+Kqq/oucH24B3ORTRUASx2APtAiY7561IWY=; b=EqVao5lLYQ83ybCGq2IPvFecta
	R4Sd8tF3DEssdeMFB6nqQcS7kgHEgONpjVHBh6IDephXLr9U0HOpHdSAaAwsr9s1rjYLmDv9UTkkJ
	BbGnr+Z3PqLJufo10YHcqHeg/8eyS+DD+P8PZ/RE5PFwOI/KV8iZsmsFjgFKNtD0CARms8uQAbB7G
	feoiPn+Mjcqsw9iKVqy6eWf4dxo6HyGRUGwdrsjvKldDCsWw+yCMKzPWkimmScY4jtFg+oIZT/4oz
	GJtct8z2oZL3sXBLnEWkLsgnYCaF9SB3YPC8pmSPRNga9Owj236qdnQDtUaZPGa6AkaWDn1Q1FETb
	5aSj0K3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u5f-0000000EixL-1kc2;
	Wed, 01 Apr 2026 11:50:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u5e-0000000EiwM-3TWJ;
	Wed, 01 Apr 2026 11:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JxXn14BS+Kqq/oucH24B3ORTRUASx2APtAiY7561IWY=; b=BOgGu+NtTj/3UqKaGddSZpm0P0
	bfhbpxVwF4at8j3vhUZYPSCPU5ojLZHr28b/Is4wDM8oBHaWH9NJSxo89g924S0pI/nwb+QL+ja/o
	NNAkiVAeAl5eI/VC1XmZYIpD1G/2yREUl70cYu9LrZKalGVWVTXsz8wEElUaDdsrl6MJ0w1yAuYup
	mJh3JzntfckiYW8FxqHwg74qiKqNYwQB/OeLXFGHH6Gq46boJFwac04Yg3LgK+DbfyphHXD8mIL5G
	6fLXCHyWUdb9H6iQJJ//jup6aEZbhSdAG1soeXuTGSdJfBP6I2soRh9OP8WDB+GIDQ8fAJ19RPAK4
	53FpXXlA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u5Z-00000000FUE-0aQF;
	Wed, 01 Apr 2026 11:50:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77B4340437;
	Wed,  1 Apr 2026 11:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFE8C4CEF7;
	Wed,  1 Apr 2026 11:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044223;
	bh=PqI1bYJ4FCrbIrmuEKTmldqC0slnhQrUlTQ7imeH2Xw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ItR6p4/Yc+nHji3wl3KUxbJ33NmAJHpvcFwT9PTjg2oSVZNOz37/llD5plurOUFoq
	 Rj6XsVPjrS6u+JCfyT85bUeamLAjiNB1oNaiT+axluC0s7Pj+FYmYV9FQ/2oWjP4aF
	 iGV+rsJMoa6gIkSBun+AUqT6C9iqAHuOVER7yU3112+mdIBnu+/20YfgG7i69Ez91E
	 1AIAC0coViVeE3+NwZ/w559DeJFlj8LnLoYci2Po4dRc4UCIPMEV4azENLjsOb2DOF
	 P6Ab7+maJovrhEV9zROgky/+XmWAkK6Do+/7vX0TEA0Ll+1deRn2AEoMvHaLb4Y+sg
	 MqtWGiRHh4hng==
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
Subject: [PATCH 22/33] docs: rust: quick-start: openSUSE provides `rust-src` package nowadays
Date: Wed,  1 Apr 2026 13:45:29 +0200
Message-ID: <20260401114540.30108-23-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_125025_556571_45BF76AB 
X-CRM114-Status: UNSURE (   9.25  )
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

Both openSUSE Tumbleweed and Slowroll provide the `rust-src` package
nowadays [1].

Thus remove the version-specific one from the Quick Start guide.

Link: https://software.opensuse.org/package/rust-src?search_term=rust-src [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/quick-start.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index 152289f0bed2..642efce04ee8 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -84,7 +84,7 @@ openSUSE
 openSUSE Slowroll and openSUSE Tumbleweed provide recent Rust releases and thus
 they should generally work out of the box, e.g.::
 
-	zypper install rust rust1.79-src rust-bindgen clang
+	zypper install rust rust-src rust-bindgen clang
 
 
 Ubuntu
-- 
2.53.0


