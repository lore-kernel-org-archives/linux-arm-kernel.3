Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE453E69EA2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 00:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+YlV66sEeV5Gi1JEnWTwo3a+A+kAB7BmLzMmDK0RYY=; b=2WBz2g7kt+d3fj7LXbLHLXPQlH
	dOF4AE/tE7a/jt2b1e4M9kNEoiNgKBH5AwyGg4bVqvXXHkGzxZQRWEB+9G90a8qa4nsvYWy514KcL
	yXuAjPajfV9AO9FCkSNJlPQqt1slDduR79EZskaH83lP9lktjWUHY9AP4Edo+ULNA4ltGsaE6gjv5
	lnvmIjTGw8LcAa1Zmd6VwRqqrr+5zp2Y2+dgGlW4I0FOGNZrSFHEGxoPxtwHiUESxTuqPCS9fiMCE
	lNz3zlRIJx//Hj++MsTVd4aMbAXk97zn/uWRifR/eCeAP4/Vad4P280by84bUVawuN93htSjr4pls
	rdDsxy3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIGaj-00000007mfZ-2svO;
	Tue, 03 Dec 2024 00:16:37 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIGZj-00000007mYv-1vi8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 00:15:36 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ee709715d9so2320514a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 16:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733184934; x=1733789734; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+YlV66sEeV5Gi1JEnWTwo3a+A+kAB7BmLzMmDK0RYY=;
        b=gkGcjqHR4VkRBnsMyxSqYOC7ZH0VGErmv1iM1HFeNmAEkRcC3r4WG2HGOTv4mrX1NA
         C879sMM9TIzW3OnfqQW9qI9K/qqItRDqk4uQ+xWuxfkYXhcU7+lgQjSbkDbY+QIl5ocL
         PVTQtpaHlDAnHZENHoNJvCGZf8gZwv14RIxsWTSxbqiIuDzWpc43shmULGP+Z057alrC
         5tP3CEC++CE/onu/X85hxaETsXpH8LyeusqcxCm90UXY0agT7wwa82oxpE2ZBj0Olmf/
         Wc8KwIsrwbC/J2rPEBdj01bgLjBX26RXPgAnceg+8jwUwdHBKbLe/02+hxzmIdZCAKeN
         Dkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733184934; x=1733789734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+YlV66sEeV5Gi1JEnWTwo3a+A+kAB7BmLzMmDK0RYY=;
        b=FU9rabsCUAoH0ZLw9w4xZC8XTl8klBemkG7H6PLtbtOe+YbOsgnnNqOgtDKcuxRYnF
         ADFiHHZLgrD6SWpA6QtBjn4Fx7SLs4KMgE7JNRI2/T32imJIOiMLGApgXYCRwLToJYL5
         0TJQdpG7a2nGZ9esSFwHbU0p7UVxo55668bTg243rReqkknRG3KVv+a20/l8WNxfXL43
         WmhHf7XYA3b+ahsyQYT5HJ30ZtxixeQEmnfBRo+X8UMpCBHVvWk9VCTrhsmg5FiZiLTL
         eojUAsUwDMe2ox1xymJiOkwPEjwLTiAEd9Ec6jxqOOu4gtTgBnosAOi51cePYXBiTR5Q
         iFnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVW2bw68x1ElOhdJxMg78DNerBFTBhWnr4kNJMJwfI8v03XW0/v7TSE62Fl1bKZwz0KGWjvZzVU+uXxFFmvGrDQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxtW11IzjDNHi4gGcUbiT8p5f9/+Pkhg9IBx9KbIDBukUwU14A8
	4StxEQDZTp8bO510tvTHpmQ6KUNACTUUqJK6xhaPms1wwWEuDt5J4V3ufqDUQ3hUfyy2ktvfSWC
	jjxkzjwEtb6ZEzCQOEp4Kp9N+J/VJuQztDi0X9A==
X-Gm-Gg: ASbGncvUNmywPO31S/ewV/gKl1OtU9cQkN41ZKgUafoXaH5qLcnp/uEsuMm6rYp2jFd
	eK3A7LSAoJZknwI83ALOuj9RinMtpWQ==
X-Google-Smtp-Source: AGHT+IHkfSZg8nwRSMyT59R8Thc83SJq1L85mjo/aMDSMjUafqwNxe8ioi4sjLMkGcNLINNqRnY9VhmQH6Pl1GzeePc=
X-Received: by 2002:a17:90b:4f4e:b0:2ee:693e:ed7a with SMTP id
 98e67ed59e1d1-2ef012796c8mr807474a91.35.1733184934283; Mon, 02 Dec 2024
 16:15:34 -0800 (PST)
MIME-Version: 1.0
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
 <20241119-pmu_event_info-v1-3-a4f9691421f8@rivosinc.com> <e124c532-7a08-4788-843d-345827e35f5f@sifive.com>
In-Reply-To: <e124c532-7a08-4788-843d-345827e35f5f@sifive.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 2 Dec 2024 16:15:23 -0800
Message-ID: <CAHBxVyEwkPUcut0L7K9eewcmhOOidU16WnGRiPiP3D7-OS7HvQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] drivers/perf: riscv: Add raw event v2 support
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_161535_499032_C5EF857E 
X-CRM114-Status: GOOD (  28.16  )
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

On Mon, Dec 2, 2024 at 2:37=E2=80=AFPM Samuel Holland <samuel.holland@sifiv=
e.com> wrote:
>
> Hi Atish,
>
> On 2024-11-19 2:29 PM, Atish Patra wrote:
> > SBI v3.0 introduced a new raw event type that allows wider
> > mhpmeventX width to be programmed via CFG_MATCH.
> >
> > Use the raw event v2 if SBI v3.0 is available.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/sbi.h |  4 ++++
> >  drivers/perf/riscv_pmu_sbi.c | 18 ++++++++++++------
> >  2 files changed, 16 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.=
h
> > index 9be38b05f4ad..3ee9bfa5e77c 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -159,7 +159,10 @@ struct riscv_pmu_snapshot_data {
> >
> >  #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
> >  #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
> > +/* SBI v3.0 allows extended hpmeventX width value */
> > +#define RISCV_PMU_RAW_EVENT_V2_MASK GENMASK_ULL(55, 0)
> >  #define RISCV_PMU_RAW_EVENT_IDX 0x20000
> > +#define RISCV_PMU_RAW_EVENT_V2_IDX 0x30000
> >  #define RISCV_PLAT_FW_EVENT  0xFFFF
> >
> >  /** General pmu event codes specified in SBI PMU extension */
> > @@ -217,6 +220,7 @@ enum sbi_pmu_event_type {
> >       SBI_PMU_EVENT_TYPE_HW =3D 0x0,
> >       SBI_PMU_EVENT_TYPE_CACHE =3D 0x1,
> >       SBI_PMU_EVENT_TYPE_RAW =3D 0x2,
> > +     SBI_PMU_EVENT_TYPE_RAW_V2 =3D 0x3,
> >       SBI_PMU_EVENT_TYPE_FW =3D 0xf,
> >  };
> >
> > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.=
c
> > index 50cbdbf66bb7..f0e845ff6b79 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -59,7 +59,7 @@ asm volatile(ALTERNATIVE(                            =
               \
> >  #define PERF_EVENT_FLAG_USER_ACCESS  BIT(SYSCTL_USER_ACCESS)
> >  #define PERF_EVENT_FLAG_LEGACY               BIT(SYSCTL_LEGACY)
> >
> > -PMU_FORMAT_ATTR(event, "config:0-47");
> > +PMU_FORMAT_ATTR(event, "config:0-55");
> >  PMU_FORMAT_ATTR(firmware, "config:62-63");
> >
> >  static bool sbi_v2_available;
> > @@ -527,18 +527,24 @@ static int pmu_sbi_event_map(struct perf_event *e=
vent, u64 *econfig)
> >               break;
> >       case PERF_TYPE_RAW:
> >               /*
> > -              * As per SBI specification, the upper 16 bits must be un=
used
> > -              * for a hardware raw event.
> > +              * As per SBI v0.3 specification,
> > +              *  -- the upper 16 bits must be unused for a hardware ra=
w event.
> > +              * As per SBI v3.0 specification,
> > +              *  -- the upper 8 bits must be unused for a hardware raw=
 event.
> >                * Bits 63:62 are used to distinguish between raw events
> >                * 00 - Hardware raw event
> >                * 10 - SBI firmware events
> >                * 11 - Risc-V platform specific firmware event
> >                */
> > -
> >               switch (config >> 62) {
> >               case 0:
> > -                     ret =3D RISCV_PMU_RAW_EVENT_IDX;
> > -                     *econfig =3D config & RISCV_PMU_RAW_EVENT_MASK;
> > +                     if (sbi_v3_available) {
> > +                             *econfig =3D config & RISCV_PMU_RAW_EVENT=
_V2_MASK;
> > +                             ret =3D RISCV_PMU_RAW_EVENT_V2_IDX;
> > +                     } else {
> > +                             *econfig =3D config & RISCV_PMU_RAW_EVENT=
_MASK;
> > +                             ret =3D RISCV_PMU_RAW_EVENT_IDX;
>
> Shouldn't we check to see if any of bits 48-55 are set and return an erro=
r,
> instead of silently requesting the wrong event?
>

We can. I did not add it originally as we can't do much validation for
the raw events for anyways.
If the encoding is not supported the user will get the error anyways
as it can't find a counter.
We will just save 1 SBI call if the kernel doesn't allow requesting an
event if bits 48-55 are set.

> Regards,
> Samuel
>
> > +                     }
> >                       break;
> >               case 2:
> >                       ret =3D (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_F=
W << 16);
> >
>

