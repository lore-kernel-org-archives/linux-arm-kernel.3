Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D094BD609AF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 15:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Z7tlw5t9I5onekdJgpQ0zadrbAsfQMzR4ajquHU3Zg=; b=oY4gUhhnwuTBIqwNOV7+NQVf4y
	IZNVQOv43iAXZmAu0zVKPBfB3wHlzUU6BaE8oH6KVhSp2fPAMeeUn7tTQYogoEZW2CwXXwXZYLTuA
	q+s2S6L26TvSc6IkHZOq8KjVbiLpxlNccmDoHlQW6HgVL7u1ya3NdHcivRRo3jK1iW8n4VEn/OXI7
	RgWMybilVp+9qdPimvtC3CRuCSFNj496sMdaS5KoN0oywNemIx3qE+m/R0jjh577f7v0LagG5f90e
	UTxYrF+V54Bet7ngRN1OjXFPuHihjORMBkABsErjHPB9PURSeSpaDH6qI7xyhSVZ7FXY+4rtzLnss
	ZWzGWFXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVX4E-00000005SF2-3XX2;
	Tue, 16 Dec 2025 15:34:26 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVX4D-00000005SEO-1BKV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 15:34:26 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b736ffc531fso949809366b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 07:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765899263; x=1766504063; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Z7tlw5t9I5onekdJgpQ0zadrbAsfQMzR4ajquHU3Zg=;
        b=dvj+dpuT/3Kr42OmpHZsS+OYRgWujd7aGP6nnk0j/ZHBnY0JbaqQMUbHO62GS/xggI
         cOEsSiW3hWThan1v+6evEOh+FHKX6JW/6yVzfJ6ubNr0zWFbj9Gy0IoLJ2MW/b4IMKLp
         AMqww907GnSifbZO1UJD2Lno4bQQsCdfECzmmAxUqE9dKx30vS+ifOJJ937Ve5JLXM6o
         c5YeGo1icZxcQMTLmFUZ93ntcD4I0FdPboejImMgp9FOX2wc8oyCtW8Kw6XKnY8XKjCU
         xUBMWe0xog9vEOmaWbw5tDR8Ji4gxUZY6p85hQcV+J+wrk6E1nOKQ/WtWwZMujG1wwqP
         iKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765899263; x=1766504063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Z7tlw5t9I5onekdJgpQ0zadrbAsfQMzR4ajquHU3Zg=;
        b=AlxdV1TQZDPP3FmmFHKYJMKckAIjEItH2h/Vwnt8HFRAuiwvSVBMrkP3zPjD8z4BMY
         uD2c74EOXsy0vvr1AlW94NaVvDRds5DDlOCbsT9frIa/WvwzozGShfd0HspKKS3iO5HP
         9kSnfWa2jXNW9x+ejWXdSvfNW/OYAuRjBYYw2rzBR2jlinQ7Mf4jkYfTBvdm18gaRUox
         pLvMHSOy9e73ZZLxSBNP/nbYgALu4PzJdxldU2J/hyTSo+xl+ucHPx3v4KMcinRlB5tE
         SHfSXSVTViBOVKChNwSggFLDKQxMucrSBA1iz+lTMvKhzT8+CQtSuLmZ9REGogLhRaZS
         HIyg==
X-Forwarded-Encrypted: i=1; AJvYcCU/5DymQsf4+ci2zcJN7v3QXEz+KJeftyUpK14OGbt6VwweXda5ojZBepZNC6ESnR70NRSbIZtV4sekjE3PjsUO@lists.infradead.org
X-Gm-Message-State: AOJu0YzMGSUGB7NWJKpkrhq2GRJ1KtQZsaHx2VKJIpKQjdig7nuRw4Wy
	3JwyvFP2TFthRJLx3kue97GGx5yuQfsm7pCvuceh1OFKKRD6tZCd6qhEgulhZKKM+3U=
X-Gm-Gg: AY/fxX4/y8jIL5ZO+vptviE4NnOPzYJAupkug8YvnS+2x/NunCgNh8/O/a9hi3vuuNv
	74syLlyjbNJlK+nIL+8ZEd1O22vh21aMrrfMkzzhMt4qmoHT8tfBvTPisDSYF+piBhtZBmwOaY0
	ViVjOi0DFlF/boEmz2PBPcx1NBNlrUiL4oh2jGe4k/+BC1242fjiwjX07vXuJ7+Vs4XDDDt3Lf4
	C/KPlOpXEMpWqukm02dnMWuBGbDIrvY2kzo/TtP6mFinUPBjxqwsH0anb3N8Yt4hnWc33IrbUgf
	fLcz+bbYeJdFGmxIzBZseLbDRMLGcKgjjVdrxcRuLUgr+4Qu6WFMajlo9grtA5+G8Vj864N3Tig
	CeShQhp+56DFH0f1J8lZ+/wl+hO9nwfmF53b87x8Co1cf5F9kA7ig82Fdwd8+A2VFoQRY2wJVcC
	r3HKr5stbRJyfGiMToUGSy
X-Google-Smtp-Source: AGHT+IF22aaOZPWW0s+RyYbbqasWTKDbfGAAOMHx5UEmfu9aMhShyeRKOYdJclKZV7/QUKufUhVM0A==
X-Received: by 2002:a17:907:608c:b0:b74:352d:6dc1 with SMTP id a640c23a62f3a-b7d236b61b4mr1659301766b.28.1765899263078;
        Tue, 16 Dec 2025 07:34:23 -0800 (PST)
Received: from [192.168.0.108] ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2ea57csm1713270966b.22.2025.12.16.07.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 07:34:22 -0800 (PST)
Message-ID: <e22497a2-1019-4eec-95b4-b6fd80090a3f@linaro.org>
Date: Tue, 16 Dec 2025 17:34:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/19] coresight: trbe: Always check fault action when
 updating buffer
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Tamas Petz <tamas.petz@arm.com>,
 Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
 <20251201-trbe_buffer_refactor_v1-1-v1-10-7da32b076b28@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251201-trbe_buffer_refactor_v1-1-v1-10-7da32b076b28@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_073425_349107_67091814 
X-CRM114-Status: GOOD (  22.68  )
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



On 01/12/2025 13:22, Leo Yan wrote:
> The current code checks the fault action only via the IRQ status bit,
> which is unreliable due to possible hardware latency.

This makes it sound like it's fixing a bug, but without a fixes: tag I'm 
assuming it's not a bug. Also I don't get how the change improves the 
latency situation, it still calls trbe_get_fault_act() basically in the 
same place. I think there might be another reason like it makes the code 
cleaner for a later change? Or the commit message needs some elaboration.

> 
> Move the fault action check out of the IRQ status condition.  This also
> causes the buffer size to be calculated for non-WRAP and fault cases,
> which is fine since the write pointer is trusted for the calculation.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 17 +++--------------
>   1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index f56ecdeaa6596afb440e4d53732e08a85f9bf89d..e579ea98523c24d23a0cd265dcdd0a46b52b52da 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -806,7 +806,6 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
>   	enum trbe_fault_action act;
>   	unsigned long size, status;
>   	unsigned long flags;
> -	bool wrap = false;
>   
>   	WARN_ON(buf->cpudata != cpudata);
>   	WARN_ON(cpudata->cpu != smp_processor_id());
> @@ -858,21 +857,11 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
>   		 */
>   		clr_trbe_irq();
>   		isb();
> -
> -		act = trbe_get_fault_act(handle, status);
> -		/*
> -		 * If this was not due to a WRAP event, we have some
> -		 * errors and as such buffer is empty.
> -		 */
> -		if (act != TRBE_FAULT_ACT_WRAP) {
> -			size = 0;
> -			goto done;
> -		}
> -
> -		wrap = true;
>   	}
>   
> -	size = trbe_get_trace_size(handle, buf, wrap);
> +	act = trbe_get_fault_act(handle, status);
> +
> +	size = trbe_get_trace_size(handle, buf, act == TRBE_FAULT_ACT_WRAP);
>   
>   done:
>   	local_irq_restore(flags);
> 


