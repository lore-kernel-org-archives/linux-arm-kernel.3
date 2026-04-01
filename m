Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941021112240
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDd6FPnubckgg0wTkHiFbVp9MqPbukTqyZ2LbbSF254=; b=y58VLjI4SqANyzavvwuVjpO3zz
	eqWe3jQYTCmT9FlQNo47e5mbPJGgg5J75U88ToNqgsZRgex9aaBviYMMlH3W9xkN2UhBfpdyzHSSC
	otD/t+QPR9wjoi/arZLbW79BTP/0nXBgHBNPFiofoOBlMxLq1gVNguUisi3rErB2E8hIVldzsFEen
	B+fkbcEIBJ+Q6PpBGlArlDJZPPlCqKpCRWR296Le/XP9pgyvSdGc3cncXciwSG9k1yuleT7IMpYKe
	VW0+W32wJDWKj0ujZR074j74P4UBnQLnFVcqxNS0chZVHIULRRjExL76UhMJuseePFbTt+w0XniU5
	kblD9qWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Xe-0000000GLzR-3Sf5;
	Wed, 01 Apr 2026 23:00:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Xd-0000000GLxF-3YxU;
	Wed, 01 Apr 2026 23:00:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F305661842;
	Wed,  1 Apr 2026 23:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A1AC2BCB2;
	Wed,  1 Apr 2026 22:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084404;
	bh=oOFcElemP5A7wKciwQSJtcDjY7nR2WhKiKPxc1QU1AE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=rfevY7C1b5TrlF3FJhGmdswzRil6yigf3cumL5j7c2Yi/75Zo/Oc+JEx+z2RPd8Xh
	 hxUy3OwtZ0si2kHEQ+t+aFj86IJkz616rQvvphqmHWBYUSl95h+F3dbGEdVw7jB6Gf
	 z/fVRMVbCh+bReJhMbmMOPAOG0Jn+77dz4FxvgMtQfPbuW17nMwiP3s9/L+M8EFygA
	 8loKiM2+bAT04zCjFNhKIijsUYh2raA/4A9NUw0DQrsgrIvjQncm5jjSxF6tOSJoiT
	 K0AhRukOzBZLNH4BYWCOVdK6Z9r4yzVV+TLBpYfwEgBaA81laNLmee8pl34GozLiV8
	 U8Ei3ddqh50Bg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 09/33] rust: kbuild: make `--remap-path-prefix`
 workaround conditional
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
In-Reply-To: <20260401114540.30108-10-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-10-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434441.73816.15326490215165782904.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=486; i=tamird@kernel.org;
 h=from:subject:message-id; bh=oOFcElemP5A7wKciwQSJtcDjY7nR2WhKiKPxc1QU1AE=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFzuxWc8K3b29/8DJlgcp1w4JF/jIF93QPNXv/NrPx
 /zAyXi2joksDGJcDJZiiiyJoof2pqfe3iOb+e44zBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjoGPMwMUpAFN9vIThv+Prwmmi3lJMAVNWcD55r9/MzOFr79wi3rvX+8zbxbpNwQz/Q/rXnZF
 91W6rmuz4+O6+l9d1Vt/6WMDWt8ZLbelc31YnXgA=
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

On Wed, 01 Apr 2026 13:45:16 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> The Internal Compiler Error that the comment mentions [1] was fixed in
> Rust 1.87.0 [2]. And, for other workarounds, we plan on limiting where
> we apply them [3].
> 
> Thus limit the ICE one too.
> 
> This will help to make sure the workaround is not needed anymore on
> newer versions.
> 
> [...]

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

