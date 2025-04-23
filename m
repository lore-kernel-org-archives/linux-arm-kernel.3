Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2252BC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 23:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXoZ2ZNwDhcNR07/SzFu2ZabtndHTESSbkDsuYdq6Zo=; b=BJ/latEi6WAbgZo/4r7I4VCOfs
	NuoYM2x6MgkmU5nbX6RtIlaQg7SEICVu5sqXdRRoQ4Pw0KujdY1BgGHpBndr+yO1cIyiBJbq1FRlP
	J4GrbQ1Bu+H36OusCLbw0PAChlvM3neRhYOYdox1Jo6s8xzoaOlb3RcPpiM2J/wClrGKCCuJtpvAR
	UXWLRTAZyQtatR90MDcFAHh8xIRpBf9uyVfBrIcgeXWhG0rTgvtq6rDPlPfNIMX2CyM6Rh98XmnkF
	ZhFZn3CLXGaW/ln5ZyMx8FnCq31OwQocICINL5KmWd85jJzTSO0qlSCTrrp9bscuy/zHcz0dazM54
	pc0mIQPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7j6H-0000000CEsb-1dLl;
	Wed, 23 Apr 2025 23:01:53 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7j4I-0000000CEju-0u89
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 22:59:51 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-523ee30e0d4so209784e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 15:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745449189; x=1746053989; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXoZ2ZNwDhcNR07/SzFu2ZabtndHTESSbkDsuYdq6Zo=;
        b=ENm2Xa+DoNDIA6TcfhC/qI57JUBnsMULwhvlzfntgzqytq1OCie/y5L0yknmsn1806
         du8GhNNkn9SH3x5fQjwsF9mDXuNAz9xpjpnIvs+Mqk3CC+Mcez151OXSrDb3T6ysWdQq
         0CBJ10CosqOhgdJXN4gOnz32Uc0APvgvnUUa8i9G6KSXiW627L/1I8XrZxxTYTTYbXez
         pfMTIviadpCgqcSGyBBH1/CBpT5pWfZShGXWjQqsuiMHQOMW+LN1iCDZSimff0M2Y++H
         Z3zqGeKJCigAdVVh5QJEnpRcwUlMwm48/2uKo2svvVcohvp/HWvkM2v+pBHW+Y+DDZ3M
         o58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745449189; x=1746053989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXoZ2ZNwDhcNR07/SzFu2ZabtndHTESSbkDsuYdq6Zo=;
        b=bIMe2PYcmun0ubr7u8ODKsLNRnp9ShJTJtInwIz7/LMMYdauOPdomNsXwa6f1610Vx
         /QmvUc3voOcDPZGgYG7Y1eEl4Gmxk2ZCBFxbMVqN2DIXin6YAcvArj3XWc+5RDeqShiI
         qYtcochtDl0e5quNdn5agvnUw1PMWY2FTNhB35ZskZ//3yjDzh+fgLCwbIOVqRbJYqKk
         O1odGasHnMmUIek2ctAv2emp5VYjt11z0A6ln3wyFsU6gTbhfNclCKAG/RQU1CdSzmm2
         bTl5eX9M/8Hzk7WssQ5Azm4LHIljPyXggOsivv0VxYP29dac9ZPChWgT0OHK/Aaab9pb
         nWdw==
X-Forwarded-Encrypted: i=1; AJvYcCXcNuhWi3sx7e6aiclWoyUJR084iOjJUPdc4aT8g7wjHIINHnkENbBObG9wDYO/HAMb91SW5UxFqOwO40OlaBs+@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3n8WFeGYi4al3+jfUUKE+m1qwY8fcNr1QSS5zr0tHKO+UjErM
	1YRiRBiKbbAazhPK2+l+DAoRd2lDWxJMmcQEhqC8LwqBIzAa6uQKHhKZ9URfM5bcJzGPuYz4+zF
	BdVxXwoxerBMveBGLMy8z3pqp3KG0A6EcGUpL
X-Gm-Gg: ASbGnctRgD2lLtAEOemuqHfnRr8JVkRNlbyw5pD4aCmotCXQ/sCFs3XUyAnpARhcSgy
	uyHL2TatK5dl4ksxqoWbVkO1UT1t4SZcv6N9htYriL7hCGcjt1duPfVvFoSLIjTgSB8sFbsqTYZ
	/Sou78qbHZKhPhTh7a3HJsMw==
X-Google-Smtp-Source: AGHT+IF60M8+ZNsWDyo47bTzOIYyhaVz5mclHJ/84MXkiPlA3bkadWKzAEzX7gG6htJoRI19TAQDjOHSQqBFbftMELk=
X-Received: by 2002:a05:6122:1ad0:b0:525:9ddc:381a with SMTP id
 71dfb90a1353d-52a78370ad2mr532588e0c.6.1745449188595; Wed, 23 Apr 2025
 15:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250412010940.1686376-1-dylanbhatch@google.com>
 <20250412010940.1686376-3-dylanbhatch@google.com> <TY4PR01MB1377739F1CC08549A619C8635D7BA2@TY4PR01MB13777.jpnprd01.prod.outlook.com>
In-Reply-To: <TY4PR01MB1377739F1CC08549A619C8635D7BA2@TY4PR01MB13777.jpnprd01.prod.outlook.com>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Wed, 23 Apr 2025 15:59:37 -0700
X-Gm-Features: ATxdqUFYl-jdgZq2Dd_zI0bKdRlzsLg7pLKGs1yzI7EMMR3HJl_TD7140ifhmrU
Message-ID: <CADBMgpyJLM91ZaPZQmzKoDghxpVvsfXjAe83k_tnNAkWnu_Rsw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64/module: Use text-poke API for late relocations.
To: "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_155950_265374_876E7464 
X-CRM114-Status: GOOD (  26.37  )
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

Hi Toshiyuki,

On Tue, Apr 22, 2025 at 11:05=E2=80=AFPM Toshiyuki Sato (Fujitsu)
<fj6611ie@fujitsu.com> wrote:
>
> Hi Dylan,
>
> > To enable late module patching, livepatch modules need to be able to
> > apply some of their relocations well after being loaded. In this
> > scenario, use the text-poking API to allow this, even with
> > STRICT_MODULE_RWX.
> >
> > This patch is largely based off commit 88fc078a7a8f6 ("x86/module: Use
> > text_poke() for late relocations").
> >
> > Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> > ---
> >  arch/arm64/kernel/module.c | 129 ++++++++++++++++++++++++-------------
> >  1 file changed, 83 insertions(+), 46 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> > index 06bb680bfe975..0703502d9dc37 100644
> > --- a/arch/arm64/kernel/module.c
> > +++ b/arch/arm64/kernel/module.c
> > @@ -18,11 +18,13 @@
> >  #include <linux/moduleloader.h>
> >  #include <linux/random.h>
> >  #include <linux/scs.h>
> > +#include <linux/memory.h>
> >
> >  #include <asm/alternative.h>
> >  #include <asm/insn.h>
> >  #include <asm/scs.h>
> >  #include <asm/sections.h>
> > +#include <asm/text-patching.h>
> >
> >  enum aarch64_reloc_op {
> >       RELOC_OP_NONE,
> > @@ -48,7 +50,8 @@ static u64 do_reloc(enum aarch64_reloc_op reloc_op, _=
_le32 *place, u64 val)
> >       return 0;
> >  }
> >
> > -static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, =
int len)
> > +static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, =
int len,
> > +                   void *(*write)(void *dest, const void *src, size_t =
len))
> >  {
> >       s64 sval =3D do_reloc(op, place, val);
> >
> > @@ -66,7 +69,7 @@ static int reloc_data(enum aarch64_reloc_op op, void =
*place, u64 val, int len)
> >
> >       switch (len) {
> >       case 16:
> > -             *(s16 *)place =3D sval;
> > +             write(place, &sval, sizeof(s16));
> >               switch (op) {
> >               case RELOC_OP_ABS:
> >                       if (sval < 0 || sval > U16_MAX)
> > @@ -82,7 +85,7 @@ static int reloc_data(enum aarch64_reloc_op op, void =
*place, u64 val, int len)
> >               }
> >               break;
> >       case 32:
> > -             *(s32 *)place =3D sval;
> > +             write(place, &sval, sizeof(s32));
> >               switch (op) {
> >               case RELOC_OP_ABS:
> >                       if (sval < 0 || sval > U32_MAX)
> > @@ -98,7 +101,7 @@ static int reloc_data(enum aarch64_reloc_op op, void=
 *place, u64 val, int len)
> >               }
> >               break;
> >       case 64:
> > -             *(s64 *)place =3D sval;
> > +             write(place, &sval, sizeof(s64));
> >               break;
> >       default:
> >               pr_err("Invalid length (%d) for data relocation\n", len);
> > @@ -113,11 +116,13 @@ enum aarch64_insn_movw_imm_type {
> >  };
> >
> >  static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u6=
4 val,
> > -                        int lsb, enum aarch64_insn_movw_imm_type imm_t=
ype)
> > +                        int lsb, enum aarch64_insn_movw_imm_type imm_t=
ype,
> > +                        void *(*write)(void *dest, const void *src, si=
ze_t len))
> >  {
> >       u64 imm;
> >       s64 sval;
> >       u32 insn =3D le32_to_cpu(*place);
> > +     __le32 le_insn;
> >
> >       sval =3D do_reloc(op, place, val);
> >       imm =3D sval >> lsb;
> > @@ -145,7 +150,8 @@ static int reloc_insn_movw(enum aarch64_reloc_op op=
, __le32 *place, u64 val,
> >
> >       /* Update the instruction with the new encoding. */
> >       insn =3D aarch64_insn_encode_immediate(AARCH64_INSN_IMM_16, insn,=
 imm);
> > -     *place =3D cpu_to_le32(insn);
> > +     le_insn =3D cpu_to_le32(insn);
> > +     write(place, &le_insn, sizeof(le_insn));
> >
> >       if (imm > U16_MAX)
> >               return -ERANGE;
> > @@ -154,11 +160,13 @@ static int reloc_insn_movw(enum aarch64_reloc_op =
op, __le32 *place, u64 val,
> >  }
> >
> >  static int reloc_insn_imm(enum aarch64_reloc_op op, __le32 *place, u64=
 val,
> > -                       int lsb, int len, enum aarch64_insn_imm_type im=
m_type)
> > +                       int lsb, int len, enum aarch64_insn_imm_type im=
m_type,
> > +                       void *(*write)(void *dest, const void *src, siz=
e_t len))
> >  {
> >       u64 imm, imm_mask;
> >       s64 sval;
> >       u32 insn =3D le32_to_cpu(*place);
> > +     __le32 le_insn;
> >
> >       /* Calculate the relocation value. */
> >       sval =3D do_reloc(op, place, val);
> > @@ -170,7 +178,8 @@ static int reloc_insn_imm(enum aarch64_reloc_op op,=
 __le32 *place, u64 val,
> >
> >       /* Update the instruction's immediate field. */
> >       insn =3D aarch64_insn_encode_immediate(imm_type, insn, imm);
> > -     *place =3D cpu_to_le32(insn);
> > +     le_insn =3D cpu_to_le32(insn);
> > +     write(place, &le_insn, sizeof(le_insn));
> >
> >       /*
> >        * Extract the upper value bits (including the sign bit) and
> > @@ -189,17 +198,19 @@ static int reloc_insn_imm(enum aarch64_reloc_op o=
p, __le32 *place, u64 val,
> >  }
> >
> >  static int reloc_insn_adrp(struct module *mod, Elf64_Shdr *sechdrs,
> > -                        __le32 *place, u64 val)
> > +                        __le32 *place, u64 val,
> > +                        void *(*write)(void *dest, const void *src, si=
ze_t len))
> >  {
> >       u32 insn;
> > +     __le32 le_insn;
> >
> >       if (!is_forbidden_offset_for_adrp(place))
> >               return reloc_insn_imm(RELOC_OP_PAGE, place, val, 12, 21,
> > -                                   AARCH64_INSN_IMM_ADR);
> > +                                   AARCH64_INSN_IMM_ADR, write);
> >
> >       /* patch ADRP to ADR if it is in range */
> >       if (!reloc_insn_imm(RELOC_OP_PREL, place, val & ~0xfff, 0, 21,
> > -                         AARCH64_INSN_IMM_ADR)) {
> > +                         AARCH64_INSN_IMM_ADR, write)) {
> >               insn =3D le32_to_cpu(*place);
> >               insn &=3D ~BIT(31);
> >       } else {
> > @@ -211,15 +222,17 @@ static int reloc_insn_adrp(struct module *mod, El=
f64_Shdr *sechdrs,
> >                                                  AARCH64_INSN_BRANCH_NO=
LINK);
> >       }
> >
> > -     *place =3D cpu_to_le32(insn);
> > +     le_insn =3D cpu_to_le32(insn);
> > +     write(place, &le_insn, sizeof(le_insn));
> >       return 0;
> >  }
> >
> > -int apply_relocate_add(Elf64_Shdr *sechdrs,
> > +static int __apply_relocate_add(Elf64_Shdr *sechdrs,
> >                      const char *strtab,
> >                      unsigned int symindex,
> >                      unsigned int relsec,
> > -                    struct module *me)
> > +                    struct module *me,
> > +                    void *(*write)(void *dest, const void *src, size_t=
 len))
> >  {
> >       unsigned int i;
> >       int ovf;
> > @@ -255,23 +268,23 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
> >               /* Data relocations. */
> >               case R_AARCH64_ABS64:
> >                       overflow_check =3D false;
> > -                     ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 64);
> > +                     ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 64, wr=
ite);
> >                       break;
> >               case R_AARCH64_ABS32:
> > -                     ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 32);
> > +                     ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 32, wr=
ite);
> >                       break;
> >               case R_AARCH64_ABS16:
> > -                     ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 16);
> > +                     ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 16, wr=
ite);
> >                       break;
> >               case R_AARCH64_PREL64:
> >                       overflow_check =3D false;
> > -                     ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 64);
> > +                     ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 64, w=
rite);
> >                       break;
> >               case R_AARCH64_PREL32:
> > -                     ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 32);
> > +                     ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 32, w=
rite);
> >                       break;
> >               case R_AARCH64_PREL16:
> > -                     ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 16);
> > +                     ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 16, w=
rite);
> >                       break;
> >
> >               /* MOVW instruction relocations. */
> > @@ -280,88 +293,88 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
> >                       fallthrough;
> >               case R_AARCH64_MOVW_UABS_G0:
> >                       ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 0=
,
> > -                                           AARCH64_INSN_IMM_MOVKZ);
> > +                                           AARCH64_INSN_IMM_MOVKZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_UABS_G1_NC:
> >                       overflow_check =3D false;
> >                       fallthrough;
> >               case R_AARCH64_MOVW_UABS_G1:
> >                       ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 1=
6,
> > -                                           AARCH64_INSN_IMM_MOVKZ);
> > +                                           AARCH64_INSN_IMM_MOVKZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_UABS_G2_NC:
> >                       overflow_check =3D false;
> >                       fallthrough;
> >               case R_AARCH64_MOVW_UABS_G2:
> >                       ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 3=
2,
> > -                                           AARCH64_INSN_IMM_MOVKZ);
> > +                                           AARCH64_INSN_IMM_MOVKZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_UABS_G3:
> >                       /* We're using the top bits so we can't overflow.=
 */
> >                       overflow_check =3D false;
> >                       ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 4=
8,
> > -                                           AARCH64_INSN_IMM_MOVKZ);
> > +                                           AARCH64_INSN_IMM_MOVKZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_SABS_G0:
> >                       ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 0=
,
> > -                                           AARCH64_INSN_IMM_MOVNZ);
> > +                                           AARCH64_INSN_IMM_MOVNZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_SABS_G1:
> >                       ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 1=
6,
> > -                                           AARCH64_INSN_IMM_MOVNZ);
> > +                                           AARCH64_INSN_IMM_MOVNZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_SABS_G2:
> >                       ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 3=
2,
> > -                                           AARCH64_INSN_IMM_MOVNZ);
> > +                                           AARCH64_INSN_IMM_MOVNZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_PREL_G0_NC:
> >                       overflow_check =3D false;
> >                       ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
0,
> > -                                           AARCH64_INSN_IMM_MOVKZ);
> > +                                           AARCH64_INSN_IMM_MOVKZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_PREL_G0:
> >                       ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
0,
> > -                                           AARCH64_INSN_IMM_MOVNZ);
> > +                                           AARCH64_INSN_IMM_MOVNZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_PREL_G1_NC:
> >                       overflow_check =3D false;
> >                       ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
16,
> > -                                           AARCH64_INSN_IMM_MOVKZ);
> > +                                           AARCH64_INSN_IMM_MOVKZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_PREL_G1:
> >                       ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
16,
> > -                                           AARCH64_INSN_IMM_MOVNZ);
> > +                                           AARCH64_INSN_IMM_MOVNZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_PREL_G2_NC:
> >                       overflow_check =3D false;
> >                       ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
32,
> > -                                           AARCH64_INSN_IMM_MOVKZ);
> > +                                           AARCH64_INSN_IMM_MOVKZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_PREL_G2:
> >                       ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
32,
> > -                                           AARCH64_INSN_IMM_MOVNZ);
> > +                                           AARCH64_INSN_IMM_MOVNZ, wri=
te);
> >                       break;
> >               case R_AARCH64_MOVW_PREL_G3:
> >                       /* We're using the top bits so we can't overflow.=
 */
> >                       overflow_check =3D false;
> >                       ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
48,
> > -                                           AARCH64_INSN_IMM_MOVNZ);
> > +                                           AARCH64_INSN_IMM_MOVNZ, wri=
te);
> >                       break;
> >
> >               /* Immediate instruction relocations. */
> >               case R_AARCH64_LD_PREL_LO19:
> >                       ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc, val, 2=
, 19,
> > -                                          AARCH64_INSN_IMM_19);
> > +                                          AARCH64_INSN_IMM_19, write);
> >                       break;
> >               case R_AARCH64_ADR_PREL_LO21:
> >                       ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc, val, 0=
, 21,
> > -                                          AARCH64_INSN_IMM_ADR);
> > +                                          AARCH64_INSN_IMM_ADR, write)=
;
> >                       break;
> >               case R_AARCH64_ADR_PREL_PG_HI21_NC:
> >                       overflow_check =3D false;
> >                       fallthrough;
> >               case R_AARCH64_ADR_PREL_PG_HI21:
> > -                     ovf =3D reloc_insn_adrp(me, sechdrs, loc, val);
> > +                     ovf =3D reloc_insn_adrp(me, sechdrs, loc, val, wr=
ite);
> >                       if (ovf && ovf !=3D -ERANGE)
> >                               return ovf;
> >                       break;
> > @@ -369,46 +382,46 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
> >               case R_AARCH64_LDST8_ABS_LO12_NC:
> >                       overflow_check =3D false;
> >                       ovf =3D reloc_insn_imm(RELOC_OP_ABS, loc, val, 0,=
 12,
> > -                                          AARCH64_INSN_IMM_12);
> > +                                          AARCH64_INSN_IMM_12, write);
> >                       break;
> >               case R_AARCH64_LDST16_ABS_LO12_NC:
> >                       overflow_check =3D false;
> >                       ovf =3D reloc_insn_imm(RELOC_OP_ABS, loc, val, 1,=
 11,
> > -                                          AARCH64_INSN_IMM_12);
> > +                                          AARCH64_INSN_IMM_12, write);
> >                       break;
> >               case R_AARCH64_LDST32_ABS_LO12_NC:
> >                       overflow_check =3D false;
> >                       ovf =3D reloc_insn_imm(RELOC_OP_ABS, loc, val, 2,=
 10,
> > -                                          AARCH64_INSN_IMM_12);
> > +                                          AARCH64_INSN_IMM_12, write);
> >                       break;
> >               case R_AARCH64_LDST64_ABS_LO12_NC:
> >                       overflow_check =3D false;
> >                       ovf =3D reloc_insn_imm(RELOC_OP_ABS, loc, val, 3,=
 9,
> > -                                          AARCH64_INSN_IMM_12);
> > +                                          AARCH64_INSN_IMM_12, write);
> >                       break;
> >               case R_AARCH64_LDST128_ABS_LO12_NC:
> >                       overflow_check =3D false;
> >                       ovf =3D reloc_insn_imm(RELOC_OP_ABS, loc, val, 4,=
 8,
> > -                                          AARCH64_INSN_IMM_12);
> > +                                          AARCH64_INSN_IMM_12, write);
> >                       break;
> >               case R_AARCH64_TSTBR14:
> >                       ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc, val, 2=
, 14,
> > -                                          AARCH64_INSN_IMM_14);
> > +                                          AARCH64_INSN_IMM_14, write);
> >                       break;
> >               case R_AARCH64_CONDBR19:
> >                       ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc, val, 2=
, 19,
> > -                                          AARCH64_INSN_IMM_19);
> > +                                          AARCH64_INSN_IMM_19, write);
> >                       break;
> >               case R_AARCH64_JUMP26:
> >               case R_AARCH64_CALL26:
> >                       ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc, val, 2=
, 26,
> > -                                          AARCH64_INSN_IMM_26);
> > +                                          AARCH64_INSN_IMM_26, write);
> >                       if (ovf =3D=3D -ERANGE) {
> >                               val =3D module_emit_plt_entry(me, sechdrs=
, loc, &rel[i], sym);
> >                               if (!val)
> >                                       return -ENOEXEC;
> >                               ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc=
, val, 2,
> > -                                                  26, AARCH64_INSN_IMM=
_26);
> > +                                                  26, AARCH64_INSN_IMM=
_26, write);
> >                       }
> >                       break;
> >
> > @@ -431,6 +444,30 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
> >       return -ENOEXEC;
> >  }
> >
> > +int apply_relocate_add(Elf64_Shdr *sechdrs,
> > +                    const char *strtab,
> > +                    unsigned int symindex,
> > +                    unsigned int relsec,
> > +                    struct module *me)
> > +{
> > +     int ret;
> > +     bool early =3D me->state =3D=3D MODULE_STATE_UNFORMED;
> > +     void *(*write)(void *, const void *, size_t) =3D memcpy;
> > +
> > +     if (!early) {
> > +             write =3D text_poke;
> > +             mutex_lock(&text_mutex);
> > +     }
> > +
> > +     ret =3D __apply_relocate_add(sechdrs, strtab, symindex, relsec, m=
e,
> > +                                write);
> > +
> > +     if (!early)
> > +             mutex_unlock(&text_mutex);
> > +
> > +     return ret;
> > +}
> > +
> >  static inline void __init_plt(struct plt_entry *plt, unsigned long add=
r)
> >  {
> >       *plt =3D get_plt_entry(addr, plt);
> > --
> > 2.49.0.604.gff1f9ca942-goog
>
> Thanks for posting the patch.
> We are testing this patch using two types of kernels.
> Both kernels are based on version 6.13, one is patched to use the sframe =
unwinder
> in livepatch [1], the other is patched to not use sframe [2].
>
> [1] https://lore.kernel.org/all/20250127213310.2496133-1-wnliu@google.com=
/
> [2] https://lore.kernel.org/linux-arm-kernel/20250320171559.3423224-1-son=
g@kernel.org/
>
> For testing, we used a kpatch for arm64 [3] and the package's integration=
 tests.
> In an environment where only the livepatch patch was applied,
> "module-LOADED.test" failed, but after applying this patch, it passed.
> Here are the comments on the test results:[4]
>
> [3] https://github.com/dynup/kpatch/pull/1439
> [4] https://github.com/dynup/kpatch/pull/1439#issuecomment-2781731440

Thanks for the help with testing here.

> I just want to confirm one thing.
> I think the issues this patch solves are the same as those in the previou=
sly
> posted patch [5].
> Am I correct in understanding that this is an improved version?

I wasn't aware the patch [5] existed, thanks for the link.

> Furthermore, this patch also supports rewriting data relocation sections,
> which the previously posted patch did not support.

Yes, this is correct. From this perspective, this patch is an improvement.

>
> [5] https://lore.kernel.org/linux-arm-kernel/20211103210709.31790-1-suraj=
js@amazon.com/
>
> Tested-by: Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
>
> Regards,
> Toshiyuki Sato
>

Thanks,
Dylan

