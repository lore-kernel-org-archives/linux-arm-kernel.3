Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7781C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 04:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmjhOSDCIU1wo/Cj0YflFKr4yJ8Ipsknqxo6fdZydpc=; b=OEhvStpMMVOKr5OHezborJFF5f
	a1FZACaSMGBZPoXWEgP+aA8othgxLgcGSZaoLTJ7zmewXdP1U4kuwhIWrCVn+7gITp5skcp759t8e
	4mw06vsGAEa5WgYQ4+qOyG2ci5GdXkrOtwzrsMbs0VLgAC4IJZWenpOi6iRbJQn526FpXR48A3PdI
	diaAlTNxFr8fB/dcZBR1a2TR18xk9DvGdPVRQuJB2kceyjm7Et01bzJ/2NG3PxCkLWNP/64wuV8T7
	JSc38qeANq2aN/yTV6KSQE0IRoiaSc9kn0VKCATduL0uWR84M2F/u3hKo4J9w8nU7M4OIq8gP9fMn
	LG32UwhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uccvL-0000000Bfxk-42A9;
	Fri, 18 Jul 2025 04:42:19 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uccst-0000000BfiK-1mC8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 04:39:48 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3e295da67c8so6359795ab.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 21:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752813586; x=1753418386; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmjhOSDCIU1wo/Cj0YflFKr4yJ8Ipsknqxo6fdZydpc=;
        b=mg6tXKvUOWHmePY/8HgExW/KQc5CR7+YUY92XqLfNWiSFttFuU+n+XCJq4aj1cwvaV
         AKd6jaqhCutd9bluIjZPGbWa45aCsuVknjfTYp0r2fSDETgzlQnBAok/TnVIxxlLl3qN
         klfXEkvfDwVSG7bdJPkyBk6XIV2Ja/hUVXdOHcbmaULu7JME46XXeSDjbLC4jBq1SHR+
         3TP8nc7tShYHqNTNgvJCYdBZgx23ybK/g+YUKho5Svfysxm8v2gZS3ZyA6ARQ+KQh/U2
         s7khGd794WAdGi7I5EhpJH2+CpKZUeSVkjwZxpkYFHJ1m4Ov3ABgjyhFYXl/67RIXsUj
         rX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752813586; x=1753418386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lmjhOSDCIU1wo/Cj0YflFKr4yJ8Ipsknqxo6fdZydpc=;
        b=C+IcyF/8ZZbc4E+nZwH4mcZhVhcLo1FtD8RPFxjZabmuH+49qexKabk9fJYE/uthyV
         G8c9tp3hcfwWwxgUPk8g80+6QHpW/xnSoi5Z/5j/i6Q5Y1+1e7wu/bhnw3fOY4vOoFwc
         2TPYcp4N/dujGt6EklKGuQLcDi/I2GWJUd3qFZvKPHai0FLqwuirPk88muEzQ7eJP0dv
         Lxdt3KnmklPWL+Rf99HfJJzurhR3Wqoa7mEMC8C5l6vfXFnawqklkjeehmCYFi4rZAIM
         AZnWtqpYnLLhBJtNaETM74hFllZmBEfk69XcXhbB5kzQRmkBO6xCtinylqHi1nh5OV7l
         qF3w==
X-Forwarded-Encrypted: i=1; AJvYcCUmK+sEuutSkz8C5/JVB7Iic1xM4NRSud4mpag9L8oBZ3WtCpq/riYeC/IUIrs+4r/H+vKVCXJJqNLcfUd1c1Y7@lists.infradead.org
X-Gm-Message-State: AOJu0YwlPPN8ucsHS8AV/G7MnlN/F923aI2wKBqQ/G90REl82DHt54sl
	LGEI1/KRcOVwzgEmDTUPXF/ci69dDgBqTtSkVAzLEIioRvMhDdYZKVwaXP1Kt+PZiSQJjzvE2Ff
	UnRFz4B/JOmtnehXMhbUlchQMwGBI8l3LBvcnC86qHw==
X-Gm-Gg: ASbGncvrEsgx81vexIz6J6tLMC5Tvus/gnJyufsxIL16cyJMex+FEFwuC+76xyYaLam
	M1u5gDZvm+YskFD3Awn6s0K1dAOW4IOREyQHU8a9c2lYAdKyZuT2zL07k/OPxK4h7eyniljlgjI
	rkoio2qY+Eq2h4mn6+bb7BHIrv9qnmrc9hWdKjzztdUi5pd4gPiy/UkTrG1zVNNGK1XJcbD0Xb7
	6wqB5U+
X-Google-Smtp-Source: AGHT+IEzXZtRTpqZPP5g7x2Fm91kPpdZS5/X5V/55yjLcJ8BQVVYt3sRPxAm7hdiFuIt8kIDsDR0IpWsd9pUjol0rkY=
X-Received: by 2002:a05:6e02:3045:b0:3e0:4f66:310a with SMTP id
 e9e14a558f8ab-3e282e868cbmr102473895ab.16.1752813586416; Thu, 17 Jul 2025
 21:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com> <20250522-pmu_event_info-v3-5-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-5-f7bba7fd9cfe@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 18 Jul 2025 10:09:34 +0530
X-Gm-Features: Ac12FXz48gZhuRL6l_A_d2ML5HT5uyFhLTVui-Isq6ALvDwU7Ubg6PFae_bdCbw
Message-ID: <CAAhSdy1U02MDSGdMy+zCzdF4YENzvvKLnS+uszPpkH_nAPA9yw@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] drivers/perf: riscv: Export PMU event info function
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_213947_470892_04557BB6 
X-CRM114-Status: GOOD (  29.91  )
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

On Fri, May 23, 2025 at 12:33=E2=80=AFAM Atish Patra <atishp@rivosinc.com> =
wrote:
>
> The event mapping function can be used in event info function to find out
> the corresponding SBI PMU event encoding during the get_event_info functi=
on
> as well. Refactor and export it so that it can be invoked from kvm and
> internal driver.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c   | 124 ++++++++++++++++++++++-------------=
------
>  include/linux/perf/riscv_pmu.h |   2 +
>  2 files changed, 69 insertions(+), 57 deletions(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 33d8348bf68a..f5d3db6dba18 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -100,6 +100,7 @@ static unsigned int riscv_pmu_irq;
>  /* Cache the available counters in a bitmask */
>  static unsigned long cmask;
>
> +static int pmu_event_find_cache(u64 config);
>  struct sbi_pmu_event_data {
>         union {
>                 union {
> @@ -411,6 +412,71 @@ static bool pmu_sbi_ctr_is_fw(int cidx)
>         return (info->type =3D=3D SBI_PMU_CTR_TYPE_FW) ? true : false;
>  }
>
> +int riscv_pmu_get_event_info(u32 type, u64 config, u64 *econfig)
> +{
> +       int ret =3D -ENOENT;
> +
> +       switch (type) {
> +       case PERF_TYPE_HARDWARE:
> +               if (config >=3D PERF_COUNT_HW_MAX)
> +                       return -EINVAL;
> +               ret =3D pmu_hw_event_map[config].event_idx;
> +               break;
> +       case PERF_TYPE_HW_CACHE:
> +               ret =3D pmu_event_find_cache(config);
> +               break;
> +       case PERF_TYPE_RAW:
> +               /*
> +                * As per SBI v0.3 specification,
> +                *  -- the upper 16 bits must be unused for a hardware ra=
w event.
> +                * As per SBI v3.0 specification,
> +                *  -- the upper 8 bits must be unused for a hardware raw=
 event.
> +                * Bits 63:62 are used to distinguish between raw events
> +                * 00 - Hardware raw event
> +                * 10 - SBI firmware events
> +                * 11 - Risc-V platform specific firmware event
> +                */
> +               switch (config >> 62) {
> +               case 0:
> +                       if (sbi_v3_available) {
> +                       /* Return error any bits [56-63] is set  as it is=
 not allowed by the spec */
> +                               if (!(config & ~RISCV_PMU_RAW_EVENT_V2_MA=
SK)) {
> +                                       if (econfig)
> +                                               *econfig =3D config & RIS=
CV_PMU_RAW_EVENT_V2_MASK;
> +                                       ret =3D RISCV_PMU_RAW_EVENT_V2_ID=
X;
> +                               }
> +                       /* Return error any bits [48-63] is set  as it is=
 not allowed by the spec */
> +                       } else if (!(config & ~RISCV_PMU_RAW_EVENT_MASK))=
 {
> +                               if (econfig)
> +                                       *econfig =3D config & RISCV_PMU_R=
AW_EVENT_MASK;
> +                               ret =3D RISCV_PMU_RAW_EVENT_IDX;
> +                       }
> +                       break;
> +               case 2:
> +                       ret =3D (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_F=
W << 16);
> +                       break;
> +               case 3:
> +                       /*
> +                        * For Risc-V platform specific firmware events
> +                        * Event code - 0xFFFF
> +                        * Event data - raw event encoding
> +                        */
> +                       ret =3D SBI_PMU_EVENT_TYPE_FW << 16 | RISCV_PLAT_=
FW_EVENT;
> +                       if (econfig)
> +                               *econfig =3D config & RISCV_PMU_PLAT_FW_E=
VENT_MASK;
> +                       break;
> +               default:
> +                       break;
> +               }
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(riscv_pmu_get_event_info);
> +
>  /*
>   * Returns the counter width of a programmable counter and number of har=
dware
>   * counters. As we don't support heterogeneous CPUs yet, it is okay to j=
ust
> @@ -576,7 +642,6 @@ static int pmu_sbi_event_map(struct perf_event *event=
, u64 *econfig)
>  {
>         u32 type =3D event->attr.type;
>         u64 config =3D event->attr.config;
> -       int ret =3D -ENOENT;
>
>         /*
>          * Ensure we are finished checking standard hardware events for
> @@ -584,62 +649,7 @@ static int pmu_sbi_event_map(struct perf_event *even=
t, u64 *econfig)
>          */
>         flush_work(&check_std_events_work);
>
> -       switch (type) {
> -       case PERF_TYPE_HARDWARE:
> -               if (config >=3D PERF_COUNT_HW_MAX)
> -                       return -EINVAL;
> -               ret =3D pmu_hw_event_map[event->attr.config].event_idx;
> -               break;
> -       case PERF_TYPE_HW_CACHE:
> -               ret =3D pmu_event_find_cache(config);
> -               break;
> -       case PERF_TYPE_RAW:
> -               /*
> -                * As per SBI v0.3 specification,
> -                *  -- the upper 16 bits must be unused for a hardware ra=
w event.
> -                * As per SBI v3.0 specification,
> -                *  -- the upper 8 bits must be unused for a hardware raw=
 event.
> -                * Bits 63:62 are used to distinguish between raw events
> -                * 00 - Hardware raw event
> -                * 10 - SBI firmware events
> -                * 11 - Risc-V platform specific firmware event
> -                */
> -
> -               switch (config >> 62) {
> -               case 0:
> -                       if (sbi_v3_available) {
> -                       /* Return error any bits [56-63] is set  as it is=
 not allowed by the spec */
> -                               if (!(config & ~RISCV_PMU_RAW_EVENT_V2_MA=
SK)) {
> -                                       *econfig =3D config & RISCV_PMU_R=
AW_EVENT_V2_MASK;
> -                                       ret =3D RISCV_PMU_RAW_EVENT_V2_ID=
X;
> -                               }
> -                       /* Return error any bits [48-63] is set  as it is=
 not allowed by the spec */
> -                       } else if (!(config & ~RISCV_PMU_RAW_EVENT_MASK))=
 {
> -                               *econfig =3D config & RISCV_PMU_RAW_EVENT=
_MASK;
> -                               ret =3D RISCV_PMU_RAW_EVENT_IDX;
> -                       }
> -                       break;
> -               case 2:
> -                       ret =3D (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_F=
W << 16);
> -                       break;
> -               case 3:
> -                       /*
> -                        * For Risc-V platform specific firmware events
> -                        * Event code - 0xFFFF
> -                        * Event data - raw event encoding
> -                        */
> -                       ret =3D SBI_PMU_EVENT_TYPE_FW << 16 | RISCV_PLAT_=
FW_EVENT;
> -                       *econfig =3D config & RISCV_PMU_PLAT_FW_EVENT_MAS=
K;
> -                       break;
> -               default:
> -                       break;
> -               }
> -               break;
> -       default:
> -               break;
> -       }
> -
> -       return ret;
> +       return riscv_pmu_get_event_info(type, config, econfig);
>  }
>
>  static void pmu_sbi_snapshot_free(struct riscv_pmu *pmu)
> diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pm=
u.h
> index 701974639ff2..4a5e3209c473 100644
> --- a/include/linux/perf/riscv_pmu.h
> +++ b/include/linux/perf/riscv_pmu.h
> @@ -91,6 +91,8 @@ struct riscv_pmu *riscv_pmu_alloc(void);
>  int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr);
>  #endif
>
> +int riscv_pmu_get_event_info(u32 type, u64 config, u64 *econfig);
> +
>  #endif /* CONFIG_RISCV_PMU */

We will see compile/link errors for users of riscv_pmu_get_event_info()
if CONFIG_RISCV_PMU_SBI is not defined. Am I missing anything

>
>  #endif /* _RISCV_PMU_H */
>
> --
> 2.43.0
>

Regards,
Anup

