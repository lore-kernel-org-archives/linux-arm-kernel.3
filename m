Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCF4CCF2C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 13:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tsX0Fx1Vu5oxDkz2SE9XCwKJJhLzTUajSbyoGIgpXkI=; b=Qy1AdCwbou1fXJTynfpTTDdRn9
	w0GzQBgu6MIjDp58PfiDuy0lSkIbre5sR8myzfhwIvhf8aXM+5F28fw63lRIiV1buoirJWmfsskwz
	tOiyTEVnpiqnOIKE8vY6WUeScC56ZryE0RdtHo6PtI/YjsWkYsxQnsu4e2k57PvWyKSbU74aA1XK+
	L8wuzfuDf+OhETEaUHN+ySUr41r2D06oEau9c9cIfEaXi71vbYokiyP2leT1K0Ga6XPHhtZjQGuwL
	86mZfGz2Cld5FFrA1Q9113VTrFi834xl8n216pMXuzkWBZsFc91s4ts7fgOzIQB94a1yn1KE7rOQR
	g115NBvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhlg-0000000319T-0OCb;
	Fri, 16 Oct 2026 13:14:40 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhlc-0000000318T-2ZOz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 13:14:38 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso28014915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 06:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792156474; x=1792761274; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsX0Fx1Vu5oxDkz2SE9XCwKJJhLzTUajSbyoGIgpXkI=;
        b=XH6Rp3CbDE0TflciPk6c8kCAltHIAI5EONFk9KJGltQ9tZSLgQY0mHYYjAB7E80Wyl
         67yretPqRBpP9Zwet3N96tmVMMeZxOC1kUAFMikDGBZHWciMQrqKKbzUsVs5k3mOk1H/
         f/SxUbz2amSI6WCil4OSqLD32Zn+P+XFhNjSk1KYND71UoJyC8Ykm+qUZD1kAVQaPA1t
         4GX7P9gJltbjEwJameOWsCERaXJuHcWfeVaym4keTwISI0t7tQvWFG2MZVUbWJsquPSI
         dNxJrF/YLRBGP3pKlMRMdji6wyGC678Ija5VMOLGP1tNNYbrKIQbci+oi76ejlI7iD82
         0K+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792156474; x=1792761274;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsX0Fx1Vu5oxDkz2SE9XCwKJJhLzTUajSbyoGIgpXkI=;
        b=FrwSRDvjvdiEji5p8+QDB8vH3TUtL+kYzJJqbVt7y9pv5Ujx+ktjkNFa84vTH26KkN
         nbKmef6GnJMUmpqxblwNyUj0ONZ/qG/NIm+/T2zEl0EEhnLp66aRtff36K7mzr+Gnyjr
         yAAj4RX2ID7+VWhgF5voNpRI3UpauhR9NAvm4cAo1CCb0P00JffugyxcNDNn1P5mkI8S
         VJHd+waufxQGZlPCMZRnQeyd/u5fSVSyMtrGhij4N9HaEKU0xGFNjqQa+d4WEdNlo/QJ
         gZ93bOgItGcl4V3NWCaYlElQDr1/PBWBXh/v+3TVW5HhSAONuKIhUDBipAHUCu3Em/CA
         1Xug==
X-Forwarded-Encrypted: i=1; AKwUvBxkYPXEbeEvnIT6ax4iPSpRk9j2amdKNvIv6cxZor1ZiXf3esG1ybD2skFHRKuEPiaf18Surw6eYanf8aHpzl5x@lists.infradead.org
X-Gm-Message-State: AFq9FYJl11Wx2i8y8AdxaxY+kdkaDnGS7MUtNeELao7Mc+qj/HFS2+IE
	wXibApfK/rq/nB59r6nlk6uG0yyCofQYg1B+NnwMCt0gKvQndjfkbiwiLsnZbYMy79s=
X-Gm-Gg: AYBFou3ifssmECvANFkXJ5SzltDQzubo5NmOH1nWcZvyckrp2IX7boYmqAZteBNgz2J
	8AgCgukUHLfOsICZH4VUUpLrWJbsRCbZk05GTX6sEl18ncIAP1+y1lYfW2PXaMCVFHAOEsuzYiE
	llEpDfwHdwunYmF+TnOtrjBfwgGazfGKE3nIDEsZzzbjuBY46MB7Jj4eub9GQ7RV7EUy98QjZTM
	O7RcJiEgCK9tKUldwKmKD0nE5ZFLME5DqouF7nq39Id5SzKhn6ULxCD1DGcqzgilRfAU5dUBTVC
	WhNzNtxuOW+FFFCJdAeuaorZzVhJKYl7L9OSleEe0dpGAy11pDn4CleDouugPwWbyAxikg4zsuE
	PoxG00ejT7wpcJMsNTb8tGKrRpUqfnbKBAVhHfZ94ICztNYGRFU9BAZGLThC2A0ZvQrB3QTbTHP
	OW9UwTljqOLPg14vOLKQe2Upq3RoV7JwKK3Xg7YbLj8onopHH0uYRy1d8lfajj+R5bxeXCqnk/m
	C0=
X-Received: by 2002:a05:600c:3144:b0:4a1:70b2:8dbb with SMTP id 5b1f17b1804b1-4a18e4b0347mr432306165e9.19.1792156474596;
        Fri, 16 Oct 2026 06:14:34 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ac4c70sm45400235e9.2.2026.10.16.06.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:14:34 -0700 (PDT)
Message-ID: <13ac34bc-fc8e-43b8-8976-05e91ae46e71@linaro.org>
Date: Fri, 16 Oct 2026 14:14:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/25] perf/core: Reject non-positive AUX snapshot sizes
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
 <20260915-arm_cs_support_aux_sample-v1-1-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-1-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_061436_675732_A43D5A80 
X-CRM114-Status: GOOD (  18.95  )
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



On 15/09/2026 16:48, Leo Yan wrote:
> The existing validation rejects negative copy errors but allows a zero
> return. In that case no AUX data was copied, but it is incorrectly
> passed to the alignment-padding check.
> 
> Reject zero together with negative errors before calculating the padding.
> This reports the invalid snapshot result and avoids treating a missing
> AUX payload as alignment padding.
> 
> Fixes: a4faf00d994c ("perf/aux: Allow using AUX data in perf samples")
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   kernel/events/core.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index fe33fe15689d077e7f445c0b17d9c2e638c884a1..17355e4b8b7c6c106117153c9eb8509e6f9a41e3 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -8058,12 +8058,11 @@ static void perf_aux_sample_output(struct perf_event *event,
>   	size = perf_pmu_snapshot_aux(rb, sampler, handle, data->aux_size);
>   
>   	/*
> -	 * An error here means that perf_output_copy() failed (returned a
> -	 * non-zero surplus that it didn't copy), which in its current
> -	 * enlightened implementation is not possible. If that changes, we'd
> -	 * like to know.
> +	 * A negative return means that perf_output_copy() failed, while zero
> +	 * means that no AUX data was copied despite a non-zero request. Neither
> +	 * can be treated as alignment padding below.
>   	 */
> -	if (WARN_ON_ONCE(size < 0))
> +	if (WARN_ON_ONCE(size <= 0))
>   		goto out_put;
>   
>   	/*
> 

Reviewed-by: James Clark <james.clark@linaro.org>



