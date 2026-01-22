Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89705D6CFA1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 19:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Od+DPMtD5to2A0BufNITjmJhKQ0ptW5p2YHxn8s3B8=; b=Q8GW5gB9qOEa3Im3v+UWmQgHfp
	RlOF/DYOXL8X6v36L5rioNqVu5i0P9LoLFxg04iTg7u9PlbSX9tVQiJ08TEAQLZJYOa0/sedhrlwh
	JgdJwXzCE1UXg5LCRK7izTsTkS7jv1t4SyAlp8WcCbVSXHGTuHtE0MfPt5IMiRSnPkkDsJPqxA/6M
	FDBVZMhkHqhcy5UNMg0ncFP+b6pFuRMpij0jtUr3jERODqhgfvUAwDrwUB+2ReO+jTR+sDj+wva2L
	uQZSjgye3HgCjA52GOoQgLWp87a6C7M8xz2T9Y/9PcyaXETUeLBnmYTms+Zph7MiNGkfw2nz7j2Ph
	U8cTxi3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj0EB-00000007glf-0Y3M;
	Thu, 22 Jan 2026 19:20:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj0E9-00000007glQ-1bYx
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 19:20:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6Od+DPMtD5to2A0BufNITjmJhKQ0ptW5p2YHxn8s3B8=; b=CD6lYF5fVE/+6VdC4K5FQVOZyn
	SkWWrSLOH1u7oO+YWhcsEmknnfgpT/sH2onc9OBZoAbTIrQxfoVwSZrYNH7WFCjRO4Fpy7U0CUrsf
	5gddbHzGy1iWzUN/25x1s5lyrfJhVJwT27WqLlYLIECJGdYpKZOoEE6ybj2aX8WC5mSoXoRFwMwpQ
	+yA6Faamu6aK+uk8j/vjhStFNRoV3tC/EFr0D7tFs2ULSQk1FFd8ZaMRu3gFoMwUvhgnq0JurFX0S
	xVpqvUaldObEYNG3nHeXnXccNeIh7XHU8fUfXAYuNKQ3VRtESo8roXHi2g7Ni9MCA0HS1F861I19V
	Tsu0H7gQ==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj0E6-0000000196u-22xY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 19:20:20 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a76b39587aso10795ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 11:20:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769109616; cv=none;
        d=google.com; s=arc-20240605;
        b=dhzCQFErjrFW1A0OrlVzj3KPoZqck49WC0Pzt6e+fkC25ZbZHgif/ZGdSTw/MXB1Cd
         OdJ5XM26kI9kMvMSjW9sR43n5GkP8avmUjuxKsyXKjviN0PfBXE4P0bg1vO17ZCRyoOv
         mQT/kOaGwRCQ1ySb34LLBOTw1MigcEdBF7vDZYCtXPKKmp85NQYoytGWj2L7prreTYo+
         XtVM6SkBL+L/aO2cxqJWzM+QBAaxqmzicCmq8pQatZAmL2m9cKQZw+yJFq5lLIvATGgR
         7+GC3U9xpAHCa9fl/I8U2orjld3djGk+n2FW+8WEo99lK/f2hQqnK+mnRZLznWZjptwj
         8LBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Od+DPMtD5to2A0BufNITjmJhKQ0ptW5p2YHxn8s3B8=;
        fh=WVSXzbkzwG7ypNkzyM099GYURU4gz3pGoxtyXf3wH8A=;
        b=bwe+145k96dKGNEWJvqh0ckAwukIZANSetybZAeJOdvrOZQO+qHE0s0MHlj1RnMF3/
         SpFnmuwoocBAlcvsUH/22CHvY4HTOso+5247x/37R05ziIxmoRgGg8g9dzJ5YIM0SrXD
         uu2tyK2CabYrhF6Sm5jm+gRzCv5xbSxsXhjjx64PMJeSFHbkGjvj7STI+tFm/wBfix6q
         Parf1u0gFRHll8X+ypvl3NOg1og7rw4r0LxBLtO77GrOGIsjZDsmo4M25asds5eXkuT8
         czyA25Z+uXzBJHTqa24WuyJj+oHxu4AOeu6UtPXbkdwcuFiF8SJ2CNTZ/v5o7xEZ6GB4
         aIKA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769109616; x=1769714416; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Od+DPMtD5to2A0BufNITjmJhKQ0ptW5p2YHxn8s3B8=;
        b=C61WpgBFSAwo1YVCMWqDA44vhT7rfG14JHKEfP06sQ7F9OWo2H9sdYsqU1pSxjFWix
         KnXnhXxi4ESyqjVl52PIREO0XCtWWer/rM2pvlBk1Q2vmhELlDqoOvA5SPIsfF/r7z1/
         uPzL0naGfrkDi3hciALpALg7JGGOtGfCJeEPTP7PT/gQVDK1mqUPF1OrqXyhPRTcFctf
         Xwzm17MyfDUcUqa1proD+OWDm7ve5M2q5Xm8YY1yam9hWgwj0r3pB2GYpCuCtXe6uDgE
         x8d/ZCpg6P9fPAQYSQ4OKKAXWRfJR3FDGUgYWxEetqXYwH4VZX2d4P7J0635ILbMvAtm
         zrvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769109616; x=1769714416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Od+DPMtD5to2A0BufNITjmJhKQ0ptW5p2YHxn8s3B8=;
        b=cs3ulsKSGFGv+8rxS16XwKtJvsMJxNxQ+HMxS1zLlssbVn49t7OTESt3xVwtFikgbh
         eFBdhhgRqpBv2uRk88cXkd+jHBd2w3kNLu9CdeUWInBjUZ/JeocYa77cohJw7YW/WTTD
         U+vgnikVSzHeMuTD5GOMFg207u8d0Fg+wzIodWP0xhGC3VW34pVD+oXw8QmpSOB/WBe6
         UgBNywD3LBW5IpihEZ2r362Ana2vTfMB1GK2Tuc5Lw0qIobuwEAMtJtO+lQjntsY4PXR
         MKOf8AR1jLKpWE60ENIwh1RaacJ8Eayh2p4mEIhsu5felccjblxd+ODsI09ZWQ5hKrgu
         dQvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNw4r/ePpDa3blxX38GrtmpehOSKNp9udyJEcR2r6+uy0Ph7kVT+2kkxdByDGK17TbZEhclP7BSKGtj7m/1yiK@lists.infradead.org
X-Gm-Message-State: AOJu0YzuqvOzE4RIrj+TkFKPTTAZI4TFQM5chjU4D9rnnQTQHo9zrGKi
	50o3RvF/QQ5ewfjZUzKHaI/nnsmMjSQh4/ZMDUDvPJyD2NtuscQR4Gx0Z+V3vWtbAuNiD2c+6PW
	4YaUy78hDn5nPqsUAI189EKxGmZ16zRF7/gxqthId
X-Gm-Gg: AZuq6aL5wApUtsDhsmikLci3r9J8QVpES+hAeLOIp5t5JWK6Oys6B07KbyXYMtzSQET
	/+XbwccyFeQPHoiMqPPPefhVMKqT11WtYHgoidx7mYpocIqb2B2ifK4n8MJNY/3DYPBT7xylNQY
	KsISiRKvi0h+DUrdTJzWiumsXLJALjchTP8asCaKIi4u2B2uawVcjQdaeLC0BzQ9BAffa6+/a+e
	WGbxWEoCYZ7cB+TPH0U4h8AOu3JSL7AmMGVWP+89SIT1UHBYeK6l72dA3nAtjTxQ3FfE2NT0dtE
	hfCgmxFFc/KoIxx41VRrj7PJrg==
X-Received: by 2002:a17:903:28c:b0:298:45b1:6ef4 with SMTP id
 d9443c01a7336-2a8024db5cdmr326815ad.12.1769109615868; Thu, 22 Jan 2026
 11:20:15 -0800 (PST)
MIME-Version: 1.0
References: <20260122165407.561888-1-irogers@google.com> <20260122165407.561888-12-irogers@google.com>
 <CAO9wTFjA8_YH+_VW4YHze3dUu-HisA-m_GzfpeS_L=ya7FC9uA@mail.gmail.com>
In-Reply-To: <CAO9wTFjA8_YH+_VW4YHze3dUu-HisA-m_GzfpeS_L=ya7FC9uA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 22 Jan 2026 11:20:04 -0800
X-Gm-Features: AZwV_QhOWCsKoUPsWSGYxkhbT75uIENmhM4kJsBNx_hb2S0JYW2XYOxu90HvPh0
Message-ID: <CAP-5=fVS90cUNXbs2BD-_cEBb9c=1+UN1BvGF1kvtDKy-=O0ZA@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] perf disasm: Refactor arch__find and
 initialization of arch structs
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Zecheng Li <zecheng@google.com>, Tianyou Li <tianyou.li@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Julia Lawall <Julia.Lawall@inria.fr>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Howard Chu <howardchu95@gmail.com>, 
	=?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Shimin Guo <shimin.guo@skydio.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_192018_573957_C0C8EEFA 
X-CRM114-Status: GOOD (  22.56  )
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

On Thu, Jan 22, 2026 at 10:45=E2=80=AFAM Suchit Karunakaran
<suchitkarunakaran@gmail.com> wrote:
> On Thu, 22 Jan 2026 at 22:24, Ian Rogers <irogers@google.com> wrote:
[snip]
> > --- a/tools/perf/util/annotate-arch/annotate-arm64.c
> > +++ b/tools/perf/util/annotate-arch/annotate-arm64.c
> > @@ -8,9 +8,10 @@
> >  #include "../annotate.h"
> >  #include "../disasm.h"
> >
> > -struct arm64_annotate {
> > -       regex_t call_insn,
> > -               jump_insn;
> > +struct arch_arm64 {
> > +       struct arch arch;
> > +       regex_t call_insn;
> > +       regex_t jump_insn;
> >  };
> >
> >  static int arm64_mov__parse(const struct arch *arch __maybe_unused,
> > @@ -70,7 +71,7 @@ static const struct ins_ops arm64_mov_ops =3D {
> >
> >  static const struct ins_ops *arm64__associate_instruction_ops(struct a=
rch *arch, const char *name)
> >  {
> > -       struct arm64_annotate *arm =3D arch->priv;
> > +       struct arch_arm64 *arm =3D container_of(arch, struct arch_arm64=
, arch);
> >         const struct ins_ops *ops;
> >         regmatch_t match[2];
> >
> > @@ -87,38 +88,44 @@ static const struct ins_ops *arm64__associate_instr=
uction_ops(struct arch *arch,
> >         return ops;
> >  }
> >
> > -int arm64__annotate_init(struct arch *arch, char *cpuid __maybe_unused=
)
> > +const struct arch *arch__new_arm64(const struct e_machine_and_e_flags =
*id,
> > +                                  const char *cpuid __maybe_unused)
> >  {
> > -       struct arm64_annotate *arm;
> >         int err;
> > +       struct arch_arm64 *arm =3D zalloc(sizeof(*arm));
> > +       struct arch *arch;
> >
> > -       if (arch->initialized)
> > -               return 0;
> > +       if (!arm)
> > +               return NULL;
> > +
> > +       arch =3D &arm->arch;
> > +       arch->name =3D "arm64";
> > +       arch->id =3D *id;
> > +       arch->objdump.comment_char        =3D '/';
> > +       arch->objdump.skip_functions_char =3D '+';
> > +       arch->associate_instruction_ops   =3D arm64__associate_instruct=
ion_ops;
> >
> >         arm =3D zalloc(sizeof(*arm));
> >         if (!arm)
> > -               return ENOMEM;
> > +               return NULL;
>
> Please correct me if I'm wrong, but I think there's double allocation
> here for the variable arm since we've already allocated memory for at
> the start of the function.

Yes, I will fix it in v3. Clearly I was working too late :-)

> >
> >         /* bl, blr */
> >         err =3D regcomp(&arm->call_insn, "^blr?$", REG_EXTENDED);
> >         if (err)
> >                 goto out_free_arm;
> > +
> >         /* b, b.cond, br, cbz/cbnz, tbz/tbnz */
> >         err =3D regcomp(&arm->jump_insn, "^[ct]?br?\\.?(cc|cs|eq|ge|gt|=
hi|hs|le|lo|ls|lt|mi|ne|pl|vc|vs)?n?z?$",
> >                       REG_EXTENDED);
> >         if (err)
> >                 goto out_free_call;
> >
> > -       arch->initialized =3D true;
> > -       arch->priv        =3D arm;
> > -       arch->associate_instruction_ops   =3D arm64__associate_instruct=
ion_ops;
> > -       arch->objdump.comment_char        =3D '/';
> > -       arch->objdump.skip_functions_char =3D '+';
> > -       return 0;
> > +       return arch;
> >
> >  out_free_call:
> >         regfree(&arm->call_insn);
> >  out_free_arm:
> >         free(arm);
> > -       return SYMBOL_ANNOTATE_ERRNO__ARCH_INIT_REGEXP;
> > +       errno =3D SYMBOL_ANNOTATE_ERRNO__ARCH_INIT_REGEXP;
> > +       return NULL;
> >  }
[snip]
> > diff --git a/tools/perf/util/annotate-arch/annotate-powerpc.c b/tools/p=
erf/util/annotate-arch/annotate-powerpc.c
> > index 593c138c8104..004e6137aa03 100644
> > --- a/tools/perf/util/annotate-arch/annotate-powerpc.c
> > +++ b/tools/perf/util/annotate-arch/annotate-powerpc.c
> > @@ -390,17 +390,21 @@ static void update_insn_state_powerpc(struct type=
_state *state,
> >  }
> >  #endif /* HAVE_LIBDW_SUPPORT */
> >
> > -int powerpc__annotate_init(struct arch *arch, char *cpuid __maybe_unus=
ed)
> > +const struct arch *arch__new_powerpc(const struct e_machine_and_e_flag=
s *id,
> > +                                    const char *cpuid __maybe_unused)
> >  {
> > -       if (!arch->initialized) {
> > -               arch->initialized =3D true;
> > -               arch->associate_instruction_ops =3D powerpc__associate_=
instruction_ops;
> > -               arch->objdump.comment_char      =3D '#';
> > -               annotate_opts.show_asm_raw =3D true;
> > +       struct arch *arch =3D zalloc(sizeof(*arch));
> > +
> > +       if (!arch)
> > +               return NULL;
> > +
> > +       arch->name =3D "powerpc";
> > +       arch->id =3D *id;
> > +       arch->objdump.comment_char =3D '#';
> > +       annotate_opts.show_asm_raw =3D true;
> > +       arch->associate_instruction_ops =3D powerpc__associate_instruct=
ion_ops;
> >  #ifdef HAVE_LIBDW_SUPPORT
> > -               arch->update_insn_state =3D update_insn_state_powerpc;
> > +       arch->update_insn_state =3D update_insn_state_powerpc;
> >  #endif
> > -       }
> > -
> >         return 0;
>
> Shouldn't we return arch here?

Agreed.

> >  }
[snip]
> > diff --git a/tools/perf/util/annotate-arch/annotate-sparc.c b/tools/per=
f/util/annotate-arch/annotate-sparc.c
> > index 66a0174376dd..fe7a37966261 100644
> > --- a/tools/perf/util/annotate-arch/annotate-sparc.c
> > +++ b/tools/perf/util/annotate-arch/annotate-sparc.c
> > @@ -1,6 +1,7 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  #include <string.h>
> >  #include <linux/compiler.h>
> > +#include <linux/zalloc.h>
> >  #include "../../util/disasm.h"
> >
> >  static int is_branch_cond(const char *cond)
> > @@ -160,13 +161,17 @@ static const struct ins_ops *sparc__associate_ins=
truction_ops(struct arch *arch,
> >         return ops;
> >  }
> >
> > -int sparc__annotate_init(struct arch *arch, char *cpuid __maybe_unused=
)
> > +const struct arch *arch__new_sparc(const struct e_machine_and_e_flags =
*id,
> > +                                  const char *cpuid __maybe_unused)
> >  {
> > -       if (!arch->initialized) {
> > -               arch->initialized =3D true;
> > -               arch->associate_instruction_ops =3D sparc__associate_in=
struction_ops;
> > -               arch->objdump.comment_char =3D '#';
> > -       }
> > +       struct arch *arch =3D zalloc(sizeof(*arch));
> > +
> > +       if (!arch)
> > +               return NULL;
> >
> > +       arch->name =3D "sparc";
> > +       arch->id =3D *id;
> > +       arch->associate_instruction_ops =3D sparc__associate_instructio=
n_ops;
> > +       arch->objdump.comment_char =3D '#';
> >         return 0;
>
> Same here as well, 0 is returned instead of the arch pointer.

Agreed.

Thanks,
Ian

