Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC75DCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H02U+YPaV9x25+zlEas3Ch0Yf6NwtoizNMk25VmvRb8=; b=HSm4GDVRN0SViJ91As4bB943HM
	Bpj7s3z3UtUY4atYPxp/yzPY7RMF2avwWmOeQegePYOWNwrc7FRuyjqctSAE3mPVnVgARGDOwdzY1
	zoQFs6AyVoOesEitEBgYCO6kDDn4jHMxwyxiwFvY56x95AXCsxfD4MoOXe3s3XYqlf49XAUuEf9ko
	m4srRtuWsKBiFlT9VGWCi8pcCQgKL1l8LLc78vgIk6NE93ieQ4uMqgvpzHKhCt1lNcgTP10HkFkOm
	u4k1gNyGuNkm4oCUqYBXek0vkGISsQRHq3rPM5U9Qp6oEwaZe6Y0wOflBUmVjvufT+g080zwLrfV6
	m/8CK6PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1ym-00000008sIj-2mXn;
	Tue, 09 Sep 2025 17:18:04 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvy59-00000007HCz-2oUx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 13:08:25 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-88432e31114so416502139f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 06:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1757423303; x=1758028103; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H02U+YPaV9x25+zlEas3Ch0Yf6NwtoizNMk25VmvRb8=;
        b=m2zamEmP9s32XoozHWABLRGmc9lZWdRHcqKkQu89AYgC3dRhMAGeX+QMTmJQUkXKKP
         E4Gl/jzfP/R3iAhJWhuEKD/5vL2AY146Ef4/7Cf93Y4y3zWiiS+ElARS/MU14JG6MTy/
         BkXAEDPseDgcPSgqAwjPGWhrFhQ8rdDV4VR5eJ4dr9OCpgjNJNgIh20xxycVjNqIJeMc
         LSJsmQ2Hf3ro5ZgzSt13gfTW/qDInVVzqG7ki9YN+OZujg8otlWYpcKfYg12VuZp38Gf
         MKPHQsej+jYA2MRpL3dGaOyU7Ei0VcHi5TXl5s3LGTzs0ebpmeWnH4VgmvMX4fytVl/o
         Ns/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757423303; x=1758028103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H02U+YPaV9x25+zlEas3Ch0Yf6NwtoizNMk25VmvRb8=;
        b=ufroUt/dF/fgIdJ2PJFKnvydgNwQxUASMgXVWaF/QXcfog/nLIXariNv5eNDQ9B54L
         zH1TC+IFanRsenOQfWObW9VZdmC4XXg916SeHLUwQ/L6EOUn8Ielc9VkMxA0UeQ+lYXT
         GR/xSBSCRvG9BBu/DckQbyktoyDhp8pGIqmeAQkLBjtPbQwU6f7QP32DO5U3N0CMIUfM
         Gu73aKyaThQdCkeoofxr1QpOJvsgL8FpKDPC4o+GxyFYlJuPo04vpBlnp2LcPfLqptz5
         o0MVqPoHE8IPp7KIY0DiXpKZaIRn8Ab3HHCOGSWK2Ac1/COg6vBQQ1vzERee8QBA0kHw
         Cd5w==
X-Forwarded-Encrypted: i=1; AJvYcCW/SQmasl37eSG9Q/TRbgSkNNeJaojxybkK1wB8ezq7djBmyeZhjxw5onWAXsDjp80cILunbTvA6HazvYvpSHrM@lists.infradead.org
X-Gm-Message-State: AOJu0YwlHR28SVgL+3ew2P6FLrNAnmBKAZ1D/GBxV1NzWVN4TI3oE7Kr
	tm6ceJVMoaY9I/wC+Xo3J8Vd/AqlfxuvcN80q7GD7tWaDRTKSkxeFMi+17SloybSio4lYwsz7KJ
	2hLSq1ALyRVLXXuCfVqD3cpfWDDvw3fdeD85+qrBjNQ==
X-Gm-Gg: ASbGncv64oUFo8YigPBt5j740qrhIrFUtCh7+wFffUV2II4idpgNMn/WLqSkkVAWV6C
	wKL9Ao82qTa2LHDK0LFHeou/W4qgOaVQ5jQFiD7uTELROY2XioSRV6qtaPrhN1bpDcI0SLyynpW
	25mZUtDugakN0eeK3i0pdjen5BbIQ2rBBbta5aooEiSS6pKepSaicWFDV/EiySKh+S5/3qb4aI2
	/Au4XEzi0WzpxUX3L+vsV0w1GeTvaHn3p5jsLDDPgx7lbj305nXqsNN7eZwPg==
X-Google-Smtp-Source: AGHT+IGIXFEd6NKG4t1EShH+ohsgxoCLtKtko69/nI1/uYg3PQTsrCp5aYkq76x9El7gzpg8jEvl7mss/PUosQ8Pi6Q=
X-Received: by 2002:a05:6e02:1987:b0:415:de5:2e1 with SMTP id
 e9e14a558f8ab-4150de504admr1018785ab.18.1757423297934; Tue, 09 Sep 2025
 06:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com> <20250909-pmu_event_info-v6-4-d8f80cacb884@rivosinc.com>
In-Reply-To: <20250909-pmu_event_info-v6-4-d8f80cacb884@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 9 Sep 2025 18:38:06 +0530
X-Gm-Features: Ac12FXxyfsjvXfBOgxxqCKAcoZ2p-9S1up8nmISURF_bFVVeW9nkGyF0NIeOPT0
Message-ID: <CAAhSdy30m5uwt1HBPoKdh6VMUjZxR6tPznUGBmb5D6YWMYPw3w@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] drivers/perf: riscv: Implement PMU event info function
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_060823_947558_B9918810 
X-CRM114-Status: GOOD (  25.18  )
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

On Tue, Sep 9, 2025 at 12:33=E2=80=AFPM Atish Patra <atishp@rivosinc.com> w=
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
> index 3644bed4c8ab..a6c479f853e1 100644
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

