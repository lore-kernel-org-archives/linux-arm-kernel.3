Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A922FE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 18:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vE5tXM4ceddZHK4DLvqd5OPVdW2n99/09qTSZ4lNDtc=; b=ihOa8+39bsZAgwA1+ZU+Z7y832
	Km44i1Sj314P3HGbVavw+ZpHPSyOLSZWWT6Uu27QISwwW4pcLR/wsxvrzfIR90Canj6q82MB7MRAi
	VzEhwdMs+S+HfLUPUUaRY8OrpwxeOs0rKjcEMMokHiSBFtTIm7pMRIhNt5pC6by3z61/sEIHv+7mY
	s+eBOvIQGxDRNeTzK2dJMXIR091yJ+4rYW5lMM/JGmRCW8po4K8EHHJ8pa1CuoOr+gdx8Eo/eA+Uh
	EH/+T61yJYWBI4cwnRq2i88AEj/Wt6h+a5tbz3yVU28WMyLhJ+TP5arjyi/uXSFd+pIq84zBY/rLV
	NlaktEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKisl-00000008vl9-2a3a;
	Mon, 09 Dec 2024 18:53:23 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKiri-00000008vd1-16FU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 18:52:19 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7fbc65f6c72so4613210a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 10:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733770337; x=1734375137; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vE5tXM4ceddZHK4DLvqd5OPVdW2n99/09qTSZ4lNDtc=;
        b=gqqvvywJtWqs96LjXQ2ZvDqdb6s2YWk3OE69G8dreruYx0zaFko5ilNCDA+Op3cw16
         9hNzEJlM5BdIT55d+uuy3MB3D6UB00TBgpzmtxFyHsMNz5bTwrsb2rQtu8oThI6yGevS
         acghfXsFKNpI55KLxyICZ7RCiSh2jrtnjL1yPuUcgPiVfKXrtqtK1onMm4xPK24Som/P
         eRTBe2WudF62USia09V+2EatiOJ8LJn+UrvegqjxOzXhvOLsH+241D16aBvGUfDZVxBR
         zh/I7Ir4Z1FBq7GRm/mdrhcAuJXIFpESvQ+49GQ2GZLPw9Zm4cnqS6nSZa/tnPC++i9z
         zi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733770337; x=1734375137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vE5tXM4ceddZHK4DLvqd5OPVdW2n99/09qTSZ4lNDtc=;
        b=J7wuZKJQaCt49iTVV/YBtmh5BKDy1WfM87wo+hHvbfnyAZ173NQUZfMMxMfdCsZGC5
         z3nujj7iOfxtC4UHB+fXiQE+C+sU78KN/L1eVntixmtAKRIKYHp+azwGa9Qk+ZdZeqPF
         61iFVLSVP1xE1Hzp790lIeZj3Nrh0VA3p7zHA+37CF8umk/S7VZbMOScGNSWah7vkKUw
         EuHR/a2uCsHR4ceepepu2EHIY5FTuEKyFy0bPgt8wOTsyxj22U+SlUnF41p6ZjP+wL6H
         Byg+rky21wM5NbkVTQ9fsdOvr04YUswnglljiD9qkLolTXiE1zf+DSNdm8uT6KZ7cNcA
         C1NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR4e2aoNfcDrvDGUk2KGGIvoI7ktKAcr1CbUgMIzRB9187Kg976ZxwOwTUoblt1L8u94o2tAdIXhpDi4ndxvl3@lists.infradead.org
X-Gm-Message-State: AOJu0YyOT9phh1A9VMyQErjfF9t86+ojRNK6o1d48OgFrgJL/Nk40pN0
	/m3soK4OkbHtyh1EIfWJnPoAWfTGLTHWUY199HCPvn0WrpK7sh5jhTcnCaPi+NW6kx+sLSuq13j
	NRUcJQ633fFaz0D2aSKUnqZHx+9oYOZczkdzxlg==
X-Gm-Gg: ASbGnctCQ7WUtUnUB1usemWCJinwsnekb9cqhsGWcV4tHDwg3hEpm7wQrhoMS+KibUL
	2vN6XzaoO2+KyJ3UVH064r5HDezS7z3VgMQ==
X-Google-Smtp-Source: AGHT+IE3NlpgFvVBKio4rCWUgc2OgxnpAocEZrxQPQ/mMBSJUxJJVDkYqliqfqvlAJcB016TmpcY1ruHhQTOFNKl1H8=
X-Received: by 2002:a05:6a21:78a6:b0:1e1:adcd:eaf8 with SMTP id
 adf61e73a8af0-1e1adcdf090mr4266443637.28.1733770337025; Mon, 09 Dec 2024
 10:52:17 -0800 (PST)
MIME-Version: 1.0
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
 <20241119-pmu_event_info-v1-3-a4f9691421f8@rivosinc.com> <e124c532-7a08-4788-843d-345827e35f5f@sifive.com>
 <CAHBxVyEwkPUcut0L7K9eewcmhOOidU16WnGRiPiP3D7-OS7HvQ@mail.gmail.com> <b48c4319-1fbc-4703-88d2-6f495af9c24e@sifive.com>
In-Reply-To: <b48c4319-1fbc-4703-88d2-6f495af9c24e@sifive.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 9 Dec 2024 10:52:06 -0800
Message-ID: <CAHBxVyFrsF0jwwFwKsg_6=c5ewFZG12iz3owzHEv6GxpA+hB1w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241209_105218_304096_2BA743E2 
X-CRM114-Status: GOOD (  28.86  )
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

On Mon, Dec 2, 2024 at 6:39=E2=80=AFPM Samuel Holland <samuel.holland@sifiv=
e.com> wrote:
>
> Hi Atish,
>
> On 2024-12-02 6:15 PM, Atish Kumar Patra wrote:
> > On Mon, Dec 2, 2024 at 2:37=E2=80=AFPM Samuel Holland <samuel.holland@s=
ifive.com> wrote:
> >> On 2024-11-19 2:29 PM, Atish Patra wrote:
> >>> SBI v3.0 introduced a new raw event type that allows wider
> >>> mhpmeventX width to be programmed via CFG_MATCH.
> >>>
> >>> Use the raw event v2 if SBI v3.0 is available.
> >>>
> >>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> >>> ---
> >>>  arch/riscv/include/asm/sbi.h |  4 ++++
> >>>  drivers/perf/riscv_pmu_sbi.c | 18 ++++++++++++------
> >>>  2 files changed, 16 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sb=
i.h
> >>> index 9be38b05f4ad..3ee9bfa5e77c 100644
> >>> --- a/arch/riscv/include/asm/sbi.h
> >>> +++ b/arch/riscv/include/asm/sbi.h
> >>> @@ -159,7 +159,10 @@ struct riscv_pmu_snapshot_data {
> >>>
> >>>  #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
> >>>  #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
> >>> +/* SBI v3.0 allows extended hpmeventX width value */
> >>> +#define RISCV_PMU_RAW_EVENT_V2_MASK GENMASK_ULL(55, 0)
> >>>  #define RISCV_PMU_RAW_EVENT_IDX 0x20000
> >>> +#define RISCV_PMU_RAW_EVENT_V2_IDX 0x30000
> >>>  #define RISCV_PLAT_FW_EVENT  0xFFFF
> >>>
> >>>  /** General pmu event codes specified in SBI PMU extension */
> >>> @@ -217,6 +220,7 @@ enum sbi_pmu_event_type {
> >>>       SBI_PMU_EVENT_TYPE_HW =3D 0x0,
> >>>       SBI_PMU_EVENT_TYPE_CACHE =3D 0x1,
> >>>       SBI_PMU_EVENT_TYPE_RAW =3D 0x2,
> >>> +     SBI_PMU_EVENT_TYPE_RAW_V2 =3D 0x3,
> >>>       SBI_PMU_EVENT_TYPE_FW =3D 0xf,
> >>>  };
> >>>
> >>> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sb=
i.c
> >>> index 50cbdbf66bb7..f0e845ff6b79 100644
> >>> --- a/drivers/perf/riscv_pmu_sbi.c
> >>> +++ b/drivers/perf/riscv_pmu_sbi.c
> >>> @@ -59,7 +59,7 @@ asm volatile(ALTERNATIVE(                          =
                 \
> >>>  #define PERF_EVENT_FLAG_USER_ACCESS  BIT(SYSCTL_USER_ACCESS)
> >>>  #define PERF_EVENT_FLAG_LEGACY               BIT(SYSCTL_LEGACY)
> >>>
> >>> -PMU_FORMAT_ATTR(event, "config:0-47");
> >>> +PMU_FORMAT_ATTR(event, "config:0-55");
> >>>  PMU_FORMAT_ATTR(firmware, "config:62-63");
> >>>
> >>>  static bool sbi_v2_available;
> >>> @@ -527,18 +527,24 @@ static int pmu_sbi_event_map(struct perf_event =
*event, u64 *econfig)
> >>>               break;
> >>>       case PERF_TYPE_RAW:
> >>>               /*
> >>> -              * As per SBI specification, the upper 16 bits must be =
unused
> >>> -              * for a hardware raw event.
> >>> +              * As per SBI v0.3 specification,
> >>> +              *  -- the upper 16 bits must be unused for a hardware =
raw event.
> >>> +              * As per SBI v3.0 specification,
> >>> +              *  -- the upper 8 bits must be unused for a hardware r=
aw event.
> >>>                * Bits 63:62 are used to distinguish between raw event=
s
> >>>                * 00 - Hardware raw event
> >>>                * 10 - SBI firmware events
> >>>                * 11 - Risc-V platform specific firmware event
> >>>                */
> >>> -
> >>>               switch (config >> 62) {
> >>>               case 0:
> >>> -                     ret =3D RISCV_PMU_RAW_EVENT_IDX;
> >>> -                     *econfig =3D config & RISCV_PMU_RAW_EVENT_MASK;
> >>> +                     if (sbi_v3_available) {
> >>> +                             *econfig =3D config & RISCV_PMU_RAW_EVE=
NT_V2_MASK;
> >>> +                             ret =3D RISCV_PMU_RAW_EVENT_V2_IDX;
> >>> +                     } else {
> >>> +                             *econfig =3D config & RISCV_PMU_RAW_EVE=
NT_MASK;
> >>> +                             ret =3D RISCV_PMU_RAW_EVENT_IDX;
> >>
> >> Shouldn't we check to see if any of bits 48-55 are set and return an e=
rror,
> >> instead of silently requesting the wrong event?
> >>
> >
> > We can. I did not add it originally as we can't do much validation for
> > the raw events for anyways.
> > If the encoding is not supported the user will get the error anyways
> > as it can't find a counter.
> > We will just save 1 SBI call if the kernel doesn't allow requesting an
> > event if bits 48-55 are set.
>
> The scenario I'm concerned about is where masking off bits 48-55 results =
in a
> valid, supported encoding for a different event. For example, in the HPM =
event
> encoding scheme used by Rocket and inherited by SiFive cores, bits 8-55 a=
re a
> bitmap. So masking off some of those bits will exclude some events, but w=
ill not
> create an invalid encoding. This could be very confusing for users.
>

Ahh yes. That is problematic if the vendor implements that type of
event encoding.
I will send the fix patch with an error if bits 48-55 are set.

> Regards,
> Samuel
>

