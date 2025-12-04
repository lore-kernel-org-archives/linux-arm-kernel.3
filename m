Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6084CD1F9B9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 10:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MK1DoZ8jdaWVf6WB3pp5Ox5xAT5z0hNR1E+xIMlTlc=; b=Cct1EjhLLEdww02Y+5zh85F9/5
	XrXbhsqbiLhZ5BddF73zvr27wfoS48PuAFyN4h/GRoi8IwmXR0TB1RrKE6ayASd6BUuKwwxpRKI0D
	nSORFnskjgn/IWE9AMUN80y7s5IJbNAOWkeBz2kvW0jXdgSJTTSyxxhMhRVa2yJuZxe0D6m2ixPJB
	FOZgNOqGnwKs9TqNra4oTE+h2wJjmVBdHrnAwit1m20WfRQ+3ZVQgfpnYIr1vpLCHwV2QPv6sbtaE
	dmBRpYbzwbv1NG3JihpysOq/2uJzCbBc8QddEBg48cmFsoizQqWmV6DiEzF1xnj0tiP80D9snHxWZ
	JukyCNvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR6zv-00000007sWA-3dv2;
	Thu, 04 Dec 2025 10:55:43 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR6zt-00000007sVI-07rF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 10:55:42 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso8052285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 02:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764845739; x=1765450539; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7MK1DoZ8jdaWVf6WB3pp5Ox5xAT5z0hNR1E+xIMlTlc=;
        b=zAa/ZKa9JVvM9nMxoAHHP8B/LIJ9i/hYFBhzb23w4ux6Y9b33qBTbBlCroU98lk/Un
         ckjIiuKxVfbh07gbuJ6dRB5McZjWm03/41Cn2PoNYrulJYfp+V6Cp1vUClEENuJdomT0
         7uRoRzGOmVGm3HCWpEJwxAohVhHfyBKbuSe7O+ef4RjOZfj1oKednfRyiUaF/uaYusOV
         KGA2TnkKJFrJlKVx1NUFJPxNx6puFVgSSa4dZ0IJIqraJC4JrG178MzSKzgJWr75DpDT
         N4kUC1kfhVLpCaKQL74nETxzNfKN0diG/UMMEEA7D05icJq/4iaXahlVLlDOJiZvaebS
         2+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764845739; x=1765450539;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7MK1DoZ8jdaWVf6WB3pp5Ox5xAT5z0hNR1E+xIMlTlc=;
        b=N1xuJ+o8E7bg4nPK4+PBOcRL10X1xQ8rprnSsiKoB2BpTo42ri5snt4qzekDEUr19M
         sD1gmrC19nEFhkoUvyS7mZAAPVlFfJy9Lcod5VrAKl/IuKH4Y+iqa9JGuIlJxzvdni/G
         jq0U2N2umcmnY3Jfn9f0Giqe6ZlYzNzEHR1XaV9cQ6uIFktSqCW7eKkBrYkS/7IO1QjM
         fkQiIZXQ6FGMMDyM9iUcUg43FX6uiPBbVCrepWGqsiBJu6OohnJrmDPfibWdDwYyejwb
         8kJRNd3BpanYIWzgIeZPg6CNWg9I44grds7+vkVhx+KqZeTWowN9Cs1H0THrI/0+p+1V
         xQtw==
X-Forwarded-Encrypted: i=1; AJvYcCVv7mY37/GAeNoMynAxGsGszjTfKfC58ws5oSre9oxtWxMAI4oA/DeXdJlKvx2ua+R7SNLXd9tnYtqSXD/JotKH@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr9szkub/YkA7hZC7cAY7jGYfK3T7nIyMMfs/Vxgj+1hq2BG5b
	4oN1MzNUyCAABdJARVK5T5f450YwjZ3+9xkkpjN9lpcbn4bz6B2adP/MWZDE/GwS1Qs=
X-Gm-Gg: ASbGncuQiscXJxm9HxtPJ6wJv9N8oG+3ce20xfqKb1x4BgJUDeO7UfEiXHQDCGz8Gwy
	asVhh0G/rS239E80v4OE40VRliYQOeEaAWx/MG7RQCFFuRDhw05Gw8CD5HpqYrzRsy7XmCwWwlJ
	ep3Plnwk8BHwzIeEMqHrotVHOEsE+5RTUKvH6GTe70kuI5BqzJ/YkIREWAUiLObhvBTlvLrHdrQ
	O5V2GGb7xwBHjEqqJX5zeo+yoIN6hIewI6Q8P83eEcKk8FCaupVbHdVoaLmTfsK7YgogZMT561z
	bLHAgOIUUWhOe50Imx1xObzMeHPzgw0QrgMSu0sHUt4Lzd5wj1oZZnhBmRBsWXPChtPdSidKM+d
	3sUyB/84uFTDvmNzfGM0kR+2laYNxRZHF7x1XihjidxTGWqiNe19eZIOOuuJ1m2acLcgFlqD4aC
	4lFTbuF7OZKV1M3GNYYS4M316QGg0=
X-Google-Smtp-Source: AGHT+IF/hw6YXo0ND/050KonkHRNTrdsi5Huu1bqezplzyoJWuA2V3KAYQIym/bIYa2FHGR7FnQb1A==
X-Received: by 2002:a05:6000:4029:b0:429:b8e2:1064 with SMTP id ffacd0b85a97d-42f731c3147mr5483314f8f.47.1764845739098;
        Thu, 04 Dec 2025 02:55:39 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbff320sm2520602f8f.18.2025.12.04.02.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 02:55:38 -0800 (PST)
Message-ID: <96c54895-cebe-4247-86e6-d41b8be0dd40@linaro.org>
Date: Thu, 4 Dec 2025 10:55:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] perf cs-etm: Don't use hard coded config bits when
 setting up ETMCR
From: James Clark <james.clark@linaro.org>
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
 <53b24702-eb3b-4e08-bca3-70402eaf4db5@linaro.org>
Content-Language: en-US
In-Reply-To: <53b24702-eb3b-4e08-bca3-70402eaf4db5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_025541_413675_F16FFE22 
X-CRM114-Status: GOOD (  19.80  )
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



On 02/12/2025 11:53 am, James Clark wrote:
> 
> 
> On 02/12/2025 11:43 am, Leo Yan wrote:
>> On Mon, Dec 01, 2025 at 04:41:07PM +0000, Coresight ML wrote:
>>
>> [...]
>>
>>> @@ -746,7 +779,7 @@ static void cs_etm_get_metadata(struct perf_cpu 
>>> cpu, u32 *offset,
>>>       case CS_ETMV3:
>>>           magic = __perf_cs_etmv3_magic;
>>>           /* Get configuration register */
>>> -        info->priv[*offset + CS_ETM_ETMCR] = cs_etm_get_config(itr);
>>> +        info->priv[*offset + CS_ETM_ETMCR] = cs_etm_guess_etmcr(itr);
>>
>> I still think cs_etm_get_config() is better than cs_etm_guess_etmcr().
>>
>> For ETMv3, we directly pass CONFIG to the kernel, and after validation
>> in the dirver, then the value will be set to ETMCR.  If we already know
>> the config value is consistent between user space and kernel, why

One other note is that since moving the timestamp field, this is no 
longer true either. The value in attr.config isn't directly put into ETMCR.

>> introduce a redundant "guess" operation here?
>>
>> Thanks,
>> Leo
> 
> Because userspace doesn't always come up with the same value as the 
> driver. For example right now in ETM3, ETMCR_RETURN_STACK isn't set 
> depending on certain conditions that userspace doesn't know about.  ETM4 
> has the same for TRCCONFIGR_RS and maybe some others. In the future, 
> other versions of the driver could do different things as long as we 
> don't break decoding.
> 
> I didn't want the function name to imply it was doing something it 
> wasn't as that confused me a little bit. It's definitely not "getting" 
> the value. Maybe "guess" isn't the best it could be, but it's not far off.
> 


