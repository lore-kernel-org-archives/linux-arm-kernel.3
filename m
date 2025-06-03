Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896D2C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 17:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPu057m0M5Z85V1gGXBsQTxBZdBxUkE8ENrmzPe4ALE=; b=c+DEHTQfqszspOgqsybwzYP/ey
	obP5KSR3VsaGryzCV1emtL1IqlsYqhTjgdT0vrnp9Ge6Tudh9ckJdgKMN6EBeNwpo4CdWyDBhyIdd
	88qlPWezmSjpkEgHE8K8KhvM9v1IjTAnWYr6hXCILpGNvOgrrXESEf0OWKUHPgRI6yFajnOkRQFAo
	6OWopePwtd9ONPYkTBV2Bdg2F3twvoSjMAXsxxXaadAk52oZmFQJ/msvNdprlEaPWq/ZRMLeC8w8T
	OXiEYdf+7ja1VLN+8hdIdiy0gGhkgaEU+H3qNCq5puBH60uQLRisUWqOD0rbK92adn55oDQeuldcg
	PchIt4UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMVRW-0000000BUiU-2Ynd;
	Tue, 03 Jun 2025 17:28:54 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMVO4-0000000BTxi-30n2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 17:25:23 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-52dbcd398f9so50374e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 10:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748971519; x=1749576319; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPu057m0M5Z85V1gGXBsQTxBZdBxUkE8ENrmzPe4ALE=;
        b=Ldj6i+/DbWjodWDgi0ykryU6+DMpSpJuIGfHIwV2z9k5hctnE0gdFJ9F6ZVBrXdo9X
         SZcUJKjlefNZqW763BhDcoxWR77yHM08FeMuvRvTJCC9Hj0w7H5OsOHUT9C5jUgPw/BM
         hrBPiFc9UcFwnx1Kab74+yVYqjSYEJkzLOdLZTXmXr3NJvp/HRQ8ov16XmPcuRnWEn10
         HvocJiGvHBlp9DvpuzWz9LBztNBq4ZFyDKJqY/WrkZ4xszsA7J2qeXEyt+04IbZI7v6g
         oB66rY0vtqmGmxk+GPTHGcVKfRDB/pI1nyczmoibHVbjX4Uh0iAv/H/7vFqw5sQ/XtNd
         BTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748971519; x=1749576319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPu057m0M5Z85V1gGXBsQTxBZdBxUkE8ENrmzPe4ALE=;
        b=ElOkMr9TztXSBcUFT38r9tSLgWBIWkRmBXefHa1bYEulfsF5j7seVOw/soHDICMcm2
         Gh7zwgA3617rk7RQpj329+6h+XH6VBCtFqO4SWK0Fvi8FFP9c9Qbk5Jo4GDonTMtaYp1
         YAd6lbWicd2uYn04gONQFLwC9faWDQjRhgeDqSpuf+O1GEr7e+E35ZO1005kE0XyoY0C
         ZA5XfTq67RDO0sEFKabcFuAIAIFyDHA6WwfXeAIuS/UQS4UBI66Sgye+MX4NT54m432Z
         2nmFXKf8oKY64tJaUIcDOX8eAXZfRV0uDWtgxFPRKKYoGYJnUsiRZ5EpK8YdTd+XBrQA
         gN8w==
X-Forwarded-Encrypted: i=1; AJvYcCUOlzVrHMdFQtvILcX6HuAdKC9vYg/uKpHcRm8tE1yJcZUzEOoUDMEev2pPvQHxHd7nVQT+XwHB+wpPWXNpEEfd@lists.infradead.org
X-Gm-Message-State: AOJu0YwNexT4f1xQaXsN4WNUlFDlzctEDGp7T+DXpC4zdLNsG0xtdQLQ
	1pE9NRGtQBFRbKHM3SExvFZ6+OUCcQu85JhFvnTfOjr7ICN8TOqIILtsHPvveYroVAsbUUQigNK
	bg+RLWlvSlUFjahs6u0Fc3awSfgYqJflkCyF2i0Sh
X-Gm-Gg: ASbGncuREpC/Wtj1Yl9DXE0qKc5nk3SEC37lAfFuCGclF9crma0gVmtH5HyJS86zbvY
	ihb4S6XFcl/nBzHu0uaD2LCjah65Mz/Eao449kogOUa4Z07NbzWISHzn6WJozNbpTnb91FV91YN
	DJlJ3JtbwAy9EIQw4oVKcI5wlfqcuzO3JE5KZVEFbN01LsJCn5t+jkS40PepLsrnkkJ4mL1dqfk
	g==
X-Google-Smtp-Source: AGHT+IFSnKx7PV6xaaSh7fZTbkb7kPMU3rbQqfKSe65+cXZyNVr6BfBTcxpPzg9IDWREAcnB1sMGmEcYrZdMzRkJpHA=
X-Received: by 2002:a05:6122:470f:b0:52d:beeb:c6a3 with SMTP id
 71dfb90a1353d-530ba1d932emr3188572e0c.1.1748971518522; Tue, 03 Jun 2025
 10:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250530000044.341911-1-dylanbhatch@google.com>
 <20250530141325.GA30733@willie-the-truck> <CADBMgpx==FnFj4okXs1n3NPngh7Os1YpnGrDDe8z_t2X7bzOOQ@mail.gmail.com>
 <20250603151319.GA2611@willie-the-truck>
In-Reply-To: <20250603151319.GA2611@willie-the-truck>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Tue, 3 Jun 2025 10:25:07 -0700
X-Gm-Features: AX0GCFtBaqvLhLw1g5o6yB_waFO9tC1BodRPARumIVGBpRyvz_jmEzOJS_umYAY
Message-ID: <CADBMgpzrQs=U8xXbD_Em5=P1=FnqtcC4uO0jDHqkF19CPng3Kg@mail.gmail.com>
Subject: Re: [PATCH v5] arm64/module: Use text-poke API for late relocations.
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Song Liu <song@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>, 
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_102520_783350_87E9132C 
X-CRM114-Status: GOOD (  31.00  )
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

On Tue, Jun 3, 2025 at 8:13=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> Hey Dylan,
>
> On Fri, May 30, 2025 at 05:11:00PM -0700, Dylan Hatch wrote:
> > On Fri, May 30, 2025 at 7:13=E2=80=AFAM Will Deacon <will@kernel.org> w=
rote:
> > >
> > > and this would be:
> > >
> > >         WRITE_PLACE(place, cpu_to_le32(insn), me);
> > >
> >
> > I'm seeing this part give a build error:
> >
> > arch/arm64/kernel/module.c:158:2: error: cannot take the address of an
> > rvalue of type '__le32' (aka 'unsigned int')
> >   158 |         WRITE_PLACE(place, cpu_to_le32(insn), me);
> >       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > arch/arm64/kernel/module.c:56:28: note: expanded from macro 'WRITE_PLAC=
E'
> >    56 |                 aarch64_insn_copy(place, &(val),
> > sizeof(*place));       \
> >       |                                          ^ ~~~
> >
> > I can't think of a clean way to get around this and still keep a
> > combined write helper. Setting an intermediate __le32 in the
> > reloc_insn_* functions would work but we were trying to avoid that.
> > Setting an intermediate value inside WRITE_PLACE would also work but
> > then (I think) it won't work for the data relocations because we'd be
> > converting a signed into unsigned value. Making WRITE_PLACE a function
> > instead of a macro also fixes the rvalue problem but then the args
> > 'place' and 'val' have to be of a fixed type so we can't do the
> > typecasting on 'place' and 'val' has the same signed/unsigned value
> > problem.
> >
> > Do you have a suggestion here? In the meantime I can send a v6 that
> > uses an intermediate __le32 for the instruction relocations.
>
> Sorry for the slow reply -- I see you already sent a v6. I think we
> could add a temporary in the macro. Diff below (on top of your v6). WDYT?
>
> Will
>
> --->8
>
> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> index 862f6d50ab00..40148d2725ce 100644
> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c
> @@ -50,10 +50,12 @@ static u64 do_reloc(enum aarch64_reloc_op reloc_op, _=
_le32 *place, u64 val)
>  }
>
>  #define WRITE_PLACE(place, val, mod) do {                              \
> +       __typeof__(val) __val =3D (val);                                 =
 \
> +                                                                       \
>         if (mod->state =3D=3D MODULE_STATE_UNFORMED)                     =
   \
> -               *(place) =3D val;                                        =
 \
> +               *(place) =3D __val;                                      =
 \
>         else                                                            \
> -               aarch64_insn_copy(place, &(val), sizeof(*place));       \
> +               aarch64_insn_copy(place, &(__val), sizeof(*place));     \
>  } while (0)
>
>  static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, in=
t len,
> @@ -128,7 +130,6 @@ static int reloc_insn_movw(enum aarch64_reloc_op op, =
__le32 *place, u64 val,
>         u64 imm;
>         s64 sval;
>         u32 insn =3D le32_to_cpu(*place);
> -       __le32 le_insn;
>
>         sval =3D do_reloc(op, place, val);
>         imm =3D sval >> lsb;
> @@ -156,8 +157,7 @@ static int reloc_insn_movw(enum aarch64_reloc_op op, =
__le32 *place, u64 val,
>
>         /* Update the instruction with the new encoding. */
>         insn =3D aarch64_insn_encode_immediate(AARCH64_INSN_IMM_16, insn,=
 imm);
> -       le_insn =3D cpu_to_le32(insn);
> -       WRITE_PLACE(place, le_insn, me);
> +       WRITE_PLACE(place, cpu_to_le32(insn), me);
>
>         if (imm > U16_MAX)
>                 return -ERANGE;
> @@ -172,7 +172,6 @@ static int reloc_insn_imm(enum aarch64_reloc_op op, _=
_le32 *place, u64 val,
>         u64 imm, imm_mask;
>         s64 sval;
>         u32 insn =3D le32_to_cpu(*place);
> -       __le32 le_insn;
>
>         /* Calculate the relocation value. */
>         sval =3D do_reloc(op, place, val);
> @@ -184,8 +183,7 @@ static int reloc_insn_imm(enum aarch64_reloc_op op, _=
_le32 *place, u64 val,
>
>         /* Update the instruction's immediate field. */
>         insn =3D aarch64_insn_encode_immediate(imm_type, insn, imm);
> -       le_insn =3D cpu_to_le32(insn);
> -       WRITE_PLACE(place, le_insn, me);
> +       WRITE_PLACE(place, cpu_to_le32(insn), me);
>
>         /*
>          * Extract the upper value bits (including the sign bit) and
> @@ -207,7 +205,6 @@ static int reloc_insn_adrp(struct module *mod, Elf64_=
Shdr *sechdrs,
>                            __le32 *place, u64 val, struct module *me)
>  {
>         u32 insn;
> -       __le32 le_insn;
>
>         if (!is_forbidden_offset_for_adrp(place))
>                 return reloc_insn_imm(RELOC_OP_PAGE, place, val, 12, 21,
> @@ -227,8 +224,7 @@ static int reloc_insn_adrp(struct module *mod, Elf64_=
Shdr *sechdrs,
>                                                    AARCH64_INSN_BRANCH_NO=
LINK);
>         }
>
> -       le_insn =3D cpu_to_le32(insn);
> -       WRITE_PLACE(place, le_insn, me);
> +       WRITE_PLACE(place, cpu_to_le32(insn), me);
>         return 0;
>  }
>
>

This looks good to me. I can send a v7 with these changes.

Thanks,
Dylan

