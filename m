Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384D61112245
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 22:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEcJrPgZyc/UWW/p+aF/QXCo+fSirWWH6itFr3NT/78=; b=y9pP+qbmgD1NfI5A33I8N2X9VD
	ZYXhnU4WJQH69kr+Ty0ZdbnEeVDk3SmcsAik0SYQI34nOADHdKwh8Y66ZZHgdJk6Sv3UmKx2t2hoX
	oKdo5CAiQ0XAIm13e4rVtNtpMviL/fBVLblPfznCKybbeWeldDjKJA/iSJzG+x7mrEH+DK2AciOGa
	6wZlPoA6NHOWjeippzSS1yRwlw1Wz0ks8BUCavigtNNOHtZ5AK8ndxCV2GZ63LYK2T7pg7yXmDivc
	s0aiQANTQkdbQMm26xN1+KJc7uWEHPyyJC4kgInN5ygVM4cuAk2SKnRlE6yIQcX6oaRXSvOnNYvVL
	Pg0jDg/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84XJ-0000000GLZv-2pSG;
	Wed, 01 Apr 2026 22:59:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84XI-0000000GLXp-2DjP;
	Wed, 01 Apr 2026 22:59:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A8BB96183C;
	Wed,  1 Apr 2026 22:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA88C4CEF7;
	Wed,  1 Apr 2026 22:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084383;
	bh=0MM8/3CTNZDnO2QJpUmaXqxHB1Rvcg/ziIyw641Wqc0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=EGRYhbV4HQSbzNtKzfTww5lA+Uerrsg7IL+49jk5/fWwiQGmws0MFMhs8KmPYz0bF
	 3hpRw9q7h5+2vsLnlgC8jieG/3JmIARlD8LqGGxCtDEsOdOBbWTv/En/Z/2cYLAJ/g
	 KFjsHZnFL9/lOaqiBVjiOUmt3S211fe3JvmErJhlpKeBwep4sg/58vKaN+T1X2ZJIj
	 IXfJxWhpfJRuYHAo5iZpPOMvh3OuelV4yFlkJ3iT397bKazKJdSXENYbbXIHAdGnHU
	 ada09pio/4900X3hmHEj0e1yW+yEOAoruxQR92rFOFjCm6P7F+vzIHw2KdG6BFCIQS
	 SUk7ZWvKLfHKg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 05/33] rust: remove `RUSTC_HAS_COERCE_POINTEE` and
 simplify code
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, 
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
In-Reply-To: <20260401114540.30108-6-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-6-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434436.73816.122481804122122631.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=534; i=tamird@kernel.org;
 h=from:subject:message-id; bh=0MM8/3CTNZDnO2QJpUmaXqxHB1Rvcg/ziIyw641Wqc0=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFzsVnH0zxWC9R/ANvpJUecsms4XCUiWnE8NnXbaJM
 e9U1snrmMjCIMbFYCmmyJIoemhveurtPbKZ747DzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjoGOsYMXJwCMNX+LAx/uJbsjFg3f+LhiIYgi5c3D9v0XNCTe7U7u0BV8Zd9a8apLwz/K5gL3IJ
 uV04KNozfPuWL62X+Tw3F2+5yhDU41dklfM9lAAA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
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

On Wed, 01 Apr 2026 13:45:12 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> With the Rust version bump in place, the `RUSTC_HAS_COERCE_POINTEE`
> Kconfig (automatic) option is always true.
> 
> Thus remove the option and simplify the code.
> 
> In particular, this includes removing our use of the predecessor unstable
> features we used with Rust < 1.84.0 (`coerce_unsized`, `dispatch_from_dyn`
> and `unsize`).
> 
> [...]

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

