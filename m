Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382C9E6C5EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 02:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=807AMPvhV08hQjY+W9FqkSX3XWvObJEHMlCsMJUuV3g=; b=4qBD+xLxxLWTFmi1GVcRiihS+P
	oWx9LLfN38NknzeKaOF0t/uUhuQmtAxl6Gikk2XaHZmmE/xr4LfpXhZ22L8KxyuyBfiHSEoHVh6yU
	k5i90LCfWZqfbz4/YICi8+dxNJ6rRdNucFvvijq0byHTDtx7FsOmL/hvbDchUzM/mHtOcn4d4WTKy
	YWizinbcc/nZ341BldUQpvBI7oxCWiGm2li/0jyvr1xAoxKywegtDFUzwl/j7ccmi+170KDxl4jU/
	Y4BQ7iY48q6M24G4Zp4yAswbHgrrGM2fmKjowszMI5zfOc8KnLgbUaCWE4+yi115j1H+ZP3fmm8FK
	FYMwFGbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIIps-000000082a5-0u43;
	Tue, 03 Dec 2024 02:40:24 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIIoq-000000082Lq-3Jbg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 02:39:22 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-843df3c4390so166869339f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 18:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1733193559; x=1733798359; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=807AMPvhV08hQjY+W9FqkSX3XWvObJEHMlCsMJUuV3g=;
        b=l7DH4jP/JZ9MNG2vyU69y2HJoI11BEclxe3jpotcbw6dKhxuQkFaC0C8gyuWmg0TtS
         C1hPAmRle15N2dfKCzAEEBsF/aVXiBiNzUvuqwLZywFVR/6lnO9g6VsVaVcpdNNbq+DS
         isIAWErZxx7V0NS0xrFeE3bCdNe7aeFFzfMcLfjecT4zKNpR8IqaL1y4ySWU4JNZoVEK
         zlE2CLSiGwZ98e0oo40BuEBeYi6QxE+qHc36amEqo8YJdUZAmX/CFECuucuHZGOYqYMm
         GuGM6P3TkuuAxKkcy2MDTkBu+aWrlvDYfHeN8U4U9mRsPTgZrFyxrU3O4tRVZLlrxrqv
         fs4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733193559; x=1733798359;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=807AMPvhV08hQjY+W9FqkSX3XWvObJEHMlCsMJUuV3g=;
        b=b3QF4VKRUTCwnRTjQcFWrBLaVFUs8pcpYyFreRIh59v7berujXmc30uRqd7b7SPJC2
         iT8JYqL3RBXOBeSu98qOM4GN14Ok9+NQdYykzq6EW6jDP0/g9r0rP4hN+7P8QEWyXuXh
         UQXXfAtpoBQCng3KvnjaLs8NnvuLYebAJJlmULLDNAFjPCJ1gaTd+6ZwUuPua8k2j3FW
         /4ua8oCEX/qvTeXOol+wfSdgg6Ly2tU9JnOBn2zBaUpzIwjhOXfVTppH0QSQOnjzt6ei
         unV32SEXOzPs8Bifl/IVriPE2RTBF1mAcRku1DvJzm4BakOHI29WWj6wdImg17wvmWTu
         JVAA==
X-Forwarded-Encrypted: i=1; AJvYcCWe/Bohd34mwe8b/rkuSqoZyUnG+I+4/UpAG/6WvnHet6AjoYv4rIKY8icXUqFp8euOOLE9I3TFtxsC3vZ0ZYRr@lists.infradead.org
X-Gm-Message-State: AOJu0YwYBmZsLy4FHYwykoqnVKyH5tGHA1CL+2SVhOdqSA/IpHojQEyW
	Top288s+8JIbE7ydZAMmgZXMuAvr4NKWCPfuv6qc9emcuFKwRaAxDCFL3miRuJQ=
X-Gm-Gg: ASbGncu4K5akEZOBmVebQd8OYRB067uehEZLWBAOYfvkQxE6D3VrwhaEdhpvH07WAme
	xd8eLTuinL4LpjiWBBePvTBkRaBIv/c825s4IGj7Ct9vaUCUZ0p6ep5By1/UvECkntIw+TUdCcg
	yV49YYs4dgxCViCBBQ2/6BWcTxbfy7sgVkTWX4thAPBgeTSXLQ7ovumYGGMl48PHVMmJA2zSIXH
	3lCpabWDYUTU3iXT6F6p6oFPdwqzOhWvc/tZMqw7PRjoXor1yVi2poG4skVeXzFqITLl9cSy4Q=
X-Google-Smtp-Source: AGHT+IHd7BOnDkCqoWQpQn9axYX9LaHCjBDlODl0yRpMhp5QCmkH+d5KKW0iQf5wP+UEGLbQlYkP4Q==
X-Received: by 2002:a05:6602:3405:b0:841:a1c0:c058 with SMTP id ca18e2360f4ac-8445b577d49mr152097239f.9.1733193559650;
        Mon, 02 Dec 2024 18:39:19 -0800 (PST)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e230da8f03sm2387687173.17.2024.12.02.18.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 18:39:18 -0800 (PST)
Message-ID: <b48c4319-1fbc-4703-88d2-6f495af9c24e@sifive.com>
Date: Mon, 2 Dec 2024 20:39:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drivers/perf: riscv: Add raw event v2 support
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
 <20241119-pmu_event_info-v1-3-a4f9691421f8@rivosinc.com>
 <e124c532-7a08-4788-843d-345827e35f5f@sifive.com>
 <CAHBxVyEwkPUcut0L7K9eewcmhOOidU16WnGRiPiP3D7-OS7HvQ@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <CAHBxVyEwkPUcut0L7K9eewcmhOOidU16WnGRiPiP3D7-OS7HvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_183920_887185_E9CBA79E 
X-CRM114-Status: GOOD (  21.43  )
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

On 2024-12-02 6:15 PM, Atish Kumar Patra wrote:
> On Mon, Dec 2, 2024 at 2:37 PM Samuel Holland <samuel.holland@sifive.com> wrote:
>> On 2024-11-19 2:29 PM, Atish Patra wrote:
>>> SBI v3.0 introduced a new raw event type that allows wider
>>> mhpmeventX width to be programmed via CFG_MATCH.
>>>
>>> Use the raw event v2 if SBI v3.0 is available.
>>>
>>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>>> ---
>>>  arch/riscv/include/asm/sbi.h |  4 ++++
>>>  drivers/perf/riscv_pmu_sbi.c | 18 ++++++++++++------
>>>  2 files changed, 16 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>>> index 9be38b05f4ad..3ee9bfa5e77c 100644
>>> --- a/arch/riscv/include/asm/sbi.h
>>> +++ b/arch/riscv/include/asm/sbi.h
>>> @@ -159,7 +159,10 @@ struct riscv_pmu_snapshot_data {
>>>
>>>  #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
>>>  #define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
>>> +/* SBI v3.0 allows extended hpmeventX width value */
>>> +#define RISCV_PMU_RAW_EVENT_V2_MASK GENMASK_ULL(55, 0)
>>>  #define RISCV_PMU_RAW_EVENT_IDX 0x20000
>>> +#define RISCV_PMU_RAW_EVENT_V2_IDX 0x30000
>>>  #define RISCV_PLAT_FW_EVENT  0xFFFF
>>>
>>>  /** General pmu event codes specified in SBI PMU extension */
>>> @@ -217,6 +220,7 @@ enum sbi_pmu_event_type {
>>>       SBI_PMU_EVENT_TYPE_HW = 0x0,
>>>       SBI_PMU_EVENT_TYPE_CACHE = 0x1,
>>>       SBI_PMU_EVENT_TYPE_RAW = 0x2,
>>> +     SBI_PMU_EVENT_TYPE_RAW_V2 = 0x3,
>>>       SBI_PMU_EVENT_TYPE_FW = 0xf,
>>>  };
>>>
>>> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
>>> index 50cbdbf66bb7..f0e845ff6b79 100644
>>> --- a/drivers/perf/riscv_pmu_sbi.c
>>> +++ b/drivers/perf/riscv_pmu_sbi.c
>>> @@ -59,7 +59,7 @@ asm volatile(ALTERNATIVE(                                           \
>>>  #define PERF_EVENT_FLAG_USER_ACCESS  BIT(SYSCTL_USER_ACCESS)
>>>  #define PERF_EVENT_FLAG_LEGACY               BIT(SYSCTL_LEGACY)
>>>
>>> -PMU_FORMAT_ATTR(event, "config:0-47");
>>> +PMU_FORMAT_ATTR(event, "config:0-55");
>>>  PMU_FORMAT_ATTR(firmware, "config:62-63");
>>>
>>>  static bool sbi_v2_available;
>>> @@ -527,18 +527,24 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
>>>               break;
>>>       case PERF_TYPE_RAW:
>>>               /*
>>> -              * As per SBI specification, the upper 16 bits must be unused
>>> -              * for a hardware raw event.
>>> +              * As per SBI v0.3 specification,
>>> +              *  -- the upper 16 bits must be unused for a hardware raw event.
>>> +              * As per SBI v3.0 specification,
>>> +              *  -- the upper 8 bits must be unused for a hardware raw event.
>>>                * Bits 63:62 are used to distinguish between raw events
>>>                * 00 - Hardware raw event
>>>                * 10 - SBI firmware events
>>>                * 11 - Risc-V platform specific firmware event
>>>                */
>>> -
>>>               switch (config >> 62) {
>>>               case 0:
>>> -                     ret = RISCV_PMU_RAW_EVENT_IDX;
>>> -                     *econfig = config & RISCV_PMU_RAW_EVENT_MASK;
>>> +                     if (sbi_v3_available) {
>>> +                             *econfig = config & RISCV_PMU_RAW_EVENT_V2_MASK;
>>> +                             ret = RISCV_PMU_RAW_EVENT_V2_IDX;
>>> +                     } else {
>>> +                             *econfig = config & RISCV_PMU_RAW_EVENT_MASK;
>>> +                             ret = RISCV_PMU_RAW_EVENT_IDX;
>>
>> Shouldn't we check to see if any of bits 48-55 are set and return an error,
>> instead of silently requesting the wrong event?
>>
> 
> We can. I did not add it originally as we can't do much validation for
> the raw events for anyways.
> If the encoding is not supported the user will get the error anyways
> as it can't find a counter.
> We will just save 1 SBI call if the kernel doesn't allow requesting an
> event if bits 48-55 are set.

The scenario I'm concerned about is where masking off bits 48-55 results in a
valid, supported encoding for a different event. For example, in the HPM event
encoding scheme used by Rocket and inherited by SiFive cores, bits 8-55 are a
bitmap. So masking off some of those bits will exclude some events, but will not
create an invalid encoding. This could be very confusing for users.

Regards,
Samuel


