Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04063C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 11:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnLmuhlpJIPCopV7crhcFtkC5B2uM5pzLBY6qzCT9Rk=; b=qLyLv7hEgeIxWfKrq86omu3Vgi
	/d+1lv/xezxHef0SO82sru6ZX0/Bp7G/Voif6EVFjRArbZMQt+mKwEqD6UJ5vsEcBfGB5ooAXxYmy
	Z9WR4uVlAmcm2pPATxW1Y6xHewFpkhi4LUuZtNDQw6Xf/E6lhTJ18UGcwg7TtuWwDM/bkZXfOv+Sn
	aAcKxjBd22vb1W1f+rcaRljE24gnZEdQpUiJshrV6zkXAgGjlIHzs/t7wQYcNnWHggqmg3hks+EtC
	k0qZpcpPPO3KkNHjEhZgoATdPQNnxERMpSz8Ha7KZyLgSHpZJ348B40FkHlJdkMzBLKEXA87uyBrE
	1MSwfo2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdpL-00000004wV1-1fw3;
	Tue, 15 Jul 2025 11:28:03 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdkd-00000004vf1-2zbZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 11:23:13 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso3340500f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 04:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752578590; x=1753183390; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UnLmuhlpJIPCopV7crhcFtkC5B2uM5pzLBY6qzCT9Rk=;
        b=YBLFrBalwV3Q9fMdpHxtWaW6rGhZ9AHHpjceeTlI4p8Dx9P63+BgWJqRCEVH1q65Ds
         v4eRk2uL/ix9YDcd9Pmx5m7i1aSyReTYnfWRTif82Ve9MJV5zjjf0dFctXmUt6xwDnT7
         197Rh9BvVFeJlZonoGHhxRShNK7tMLnTCtpvby2BsmVsFGko39wJDiHuBhF52sZXbQ/s
         JY1r2rLkEG3Oc5IwaBZzEj2GLjfBdcpdDAlSqFstZgX6XWBPTkgWPm/Z6SLz2mM/PYzG
         8rMPSc4t/uEw8mqWcF1fWd81VTKmFldJ8BjtTKSP9tc2hxlHl7BIcikb0OBnHXMWgECU
         p8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752578590; x=1753183390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UnLmuhlpJIPCopV7crhcFtkC5B2uM5pzLBY6qzCT9Rk=;
        b=Egz7ZD5I8LH0fsRajvy30T11jCfmaf4tCarwbuLfmym8yHp93oA9AZiYUc6OL92fKX
         fdv/y3y/oWOp+GJC9cHhBjiG7U5MSBr489pfKf97zoSbd3n4FsN/MHZFa9hh6yw4N0hl
         V/hVQyhNhkRw0Qznzz3wUAPcELJs72FPcSkRrYEL4L9FZiO9CuZhrbq/KZXf8Wcd8yW0
         zbl7I84Of6c/q0ylZtFgcmgbsHSJSpE/N5Ru6Lq74/m4AkKhZzR1LO+FEdUxnDa2uaKf
         gxcmGyvjuzlrHdxau/iTUeiFHl6DqjYWgGWRz4ozw1awVYvYLIUkzSEJfVLMalZS87iY
         RLDw==
X-Forwarded-Encrypted: i=1; AJvYcCVuX5Ut8MnaMzIxc03v7VgfwfEL2v9HdWpAVejyOEtoREWs/h95OjHWR1FWdvs3/6bsZfQ+MmOERTpqV4ZJUwdg@lists.infradead.org
X-Gm-Message-State: AOJu0YymPk82s8lCt0hwvGQ22GRrrqdYbLNG+Pfp4ZeT3Z5FwEW6+lZr
	TovU5SZRFCVCEgtUtjSoksv5AisuPzEND7ha4BV5qHi0ZElSS5UW7z0hVtQZll4xsjvwYmRqOCB
	MHwlz4vY=
X-Gm-Gg: ASbGncu2hEfirrXRXJ6sCvW0A5bb60dlulrQ/yB4oJyMGVtZPQosLOXNGdvrfTBIi6h
	n+pw+Vuihg8ZeFPd7FIAPiptQi5ET0eNPZxh+KxzajXmGaUb1aNGL86jJ35EBpTc1zvpEU4Dg0W
	CCs23h7Kp/yRlvIb7X00L8v1R3G6eDioG8lFHe5Kh7SQ7zqt/eSejt7hqkz4pMaciVhFbPVGpnG
	CMHdypyE41j9NXSOO0HmLc3I2K5UZYjoNbjDo9DrhXN6B6dbZXnwi1ai45x6AVzCbfCb57QPOjh
	x2/kq/hGJYRHjkDAu//RBvY9MPR3rleUKcLfza0jQbiWNPH8tg1xB7bvSZkLZM+zSkA4uumivjd
	GqCSUzTGb4PfyoH4z8kRukw1wgf4=
X-Google-Smtp-Source: AGHT+IFUgsfz7Ex07AYDtS4oV0I5U/VvNBB0yugLcGoxcyClcNuZz5Pm27qy30apXU2xqduwfNqc/Q==
X-Received: by 2002:adf:9dc4:0:b0:3a5:42:b17b with SMTP id ffacd0b85a97d-3b5f18b3d0emr10973282f8f.29.1752578590122;
        Tue, 15 Jul 2025 04:23:10 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4561752340esm68968605e9.38.2025.07.15.04.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 04:23:09 -0700 (PDT)
Message-ID: <3578865d-a2c2-4cb6-9271-abf880403097@linaro.org>
Date: Tue, 15 Jul 2025 12:23:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] perf: arm_spe: Support FEAT_SPEv1p4 filters
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
 <20250605-james-perf-feat_spe_eft-v3-2-71b0c9f98093@linaro.org>
 <aHUFj9lH5bZwa4Z2@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aHUFj9lH5bZwa4Z2@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_042311_763196_F21CAD9A 
X-CRM114-Status: GOOD (  26.67  )
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



On 14/07/2025 2:26 pm, Will Deacon wrote:
> On Thu, Jun 05, 2025 at 11:49:00AM +0100, James Clark wrote:
>> FEAT_SPEv1p4 (optional from Armv8.8) adds some new filter bits, so
>> remove them from the previous version's RES0 bits using
>> PMSEVFR_EL1_RES0_V1P4_EXCL. It also makes some previously available bits
>> unavailable again, so add those back using PMSEVFR_EL1_RES0_V1P4_INCL.
>> E.g:
>>
>>    E[30], bit [30]
>>    When FEAT_SPEv1p4 is _not_ implemented ...
>>
>> FEAT_SPE_V1P3 has the same filters as V1P2 so explicitly add it to the
>> switch.
>>
>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>> Tested-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   arch/arm64/include/asm/sysreg.h | 7 +++++++
>>   drivers/perf/arm_spe_pmu.c      | 5 ++++-
>>   2 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
>> index f1bb0d10c39a..880090df3efc 100644
>> --- a/arch/arm64/include/asm/sysreg.h
>> +++ b/arch/arm64/include/asm/sysreg.h
>> @@ -358,6 +358,13 @@
>>   	(PMSEVFR_EL1_RES0_IMP & ~(BIT_ULL(18) | BIT_ULL(17) | BIT_ULL(11)))
>>   #define PMSEVFR_EL1_RES0_V1P2	\
>>   	(PMSEVFR_EL1_RES0_V1P1 & ~BIT_ULL(6))
>> +#define PMSEVFR_EL1_RES0_V1P4_EXCL \
>> +	(BIT_ULL(2) | BIT_ULL(4) | GENMASK_ULL(10, 8) | GENMASK_ULL(23, 19))
>> +#define PMSEVFR_EL1_RES0_V1P4_INCL \
>> +	(GENMASK_ULL(31, 26))
>> +#define PMSEVFR_EL1_RES0_V1P4	\
>> +	(PMSEVFR_EL1_RES0_V1P4_INCL | \
>> +	(PMSEVFR_EL1_RES0_V1P2 & ~PMSEVFR_EL1_RES0_V1P4_EXCL))
>>   
>>   /* Buffer error reporting */
>>   #define PMBSR_EL1_FAULT_FSC_SHIFT	PMBSR_EL1_MSS_SHIFT
>> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
>> index 3efed8839a4e..d9f6d229dce8 100644
>> --- a/drivers/perf/arm_spe_pmu.c
>> +++ b/drivers/perf/arm_spe_pmu.c
>> @@ -701,9 +701,12 @@ static u64 arm_spe_pmsevfr_res0(u16 pmsver)
>>   	case ID_AA64DFR0_EL1_PMSVer_V1P1:
>>   		return PMSEVFR_EL1_RES0_V1P1;
>>   	case ID_AA64DFR0_EL1_PMSVer_V1P2:
>> +	case ID_AA64DFR0_EL1_PMSVer_V1P3:
>> +		return PMSEVFR_EL1_RES0_V1P2;
>> +	case ID_AA64DFR0_EL1_PMSVer_V1P4:
>>   	/* Return the highest version we support in default */
>>   	default:
>> -		return PMSEVFR_EL1_RES0_V1P2;
>> +		return PMSEVFR_EL1_RES0_V1P4;
> 
> See my reply [1] to Leo about this function, but I think we should just
> remove it.
> 
> Will
> 
> [1] https://lore.kernel.org/all/20250707-arm_spe_support_hitm_overhead_v1_public-v3-0-33ea82da3280@arm.com/

We're only refusing filters that we know for sure are RES0. Unless 
there's a mistake, the ones that are maybes are still up to userspace to 
decide whether it wants to use them or not.

I think it could be quite useful for some automated tool to fall back to 
another behavior if it needs an event that isn't implemented.

If they were _all_ defined as maybes like "When FEAT_SPEv1p4 is 
implemented or filtering on event 2 is optionally supported" then I 
would agree it's not definite enough to bother restricting them. But a 
lot of them are known for sure like "When FEAT_SPEv1p4 is not 
implemented ...", so I don't see the harm in preventing use of those.

Or as I mentioned in the other thread if we think we can probe the valid 
filters that would be even better.

Thanks
James


