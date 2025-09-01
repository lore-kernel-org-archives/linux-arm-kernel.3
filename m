Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077B2CA1006
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 14:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LoSJIL4KWhDGVADj7RHQlobVtqqX19ExJc3z0hs3VMY=; b=1h66MscMU7wf2tnSUy+fOIdC4y
	MSugfYxyVxrDESWXlJFzm1+o7+aFG9RfyceD6yMFiCVGVJ4Y4B+RcapU7I58j4ZwxlkxU1nQ+C6XH
	7ft/ANw1X5QoUNIteESjByoILLMu/Pnl7zkFbwWyaNT8KlqgWxs51sj2z1lNpn1+shDeZA4wGn1Xb
	hqXmnPxUZA5SEzX45oimvLrvlL4Z6FzU9zZ6yqTXt85mq6VpWzZpJYI9KWYHMXbtcsO1fdAJ5N9t5
	uYtv/0QXkIWb90OfAsjLRB3Jo3SrbK4piPWrXHo0EMQXoU6Y6Z+u9NpeqhPosp3x6MBxVG54wqz/k
	xG2xvf2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5oo-0000000Ct5p-2Zgc;
	Mon, 01 Sep 2025 14:47:38 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3Ya-0000000CNMA-1AGF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:22:46 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45b7d485173so26302605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756729363; x=1757334163; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LoSJIL4KWhDGVADj7RHQlobVtqqX19ExJc3z0hs3VMY=;
        b=zNqfNu5Y+R5xWptRy/Y+hztIYSs7u0tF5xTdcbSH7K1eN9rCe6KAyiHlHopUSSae3C
         1GnYSpn2GAPtuide+Dk4/AubW4BlKSXyIT3ddvYDioNAjun3rnaiggcFSkGugd86LcOO
         +V5e304Ao8z7Eq7FGkY7OyP0OM/cly78a35AIUG78uhbE+DgMHABgfxPzwT1iwunw2u9
         +89dkwRLQmEjuH+TR1BHpEIwfVvrRecehd+WPZrzEPj/AOKakJfNPnbFWPG/9V9SYqnx
         22RVWvXuUxmmIGDbpGFrMeFg1eilYTfgXjgcfP5x/TiYhC8PjwqdKffR6P1zZ7UIJB3C
         1x1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756729363; x=1757334163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LoSJIL4KWhDGVADj7RHQlobVtqqX19ExJc3z0hs3VMY=;
        b=F+0K5UaLjQkAGgtqUpCgta5MyqK7X0iXyH390g9WWFNGcnfrJDcpgfiKIxWZTcg/rm
         x3shka2Zi5vOOvL1QcThfFWCoCmZ1KEGibUDh8gtEMRWvEJi7mQCbpvBc9vt2D1+R7NT
         aT7zMilCW276l9V0Jr/732k/8Qdmh296tvmag0jeInTkLsZl/ARnYYFiplieFPoftDZi
         ti74QX/5tBNCOORxRYGM0fTI3fPwoIEycEvy73Vcu9X/x0jEWpuCHE5443y0G2LDfcsD
         MQJAvuVeZuSHwuF0AzH/rQjx6nOrqalkXwjyL0cJtjG3ak1ozNYN5YtzfuLOTuXH899M
         b2xw==
X-Forwarded-Encrypted: i=1; AJvYcCWe5mc/h7kDunIfMQzA6iInxvtiYpJMQfl0XGgxlMGwEMJvscP2rEw4zNljNcC0EQKgKm/SlKh2MVVzp2MtUowh@lists.infradead.org
X-Gm-Message-State: AOJu0YwsuTWMur5vOKRMJgh5+/TU4H8GZoIFKbSmAaTDRq8rxIpoiV1C
	oX6MfVUB5M7F3AiCHdVeRZCZ8KFqGYAHHjkEn/q+YyQVhVay2XnwC+pCEvn6kx1KVzE=
X-Gm-Gg: ASbGncsNyugZROC8aybvxf5Y1JiAyewEtCES2BR0SrDSJOT0VHm4bERgGwaTGWUi0Yd
	SdCutK9ZsRSn2lJlDWlMy67PzO2zccIXMESqtuZHBu9HIOv83IsD38PPlyrti5wvc1YMdPfxHKP
	Dr8cgcMvagHzV/HPGINpbqy8n8Gs7p87iLCcsPtMQhhQedtuhfKD41QZ5kOpZmg8zcNh4H8geH5
	E4tG3o9LaADMsGu6nFeIcqZs/Zcwk0UX4LsJuRHJc7fghpSVyDG/Ty0h8tuRQK+zHJgOA18S37v
	dU393U+NqHx9wMaVIfRUQoJtXbiKfPQaCYxfpAeRNamoLFcFiZOo+zqEs/Y7qQ2Q2yR2rAZ1mV+
	MEG9aeF3Nwx+v+vlp1DmOnXdTlpIy1yiTUc1RN2NFdlLeYvy+
X-Google-Smtp-Source: AGHT+IEUYIop2eCnZ9cDKO0ghaVfpBEoRkqiBiGK9LUPFsTbQpLi8gzA5x26B8+fFer989zfNL4Sag==
X-Received: by 2002:a05:600c:4f41:b0:45b:8b3e:9f7c with SMTP id 5b1f17b1804b1-45b8b3ea0e1mr33370165e9.19.1756729362553;
        Mon, 01 Sep 2025 05:22:42 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87abc740sm88325035e9.7.2025.09.01.05.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 05:22:42 -0700 (PDT)
Message-ID: <e759f728-2a77-42a7-ba92-0d5f8afe2273@linaro.org>
Date: Mon, 1 Sep 2025 13:22:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/12] arm64/boot: Factor out a macro to check SPE
 version
To: Leo Yan <leo.yan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org>
 <20250814-james-perf-feat_spe_eft-v7-5-6a743f7fa259@linaro.org>
 <20250901100558.GJ745921@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250901100558.GJ745921@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052244_365163_8CEF4158 
X-CRM114-Status: GOOD (  22.20  )
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



On 01/09/2025 11:05 am, Leo Yan wrote:
> On Thu, Aug 14, 2025 at 10:25:27AM +0100, James Clark wrote:
>> We check the version of SPE twice, and we'll add one more check in the
>> next commit so factor out a macro to do this. Change the #3 magic number
>> to the actual SPE version define (V1p2) to make it more readable.
>>
>> No functional changes intended.
>>
>> Tested-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   arch/arm64/include/asm/el2_setup.h | 17 +++++++++++------
>>   1 file changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
>> index 46033027510c..3a4ca7f9acfb 100644
>> --- a/arch/arm64/include/asm/el2_setup.h
>> +++ b/arch/arm64/include/asm/el2_setup.h
>> @@ -103,8 +103,7 @@
>>   	csel	x2, xzr, x0, eq			// all PMU counters from EL1
>>   
>>   	/* Statistical profiling */
>> -	ubfx	x0, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
>> -	cbz	x0, .Lskip_spe_\@		// Skip if SPE not present
>> +	__spe_vers_imp .Lskip_spe_\@, ID_AA64DFR0_EL1_PMSVer_IMP, x0 // Skip if SPE not present
>>   
>>   	mrs_s	x0, SYS_PMBIDR_EL1              // If SPE available at EL2,
>>   	and	x0, x0, #(1 << PMBIDR_EL1_P_SHIFT)
>> @@ -255,6 +254,14 @@
>>   .Lskip_brbe_\@:
>>   .endm
>>   
>> +/* Branch to skip_label if SPE version is less than given version */
>> +.macro __spe_vers_imp skip_label, version, tmp
>> +    mrs    \tmp, id_aa64dfr0_el1
>> +    ubfx   \tmp, \tmp, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
>> +    cmp    \tmp, \version
>> +    b.lt   \skip_label
>> +.endm
>> +
> 
> Just wondering if we need to move the macro to the beginning of the
> file, so that we can define it first and call it afterwards.
> 
> Otherwise, LGTM:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> 

It's not required, but all the other macros are defined before use and 
it looks a bit weird to not do it, so I can move it.

>>   /* Disable any fine grained traps */
>>   .macro __init_el2_fgt
>>   	mrs	x1, id_aa64mmfr0_el1
>> @@ -263,10 +270,8 @@
>>   
>>   	mov	x0, xzr
>>   	mov	x2, xzr
>> -	mrs	x1, id_aa64dfr0_el1
>> -	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
>> -	cmp	x1, #3
>> -	b.lt	.Lskip_spe_fgt_\@
>> +	/* If SPEv1p2 is implemented, */
>> +	__spe_vers_imp .Lskip_spe_fgt_\@, #ID_AA64DFR0_EL1_PMSVer_V1P2, x1
>>   	/* Disable PMSNEVFR_EL1 read and write traps */
>>   	orr	x0, x0, #HDFGRTR_EL2_nPMSNEVFR_EL1_MASK
>>   	orr	x2, x2, #HDFGWTR_EL2_nPMSNEVFR_EL1_MASK
>>
>> -- 
>> 2.34.1
>>


