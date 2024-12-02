Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4B7E69E82
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 18:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1fSjzDB3EYral3FJfD5w5SvZiqHwVm4ThrouSzXoG0=; b=z3mUgB6K7FzPYMVLz3Ia5gezdI
	TF8Ts+ST7UXqqSIhNhOyk2OnMT8yrXnT9cC8RE3WYoWfqV/Dd5lm9Qtj68sMoZahFE85ZwOv+KbzD
	OOzyW9rO03kwZ3xlFWhAbQlPukH5xwPP8qOQLOmIHW2xF0Oav53p15X6l11NevL0FarjoN8N9J5Tq
	uBdxcNGHuvVNmQevFjNNGbcyg3GPmVQ5vW4RViphUitxxbwgwluAM19Wq6okmBRDctwl7dIPDWWkY
	df/JmlbZFaEsvf+225G2qMnL55VYcfgZNrhy2wjblY9sKOwRjNhvfyNOyj7KrdHcTc7dS6zKM7eeB
	+7fxTleA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIB8r-00000007A5O-0VYg;
	Mon, 02 Dec 2024 18:27:29 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIB7p-000000079qH-1X5V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 18:26:27 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2155312884fso28887215ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 10:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733163984; x=1733768784; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1fSjzDB3EYral3FJfD5w5SvZiqHwVm4ThrouSzXoG0=;
        b=dew7p8cE1ZTX5NFMGMd6ijLah/jyP4jOooISgU5H5U9Rb6+g7KKZaFGwXyKYPN5zP7
         +euJM0yEa1zt573pED/WU38pHmqiD2V8KW9adCUYqxh08o5NLvw9+TaFEHc9TcD7m4Il
         bmEqFl5ZEsj/i+5fxe7/ygoJnKPtT+tYMy/0JNXANGprKDKRUZXZvBem2xsMoDBoiK31
         bC/A1UPOLYqwtwjAGcv4jZHVAsx1rRi31d9dGjRJdM+K3As+L/wdruKXCvD3aJbKlhx7
         Pkhrlhy4hn2euOxIBU/SsPpdQHvCBmWabb6Dn9Y6EeGOIKwUUrD00v234piTlcZLJFhM
         1FyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733163984; x=1733768784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1fSjzDB3EYral3FJfD5w5SvZiqHwVm4ThrouSzXoG0=;
        b=NeYdwxPIzDuVZfLORVrHEc8PSQgLytYVwrfH5T+U8sSQDQKGb3mfmCRQuXDg5Ge2uk
         O89fyDuyoyoTE1SMTxARyrI+EH/MrDhn7p+iNlr9WNSpJxzyCqVbg64xSE7eeuICegLD
         h2MlyJzbfck80hBQ3iUAKeEWAbqYa3YL5zqOwQ30OcLgqh1XpcI+WgRZN32cTg7n/5LX
         PccTKzj3IKNiF3v9Vu4oxruMpf30EBPez54XEUQl+sL/2ROBdDS0ccHJ1BlyM7Ok8ydq
         ITW6C8OAm6mWlbniAOED5JACVVB3VKE80/lQYcX6YoSsZVMXj1dteqNIgRgfnljvkJY3
         n+lw==
X-Forwarded-Encrypted: i=1; AJvYcCXpEfkqftvQyw3beIPJrMRDOCkvR6ppLaAfXANC2hRPAaYWJr2fCvQL3yUrKsFA7ZlF75BEAyNz1U7eHRWFh7qL@lists.infradead.org
X-Gm-Message-State: AOJu0YygLTVUtBbweHCfzRFnnDxMjD3aVETxBCV83bSaxJKCrR99ES+8
	6rw3tAwrWfV2HwwBVZ3fEEfc4PKFLOhN5lNJqzsHTgjZ1Oo5XG2foJBLg76tGdw9LdP282xH7UA
	0rRlXlE31duTN0kaVnYMhJmFrZzWNT+j0oJIKHQ==
X-Gm-Gg: ASbGncunT6o+GEUsOa1Rg9Q4oHQuf43o/oJ+lhwfQTtkwPnD4iGJGGnrResBqQFh3ny
	yF1Bj1fKrkX2MYQ7MAR+m+qliJVArHQ==
X-Google-Smtp-Source: AGHT+IHisvs3rWpMuRQOWixPnTvVtgjxW+u1yNS90T+VjRikLrDQHeBjU8J20X11uqJqFe47EIY9Qqlj+A9dyAN+3sc=
X-Received: by 2002:a17:902:f54c:b0:215:8695:ef91 with SMTP id
 d9443c01a7336-2158695f663mr92656975ad.6.1733163984202; Mon, 02 Dec 2024
 10:26:24 -0800 (PST)
MIME-Version: 1.0
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
 <20241119-pmu_event_info-v1-2-a4f9691421f8@rivosinc.com> <77b7b44f-e05a-4845-8d45-0e0d831bb8e7@ghiti.fr>
In-Reply-To: <77b7b44f-e05a-4845-8d45-0e0d831bb8e7@ghiti.fr>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 2 Dec 2024 10:26:13 -0800
Message-ID: <CAHBxVyHZvLrKNCAPJfHxYYn30Mm++J=mff+tVU9GZ_8rt3WnEg@mail.gmail.com>
Subject: Re: [PATCH 2/8] drivers/perf: riscv: Fix Platform firmware event data
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_102625_402058_891B7ED7 
X-CRM114-Status: GOOD (  28.05  )
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

On Thu, Nov 28, 2024 at 5:10=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wro=
te:
>
> Hi Atish,
>
> On 19/11/2024 21:29, Atish Patra wrote:
> > Platform firmware event data field is allowed to be 62 bits for
> > Linux as uppper most two bits are reserved to indicate SBI fw or
> > platform specific firmware events.
> > However, the event data field is masked as per the hardware raw
> > event mask which is not correct.
> >
> > Fix the platform firmware event data field with proper mask.
> >
> > Fixes: f0c9363db2dd ("perf/riscv-sbi: Add platform specific firmware ev=
ent handling")
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >   arch/riscv/include/asm/sbi.h |  1 +
> >   drivers/perf/riscv_pmu_sbi.c | 12 +++++-------
> >   2 files changed, 6 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.=
h
> > index 98f631b051db..9be38b05f4ad 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -158,6 +158,7 @@ struct riscv_pmu_snapshot_data {
> >   };
> >
> >   #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
> > +#define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
> >   #define RISCV_PMU_RAW_EVENT_IDX 0x20000
> >   #define RISCV_PLAT_FW_EVENT 0xFFFF
> >
> > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.=
c
> > index cb98efa9b106..50cbdbf66bb7 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -508,7 +508,6 @@ static int pmu_sbi_event_map(struct perf_event *eve=
nt, u64 *econfig)
> >   {
> >       u32 type =3D event->attr.type;
> >       u64 config =3D event->attr.config;
> > -     u64 raw_config_val;
> >       int ret;
> >
> >       /*
> > @@ -529,21 +528,20 @@ static int pmu_sbi_event_map(struct perf_event *e=
vent, u64 *econfig)
> >       case PERF_TYPE_RAW:
> >               /*
> >                * As per SBI specification, the upper 16 bits must be un=
used
> > -              * for a raw event.
> > +              * for a hardware raw event.
> >                * Bits 63:62 are used to distinguish between raw events
> >                * 00 - Hardware raw event
> >                * 10 - SBI firmware events
> >                * 11 - Risc-V platform specific firmware event
> >                */
> > -             raw_config_val =3D config & RISCV_PMU_RAW_EVENT_MASK;
> > +
> >               switch (config >> 62) {
> >               case 0:
> >                       ret =3D RISCV_PMU_RAW_EVENT_IDX;
> > -                     *econfig =3D raw_config_val;
> > +                     *econfig =3D config & RISCV_PMU_RAW_EVENT_MASK;
> >                       break;
> >               case 2:
> > -                     ret =3D (raw_config_val & 0xFFFF) |
> > -                             (SBI_PMU_EVENT_TYPE_FW << 16);
> > +                     ret =3D (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_F=
W << 16);
> >                       break;
> >               case 3:
> >                       /*
> > @@ -552,7 +550,7 @@ static int pmu_sbi_event_map(struct perf_event *eve=
nt, u64 *econfig)
> >                        * Event data - raw event encoding
> >                        */
> >                       ret =3D SBI_PMU_EVENT_TYPE_FW << 16 | RISCV_PLAT_=
FW_EVENT;
> > -                     *econfig =3D raw_config_val;
> > +                     *econfig =3D config & RISCV_PMU_PLAT_FW_EVENT_MAS=
K;
> >                       break;
> >               }
> >               break;
> >
>
> It seems independent from the other patches, so I guess we should take
> it for 6.13 rcX.
>

Yes. This patch doesn't have any SBI v3.0 dependencies. I will send
this patch separately
so that it can be applied for 6.13 rcX

> Let me know if that's not the case.
>
> Thanks,
>
> Alex
>

