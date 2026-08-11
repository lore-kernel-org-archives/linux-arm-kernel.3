Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B854C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 23:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAREtHbS82rvSxqq0HWUKkEUqHXgzX1Dax981OtXp3M=; b=tct8KxOkYo6sI7cM/qOLVgarlb
	LL4hl8flt8Aebo3gULGE0sCvfYlmvU66/7tn4spG4/Tg0g32gZTO4VWhuXVnFwF7yowSKAcexWavY
	4oSO1AS9RtY1mo1V+r4TvbC9potnIE5+oQTKvKkVu39MuXHB5NIm1/f33R619LD51GjkvAeVVUceP
	3mYf2EcjknVmAebJ0LO4I/2ntrQPwiIghj8Sw4BXBXRaF0VLCw3EYoCFp5aZrVPBXQAGQy8BiJvUb
	35OW9IpsqVCJ6AkcQLG//b9VazxINwhhU3fUdce9KMUao4FEzL5JQVxaAkpfNO4GJbZ4OhtBXF6lo
	CxhGFX0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwMO-0000000F7Hn-3KgM;
	Tue, 11 Aug 2026 23:58:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwMM-0000000F7Hh-2pV8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 23:58:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FD1F44F26
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 23:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F121F00ACF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 23:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786492698;
	bh=fAREtHbS82rvSxqq0HWUKkEUqHXgzX1Dax981OtXp3M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=o03VnHxs2N1yfipicNuhXzQXuc2/OtIsWiaLcE60IbVNrWTknlAibwoULOLcabTsJ
	 V4crRvm2J1tN0kX72QTHMeHcgy9JL5S9PYM0hS/4u/Ijp9JQEEnPITF6CXF9SRSyBn
	 S6IZQeFoqPtubk+JBipoxZsyPQGdLUOkOKZKeFYqwQumRf8pPJLSYvrsXnBZYhKT9G
	 +ab958k5gwCED3RHXIE+khBj7vH2BmD6bqMTLupzAn1JRLPa9kS0y55Ui0J6Ejvhs9
	 1fSVPvMdvQYXc2bDCX4ogXhKyRQYA2sTcrpbmrb0SA+s1N8WTvC3xD8Qu7g5ANGRw+
	 P4kh8J7aJhFKQ==
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e6391b114so39676185a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 16:58:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpIGRpeWfNfUzzfaFZ4lZ1Eignbvf3BtyR4WW9Gi2rK+ZvRrDgsna+Wq20ho8TEPrBYLZgGlREqRWZnHOBdJQBx@lists.infradead.org
X-Gm-Message-State: AOJu0YxzoviWH7877EFQE5jofFNaRMBnrh93ctTDJDCXuZNllEzaikXs
	Dl1IIzvFRVKr88kLI/G+jUTb42Els43nsPpN/d4mivgMA3MtexRO15Lp43BPUksK/5zvG+87oHN
	X9+2PE5EleTS5FsWSQ+kju+NjuUifo90=
X-Received: by 2002:a05:620a:170b:b0:930:a3da:3a77 with SMTP id
 af79cd13be357-936b3a89916mr120474585a.16.1786492697247; Tue, 11 Aug 2026
 16:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1786230311.git.jpoimboe@kernel.org> <11e49187e13d36d4257bc60cd2606e0ff5481dfc.1786230311.git.jpoimboe@kernel.org>
In-Reply-To: <11e49187e13d36d4257bc60cd2606e0ff5481dfc.1786230311.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Tue, 11 Aug 2026 16:58:05 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5tzBOHnw42d31r_5k9eS28VrDLGXoUzS=hYkZmAyRbhw@mail.gmail.com>
X-Gm-Features: AUfX_mx7N2pB49_Aimj1F_L1AcYkp9oHPvSJaPSP5hfhgPDqfK_v6h_UtELmWJ4
Message-ID: <CAPhsuW5tzBOHnw42d31r_5k9eS28VrDLGXoUzS=hYkZmAyRbhw@mail.gmail.com>
Subject: Re: [PATCH v4 15/22] objtool: Prevent kCFI hashes from being decoded
 as instructions
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Aug 8, 2026 at 4:18=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org>=
 wrote:
[...]
>
> +/*
> + * ARM64 mapping symbols ($d, $x, $a, __pi_$d, etc) which mark transitio=
ns
> + * between code and data.
> + */
> +static inline bool is_mapping_sym(struct symbol *sym)
> +{
> +       return is_notype_sym(sym) && strchr(sym->name, '$');
> +}
> +
> +static inline bool is_data_mapping_sym(struct symbol *sym)
> +{
> +       const char *dollar;
> +
> +       if (!is_mapping_sym(sym))
> +               return false;
> +
> +       dollar =3D strchr(sym->name, '$');
> +       return dollar && dollar[1] =3D=3D 'd';

nit: is_data_mapping_sym() calls strchr() twice. Maybe we can
optimize it by eliminating a strchr()?

Thanks,
Song

> +}
> +
>  static inline bool is_global_sym(struct symbol *sym)
>  {
>         return sym->bind =3D=3D STB_GLOBAL;
> @@ -508,6 +528,9 @@ static inline void set_sym_next_reloc(struct reloc *r=
eloc, struct reloc *next)
>  #define sec_for_each_sym(sec, sym)                                     \
>         list_for_each_entry(sym, &sec->symbol_list, list)
>
> +#define sec_for_each_sym_from(sec, sym)                                 =
       \
> +       list_for_each_entry_from(sym, &sec->symbol_list, list)
> +
>  #define sec_prev_sym(sym)                                              \
>         sym->sec && sym->list.prev !=3D &sym->sec->symbol_list ?         =
 \
>         list_prev_entry(sym, list) : NULL
> --
> 2.54.0
>

