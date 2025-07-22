Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9016C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 03:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTiIswXCUeRqcifdr1qmaG/ebZiMNguVP5JbzVmVURc=; b=axX1XRVnPLCEbBnTe/6WPaiK8W
	xmBqib4tnoow+iun8CUPqqWPvI5LN9ZCRghFu7GGR0rsCqLRm7y5HjU3QLqhgLCsJSg5L7Q1PEK38
	ar/JfzV4PD0UOcZxICfmzOM9u9FaAchYzMff6XoePdJ7et3F6aE7hs3lJYGghX6FC9ShhQFdf/PVn
	h8W5IhrJ84jtLVk5fme8JHSLvpUbzfkmfMrmlRgF51ESsjhcaILIVEIVTfSdgkzHOiGhei56xCh6/
	iv4n4fbHOKHMEe1Jr1Tt5jPy7ibT3i9bzG7kDazTff8LUaqRF5ttbBvo4NEAivDK6QIs0luUge+be
	pYHYAz9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue48q-00000001DbW-2CHF;
	Tue, 22 Jul 2025 03:58:12 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue46M-00000001DQX-13x8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 03:55:39 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3ddb4a7ac19so20700965ab.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 20:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1753156537; x=1753761337; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTiIswXCUeRqcifdr1qmaG/ebZiMNguVP5JbzVmVURc=;
        b=pq94xI0C417XGos3hoJ0kQuirqknCk5/9Dir67Pf8rGPFOHVXWNWQc72Ecw0ogn43z
         JHFs9FhdUXfTJoWWGRjJk1R/rSgLkLZhSqH/wwr5umn/u7Q6KYvL+jZB9gCq7dz5n3Mv
         m9ROYysPvVSyWzClQobk2oPFgdyMFLTNuvViYYRM/VsNoIBnLu84irnJSwUSLhbwwlhY
         kITJcv8P7uL7UROGdyMmCnaSNTaVzXBsjA3aj+eh/8kfiSIabZza69s6eL6zlqUp6RjK
         oxeOEQgGeeo0V6ZfbtdIwkqof+WhXTpG0JsnBCD0+wqbRqICfnmy/ADIywmhGT0xG3bQ
         1j0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753156537; x=1753761337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTiIswXCUeRqcifdr1qmaG/ebZiMNguVP5JbzVmVURc=;
        b=vQQ776clsjxYp6jsxSR9CngqFH+ryconADrNe6dS9tZxyy9FmnlJWpfHy0vHoKzJ/L
         5VwQpC8BE5VhlT01xnCc5V2pguostwqITLPspbW3VoQi9+vki7DxfHP/9afo+zo0Uwec
         AJuXF1TGe3fOFeDsKEHeSaIvfEdEG1KbRqmrQvj1MvcJeegiPDU/leK2onsQbiEJnTW6
         jQjfjjOVsAbnCDH9ZyhyNeYaT8w7KuPR4dKEbutb576ylpC0rqDcjM7ERoz2Oh8eV3z3
         2U7XQG9+eNDxYSlZ8pMwV54Vy4Miz9z2cOw6XIye5aLxJZq4uM8yT6igAyvWAa62U12q
         ICcg==
X-Forwarded-Encrypted: i=1; AJvYcCWiPwAW+sTEeBDZJcBuqvknloFwd0WhixXSK1IDG9ewlO1WbFtTgkmI4/c1J61FxmJsmshF1qqWYu/NgRQay1A9@lists.infradead.org
X-Gm-Message-State: AOJu0YwdsyHJnXolr1o3uTY5P1w7xVMKHzEiqqp/uG8GEZ81HOa73wlS
	7ig14YcP2GTZ1vo4/MgGT8KV/MdQ9Pt1ScwMOm2IAiMr1q5nNls0BpZXdbLRnwpQrnJ0UNOJGlD
	5ymzDbrqCLQY+8hNOp9K8irTKI/ZRekLW2QIS9UV70Q==
X-Gm-Gg: ASbGncu1vSAi4NN9/sqPrVNGsTanWlEFhQFVwO7NKb2pDXF6zVmKT9W9/apebmbQMa0
	RPj2NsrDRGa1lDpsWmMUEm7knvwzy7d71PdVGadnWoEt8EL5cveHYhvR9K6smDdPActXdRTj42s
	8fY0iY23Dd7lGqwRRUMQF9MXhDggicZ1FS3istuO2Uw5+PIQBdu0p0xOfZ9ie3C0vtwLugK3RfH
	DyaBTkw
X-Google-Smtp-Source: AGHT+IEOqS8YGgVoprY+8f3pC+3mkVKAq8JUCoZfCHkL1OAyGAf9GO3LLl24tZ/Rk5tS5g9YXKMA+WXBYy2KvEy5e+c=
X-Received: by 2002:a05:6e02:3b85:b0:3e2:a868:8bfc with SMTP id
 e9e14a558f8ab-3e2a8689009mr128348475ab.17.1753156537299; Mon, 21 Jul 2025
 20:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com> <20250721-pmu_event_info-v4-4-ac76758a4269@rivosinc.com>
In-Reply-To: <20250721-pmu_event_info-v4-4-ac76758a4269@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 22 Jul 2025 09:25:26 +0530
X-Gm-Features: Ac12FXwLvJgSGjfrNWw90BLHUksAPu_rJedadgUcf1wkEVZ7pdyL3Xk4uR_QcQg
Message-ID: <CAAhSdy1KHTW4J+OKVgBof2gQDfFuKq0H9rrmsJ7L2KBRXtzuaw@mail.gmail.com>
Subject: Re: [PATCH v4 4/9] drivers/perf: riscv: Implement PMU event info function
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_205538_400331_99C69F07 
X-CRM114-Status: GOOD (  24.49  )
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

On Tue, Jul 22, 2025 at 8:45=E2=80=AFAM Atish Patra <atishp@rivosinc.com> w=
rote:
>
> With the new SBI PMU event info function, we can query the availability
> of the all standard SBI PMU events at boot time with a single ecall.
> This improves the bootime by avoiding making an SBI call for each
> standard PMU event. Since this function is defined only in SBI v3.0,
> invoke this only if the underlying SBI implementation is v3.0 or higher.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/sbi.h |  9 ++++++
>  drivers/perf/riscv_pmu_sbi.c | 69 ++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 78 insertions(+)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index b0c41ef56968..5ca7cebc13cc 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -136,6 +136,7 @@ enum sbi_ext_pmu_fid {
>         SBI_EXT_PMU_COUNTER_FW_READ,
>         SBI_EXT_PMU_COUNTER_FW_READ_HI,
>         SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
> +       SBI_EXT_PMU_EVENT_GET_INFO,
>  };
>
>  union sbi_pmu_ctr_info {
> @@ -159,6 +160,14 @@ struct riscv_pmu_snapshot_data {
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
> index 7331808b1192..433d122f1f41 100644
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
> @@ -316,6 +376,15 @@ static void pmu_sbi_check_event(struct sbi_pmu_event=
_data *edata)
>
>  static void pmu_sbi_check_std_events(struct work_struct *work)
>  {
> +       int ret;
> +
> +       if (sbi_v3_available) {
> +               ret =3D pmu_sbi_check_event_info();
> +               if (ret)
> +                       pr_err("pmu_sbi_check_event_info failed with erro=
r %d\n", ret);
> +               return;
> +       }
> +
>         for (int i =3D 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
>                 pmu_sbi_check_event(&pmu_hw_event_map[i]);
>
>
> --
> 2.43.0
>

