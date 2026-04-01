Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D471112242
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvGjkd7xOwKr9LPSDq39hiyQcJLp2mIOYd00gU2wFro=; b=da0pcWdxWfbGQfaUVbLEwge1SN
	TbMbnTtb5lUOgm6LtCQQJFSO/fFPBoGfV2xckfHzyEEfB4/WLXpLom83kbNB9V1Izbl2YEKR1R/0y
	+1wW2WJMsfmbrCqWl+nraVBdp+1LKpJbFL+0JTeeBUmdb+kX9soSDaprUT/IP3BUiwQqyLEkcDvb7
	Yw0ETCzuCYN+iQ8HTx0tMu0OAReEJ2JXGMJHUCeb8BGKKr/uhKq/BqGS7gYjTxZs6XQqbHsDbdLkF
	VC+Wm1J/KuFuE2zyc3VCs+bIhJNP/sclqrgJSV7awjxFGU4w8CwQNtUnKZ5YE7wKnh/ps/Ry0So5e
	Rd8aAKPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Xs-0000000GMEa-1Ovn;
	Wed, 01 Apr 2026 23:00:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Xo-0000000GM97-0Kyp;
	Wed, 01 Apr 2026 23:00:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 453B56013C;
	Wed,  1 Apr 2026 23:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F50EC116C6;
	Wed,  1 Apr 2026 23:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084415;
	bh=ia5mGWpgejay0TUoFhZWSGjPJlCIjCy7gnhJSD9JF6Q=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=oWdOCY6xhFFRq21639GOywl5mcK+3l2bcc/AdHZPPYO6CRTwcz96vqxvC+KTvE5ZX
	 krjDtv05WjJwIOmMxt5/X5E3aUbo7NPZLUhECXRbhCX2WuZOC4CBt0EuBdlmaQZs5/
	 gN2+t4Oz31J5PUxyGyzowwR/Vbt4laFgc21dnxb7OIGWE8SY2IDDteRBlv7DvNTZaf
	 ztSAxYpCQItFlyOLdRSjZCA42hg9cS3w6tGLK9fpQFGQL6OHHwcSPNtmKIS1A/IwMB
	 XASAS2QZagyeAGlUdw49EUuloCHZv4iUn5ycn2HLFRAbB6+Z6JTAboFozDAt285/TL
	 qUneNo60Yk0GA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 11/33] rust: alloc: simplify with `NonNull::add()` now
 that it is stable
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
In-Reply-To: <20260401114540.30108-12-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-12-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434445.73816.7873322235592463050.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=691; i=tamird@kernel.org;
 h=from:subject:message-id; bh=ia5mGWpgejay0TUoFhZWSGjPJlCIjCy7gnhJSD9JF6Q=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFzvPuHEjKvFO5+VrNduvOUh+UWvVz6xhvRQbWe3eK
 jmV4RtXx0QWBjEuBksxRZZE0UN701Nv75HNfHccZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKk+0c3wP3DK1NZ9J2X0vh53N4r9cO6ijvPRY2WpSV4Hgy+fyihnTWb47znt+rS
 Ytk06m2W2Pu7xLbnZePUbY3xIs8yBz5mdSutX8wMA
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

On Wed, 01 Apr 2026 13:45:18 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Currently we need to go through raw pointers and then re-create the
> `NonNull` from the result of offsetting the raw pointer.
> 
> Thus, now that we bump the Rust minimum version, simplify using
> `NonNull::add()` and clean the TODO note.

This description is inconsistent with the previous one which had
citations for both the feature (function in this case) and the feature
in which it became stable (available in this case). I don't prefer
either style in particular, just that things are consistent.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

