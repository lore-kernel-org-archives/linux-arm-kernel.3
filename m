Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF25CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 11:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsJrMOipXi6ygDGi8uaWJElErqj//d6RNhZ0Csh1gV4=; b=L9tprV96G+sdoN0UNpr7UTD0In
	2JWn12MqvWVPtpQ0PbasrMLnwyY6im5WRLQgHrbq3lpZ5LG50I6tknuPXvRm3YlVsPGqDrusCdsb3
	p6mg1Vzt5G9+/h3XvPetFSxEGe96n79V3CGPRKvKy4yPsg66RaJUVBFE95la63pZF594CWkXkovAJ
	7SDIGTKYhCK6onD9F2K7ouhF1PwMsmXx+DcVbQGDKfcgOzIuEiowRxO+FsF+nT8gCdF4tZ6cl+OXZ
	vZMxRboklnDrRSzw2s63VrQodU1NLhuP59wZrL23ZuEfd1+tJZNzBeB5K7Jx55aY5UQ/Qt9qSBuqF
	wtyekLMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9k3-0000000DWsg-2rCz;
	Wed, 13 Aug 2025 11:34:03 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um92t-0000000DQil-3L5E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 10:49:29 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-76bfd457607so6263793b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 03:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1755082167; x=1755686967; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EsJrMOipXi6ygDGi8uaWJElErqj//d6RNhZ0Csh1gV4=;
        b=JSUAk1PfknP3RiHyyrMREuun4jBHvuVX2AFIueuJR4LCTg7H0gjgyUySzqikSnhK7z
         vr8uyDqvVpg/egkterBMNY6tW4a3/vDnRDaA5w2GMCdvKAZkRVzY7heKDMumGurSfwOw
         ZyS4rZPIQ8sO2aSvjgBOn2WV19qsD3Yv/6W5/qYd/SMTlRKg8WRR9X+Q8lr/h8CoCt2t
         Kb4AH1Y6kVDHnhtfh4e7dmvz7Pr4CSKUaj15Qs0OHrF5u//HsoWclbRzcSShQV4+qZkd
         T0DojcoaDYt08AyoSJ/jvG7SsLQDCc9cNWIA37FEkb2IdoG9Iy6jqYcFdx2eDukIx2xi
         Ds7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755082167; x=1755686967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EsJrMOipXi6ygDGi8uaWJElErqj//d6RNhZ0Csh1gV4=;
        b=CEYUiuEQiJjkzDg+JBu/vOQN9+JLy3G4zRam55lSOkR/KTVJnCjuHnAPoW4xyeI97u
         zxpiNYSE87iEtvrlhBH5lkSocCpdS3IYEoqqUL/t19kypPRw5Jdq9Kf6Np6ZQCiiWwzj
         4a39pudVVw5mdyBGpdnzW7jdqVFUcsCkjbB4cdQvHFDotLK+MMPx6hfXvwRl9Up4jsHc
         m7OuKhBHGWyC1e6tXc+OE4LE6EfQI6V90TpfIJyKqwkZSVAi3WM7to9rMUvBgSFUnO90
         xcDZ9cQOntD9MmBqZoRaQ9FFa2aNpVzz+urRj/xgn/3jeP8U6TgaVARmf5N63z2UCj0U
         fcPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRy52J/D0ZkYyTVlLsJNHlNW2HXY+hfjdO4e+vi3DgfpN1q0E/zVn3KAjWAnWGakuNwSFFw/3Mhgt7d7rcbhER@lists.infradead.org
X-Gm-Message-State: AOJu0YzN20WpvyaIg8n0PeUegc/eNMmz3vU4FfX46XazpqiJ+q1CZeq3
	ZS1XesXladBiZIKMFlKkFCKFljOfvzJfg0zUjps9NAjevIwTbMD5/7Xc9sJVO0bz3e8=
X-Gm-Gg: ASbGncvgJbV8ESOSuq/yk43acD7EYWRjxvDCktnckR90Nl/5p8Cmjl6TEnp4tOAdPgN
	hIy/ph25Gka9aEZ37K6QRt7SmSnMi2FHjCLWIoo9pT4wX9qvTF95sp7SvrzJGKa2UiniUiq8lxW
	Z3NIxdTXn6Z5gdmaelxm17gM2QRxHvrwArXjyIXIhuBMp/pM2YtT3et/WJAUzLxgRq/VRMusXzm
	W/R2YffGfb+DEKDT79QDK/OP1Bjo935911U3gc2YsB9Jqc27Davk1YLLZWhV1SktzcPt/q9vPM/
	DXnsqhcGjKgo3kgTjMoHdDRwyvDAktEL6QochKivox1VED6+2Skc6Pu5k99hMU4hw2ADnr9SPL0
	FTmc+izFp1tO0jc8BzDldpca3TVfqj3CKZRrIFUsjgu55pjOZUG+notajdnh0pM2S9OQ=
X-Google-Smtp-Source: AGHT+IE/YM3UenWxDGDj1rUFrnUNo+PQmT4iczHqOZXZc8fbF1ObrznKIkApKXpNIvM2AlxhxVfRXg==
X-Received: by 2002:a05:6a21:3381:b0:23e:19fd:e18f with SMTP id adf61e73a8af0-240a8b5e5camr4481586637.35.1755082166961;
        Wed, 13 Aug 2025 03:49:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bae2fe7sm27486647a12.44.2025.08.13.03.49.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 03:49:26 -0700 (PDT)
Message-ID: <2a9906d7-c914-4e69-8c72-ac848659650c@rivosinc.com>
Date: Wed, 13 Aug 2025 12:49:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] riscv: add SBI SSE extension definitions
To: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Yunhui Cui <cuiyunhui@bytedance.com>
References: <20250808153901.2477005-1-cleger@rivosinc.com>
 <20250808153901.2477005-2-cleger@rivosinc.com>
 <d0f8d0d8-fb46-4009-a50f-3faacf8516fc@ghiti.fr>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <d0f8d0d8-fb46-4009-a50f-3faacf8516fc@ghiti.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_034927_841723_9E086AD2 
X-CRM114-Status: GOOD (  15.39  )
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



On 13/08/2025 11:01, Alexandre Ghiti wrote:
> Hi Clément,
> 
> On 8/8/25 17:38, Clément Léger wrote:
>> Add needed definitions for SBI Supervisor Software Events extension [1].
>> This extension enables the SBI to inject events into supervisor software
>> much like ARM SDEI.
>>
>> [1] https://lists.riscv.org/g/tech-prs/message/515
>>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> ---
>>   arch/riscv/include/asm/sbi.h | 61 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 61 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>> index 341e74238aa0..e4993fb664d2 100644
>> --- a/arch/riscv/include/asm/sbi.h
>> +++ b/arch/riscv/include/asm/sbi.h
>> @@ -36,6 +36,7 @@ enum sbi_ext_id {
>>       SBI_EXT_STA = 0x535441,
>>       SBI_EXT_NACL = 0x4E41434C,
>>       SBI_EXT_FWFT = 0x46574654,
>> +    SBI_EXT_SSE = 0x535345,
>>         /* Experimentals extensions must lie within this range */
>>       SBI_EXT_EXPERIMENTAL_START = 0x08000000,
>> @@ -430,6 +431,66 @@ enum sbi_fwft_feature_t {
>>     #define SBI_FWFT_SET_FLAG_LOCK            BIT(0)
>>   +enum sbi_ext_sse_fid {
>> +    SBI_SSE_EVENT_ATTR_READ = 0,
>> +    SBI_SSE_EVENT_ATTR_WRITE,
>> +    SBI_SSE_EVENT_REGISTER,
>> +    SBI_SSE_EVENT_UNREGISTER,
>> +    SBI_SSE_EVENT_ENABLE,
>> +    SBI_SSE_EVENT_DISABLE,
>> +    SBI_SSE_EVENT_COMPLETE,
>> +    SBI_SSE_EVENT_SIGNAL,
> 
> 
> Nit but in the specification this event is referred as "inject" instead
> of "signal", any reason to change that naming?

Hi Alex,

That's mostly for historic reason, spec changed that after a few
revision. I'll update that.

Thanks,

Clément
> 
> 
>> +    SBI_SSE_EVENT_HART_UNMASK,
>> +    SBI_SSE_EVENT_HART_MASK,
>> +};
>> +
>> +enum sbi_sse_state {
>> +    SBI_SSE_STATE_UNUSED     = 0,
>> +    SBI_SSE_STATE_REGISTERED = 1,
>> +    SBI_SSE_STATE_ENABLED    = 2,
>> +    SBI_SSE_STATE_RUNNING    = 3,
>> +};
>> +
>> +/* SBI SSE Event Attributes. */
>> +enum sbi_sse_attr_id {
>> +    SBI_SSE_ATTR_STATUS        = 0x00000000,
>> +    SBI_SSE_ATTR_PRIO        = 0x00000001,
>> +    SBI_SSE_ATTR_CONFIG        = 0x00000002,
>> +    SBI_SSE_ATTR_PREFERRED_HART    = 0x00000003,
>> +    SBI_SSE_ATTR_ENTRY_PC        = 0x00000004,
>> +    SBI_SSE_ATTR_ENTRY_ARG        = 0x00000005,
>> +    SBI_SSE_ATTR_INTERRUPTED_SEPC    = 0x00000006,
>> +    SBI_SSE_ATTR_INTERRUPTED_FLAGS    = 0x00000007,
>> +    SBI_SSE_ATTR_INTERRUPTED_A6    = 0x00000008,
>> +    SBI_SSE_ATTR_INTERRUPTED_A7    = 0x00000009,
>> +
>> +    SBI_SSE_ATTR_MAX        = 0x0000000A
>> +};
>> +
>> +#define SBI_SSE_ATTR_STATUS_STATE_OFFSET    0
>> +#define SBI_SSE_ATTR_STATUS_STATE_MASK        0x3
>> +#define SBI_SSE_ATTR_STATUS_PENDING_OFFSET    2
>> +#define SBI_SSE_ATTR_STATUS_INJECT_OFFSET    3
>> +
>> +#define SBI_SSE_ATTR_CONFIG_ONESHOT    BIT(0)
>> +
>> +#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP    BIT(0)
>> +#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPIE    BIT(1)
>> +#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPV    BIT(2)
>> +#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPVP    BIT(3)
>> +
>> +#define SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS    0x00000000
>> +#define SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP        0x00000001
>> +#define SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS    0x00008000
>> +#define SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW    0x00010000
>> +#define SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS    0x00100000
>> +#define SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS    0x00108000
>> +#define SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED    0xffff0000
>> +#define SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED    0xffff8000
> 
> 
> And here you use "injected".
> 
> 
>> +
>> +#define SBI_SSE_EVENT_PLATFORM        BIT(14)
>> +#define SBI_SSE_EVENT_GLOBAL        BIT(15)
>> +
>>   /* SBI spec version fields */
>>   #define SBI_SPEC_VERSION_DEFAULT    0x1
>>   #define SBI_SPEC_VERSION_MAJOR_SHIFT    24


