Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C19EC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 15:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3tUz+FrzCtl0Vbggujp06ap3pA8xukaziREmjLBWYA=; b=z0Ekqd2cKmAiqoebcXXMsKsM7g
	3RWUBUmV0UiHRAqQoHCxsxcF0gvY21sq6XYdx+Q3ityoan6WggEcDe1Q2rFf+iFcV8EzBVX/9+0M6
	QtZrRuM6X0hrEZ4berMdyHZAv6zauNbLHQcxr2jAN+BarrLdYbcs5LaBSqNFKmNM76IwZSTxPyu8k
	1FaJJCcRfz8kQE+b9mvcm31MMEGuTSNx+YeuiRF+udIsqyTIj8QtlMy8k+/zCzRiTxewRNPgQtm75
	Xv+So5VTSYTiYSJcKlTAyLaYM1m/+G0g0lgpS8I83aLUSCsJ5STIbqQL7w+JQrX4oI+3jGNPEt+c4
	B29gjF+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQyH-0000000AYSH-02eE;
	Thu, 17 Jul 2025 15:56:33 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQMJ-0000000AUbm-3Oeq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 15:17:21 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7d7f0fcef86so97943285a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 08:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752765439; x=1753370239; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3tUz+FrzCtl0Vbggujp06ap3pA8xukaziREmjLBWYA=;
        b=y8j+V2JPRLq5DN9EM0JXfolPVulIMPfggjRtrcYqM8NMiVLXTtzNMyAYSEB/GQ/biz
         yYd/JdE81TP5XNj4Booa+6k1SiRI5tcSqGk+TawLZNeqMtRYuiXzMb62oVNg/QlQZJtO
         5zgHIi4umO6qBKmEgGUL6xY8/HtxAfe2w1jiE6aNOWXKuUJENik2wYtZ2w6C3DVc3/hY
         YAywYvdLUeUd5a0CttmmLHqVyk3jyRAMV11psd+hEI4gcyndG7FwEkYN2X6n1z7fOSbM
         WNSEta7I0tfj9zYb7/0VxKl3MQgxdbCdb/aJWj4Jz70s8Oyxc84dt9S/WFQyqle4L/9v
         dOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752765439; x=1753370239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3tUz+FrzCtl0Vbggujp06ap3pA8xukaziREmjLBWYA=;
        b=kCGLL9KM2q7qquijdBLg4Z2Tmp+Z1JoPFwbsJ8EfJEBfCI4eT/KVs6woUW5Wx9b+gf
         if2hdVXKG1Ke0Eg//tKMdO8gIDRWhvzmahrYCAPIpeYmiNL7yKNfkvte0xQR+U/PRF+Z
         i1TuQEOETkgh33Y0C+g2EhsnxCeNuu/i3gews0QsamRPBVT/U7JiSOrtDXnYLeqgf5wk
         6MkN9ZmFJP1uXdwNwpiNr2syS7J4+Jx/fdhInFkXXRJ5zFKZ8eJuBKBYFwWB5xYVw12k
         7/J/iYrWj2wIYHbH6LtbySZD7COot/HR1M9TIDPQwHHsHd548qI3wBWH47qk4YaXr6md
         WmJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbFnprldjtxj/FMgCsfhr+XAHxUwA2uhHRn7HGspJYJ3M68xXOcv+4faQvQ7fmi3t07lVB2ykPhTT7rTfid+ZU@lists.infradead.org
X-Gm-Message-State: AOJu0YxHz8xS/CpzB5punKd2Ge91zWgyiICDA6I7Sm6I/ZCfskSjuwfK
	yTX2CZG2+H9auHM7M6L1KFveYghk9tm6U4cF3HSe/x2OUx3LBFvyqvXSgrDbDZfmt/I2HkIHyD3
	MnzAZKgeDJiDVrfdJWtesfLz0BCggCnaBGu2QhGqkRw==
X-Gm-Gg: ASbGncvalm+PUc3p5wP3zouks4L/OvoATqGMj9Y0A5GV3jSMv6JI3Y6lvCxTqsw7o0V
	lMC7rKa0ayTqtDEfd1HemBhHtq+JMB3/1WTno5+BtDTKMhNHKlfj7GXJP9+YEiwwWKtFiVPIbL/
	ZF7CBCMIkRcBGIfuUART6orfY1DUGzWnyL3DqxGxZFkKimQwSoJIssn9mW1AJ6hRKJWKD7CbvnX
	k8/5iN4
X-Google-Smtp-Source: AGHT+IHz2ooSEYMwChi5WNQfJsDufDgq6WJG7AmXKC3wtaW/L8MYe8nihHSBFgq+2TYbHnsMVgzMJk9i+88DE/6bDYA=
X-Received: by 2002:a05:620a:7017:b0:7c5:5fa0:4617 with SMTP id
 af79cd13be357-7e343615e30mr946456785a.40.1752765438473; Thu, 17 Jul 2025
 08:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com> <20250522-pmu_event_info-v3-2-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-2-f7bba7fd9cfe@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 20:47:06 +0530
X-Gm-Features: Ac12FXzD0efP_qu0iiVx1ulFC3dW-BDJaKPty1r8E1h77LH8P4Y_H1glg7EyAyo
Message-ID: <CAAhSdy02kKJ0PHjyeGaV1-pC3DVL8-VcQ=EB+ha69=_CAQb2xg@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] drivers/perf: riscv: Add raw event v2 support
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_081719_848400_D0537562 
X-CRM114-Status: GOOD (  23.73  )
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
> SBI v3.0 introduced a new raw event type that allows wider
> mhpmeventX width to be programmed via CFG_MATCH.
>
> Use the raw event v2 if SBI v3.0 is available.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h |  4 ++++
>  drivers/perf/riscv_pmu_sbi.c | 16 ++++++++++++----
>  2 files changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 3d250824178b..6ce385a3a7bb 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -160,7 +160,10 @@ struct riscv_pmu_snapshot_data {
>
>  #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
>  #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
> +/* SBI v3.0 allows extended hpmeventX width value */
> +#define RISCV_PMU_RAW_EVENT_V2_MASK GENMASK_ULL(55, 0)
>  #define RISCV_PMU_RAW_EVENT_IDX 0x20000
> +#define RISCV_PMU_RAW_EVENT_V2_IDX 0x30000
>  #define RISCV_PLAT_FW_EVENT    0xFFFF
>
>  /** General pmu event codes specified in SBI PMU extension */
> @@ -218,6 +221,7 @@ enum sbi_pmu_event_type {
>         SBI_PMU_EVENT_TYPE_HW =3D 0x0,
>         SBI_PMU_EVENT_TYPE_CACHE =3D 0x1,
>         SBI_PMU_EVENT_TYPE_RAW =3D 0x2,
> +       SBI_PMU_EVENT_TYPE_RAW_V2 =3D 0x3,
>         SBI_PMU_EVENT_TYPE_FW =3D 0xf,
>  };
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index cfd6946fca42..273ed70098a3 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -59,7 +59,7 @@ asm volatile(ALTERNATIVE(                              =
               \
>  #define PERF_EVENT_FLAG_USER_ACCESS    BIT(SYSCTL_USER_ACCESS)
>  #define PERF_EVENT_FLAG_LEGACY         BIT(SYSCTL_LEGACY)
>
> -PMU_FORMAT_ATTR(event, "config:0-47");
> +PMU_FORMAT_ATTR(event, "config:0-55");
>  PMU_FORMAT_ATTR(firmware, "config:62-63");
>
>  static bool sbi_v2_available;
> @@ -527,8 +527,10 @@ static int pmu_sbi_event_map(struct perf_event *even=
t, u64 *econfig)
>                 break;
>         case PERF_TYPE_RAW:
>                 /*
> -                * As per SBI specification, the upper 16 bits must be un=
used
> -                * for a hardware raw event.
> +                * As per SBI v0.3 specification,
> +                *  -- the upper 16 bits must be unused for a hardware ra=
w event.
> +                * As per SBI v3.0 specification,

The text here should be "As-per SBI v2.0 ..."

> +                *  -- the upper 8 bits must be unused for a hardware raw=
 event.
>                  * Bits 63:62 are used to distinguish between raw events
>                  * 00 - Hardware raw event
>                  * 10 - SBI firmware events
> @@ -537,8 +539,14 @@ static int pmu_sbi_event_map(struct perf_event *even=
t, u64 *econfig)
>
>                 switch (config >> 62) {
>                 case 0:
> +                       if (sbi_v3_available) {
> +                       /* Return error any bits [56-63] is set  as it is=
 not allowed by the spec */
> +                               if (!(config & ~RISCV_PMU_RAW_EVENT_V2_MA=
SK)) {
> +                                       *econfig =3D config & RISCV_PMU_R=
AW_EVENT_V2_MASK;
> +                                       ret =3D RISCV_PMU_RAW_EVENT_V2_ID=
X;
> +                               }
>                         /* Return error any bits [48-63] is set  as it is=
 not allowed by the spec */
> -                       if (!(config & ~RISCV_PMU_RAW_EVENT_MASK)) {
> +                       } else if (!(config & ~RISCV_PMU_RAW_EVENT_MASK))=
 {
>                                 *econfig =3D config & RISCV_PMU_RAW_EVENT=
_MASK;
>                                 ret =3D RISCV_PMU_RAW_EVENT_IDX;
>                         }
>
> --
> 2.43.0
>

Otherwise, this looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

