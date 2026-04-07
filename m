Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16D6EDB7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 08:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YF+vzkW/sLkkCK6eYuO/W7phgVcJivF+sw7H1piAQWk=; b=u2tqHFhKYJFPunIVj0uX3p/IUT
	sTfWawuNJHYdvbs+FaeqQwMpKnXnFIX9zQygH++jeo06aD22PuurpLAWHXKb3HBWdGY7sE0AI+bsN
	Rx6Efr1IujbySr0hERHkFakyDXc69mVki+aIW3p+d7GRtrWsUvVYWLeZ3MBLwYIa+WYzJFybvVpvN
	eQbXzFb3coM/DEW5gcx44qa71qFg+oRuaL7HBNGxLWuJok7nyuVV+F+8e2gpUHbRHSNhow1I9R07Z
	LPwd/5HWqiSrHRnpRZxk7juwGRqLtUpf8wMygTginnOz3qxpwFlq1K1h205/NYq73n/nUMP2xmaIE
	dN0EbhyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1dQ-0000000687X-3d0y;
	Tue, 07 Apr 2026 08:18:08 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1dN-0000000685N-3lKC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 08:18:07 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48897fd88ebso33589875e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 01:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775549883; x=1776154683; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YF+vzkW/sLkkCK6eYuO/W7phgVcJivF+sw7H1piAQWk=;
        b=tpR+ol6iK00xPgQjmSSfCImHs9zBOhuYwiFwZ+Ug85F84AhM8FZjVmjX+8H0OwZSFG
         ShLBLfvjcSylhajDItftIQCVZzvjWLfUjw+khpbUWqBB3Dozkyh1Zip+8egB/oGieo7u
         VWazAFPvqbvOnH0fGStahxfRRB9BALccezr1xNB5ho4mgIFRgi23Ap9AuyZ2voseADvL
         V0RVKIUqL1/nlmWVJKoDuFMdp6Kbt+c0QncmXsBoSINUkyGPE3WipTD9Ct5AoOPjpfve
         no1iZFhIrRbdqzr/Mgd/FAWCA88U9pHhr7Ax1rfxUkj5qUw9siunzBcQfD3qpSczOkQd
         fs/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775549883; x=1776154683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YF+vzkW/sLkkCK6eYuO/W7phgVcJivF+sw7H1piAQWk=;
        b=bjJTtdBH/0KYCWNWDL7rIezmYdM3n+aZAua+08uVdazRn9bAfO2Xf3nS9Au1J/Llch
         Aw2qAmqMFusT/KxMWwuN4pDk2pKy4mcJqwjqLMzM3dbtNboWKBc1MLi7n7AqEvtd1jSN
         eqWSzQhoPbYma+lEpd28aQkuRUeencohc85o/LymUTbP1hZZNDTxRxpYyrhFiqzXVh0C
         GuDTrLcl9GlqDt0yrdjUNp+g65/Fj+19vOcXODMwhXtwyi/20NEz8rdmPX67hzyfkw/A
         spP8odk3b5T03klr63+N2azUaTCxi6jQ2BfCyM3qlaG4d9ak5DJipuGWBKPQ5G25q4wJ
         HvJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaKjBsEXISNuEORSflHgYps3Idcy1Z9ayM366kb6H9QJU7vorTp70PPezkSypkA0pQ0bKiyhUskvfCEnpD/Fe/@lists.infradead.org
X-Gm-Message-State: AOJu0YykJc//wY5IMuoAiuRZuYuDfH2NSlXjRBCLoup1XC44FMY7OioL
	0TeNpS3FzZItwjMqZZM3WC4OJiMJoBtVaqdMVlVpOCUd3678Es/Rt8WDqtwkykOq9Po=
X-Gm-Gg: AeBDies4oOo+352TsyZmBmrrwO/wEYopDBBNIG2RsjltTyKQve5yIbvsvk56jseGgkA
	HCpHF+1EaAR7v1M2U1PUqGZrFcB+Tan4TP73rrndUAY38iBebiFD7yr+FysuRr+g/qRTV2nMeoC
	wUiLPGzDpmVcb2M3dLSDMp35Ez6S8vjE6P+oqZbzqQPgVsWBTcNgf7wQbLniNcQWqx6+inqAs1C
	0XK6c2IOBjsu4DIJQbkFGknQnoKQoqQgQ2MqK3Dei3IIDdoLyOs68zwwaAJu+KYdWPtm7l1ZzRv
	hryD2DbLI7fecTWPca1Gd5ipBanHX6GxU+906qMZFg/ZvoaphzIABOvCCKmav8CZX1mkTm0FIKL
	HOFA44vJUFLywhrXHeNi3SkNyDoSr/U9UJER36eSZF6mIvljjJv7T5/UyNhvNt3ADVvVrElWsp2
	motLeuDHIBU1RtCdJIK1UJR0SKc+4d
X-Received: by 2002:a05:600c:5392:b0:486:fa9c:185 with SMTP id 5b1f17b1804b1-488997d69e4mr234861545e9.31.1775549883529;
        Tue, 07 Apr 2026 01:18:03 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d214f2b63sm43051405f8f.28.2026.04.07.01.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 01:18:02 -0700 (PDT)
Message-ID: <d45195c7-ad32-4bc0-8d60-4b242cb3e2a7@linaro.org>
Date: Tue, 7 Apr 2026 09:18:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] perf arm_spe: Dump IMPDEF events
To: Namhyung Kim <namhyung@kernel.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260401-james-spe-impdef-decode-v1-0-ad0d372c220c@linaro.org>
 <adP44THdD-HBB8cY@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <adP44THdD-HBB8cY@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_011805_971034_19579D43 
X-CRM114-Status: GOOD (  18.34  )
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



On 06/04/2026 7:18 pm, Namhyung Kim wrote:
> Hi James,
> 
> On Wed, Apr 01, 2026 at 03:25:48PM +0100, James Clark wrote:
>> In the Arm SPE raw data dump, IMPDEF events aren't printed. Add the
>> ability to add names for some known events or print the raw event number
>> for unknown events.
>>
>> For example:
>>
>>    $ perf report -D
>>
>>    ... ARM SPE data: size 0xd000 bytes
>>    00000000: b0 18 c6 32 80 00 80 ff a0  PC 0xff80008032c618 el1 ns=1
>>    00000009: 64 e7 42 00 00              CONTEXT 0x42e7 el1
>>    0000000e: 00 00 00 00 00              PAD
>>    00000013: 49 00                       LD GP-REG
>>    00000015: 52 16 10               	EV RETIRED L1D-ACCESS TLB-ACCESS
>>
>> On N1 the event line becomes:
>>
>>    00000015: 52 16 10                    EV RETIRED L1D-ACCESS TLB-ACCESS LATE-PREFETCH
>>
>> Or on other cores it becomes:
>>
>>    00000015: 52 16 10                    EV RETIRED L1D-ACCESS TLB-ACCESS IMPDEF:12
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>> James Clark (4):
>>        perf arm_spe: Make a function to get the MIDR
>>        perf arm_spe: Turn event name mappings into an array
>>        perf arm_spe: Decode Arm N1 IMPDEF events
>>        perf arm_spe: Print remaining IMPDEF event numbers
> 
> Will you send v2 or do you think it's ok to merge v1?
> 
> Thanks,
> Namhyung
> 

I'll send a v2, thanks.

>>
>>   tools/perf/util/arm-spe-decoder/Build              |   2 +
>>   .../util/arm-spe-decoder/arm-spe-pkt-decoder.c     | 147 ++++++++++++++-------
>>   .../util/arm-spe-decoder/arm-spe-pkt-decoder.h     |   5 +-
>>   tools/perf/util/arm-spe.c                          |  49 ++++---
>>   4 files changed, 135 insertions(+), 68 deletions(-)
>> ---
>> base-commit: 74e2dbe7be5037a5e5eed6bc1ad562747ac88566
>> change-id: 20260331-james-spe-impdef-decode-d944f4fdcff7
>>
>> Best regards,
>> -- 
>> James Clark <james.clark@linaro.org>
>>


