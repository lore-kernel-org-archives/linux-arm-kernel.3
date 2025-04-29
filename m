Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C53C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 18:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58LgbfG3U/akqjTZ2/iNSa3gMh9sUNRwxeuhEgX/Y0g=; b=jd3use/o3JGfk+udCN3WLQHczm
	xWygulhFDjjXpVMUELxKUlbDRw9TAYVN3ZifwHrZIXdjwhzETdnwetv09tI9Ov+4ferE1mlEAn4nf
	sSY3Dr5ASJhna4FMgo6YbS5v3GYhNj2093NYjNpCx7ejb1NxB2R+L3jPqb0A3oxrkM/0vNLDpEGth
	BrXNoHvOlbOuB+pxxYi0UGA6GUxkMtfvyum7Ko30M/8hIjQWS093qvEhV6J+XfBgU6sxBjwG+8xLB
	jhHOJo0rr9Z0YOStpUCWKunXjwZdcjjELGo5gZUHRdbNEgRQvdyhKCkgGFga7ppJM+yyHJ5UJFxPZ
	RSpstCtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9pgr-0000000AYoW-3haF;
	Tue, 29 Apr 2025 18:28:21 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9pev-0000000AYWC-2S1d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 18:26:22 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-523de5611a3so2352541e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 11:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745951179; x=1746555979; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58LgbfG3U/akqjTZ2/iNSa3gMh9sUNRwxeuhEgX/Y0g=;
        b=nKfs2KZH3BOULAAizkv1AHYD1njlgof7m2bquSzHNwtLUY/QGYhWh+QME4H6AH2xaT
         WE2poowu8j9e9eu/GivITIfTpSqMjCAx0/qEQ9aIx5NN7XHexbOkgJG7R/Hpcb8S1Tdn
         3SsD+VOnvyRjJnB4K1VR7edhXQZUcBsTx+bPjk8CXdSQDrEXIKkJ+MpBBNqbFq0KIgfw
         TpMaQgNSqGSUbjti4jB9uPLKRNlqwtHhNdV8R4VZxpCIbNvVUXqKbXiBDyAE6TLyQjZb
         oRaEdi/q3I2gZL4aTK8G78yf7tD35SLg5aby9lBOmFemWiica5llEGcQ/5YDXWaCfASD
         wpzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745951179; x=1746555979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58LgbfG3U/akqjTZ2/iNSa3gMh9sUNRwxeuhEgX/Y0g=;
        b=B0mghYr5cBTbgOOqgBS0+R4XzVb1aFsk4oV+PlBZCW5DaL2PLMHfCPAPLAd6aoVsLk
         Lo0XVilr2/Gc4QOvYb+gXph7H1amZboQ+UNeOehiY2xOev77olvHcd6C4srpn0kPpKW7
         hgPFJGi/lTKGHmGgjUQ+j8SZtROETNPB6OLj4aHYYCijXMt3mVlRO6t++l7dMGBqCrSt
         vVIUzeeJS9rxMVYPb5r8nHeBm77ArFEXqRccVSxbHfnfd/qqAeVuawOUOXP0mWRU/eZi
         XjGH/Q+/WP1DdYYHf1F+ohNgAqAGHClG3u8JbhaBoi9DDK2+onLojKGsQgTpzQhP2oeB
         X7rg==
X-Forwarded-Encrypted: i=1; AJvYcCUaG52xwSkz2fTVZmV9OHctaUuadEPZyHgufyZ5vholbpb1fut3JaoL82v6iG2UmDQSVtHheis3RVZ5HVX/WW+C@lists.infradead.org
X-Gm-Message-State: AOJu0YxAmHJgbZ0kiwKD5w3yoOYGor0x2g/2KCkO3ZVkmldVuCmc+4wa
	DySZI3DRGEiYiscX5NvkFqHcS6qi1zbRGJjjJ9u8l1J3CMeXF6KFCAKgtR8AJ2Fcje6VxBFWOiN
	OcWpVgAqv81HXZTj56ampzhMJT/D/BWQXGpOl
X-Gm-Gg: ASbGncsNeelaSrXBmN1ZYc5BZHkVXHIrxpGJj+e7hVsW02cY8w3/wcHt7m6LkzOPorX
	4rjxdIdWFwmkypLlVikx0xwZ61HtpGjxAtnaUPnF/we75VyYh25bfXFGxXZBW2B4vTmRkknHOEd
	sTb1mfq8niPdGYF4oRE1Vi9zLPY0sLrNke4sX8lGN6O7aYZsl4BSdvXiSKhpRMrgI=
X-Google-Smtp-Source: AGHT+IH5cr9Ut+CDjG7qjqlVvmddBRkuDPzZ/YZJrl44vOySOf2ltBVtU1T05iiihlj09EjlDGqWtCfXcZXv/SfWH9o=
X-Received: by 2002:a05:6122:510:b0:529:d7e:d13f with SMTP id
 71dfb90a1353d-52acd85566bmr243162e0c.9.1745951179027; Tue, 29 Apr 2025
 11:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250412010940.1686376-1-dylanbhatch@google.com> <20250412010940.1686376-3-dylanbhatch@google.com>
In-Reply-To: <20250412010940.1686376-3-dylanbhatch@google.com>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Tue, 29 Apr 2025 11:26:07 -0700
X-Gm-Features: ATxdqUE9N_cvxjdL3lDkLDn1EjErWG-skaiY_wth7077LARfxATSMwdtMGMIH00
Message-ID: <CADBMgpyk8hA3tm+RWLL-9bv-k2eEPWz0E9wSSoKVZ+snq3ESHg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64/module: Use text-poke API for late relocations.
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, KP Singh <kpsingh@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Jiri Olsa <jolsa@kernel.org>, Hao Luo <haoluo@google.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, Song Liu <song@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_112621_632897_EC7A4937 
X-CRM114-Status: GOOD (  23.97  )
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

On Fri, Apr 11, 2025 at 6:10=E2=80=AFPM Dylan Hatch <dylanbhatch@google.com=
> wrote:
>
> To enable late module patching, livepatch modules need to be able to
> apply some of their relocations well after being loaded. In this
> scenario, use the text-poking API to allow this, even with
> STRICT_MODULE_RWX.
>
> This patch is largely based off commit 88fc078a7a8f6 ("x86/module: Use
> text_poke() for late relocations").
>
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> ---
>  arch/arm64/kernel/module.c | 129 ++++++++++++++++++++++++-------------
>  1 file changed, 83 insertions(+), 46 deletions(-)
>
> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> index 06bb680bfe975..0703502d9dc37 100644
> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c
> @@ -18,11 +18,13 @@
>  #include <linux/moduleloader.h>
>  #include <linux/random.h>
>  #include <linux/scs.h>
> +#include <linux/memory.h>
>
>  #include <asm/alternative.h>
>  #include <asm/insn.h>
>  #include <asm/scs.h>
>  #include <asm/sections.h>
> +#include <asm/text-patching.h>
>
>  enum aarch64_reloc_op {
>         RELOC_OP_NONE,
> @@ -48,7 +50,8 @@ static u64 do_reloc(enum aarch64_reloc_op reloc_op, __l=
e32 *place, u64 val)
>         return 0;
>  }
>
> -static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, in=
t len)
> +static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, in=
t len,
> +                     void *(*write)(void *dest, const void *src, size_t =
len))
>  {
>         s64 sval =3D do_reloc(op, place, val);
>
> @@ -66,7 +69,7 @@ static int reloc_data(enum aarch64_reloc_op op, void *p=
lace, u64 val, int len)
>
>         switch (len) {
>         case 16:
> -               *(s16 *)place =3D sval;
> +               write(place, &sval, sizeof(s16));
>                 switch (op) {
>                 case RELOC_OP_ABS:
>                         if (sval < 0 || sval > U16_MAX)
> @@ -82,7 +85,7 @@ static int reloc_data(enum aarch64_reloc_op op, void *p=
lace, u64 val, int len)
>                 }
>                 break;
>         case 32:
> -               *(s32 *)place =3D sval;
> +               write(place, &sval, sizeof(s32));
>                 switch (op) {
>                 case RELOC_OP_ABS:
>                         if (sval < 0 || sval > U32_MAX)
> @@ -98,7 +101,7 @@ static int reloc_data(enum aarch64_reloc_op op, void *=
place, u64 val, int len)
>                 }
>                 break;
>         case 64:
> -               *(s64 *)place =3D sval;
> +               write(place, &sval, sizeof(s64));
>                 break;
>         default:
>                 pr_err("Invalid length (%d) for data relocation\n", len);
> @@ -113,11 +116,13 @@ enum aarch64_insn_movw_imm_type {
>  };
>
>  static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u64 =
val,
> -                          int lsb, enum aarch64_insn_movw_imm_type imm_t=
ype)
> +                          int lsb, enum aarch64_insn_movw_imm_type imm_t=
ype,
> +                          void *(*write)(void *dest, const void *src, si=
ze_t len))
>  {
>         u64 imm;
>         s64 sval;
>         u32 insn =3D le32_to_cpu(*place);
> +       __le32 le_insn;
>
>         sval =3D do_reloc(op, place, val);
>         imm =3D sval >> lsb;
> @@ -145,7 +150,8 @@ static int reloc_insn_movw(enum aarch64_reloc_op op, =
__le32 *place, u64 val,
>
>         /* Update the instruction with the new encoding. */
>         insn =3D aarch64_insn_encode_immediate(AARCH64_INSN_IMM_16, insn,=
 imm);
> -       *place =3D cpu_to_le32(insn);
> +       le_insn =3D cpu_to_le32(insn);
> +       write(place, &le_insn, sizeof(le_insn));
>
>         if (imm > U16_MAX)
>                 return -ERANGE;
> @@ -154,11 +160,13 @@ static int reloc_insn_movw(enum aarch64_reloc_op op=
, __le32 *place, u64 val,
>  }
>
>  static int reloc_insn_imm(enum aarch64_reloc_op op, __le32 *place, u64 v=
al,
> -                         int lsb, int len, enum aarch64_insn_imm_type im=
m_type)
> +                         int lsb, int len, enum aarch64_insn_imm_type im=
m_type,
> +                         void *(*write)(void *dest, const void *src, siz=
e_t len))
>  {
>         u64 imm, imm_mask;
>         s64 sval;
>         u32 insn =3D le32_to_cpu(*place);
> +       __le32 le_insn;
>
>         /* Calculate the relocation value. */
>         sval =3D do_reloc(op, place, val);
> @@ -170,7 +178,8 @@ static int reloc_insn_imm(enum aarch64_reloc_op op, _=
_le32 *place, u64 val,
>
>         /* Update the instruction's immediate field. */
>         insn =3D aarch64_insn_encode_immediate(imm_type, insn, imm);
> -       *place =3D cpu_to_le32(insn);
> +       le_insn =3D cpu_to_le32(insn);
> +       write(place, &le_insn, sizeof(le_insn));
>
>         /*
>          * Extract the upper value bits (including the sign bit) and
> @@ -189,17 +198,19 @@ static int reloc_insn_imm(enum aarch64_reloc_op op,=
 __le32 *place, u64 val,
>  }
>
>  static int reloc_insn_adrp(struct module *mod, Elf64_Shdr *sechdrs,
> -                          __le32 *place, u64 val)
> +                          __le32 *place, u64 val,
> +                          void *(*write)(void *dest, const void *src, si=
ze_t len))
>  {
>         u32 insn;
> +       __le32 le_insn;
>
>         if (!is_forbidden_offset_for_adrp(place))
>                 return reloc_insn_imm(RELOC_OP_PAGE, place, val, 12, 21,
> -                                     AARCH64_INSN_IMM_ADR);
> +                                     AARCH64_INSN_IMM_ADR, write);
>
>         /* patch ADRP to ADR if it is in range */
>         if (!reloc_insn_imm(RELOC_OP_PREL, place, val & ~0xfff, 0, 21,
> -                           AARCH64_INSN_IMM_ADR)) {
> +                           AARCH64_INSN_IMM_ADR, write)) {
>                 insn =3D le32_to_cpu(*place);
>                 insn &=3D ~BIT(31);
>         } else {
> @@ -211,15 +222,17 @@ static int reloc_insn_adrp(struct module *mod, Elf6=
4_Shdr *sechdrs,
>                                                    AARCH64_INSN_BRANCH_NO=
LINK);
>         }
>
> -       *place =3D cpu_to_le32(insn);
> +       le_insn =3D cpu_to_le32(insn);
> +       write(place, &le_insn, sizeof(le_insn));
>         return 0;
>  }
>
> -int apply_relocate_add(Elf64_Shdr *sechdrs,
> +static int __apply_relocate_add(Elf64_Shdr *sechdrs,
>                        const char *strtab,
>                        unsigned int symindex,
>                        unsigned int relsec,
> -                      struct module *me)
> +                      struct module *me,
> +                      void *(*write)(void *dest, const void *src, size_t=
 len))
>  {
>         unsigned int i;
>         int ovf;
> @@ -255,23 +268,23 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
>                 /* Data relocations. */
>                 case R_AARCH64_ABS64:
>                         overflow_check =3D false;
> -                       ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 64);
> +                       ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 64, wr=
ite);
>                         break;
>                 case R_AARCH64_ABS32:
> -                       ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 32);
> +                       ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 32, wr=
ite);
>                         break;
>                 case R_AARCH64_ABS16:
> -                       ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 16);
> +                       ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 16, wr=
ite);
>                         break;
>                 case R_AARCH64_PREL64:
>                         overflow_check =3D false;
> -                       ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 64);
> +                       ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 64, w=
rite);
>                         break;
>                 case R_AARCH64_PREL32:
> -                       ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 32);
> +                       ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 32, w=
rite);
>                         break;
>                 case R_AARCH64_PREL16:
> -                       ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 16);
> +                       ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 16, w=
rite);
>                         break;
>
>                 /* MOVW instruction relocations. */
> @@ -280,88 +293,88 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
>                         fallthrough;
>                 case R_AARCH64_MOVW_UABS_G0:
>                         ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 0=
,
> -                                             AARCH64_INSN_IMM_MOVKZ);
> +                                             AARCH64_INSN_IMM_MOVKZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_UABS_G1_NC:
>                         overflow_check =3D false;
>                         fallthrough;
>                 case R_AARCH64_MOVW_UABS_G1:
>                         ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 1=
6,
> -                                             AARCH64_INSN_IMM_MOVKZ);
> +                                             AARCH64_INSN_IMM_MOVKZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_UABS_G2_NC:
>                         overflow_check =3D false;
>                         fallthrough;
>                 case R_AARCH64_MOVW_UABS_G2:
>                         ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 3=
2,
> -                                             AARCH64_INSN_IMM_MOVKZ);
> +                                             AARCH64_INSN_IMM_MOVKZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_UABS_G3:
>                         /* We're using the top bits so we can't overflow.=
 */
>                         overflow_check =3D false;
>                         ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 4=
8,
> -                                             AARCH64_INSN_IMM_MOVKZ);
> +                                             AARCH64_INSN_IMM_MOVKZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_SABS_G0:
>                         ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 0=
,
> -                                             AARCH64_INSN_IMM_MOVNZ);
> +                                             AARCH64_INSN_IMM_MOVNZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_SABS_G1:
>                         ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 1=
6,
> -                                             AARCH64_INSN_IMM_MOVNZ);
> +                                             AARCH64_INSN_IMM_MOVNZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_SABS_G2:
>                         ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 3=
2,
> -                                             AARCH64_INSN_IMM_MOVNZ);
> +                                             AARCH64_INSN_IMM_MOVNZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_PREL_G0_NC:
>                         overflow_check =3D false;
>                         ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
0,
> -                                             AARCH64_INSN_IMM_MOVKZ);
> +                                             AARCH64_INSN_IMM_MOVKZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_PREL_G0:
>                         ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
0,
> -                                             AARCH64_INSN_IMM_MOVNZ);
> +                                             AARCH64_INSN_IMM_MOVNZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_PREL_G1_NC:
>                         overflow_check =3D false;
>                         ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
16,
> -                                             AARCH64_INSN_IMM_MOVKZ);
> +                                             AARCH64_INSN_IMM_MOVKZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_PREL_G1:
>                         ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
16,
> -                                             AARCH64_INSN_IMM_MOVNZ);
> +                                             AARCH64_INSN_IMM_MOVNZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_PREL_G2_NC:
>                         overflow_check =3D false;
>                         ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
32,
> -                                             AARCH64_INSN_IMM_MOVKZ);
> +                                             AARCH64_INSN_IMM_MOVKZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_PREL_G2:
>                         ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
32,
> -                                             AARCH64_INSN_IMM_MOVNZ);
> +                                             AARCH64_INSN_IMM_MOVNZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_PREL_G3:
>                         /* We're using the top bits so we can't overflow.=
 */
>                         overflow_check =3D false;
>                         ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
48,
> -                                             AARCH64_INSN_IMM_MOVNZ);
> +                                             AARCH64_INSN_IMM_MOVNZ, wri=
te);
>                         break;
>
>                 /* Immediate instruction relocations. */
>                 case R_AARCH64_LD_PREL_LO19:
>                         ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc, val, 2=
, 19,
> -                                            AARCH64_INSN_IMM_19);
> +                                            AARCH64_INSN_IMM_19, write);
>                         break;
>                 case R_AARCH64_ADR_PREL_LO21:
>                         ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc, val, 0=
, 21,
> -                                            AARCH64_INSN_IMM_ADR);
> +                                            AARCH64_INSN_IMM_ADR, write)=
;
>                         break;
>                 case R_AARCH64_ADR_PREL_PG_HI21_NC:
>                         overflow_check =3D false;
>                         fallthrough;
>                 case R_AARCH64_ADR_PREL_PG_HI21:
> -                       ovf =3D reloc_insn_adrp(me, sechdrs, loc, val);
> +                       ovf =3D reloc_insn_adrp(me, sechdrs, loc, val, wr=
ite);
>                         if (ovf && ovf !=3D -ERANGE)
>                                 return ovf;
>                         break;
> @@ -369,46 +382,46 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
>                 case R_AARCH64_LDST8_ABS_LO12_NC:
>                         overflow_check =3D false;
>                         ovf =3D reloc_insn_imm(RELOC_OP_ABS, loc, val, 0,=
 12,
> -                                            AARCH64_INSN_IMM_12);
> +                                            AARCH64_INSN_IMM_12, write);
>                         break;
>                 case R_AARCH64_LDST16_ABS_LO12_NC:
>                         overflow_check =3D false;
>                         ovf =3D reloc_insn_imm(RELOC_OP_ABS, loc, val, 1,=
 11,
> -                                            AARCH64_INSN_IMM_12);
> +                                            AARCH64_INSN_IMM_12, write);
>                         break;
>                 case R_AARCH64_LDST32_ABS_LO12_NC:
>                         overflow_check =3D false;
>                         ovf =3D reloc_insn_imm(RELOC_OP_ABS, loc, val, 2,=
 10,
> -                                            AARCH64_INSN_IMM_12);
> +                                            AARCH64_INSN_IMM_12, write);
>                         break;
>                 case R_AARCH64_LDST64_ABS_LO12_NC:
>                         overflow_check =3D false;
>                         ovf =3D reloc_insn_imm(RELOC_OP_ABS, loc, val, 3,=
 9,
> -                                            AARCH64_INSN_IMM_12);
> +                                            AARCH64_INSN_IMM_12, write);
>                         break;
>                 case R_AARCH64_LDST128_ABS_LO12_NC:
>                         overflow_check =3D false;
>                         ovf =3D reloc_insn_imm(RELOC_OP_ABS, loc, val, 4,=
 8,
> -                                            AARCH64_INSN_IMM_12);
> +                                            AARCH64_INSN_IMM_12, write);
>                         break;
>                 case R_AARCH64_TSTBR14:
>                         ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc, val, 2=
, 14,
> -                                            AARCH64_INSN_IMM_14);
> +                                            AARCH64_INSN_IMM_14, write);
>                         break;
>                 case R_AARCH64_CONDBR19:
>                         ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc, val, 2=
, 19,
> -                                            AARCH64_INSN_IMM_19);
> +                                            AARCH64_INSN_IMM_19, write);
>                         break;
>                 case R_AARCH64_JUMP26:
>                 case R_AARCH64_CALL26:
>                         ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc, val, 2=
, 26,
> -                                            AARCH64_INSN_IMM_26);
> +                                            AARCH64_INSN_IMM_26, write);
>                         if (ovf =3D=3D -ERANGE) {
>                                 val =3D module_emit_plt_entry(me, sechdrs=
, loc, &rel[i], sym);
>                                 if (!val)
>                                         return -ENOEXEC;
>                                 ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc=
, val, 2,
> -                                                    26, AARCH64_INSN_IMM=
_26);
> +                                                    26, AARCH64_INSN_IMM=
_26, write);
>                         }
>                         break;
>
> @@ -431,6 +444,30 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
>         return -ENOEXEC;
>  }
>
> +int apply_relocate_add(Elf64_Shdr *sechdrs,
> +                      const char *strtab,
> +                      unsigned int symindex,
> +                      unsigned int relsec,
> +                      struct module *me)
> +{
> +       int ret;
> +       bool early =3D me->state =3D=3D MODULE_STATE_UNFORMED;
> +       void *(*write)(void *, const void *, size_t) =3D memcpy;
> +
> +       if (!early) {
> +               write =3D text_poke;
> +               mutex_lock(&text_mutex);
> +       }
> +
> +       ret =3D __apply_relocate_add(sechdrs, strtab, symindex, relsec, m=
e,
> +                                  write);
> +
> +       if (!early)
> +               mutex_unlock(&text_mutex);
> +
> +       return ret;
> +}
> +
>  static inline void __init_plt(struct plt_entry *plt, unsigned long addr)
>  {
>         *plt =3D get_plt_entry(addr, plt);
> --
> 2.49.0.604.gff1f9ca942-goog
>

Catalin and Will,

Are you comfortable with taking these patches? Is this a workable
approach to enable livepatching arm64 modules?

Thanks,
Dylan

