Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EE4CE8D40
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=spQr/NA76+OWDiEmTNKSTkOX2yR6kDRejGdoeHR8vFc=; b=jM0pWKyyC/VV2ehzhTCHSoC9v0
	pZbvkkS8GhjVx2boNNi7UT2hinT8z4XNP6IV3mnIcIuB5UuUw4AQ1Wz5HUz92fmidCl/vltkP3gUF
	G6oql4RMBmCfWqYPBj32wHmrPHbUCDgFiWOJ/n4vUWDPU9SlB+ZVyaeDvEQHwRiGpw2GIX/gPQz0G
	nCp1mrUT2Mwh8bvrw7WesXHTq+lZB1/Kz1CBLrXUBbrmbW5eahP04xtaUj8tXqthgvMXnZOZoR/o0
	8DqaVhlgrwKI1o7OJM1XE68oHvOkGenDs6BRMTyvzPh73BN9wDd7xbhh3nZAEvbgPgJUkMaRyGiUd
	hASgmIvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvcF-0000000CXby-0LHA;
	Fri, 14 Nov 2025 15:21:35 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvcC-0000000CXZU-39oc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:21:34 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47790b080e4so3730665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 07:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763133691; x=1763738491; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=spQr/NA76+OWDiEmTNKSTkOX2yR6kDRejGdoeHR8vFc=;
        b=SMU619RDwB+HYa4jB50niAPOOacrnJYQpaRfCIOCyfzYMc6cyOXCj6Mi+cTmE098TR
         7mR2D4ryjY/1bW9dE/27VG3eT3K/2XWXUQFkYwMj7xUB5XK+wmCk3IQBWrUsVmJEoy9e
         6esBQ1CGAb8A5pSCxlPuWaNFlS2sl2gxrcRtMSBN1z6+kGawe3y6L8JgEAqUFkDA1rZT
         wbOoNFJshPbQyBAOPeCkADyH9oXm0tRsCocKI55nEYL3IBJkZTSfYQ2Kcz/QIqgSqzfr
         oyJJQKeSpSiPU0s+dQiiOcEZ9wYcjpryI7BW3mJ3lbngv8Dv4moHLv5OaHYVq5HNFfEo
         G+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763133691; x=1763738491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spQr/NA76+OWDiEmTNKSTkOX2yR6kDRejGdoeHR8vFc=;
        b=W3EfmiBFAEao5koZh/vDtcLqK5oi495wnajE5hsviNCmvXsGEDJyCQ8QMHI0Ee2Uhx
         md6PLbHqqsMxaJSQXxR/E/TaVeYZKrmNqTjNqyTPrQ+u3sAel9nIAkjJtn3tzmFZ0llD
         2BTlCeHHixlpevkKuLZSwiTV6UJj9mUb5sCuikwOjIXqTNHEBeZgtooAwEqf0/97J/9W
         wtTfTygJmvTjjVso+ksMDctS2zwBcK+2YkziN2DnhQkvqjOkvy6Bwqov0+Cq8BqB3tUf
         DBMtjIHh0tpQGSWtgIJUq1uKKQlywrh1RnuzOYTHu6H+orSG451sTLlU3wh8sN65AdqX
         QgMA==
X-Forwarded-Encrypted: i=1; AJvYcCV2qdDIGB6fGjF0kLhrqFx1fmQsDOU1y9cDU7KheVoaR49Luq/wTK313cB4B5X6FkvsXkGU72GcdHROr2kOCwOI@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8r1OcyTB9ZQhwdZb0dHWEKuMx01GwM2ctRd2f9lQTi1fR2zPR
	7MNa5CfS/xFfV9aGqbS+GGwcZEXY1xBeNtikv/dtNCYLFVqE5KbmUy3MUlkgTfB1NPw=
X-Gm-Gg: ASbGncv9HcVckI/r0UjvDG6NYgs68N2pV36xUZwsXqOPF+aUxKmW8DmfljL348U96Tq
	N7Msni2Jv5BaJz/GmE5F59vruCrw/E62V12rL1RYBu8j/CVVGNXL3HGuQk0ErwMxcwneyyNuLWx
	SXIHWZVKRKb6zapK/u/4Ag3YU8BKu9xy/m6ADuPALpdKkozZC85bY1JRPS5eyEgIwCabNtFKJp2
	Gxw5bxTfL5LYJIxDlWdP7ioGuejWKOr1VB5FaBb/qkoPazEXMd1B/TVr76F+l3HkvmOcXb8+TSr
	qzy7LxHDjTZQRBgoUySHYdo0Zm4nq5pqKOqKL0QYMEx8s/MMcDFWyIpB2wvdBCr/nUtxh9hXtm3
	jBYtyOlTpZ6qt8gicuR/D6sCl6+U3EBXl2unanzztLtGNseOyc64EEyqQLbIvAtVNn/SZxFd1vY
	JFSln0R3vhS1Y0PuPE
X-Google-Smtp-Source: AGHT+IFF1t1CoxEZ5R530Db9r2XX566FpGv1PPCAcKESuGedkS3oZfaEcKSquxVavWe1ChO/EKFlrA==
X-Received: by 2002:a05:600c:6288:b0:46e:4a60:ea2c with SMTP id 5b1f17b1804b1-4778feb83eemr31863195e9.37.1763133690910;
        Fri, 14 Nov 2025 07:21:30 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477952823d3sm12900885e9.11.2025.11.14.07.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 07:21:30 -0800 (PST)
Message-ID: <a836bd2a-ef60-439b-9ad9-10e5888f22c7@linaro.org>
Date: Fri, 14 Nov 2025 15:21:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/13] coresight: Don't reject unrecognized ETMv3
 format attributes
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-7-165ba21401dc@linaro.org>
 <20251114151810.GG3568724@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251114151810.GG3568724@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_072132_825220_4A0E4DD9 
X-CRM114-Status: GOOD (  20.98  )
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



On 14/11/2025 3:18 pm, Leo Yan wrote:
> On Wed, Nov 12, 2025 at 03:22:13PM +0000, James Clark wrote:
>> config isn't the only field, there are also config1, config2, etc.
>> Rejecting unrecognized attributes is therefore inconsistent as it wasn't
>> done for all fields. It was only necessary when we were directly
>> programming attr->config into ETMCR and didn't hide the unsupported
>> fields, but now it's not needed so remove it.
> 
> It is fine for not validating all configs (please ignore my comment for
> checking all configs in my reply for patch 04).
> 
> I am wandering if need to remove ETM3X_SUPPORTED_OPTIONS totally. I
> saw etm_enable_hw() uses it to clear config bits, so it makes sense to
> keep it.
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> 

I tried to remove it, but as you saw it's used to clear the old config. 
It wasn't obvious to me if there was some other state in ETMCR that 
needed to be preserved, so only selected bits are cleared. I assumed 
there was a reason it wasn't just overwritten with config->ctrl to begin 
with as that would have been much simpler.

There wasn't a comment and I didn't want to spend much more time digging 
so I just left it. I think it's harmless to leave for now.

>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-etm3x-core.c | 7 -------
>>   1 file changed, 7 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> index 4511fc2f8d72..584d653eda81 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
>> @@ -333,13 +333,6 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
>>   	if (config->mode)
>>   		etm_config_trace_mode(config);
>>   
>> -	/*
>> -	 * At this time only cycle accurate, return stack  and timestamp
>> -	 * options are available.
>> -	 */
>> -	if (attr->config & ~ETM3X_SUPPORTED_OPTIONS)
>> -		return -EINVAL;
>> -
>>   	config->ctrl = 0;
>>   
>>   	if (ATTR_CFG_GET_FLD(attr, cycacc))
>>
>> -- 
>> 2.34.1
>>


