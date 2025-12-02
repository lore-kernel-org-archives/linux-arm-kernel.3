Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121E9D116F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 11:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ky2w92Omxf/9BARxmiNxHekw/fnnKDmtTcKK+1HQF10=; b=NWyMoGUc32pZyjumrlogCoKjAT
	khGggQhul5alfJXAlFjq4EKNC0I8Luf8NdLr2p0eQnhZrR/2xZXPOsYjUqjfC76XgsVeHUXCQmkIv
	B6qH/KBGTW0MFCm6L+vajYB4JzCZnObtYvAKrWn+jn7EzJCbnDFQuWCcA18y0cCIjdl7icUlBiwWA
	vUucUuNjEYwiEysYMS8kypkt9qxKFZ6q1vHwu79HaHMN4pjLEzjjWNLdZyn6Fz+HDIEfKcC1S6s8w
	/7jtXmvYquDhERPLbN8zN4wKTVFIT5odS6mqBWUeM50bQ/Tmlpc+Mg36YQAT+f72WmZ4OOhvEvwmA
	0ccVa7Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQOws-00000005LJV-2FMI;
	Tue, 02 Dec 2025 11:53:38 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQOwp-00000005LJ2-3P2u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 11:53:37 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so55547215e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 03:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764676414; x=1765281214; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ky2w92Omxf/9BARxmiNxHekw/fnnKDmtTcKK+1HQF10=;
        b=ynfxy7spD0mDrsJLqze6gOCVkzi3/puNBjPfMPfUcrZnji5McZtrFf0BUCztblfSRq
         U1y7KM9t8vkW7Hy4d8UAzZXmKfeunnVlrODvjAbzVUS7dxgx+fk3+T1tcRej1ScB19U3
         9reeKnYwaanaBY4rizBahhjzg1IClEpsy/9y45Pvnd9V6zHgJpFqZiMGG7GWrEuWddcG
         0oGrN6L8EaTy+YR3McUaqatb5dEB+f0mm6ThaOj3NwCfYOQhLisdIJsCU0KsrKVMZvqq
         +y3Xpf+kEUWKrN999677XWnjCetpAL9fpNTb347XvesavulUPLH8QKWUZeL+AhcaPbfa
         2nzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764676414; x=1765281214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ky2w92Omxf/9BARxmiNxHekw/fnnKDmtTcKK+1HQF10=;
        b=Rpz00GXisDGZ8FsIpcwEv32YF1fPUwgV9lDlpXRVgmmEEc/dFvewDQnzLcEgwEELHB
         0UgmIsrIl5PgJN84CeGVaPF1cTv+md9jHFlDA6ouy91JRU9GzSvKeVQff2AnHtU+9X9t
         5wNR2ZvrCLGzTUUyNg44w2S/uphHhz3IoU67cXEXL7x8XEiHdXktbKJhx4sUtoUjJ38B
         gNQfXAmXg9ZyUvwdBjRWFLsFD1IdiFVJvAg7ZGxLeH9W00qoo4ggL5R60Lge/Hhx7C+A
         VOeF1CjJIobh4CA7xyYjQzCa+05G2FtUXVUIC1LNWxGOUktASjGMYxghorr5dWX1vXqL
         3vWA==
X-Forwarded-Encrypted: i=1; AJvYcCXVF+nVqNFJrOM5CoymlGKlgrFFGc2gbvMVPxH/Rk1ErGZBd1qPbjqIK2M+eBSP21YJ4kQW+Mr/zgGYprBTIoKu@lists.infradead.org
X-Gm-Message-State: AOJu0YyXMJViCmwRZwRyz+QlPCixlCKFgMpAlDCbg9EcVlykgQjYjUHV
	1txEW37wANMpTeYg4S6UFY7XIY8AvsEEtMVFeeVGaLZQ6Jy5qOkHRsxxsLNThd4rcd8=
X-Gm-Gg: ASbGncuBf4cgkcoJV/gImpPgeM1eWxpaqW9Lv1lWsMWIKjGqL+NP03zGVQInhcC5Jqk
	uGcmoaHC/ywPWCgT0fOSocdel9NXA8vsIY/puJGJsFCXo0rd/QLo8dIvllNAY/6L0VCmQ+ID7U0
	qnNxg+Z/cGAVuGrzg14FE9d11eF3R39tfRdlRIHfacu1z0vNtbBet0ZkqCSgh+FDYGPR6ogs6F5
	ApOr1GEQDn1V2EfFB7pjeE1c2gFCJVN1qbv2YRpqGWBg9XERl8JNCKZkvaO1BqN7i00iN2icnio
	G3sAHqhnecVkyslkJiOv9lWN/YFaLpEO1bsdqIjWANpVzUSkk3eJhRM/HZMd/nRTeHGxzFGS/+v
	9DBcEN5xQJFor7PpH8I6YZDSMRNEcWZhU0jso3nAFzcVIxpYoLu+PZTaM6YLA7fwe+YT/IGyPAJ
	cdcMWDg2hdbqOQ4AfSivMpD5362Lo=
X-Google-Smtp-Source: AGHT+IFqrU0V5kVs+TCC64I17yPQZPoR+/rmB0ZAiKwFTKFWsdVaHH9xBGMrsABLHFk1fUDVIMmffg==
X-Received: by 2002:a05:600c:4f46:b0:477:63a4:88fe with SMTP id 5b1f17b1804b1-477c1103099mr430150565e9.2.1764676413790;
        Tue, 02 Dec 2025 03:53:33 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm353207785e9.8.2025.12.02.03.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 03:53:33 -0800 (PST)
Message-ID: <53b24702-eb3b-4e08-bca3-70402eaf4db5@linaro.org>
Date: Tue, 2 Dec 2025 11:53:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] perf cs-etm: Don't use hard coded config bits when
 setting up ETMCR
To: Leo Yan <leo.yan@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
 <20251201-james-perf-config-bits-v1-4-22ecbbf8007c@linaro.org>
 <20251202114300.GV724103@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251202114300.GV724103@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_035335_881573_E5438150 
X-CRM114-Status: GOOD (  19.33  )
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



On 02/12/2025 11:43 am, Leo Yan wrote:
> On Mon, Dec 01, 2025 at 04:41:07PM +0000, Coresight ML wrote:
> 
> [...]
> 
>> @@ -746,7 +779,7 @@ static void cs_etm_get_metadata(struct perf_cpu cpu, u32 *offset,
>>   	case CS_ETMV3:
>>   		magic = __perf_cs_etmv3_magic;
>>   		/* Get configuration register */
>> -		info->priv[*offset + CS_ETM_ETMCR] = cs_etm_get_config(itr);
>> +		info->priv[*offset + CS_ETM_ETMCR] = cs_etm_guess_etmcr(itr);
> 
> I still think cs_etm_get_config() is better than cs_etm_guess_etmcr().
> 
> For ETMv3, we directly pass CONFIG to the kernel, and after validation
> in the dirver, then the value will be set to ETMCR.  If we already know
> the config value is consistent between user space and kernel, why
> introduce a redundant "guess" operation here?
> 
> Thanks,
> Leo

Because userspace doesn't always come up with the same value as the 
driver. For example right now in ETM3, ETMCR_RETURN_STACK isn't set 
depending on certain conditions that userspace doesn't know about.  ETM4 
has the same for TRCCONFIGR_RS and maybe some others. In the future, 
other versions of the driver could do different things as long as we 
don't break decoding.

I didn't want the function name to imply it was doing something it 
wasn't as that confused me a little bit. It's definitely not "getting" 
the value. Maybe "guess" isn't the best it could be, but it's not far off.


