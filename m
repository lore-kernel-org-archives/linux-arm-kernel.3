Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC968D35177
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJlWaieBGL4iuefoWZuMjZDRJ24GGyPWnojBIBdvKL8=; b=M/cxNCAxambJrW7+UxIGsQqhFH
	D4vYeUnmYTIaHx51eXgbk3GVWydXXIcm14v0BUb8oxki6D6SCggY5TBSYzGCW906OrbRCtUF3PXUR
	62vz4SIfI1Es7MesE+Z6ZzKizv8rmOu/rZ5T8DTu7u2gSqNWjLlwHqsM/J1Q8Fx8+hIQt2Q1f9v7U
	k8b58aIP+bpe1MZ7rkqdZR9XZ/J3cBmns1izzx0uKh3NGEezWMhiSlQjF5ciIL2gO9svJG6VBA22w
	gIGS+MYQoHxfIqmuSogDJhDiD4WGdK3bu9zzPQRYT/vWaHZLTcjdPg7f1iQQKWvSK0EiNTkRI12qU
	Yyu33RAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u6P-0000000EjcZ-2EhV;
	Wed, 01 Apr 2026 11:51:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u6N-0000000Ejal-2VPQ;
	Wed, 01 Apr 2026 11:51:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HJlWaieBGL4iuefoWZuMjZDRJ24GGyPWnojBIBdvKL8=; b=DiIZFlCOWjvY2ENZfORrzXv2wj
	7/slV7khulkqBcJZ3d+jk5pEIeGKpRltWyu/jfW5h1U0kz3/ASv/HGDxLsTmroS/5vcypIlOAI99E
	Nl3lAoUeQ1p8++psU8Z64SZpUrUyfM22lWpswS6SIJLsZxrdsHvQPhMTSX+lCjx9O4oL5Jq0CM2TT
	ki57Y/pQxT4ZwsUjwtYcSs31QM5UfJ8FfMMlV7HaGYwA66zLT7omul63TDvH1rK08Za3cBdJDe492
	KLcCVN+as+qOOL8j0fny1EKTCTR0PxBJc4aGAhOLYXsbEcETtJh4U8E/dg2P3o/GUyrlDxV586+lT
	ENhtOdDw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u6K-00000000FlZ-20SM;
	Wed, 01 Apr 2026 11:51:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC2CA404D6;
	Wed,  1 Apr 2026 11:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F5DC4CEF7;
	Wed,  1 Apr 2026 11:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044270;
	bh=iESh/PsAjDcxQq1FPvUHHfd+weV5KPEgRwQZ+Kj82r4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MMSjHj3hxQyMr3QOLPc9anPPOGIWvLjjfUs5B9icQA6qsTjz7U5bSiiQLz5Hoz/OZ
	 3YloS9ZOhT+qiN9KqpcVdJ/fLcbsTEZsVpLlIJR/p8UWfxVDZt/sNTHzb3Tb1udZ9E
	 jYKb+IF68+AxkebN//+Bv/5FcswBwbEnYjMPl5q4E8tRf1uFO6MDGiu0giHqkZrPMZ
	 B/JU0qy6HQc8IL0tBX9Pvko/kdINTPzrBMF75o1WUkXp4U9BqKKQmSf0bTLleTLfsz
	 9SSYwlPv8GbLy88Jt1O+HwrOoOXCjTR4QWXF2VgqHQ3s27vGf1rd5NqLc88kF63w+j
	 heSTJSaAyigww==
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
Subject: [PATCH 26/33] docs: rust: quick-start: remove Gentoo "testing" note
Date: Wed,  1 Apr 2026 13:45:33 +0200
Message-ID: <20260401114540.30108-27-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_125112_824553_5589C989 
X-CRM114-Status: GOOD (  10.27  )
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

Gentoo does not need the "testing" note, since its packages are recent
enough even in the stable branch [1][2].

Thus remove it to simplify the documentation.

Link: https://packages.gentoo.org/packages/dev-lang/rust [1]
Link: https://packages.gentoo.org/packages/dev-util/bindgen [2]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/quick-start.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index db08c3a03a4f..1518367324fe 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -57,8 +57,8 @@ of the box, e.g.::
 Gentoo Linux
 ************
 
-Gentoo Linux (and especially the testing branch) provides recent Rust releases
-and thus it should generally work out of the box, e.g.::
+Gentoo Linux provides recent Rust releases and thus it should generally work out
+of the box, e.g.::
 
 	USE='rust-src rustfmt clippy' emerge dev-lang/rust dev-util/bindgen
 
-- 
2.53.0


