Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8019FCAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfBLhNXXq9Rsc8Z2YKn++Jo2sHEm+zyXMU4WnJYLHBc=; b=okVBRtkRAaCy6zN9aLfoxq+74S
	VrTKSvsNX/x2AvMRI6Dwio8taN1qK3mTExrvPIxsjgKF4g+qHOh+qZW2HhwUdL1K4VNA+kf8tI9VZ
	hR7yURNZC1ul7SL5fhBMEOA5gIZ021zOM53dL+VI1w22tYfWotbaVH4eGsLpK2QgoGU4nbW/y5Sbi
	hwCleh+Vx+xyr/idR3wuw6xSOW9EYmWhiQlE93jNWTkR3wojuwMJlECl341kThJJcA9TZAo1tZtE+
	xXNG3X65Jau8zYvMMVxHNHdb4lNk1Sqk5AW6mUKsM5wNaLxJ5aDs3LnAdavZhUBgF/jsSRuiSaIcD
	Um9P7OfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhHm-00000003DS3-0wpW;
	Thu, 11 Sep 2025 13:24:26 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhHi-00000003DNv-1tfR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 13:24:24 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-30cceb3be82so554658fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 06:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1757597057; x=1758201857; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfBLhNXXq9Rsc8Z2YKn++Jo2sHEm+zyXMU4WnJYLHBc=;
        b=OyQc64tBgXrFyHLKfWFujSDq87z9Mrv0OeaBFYPQTzAYV+ubk/SRWbmGOsakHGb0vH
         ZVlhpuTA4LYc23kR3txIAzdSoe52SuHGvMBWaaEiVk2qnuKMgFvEqm2wTQRo3jlng3At
         lPRIEaa5ZlqAwT7W9+24QI8yKbxMvXdpwO/eMyi6bi9QFDms1phM5tp2q8n/5v5jL/70
         b4cjaLCKa+6L3RqYdiKOImN62HB+88Vt1C2bTNnpCOtuMhPLifER+3d2RI7tO80nj298
         olSkcnGjDhmzcLYlgAWpxPlUXNcv1adoshgCxWvHtrMtCaW3pHlz0xy+6ga6CoVuveS1
         IeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757597057; x=1758201857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfBLhNXXq9Rsc8Z2YKn++Jo2sHEm+zyXMU4WnJYLHBc=;
        b=uk0IO2fLwltjxuEJbyJLXsXpOEctdslbohnZONMeksREJlnb08xCJ8FllnbrEvptG+
         aVUf0kKvDjIHxLGSq8fUzMaA7n+wZN8umaS7Tl7EJpiaO7Dmg1rx58Btieo3PdZuyDhP
         nyMjswb3r/wr7VwEdpFwLSWis95XEkmQa0rvsgLTPzAtZaqYPGeJ8AUFDzA5zYGfV8r6
         ctAEOx6DG5f4eDAd/Zj+Vwc01tJtXUS3+GWSpH0JtALk0+K1ep0YVNTE+p6XIFX3CXoo
         Zp89t8MTUM6F+qmmZIEPBVMMH+I1cs58mbLtcUDL58ljRsZ93PIWH5PpuqYQg4n34ZEn
         36Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXY+bv/pN9BzUaCebrEw6KUzmbAvEonQtTgCDVElWTYm5vpcNVjdOLoPXzEJXOU/510mzw7kA2eruuJ/2rCh6dq@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7HTrzMhKdhpbB8nEu0iCc1InZTdz9pzV1VSN/Wm06SIIaEAt5
	vEnb+nKWQa/ULeYWyujuBtEdsFgMEKW9I7lCVA1Ffd8d3Y9ld3/XqbLdVYwXw+8w7v5DOrsqR9o
	phEPvyHAoWzd9i1/OOOIVYTDZrsXgy/hCeTfxyCAYeQ==
X-Gm-Gg: ASbGncvkSwP1koQ6g3a6YUcUm7HEUY/0TrF5tZcnnRjwoU7+gjzTrQdTPJ+MOD+WXb6
	nA7V5OYtnnsV9rVd8PQVnQp3SwC+/MUzmnRE1WbZ9AmaH/Fl2XwqoWZlWRuIqZNd1alcOMKVP3y
	2Dl9kjYMwLL/Qkbz06QG+Vhl3IWRx0I5le6uOQ3KBt2qf3mwCkHR60qlwDBsIEYaJUsFK+Cb0f4
	RmXuFAIJ7MiG5HM
X-Google-Smtp-Source: AGHT+IHRdBKXm1Bz1NHFHe2IrSKtcJoxyFdHCG+gmrlFxehDwahE40seZUC2QEjKPDn+5kw4bLLqvWTXBPHddQo3Z4w=
X-Received: by 2002:a05:6870:4e8c:b0:31d:63f9:b247 with SMTP id
 586e51a60fabf-32264607e14mr11225562fac.25.1757597056938; Thu, 11 Sep 2025
 06:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com> <20250327-counter_delegation-v5-18-1ee538468d1b@rivosinc.com>
In-Reply-To: <20250327-counter_delegation-v5-18-1ee538468d1b@rivosinc.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 11 Sep 2025 21:24:04 +0800
X-Gm-Features: Ac12FXwLi65vQtG3EKjaprZe3vR6jcXi2qMAlWPQLWbqK3WvwYrKsOxiKlH-8R4
Message-ID: <CAEEQ3wk92bmHQb=EbM-Ev0ra=eS-ZH6_aGTqAw1WENXpORXUKg@mail.gmail.com>
Subject: Re: [External] [PATCH v5 18/21] RISC-V: perf: Add Qemu virt machine events
To: Atish Patra <atishp@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_062422_549766_A8EC25EB 
X-CRM114-Status: GOOD (  18.37  )
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

Hi Atish,

On Fri, Mar 28, 2025 at 3:46=E2=80=AFAM Atish Patra <atishp@rivosinc.com> w=
rote:
>
> Qemu virt machine supports a very minimal set of legacy perf events.
> Add them to the vendor table so that users can use them when
> counter delegation is enabled.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/vendorid_list.h |  4 ++++
>  drivers/perf/riscv_pmu_dev.c           | 36 ++++++++++++++++++++++++++++=
++++++
>  2 files changed, 40 insertions(+)
>
> diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/=
asm/vendorid_list.h
> index a5150cdf34d8..0eefc844923e 100644
> --- a/arch/riscv/include/asm/vendorid_list.h
> +++ b/arch/riscv/include/asm/vendorid_list.h
> @@ -10,4 +10,8 @@
>  #define SIFIVE_VENDOR_ID       0x489
>  #define THEAD_VENDOR_ID                0x5b7
>
> +#define QEMU_VIRT_VENDOR_ID            0x000
> +#define QEMU_VIRT_IMPL_ID              0x000
> +#define QEMU_VIRT_ARCH_ID              0x000
> +
>  #endif
> diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
> index 8a079949e3a4..cd2ac4cf34f1 100644
> --- a/drivers/perf/riscv_pmu_dev.c
> +++ b/drivers/perf/riscv_pmu_dev.c
> @@ -26,6 +26,7 @@
>  #include <asm/sbi.h>
>  #include <asm/cpufeature.h>
>  #include <asm/vendor_extensions.h>
> +#include <asm/vendorid_list.h>
>  #include <asm/vendor_extensions/andes.h>
>  #include <asm/hwcap.h>
>  #include <asm/csr_ind.h>
> @@ -391,7 +392,42 @@ struct riscv_vendor_pmu_events {
>           .hw_event_map =3D _hw_event_map, .cache_event_map =3D _cache_ev=
ent_map, \
>           .attrs_events =3D _attrs },
>
> +/* QEMU virt PMU events */
> +static const struct riscv_pmu_event qemu_virt_hw_event_map[PERF_COUNT_HW=
_MAX] =3D {
> +       PERF_MAP_ALL_UNSUPPORTED,
> +       [PERF_COUNT_HW_CPU_CYCLES]              =3D {0x01, 0xFFFFFFF8},
> +       [PERF_COUNT_HW_INSTRUCTIONS]            =3D {0x02, 0xFFFFFFF8}
> +};
> +
> +static const struct riscv_pmu_event qemu_virt_cache_event_map[PERF_COUNT=
_HW_CACHE_MAX]
> +                                               [PERF_COUNT_HW_CACHE_OP_M=
AX]
> +                                               [PERF_COUNT_HW_CACHE_RESU=
LT_MAX] =3D {
> +       PERF_CACHE_MAP_ALL_UNSUPPORTED,
> +       [C(DTLB)][C(OP_READ)][C(RESULT_MISS)]   =3D {0x10019, 0xFFFFFFF8}=
,
> +       [C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]  =3D {0x1001B, 0xFFFFFFF8}=
,
> +
> +       [C(ITLB)][C(OP_READ)][C(RESULT_MISS)]   =3D {0x10021, 0xFFFFFFF8}=
,
> +};
> +
> +RVPMU_EVENT_CMASK_ATTR(cycles, cycles, 0x01, 0xFFFFFFF8);
> +RVPMU_EVENT_CMASK_ATTR(instructions, instructions, 0x02, 0xFFFFFFF8);
> +RVPMU_EVENT_CMASK_ATTR(dTLB-load-misses, dTLB_load_miss, 0x10019, 0xFFFF=
FFF8);
> +RVPMU_EVENT_CMASK_ATTR(dTLB-store-misses, dTLB_store_miss, 0x1001B, 0xFF=
FFFFF8);
> +RVPMU_EVENT_CMASK_ATTR(iTLB-load-misses, iTLB_load_miss, 0x10021, 0xFFFF=
FFF8);

If other vendors intend to define it, would that throw a duplicate
definition error?

> +
> +static struct attribute *qemu_virt_event_group[] =3D {
> +       RVPMU_EVENT_ATTR_PTR(cycles),
> +       RVPMU_EVENT_ATTR_PTR(instructions),
> +       RVPMU_EVENT_ATTR_PTR(dTLB_load_miss),
> +       RVPMU_EVENT_ATTR_PTR(dTLB_store_miss),
> +       RVPMU_EVENT_ATTR_PTR(iTLB_load_miss),
> +       NULL,
> +};
> +
>  static struct riscv_vendor_pmu_events pmu_vendor_events_table[] =3D {
> +       RISCV_VENDOR_PMU_EVENTS(QEMU_VIRT_VENDOR_ID, QEMU_VIRT_ARCH_ID, Q=
EMU_VIRT_IMPL_ID,
> +                               qemu_virt_hw_event_map, qemu_virt_cache_e=
vent_map,
> +                               qemu_virt_event_group)
>  };
>
>  const struct riscv_pmu_event *current_pmu_hw_event_map;
>
> --
> 2.43.0
>
>

Thanks,
Yunhui

