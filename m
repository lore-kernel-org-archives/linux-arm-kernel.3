Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A064C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 05:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0r59gvXPuY1GSMzwyuP7vkSQCg4i9UQVFpoVOr/ssN0=; b=lF+xiMo8ljkROTI9AZ2v+GOGv0
	7hsglEjQEZu6lSKImtf+qoYkvdBLxR2AzcTb47ryLkNbGN7WvAhu7hmWGIvpKbVvLiZ37DXGtIgCU
	zP2UqBHCTgfhJ0RkKLbM4rpQ5Pz7/eXk5bWjTMUQ5m1gLvoMx8kURPtAyIuQD09me/KXGef4hG+1X
	GPXFNh4d2qxhtWxJZGnes34O7MqLMah/V8SkKdGf4ssEk8LxW3mwuip9T9HCmDDTa+7i2S2e9GiPD
	2tmQp9wEtC3kLPEidhthX2lnHCFHczubMbAtKd4OTp1oxOkFStDezdhK3Bgbl3H3jkZWCVT1WIs4q
	5XfS2urA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6Vm-00000003WOA-2bUi;
	Sat, 15 Aug 2026 05:00:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6Vk-00000003WO3-2Pkr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 05:00:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F23AF40E01;
	Sat, 15 Aug 2026 05:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E4CF1F000E9;
	Sat, 15 Aug 2026 05:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786770047;
	bh=0r59gvXPuY1GSMzwyuP7vkSQCg4i9UQVFpoVOr/ssN0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ck8k6act0f+a/yugwvH71h+Q8TqsBe1MsHEQQtIW0UwpwZDFh7eO21Z9RV8fu1Bqp
	 ai0RYqqSnBXRRO6mjph16gMZn+yM25cd0ipQj7pKVlyQr3eS1NyKT9fPL3GUzKCYxP
	 Mce710JEjRXROc0DjiqKcbZMIsnQz4BULf7Fve++8uKVL7ITWymQHI/BXG1U9q6rkF
	 VDDKvrCjw5Hk34icEwiZ8ehpot/cxq8SohOoWlm2v9OowtdUwVj7+YpMEgJQXAzrFz
	 VBW489GjVisnBa43oXGiEkOqsorQNdsoMU7nEtgf42aVKVU6K1F5qQhWYrA/1HlEZ7
	 Jpa9y9Ed+cOIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/12] arm64/module: Fix BTI exceptions caused by
 omitted landing pads in Clang 21
To: "Will Deacon" <will@kernel.org>, "Josh Poimboeuf" <jpoimboe@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>
Cc: "Nick Desaulniers" <ndesaulniers@google.com>, "Kees Cook" <kees@kernel.org>, linux-toolchains@vger.kernel.org, "Petr
 Mladek" <pmladek@suse.com>, "Joe Lawrence" <joe.lawrence@redhat.com>, "Ard
 Biesheuvel" <ardb@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, "Song
 Liu" <song@kernel.org>, "Miroslav Benes" <mbenes@suse.cz>, "Mark Brown" <broonie@kernel.org>, linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Mark
 Rutland" <mark.rutland@arm.com>
In-Reply-To: <2ff1b2482406c61ca5979d6284ba5f948a3fbc20.1786768375.git.jpoimboe@kernel.org>
References: <cover.1786768375.git.jpoimboe@kernel.org>
 <2ff1b2482406c61ca5979d6284ba5f948a3fbc20.1786768375.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 05:00:46 +0000
Message-Id: <20260815050047.0E4CF1F000E9@smtp.kernel.org>
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

Pre-existing issues:
- [High] Direct memory assignment to the PLT section bypasses text patching=
, causing a Data Abort when a livepatch module applies relocations to a new=
ly loaded target module.
- [High] The `aarch64_insn_set()` function incorrectly writes A64 instructi=
ons in host byte order, causing BTI veneer pages to be filled with corrupt =
instruction encodings on Big Endian systems.
--

--- Patch [2]: [PATCH 02/12] arm64/module: Fix BTI exceptions caused by omi=
tted landing pads in Clang 21 ---
commit 74ebe0a6ff8b7ada8b741ca9247269a7b1b55fb6
Author: Josh Poimboeuf <jpoimboe@kernel.org>
arm64/module: Fix BTI exceptions caused by omitted landing pads in Clang 21

This commit fixes BTI exceptions caused by Clang 21+ omitting landing pads
for static functions. It allocates a page close to the target to hold BTI
veneers which receive PLT indirect branches and direct branch to the final
target.

> diff --git a/arch/arm64/kernel/module-plts.c b/arch/arm64/kernel/module-p=
lts.c
> index 7afd370da9f48..4ba31e336deb6 100644
> --- a/arch/arm64/kernel/module-plts.c
> +++ b/arch/arm64/kernel/module-plts.c
[ ... ]
> @@ -66,6 +72,180 @@ static bool plt_entries_equal(const struct plt_entry =
*a,
[ ... ]
> +static struct bti_veneer_page *bti_veneer_page_alloc(struct module *mod,
> +						     u64 target)
> +{
[ ... ]
> +	if (!p) {
> +		pr_err("%s: no address space within branch range of %pS for a BTI vene=
er\n",
> +		       mod->name, (void *)target);
> +		return NULL;
> +	}
> +
> +	/* Don't leave unused slots executable */
> +	aarch64_insn_set(p, AARCH64_BREAK_FAULT, PAGE_SIZE);

[Severity: High]
This is a pre-existing issue with aarch64_insn_set(), but does this new
usage write the AARCH64_BREAK_FAULT instruction in the wrong byte order on
Big Endian systems?

Looking at aarch64_insn_set(), it passes the host-endian integer to
memset32(), which performs native 32-bit stores without cpu_to_le32()
conversion:

arch/arm64/kernel/patching.c:aarch64_insn_set() {
    ...
    return __text_poke(text_poke_memset, dst, &insn, len);
}

Since ARMv8 instruction fetches are architecturally always Little Endian,
wouldn't the CPU fetch a byte-reversed, corrupt instruction (reading
0x000020d4) on Big Endian systems, resulting in a fatal Unknown instruction
exception rather than a BRK exception if an unused slot is executed?

> +
> +	page =3D kzalloc_obj(*page, GFP_KERNEL);
> +	if (!page) {
[ ... ]
> @@ -77,6 +257,12 @@ u64 module_emit_plt_entry(struct module *mod, Elf64_S=
hdr *sechdrs,
>  			  void *loc, const Elf64_Rela *rela,
>  			  Elf64_Sym *sym)
>  {
[ ... ]
>  	u64 val =3D sym->st_value + rela->r_addend;
> =20
> +	if (!plt_target_has_landing_pad(val)) {
> +		val =3D module_emit_bti_veneer(mod, val);
> +		if (!val)
> +			return 0;
> +	}
> +
>  	if (is_forbidden_offset_for_adrp(&plt[i].adrp))
>  		i++;
> =20
>  	plt[i] =3D get_plt_entry(val, &plt[i]);

[Severity: High]
This isn't a bug introduced by this patch, but can this direct memory
assignment cause a Data Abort kernel panic when a livepatch module applies
relocations to a newly loaded target module?

If a livepatch module is already loaded and active, its sections (including
the PLT) are marked ROX. When a new target module loads,
klp_module_coming() calls apply_relocate_add() to apply the patch module's
relocations for this new target.

If an out-of-range jump requires a new PLT entry, it seems this direct
assignment to the ROX plt memory array bypasses text patching mechanisms
like patch_map() or aarch64_insn_copy().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786768375.gi=
t.jpoimboe@kernel.org?part=3D2

