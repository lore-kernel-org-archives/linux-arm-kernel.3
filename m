Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6440C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 09:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXXMkVVqt6xR4uvFmH/ZMvt5aZcIpXe/yS2Xx6mdmS8=; b=iIbpPXCOAvRmjuD5t9DuTS6TcY
	O9FNs/8L5TaVrmtFxCRralMoP6ZMdBSJ3v3XIicrLZEBfV1jp36LYMhy2bmapR2+y2cE4qI6Dg0hn
	fPFVqaw156L6busFW0Q1S6KrHJyuF25bHWSAFBIIZ7w+39VIBRaaYmJcEzlFT08babzbJzeYt2RXe
	3l5qrDC+M1yW4xbYDubOwQ1u4iVKk29Ui1PVJFN1PP1oJDia3fhoxfd1YSYjwNkmiLAO6YfnlzP1l
	xT8wvnzpt3qF+HiIbNpHkr1gZJ69aco2ISR+W+N0nSFQCBlfbqp5K3ABfS8NjujPlHtB2A84O0tva
	hmp70+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPefH-0000000CsqP-32lZ;
	Thu, 12 Jun 2025 09:56:07 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdWF-0000000Cfy1-0K5a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 08:42:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so626346f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 01:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749717761; x=1750322561; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MXXMkVVqt6xR4uvFmH/ZMvt5aZcIpXe/yS2Xx6mdmS8=;
        b=irIMl0GUK6ZmOlmHHciyvLDGvYmo2Am9qAcK3Xm65eD0A9Gf0DvsFruqsO5doKv0nE
         gfWHGdc78ttKeEM77gfBCMdJu+n/KUrEXztLWIeHrdfeYsNCYRme+qRzt/x1jPbiYnY1
         +yQTS02jSyANSExXAp3c100I0Hz3MzF7k6As1R5hlKJsbPwnpA1yjMS+yTOANqMUv9vL
         lqay0hj7hYQeJABQq3NcAe6Lfm7pGclDy1ykpmpSP24k+u+KMHd6qzsD/lyQ096Ti2UM
         Fqt4x75eENqYOY2xacpLA82/Z5SD4hshH+vXGYn7+8EBj5ocVl49KLDamTDDZzfs2aU9
         qUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749717761; x=1750322561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MXXMkVVqt6xR4uvFmH/ZMvt5aZcIpXe/yS2Xx6mdmS8=;
        b=IuZrMgSzeg3E/4NcUHep5mdyx2X4tTUEwE4FwwwxlTlne81/wqwtWkeHQ3ujRPvmn+
         qqOp9PziNkKx7mBDzJs4QcajE0j+cko0PA2a3F/up03x6w0W1yVJKOwKSN4hcQLKX1sY
         R4ziqfdF5BVL9jIeb1jBIPDFQV848EzbPQwhm4wIXnXK5H52IqjSOrdUqRw+zEuqWF2e
         fUcR4BxPAfTIclJNUk1KWMgrDsrDsJMNXURDEJ6bpytfBrYFq6yN48ov+QhUnl7iyFiO
         hCZk5wpncytPoPJIV8Eu+03V//vIXhntzpLWj/rbVhrEYN9PEDGK8Gu8vpVxdEBmIYnF
         jREg==
X-Gm-Message-State: AOJu0YzWFLMmH9PHsk4K9Yqvas0gH9/+NM6W7AeJgWzHpqJOiTDqP95P
	13iXPv+nESuEyE8mDH5ELqWjzJ5kf+X8EncsaHN9/4GpwRFR1/94M3+Zay3rm++Jlvs=
X-Gm-Gg: ASbGncs64VED0lB1vGAE80RQr1tKyd+fMywl6pO8DZcpYgeswpv85jmkCsne+E9PTBY
	s8X9MW465hzdLP4G0dgG8fT9HcdooxVTRJ/BaX/wdTT4wnQHou4oW1pXEEfRJ+yGWHmGVOHizap
	xEAgf8u/dvX/d4OY+ys5vtcfPerjeYzCDyK5yGgTloysyqjK8z7jkyKrXQdp41/xpAzerEf2O+7
	P712HPBbY2VSKKZuejom8PFG28EiOhZYz5m4QWin6q488W8ZNh2pmkhsA27l4KMye0+8tapFlFQ
	nK/P5Lvc/4tRp86HPUGLK8kxiOQJGrPGVe0IriNXFdDitBIq74gXRnrzysNLYQugll4=
X-Google-Smtp-Source: AGHT+IHRFPEqNYv7rElVTsM+/O2Bep9AczSNG7lUyxK1KtND+mFBsYtU9egUwJboJsW4Mk1sSOYf4w==
X-Received: by 2002:a05:6000:2411:b0:3a5:2fb2:35ac with SMTP id ffacd0b85a97d-3a5612946a2mr1683069f8f.24.1749717761081;
        Thu, 12 Jun 2025 01:42:41 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5619ab86dsm1296971f8f.44.2025.06.12.01.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 01:42:40 -0700 (PDT)
Message-ID: <7b080e97-375d-4521-b167-d0c4256dc464@linaro.org>
Date: Thu, 12 Jun 2025 09:42:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] perf: arm_spe: Support FEAT_SPEv1p4 filters
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
 <20250605-james-perf-feat_spe_eft-v3-2-71b0c9f98093@linaro.org>
 <10f63976-afa7-4e1c-bec1-d9f2447d9c13@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <10f63976-afa7-4e1c-bec1-d9f2447d9c13@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_014243_130416_F5ED6789 
X-CRM114-Status: GOOD (  25.69  )
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



On 12/06/2025 8:35 am, Anshuman Khandual wrote:
> On 05/06/25 4:19 PM, James Clark wrote:
>> FEAT_SPEv1p4 (optional from Armv8.8) adds some new filter bits, so
>> remove them from the previous version's RES0 bits using
>> PMSEVFR_EL1_RES0_V1P4_EXCL. It also makes some previously available bits
>> unavailable again, so add those back using PMSEVFR_EL1_RES0_V1P4_INCL.
> 
> Just wondering - why cannot all the new applicable filter bits be added
> explicitly for PMSEVFR_EL1_RES0_V1P4 without using exclude and include
> intermediaries.
> 

They could but there would be a lot of duplication. Each version tended 
to add only a few bits to the previous version. Also for consistency, 
they were already defined in this way. I didn't think there was much to 
gain by redefining the whole bitset just for this one, it's probably 
going to look just as messy.

>> E.g:
>>
>>    E[30], bit [30]
>>    When FEAT_SPEv1p4 is _not_ implemented ...
>>
>> FEAT_SPE_V1P3 has the same filters as V1P2 so explicitly add it to the
>> switch.
> A small nit - should FEAT_SPE_V1P3 addition be done in a previous patch
> as it is an already existing thing ?
> 

It's related to this patch because I change the default case. Before 
V1P3 hits 'default:' and returns PMSEVFR_EL1_RES0_V1P2. But now the 
highest supported is PMSEVFR_EL1_RES0_V1P4 for the default case so I 
need to add a case for V1P3 to keep it returning PMSEVFR_EL1_RES0_V1P2 
filters. There's no bug.

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
>> +	(GENMASK_ULL(31, 26))> +#define PMSEVFR_EL1_RES0_V1P4	\
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
>>   	}
>>   }
>>   
>>
> 
> 
> 
> 


