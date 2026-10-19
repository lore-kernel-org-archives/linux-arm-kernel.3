Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D4DCCF2DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9/kdLN3peEHedgTST7BmoC/amAyj0eADKM6T0Uw2sA=; b=SHc1Sfyes2rhkNMonJoAjICPgM
	XnD4IS5VCV0aIj95xEYfj0n2XMKrKwpGQd0/JYcRuMHsIE0nkX0BQ1h/suwxP1JUx/KznSpy91uuB
	7NYTzUI/fymv7JTedyN1KrYpV0D/4r0OgP0qM8ZiQXcMDtFyp9uE1EK0xUtF2t1BBmimZjT45KwhI
	IaMLsOm85lS6zt+BdUgrS40cON2UC0CuH0JhnbgERnq+8WlI+sJtik7VtS6dsHypsLipdH5atinop
	kVUNXzQ3VfGRGhARnEvjNZu9ctyXSY9FMTzpANPEtEJfJS+tMxnCBJkhV+Ch4oEmMhtMV+bbWLhNk
	dyBH4r0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn0Z-00000007S6p-1JUD;
	Mon, 19 Oct 2026 13:02:31 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIn0X-00000007S68-0mHS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:02:30 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c3fd91337baso267594366b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 06:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792414947; x=1793019747; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O9/kdLN3peEHedgTST7BmoC/amAyj0eADKM6T0Uw2sA=;
        b=X/xchsBME4phDRfzFXk4Udra5TnkCyqNbgoz3845mZJFrp8cICc5RoI6qDqD2FVaUA
         v4RtVz2TbrK4fp8rbWFDryfVIjSsnSomfMj3uihtcoM/DpaG/7GeSnybJnGeyBLIrE3q
         cvC4soExJ+xamp+a41DWQw1I220dJadvvsbcangDcdfMUGM3S7iQH7AjqJCMAFE8wlt/
         Zxoy/kHN8DUH1dLK+jrBd67CIfrweR8vGSsboN0G6tA9q7xhW8IBjS2q4uwFCTJGAO1t
         c5lPOzcLH7ufsmTM8D4idOj7o1BunaIcNRDHA7J+IY7GmwnfHhNTtRQJLl0GtK+aS+/q
         7bQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414947; x=1793019747;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O9/kdLN3peEHedgTST7BmoC/amAyj0eADKM6T0Uw2sA=;
        b=vTkiHzGy0yPRTENFtGnXgt7HKp/CObXzRBMiSB9+jNaYo/YYCJjDgbDdrGDon8N83n
         2IWt9Iu5lwrN39QnFrrQE72cUgO84fSGdY06L79zXZ+N96B2Iwnh9iRJkzDl0Qqd0kTh
         L0wHnEc7zMyB5X78oXcvdTcEIzqY+cxVNNkzKIRhLEDFWxk/VhhRrnQQsWT9sbptykON
         yU9GupL1P0fmAtFcP95NMh+5ZLIDbjkQvo/CGD3XS0P6ehpkSTMMZ8COoYucH5LhAuIX
         UI5OQ+heZeYeeWp0XbmC+wbqmvmgnLeacMgfeGFddD3Xg2BCnCgxrzscm9kAVhO8dd4m
         9Njg==
X-Forwarded-Encrypted: i=1; AKwUvBxQe4OZudN0SbSl9AUhCZCmHd9gLTdBfLEm4YyMfuOB3fRrxQJrQxlcJrmKzGx8lfGghjPZMMuy3cNzGQtfYmZe@lists.infradead.org
X-Gm-Message-State: AFq9FYLRL4uhKOR7C2vxZ1XbGdq9P3O2z3RK2HxVPbxoOX6p0xVt2+gc
	P9lItRkPVK4XImR3/xF/mIiQ2ZDPyv3wlONY7oT7U/eqYuSRsaOlTVSV/Z0Rwv1Bl7g=
X-Gm-Gg: AYBFou3cO99QuHhc4YZxTrFMhVbp3FNNI1+q5xo0A7Fl/u0M6G6oZdIlZLwt/a3VPjd
	8o20gIjjdtm6Vcd6jroucRzyYjxJ2epA7N8ffsvTLWcRGPk1UCTEhsAnFD30mqYzka6n3lbbowG
	YZBzq8OF+IDsWtmZVPueO6Ivrsyfzzs21r1j0hwCzHPFgc9dGgC/LPEh2xn7UliRAvI4WBAa/Nm
	ljwUs8TLqk5nyN6qAVuQGvyJJC9kYEHQ5KYKlJRpD9mN46Jsf6A3Iw2GETEoIUhb9TPPdAUv6V0
	TauRrtuHFh8kRCudKivBCwHqYFy+QVotfU636xcSi3nha8r11i0NLTltlCwU/WkxGvj4lYpn4dz
	GlZ6l51hwgRFfAvCsiVzkyVWihJS0y/gRxOC69n4+P6wfyvdxb4sYyDm7aZ21xfZ42PvMtGvg40
	+p6w6NA2P3SjsUc+xaKMauf9uSYiUh4Afw8JKxqvhwJMA5/5e5icE0IwAHiV4svkfOCvENpNIVy
	Ew=
X-Received: by 2002:a17:907:b046:20b0:c42:102f:15db with SMTP id a640c23a62f3a-c42102f3704mr293529366b.34.1792414946853;
        Mon, 19 Oct 2026 06:02:26 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510201sm24019139f8f.55.2026.10.19.06.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:02:25 -0700 (PDT)
Message-ID: <5a438ddf-4e6e-4c7e-b6e5-0434f9d9dbe8@linaro.org>
Date: Mon, 19 Oct 2026 14:02:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/25] coresight: perf: Serialize AUX pause and resume
 with event stops
To: Leo Yan <leo.yan@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
 <20260915-arm_cs_support_aux_sample-v1-15-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-15-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_060229_249275_7C846B38 
X-CRM114-Status: GOOD (  16.50  )
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



On 15/09/2026 16:49, Leo Yan wrote:
> A PMU NMI can throttle a group during an AUX pause or resume, stopping
> its CoreSight event before the callback finishes. The callback can then
> restart tracing or reopen an AUX output handle after teardown.
> 
> Use per-CPU atomic STOP and AUX bits to serialize these callbacks. Reject
> AUX operations while a stop is pending and defer stops until an active
> AUX operation finishes. Complete deferred stops through etm_event_stop()
> and set PERF_HES_STOPPED only after disabling the source and path.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 104 ++++++++++++++++++-----
>   1 file changed, 84 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 8f803914e9abfb18e080ff68371ad8b32042f180..8020a4d8af18bb669441824cfdb687f4fa299eb4 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -4,6 +4,7 @@
>    * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
>    */
>   
> +#include <linux/atomic.h>
>   #include <linux/bitfield.h>
>   #include <linux/coresight.h>
>   #include <linux/coresight-pmu.h>
> @@ -26,6 +27,9 @@
>   #include "coresight-syscfg.h"
>   #include "coresight-trace-id.h"
>   
> +#define ETM_PERF_ACT_STOP		BIT(0)
> +#define ETM_PERF_ACT_AUX		BIT(1)

No comments other than naming. But would PAUSE_RESUME be better than 
AUX, or at least add a comment? It's a bit ambiguous what AUX means, and 
etm_event_aux_begin() is very close to perf_aux_output_begin(). Or maybe 
ACTION?

Reviewed-by: James Clark <james.clark@linaro.org>


