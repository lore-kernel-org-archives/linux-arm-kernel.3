Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7573C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 13:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjE9NuES4ZYHcQwH+LLDtRp5dcXqipSvO8/PRsW1OSk=; b=LcZPDCe4MCuQ66OYPhpcpjFpLv
	pBIPJ2BAZiQghUeJVQGZphqb2rmcevh3Eqb9xdJbWXHKXbcsfwoYw9N7p7hNtt77g7byixah6DWyw
	DpJXzkiByQXy7sUPyZHX072gWkgUUjUxvEnX72/ijxuMy93mr3qdh+3E7Hya5jTCPpUqFGGHO6+Rs
	JqI6Z5oJSE0xktB57xgNA4YSqkRnQFx/toTmnK7H0d72TWUUGzqeBuC6Pqes3EsxMh9yjSRIYL4V1
	xYuSJMgTUp1dV+YkRU9qUK+Dak/x+1qaVsa/Dpn+UW4svcr24Jiy+bbxQt01FcvyaT6v7XIqjJVAp
	SQUMCzDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHMyQ-0000000D0My-2TVp;
	Tue, 20 May 2025 13:25:38 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHMut-0000000Czqv-1Suk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 13:22:00 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so42802975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 06:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747747318; x=1748352118; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WjE9NuES4ZYHcQwH+LLDtRp5dcXqipSvO8/PRsW1OSk=;
        b=O+JyfwKmJ/94dX8GjblF4nIk8HmUn78JsZdXVA0jEffIEKtuLb/m91ytHKFhsaq6qr
         u/QxaJCBiRyxFa9tWXGghhjNPmrOCzbFMauu4nv3/UIh4kH4H+XIKn+B0OXDAmNP1Hc9
         ykvZL8NQa3CjUbPIIFg3XoIX2Yt+fSi+WunWqvYFzINmTkkcrQP+SIxdfB44MVyFvUyj
         YXFCigoUxm/kWghF9KxucpSGx8dmeureG2YGrnDwAXA89dxed2Rqpn5q9d8QL5ajtHyt
         N+Mx/oEE0cmRQbdYmZ7Rp8esOLAJn9mVhpmiFk3byETCTv51SRxRCUzZ+X6LPhULCAbu
         +vfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747747318; x=1748352118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WjE9NuES4ZYHcQwH+LLDtRp5dcXqipSvO8/PRsW1OSk=;
        b=qwlY/leO0y3f6YyOmCAvO7wJzcbsHa1iiJztX0RThs3hq1wYM6Os/uPtFYe51fYCnE
         iHogSQTwHxOZLE1TfE/JTZnJPz343Lap1gyqQwiIDDV07kOMd8d7ZkubyKI/lOVAfEB5
         2BeGdHVlbPIJtGxZ94jdalUpU9A22iTwIa3WUnboFk+1GDuqj9dL53oWWhW3Y0In6YzJ
         u1b5Bld+/Vs+37xTbiL+6xy1DeBHh9BQvuI99rjfroVrest6n9+68rYtdIMtW8VsmU57
         oNDt3nls3rsQDDJP5Yc6JkIWmkkP8abbNKmt5tMzzhoCbznx5ewowe5g6tSL8OUbR5ZA
         hwLA==
X-Forwarded-Encrypted: i=1; AJvYcCU06KYoWqItldjhNUi7RYprYkWhXkPcTfl58a/Mmidtk0utK75mZujGG8Sy5RDPWOvLRJJTzc1UkCRSR/biXSDi@lists.infradead.org
X-Gm-Message-State: AOJu0Yyab3li1fJBo5uIqPAfYY9ZnziUs8xlprtAiQ1IMNMS8SvMxx7v
	b7T5gVa2sfQLmhcXFXP7JDqGKntwDESVBqCJaNPzXK+6hNxWdHVZ9PXE1XajWIkzkcQ=
X-Gm-Gg: ASbGncvHGYZiYLtKBJdw0qEWbGjTGnXIqCwfhO1kPPBsZlTv65H0oQVgY7aX0KWcrxq
	4HyCUVkz6cs6hKuuZjJceI1HvjRXbXv4MEBUtWxWcdMG5+cLv2koRF328pczL0ZbVupRzWtxuu3
	JlVGeNC39jbHY1vcl399otIqAtBK8OsouEfpQ+KkoismorHFYHk0YbADgqhyYVe3B+hvTtnV+O2
	MO3WCg6ixT5pIbex8nsXKehbhHnMn18NHDi/liuMyFhywYNjF+tYNxVAtZtjiGVQswkrOJ/sX8c
	N9z6T3X4pohx81Sb7cdP3muS2UQM8b7V1z9KSr5YcSPrexv14Y9uWamJ
X-Google-Smtp-Source: AGHT+IEfO+pch615avxbBD4lcuwANYfZy4jBF+ULIb5f9fJUkNFZOMIfa+edi4Ii8A7sRlYdjSjFnA==
X-Received: by 2002:a05:600d:19:b0:442:7c40:fda4 with SMTP id 5b1f17b1804b1-442f84c209dmr181938415e9.1.1747747317684;
        Tue, 20 May 2025 06:21:57 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb7fsm29898455e9.26.2025.05.20.06.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 06:21:57 -0700 (PDT)
Message-ID: <4b57da72-7f30-48f7-8458-d1f1e27a28f5@linaro.org>
Date: Tue, 20 May 2025 14:21:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] arm64/boot: Enable EL2 requirements for
 SPE_FEAT_FDS
To: Leo Yan <leo.yan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
 <20250506-james-perf-feat_spe_eft-v1-4-dd480e8e4851@linaro.org>
 <20250520110450.GN412060@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250520110450.GN412060@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_062159_411371_A66D8679 
X-CRM114-Status: GOOD (  19.79  )
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



On 20/05/2025 12:04 pm, Leo Yan wrote:
> On Tue, May 06, 2025 at 12:41:36PM +0100, James Clark wrote:
>> SPE data source filtering (optional from Armv8.8) requires that traps to
>> the filter register PMSDSFR be disabled. Document the requirements and
>> disable the traps if the feature is present.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   Documentation/arch/arm64/booting.rst | 11 +++++++++++
>>   arch/arm64/include/asm/el2_setup.h   | 14 ++++++++++++++
>>   2 files changed, 25 insertions(+)
>>
>> diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
>> index dee7b6de864f..8da6801da9a0 100644
>> --- a/Documentation/arch/arm64/booting.rst
>> +++ b/Documentation/arch/arm64/booting.rst
>> @@ -404,6 +404,17 @@ Before jumping into the kernel, the following conditions must be met:
>>       - HDFGWTR2_EL2.nPMICFILTR_EL0 (bit 3) must be initialised to 0b1.
>>       - HDFGWTR2_EL2.nPMUACR_EL1 (bit 4) must be initialised to 0b1.
>>   
>> +  For CPUs with SPE data source filtering (SPE_FEAT_FDS):
> 
> For alignment with Arm ARM:
> 
> s/SPE_FEAT_FDS/FEAT_SPE_FDS
> 
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
>> index ebceaae3c749..155b45092f5e 100644
>> --- a/arch/arm64/include/asm/el2_setup.h
>> +++ b/arch/arm64/include/asm/el2_setup.h
>> @@ -275,6 +275,20 @@
>>   	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
>>   	orr	x0, x0, #HDFGRTR2_EL2_nPMUACR_EL1
>>   .Lskip_pmuv3p9_\@:
>> +	mrs	x1, id_aa64dfr0_el1
>> +	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
>> +	/* If SPE is implemented, we can read PMSIDR and */
>> +	cmp	x1, #ID_AA64DFR0_EL1_PMSVer_IMP
>> +	b.lt	.Lskip_spefds_\@
>> +
>> +	mrs_s	x1, SYS_PMSIDR_EL1
>> +	and	x1, x1, PMSIDR_EL1_FDS_SHIFT
> 
> Should be:
> 
>          and     x1, x1, #(1 << PMSIDR_EL1_FDS_SHIFT)
> 

Nice catch. It was probably always true so I didn't notice it not working.

>> +	/* if FEAT_SPE_FDS is implemented, */
>> +	cbz	x1, .Lskip_spefds_\@
>> +	/* disable traps to PMSDSFR. */
>> +	orr	x0, x0, #HDFGRTR2_EL2_nPMSDSFR_EL1
>> +
>> +.Lskip_spefds_\@:
>>   	msr_s   SYS_HDFGRTR2_EL2, x0
>>   	msr_s   SYS_HDFGWTR2_EL2, x0
>>   	msr_s   SYS_HFGRTR2_EL2, xzr
>>
>> -- 
>> 2.34.1
>>


