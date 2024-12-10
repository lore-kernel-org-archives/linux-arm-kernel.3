Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB153E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 01:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5lnOzUj92tNwAYe96qZDcz3FYlyRcurTdW3wXkywCY=; b=ZelNNCMFZpHlR3mOHtbZo0xPLv
	WLsoSUHYKrxbw3WU2QfuZX0odNly/dxwmbKPeIUVMMXfa5NjePKL7SE9NyZCS/Wx9yRfjQobaTuRm
	IzhDT8jtADY/vABKjOaxg4rkJMDsMcDRYCCR5NOvLBg5n+aN0CZYEboI71UaS3LwSiMVBSCqPnYWs
	TazRpaOGBeO9X8r55pd3I1c/WXOlEgaGhnwjTlwgbMrowkwMUGce3uGXxbPgF5+mfO6DFSYus6OKQ
	qEnhV/R9ABEqBnWCOKfs0oedvVO2I5Zzfxu5Qxk+GRsXahmCimIJLHtW25lUfBySLWN5fa7sEgIO1
	He6qwEBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKoto-00000009nuR-2otm;
	Tue, 10 Dec 2024 01:18:52 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKoru-00000009nU6-2uFF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 01:16:56 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-725db141410so1813138b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 17:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733793414; x=1734398214; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5lnOzUj92tNwAYe96qZDcz3FYlyRcurTdW3wXkywCY=;
        b=RXifHSlb0nb9iQLbzxli3V670JUfa8kptTSmFYMQn0BJhlajfjeRA6pTOao9Y7+FYp
         1rrYOcuV6Kp/eCVlCp4omu/OS1S50jrqctKOnbWsj6dtH04HtmmT78lTREspYXmE64s2
         1PaTQm7doKZlPPRcps/lc60Xcz0Jjk81a67G9xPE6ORNh5KU7wpFYE2A5h5TTKUkWvCj
         StAAx9HaDvNxeuAokACl+qZ9q6iNnX61h/FIoyq6I3x0MLEOO/tJ37X85xSN5A4q62UO
         TVFvKOz0/PSFKRkX5wSRYtIFf0cFvoNg3mHdNHzSW9vn9jqv8ZR8B52ly+gBRwsjHhDS
         pt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733793414; x=1734398214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5lnOzUj92tNwAYe96qZDcz3FYlyRcurTdW3wXkywCY=;
        b=QXkSr7VVi2JmRKmN71jjw4Z7r1aZAbI3OAZsgg2mcv8FT9X6JHjnrtb58qNJwY0B/G
         4FCx9/RlXaBW5b3vpTK51VXZR0rba+jIRX6tqlH+30Ys1gWuoS4WV0ueMH1w834oGfzq
         myBPDxRxhFFRmtW+AjgzPoG7xqe1tW+Rr+DGBbc/ns7xMlRv4urCLWOur4F9JB/9FyuF
         gyKnX8E6kG5IazACeZTv+2voVH7NeX92hSAA7BkJdSdR/jpDXmQ/l3Cq4UBGiPzFF541
         MqS9Whk7zTu8thwfXR+p6H14UEUo9BzWNQOH5P1wAn3cB38Nh/pC+DxKQ5F3XJRH6edc
         3+Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXxEt++SYt9qC2ZDP84P74ZilrMiAFSDKuobJWIAidXwCJFApwcQ4RjdhvlcTNbf8LC7AN9hsaVcR/ko/m8OgDR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs43Tdy2l1aCxXzj0AMkssVmYirNuq9Gz0EVK48tlMn3zPAGda
	jXPVuBPiRZ/mz+AOzX92gdXa2jMaCsymsm1/9pRFvKH/KMnT5jizX6Y+xsFauUKHJ2dqAKy39/8
	Skkmd3Lt0fZcBs7u3gBs23ZpoV7vIEgKg0qQyAfPbE+wGykEu
X-Gm-Gg: ASbGnctsCKFJFXI4pqf5FkAP/5C4J0ygduNUOpH4nXp3eUeA9mjxNX3Wg7K8lh19TPY
	ZYjrZLhwGgMioXU7/w54cCEWMKU+t1ukdHw==
X-Google-Smtp-Source: AGHT+IHNDxzVFx4Fjry46BXz1MibF2flAze+KQwgSpC0yKWv1F2kvwsfIv8wF0CgYV8avF+Sj0p+siSkN66OmJVbtO0=
X-Received: by 2002:a05:6a00:174b:b0:725:e37d:cd36 with SMTP id
 d2e1a72fcca58-7273c8f4a8bmr3915070b3a.2.1733793413778; Mon, 09 Dec 2024
 17:16:53 -0800 (PST)
MIME-Version: 1.0
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
 <20241119-pmu_event_info-v1-5-a4f9691421f8@rivosinc.com> <0a4a569e-dfab-4aed-90df-2fe9719a3803@sifive.com>
In-Reply-To: <0a4a569e-dfab-4aed-90df-2fe9719a3803@sifive.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 9 Dec 2024 17:16:43 -0800
Message-ID: <CAHBxVyGSxMVm5QO9TmSy6MBVtc6zX0ju6n2+PK-RXuX5=KLLjA@mail.gmail.com>
Subject: Re: [PATCH 5/8] drivers/perf: riscv: Implement PMU event info function
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_171654_729201_A6F9C2BF 
X-CRM114-Status: GOOD (  35.18  )
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

On Mon, Dec 2, 2024 at 2:49=E2=80=AFPM Samuel Holland <samuel.holland@sifiv=
e.com> wrote:
>
> Hi Atish,
>
> On 2024-11-19 2:29 PM, Atish Patra wrote:
> > With the new SBI PMU event info function, we can query the availability
> > of the all standard SBI PMU events at boot time with a single ecall.
> > This improves the bootime by avoiding making an SBI call for each
> > standard PMU event. Since this function is defined only in SBI v3.0,
> > invoke this only if the underlying SBI implementation is v3.0 or higher=
.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/sbi.h |  7 +++++
> >  drivers/perf/riscv_pmu_sbi.c | 71 ++++++++++++++++++++++++++++++++++++=
++++++++
> >  2 files changed, 78 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.=
h
> > index 3ee9bfa5e77c..c04f64fbc01d 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -134,6 +134,7 @@ enum sbi_ext_pmu_fid {
> >       SBI_EXT_PMU_COUNTER_FW_READ,
> >       SBI_EXT_PMU_COUNTER_FW_READ_HI,
> >       SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
> > +     SBI_EXT_PMU_EVENT_GET_INFO,
> >  };
> >
> >  union sbi_pmu_ctr_info {
> > @@ -157,6 +158,12 @@ struct riscv_pmu_snapshot_data {
> >       u64 reserved[447];
> >  };
> >
> > +struct riscv_pmu_event_info {
> > +     u32 event_idx;
> > +     u32 output;
> > +     u64 event_data;
> > +};
> > +
> >  #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
> >  #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
> >  /* SBI v3.0 allows extended hpmeventX width value */
> > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.=
c
> > index f0e845ff6b79..2a6527cc9d97 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -100,6 +100,7 @@ static unsigned int riscv_pmu_irq;
> >  /* Cache the available counters in a bitmask */
> >  static unsigned long cmask;
> >
> > +static int pmu_event_find_cache(u64 config);
>
> This new declaration does not appear to be used.
>

This is a forward declaration as  pmu_event_find_cache but it should
be in the next patch instead of this patch.
I have moved it to that patch.

> >  struct sbi_pmu_event_data {
> >       union {
> >               union {
> > @@ -299,6 +300,68 @@ static struct sbi_pmu_event_data pmu_cache_event_m=
ap[PERF_COUNT_HW_CACHE_MAX]
> >       },
> >  };
> >
> > +static int pmu_sbi_check_event_info(void)
> > +{
> > +     int num_events =3D ARRAY_SIZE(pmu_hw_event_map) + PERF_COUNT_HW_C=
ACHE_MAX *
> > +                      PERF_COUNT_HW_CACHE_OP_MAX * PERF_COUNT_HW_CACHE=
_RESULT_MAX;
> > +     struct riscv_pmu_event_info *event_info_shmem;
> > +     phys_addr_t base_addr;
> > +     int i, j, k, result =3D 0, count =3D 0;
> > +     struct sbiret ret;
> > +
> > +     event_info_shmem =3D (struct riscv_pmu_event_info *)
> > +                        kcalloc(num_events, sizeof(*event_info_shmem),=
 GFP_KERNEL);
>
> Please drop the unnecessary cast.
>

Done.

> > +     if (!event_info_shmem) {
> > +             pr_err("Can not allocate memory for event info query\n");
>
> Usually there's no need to print an error for allocation failure, since t=
he
> allocator already warns. And this isn't really an error, since we can (an=
d do)
> fall back to the existing way of checking for events.
>

Fixed.

> > +             return -ENOMEM;
> > +     }
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
> > +             event_info_shmem[count++].event_idx =3D pmu_hw_event_map[=
i].event_idx;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
> > +             for (int j =3D 0; j < ARRAY_SIZE(pmu_cache_event_map[i]);=
 j++) {
> > +                     for (int k =3D 0; k < ARRAY_SIZE(pmu_cache_event_=
map[i][j]); k++)
> > +                             event_info_shmem[count++].event_idx =3D
> > +                                                     pmu_cache_event_m=
ap[i][j][k].event_idx;
> > +             }
> > +     }
> > +
> > +     base_addr =3D __pa(event_info_shmem);
> > +     if (IS_ENABLED(CONFIG_32BIT))
> > +             ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_EVENT_GET_INFO=
, lower_32_bits(base_addr),
> > +                             upper_32_bits(base_addr), count, 0, 0, 0)=
;
> > +     else
> > +             ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_EVENT_GET_INFO=
, base_addr, 0,
> > +                             count, 0, 0, 0);
> > +     if (ret.error) {
> > +             result =3D -EOPNOTSUPP;
> > +             goto free_mem;
> > +     }
> > +     /* Do we need some barriers here or priv mode transition will ens=
ure that */
>
> No barrier is needed -- the SBI implementation is running on the same har=
t, so
> coherency isn't even a consideration.
>
> > +     for (i =3D 0; i < ARRAY_SIZE(pmu_hw_event_map); i++) {
> > +             if (!(event_info_shmem[i].output & 0x01))
>
> This bit mask should probably use a macro.
>
> > +                     pmu_hw_event_map[i].event_idx =3D -ENOENT;
> > +     }
> > +
> > +     count =3D ARRAY_SIZE(pmu_hw_event_map);
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
> > +             for (j =3D 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++=
) {
> > +                     for (k =3D 0; k < ARRAY_SIZE(pmu_cache_event_map[=
i][j]); k++) {
> > +                             if (!(event_info_shmem[count].output & 0x=
01))
>
> Same comment applies here.
>

Done.


> Regards,
> Samuel
>
> > +                                     pmu_cache_event_map[i][j][k].even=
t_idx =3D -ENOENT;
> > +                             count++;
> > +                     }
> > +             }
> > +     }
> > +
> > +free_mem:
> > +     kfree(event_info_shmem);
> > +
> > +     return result;
> > +}
> > +
> >  static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
> >  {
> >       struct sbiret ret;
> > @@ -316,6 +379,14 @@ static void pmu_sbi_check_event(struct sbi_pmu_eve=
nt_data *edata)
> >
> >  static void pmu_sbi_check_std_events(struct work_struct *work)
> >  {
> > +     int ret;
> > +
> > +     if (sbi_v3_available) {
> > +             ret =3D pmu_sbi_check_event_info();
> > +             if (!ret)
> > +                     return;
> > +     }
> > +
> >       for (int i =3D 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
> >               pmu_sbi_check_event(&pmu_hw_event_map[i]);
> >
> >
>

