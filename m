Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2305E69E99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 22:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMzTzllEKVWPpxhY4qjTST2+tDlHfK8mSjvLBCDTSBA=; b=Ql+emePC+SJcvrtAD+tYHPf0/p
	s5fuz1H8DG9N9Oz8ZrstlMm2FW73t2NaunzOX0IF63vo7H/tUWAn+xaJqdnbz6pzE0IbbyMYd7gqo
	4YTZbWVPZ3sa5IpdDwmyW3XsAbqFdXYjn8udS2D1jV9jI/plux/13pJQRUYR/KvjCFl6nhBEbtVv/
	SuQwYqYJKoL8v3Z9bfQdo2aWyucbWcqEa5vtWEB3Kk5PPcgZZhStw0xwjNlUm9KDR67QNmbKyeP9o
	EJ4S/ZNwF0a/6P1xPO/gqrW44e77CZPjFPKre5XimlUCJMGHabv+J+P1zAdlXz+5gvUwQ8qpH3xvD
	be9WXXww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIF3z-00000007ef0-3t4f;
	Mon, 02 Dec 2024 22:38:43 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIF2y-00000007eUW-2vGI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 22:37:42 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3a75c24f447so18254515ab.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 14:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1733179059; x=1733783859; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PMzTzllEKVWPpxhY4qjTST2+tDlHfK8mSjvLBCDTSBA=;
        b=i4FmuU6jclr9jBUWf7lbSHlH9h917of0ysXsQw2yxOTXPko8lZ2zt/t+yxIxwXIF2V
         HxYa3k3tl04EAP/kTZWiYBj0LnGD/GWMCwmkHyaJAlMvK39pGJeJ+UXylOgOrrX+69/f
         VExWE5AT/L3Wrn59CYv1e4iQCSYi2WB46DdaMgJ9Rc6/EABzr+RNbYEIClef4OyFFzsV
         ngSs6XM2YSaxnXXM5oHICrEQZfzgOD7ZlohQnnd8PeV0eHLS9oreezghKPt3+1Lrj0w2
         IqnJQZSzMoSLomGTyvu0XwFDKLsqIaEGDMAoFf8sTpZje0V26RcCznNC8rGh2fxuc8xx
         30sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733179059; x=1733783859;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PMzTzllEKVWPpxhY4qjTST2+tDlHfK8mSjvLBCDTSBA=;
        b=oH3vUppFA1evcYgPi4pJFj1PW2KEuyb/ppiE+67uqZBakDLui2iX2+0eWv8JeUZfr7
         9sgZ+C6lVzfnnDTTTykpVQ6Pi56NIglmZ43SfRL2sPSZzODz26unRtroG3mSWfLTGrti
         /+b2GEQ2yWdVWPq/I8jmZEHHa6xyaboBeOxnlVcWkdqmObURzpS9p3FM/UEmN2NTxhOq
         7UB7YjKEopfuSWIAkz7F+tZPiKWjLtDRdamKZxjbSYUyoCO+5taz79NwvybKMEfFAV0I
         vrNlGYaWb7qX4qUFw4CvNPfXFEtQsw1vxEmkzjACDWCYYLM5Wey5EvJduJdH7UDIPAwy
         BWuQ==
X-Forwarded-Encrypted: i=1; AJvYcCURdViZCLjfpR2sxetxeUGznboH7BmwWQchMILZO3E7XCQOIH1ZP/PkNl6kn1673jUkeOMLOgiEoxRmXxNdZ+IU@lists.infradead.org
X-Gm-Message-State: AOJu0YzUND/jxKIVA3Xk0/7dKgi9cbccd1yL4fHR7hcBGb5CGtSuEbZj
	zcp3wMJw7aThIU1zSc2YkOdG7GYn+lfaghdv3zgLivXnOT2qYbRJpWcVm96Bsvc=
X-Gm-Gg: ASbGncu1+Ig7GOsTQT6HxfMGGXo6U+nP1sowofr3bY1QxJ5P9W2ITB+Qj8DocSBq55I
	NMU0QFs1vCOnBMN6rC1TKx9moO/3/e7VBcPQ8Udx66WktYTi/QsRF2/tpnDzYwPyZQJocLz76ov
	AHtG+Rwnk2ZyVxRg0bLm+Lx4qYThufEvDWzWbGivUU0g+NLj+Ia8uaLVOHYPNhfWe+IhpzsNlUd
	tvETyf37DTRlvd/qbhH0/GQP01GFLi6Xs/KpY+AD6xYj8WUPfk6i11AnZ9NWv6/cOw2EJlYhTs=
X-Google-Smtp-Source: AGHT+IHn6Lx4GjIuR+MSzoOaterYaBTQwRP1DNSP58qngN6mgKfAI1QR+jafEOWkEaXAab45plCQgQ==
X-Received: by 2002:a05:6e02:1a03:b0:3a7:e286:a56b with SMTP id e9e14a558f8ab-3a7f9a2fad6mr2575485ab.5.1733179059220;
        Mon, 02 Dec 2024 14:37:39 -0800 (PST)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a7ccc0dde5sm24963835ab.43.2024.12.02.14.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 14:37:38 -0800 (PST)
Message-ID: <e124c532-7a08-4788-843d-345827e35f5f@sifive.com>
Date: Mon, 2 Dec 2024 16:37:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drivers/perf: riscv: Add raw event v2 support
To: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
 <20241119-pmu_event_info-v1-3-a4f9691421f8@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20241119-pmu_event_info-v1-3-a4f9691421f8@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_143740_759883_B24254F1 
X-CRM114-Status: GOOD (  21.01  )
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

On 2024-11-19 2:29 PM, Atish Patra wrote:
> SBI v3.0 introduced a new raw event type that allows wider
> mhpmeventX width to be programmed via CFG_MATCH.
> 
> Use the raw event v2 if SBI v3.0 is available.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h |  4 ++++
>  drivers/perf/riscv_pmu_sbi.c | 18 ++++++++++++------
>  2 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 9be38b05f4ad..3ee9bfa5e77c 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -159,7 +159,10 @@ struct riscv_pmu_snapshot_data {
>  
>  #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
>  #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
> +/* SBI v3.0 allows extended hpmeventX width value */
> +#define RISCV_PMU_RAW_EVENT_V2_MASK GENMASK_ULL(55, 0)
>  #define RISCV_PMU_RAW_EVENT_IDX 0x20000
> +#define RISCV_PMU_RAW_EVENT_V2_IDX 0x30000
>  #define RISCV_PLAT_FW_EVENT	0xFFFF
>  
>  /** General pmu event codes specified in SBI PMU extension */
> @@ -217,6 +220,7 @@ enum sbi_pmu_event_type {
>  	SBI_PMU_EVENT_TYPE_HW = 0x0,
>  	SBI_PMU_EVENT_TYPE_CACHE = 0x1,
>  	SBI_PMU_EVENT_TYPE_RAW = 0x2,
> +	SBI_PMU_EVENT_TYPE_RAW_V2 = 0x3,
>  	SBI_PMU_EVENT_TYPE_FW = 0xf,
>  };
>  
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 50cbdbf66bb7..f0e845ff6b79 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -59,7 +59,7 @@ asm volatile(ALTERNATIVE(						\
>  #define PERF_EVENT_FLAG_USER_ACCESS	BIT(SYSCTL_USER_ACCESS)
>  #define PERF_EVENT_FLAG_LEGACY		BIT(SYSCTL_LEGACY)
>  
> -PMU_FORMAT_ATTR(event, "config:0-47");
> +PMU_FORMAT_ATTR(event, "config:0-55");
>  PMU_FORMAT_ATTR(firmware, "config:62-63");
>  
>  static bool sbi_v2_available;
> @@ -527,18 +527,24 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
>  		break;
>  	case PERF_TYPE_RAW:
>  		/*
> -		 * As per SBI specification, the upper 16 bits must be unused
> -		 * for a hardware raw event.
> +		 * As per SBI v0.3 specification,
> +		 *  -- the upper 16 bits must be unused for a hardware raw event.
> +		 * As per SBI v3.0 specification,
> +		 *  -- the upper 8 bits must be unused for a hardware raw event.
>  		 * Bits 63:62 are used to distinguish between raw events
>  		 * 00 - Hardware raw event
>  		 * 10 - SBI firmware events
>  		 * 11 - Risc-V platform specific firmware event
>  		 */
> -
>  		switch (config >> 62) {
>  		case 0:
> -			ret = RISCV_PMU_RAW_EVENT_IDX;
> -			*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
> +			if (sbi_v3_available) {
> +				*econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
> +				ret = RISCV_PMU_RAW_EVENT_V2_IDX;
> +			} else {
> +				*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
> +				ret = RISCV_PMU_RAW_EVENT_IDX;

Shouldn't we check to see if any of bits 48-55 are set and return an error,
instead of silently requesting the wrong event?

Regards,
Samuel

> +			}
>  			break;
>  		case 2:
>  			ret = (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_FW << 16);
> 


