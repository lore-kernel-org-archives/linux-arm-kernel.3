Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7954C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 08:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUL9QUi3QxO33JzaB+qq5zCH3BOr2BvD/SOLCCy++Kg=; b=UMKVUD+ASuZIGc8oVgGDPzJw7h
	SWoQ6vn03d/PRuduSUXdnnJ5l4RkbhrD34cR84h8ar+W84kfwfj7sHO3GNver/E2yDj+gOiyHW+O+
	C+8+ylU82FIrDFnIVDjtP2oZ3C42OPlqRRmJdtzLGSh2uW9CVqCrHvXITQ1qcMAxsCEvyKmcAfCzA
	USVyaoNYetZylJMJe8DaPJbj+AWHOuItP5009r7VExrCDpDXhKwMCBU6MfV700ndUCLnytIt0HIJE
	NH0VRcnI+ZeVz97Z8DhEFYovaS+LzLfI6exP7jQfkd9nffMgCx2UV0L7d/SDyLMJK5dH1mihkiy/B
	foY4CIIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGvjc-00000008Ksw-3aAU;
	Mon, 19 May 2025 08:20:32 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGvg7-00000008KIV-21Zd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 08:16:56 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a3758b122cso142687f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 01:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747642613; x=1748247413; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kUL9QUi3QxO33JzaB+qq5zCH3BOr2BvD/SOLCCy++Kg=;
        b=H87COkevfJIw1vg6jQ1eyiMLhLjqc42wSJSk8KigJY6vrHePS2MKQg6kVrvo+NM1bu
         BGQfLCHjyS9+aoC/cKT9luFgghOtf22H2OfkXJNql0MhFaRtXf5MPbGOS+pxcena2ldS
         EbluHpQMzeyCCOcna/wRQWp3rE6BDoL9D81EQtvZpjTloD8bE2rfNfyUBGsITG8sMabw
         5X1GdN4lw/VMq0UNyJo6LHrYodVUDS55TM8HqejTYqZqJBECcuDvtKGnkwmwPf8Se25B
         ZBuSDQmQfwjJ5W/cn3wNLm037zQ/ajQmH5VPy++E14i7Qqn3eIE6dZNFDmOavmxJIHJn
         QgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747642613; x=1748247413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kUL9QUi3QxO33JzaB+qq5zCH3BOr2BvD/SOLCCy++Kg=;
        b=IQoivVXdkAAs/K83hJBWZkEQWw7VE+Zi162qXuaBHegBBrWXmD51TyxkLls8+0LYCx
         Lj4p72EIXNO20dnTDASRH1Wa9Tc7v0ZZ1fb8YA5IIuNvLBkoH8gG2+qrR3VPSl3ZyWHS
         fk8+pc59mtHoL12H1mtqDYjf8Pol8iBzxSGB9um1avP/PR8Ou5Tzc1qY9UF22gOndxUn
         PWxjHZxGAVtwnGbiNcF9bxsPZYYTWZyTsfwZ/DhotwWLWlysrGkoOxMd8dFhaAmimpx+
         rdjVfEBMUU5yN95o7/QFYXfPY4TUBtEapI3BWHTz/UrmLPEbDP4lyyHn2mJ0LVd3WT46
         DWvg==
X-Forwarded-Encrypted: i=1; AJvYcCWrsTQi0rOWHq3XUwAouPHBEz7Z12yJlx65tucFsVEKPx/r9jcqErUBPrOetN6elY8yxJ0QhrVsjeI3oVRCfZ0X@lists.infradead.org
X-Gm-Message-State: AOJu0YxMl2KJUN11oYZqayEmGg+8hwdYSf1Iw1pEVjohwlJRQiW7P5lp
	UNUps/RCz42u+CwHUbuBahAEBPR/flCLipqZQcmj8KJFvIscl5Th/nYvj40+3j2yWLM=
X-Gm-Gg: ASbGnctBKEMKPP2vAyzrjf0KQu6cIg/lsGPGioWEGkIYeq1o1OCKWmLPNlKM3Defa8S
	OAnbe5zrwYKbahxP6ufIjZpH5stnuK1+Gy8E3ccf2dd6pnXWOLPEnNPHxOF4P0p6ypXPyojXRxB
	1v0uQt6nEMJo4wObbycUlhvq+8XEIGujX9p7GQhcFqGF7ueZhK1E46W6LvXe2rRt1YHPO8S9suY
	QuiiDe3K3KOk41uAnIX2vOZANkiDKV0rlDqLoj9W4aTGb2u3Oz6ds0PSIFfKnUgDtiuVd2A6kZ/
	aq9T+XsUH05871d+uoBRoLMjdzlF625sMVG0clSWb4bpgTATbLfMQuJw
X-Google-Smtp-Source: AGHT+IHSO1KA4bNQxfQbc4te6baDy9fxE6Gyb6malS9UHm7L4qyXIFr1J9YNRKOGPiR0u203LvVC6Q==
X-Received: by 2002:a05:6000:2911:b0:3a3:6bc1:f1e7 with SMTP id ffacd0b85a97d-3a36bc1f466mr3082730f8f.52.1747642613267;
        Mon, 19 May 2025 01:16:53 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd4a0a5dsm132048605e9.0.2025.05.19.01.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 01:16:52 -0700 (PDT)
Message-ID: <8518b861-326d-472f-b6ff-3cda41517587@linaro.org>
Date: Mon, 19 May 2025 09:16:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] arm64: sysreg: Add new PMSIDR_EL1 and PMSFCR_EL1
 fields
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, leo.yan@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
 <20250506-james-perf-feat_spe_eft-v1-1-dd480e8e4851@linaro.org>
 <8634d4fwnb.wl-maz@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <8634d4fwnb.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_011655_530824_AF21D775 
X-CRM114-Status: GOOD (  14.45  )
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



On 16/05/2025 3:38 pm, Marc Zyngier wrote:
> On Tue, 06 May 2025 12:41:33 +0100,
> James Clark <james.clark@linaro.org> wrote:
>>
>> Add new fields and registers that are introduced for the features
>> FEAT_SPE_CRR (call return records), FEAT_SPE_EFT (extended filtering),
>> FEAT_SPE_FPF (floating point flag), FEAT_SPE_FDS (data source
>> filtering), FEAT_SPE_ALTCLK and FEAT_SPE_SME.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   arch/arm64/tools/sysreg | 26 ++++++++++++++++++++++----
>>   1 file changed, 22 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
>> index bdf044c5d11b..80d57c83a5f5 100644
>> --- a/arch/arm64/tools/sysreg
>> +++ b/arch/arm64/tools/sysreg
>> @@ -2205,11 +2205,20 @@ Field	0	RND
>>   EndSysreg
>>   
>>   Sysreg	PMSFCR_EL1	3	0	9	9	4
>> -Res0	63:19
>> +Res0	63:53
>> +Field	52	SIMDm
>> +Field	51	FPm
>> +Field	50	STm
>> +Field	49	LDm
>> +Field	48	Bm
>> +Res0	47:21
>> +Field	20	SIMD
>> +Field	19	FP
>>   Field	18	ST
>>   Field	17	LD
>>   Field	16	B
>> -Res0	15:4
>> +Res0	15:5
>> +Field	4	FDS
>>   Field	3	FnE
>>   Field	2	FL
>>   Field	1	FT
>> @@ -2226,7 +2235,12 @@ Field	15:0	MINLAT
>>   EndSysreg
>>   
>>   Sysreg	PMSIDR_EL1	3	0	9	9	7
>> -Res0	63:25
>> +Res0	63:33
>> +Field	32	SME
>> +Field	31:28	ALTCLK
>> +Field	27	FPF
>> +Field	26	EFT
>> +Field	25	CRR
> 
> These are described as enumerations in the JSON file (see [1]).
> 
> 	M.
> 
> [1] https://lore.kernel.org/all/20250506164348.346001-7-maz@kernel.org
> 

So they are. I'll take your commit and double check the other new ones 
against the json.

Thanks
James


