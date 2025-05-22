Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C47AC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 23:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhbDibMW6rB2j7UXHc3PdZ57ETGCvWFeOSRMt4WT++k=; b=g9wnmR1tG/+1HdEBwDAVXeJp67
	+X8NLi/2QcKbrMO8+0hNHL7fR4m4V8SmyvjTfWVL9WzUWWNXb+ZiSClfDVlHIbH2ChS5WCuLy0lJc
	VcjuJH56dritHH3LLA5dl9V96VP91XThsDnoA9UzPeJl93/ZgUpTRZ4FJ2eMHBW+kxbm0jmfjQUHB
	4QeF5L/P1X1rgKIcEIJSTpFdJelmB1arn/g4jbkQ7nEGfjrIX/DCanplyo6p/mbi7FfJuvUwNqh0N
	LgvcGWpX04Lzq0V9N5aFl+1nxH+7VDuuQwGwl7eINivcJCy7oCkeAFkPFL8O0qEC/HfZH7DM4+SOD
	Ygl4TVgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFc4-00000002VN1-2IJW;
	Thu, 22 May 2025 23:46:12 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFRT-00000002To6-0A9V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 23:35:16 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-528ce9730cfso2098077e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 16:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747956914; x=1748561714; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhbDibMW6rB2j7UXHc3PdZ57ETGCvWFeOSRMt4WT++k=;
        b=lC3HxJuMtnaQlynyzz/i8gGyx8q91wFN5//K0XJuE9xlQttnUWgFtth5EtEBFZQFcb
         uRVCb3MyHI8vnAFX5nyamjhUbrMXiqjWO1tnvtpECdn/YUn1PxwV2Qtnb0ikg6HglyHF
         bRrmI5g1zWPr/h6Xx99hTSJLPj7bOfTeJvDlMzzG1b2pR8NKUpu5yziBgXBiS7stnI+H
         RllBRGFK42NxlyEM6ogT3i2iKpAp06y57mMwQh6QM09gntDVHvzIYZ4kSlgKGBDOEFCr
         /mLeL+bp5cHf/Ry+BnslpG0R/XHJucGcYVHVd3vg4IjZ8Ouhf7OgOMqPtejpPYuYoNkq
         8y7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747956914; x=1748561714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PhbDibMW6rB2j7UXHc3PdZ57ETGCvWFeOSRMt4WT++k=;
        b=R3ySElaal2LJ5zG/ozcH+UC0PCRrmDU8a4p74RjFTss/T8tldK8HT60REaPaM1k6OJ
         NQdOXKlcONcCf9yi7hCikdrg9apj2P+Vn9udKz5ZpnKZusRNyLGQgWdXefY/zDaYa3iw
         ZitHZ0DQ9z9HEBpRawPRHtBipURZRubzjDSpJesLONUsnYiRxWG8YF5n0jyb7AyyyIsG
         3hCxn7ROILoQuDLc94zgBg8zsrYBBd7Qh7yuPvVf7fak7kdSc58eZgIBAfz7OSf3Hh0Y
         ktsVnqccZd3ePf005vRP77O5br6ene9Q3IdBSO++oW2WaaXCr9oMdZEI0pSrh563eu39
         cB/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU23QzheQAXSnCVPoHJWkQDdQe45kBMLBeGYTf6WjE1138nH6K+Uch1mLkjM5E4fVoUPBJxhCtz4HbiNSrSXo1q@lists.infradead.org
X-Gm-Message-State: AOJu0YwfyEcPeZqzOLWokrqjIKOAB+0sMvA5P7FChLdUdjb80MM9Orym
	UqULeFTna9GY4/Z0skap906xWbbLHKGqTxLTWcu8PbqwNVHl7BbTPC9VhzUPTutuKEuDI5xFvtT
	Ulk7VsXDTkNuhmleacroGDPPWi8SiVofYs5jJDWPl
X-Gm-Gg: ASbGncv/0QPRqlgY56s8kSeE9glUDgoHCYkSeenimbIEXOzTXzR7ZFTWltFy2Wbvr8S
	y2fqcV0v+ZFtViMgx8V8HyCCa6K1Si6VSAHP1lmGiBlwsW05/Dld85ug7pO4sB0zoZpnXSUmY0O
	QYndCx0mdwF6k8DARgck19Eqqj9ziD/Y0DL4EivVVTYSU=
X-Google-Smtp-Source: AGHT+IEM/DFBzItMDvMT3GgRPsQthZnDZfh8oK1+E1W0b9o/n9MYajDbrxj5M/kFns8zsnpmrkISXZ+vKbECT65sysg=
X-Received: by 2002:a05:6122:428a:b0:520:60c2:3fd with SMTP id
 71dfb90a1353d-52dbcc8547emr23488507e0c.3.1747956913425; Thu, 22 May 2025
 16:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250412010940.1686376-1-dylanbhatch@google.com>
 <20250412010940.1686376-3-dylanbhatch@google.com> <20250509161508.GB5984@willie-the-truck>
In-Reply-To: <20250509161508.GB5984@willie-the-truck>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Thu, 22 May 2025 16:35:02 -0700
X-Gm-Features: AX0GCFs1KL1GwnkdFjpSiBC0RbR_upY_O1F4fBatrZc5VR2faRf35nbV_nq9o_s
Message-ID: <CADBMgpzZz_Nn63DLwEbdurwkEUK7RsFXPhMf7Fw3WwOdpp67BA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64/module: Use text-poke API for late relocations.
To: Will Deacon <will@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_163515_084366_037FF8C7 
X-CRM114-Status: GOOD (  45.50  )
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

Hi Will,

I've sent a v4 of these patches that should address your comments,
feel free to have a look.

On Fri, May 9, 2025 at 9:15=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> Hi Dylan,
>
> On Sat, Apr 12, 2025 at 01:09:39AM +0000, Dylan Hatch wrote:
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
>
> On its own, this isn't gaining us an awful lot upstream as we don't have
> livepatch support (arm64 does not select HAVE_LIVEPATCH), however I'm
> not against incremental changes towards enabling that. Are you planning
> to work on follow-up changes for the rest of the support?

As Song mentioned, hopefully
https://lore.kernel.org/linux-arm-kernel/20250320171559.3423224-1-song@kern=
el.org/
in combination with this patch should be enough for initial support of
livepatch on arm64. I'll need to follow up with Weinan on next steps
for the SFrame approach.

>
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
>
> I think it's a bit grotty indirecting the write when in reality we either
> need a straight-forward assignment (like we have today) or a call to
> an instruction-patching helper.
>
> In particular, when you get to functions such as:
>
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
>
> we're forced into passing &le_insn because we need the same function
> prototype as memcpy().
>
> Instead, how about we pass the 'struct module *mod' pointer down from
> apply_relocate_add()? That's already done for reloc_insn_adrp() and it
> would mean that the above could be written as:
>
>
> static int reloc_insn_movw(struct module *mod, enum aarch64_reloc_op op,
>                            __le32 *place, u64 val, int lsb,
>                            enum aarch64_insn_movw_imm_type imm_type)
> {
>         ...
>
>         insn =3D aarch64_insn_encode_immediate(AARCH64_INSN_IMM_16, insn,=
 imm);
>         insn =3D cpu_to_le32(insn);
>
>         if (mod->state !=3D MODULE_STATE_UNFORMED)
>                 aarch64_insn_set(place, insn, sizeof(insn));
>         else
>                 *place =3D insn;
>
>
> meaning we can also drop the first patch, because I don't think we need
> a text_poke() helper.

Dropped the first patch in v4 and switched to the method suggested
here, so we use a normal assignment for the non-late case. Though, it
does seem a little repetitive, with 6 different sites doing this
module state check. If having a straightforward assignment directly in
the reloc_* functions isn't too important, I wonder if we can make
local memset/memcpy-like helpers to contain this check? Like:

static void *write_insn(void *place, u32 insn, struct module *me);
static void *write_data(void *place, s64 *sval, struct module *me);

>
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
>
> Why is the responsibility of the arch code to take the 'text_mutex' here?
> The core code should be able to do that when the module state is !=3D
> MODULE_STATE_UNFORMED.
>

Moved the locking to kernel/livepatch/core.c in v4, since other call
sites to apply_relocate_add() don't attempt late relocations. Since
the locking was already being done in the x86 module code I had to
remove this. It also made sense to me to split out the text_mutex
changes into a separate patch because they only touch module/x86 and
livepatch code, so that's how I did it in v4. But they can just as
easily be squashed into one patch.

Thanks,
Dylan

