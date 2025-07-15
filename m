Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36888C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 13:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iqo4mhXycGD6rw4UTAUbadK3TxDOKrzOub9ByVVv0xc=; b=fUoOQItHhgehOuQW+xWXk+RRET
	F3CNf3HCx5YZA6gnElsdJk4vdhYzPbdYFwz9PWWiMTXQKr+DBzTY4T1EnNFTv3YbHiSY8TiDI3jFK
	5nY57izT+lp+P8qzaR6NbfvKqi7GUB3+Ps7/ExthcwjHzH8Qy7++l8nVaWDSWGfQEKA0ISMO5l6Yd
	51WJAE0WFs2DDo/yOpx43f0kxxRZdOAZzGr1y9OJwtMzeJdf2X6r4rkPxp48Y2aNE4k16/uqtkIxk
	x/PK9yhO/4hUL4mTcCOrvNbi23CfPKjsAGY6MHAq9U2U//acsAHwHqCMPutcjwih0n30T1mX55CSK
	E+sd21mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgC1-00000005ILC-2ToG;
	Tue, 15 Jul 2025 13:59:37 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubf4p-000000057CL-18ZE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 12:48:08 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so49742415e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 05:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752583686; x=1753188486; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iqo4mhXycGD6rw4UTAUbadK3TxDOKrzOub9ByVVv0xc=;
        b=kJ/W2MEXOR9W6HewDyCWTjmaZxIBTjL2orJLE5nKBxPi43/zaryueEzcWKVCIwuVNR
         tprUFoL9Ijzd+0D8hUA2jei9hdTUYBGgkjsMVMVlCEHaz85xhwI1d7DVM8xFTF7ZNYln
         /hpygxmZMtVkDevojtIe2GHYpKjhtr6TEyLAb9J4kkIbKnb/NsLGMRQJbJ4DY9iCiSjx
         l5QO5gHX/U8cMGaNhZd22SsbjlK67hXWA9mGVyrIUNkBCk0puS3f/6YPintRFIvcKe1w
         pw0dm3VvBjADVJ2FEwCYxLW+9/jBW0189bSLGqSh6nPbB3Z7Y4w42Ym6iAfLSAIpBevD
         bdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752583686; x=1753188486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iqo4mhXycGD6rw4UTAUbadK3TxDOKrzOub9ByVVv0xc=;
        b=Aev9SYkLqPOTAuLZUmiMDEWCATcjvRORJJqZtkGg0uEEBa00RbHU+MPInjenTcGl/n
         bE/k0pERAnS2eYaDF7k7jKtqrPscqNwNQHt+GEyFmlph/CPkxphPNabpLydWZ1uoLHRQ
         tU3g9FqVyo9C81igO/Algepx/7td6d5zhc2xRQNeZSAaby4Ziti75SqWrZPdeEb9oc4M
         L75nye+dSFVnp+0obTxXpV3Ys5+caRIyrBLFxrmqYX52HaPZXIxrzmz0KDDFq/IEhtsD
         BWJ3Nv/Z7boQV4tufagmfb/XAwL1ePXdN57+c3TBWkEdcPx3JQ/77bmskoN7FTymALZQ
         b5Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXUuI0/EI2eTY254DwJ5io4Y9juSIoWkSvtY4DK5bl3TW87EnjPgOOPcxbmbEyb08HFJTQtL3CoLwybg92Zh76d@lists.infradead.org
X-Gm-Message-State: AOJu0YytDl5levwSg2aGBZsjhv5GrHPKq8dZQ9E8Abxzi7Rb4yq1RfFI
	zMG3OsBaW1v4vq0ftiZOyHoZEqrDl1pcZTqT/C2xkfsQJ9eGQHLk3g3VqxMWHE1y28o=
X-Gm-Gg: ASbGncvUD5rlEzvKGnLf9qXASlG4M5BmgIj3az7C1rgyxEg4YRq0E8mmdfXeQnFnZlw
	vWxxsWvJ4Ct+3WDytFr/7ns/mrqBO9vAlL57Vvr/0mpxEAmshvmEPLJopQG/ySaX89RoS2AjDV6
	oXG2cAS+UjQigH1zARkcCO4a94lrYKeoVFaFz0H4VGfgN4WF5A4uIOHV+Mz4FGHOuRvS/1PEHRE
	8eMDAcN+DC4TjmPiXuJEwQI+1PQsYFyOCyqnq632Pv8uFh3pmnblcQ5ueHjjgA8JXB6SomaIjoW
	gsFT42D5fVsD+d9gRYz51NeLAn1Nhkfj+Sd/99mibyO41s2Dcv7bc7Ru+XOrQhBN3rEcKsktMWk
	ibDQjgiy0yc7D+btheS9vxrsjRIs=
X-Google-Smtp-Source: AGHT+IHksQQexPF9xeIAPmAN5RQVQtwJAwRE0OCzaS0bMryNoBsPAdHpgVxKs40ogsxaKO2X4QSDVw==
X-Received: by 2002:a05:600c:8483:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-455bd87a4a2mr140606855e9.4.1752583685607;
        Tue, 15 Jul 2025 05:48:05 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45610c518e9sm84882505e9.17.2025.07.15.05.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 05:48:05 -0700 (PDT)
Message-ID: <04d52182-6043-4eaf-a898-9f8ccc893e5f@linaro.org>
Date: Tue, 15 Jul 2025 13:48:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] arm64/boot: Enable EL2 requirements for
 SPE_FEAT_FDS
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
 <20250605-james-perf-feat_spe_eft-v3-4-71b0c9f98093@linaro.org>
 <aHUMMk9JUdK6luLN@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aHUMMk9JUdK6luLN@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_054807_321387_B0CDDEA6 
X-CRM114-Status: GOOD (  21.72  )
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



On 14/07/2025 2:54 pm, Will Deacon wrote:
> On Thu, Jun 05, 2025 at 11:49:02AM +0100, James Clark wrote:
>> SPE data source filtering (optional from Armv8.8) requires that traps to
>> the filter register PMSDSFR be disabled. Document the requirements and
>> disable the traps if the feature is present.
>>
>> Tested-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   Documentation/arch/arm64/booting.rst | 11 +++++++++++
>>   arch/arm64/include/asm/el2_setup.h   | 14 ++++++++++++++
>>   2 files changed, 25 insertions(+)
>>
>> diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
>> index dee7b6de864f..abd75085a239 100644
>> --- a/Documentation/arch/arm64/booting.rst
>> +++ b/Documentation/arch/arm64/booting.rst
>> @@ -404,6 +404,17 @@ Before jumping into the kernel, the following conditions must be met:
>>       - HDFGWTR2_EL2.nPMICFILTR_EL0 (bit 3) must be initialised to 0b1.
>>       - HDFGWTR2_EL2.nPMUACR_EL1 (bit 4) must be initialised to 0b1.
>>   
>> +  For CPUs with SPE data source filtering (FEAT_SPE_FDS):
>> +
>> +  - If EL3 is present:
>> +
>> +    - MDCR_EL3.EnPMS3 (bit 42) must be initialised to 0b1.
>> +
>> +  - If the kernel is entered at EL1 and EL2 is present:
>> +
>> +    - HDFGRTR2_EL2.nPMSDSFR_EL1 (bit 19) must be initialised to 0b1.
>> +    - HDFGWTR2_EL2.nPMSDSFR_EL1 (bit 19) must be initialised to 0b1.
>> +
>>     For CPUs with Memory Copy and Memory Set instructions (FEAT_MOPS):
>>   
>>     - If the kernel is entered at EL1 and EL2 is present:
>> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
>> index 1e7c7475e43f..02b4a7fc016e 100644
>> --- a/arch/arm64/include/asm/el2_setup.h
>> +++ b/arch/arm64/include/asm/el2_setup.h
>> @@ -279,6 +279,20 @@
>>   	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
>>   	orr	x0, x0, #HDFGRTR2_EL2_nPMUACR_EL1
>>   .Lskip_pmuv3p9_\@:
>> +	mrs	x1, id_aa64dfr0_el1
>> +	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
>> +	/* If SPE is implemented, */
>> +	cmp	x1, #ID_AA64DFR0_EL1_PMSVer_IMP
>> +	b.lt	.Lskip_spefds_\@
>> +	/* we can read PMSIDR and */
>> +	mrs_s	x1, SYS_PMSIDR_EL1
>> +	and	x1, x1,  #PMSIDR_EL1_FDS
>> +	/* if FEAT_SPE_FDS is implemented, */
>> +	cbz	x1, .Lskip_spefds_\@
>> +	/* disable traps to PMSDSFR. */
>> +	orr	x0, x0, #HDFGRTR2_EL2_nPMSDSFR_EL1
> 
> Why is this being done here rather than alongside the existing SPE
> configuration of HDFGRTR_EL2 and HDFGWTR_EL2 near the start of
> __init_el2_fgt?
> 
> Will

I thought everything was separated by which trap configs it writes to, 
rather than the feature. This SPE feature is in HDFGRTR2 so I put it in 
__init_el2_fgt2 rather than __init_el2_fgt.

I suppose we could have a single __init_el2_spe that writes to both 
HDFGRTR and HDFGRTR2 but we'd have to be careful to not overwrite what 
was already done in the other sections.


