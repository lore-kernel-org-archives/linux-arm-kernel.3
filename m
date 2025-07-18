Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F4CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 04:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BchHT2JqinVts/UeZMPzWB77o6GrLS5pyW1xcQuRic=; b=Sl7A+ItIjkla6cxbwfwfRgNGT3
	NBd0eyogczJPSVEGh9kdKPlJ+fRM6KKC+2C4oH/wVBJx+kgBcdBJD/X/Sej1VdtfBgIOMAwIS7ge1
	vsnW+juf7wEhKn2nVJiT7sNrg+rroSxuhBVdzALs8YwD2kUcXY2Ute7S+5UCe46uCZymBMIG80TY1
	jLwX0/aKUkSWChsxmibLs4TUEpztiqAaZpBR9wpurRhRTzTKb1+T0LvR01iXyHaoHRhZVxSMVhL2x
	19d4DWML0ystQgKgDka2CQZXsFDqQi21CaNLse5hfcHsR9RyHzqo5rYMW23x+WlADGd5nwPSPTRrC
	l25BHtEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uccot-0000000BfQW-2DGb;
	Fri, 18 Jul 2025 04:35:39 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uccmQ-0000000BfDc-1tnu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 04:33:08 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-87999c368e9so163045939f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 21:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752813185; x=1753417985; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BchHT2JqinVts/UeZMPzWB77o6GrLS5pyW1xcQuRic=;
        b=SNYb5LQ6lFafok8yAXgS/+ZRCn/gCbEdYzd36LziXcoJpYZcs7tFQqUCPFXcTwZ37R
         TCbImB926ejyMM6dTXvgjIOBuy/cBvzl5o1iiXMLMLcBtSDvJNhIWmkT5XyfoOIFh5qe
         hlYfIdGsj+loWQ0aRRNJdNEmzBfDWgO3Ytmj9iHhEycoE6cASPYJkw0wukbixlKqcTNX
         BevG0xmGq5+l4cZi3bFuzKvOPfLnqZ+FiVrh8k6iW129+x09yoV0AmOd2bJItJk2SaIP
         nuwU/+pbdH+vfNWZvw6OWfy6LzpQ7qBXfbc1qpSIEQq1ccKCO1IhwgluRsRo3Aq4/tN9
         bEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752813185; x=1753417985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9BchHT2JqinVts/UeZMPzWB77o6GrLS5pyW1xcQuRic=;
        b=cNd0aPT0q6AUZqfCWgf7u3pNa7WBP+Gt+TySrIDVE255Qry/aj2Oc43UeUXUKd4CsT
         PkeHH4pIf/ufsdx9V9cZKfTzlcyRwE4JQRmKKw+IGCibyH6LDNZsPlWjHF6rvUwcxTCK
         YPMCzipSFUWVTUJJLrUqHLrMej82RRaCzayqne2FcvATl/eVrxeEMdZmRMaZWxhOdOok
         5KagODywKIz8Ghi8p71djenkSwxBrhYtxe6379NVvnirA+23fUMzXWXTusD5QkewbHF1
         fzAMJT7HnaxtM0k0vuTc0lYGJgG5YummrgvyPMFpjsB0t9tHYdytAcYSctzcXnlWizXZ
         k9hg==
X-Forwarded-Encrypted: i=1; AJvYcCUNpZJyZZvK1ygl5M47W101Qajt+KQVLf/hiNOKiDuL9sOJTOAcqemaawQ6KYO/YbsOH1ayFcG9ocbs1ZhADBWM@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/AE0Kw5pdRhUppy/WgzEs+sr2fuV8NEMFM2CILtRFTfBUi0tf
	0dAxnoFofsc+2eme6fGopIQgTpbAIY1mSgN3p9V11FEpKoe2TZhFM/wnkMJwrehAXzNg/FF0p2U
	3OUgGoL9ri6UL+/OX6VaUPZKO3JbFi7BDRlWiI5eS3g==
X-Gm-Gg: ASbGncsIz5rz2UTrSVigJtjJhoaHVNaNIP2J6iqKlM/moeuEEgilaAJUH+jS7IIu29f
	uWqmIKJ4pQPxOrYqEcmuTw4d6sT1yZ60cu7hF/E6yHiRGyGeWCz4rT/iejR/GD2cv5pb2E4oBqi
	/3vPiltdfW/+OWwylk47ajPM18QlZtoOKYociclNIiz+RyoCLYmZk25hbDB+w/B/NV7Wp88jUgg
	yZ0v3aF
X-Google-Smtp-Source: AGHT+IGxLSLfJEWbT94QQ9wDEPcHHk7UU5oQFPXNoEg2dmlbQDZqZkULuKjbXMOnhCheEHP/8Vs0hjk7tTvXdvuroqU=
X-Received: by 2002:a05:6e02:1488:b0:3e2:8172:25e3 with SMTP id
 e9e14a558f8ab-3e282e3961cmr83450795ab.14.1752813185443; Thu, 17 Jul 2025
 21:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com> <20250522-pmu_event_info-v3-4-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-4-f7bba7fd9cfe@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 18 Jul 2025 10:02:53 +0530
X-Gm-Features: Ac12FXz8CojGLXC08fo8TuectN9PJto19GIlEKkPXZw46d0UC0i4fpJCDCQw5Dc
Message-ID: <CAAhSdy1RyJyjus_SUOw7GUZsQLr5SFV4TZ9d7K1OEKDR27TaWQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] drivers/perf: riscv: Implement PMU event info function
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_213306_581292_65BB7D5C 
X-CRM114-Status: GOOD (  25.74  )
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
> With the new SBI PMU event info function, we can query the availability
> of the all standard SBI PMU events at boot time with a single ecall.
> This improves the bootime by avoiding making an SBI call for each
> standard PMU event. Since this function is defined only in SBI v3.0,
> invoke this only if the underlying SBI implementation is v3.0 or higher.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h |  9 ++++++
>  drivers/perf/riscv_pmu_sbi.c | 68 ++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 77 insertions(+)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 6ce385a3a7bb..77b6997eb6c5 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -135,6 +135,7 @@ enum sbi_ext_pmu_fid {
>         SBI_EXT_PMU_COUNTER_FW_READ,
>         SBI_EXT_PMU_COUNTER_FW_READ_HI,
>         SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
> +       SBI_EXT_PMU_EVENT_GET_INFO,
>  };
>
>  union sbi_pmu_ctr_info {
> @@ -158,6 +159,14 @@ struct riscv_pmu_snapshot_data {
>         u64 reserved[447];
>  };
>
> +struct riscv_pmu_event_info {
> +       u32 event_idx;
> +       u32 output;
> +       u64 event_data;
> +};
> +
> +#define RISCV_PMU_EVENT_INFO_OUTPUT_MASK 0x01
> +
>  #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
>  #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
>  /* SBI v3.0 allows extended hpmeventX width value */
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 273ed70098a3..33d8348bf68a 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -299,6 +299,66 @@ static struct sbi_pmu_event_data pmu_cache_event_map=
[PERF_COUNT_HW_CACHE_MAX]
>         },
>  };
>
> +static int pmu_sbi_check_event_info(void)
> +{
> +       int num_events =3D ARRAY_SIZE(pmu_hw_event_map) + PERF_COUNT_HW_C=
ACHE_MAX *
> +                        PERF_COUNT_HW_CACHE_OP_MAX * PERF_COUNT_HW_CACHE=
_RESULT_MAX;
> +       struct riscv_pmu_event_info *event_info_shmem;
> +       phys_addr_t base_addr;
> +       int i, j, k, result =3D 0, count =3D 0;
> +       struct sbiret ret;
> +
> +       event_info_shmem =3D kcalloc(num_events, sizeof(*event_info_shmem=
), GFP_KERNEL);
> +       if (!event_info_shmem)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
> +               event_info_shmem[count++].event_idx =3D pmu_hw_event_map[=
i].event_idx;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
> +               for (j =3D 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++=
) {
> +                       for (k =3D 0; k < ARRAY_SIZE(pmu_cache_event_map[=
i][j]); k++)
> +                               event_info_shmem[count++].event_idx =3D
> +                                                       pmu_cache_event_m=
ap[i][j][k].event_idx;
> +               }
> +       }
> +
> +       base_addr =3D __pa(event_info_shmem);
> +       if (IS_ENABLED(CONFIG_32BIT))
> +               ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_EVENT_GET_INFO=
, lower_32_bits(base_addr),
> +                               upper_32_bits(base_addr), count, 0, 0, 0)=
;
> +       else
> +               ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_EVENT_GET_INFO=
, base_addr, 0,
> +                               count, 0, 0, 0);
> +       if (ret.error) {
> +               result =3D -EOPNOTSUPP;
> +               goto free_mem;
> +       }
> +
> +       for (i =3D 0; i < ARRAY_SIZE(pmu_hw_event_map); i++) {
> +               if (!(event_info_shmem[i].output & RISCV_PMU_EVENT_INFO_O=
UTPUT_MASK))
> +                       pmu_hw_event_map[i].event_idx =3D -ENOENT;
> +       }
> +
> +       count =3D ARRAY_SIZE(pmu_hw_event_map);
> +
> +       for (i =3D 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
> +               for (j =3D 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++=
) {
> +                       for (k =3D 0; k < ARRAY_SIZE(pmu_cache_event_map[=
i][j]); k++) {
> +                               if (!(event_info_shmem[count].output &
> +                                     RISCV_PMU_EVENT_INFO_OUTPUT_MASK))
> +                                       pmu_cache_event_map[i][j][k].even=
t_idx =3D -ENOENT;
> +                               count++;
> +                       }
> +               }
> +       }
> +
> +free_mem:
> +       kfree(event_info_shmem);
> +
> +       return result;
> +}
> +
>  static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
>  {
>         struct sbiret ret;
> @@ -316,6 +376,14 @@ static void pmu_sbi_check_event(struct sbi_pmu_event=
_data *edata)
>
>  static void pmu_sbi_check_std_events(struct work_struct *work)
>  {
> +       int ret;
> +
> +       if (sbi_v3_available) {
> +               ret =3D pmu_sbi_check_event_info();
> +               if (!ret)
> +                       return;

We should not fall back to the old way if ret !=3D 0. Rather,
the pmu_sbi_check_std_events() should return failure if
pmu_sbi_check_event_info() fails.

> +       }
> +
>         for (int i =3D 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
>                 pmu_sbi_check_event(&pmu_hw_event_map[i]);
>
>
> --
> 2.43.0
>

Regards,
Anup

