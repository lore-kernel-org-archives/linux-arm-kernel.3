Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADD0D3517A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BU4NwWDia/vOxJ1aLikEN7w3TbIx4erGZnWp+4ITe+0=; b=4WzhfNtw/jVt6iPE/MUiv4jRik
	AekrPFY+C1/WleKNQLokhUYvnaUUNsaZyNrpU2xzgMX6X6N5vOdOTVL5HYeI5rgAcpLz42rC5pIGT
	QiAhUjX0l03P5nxJo5rEm9xPE1w2nIz1/yXi/abIClO+B/2P8f1qrCr4TKobrA8MEk7v4RaewdWaJ
	uvA4J9OpMUDImzK+7mBiRUIIuWIB1fR38d19237YS4U7sfsFmRE5Ux1Jnfz4Dv+8afrubXXdy3X4/
	gtDLxLbrsn/mDa+B2PbCwH9P2XIvXlu3DN/iEzgKW/OFjC4l7jRl3wmeBAvYkkHwUGp81AKD/wtUv
	cpkHxnTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u6D-0000000EjSX-3iow;
	Wed, 01 Apr 2026 11:51:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u6C-0000000EjQF-1RAS;
	Wed, 01 Apr 2026 11:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BU4NwWDia/vOxJ1aLikEN7w3TbIx4erGZnWp+4ITe+0=; b=DjMKHv5etX9bH5cvM+3/1EkNij
	96Mp1JuvsjP8BLjZ8vdJFIXvMoJliQ7EubfaINiAMFVYHqxKb4zgHLJNvE5Wkt7sShN6ow9tM5dsg
	bG3/m+z3N2ZObQfQ1D8Vklr0RuQF6oyN0wrOkQKKEJ5WZFobjNKd9HQEURwPPmG8f7yeoxlfueNkl
	HfKYJkcihMM5WPIeWxh3+qE38kSmy7ew8fwSXtuP9kN7WziOr5Yln8SteZuUT5NlIhg5qskYMFR8l
	+BdBecBx8lHV0z+TFeNWW3aqIVNdMinDH0BfPY8X6goq3QJs92+ZDYxva5hU1EMH31v+qfmob3RaL
	xPsJ1REQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u68-00000000Ffu-0sqf;
	Wed, 01 Apr 2026 11:51:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E972E40552;
	Wed,  1 Apr 2026 11:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A793C4CEF7;
	Wed,  1 Apr 2026 11:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044258;
	bh=ZrS7YCyshnbs/lG/9j9L7W/ZUrAuF338JPwI0nwq6Ho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fYUKktNtjBtnO2jEekVdFzAXCPxvMmq8cOZ/wimER2kJOuz26TYi2q5bk91NF6CFY
	 V3uRQuToa4yd5/BlRrJuDUAvl/Ng8LmL71ojncQB2XFtcInSO8RsXWX1UcDolbNEKf
	 Vr7CCsu4JLP8hJ8Kq7urO0JEocaF0r6VbZa+42Sdln5aiR3/s6R5CaAOkIYDTOBYFN
	 jQ19XQq/9YUv1eHqK24bolOhTgYGxRPfjpfeAX42W17zK+3HMCGkzXRWdt2m3/51bF
	 jzN98RjCjBcK57ESqOPlvU09ERPYNtXiyClFAHc+QnLlv5x2uSLTqHwOePbncyE2kZ
	 tpwl4A5SNvXTg==
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
Subject: [PATCH 25/33] docs: rust: quick-start: add Ubuntu 26.04 LTS and remove subsection title
Date: Wed,  1 Apr 2026 13:45:32 +0200
Message-ID: <20260401114540.30108-26-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_125100_657472_301C4EDE 
X-CRM114-Status: GOOD (  10.84  )
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

Ubuntu 26.04 LTS (Resolute Raccoon) is scheduled to be released in a few
weeks [1], and it has a recent enough Rust toolchain, just like Ubuntu
25.10 has [2][3].

We could update the title and the paragraph, but to simplify and to
make it more consistent with the other distributions' sections, let's
instead just remove that title. It will also reduce the differences
later on to keep it updated. Eventually, when we remove the remaining
subsection for older LTSs, Ubuntu should be a small section like the
other distributions.

Thus remove the title and add the mention of Ubuntu 26.04 LTS.

Link: https://documentation.ubuntu.com/release-notes/26.04/schedule/#resolute-raccoon-schedule [1]
Link: https://packages.ubuntu.com/search?keywords=rustc&searchon=names&exact=1&suite=all&section=all [2]
Link: https://packages.ubuntu.com/search?keywords=bindgen&searchon=names&exact=1&suite=all&section=all [3]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/quick-start.rst | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index 34c39f208333..db08c3a03a4f 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -90,10 +90,7 @@ they should generally work out of the box, e.g.::
 Ubuntu
 ******
 
-25.10
-~~~~~
-
-The latest Ubuntu releases provide recent Rust releases and thus they should
+Ubuntu 25.10 and 26.04 LTS provide recent Rust releases and thus they should
 generally work out of the box, e.g.::
 
 	apt install rustc rust-src bindgen rustfmt rust-clippy
-- 
2.53.0


