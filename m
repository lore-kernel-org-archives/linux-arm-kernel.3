Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0F1CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 00:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yyc9c4RDYAa2fr0W0XsEJ7jea/pqUXgQQtkXMqQar2w=; b=k/Q0JpJsM+Ne3po2hHWDeKVxZz
	5nyhrwgoWCPJ90uYa4XA74EWFN7fyQ6fxO8J96pY/B6RahlHdenhAImi8m1AezSqsq9ORAVEjidLB
	k89K8AW4TCiMakMqL6ibi7pzrqygpGZ5UM44iuq75RYAbJHH5ytGJtIDFWmY9vEXdmelsfAjY07fj
	GSgWFineR/Rj0MITiKT50aTfhQzaZKNNgGX6JjBG+0R+qHeZZCKwK0r1ckf0niJ1zHOQ+DW5xdY6A
	vmOFrGay0X5NHcMve5hWwzKakFhND9F0l9uiZ2d4cm7F6zOhysA47FRQNK8dXnVHb+ze3agq372p/
	UUENsTTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNgEZ-00000006tg3-0FjI;
	Fri, 15 May 2026 00:16:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNgEX-00000006tfl-3EMy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 00:16:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CFC4560132;
	Fri, 15 May 2026 00:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09947C2BCB3;
	Fri, 15 May 2026 00:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778804212;
	bh=UX7VNZBm0xMgUBdi6LTy4GtyerPnkbZCiJOpWfi6yUQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=LLk3cfkME3xw5l2/O0sRlOypKrlG5pYEdRt1TDWtq4XUO6hFhnw0GuZIYaMxPQtPA
	 +hf1zYeO9ae5v0xDggm3bNLy0s2ztbvlPbTNTFNr6Kgv1vXEIX8pcsvZ6rQs9JFlML
	 mJYKPrb+VK82lTnCNCadF5Rd8JwHSgBKDAvIO8C2ErVXN/DKRMz1sOHdJldNlMTZtV
	 jsaKSngT08JeGD66uN/Tqk0XxDg6Ru32FZwuimRodJISE7uyMYGBbBLTCZxyD2K+Ba
	 DGovAgdBJugxJJn1FJSqlej5J3XwFSZKXJQvoCP4utASwmRI2J/O2bDNh0zTpGPduK
	 I+3rYfJEvboDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 14/21] objtool: Prevent kCFI hashes from being
 decoded as instructions
To: x86@kernel.org
Cc: "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>, "Catalin
 Marinas" <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, live-patching@vger.kernel.org, "Petr
 Mladek" <pmladek@suse.com>, linux-kernel@vger.kernel.org, "Peter Zijlstra" <peterz@infradead.org>, "Miroslav
 Benes" <mbenes@suse.cz>, "Song Liu" <song@kernel.org>, "Joe Lawrence" <joe.lawrence@redhat.com>
In-Reply-To: <b1d50c9fc9e6b9bca43833cc4ccbd88a31fed84b.1778642120.git.jpoimboe@kernel.org>
References: <b1d50c9fc9e6b9bca43833cc4ccbd88a31fed84b.1778642120.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 00:16:51 +0000
Message-Id: <20260515001652.09947C2BCB3@smtp.kernel.org>
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
- [High] Build failure due to undeclared mapping symbol functions.
- [Low] Unused header inclusion.
--

commit 4ad78a24a64cd6a2d10b9a2f9c0d306fba3e6d19
Author: Josh Poimboeuf <jpoimboe@kernel.org>

objtool: Prevent kCFI hashes from being decoded as instructions

On arm64 with CONFIG_CFI=3Dy, Clang places a 4-byte kCFI type hash immediat=
ely
before each address-taken function entry. This commit uses mapping symbols
to mark such data as NOP in text sections to prevent objtool from decoding
them.

> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index e05dc7a93dc1e..2b03a2d6fc952 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -25,6 +25,7 @@
>  #include <linux/kernel.h>
>  #include <linux/static_call_types.h>
>  #include <linux/string.h>
> +#include <linux/kconfig.h>

This isn't a bug, but is this include needed? It doesn't appear that any
Kconfig configuration macros are being used in the modified code.

[ ... ]

> @@ -478,6 +483,16 @@ static int decode_instructions(struct objtool_file *=
file)
> =20
>  			prev_len =3D insn->len;
> =20
> +			/* Use mapping symbols to skip data in text sections */
> +			sec_for_each_sym_from(sec, map_sym) {
> +				if (map_sym->offset > offset)
> +					break;
> +				if (is_mapping_sym(map_sym))
> +					is_data =3D is_data_mapping_sym(map_sym);

Could this cause a build failure across architectures here? It appears
is_mapping_sym() and is_data_mapping_sym() are neither declared nor defined
anywhere in the codebase at this point in the patch series.

If these functions are only introduced in a subsequent commit, applying
this patch independently might result in an implicit declaration of function
error, breaking git bisectability.

> +			}
> +			if (is_data)
> +				insn->type =3D INSN_NOP;
> +
>  			/*

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1778642120.gi=
t.jpoimboe@kernel.org?part=3D14

