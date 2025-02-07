Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC67C02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 09:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3a+d7uyoeApEWBBfKQwFeZRvjtQlKPA0vvhD7J7Rfb0=; b=tb1aeYXwgKN8KOjf6kO8D4desV
	D1C2WGj1A1t+NcPkQrKEq4y9oGpFrC0MPg8qK0FNeoG41OiuD4dm4dpbDV4sBSjYtGNRioDDPG2Pp
	LltpHJZd+KcqRmQYnZuFdi2yxqeiWATlZeokQnYWM1AGcUQV7h02k5GcIyAO3oC9l5ZZJiscNbf5w
	8VdfKOfjjgjo6Z4DA2F1ITvG1bt2lNuuT+P/+Ncc4z7Qz9TPxw1cdtr6UuqIVVJcv4q9F5w1Eo0jo
	u+Z7k7d/lyDC0S1IElfJF1pvuaCQcJ2qHZHnd2zJ5Nfah57xG80dVAVrtIT6KhWqyPOTBXfAyN53F
	UpTWt6vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKmE-0000000932S-2JE5;
	Fri, 07 Feb 2025 09:35:58 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKh9-0000000925e-2DgR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 09:30:44 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38dcc6df5d3so230595f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 01:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738920642; x=1739525442; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3a+d7uyoeApEWBBfKQwFeZRvjtQlKPA0vvhD7J7Rfb0=;
        b=SfIxGUwQ41GBykwK4R7RsTgDs38rRV83URMFP6IZPewarDWLo0Do3Iww+p1vPDvvbI
         Bl02IXqOv6z23Z4EMxlIG2+8RfZgC+dOw0QHHJi8+6rElz+8sfzQu6icKUMfn2Y0By85
         gLdFEjRGcJYIJqeOdQsr/zg3U5B7DLx1qvXlsPUcmOyhcMGEsq/vG6348BmraHKYgHui
         l65mXCMqqyJF4zgeYHcuA8Q10+pzvkTvkD7V6L75A0wXfKLwX4Qukw7KgV6lNSVXwOqq
         73C7MZEyBMwUbwdxHIwqCX0pS31+bz0fZLN2OeVrnRkFokQgc4CuAxNJM6Z9U2gQ17dn
         vzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738920642; x=1739525442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3a+d7uyoeApEWBBfKQwFeZRvjtQlKPA0vvhD7J7Rfb0=;
        b=vkyAc8KG4z4V1YkEYOpQcSyNAleHBD0Hj3eI4j9StBCeC7/7SLxFz5FEBiQq+4ODrB
         rJmdQZij9hThi2XnyzbKZWCxaJQqgAYUYNI4g0FqujB/gJTvMqF+BRQYsGihBLGfD8Ah
         Q2QQ+ul9fgd1RzPoRXvIbdWfba+1Pe6yM+cui/Lw0CJQ4SHYHSlIrI6i1w3wRHcetXvy
         g0oyUa+dOo2NCDsXjK0WcvFxh9SWDSaap9hvoXxvox/TLbM/U196TvaEvNDDKrcHVz0D
         rapnyMp4B0D/8M2pXYAfR+e9Uq3nQdUkwHZ3LuBb0ij/b+DBQAxDDzzOdejWZgDew397
         pssg==
X-Forwarded-Encrypted: i=1; AJvYcCXUriV+zdfWzKgYBPmpZQHrD93bUeXcU9m00VOqpkXubs12pXIQxxLLbhHqJYXNvDzP9869sqLVAUdbfgMikkWg@lists.infradead.org
X-Gm-Message-State: AOJu0YycD8QSiD2Lxf+l1UsZ50Wsm6sTp94+MjbL4plreVjc7e2g2tal
	bPpKGgSeqksiNDYmjDrvTQmHjTB1Fvv5SzmfsFtnfKumk2PXxd2BSzj3rGI/Ja4=
X-Gm-Gg: ASbGncsOAjywCUeZDp6fuCQ+zKAnf6smOZXe5cZJBiP/zwY8dfcV5Nv4qgvsgrUampk
	Mua9OXuyWHxH8go2jWGEDH1iLcCsmZTm0DIoiaFkHrJDgISM+rXE7csHpk5SOncO/GfymTr6iD4
	JW8sJoe78SE08YQ4wMug+ge8CWjT1PoPocV3L1eu4s24RKp6EUILgOfeFk/KoBSo6L2MNz/sUE0
	r0CHjdknU0a7hv4cE+beovFjasZ+EQaaDoadFS4UAYCJV/11qYDvk7+k5pO3zSOJq5SiI1JyEtH
	jCOz/s7FaaMAodflSzS3WFpVeo/12FD1HGKxA14AfrrCFnJ3c3daawrk+gld
X-Google-Smtp-Source: AGHT+IESXZlQ/7J7RVMhXOtjbNkCC7bnZBXGkym1nxwIOsNsCdWy/rEEkXcjomIH6pUgz9UpP8gZ8g==
X-Received: by 2002:a05:6000:154e:b0:385:e1e8:40db with SMTP id ffacd0b85a97d-38dc8dd0a8amr1292514f8f.24.1738920641731;
        Fri, 07 Feb 2025 01:30:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd3856fsm3892845f8f.28.2025.02.07.01.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 01:30:41 -0800 (PST)
Message-ID: <bcb10a3a-162b-4a8c-a479-38f4168cea9a@rivosinc.com>
Date: Fri, 7 Feb 2025 10:30:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/21] RISC-V: Add Sscfg extension CSR definition
To: Atish Patra <atishp@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 Kaiwen Xue <kaiwenx@rivosinc.com>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
 <20250205-counter_delegation-v4-8-835cfa88e3b1@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-8-835cfa88e3b1@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_013043_560694_DA9D8D5B 
X-CRM114-Status: GOOD (  16.37  )
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



On 06/02/2025 08:23, Atish Patra wrote:
> From: Kaiwen Xue <kaiwenx@rivosinc.com>
> 
> This adds the scountinhibit CSR definition and S-mode accessible hpmevent
> bits defined by smcdeleg/ssccfg. scountinhibit allows S-mode to start/stop
> counters directly from S-mode without invoking SBI calls to M-mode. It is
> also used to figure out the counters delegated to S-mode by the M-mode as
> well.
> 
> Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 2ad2d492e6b4..42b7f4f7ec0f 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -224,6 +224,31 @@
>  #define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
>  #define SMSTATEEN0_SSTATEEN0_SHIFT	63
>  #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
> +/* HPMEVENT bits. These are accessible in S-mode via Smcdeleg/Ssccfg */
> +#ifdef CONFIG_64BIT
> +#define HPMEVENT_OF			(_UL(1) << 63)
> +#define HPMEVENT_MINH			(_UL(1) << 62)
> +#define HPMEVENT_SINH			(_UL(1) << 61)
> +#define HPMEVENT_UINH			(_UL(1) << 60)
> +#define HPMEVENT_VSINH			(_UL(1) << 59)
> +#define HPMEVENT_VUINH			(_UL(1) << 58)
> +#else
> +#define HPMEVENTH_OF			(_ULL(1) << 31)
> +#define HPMEVENTH_MINH			(_ULL(1) << 30)
> +#define HPMEVENTH_SINH			(_ULL(1) << 29)
> +#define HPMEVENTH_UINH			(_ULL(1) << 28)
> +#define HPMEVENTH_VSINH			(_ULL(1) << 27)
> +#define HPMEVENTH_VUINH			(_ULL(1) << 26)

Hi Atish,

Could you use BIT_UL/BIT_ULL() ? With that fixed,

Reviewed-by: Clément Léger <cleger@rivosinc.com>

Thanks,

Clément

> +
> +#define HPMEVENT_OF			(HPMEVENTH_OF << 32)
> +#define HPMEVENT_MINH			(HPMEVENTH_MINH << 32)
> +#define HPMEVENT_SINH			(HPMEVENTH_SINH << 32)
> +#define HPMEVENT_UINH			(HPMEVENTH_UINH << 32)
> +#define HPMEVENT_VSINH			(HPMEVENTH_VSINH << 32)
> +#define HPMEVENT_VUINH			(HPMEVENTH_VUINH << 32)
> +#endif
> +
> +#define SISELECT_SSCCFG_BASE		0x40
>  
>  /* mseccfg bits */
>  #define MSECCFG_PMM			ENVCFG_PMM
> @@ -305,6 +330,7 @@
>  #define CSR_SCOUNTEREN		0x106
>  #define CSR_SENVCFG		0x10a
>  #define CSR_SSTATEEN0		0x10c
> +#define CSR_SCOUNTINHIBIT	0x120
>  #define CSR_SSCRATCH		0x140
>  #define CSR_SEPC		0x141
>  #define CSR_SCAUSE		0x142
> 


