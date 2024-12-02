Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0EDE69E9A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 22:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fURT0toHjcy+ckEXrUmwcruMUsZPdjbEVGK7GwErbNE=; b=Asg+ip6E30lScgwkfLcZDnp1wS
	GDddEM+ze5HT3qt0Ao9nO6M7BNtoBgTsd2t+A4lmDuA+4OM51Yuiw6nYUr9qrlojXTrBOv9nsEZ0I
	qvhb2VoJs7nuPavfcRSixsSbPj0IcvARkxS9+fI7rSpGyeD47MoEul2ENiI4+vCRrQw54JdnItbaw
	9U81v3PWcifMNm7lnSwRmUZeZWtNBrHSowDKrnKZ1a47OtQwB9qzvU4OZLaoxCyofjG/kRdDuugxk
	lffnApmNYtPZvGIaHKktqacMP9YVum9l+eExZxCECpPSNg6wAqhtZWhm6HmJ1GmwEtEntLLB158L5
	8CLwJt1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIFF8-00000007fWK-04Do;
	Mon, 02 Dec 2024 22:50:14 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIFE8-00000007fNG-1ri9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 22:49:13 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3a74d9aeb38so16406535ab.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 14:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1733179751; x=1733784551; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fURT0toHjcy+ckEXrUmwcruMUsZPdjbEVGK7GwErbNE=;
        b=HEGLI+QT6Rw6p/k/kQK/NV7rtEXkvcrNDsZlEtcueHKMi5B3VRQyj6cAMl1XyWrkb9
         T+sNHcglhePeutlJ2AMFzMzcZmdTcO46pykQ9AjCsZda8rBsBIa/YzWV8j/6+Nsr8y6C
         eByWjHkA5Np0TyVATUa45BEnPggkbp1qmtCA+Z1JkR4SF/dFuOPJ43xyTMBlh167wYjK
         YnIcN4OEijHjq88hQ8sZJFCQkQRYa/qmF2MSgr5rHmS0GyZjvEPbL/YaCpK7YrgjW2/M
         tFjRRbROP1AY0WLe7v/FH8+aqZb+RWMWvjjZV7L2CKgJ4pTw26HsQn3o5ohcJlzE9HOm
         O83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733179751; x=1733784551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fURT0toHjcy+ckEXrUmwcruMUsZPdjbEVGK7GwErbNE=;
        b=LCW6AYuXveBNIlTzOs6OuzopI3XufCKrxQ1K8/Khp7yowkTB7SPcvQ4o/zLNB01JCO
         gAoOc8GZahjXnHuWWnQEHZVDyCEMqpOYNzYy+Lpq//gtWFI41n1uO+SjMF1GeHKhgAJC
         h7rhwGxRGey5XaM+iuRZVtu4/+GEXZTffkhMIZU6gaeVLdAQzdYeqHPkdTeBVL93y39u
         nas+2IYbeCRc42dtU+Zi3rYQKvOBfmeO09K20yrgHW7x55Pz9Ltr1EleiobJuqPv8PJG
         bhUe/HldwKuUYPJYs29ldwuAHYIpKvFVUlyQz/pJLAHostXUiu4Ippk1/vSqrauA2dpE
         VuqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnGdwiokvb9/UneNHBNPVgLOUhSKcabXP29teKdZ9//NjdCdvvMMOl7EBPZmIvQDNRYjcnnTFCPVR3Imz3I96D@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7YLu33rIXeVL5ujYQ8gP5PtzcorfwFzFwMaz7HjBOzR51VLeh
	buombuApE7zW+ayxV9EcsNNqTp1PHSzjIMIp/T2Ai4hFRZ8IJ/FxhaVrPglfbLI=
X-Gm-Gg: ASbGncvh8Y7gJzBh+qOpmvW1mqkdRqlOtpm8BuSgqKxTibwE2aPag93Ntqmt5BdgzEt
	QFXNT2MQH1KmQ8L+zvBeDIS/MLKlw8IO2jcVyfiWSYWrPovPzQTHuvo8utI2bQfOzr8l3OOBdeM
	tzQyh582vcJV3DJamz6tPoD0mkvwJOrwP63nO0vbXf3lb+AdAxMgcH0ElXqXIe/io4ds8zr59PG
	SntZhKJNJBK7EzKK7/daydv9ed7IGXJEQrCG0vktYNvtiWKVwFL6gtGD0SwcYUat4JhyoKegKk=
X-Google-Smtp-Source: AGHT+IF9tXYZOtmonlaAqjdjkiR3RpZurv0DzZ0bFu7NZtqj+dCVIe1TaFCSnbY1pyQjqWZh355Bpg==
X-Received: by 2002:a92:c54f:0:b0:3a7:8720:9de5 with SMTP id e9e14a558f8ab-3a7f9a36198mr3019085ab.1.1733179751641;
        Mon, 02 Dec 2024 14:49:11 -0800 (PST)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e230e5f1easm2357604173.95.2024.12.02.14.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 14:49:10 -0800 (PST)
Message-ID: <0a4a569e-dfab-4aed-90df-2fe9719a3803@sifive.com>
Date: Mon, 2 Dec 2024 16:49:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] drivers/perf: riscv: Implement PMU event info
 function
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
 <20241119-pmu_event_info-v1-5-a4f9691421f8@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20241119-pmu_event_info-v1-5-a4f9691421f8@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_144912_503713_0DFB85B8 
X-CRM114-Status: GOOD (  31.06  )
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
> With the new SBI PMU event info function, we can query the availability
> of the all standard SBI PMU events at boot time with a single ecall.
> This improves the bootime by avoiding making an SBI call for each
> standard PMU event. Since this function is defined only in SBI v3.0,
> invoke this only if the underlying SBI implementation is v3.0 or higher.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h |  7 +++++
>  drivers/perf/riscv_pmu_sbi.c | 71 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 78 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 3ee9bfa5e77c..c04f64fbc01d 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -134,6 +134,7 @@ enum sbi_ext_pmu_fid {
>  	SBI_EXT_PMU_COUNTER_FW_READ,
>  	SBI_EXT_PMU_COUNTER_FW_READ_HI,
>  	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
> +	SBI_EXT_PMU_EVENT_GET_INFO,
>  };
>  
>  union sbi_pmu_ctr_info {
> @@ -157,6 +158,12 @@ struct riscv_pmu_snapshot_data {
>  	u64 reserved[447];
>  };
>  
> +struct riscv_pmu_event_info {
> +	u32 event_idx;
> +	u32 output;
> +	u64 event_data;
> +};
> +
>  #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
>  #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
>  /* SBI v3.0 allows extended hpmeventX width value */
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index f0e845ff6b79..2a6527cc9d97 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -100,6 +100,7 @@ static unsigned int riscv_pmu_irq;
>  /* Cache the available counters in a bitmask */
>  static unsigned long cmask;
>  
> +static int pmu_event_find_cache(u64 config);

This new declaration does not appear to be used.

>  struct sbi_pmu_event_data {
>  	union {
>  		union {
> @@ -299,6 +300,68 @@ static struct sbi_pmu_event_data pmu_cache_event_map[PERF_COUNT_HW_CACHE_MAX]
>  	},
>  };
>  
> +static int pmu_sbi_check_event_info(void)
> +{
> +	int num_events = ARRAY_SIZE(pmu_hw_event_map) + PERF_COUNT_HW_CACHE_MAX *
> +			 PERF_COUNT_HW_CACHE_OP_MAX * PERF_COUNT_HW_CACHE_RESULT_MAX;
> +	struct riscv_pmu_event_info *event_info_shmem;
> +	phys_addr_t base_addr;
> +	int i, j, k, result = 0, count = 0;
> +	struct sbiret ret;
> +
> +	event_info_shmem = (struct riscv_pmu_event_info *)
> +			   kcalloc(num_events, sizeof(*event_info_shmem), GFP_KERNEL);

Please drop the unnecessary cast.

> +	if (!event_info_shmem) {
> +		pr_err("Can not allocate memory for event info query\n");

Usually there's no need to print an error for allocation failure, since the
allocator already warns. And this isn't really an error, since we can (and do)
fall back to the existing way of checking for events.

> +		return -ENOMEM;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
> +		event_info_shmem[count++].event_idx = pmu_hw_event_map[i].event_idx;
> +
> +	for (i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
> +		for (int j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++) {
> +			for (int k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++)
> +				event_info_shmem[count++].event_idx =
> +							pmu_cache_event_map[i][j][k].event_idx;
> +		}
> +	}
> +
> +	base_addr = __pa(event_info_shmem);
> +	if (IS_ENABLED(CONFIG_32BIT))
> +		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_EVENT_GET_INFO, lower_32_bits(base_addr),
> +				upper_32_bits(base_addr), count, 0, 0, 0);
> +	else
> +		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_EVENT_GET_INFO, base_addr, 0,
> +				count, 0, 0, 0);
> +	if (ret.error) {
> +		result = -EOPNOTSUPP;
> +		goto free_mem;
> +	}
> +	/* Do we need some barriers here or priv mode transition will ensure that */

No barrier is needed -- the SBI implementation is running on the same hart, so
coherency isn't even a consideration.

> +	for (i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++) {
> +		if (!(event_info_shmem[i].output & 0x01))

This bit mask should probably use a macro.

> +			pmu_hw_event_map[i].event_idx = -ENOENT;
> +	}
> +
> +	count = ARRAY_SIZE(pmu_hw_event_map);
> +
> +	for (i = 0; i < ARRAY_SIZE(pmu_cache_event_map); i++) {
> +		for (j = 0; j < ARRAY_SIZE(pmu_cache_event_map[i]); j++) {
> +			for (k = 0; k < ARRAY_SIZE(pmu_cache_event_map[i][j]); k++) {
> +				if (!(event_info_shmem[count].output & 0x01))

Same comment applies here.

Regards,
Samuel

> +					pmu_cache_event_map[i][j][k].event_idx = -ENOENT;
> +				count++;
> +			}
> +		}
> +	}
> +
> +free_mem:
> +	kfree(event_info_shmem);
> +
> +	return result;
> +}
> +
>  static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
>  {
>  	struct sbiret ret;
> @@ -316,6 +379,14 @@ static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
>  
>  static void pmu_sbi_check_std_events(struct work_struct *work)
>  {
> +	int ret;
> +
> +	if (sbi_v3_available) {
> +		ret = pmu_sbi_check_event_info();
> +		if (!ret)
> +			return;
> +	}
> +
>  	for (int i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++)
>  		pmu_sbi_check_event(&pmu_hw_event_map[i]);
>  
> 


