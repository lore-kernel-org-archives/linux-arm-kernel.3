Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B49C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 18:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K66IbQMbjje707cA7mD5l9PP1/zHD1PIxR0a5Pb7bKE=; b=ewgcYmucLJXie8JqnIHxaOul+u
	3QYH5RdrmVeb9AnGUe4p1NubE2B9JaWYYktzSm9IWmdfip2EmQIqk/Or1Oved6T62+PDpiAca47VC
	gMS6C+NxebMmAHcvU6bhkN9c9Tc03gntheSpHw7kFeD6Tp74owrFzkIJ6zk6/BB7gl6qEhGwcH6iX
	o6dJMHZk+SoslutmmgrQUCXlsgy37UoEAxXYYwDN3ybKd9obqS1H+bHTMS9rA6jJmNUcOr9/fzydd
	Ww9aUOOQ3o/xZHrN3ley6gnEb88RFetc6AkHyR0RIOdKIzf2QCq/XNPn9SMLJXfJg43+s3UI9rFi+
	l0vHGprg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJyl6-0000000BKfm-1QfD;
	Tue, 27 May 2025 18:10:40 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJyYc-0000000BIeh-3Wc0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 17:57:48 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-445b11306abso22888645e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 10:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748368665; x=1748973465; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K66IbQMbjje707cA7mD5l9PP1/zHD1PIxR0a5Pb7bKE=;
        b=o0TuhEWhLlUI2S2CjSyO4uZaKSi8ekWTOqXOMpmYYQrnECN/6rFKIrBgkpHO/AJEF9
         aeOcUMGB0q1cczNyvrvgiMh+HnikLe7fodrp/RzHf6MIWFB3IZ+8mmBVO7eCjICjT/hF
         NtFQZhfdEWmiY9JfEAoV/cLyap+GOYYMxc/weCrtUSR4M1mgr/1hehoXSHowgtXeZCIC
         PeD3f5YwmJ19AEShvhTRRh3plE+uPEbusmnfqSbHu1K9wBdMPRGfY53g35gnsT7SjGqO
         c+RuttWYvO6etsWxXFsEe4xKf5RIRymOmi384bHz9PHx6lONO3DRzD0SOFfuAkTpgm9w
         YXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748368665; x=1748973465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K66IbQMbjje707cA7mD5l9PP1/zHD1PIxR0a5Pb7bKE=;
        b=TFRRU3Tov9nOmSwKw8Gdw0GfhQnu6axq3m4r8NwkQDfzGhWeNcvGDwjvXjuQ05SXwB
         X+SVNng3NckCgTtQUaJW/X+S9l7vQBNgH8YFLDR4cOXtpFMufGEj6/0Lq0P0R0z1pxLK
         P2A6SaddxLB3f6sJLbwQAOO9aD4YJ8ozcwTSUeoqsmzijQm4KSJvCV9PQm2jFZiIkh6X
         WKXIBXepmWwPW19KzFp7/9nKVGsuhsd4cwF37qHs5nAanSD0VQnCLe6jzZ+8yfrA7rUB
         t238X23PQqsN1xcOH8PuV8j/Xp4ITR2JTGqJAOvUTOzndbEclPK9eCAGsyekZhAL6pRs
         HVag==
X-Forwarded-Encrypted: i=1; AJvYcCVNswf5IpDI6j2Da1EXHyHhk5csSnP6ndI5DEzjt1A0Mk76zzUh9Ns04//DX67NTAMjewT7lZcwQvKI0AqbDr4p@lists.infradead.org
X-Gm-Message-State: AOJu0YwNBXfegz9/ZuIs43ekq8kkltkn12vo8utQ96P2tGS4caSQFrFX
	cL3/i9/q6Ujm+jQsK7yGk0ohf4J5asZLsSRdqh3E5584x69PkSn9wmh4HpyVt4ldGlQ=
X-Gm-Gg: ASbGncuanHVJ3rqHUfktvSm9yF5m7IMqdke4lOwoymQLWsjCvcmyJXRS6mK2sITfVwN
	IKDNg9Syycj3PMuelAC1LD1bIX/RbZ2EsicOVTtQy1IENme1YNy/tHUpc2oRC8Ltuo6gZ/yYe/f
	OvWok1uiFsINNgQ3nANR3IUZNWo4wS7jn4hC+Wiq7NSzOZnvWw3kgX9jZvmNOx4fUN8mrXWxyhC
	gIB21uJqZM86ODyrEBUBd7P8NAe2OATsdSp/ySVH1ZnC+8SINCYVxLdi3hzm/pvKGefjK33P3Su
	Pq7Gi8fLJTaSW9qpAEP6fgW6i962E6bqENvZpeExZ/nLPW9KCMh2BFIa
X-Google-Smtp-Source: AGHT+IGWVp+1pe2g72Y3zco5kiY52P50nzKLHDIXvLoqcgNBLuwmb5ic8TmQyg2vlxnYIHLktroXHw==
X-Received: by 2002:a05:600c:1e1c:b0:441:d438:4ea5 with SMTP id 5b1f17b1804b1-44c9493e6b1mr107966315e9.20.1748368664703;
        Tue, 27 May 2025 10:57:44 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b29548sm290642395e9.4.2025.05.27.10.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 10:57:44 -0700 (PDT)
Message-ID: <c2393238-d1cb-43bd-b67e-08105a9834fd@linaro.org>
Date: Tue, 27 May 2025 18:57:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 4/4] perf: arm_pmuv3: Add support for the Branch
 Record Buffer Extension (BRBE)
To: Will Deacon <will@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Leo Yan <leo.yan@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250407-arm-brbe-v19-v21-0-ff187ff6c928@kernel.org>
 <20250407-arm-brbe-v19-v21-4-ff187ff6c928@kernel.org>
 <20250519150621.GA17177@willie-the-truck>
 <20250519215651.GB2650608-robh@kernel.org>
 <119c9a70-6ea8-46f0-b877-8a433d97ce84@linaro.org>
 <20250527105035.GA26328@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250527105035.GA26328@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_105746_940036_C4F77116 
X-CRM114-Status: GOOD (  21.30  )
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



On 27/05/2025 11:50 am, Will Deacon wrote:
> On Wed, May 21, 2025 at 04:58:42PM +0100, James Clark wrote:
>>
>>
>> On 19/05/2025 10:56 pm, Rob Herring wrote:
>>> On Mon, May 19, 2025 at 04:06:22PM +0100, Will Deacon wrote:
>>>> Hey Rob,
>>>>
>>>> On Mon, Apr 07, 2025 at 12:41:33PM -0500, Rob Herring (Arm) wrote:
>>>>> From: Anshuman Khandual <anshuman.khandual@arm.com>
>>>>>
>>>>> The ARMv9.2 architecture introduces the optional Branch Record Buffer
>>>>> Extension (BRBE), which records information about branches as they are
>>>>> executed into set of branch record registers. BRBE is similar to x86's
>>>>> Last Branch Record (LBR) and PowerPC's Branch History Rolling Buffer
>>>>> (BHRB).
>>>>
>>>> Since you picked this up from v19, the driver has changed considerably
>>>> and I presume you will be continuing to extend it in future as the
>>>> architecture progresses. Perhaps having you listed as Author (and
>>>> crucially, in git blame :p) with Anshuman as a Co-developed-by: would be
>>>> more appropriate?
>>>
>>> Shrug.
>>>
>>>>> ---
>>>>>    drivers/perf/Kconfig         |  11 +
>>>>>    drivers/perf/Makefile        |   1 +
>>>>>    drivers/perf/arm_brbe.c      | 802 +++++++++++++++++++++++++++++++++++++++++++
>>>>>    drivers/perf/arm_brbe.h      |  47 +++
>>>>>    drivers/perf/arm_pmu.c       |  15 +-
>>>>>    drivers/perf/arm_pmuv3.c     | 129 ++++++-
>>>>>    include/linux/perf/arm_pmu.h |   8 +
>>>>>    7 files changed, 1006 insertions(+), 7 deletions(-)
>>>>
>>>> Do you know if James Clark's tests [1] are going to be respun for the
>>>> perf tool? It would be handy to have some way to test this new
>>>> functionality.
>>>
>>> Yes. I dropped them here because I've been told by Arnaldo in the past
>>> to send userspace stuff separately.
>>>
>>
>> That version of the test was out of date so I've pushed the new version
>> here: https://git.linaro.org/plugins/gitiles/people/james.clark/linux.git/+/16e4a18c2d5fc53736f05c9052b1d11d74909707
>>
>> But I'll wait for the driver changes to be finalised before posting it. Or
>> Rob can take it back into the patchset.
> 
> Thanks, James. I just wanted to make sure that there was still a plan
> for upstreaming these separately from the driver. Have you had a chance
> to run them against this v21?
> 
> Will


Yes I'll send it once the driver is merged. And yes they're passing 
against v21, but I'll retest v22 as well.

James


