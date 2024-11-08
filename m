Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2522BD64074
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 18:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pu2KbLhVy42d9hOB6Mjt6i76usQbTgcaam+UIYR/VZA=; b=EeJEjPgYwrEdd7A2xPYPDnWL7V
	d2uKKGHauqgqulYobKxbmuGfMCRxbBRCFVegFB/Yjg3HoTmD+0dikYxcHnBOt5r7Wk/gHzEE9Xr3i
	yDPSv9vVUKxV8UnewdguMyFJLfcchw4mU3ZEKwbtuvFRKfk2L0/PdHwuirKc05iPGlFU6HzbKTFRB
	oG3xCBQ+bPkygP86kcN1zooEzcabu2ubU2tJgEDED5F1UWVImhX2BgROOmc5PX9E92vfXgx0UJUc5
	vF3hoCObyjMkoAXY0Tgb7ByxTDOZs98pXBYU9nFbfqZOPcL6Gc/HzRsKjfSJPTykap4ZPPwHoDE7/
	W+685d1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9TKK-0000000BXxM-2Kfc;
	Fri, 08 Nov 2024 18:03:20 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9TIX-0000000BXXu-26uK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 18:01:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731088890; x=1762624890;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=35sYeiJo5xS7xz/cHvI/Q6kimidHt4m9ErVWVWVgItw=;
  b=QjJeMqLd1oyjEp69GXIVYExsZxsSLV8V3u4rWOSzab5h3RA4A+RuhGP4
   lJyl6iqUnjgBd1CKPcisA55k3o8xp+ri/YhqFzhBT4TfJR9/tF08R1pQT
   /sJmSYh6b/vHb74Nerllt0T9wWxz/YDpzr+ys054wNifCxhatMAgnIf/U
   I8thhdgTMKKEqpjLFEhM/UNlyh+7TvIoSz1l3c3oC1MM26ko4MtekKDVt
   9rV+Rv9pvGgi886tUV7/rCiGGM1C4uQShOf92WYleg2HoZNPHUIKzsq0c
   AeZGTGD2SrW0Zlz6haGcouOfajvbumWICQj3r5WIpBbBDBtws2qrVSzx6
   A==;
X-CSE-ConnectionGUID: 3ea0mzGxRE6m9iRZzh0JpQ==
X-CSE-MsgGUID: 67OriMxNRw67w+WgzXzZ/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31138210"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31138210"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 10:01:28 -0800
X-CSE-ConnectionGUID: 1G07uf8uR2O8hVE6/3A//A==
X-CSE-MsgGUID: ekonjwKtQkWBKVyjdu4htw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="85812778"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.246.16.81])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 10:01:11 -0800
Message-ID: <b97a8aa8-37b1-4d8f-9de0-f294fcd07adb@intel.com>
Date: Fri, 8 Nov 2024 20:01:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V14 08/11] perf tools: Add missing_features for
 aux_start_paused, aux_pause, aux_resume
To: Namhyung Kim <namhyung@kernel.org>, Leo Yan <leo.yan@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Heiko Carstens <hca@linux.ibm.com>, Thomas Richter <tmricht@linux.ibm.com>,
 Hendrik Brueckner <brueckner@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Yicong Yang <yangyicong@hisilicon.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Will Deacon
 <will@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Andi Kleen <ak@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, H Peter Anvin <hpa@zytor.com>,
 Kan Liang <kan.liang@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org
References: <20241022155920.17511-1-adrian.hunter@intel.com>
 <20241022155920.17511-9-adrian.hunter@intel.com>
 <20241108154152.GA197781@e132581.arm.com> <Zy5M1WJ97GprNniq@google.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <Zy5M1WJ97GprNniq@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_100129_751546_470DC869 
X-CRM114-Status: GOOD (  20.31  )
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

On 8/11/24 19:39, Namhyung Kim wrote:
> Hello,
> 
> On Fri, Nov 08, 2024 at 03:41:52PM +0000, Leo Yan wrote:
>> Hi Adrian,
>>
>> On Tue, Oct 22, 2024 at 06:59:14PM +0300, Adrian Hunter wrote:
>>>
>>> Display "feature is not supported" error message if aux_start_paused,
>>> aux_pause or aux_resume result in a perf_event_open() error.
>>>
>>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>>> Acked-by: Ian Rogers <irogers@google.com>
>>> Reviewed-by: Andi Kleen <ak@linux.intel.com>
>>> ---
>>>
>>>
>>> Changes in V13:
>>>         Add error message also in EOPNOTSUPP case (Leo)
>>>
>>>
>>>  tools/perf/util/evsel.c | 12 ++++++++++++
>>>  tools/perf/util/evsel.h |  1 +
>>>  2 files changed, 13 insertions(+)
>>>
>>> diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
>>> index 95593b55d9a7..88b31a005ac6 100644
>>> --- a/tools/perf/util/evsel.c
>>> +++ b/tools/perf/util/evsel.c
>>> @@ -2102,6 +2102,12 @@ bool evsel__detect_missing_features(struct evsel *evsel)
>>>                 perf_missing_features.inherit_sample_read = true;
>>>                 pr_debug2("Using PERF_SAMPLE_READ / :S modifier is not compatible with inherit, falling back to no-inherit.\n");
>>>                 return true;
>>> +       } else if (!perf_missing_features.aux_pause_resume &&
>>> +           (evsel->core.attr.aux_pause || evsel->core.attr.aux_resume ||
>>> +            evsel->core.attr.aux_start_paused)) {
>>> +               perf_missing_features.aux_pause_resume = true;
>>> +               pr_debug2_peo("Kernel has no aux_pause/aux_resume support, bailing out\n");
>>> +               return false;
>>
>> This patch fails to apply on the latest perf-tools-next branch due to
>> conflict:
>>
>>   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git
>>   branch: perf-tools-next
>>
>> You might need to rebase it on the latest code base.
> 
> Yep, please do for the tooling patches.

I'd noticed that, but there is more work to sort it out.
The probing simply won't work when there are dependencies
on other events, or other attr members.  But there is no
point in trying to "fallback" in that case either.  It is
just a failure, but what *is* still needed is a sensible
error message.

The other patches, including the ones that come after,
still apply by the way, or they did the other day, so
they could be applied anyway.


