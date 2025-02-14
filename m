Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD17C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 10:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WX8WwYpC/7CDpNuf00AfcD8uPd4813egQtu1K93XN+I=; b=UE6R768dEQ9Dg9El+TJJjT5EqH
	iQnEflQOdTDGEM7fD1h8gZrGZ4xrt1Pe3Aw8InKX3QBpeiKhydimVXlRN6KbDZhReHVC/dyI58MiW
	O6YvtbDfbbA2YxZISUtK7FWwXFL/MqUvmuxJFvqpKLjvF+MioN1T1f9rCfN75PO2bLUw0wpOG1k2K
	YbkL5Q6XGV9yvfZB44UAYPIlxbykQt2ATAaiMp7lPcTy7RW80dmw5pvq7e4FX9t0qpmk8ggopjF+f
	xXyJ+NRKLNJSYiiTXY0APuX1XbcHEoeFrdDNoqW4fb/9abMiISo6zS3CxF7XD3AH+GQ6T2C0er0hC
	lfBs+ekg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tisYY-0000000ER6h-2t0T;
	Fri, 14 Feb 2025 10:04:22 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tisX5-0000000EQld-1ILZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 10:02:52 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4395f81db4dso11229905e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 02:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739527369; x=1740132169; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WX8WwYpC/7CDpNuf00AfcD8uPd4813egQtu1K93XN+I=;
        b=MIdd8NrlWWFxBDv/w4xoyMZxAeqKrbPTvhqBfi/T4CaaiYY/IGkGctSEeBo8QcVugx
         IEhRjW1zKiCuU2/ZlnLwvMI7f83kxuFyaeg2UbDqIWL2NtdnYWGmGovWGz9OlZeVmP6X
         nxMeI7sW0GI78PYxz75exO/1luABtI+15v9lEcB392EeADDhabwzwq/0BRn88qEn0+Nt
         ovvLY0Dq+oLFrZ0ME40xaf4HxUoPdCjXO9wBOJOJCHXjpdDpvFh5KMxVBrFLG09M5eSQ
         eOUZ6iAjsnIfaPYjUBgy1XY6gktGDZa/2QeXaqxU8oimIZ/vznPDm6jiujqtUCkogClm
         rSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739527369; x=1740132169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WX8WwYpC/7CDpNuf00AfcD8uPd4813egQtu1K93XN+I=;
        b=J05DV6LWYJVFmN5ImsEzL4BBfzehgFfWbf6sgu1Fjt1LePD40vxkQ6kBnDEzHMtgaZ
         TX2hxE+MA616TyrsITjprA7dAwAGbg6Bgtdm+O6/OKYg1WLN8gcYbGFqCgU0XXRhBEgV
         73gyA8p8fhD/843VGuIkR2S+gC61w1n6eD29CjN3gwtxoGIC31qEMlDHEqCDPP84/N9a
         CX0nTzh9e/v6HxS07EGAMyuwpkFopWss0FOHyr+QWBHrDtN5U3cv1xxHFSDnlcB5vven
         soeaPyJlyh30SNW8fAw8C6U6ZENBfVEj2a+7CLgtLce4nqmDTkheVtpH6LWRLNeTTZaI
         baPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv/r/BdTHWmyntKYyee7rIKKZ7Hp2cy0275nXjK6OFqWKMbUgHiIk+JuwLY3VIVfQ4/5Lj31h82/n6yZ+6b70c@lists.infradead.org
X-Gm-Message-State: AOJu0YxewpSJ9R5QyOH45Wl52R9EbE3x8A2iHm3nM514fjCP673mUwVq
	F8J2oFmFBoezjZBIF6iyy79iTftzRg09jCAPIse3f8GA73k9fO4rYKavhxqK0qA=
X-Gm-Gg: ASbGncvPQwlOB7L9Lmger58SdulSqFa9xHHyIHftEJT3qDe2/Z2CgVH+0yT2O7Yxrhj
	8F6GP57c3rj/8Yr9i7Nf2UGSUKigcVVX3rgOMjU9dzEqSfRFCXVL9RA0jYSoUH1ygG5LOxa+frW
	Sjx36yTHnLtPS8jLr7emclDX3nHa6dfMFo2WUNJhUg5+PsOiy6bbZfJBCeLQuz/K/7prv+UxbeR
	If+vUQRMYRuomEjfx0iTdCOXuMMBMPLj0eJG/USHHWbRCKDvzoU8/nAosbAon4mpX1tNWOszHKp
	/Nqt16NoTi2Dw6iQFaoSqvZ3kw==
X-Google-Smtp-Source: AGHT+IGXbOvw8S2GyqkxFIBv52Dq7Q6IHtiiNKaFsB5EmhnCm9g3CNMhqRiW6G3yKYM1hCJUjhidtA==
X-Received: by 2002:a05:600c:a0c:b0:434:f1bd:1e40 with SMTP id 5b1f17b1804b1-43960e81b92mr70034575e9.6.1739527369462;
        Fri, 14 Feb 2025 02:02:49 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4396b5267b6sm1615605e9.0.2025.02.14.02.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 02:02:47 -0800 (PST)
Message-ID: <1b8b234f-6435-45cf-83e7-8e86c84f075f@linaro.org>
Date: Fri, 14 Feb 2025 10:02:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] perf vendor events arm64: Add A720/A520
 events/metrics
To: Yangyu Chen <cyy@cyyself.name>, Namhyung Kim <namhyung@kernel.org>,
 Ian Rogers <irogers@google.com>
Cc: linux-perf-users@vger.kernel.org, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Liang Kan <kan.liang@linux.intel.com>,
 Yoshihiro Furudera <fj5100bi@fujitsu.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <tencent_5360DA048EE5B8CF3104213F8D037C698208@qq.com>
 <Z66YjGvjD_yzEHUg@google.com>
 <tencent_45B4E91CA370C563D6420A1A25F992056D09@qq.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <tencent_45B4E91CA370C563D6420A1A25F992056D09@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_020251_358764_7358EE21 
X-CRM114-Status: GOOD (  18.02  )
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



On 14/02/2025 5:49 am, Yangyu Chen wrote:
> 
> 
>> On 14 Feb 2025, at 09:12, Namhyung Kim <namhyung@kernel.org> wrote:
>>
>> Hello,
>>
>> On Thu, Feb 13, 2025 at 11:11:01PM +0800, Yangyu Chen wrote:
>>> This patchset adds the perf JSON files for the Cortex-A720 and Cortex-A520
>>> processors. Some events have been tested on Raxda Orion 6 with Cix P1 SoC
>>> (8xA720 + 4xA520) running mainline Kernel with ACPI mode.
>>
>> I'm curious how the name of PMUs look like.  It is cortex_a720 (or a520)?
> 
> The name of PMUs comes from Arm's documentation. I have included these
> links in each patch.
> 
>> I remember there's a logic to check the length of hex digits at the end.
>>
> 
> Could you provide more details about this?
> 
>> Ian, are you ok with this?
>>

I think they wouldn't be merged because they're core PMUs, so should be 
fine? Even though they would otherwise be merged because they're more 
than 3 hex digits.

>> Thanks,
>> Namhyung
>>
>>>
>>> Yangyu Chen (2):
>>>   perf vendor events arm64: Add Cortex-A720 events/metrics
>>>   perf vendor events arm64: Add Cortex-A520 events/metrics
>>>
>>> .../arch/arm64/arm/cortex-a520/bus.json       |  26 ++
>>> .../arch/arm64/arm/cortex-a520/exception.json |  18 +
>>> .../arm64/arm/cortex-a520/fp_operation.json   |  14 +
>>> .../arch/arm64/arm/cortex-a520/general.json   |   6 +
>>> .../arch/arm64/arm/cortex-a520/l1d_cache.json |  50 ++
>>> .../arch/arm64/arm/cortex-a520/l1i_cache.json |  14 +
>>> .../arch/arm64/arm/cortex-a520/l2_cache.json  |  46 ++
>>> .../arch/arm64/arm/cortex-a520/l3_cache.json  |  21 +
>>> .../arch/arm64/arm/cortex-a520/ll_cache.json  |  10 +
>>> .../arch/arm64/arm/cortex-a520/memory.json    |  58 +++
>>> .../arch/arm64/arm/cortex-a520/metrics.json   | 373 +++++++++++++++
>>> .../arch/arm64/arm/cortex-a520/pmu.json       |   8 +
>>> .../arch/arm64/arm/cortex-a520/retired.json   |  90 ++++
>>> .../arm64/arm/cortex-a520/spec_operation.json |  70 +++
>>> .../arch/arm64/arm/cortex-a520/stall.json     |  82 ++++
>>> .../arch/arm64/arm/cortex-a520/sve.json       |  22 +
>>> .../arch/arm64/arm/cortex-a520/tlb.json       |  78 ++++
>>> .../arch/arm64/arm/cortex-a520/trace.json     |  32 ++
>>> .../arch/arm64/arm/cortex-a720/bus.json       |  18 +
>>> .../arch/arm64/arm/cortex-a720/exception.json |  62 +++
>>> .../arm64/arm/cortex-a720/fp_operation.json   |  22 +
>>> .../arch/arm64/arm/cortex-a720/general.json   |  10 +
>>> .../arch/arm64/arm/cortex-a720/l1d_cache.json |  50 ++
>>> .../arch/arm64/arm/cortex-a720/l1i_cache.json |  14 +
>>> .../arch/arm64/arm/cortex-a720/l2_cache.json  |  62 +++
>>> .../arch/arm64/arm/cortex-a720/l3_cache.json  |  22 +
>>> .../arch/arm64/arm/cortex-a720/ll_cache.json  |  10 +
>>> .../arch/arm64/arm/cortex-a720/memory.json    |  54 +++
>>> .../arch/arm64/arm/cortex-a720/metrics.json   | 436 ++++++++++++++++++
>>> .../arch/arm64/arm/cortex-a720/pmu.json       |   8 +
>>> .../arch/arm64/arm/cortex-a720/retired.json   |  90 ++++
>>> .../arch/arm64/arm/cortex-a720/spe.json       |  42 ++
>>> .../arm64/arm/cortex-a720/spec_operation.json |  90 ++++
>>> .../arch/arm64/arm/cortex-a720/stall.json     |  82 ++++
>>> .../arch/arm64/arm/cortex-a720/sve.json       |  50 ++
>>> .../arch/arm64/arm/cortex-a720/tlb.json       |  74 +++
>>> .../arch/arm64/arm/cortex-a720/trace.json     |  32 ++
>>> .../arch/arm64/common-and-microarch.json      |  15 +
>>> tools/perf/pmu-events/arch/arm64/mapfile.csv  |   2 +
>>> 39 files changed, 2263 insertions(+)
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/bus.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/exception.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/fp_operation.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/general.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/l1d_cache.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/l1i_cache.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/l2_cache.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/l3_cache.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/ll_cache.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/memory.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/metrics.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/pmu.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/retired.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/spec_operation.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/stall.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/sve.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/tlb.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a520/trace.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/bus.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/exception.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/fp_operation.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/general.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/l1d_cache.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/l1i_cache.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/l2_cache.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/l3_cache.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/ll_cache.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/memory.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/metrics.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/pmu.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/retired.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/spe.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/spec_operation.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/stall.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/sve.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/tlb.json
>>> create mode 100644 tools/perf/pmu-events/arch/arm64/arm/cortex-a720/trace.json
>>>
>>> -- 
>>> 2.47.2
>>>
> 


