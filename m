Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC6DCAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9aAVIFTB9yAV+GQAaHBwR0TWklKYdkWkTVHPifGbM8=; b=Rj39LNGGhZnSskMq8JHo883le0
	kttgqR7hD6tN6Pg5m5UNAueWENpDM/j62ScjYYlfAjLFap8WhXMQtUERoiUY8zlblr2zh8/ZgPaB+
	pde0tkKA1taLAvbbrFLz7VQBH8+5ey3hotvxjjfW6RsAqrly6Lxfnx2CmYnKwTNn8Ir1TOE5QkzdW
	CMzpx5mYQDsr4NRHeSQesBpisgBRksjIGJwFgzNfzyOkkUI+ZfYcuVKhrY9KsZZICe2ub8vsCNTSI
	M2ACHOF6Qs9hCwVCYLozsU29Uir0Xy/RnDmqdaHdMO63YaaSSxsuK5EwmNwj5JKooK5hy6klLtKAS
	yLwX6cgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1y1-00000008qyz-1slW;
	Tue, 09 Sep 2025 17:17:17 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvxLP-000000072Aj-2BMm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 12:21:09 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45de6415102so18720565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 05:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757420465; x=1758025265; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e9aAVIFTB9yAV+GQAaHBwR0TWklKYdkWkTVHPifGbM8=;
        b=TLHh7EghWGaaNGK7DG8oEd3C1KmYiDw3Hb+yJm1wSDPcFZ3ns0vsgYww6BMHbbjMIN
         U1CF9nuamfHPB+RIjU2EW3nfa5FJ9iHV85OTCxAyeQgnR+CXcv6kz0p1owXgdsnSSEAa
         Rj9vN0bf7T/ebke9pCA2aPtOPhhw0QdlviBuQosFdn6FHyEWfZi1O18FaQEUZogbq99g
         bKlQP3Ict8IgjLqkKtgFEhvJTzRzJSrRfReN5VGUKsokfGd1hF+Ps3AC1QfD11SMD5rm
         4H296O2jw9jar7VPaK5QH9SWI8JUdUFk0reAb/A+qLqZ5HoYsyDITXgRzD5KIf3sc+QV
         idOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420465; x=1758025265;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e9aAVIFTB9yAV+GQAaHBwR0TWklKYdkWkTVHPifGbM8=;
        b=hnSMVqlMazdsWQ57zuev6hcKGjG5WVCJJnDdSnhYorPBR9wFjcY4RI0KRw94Jr+AF0
         vLH7vYeIdXAOBlw79QWSj/Z4W8hi4duF9AXFAGbEspKTX3EV6gfTL690URrkiHkQInkJ
         MlWptzXG4KyQqGAkQSbdYXz02UbYHsN3CFl5DtNsLs6FthTbjDaraMs+RHbwS5q9dJlT
         tY6i/zg+Q82Cw6Iph6UhKpO/QKVHhshRuku9VJALfvOmFpOLiSq4ttRc3oPlXMA6uBc6
         AAjW7qSaEwU+3x1K4JsCSlLI89PZzq3ZV1Ul7BZTZ/A8FZ9zacF9H1u1dFewUeqVX4kE
         QScg==
X-Forwarded-Encrypted: i=1; AJvYcCW70Vve7LPxZvCZLpx+vXxCYwvR5Zdb+TihGOdWKld2/B6DEndgWocoOos5jZOQr7gcm89ylgrOpN41B3gxFPFm@lists.infradead.org
X-Gm-Message-State: AOJu0YyXkfqBjDBICLHFq9etAawkenyHv5R3MnSle9lL8XrqrTij6ihl
	0K7FVimiZNXr1ZXjewbS0KIhRl/9B3PrSfFlE4ILNYuAMzV/ehkpWsZasOxeau3z6c0=
X-Gm-Gg: ASbGncvtZWKHG9QZIVQZgn5oC/klVrbsVTqRsP+uilv1dAgjBilWda7qG5ESCBE5m+A
	M6qH9HrR3xL2gig9zUPO+eRs592d6EvVHFtEf3jchAmxe3WbsXaBx+s+WrYFW2igWFhaE6KN+Mj
	F279SvvvavDT9uWkist2206ZaA8P4Oe2fl3FI9R0WxhtzqHM6ah1hFnoDl1N00PO1M79ZWcrfxT
	eJXMrJjtKhLvzAq3TUaZ85dHOPI3RZeGhAemujDzxgwdcRuiEID8BQEGbL/8Go9FkEJbJj9wqqB
	iq1ntEcXqBzeljCPBcIp6Tso01YEXgCG9zuu6szcBPgtaF1gPNoWkywEdaseqWY8YYGIXPWK3C5
	TuhcP7GdO1rMtVHEUx9ADBecaxhRPWyjh4ySKow==
X-Google-Smtp-Source: AGHT+IHaBOAGTfkhgFhbVLu/wHVI1hhtSVll6EktX5UfFmRzOFzoL5bcSBkBdIXzZP80OpbBKg72qA==
X-Received: by 2002:a05:600c:45cd:b0:456:1dd2:4e3a with SMTP id 5b1f17b1804b1-45ddde6ad13mr106581125e9.3.1757420465378;
        Tue, 09 Sep 2025 05:21:05 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c5c89f2sm298074835e9.14.2025.09.09.05.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 05:21:04 -0700 (PDT)
Message-ID: <9f84d9e1-9404-4151-9c5e-d3a1c018aa03@linaro.org>
Date: Tue, 9 Sep 2025 13:21:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] perf arm-spe: Improve --itrace options
From: James Clark <james.clark@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Leo Yan <leo.yan@linux.dev>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, George Wort <George.Wort@arm.com>,
 Graham Woodward <Graham.Woodward@arm.com>, Ben Gainey <Ben.Gainey@arm.com>,
 Michael Williams <Michael.Williams@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250908-james-perf-spe-period-v1-0-7ccd805af461@linaro.org>
 <aL9HvOl-n_IM0qiB@x1> <02cba58e-86f6-48de-a59c-6d31a29258df@linaro.org>
Content-Language: en-US
In-Reply-To: <02cba58e-86f6-48de-a59c-6d31a29258df@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_052107_587003_66CF1980 
X-CRM114-Status: GOOD (  24.21  )
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



On 09/09/2025 10:51 am, James Clark wrote:
> 
> 
> On 08/09/2025 10:16 pm, Arnaldo Carvalho de Melo wrote:
>> On Mon, Sep 08, 2025 at 01:10:17PM +0100, James Clark wrote:
>>> Most people also want all the SPE samples (instructions group), not just
>>> the flagged samples that are put into the various memory groups. These
>>> should have been shown by default but weren't because the default
>>> interval type wasn't supported.
>>>
>>> Also when looking at this, it appears that the downsampling was behaving
>>> in a way that would discard samples from one group but not another.
>>> Improve that and the warning messages.
>>>
>>> I don't want to put fixes tags on these because it's only changing the
>>> defaults and the behavior, but I don't think the previous behavior was
>>> incorrect necessarily, just copied from tracing techs but not ideal for
>>> SPE.
>>
>> I keep trying to find some hardware to have in my homelab to test these
>> series, but till then I depend on people having access to such hardware
>> for acks or better, tested-by, so waiting a bit for those to appear.
>>
>> - Arnaldo
> 
> Unfortunately I don't have any good homelab suggestions. Radxa Orion O6 
> are the only not-super-expensive boards that have it, but it's not 
> currently working due to some ACPI issue. AWS Gravitons also have it, 
> but you currently need a metal instance so that's expensive too.
> 
> Leo should be able to have a look at this one until the hardware 
> trickles down further.
> 
> Thanks
> James
> 

Forgot to mention that everything is available on the FVP model, but 
unless the tests are specifically written to run there, they're too 
slow. The BRBE branch stack test has been, but SPE and Coresight tests 
haven't. So not very useful either unfortunately.

>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>> ---
>>> James Clark (4):
>>>        perf arm-spe: Show instruction sample types by default
>>>        perf arm-spe: Downsample all sample types equally
>>>        perf arm-spe: Display --itrace period warnings for all sample 
>>> types
>>>        perf docs: Update SPE doc to include default instructions group
>>>
>>>   tools/perf/Documentation/perf-arm-spe.txt | 14 +++++---
>>>   tools/perf/util/arm-spe.c                 | 53 +++++++++++++++ 
>>> +---------------
>>>   2 files changed, 37 insertions(+), 30 deletions(-)
>>> ---
>>> base-commit: 75a7b9d29215c5aa813b9620f3c56817918f9f8c
>>> change-id: 20250908-james-perf-spe-period-4711a566cba4
>>>
>>> Best regards,
>>> -- 
>>> James Clark <james.clark@linaro.org>
>>>
> 


