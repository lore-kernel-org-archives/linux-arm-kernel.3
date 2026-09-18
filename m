Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C62C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 22:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5kG3DdFAuRrj+kffHzyPbVSqMeTdYOBvtJ0HQxgK7o=; b=4qR44/GwmEXI+LzXXnzRD1+ETB
	AFsIMIJhvDEASwc9O/utSPzfJEBoQlDTcKsqw8WzpkKS93XqlXEfslJlLC3ZJAb8Yp9qojmzf/U/l
	JU5p77oq6gP2+mKBL8zodxDwIE1+GHd+mTjexmeG7pKfGTfrdvSB1urhiZuP4pYT65rXX2QbdfCLO
	6fGCyehsUsLaOGKZ9tl6h4sxYyolLC3aqxI8bA57sZ/cyOQsSV16WJDxysR57Xfwb63dg+DY4y6MB
	/hFkFmFWoh8YdYFTQK3Ipxz/qbstAko+D6lyauHxkWLpRYtIbm6aNPIErPJaLTWbFdHVDd9epX8TP
	22ERXZag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hTS-0000000Ffka-0fpt;
	Fri, 18 Sep 2026 22:54:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hTQ-0000000FfkA-0kHb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 22:54:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C9F3F43A68;
	Fri, 18 Sep 2026 22:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8797A1F000FF;
	Fri, 18 Sep 2026 22:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789772067;
	bh=g5kG3DdFAuRrj+kffHzyPbVSqMeTdYOBvtJ0HQxgK7o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bgew5+Rgb+UWitV4Hpgqvv2f7CVv1I7jzUspzMSxcBarpkU9haLIDoGIkKqwRD75W
	 ejatLmoDymX2kjeIT8yB6huJB6p4XPh722j8c+kOZ1ZaeLISwRqRPzBL1D1aAX5ed4
	 MkNg3UM73TAEOd1Uan0r2dlf3eElhwpxbsqRkshxzhmGizGon3AIEK7zgg1D2ut2EV
	 BBk3TPfBmQW+y2kHWK/5wCEiHRG1Lqw6so204L8k+rmC0ULIwKFgwfR4XJj5zLeCpr
	 uQtOkbni4NCU77xE+foNyCT9RfyMaYhC1X4zvUJrDnx8a5A2SkVIA0jILbKvo2wqNr
	 ddYgQ7824ceIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 05/11] arm64/module, sframe: Add sframe support for
 modules
To: "Jens Remus" <jremus@linux.ibm.com>, "Peter Zijlstra" <peterz@infradead.org>, "Jiri
 Kosina" <jikos@kernel.org>, "Roman Gushchin" <roman.gushchin@linux.dev>, "Indu
 Bhagat" <ibhagatgnu@gmail.com>, "Dylan Hatch" <dylanbhatch@google.com>, "Steven
 Rostedt" <rostedt@goodmis.org>, "Catalin Marinas" <catalin.marinas@arm.com>, "Weinan
 Liu" <wnliu@google.com>, "Josh Poimboeuf" <jpoimboe@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, "Will Deacon" <will@kernel.org>
Cc: "Prasanna Kumar T S M" <ptsm@linux.microsoft.com>, "Puranjay Mohan" <puranjay@kernel.org>, joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org, "Randy
 Dunlap" <rdunlap@infradead.org>, "Mostafa Saleh" <smostafa@google.com>, "Song
 Liu" <song@kernel.org>, linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-toolchains@vger.kernel.org, "Herbert
 Xu" <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
In-Reply-To: <20260918224157.1471085-6-dylanbhatch@google.com>
References: <20260918224157.1471085-1-dylanbhatch@google.com>
 <20260918224157.1471085-6-dylanbhatch@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 22:54:26 +0000
Message-Id: <20260918225426.8797A1F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] sframe: UAF and lockdep warning due to missing RCU lock around mod=
ule lookup
- [Medium] sframe: architecture abstraction violation in generic module code
--

commit d8442279cd580755fb98f0f72b910fcd83585a23
Author: Dylan Hatch <dylanbhatch@google.com>

arm64/module, sframe: Add sframe support for modules

This commit adds SFrame support for kernel modules on ARM64 by extending
the architecture-specific module structure. It parses the .sframe section
from incoming modules during load time and registers it for stack unwinding.

> diff --git a/arch/arm64/include/asm/module.h b/arch/arm64/include/asm/mod=
ule.h
> index fb9b88eebeb15..07f309c51eee6 100644
> --- a/arch/arm64/include/asm/module.h
> +++ b/arch/arm64/include/asm/module.h
[ ... ]
> @@ -17,6 +18,11 @@ struct mod_arch_specific {
>  	struct mod_plt_sec	core;
>  	struct mod_plt_sec	init;
> =20
> +#ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
> +	struct sframe_section sframe_sec;
> +	bool sframe_init;
> +#endif
> +

[Severity: Medium]
Will this break cross-architecture builds if other architectures attempt to
adopt SFrame?

By placing these generically named fields into the ARM64-specific
mod_arch_specific struct, generic unwinder code in kernel/unwind/sframe.c
is now tightly coupled to an architecture-private layout.

Should these generic module extensions reside directly in struct module
(in include/linux/module.h) under the appropriate config guards instead?

[ ... ]
> diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
> index 9aac703f7ce6e..503d4a2beb50e 100644
> --- a/kernel/unwind/sframe.c
> +++ b/kernel/unwind/sframe.c
[ ... ]
> @@ -405,12 +409,43 @@ static __always_inline int __sframe_find(struct sfr=
ame_section *sec,
>  	return __find_fre(sec, &fde, ip, frame);
>  }
> =20
> +#ifdef CONFIG_MODULES
> +
> +static __always_inline int __sframe_find_module(unsigned long ip,
> +						struct unwind_frame *frame)
> +{
> +	struct module *mod;
> +
> +	mod =3D __module_text_address(ip);

[Severity: High]
Does this code introduce a use-after-free and a lockdep warning?

Stack unwinding can be initiated from preemptible contexts, but
__module_text_address() requires preemption to be disabled or the RCU read
lock to be held. If a module is concurrently unloaded via sys_delete_module=
()
immediately after __module_text_address() returns, the returned pointer
becomes dangling.

The subsequent call to __sframe_find() would then dereference pointers with=
in
the freed memory. Should this lookup and data access be wrapped in
guard(rcu)(); or an rcu_read_lock() / rcu_read_unlock() block?

> +	if (!mod || !READ_ONCE(mod->arch.sframe_init))
> +		return -EINVAL;
> +
> +	return  __sframe_find(&mod->arch.sframe_sec, ip, frame);

[Severity: Medium]
Does this generic lookup code directly reach into the arch-specific
abstraction? This creates a tight coupling between the generic module unwin=
der
and the ARM64-specific layout.

[ ... ]
> +void sframe_module_init(struct module *mod, void *sframe, size_t sframe_=
size)
> +{
> +	struct sframe_section *sec =3D &mod->arch.sframe_sec;

[Severity: Medium]
Is it safe for this generic initialization code to assume the presence of
the sframe_sec field in the architecture-private mod_arch_specific structur=
e?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918224157.1471=
085-1-dylanbhatch@google.com?part=3D5

