Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43140C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4X0rJxof+2GJrC9KukcEIGboMkLQCIpBwzQ5S+QwNnU=; b=28CBOBIHngG17xH8XzdnehIokh
	/58fIGj+yxEdT3pXsKaRot0iHNvHd7+OynIcwEh9YtiZjdYn6odwE8KGOOQmOTibF3BKsRHtBKjeQ
	+KbWmqSHQIVEsk3Or6F/VF3DYDl7FPG9E1YHGlMsurRnOWyHbrsVs43lAaM/23uaCH0nV9nYbXjWV
	5lIPTindA792HvpPXvGdBw7zTvmbVQVmXd/OBhryWe71Fk/+tlD85LhCEyRRZOgv7dJ0ztqksiX20
	vYG/xvWAqsfob3+44i7OoJ0frQHp01mOqGKpimGcow8RSx8QvCS0L8ofE75fKRpjbVVMFw7rPGoXz
	+0rmAG1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHSM-0000000DStm-2ifs;
	Thu, 19 Jun 2025 15:45:38 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDVC-0000000CtBZ-3dnp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 11:32:19 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso390691f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 04:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750332737; x=1750937537; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4X0rJxof+2GJrC9KukcEIGboMkLQCIpBwzQ5S+QwNnU=;
        b=m7Ebb9lIjwpaDoRltLCgBWecoL+kdRY9Admf9Dnq4+x3OVrVXLAPLozYpXIH7F51aL
         7MLsbiM9JDYZsd5p8MUBngsg8sRGeKGSnIdaQFH/1xUMG5mLurPVjWME2sr77hQDIkVt
         vi3IJSv8QwdEteMNpDoQx/ymfyHRs1/onOgdi4w8p3ZwMoCdY1lFALtNilKVIa/mbD/x
         UkDV405Vsx/7f515UmmL1xGp0sdewUwvCaGbqdcXNQkH9BeuRlxH03Ku7+XC58KM6z0N
         9fkabsy9yVD3Fiqg2Acwh0EMe/Xgo5H/chDtxhvOOwGzUWYExWNJzwiT7q7SVgV7WyMj
         D+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750332737; x=1750937537;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4X0rJxof+2GJrC9KukcEIGboMkLQCIpBwzQ5S+QwNnU=;
        b=hVN4b1Z0T18k4kARzVfLUHaVnd3ZmiW/a1aGA8Om7xRjxEcF5b14FHpC02jRNAmL3C
         kD5m9oaemslpK5+sChPeG9mfZNy9ukzERaZyNuM/ROmYhzSf0bC6dmpby7VzYdgXuXir
         yTU0vOaSX/yNUxswr3bl4mvXlXbcRhO0a9TrQ8ch0JkTbLjPDkcTRI4ASepjteVPiGyZ
         rv4lfZSRygZkvlZV7AIxf1p0T+OGDjq66FlTNz/Pn7x2GqivTnNYHtmLkJcuyWSHV9Xt
         rHuY0q37vou0naRcrx0WzD/osZ4uJXSIjGtswKzvsm8baurCikSZ0H2WW4rpnhYKMWFi
         2yEg==
X-Forwarded-Encrypted: i=1; AJvYcCWVi04WR3DWceUxPgcrO9qx12FK8dTqHIVgM01f6BpCz+1K/rnOBuZqhDF9WZe49uxHtkgpjbLfxAKH0OFSCBQx@lists.infradead.org
X-Gm-Message-State: AOJu0YzeDOICdLJot0oEOcr5uckfdnsaRKRiMxj/knvuS0fNWUfU631K
	Ydv3xo9st0uR4zoFfJyBjsJlAjoFwW5NJVPVb20pG5ml+7/KZfGrscuRP9kTAI2SNlVFmTSPuKq
	PHNaz
X-Gm-Gg: ASbGncvMEO9Dr2R7Mf/6kTdpLEzy7AZNJjRD2NCUCvNIAKW1a7xyXjip1IJ/kxINTsL
	1+jCGtqS664DsNiHe1m2eJYCcwZl9Z5jGE88voBVe0GtDHktLm1IKKjbyn6wH/ZTWMXmX0+RHmX
	jSWZFlP3rvsh32KoFYPmPC2sGxZRqATnS1ZGndahUJQS7I/DnHfMhXB8WmOoe/7MOcqPuKqS4zb
	egH28TNIHB9JaTMLUaOtkdFCfjXn6WYQtrQuBzVa120ILy0tcWSleMV9Wr1V3Jzw9oNpWZuFBeb
	imxRXx4YFm0NOO09DvQE984Q4QFHEh6zd/PzQdsI7P8FSOqJJmj4fyUpxVfTawCJD4s=
X-Google-Smtp-Source: AGHT+IGJVrLHFBFugL14B4WFHZ1t59fWsvRGspwqUSmcgvP8GTGmEKak9VjxtxP8UxFP+FgS9dzCOg==
X-Received: by 2002:a05:6000:18a4:b0:3a4:ea9a:1656 with SMTP id ffacd0b85a97d-3a572398df5mr17250936f8f.10.1750332737273;
        Thu, 19 Jun 2025 04:32:17 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b089b5sm19043643f8f.48.2025.06.19.04.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 04:32:16 -0700 (PDT)
Message-ID: <3431e6e3-a80b-4ce0-94c4-56739a5ed2d9@linaro.org>
Date: Thu, 19 Jun 2025 12:32:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] drivers/perf: arm_spe: Expose events capability
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>
References: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-0-6faecf0a8775@arm.com>
 <20250613-arm_spe_support_hitm_overhead_v1_public-v1-2-6faecf0a8775@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-2-6faecf0a8775@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_043218_917561_8CBBAE9D 
X-CRM114-Status: GOOD (  18.10  )
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



On 13/06/2025 4:53 pm, Leo Yan wrote:
> Expose an events entry in the caps folder to inform user space which
> events are valid.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/perf/arm_spe_pmu.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index be2ed326bb794d7e5dd1d6cfa89330753ced3ca5..b59c394b715bc49af0ae30c521f97813a046755d 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -116,6 +116,7 @@ enum arm_spe_pmu_capabilities {
>   	SPE_PMU_CAP_FEAT_MAX,
>   	SPE_PMU_CAP_CNT_SZ = SPE_PMU_CAP_FEAT_MAX,
>   	SPE_PMU_CAP_MIN_IVAL,
> +	SPE_PMU_CAP_EVENTS,
>   };
>   
>   static int arm_spe_pmu_feat_caps[SPE_PMU_CAP_FEAT_MAX] = {
> @@ -123,7 +124,7 @@ static int arm_spe_pmu_feat_caps[SPE_PMU_CAP_FEAT_MAX] = {
>   	[SPE_PMU_CAP_ERND]	= SPE_PMU_FEAT_ERND,
>   };
>   
> -static u32 arm_spe_pmu_cap_get(struct arm_spe_pmu *spe_pmu, int cap)
> +static u64 arm_spe_pmu_cap_get(struct arm_spe_pmu *spe_pmu, int cap)
>   {
>   	if (cap < SPE_PMU_CAP_FEAT_MAX)
>   		return !!(spe_pmu->features & arm_spe_pmu_feat_caps[cap]);
> @@ -133,6 +134,8 @@ static u32 arm_spe_pmu_cap_get(struct arm_spe_pmu *spe_pmu, int cap)
>   		return spe_pmu->counter_sz;
>   	case SPE_PMU_CAP_MIN_IVAL:
>   		return spe_pmu->min_period;
> +	case SPE_PMU_CAP_EVENTS:
> +		return ~spe_pmu->pmsevfr_res0;
>   	default:
>   		WARN(1, "unknown cap %d\n", cap);
>   	}
> @@ -149,7 +152,7 @@ static ssize_t arm_spe_pmu_cap_show(struct device *dev,
>   		container_of(attr, struct dev_ext_attribute, attr);
>   	int cap = (long)ea->var;
>   
> -	return sysfs_emit(buf, "%u\n", arm_spe_pmu_cap_get(spe_pmu, cap));
> +	return sysfs_emit(buf, "%llu\n", arm_spe_pmu_cap_get(spe_pmu, cap));
>   }
>   
>   #define SPE_EXT_ATTR_ENTRY(_name, _func, _var)				\
> @@ -165,6 +168,7 @@ static struct attribute *arm_spe_pmu_cap_attr[] = {
>   	SPE_CAP_EXT_ATTR_ENTRY(ernd, SPE_PMU_CAP_ERND),
>   	SPE_CAP_EXT_ATTR_ENTRY(count_size, SPE_PMU_CAP_CNT_SZ),
>   	SPE_CAP_EXT_ATTR_ENTRY(min_interval, SPE_PMU_CAP_MIN_IVAL),
> +	SPE_CAP_EXT_ATTR_ENTRY(events, SPE_PMU_CAP_EVENTS),

Would "event_filters" be a better name? Technically an SPE version can 
support a filter but the event itself might not be implemented.

>   	NULL,
>   };
>   
> 


