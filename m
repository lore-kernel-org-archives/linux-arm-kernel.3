Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E06CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 23:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLJ5ySllihXBhrUNI5mMbNV/WdoadPgxQFF+wwi6gLg=; b=0EZcjj/l4SqhoYaN+coVUoV4ui
	kazt4pDqdYQ8GaN0i1XtgjSEwvSflHVbg+S9cli3qFkBH5ymDQJ3Yd4X6Ef7Nhch+b7EaJJeiqDPP
	ank+dmTUMHUSuXejl8EtnqwS8b2iqcaPNkc8SCZB8H5wcqXHJLzp9C1mcRHpucaJlxSkU3Bkjcnwo
	zNkvfHGn72jmCNpnHUu+8Ffj6x2Vp48lgS2KjtMq4U4eK7W9IeKORYzhUywrBet3+/kd7l1INFqTS
	9ST3BhifngDbUkDj/rQtgw+gcF9A25QPDANEurtI0GDvu5ZzChslIJ2EN1BT7uwnaiTS0GcW2nyI2
	Jzuz5UwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNfFg-00000006o1s-0P97;
	Thu, 14 May 2026 23:14:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNfFe-00000006o1Y-2sb6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 23:13:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0794A60008;
	Thu, 14 May 2026 23:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8D7C2BCB3;
	Thu, 14 May 2026 23:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778800436;
	bh=QyMVF0uvG9KUHwhsL0Eq8/ietjFflpcbXOwE8C7wqCU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=mfuh03NgX/Go16wsBTOGvc06SxamGu7YJj7eMNaLPoAlItjCAJErKtt9cEK1seu+J
	 YC2cofJLMSf9MvpZgJQfBE4tOaN2mdGW4z3X/krDR3H7+L7CO+OuZiWuJQFjtV4oAF
	 8EELHB5yDw1FmXuGJi8DaPIe/PeKmffNGSfEKvpTZAFO+bIvY+eAISneBrCQjigOsB
	 rkEyNgHGlNnEJUoSh8dxUlwKJRGkC91aHA7w+NgcV/QYm137VuntrZoC6bDol8FmIg
	 TzzF4RANjnVkfxp8iqjem/Tc8dWvdQ2EUfTEOoFxbWYJUbpNqEZnM9Wv+SZQMufngu
	 6PoUlFE+MeYHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 12/21] objtool: Refactor elf_add_data() to use a
 growable data buffer
To: x86@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, live-patching@vger.kernel.org, "Will
 Deacon" <will@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>, linux-kernel@vger.kernel.org, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Joe Lawrence" <joe.lawrence@redhat.com>, "Song
 Liu" <song@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>, "Petr Mladek" <pmladek@suse.com>, "Miroslav
 Benes" <mbenes@suse.cz>
In-Reply-To: <a0fe2363d017a2833e98ae50de797fe55c2796a4.1778642120.git.jpoimboe@kernel.org>
References: <a0fe2363d017a2833e98ae50de797fe55c2796a4.1778642120.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 23:13:55 +0000
Message-Id: <20260514231355.DD8D7C2BCB3@smtp.kernel.org>
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
- [Medium] An integer overflow in `elf_add_data()` due to an uncontrolled `=
sh_addralign` value allows an out-of-bounds heap write.
- [Low] In `elf_add_data`, a failed `calloc` for the new data buffer overwr=
ites `sec->data->d_buf` with NULL and leaks the original buffer.
--

commit 02f18d399bba6e3d751363b4e85f507e3f288e34
Author: Josh Poimboeuf <jpoimboe@kernel.org>

objtool: Refactor elf_add_data() to use a growable data buffer

Instead of calling elf_newdata() for each new piece of data with its own
separate buffer, keep it all in the same growable buffer so the
section's entire data can be accessed if needed.

> diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
> --- a/tools/objtool/elf.c
> +++ b/tools/objtool/elf.c
[ ... ]
> @@ -1409,30 +1406,55 @@ void *elf_add_data(struct elf *elf, struct sectio=
n *sec, const void *data, size_
>  		return NULL;
>  	}
> =20
> -	sec->data =3D elf_newdata(s);
>  	if (!sec->data) {
[ ... ]
> +		sec->data->d_align =3D sec->sh.sh_addralign;
>  	}
> =20
> -	sec->data->d_buf =3D calloc(1, size);
> -	if (!sec->data->d_buf) {
> -		ERROR_GLIBC("calloc");
> -		return NULL;
> +	size_old =3D sec->data->d_size;
> +	offset =3D ALIGN(size_old, sec->sh.sh_addralign);
> +	size_new =3D offset + size;

Could this ALIGN calculation overflow if a malformed ELF file provides an
extremely large sh_addralign value?

If offset wraps around, it seems size_new might also wrap, potentially caus=
ing
roundup_pow_of_two to return a small allocation size. Could this lead to an
out-of-bounds write during the subsequent memcpy further down in this funct=
ion?

> -	if (data)
> -		memcpy(sec->data->d_buf, data, size);
> +	if (!sec->data_overallocated)
> +		alloc_size_old =3D size_old;
> +	else
> +		alloc_size_old =3D max(64UL, roundup_pow_of_two(size_old ? : 1));
> =20
> -	sec->data->d_size =3D size;
> -	sec->data->d_align =3D sec->sh.sh_addralign;
> +	alloc_size_new =3D max(64UL, roundup_pow_of_two(size_new ? : 1));
> =20
> -	offset =3D ALIGN(sec_size(sec), sec->sh.sh_addralign);
> -	sec->sh.sh_size =3D offset + size;
> +	if (alloc_size_new > alloc_size_old) {
> +		void *orig_buf =3D sec->data->d_buf;
> +
> +		sec->data->d_buf =3D calloc(1, alloc_size_new);
> +		if (!sec->data->d_buf) {
> +			ERROR_GLIBC("calloc");
> +			return NULL;
> +		}

If calloc fails here, does assigning its result directly to sec->data->d_buf
clobber the valid pointer to orig_buf?

It appears orig_buf is never freed on this error path, which might leak the
original buffer if it was previously owned by objtool. Would it be safer to
keep the original buffer pointer intact on allocation failure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1778642120.gi=
t.jpoimboe@kernel.org?part=3D12

