Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C804C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 17:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KIZvn3WMN/D9GaYJuL0YNSf8jbAXvNffTD/qUx3PrA=; b=t8mXdXE07Ocmu9Eop0tMg7iQGA
	XPeUl7fRGRYBhRF19/GZGECXSpMIsdSsjjxBsY9b7UWu1xYBle/9mhNmpqli/9lgCWcIlu8OnS2WA
	+c6YvbqxCyXB2MuTtK9I8vCEjb66WD72A6erSC/T0cOWwA+6nzLUHoInjMZWdWRILUQWHOCbsBwKq
	KghXY7EHvFZTJCgmotA8HaEmgcHwA6u5BlqwkwQy6ebHGaKctUnrFioYmQZiDhdZd4sJ5w17XEoP2
	cIFivOXu44i48cbESfpGsu/sHgK5JACR/MCbHcrnMGnqIyGjFj/+DvlV4xUekZ3hWB3WofmaBolLi
	5V9++JNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucS4N-0000000Ajep-2WbH;
	Thu, 17 Jul 2025 17:06:55 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRgu-0000000AgFL-20Oy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 16:42:41 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4560add6cd2so9994205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 09:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752770559; x=1753375359; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0KIZvn3WMN/D9GaYJuL0YNSf8jbAXvNffTD/qUx3PrA=;
        b=E72QsesnSfue5CK8dLIdT5hEhDTnyGCSFk7wcDTAIq38CFiCv57Nqh8E+bDpQbIlwx
         UOAWPiY/r0zG1vxsPs0UzpzR44CxI0EDHVABFEhtRmsLxLCrRZGctkYERTU38CrmrhZR
         KG/i0o8Lx7BGgFlDmXyn/RfhanTmf1r2Vj2yRQUIjY9dk/IdKJGF1TFDsDFfucSiFtzk
         mJN13xyrcSuc7s9PlDLXDr+sy2XA1m+ibyI4dwIIBrUEDxMxFeGBUzxDz5CTh4MmL2nf
         JEyUEAienPQFC0r4dwE+mpSEkkvqlyBnixdOlGoYPrxEppBgPL7G3qM1nRexnuEL0rbp
         KO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752770559; x=1753375359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0KIZvn3WMN/D9GaYJuL0YNSf8jbAXvNffTD/qUx3PrA=;
        b=T+xLuii8Ps9d5w7ei8aIdTm6KvpvllWqYzjWSPJaeUy92KQYza1dljg32T+oRHqDYt
         paJXep0EV7oYTPlp4UgjULgp5Ur03tXqb79fA5LOvgufCJgiWsv4ANlW+lRTQnozQJjq
         qzxitTXvR8hoeZpGQXjHyBF+Wv/xOI158JiSMkpIV1nM1jMelBiclRt6zqRzbQtezPXV
         iTBtS4ZL3vhiFmcxKU0Cq32QIGIL6Z0s3Mbk6+Ho4Nw5bd1bk7u/E7w1fyDl/D8nMdPC
         iFQSVTFQVbAjWoETXHM3koqoffwth067oBxmNlukA/rSbozCszkRfIRWasjn3QjV8Z65
         Yf7w==
X-Forwarded-Encrypted: i=1; AJvYcCUo3Soj7eGFpWu7uHP/WPLo7LzAJ61QDoFEeFZbSDRhUFG86H4Iu+5tsmyMPuFZcDAuwwQXfsHy+LOYWw+qxgNl@lists.infradead.org
X-Gm-Message-State: AOJu0YxkIISyMOTnkOqEij0MRpiVevMx77ILYlGJWbeVkQGjpIjmX7L9
	Bx5ckrLCeuVC4hfQWVh29+6D/gq6NbOZtyG1YAaj32/hNN4tE+NxWUq3K5WjgVXpIrs=
X-Gm-Gg: ASbGncv/44nzgvnKGzsxsIDNDTJCx9JA7GJb0Yr2Jx2u/H7U9Hp9EGMtmL+U+mK083m
	AGL1nBksmR49Koz/aozn8dG2n60ANiFrrtuONwxHUB3kZ+YcCsVOWDcelhuU3TExYbXModJ2Scd
	JPS0OjOtAO/ZScKjLzgHkWs3eKNzawrE6S3/gPqMmB3kaMM/ivXvK1Qdq8AmlY8pslg13Jnc2B6
	jNVVx4OAeOLxJUraSHJs1PhYtkiFzgrmAqQ8OfATtI2pbn0uG/0SWlZdNO6hNQzPC/co/r1WW5G
	CduGquQfAUNRTd0IIFnOAKKLxlRNB6PB+9oQBRsBHuzuxdVa/V9fWcX4T+liVaHMmSnoI5idZp9
	2noF/KjGsobFtF2ycwg5/uZ4+19g=
X-Google-Smtp-Source: AGHT+IHw2GCF56hApJyEmdx/xTKHHH5iV9N7ia+pyQS/X4tv7tXWZh4hCv08eoEvqDhMJOVRwHk5hg==
X-Received: by 2002:a05:600c:3f12:b0:456:1ab0:d566 with SMTP id 5b1f17b1804b1-456348cbdb0mr41924525e9.16.1752770558925;
        Thu, 17 Jul 2025 09:42:38 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45634f5dd61sm28041015e9.11.2025.07.17.09.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 09:42:38 -0700 (PDT)
Message-ID: <95468171-a09d-4b6b-a0bd-189d83ff33a6@linaro.org>
Date: Thu, 17 Jul 2025 17:42:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] perf: arm_spe: Add support for filtering on data
 source
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
 <20250605-james-perf-feat_spe_eft-v3-7-71b0c9f98093@linaro.org>
 <aHUOig-kaRo15ZH5@willie-the-truck>
 <7f51d4f9-7e08-49b5-ab43-8bc765bb2ca8@linaro.org>
 <aHkI5_IOV35L4YJa@willie-the-truck>
 <ca99af3b-e358-4c2b-8d62-0b6c29984391@linaro.org>
 <aHkWTlaRKdXbnA0r@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aHkWTlaRKdXbnA0r@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_094240_527431_57B48339 
X-CRM114-Status: GOOD (  29.83  )
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



On 17/07/2025 4:27 pm, Will Deacon wrote:
> On Thu, Jul 17, 2025 at 04:16:32PM +0100, James Clark wrote:
>>
>>
>> On 17/07/2025 3:29 pm, Will Deacon wrote:
>>> On Tue, Jul 15, 2025 at 02:04:18PM +0100, James Clark wrote:
>>>> On 14/07/2025 3:04 pm, Will Deacon wrote:
>>>>> On Thu, Jun 05, 2025 at 11:49:05AM +0100, James Clark wrote:
>>>>>> @@ -406,6 +416,9 @@ static u64 arm_spe_event_to_pmsfcr(struct perf_event *event)
>>>>>>     	if (ATTR_CFG_GET_FLD(attr, inv_event_filter))
>>>>>>     		reg |= PMSFCR_EL1_FnE;
>>>>>> +	if (ATTR_CFG_GET_FLD(attr, data_src_filter))
>>>>>> +		reg |= PMSFCR_EL1_FDS;
>>>>>
>>>>> Is the polarity correct here? The description of PMSDSFR_EL1.S<m> suggests
>>>>> that setting bits to 1 _excludes_ the FDS filtering.
>>>>>
>>>>
>>>> Setting filter bits to 1 means that samples matching are included. Setting
>>>> bits to 0 means that they are excluded. And PMSFCR_EL1.FDS enables filtering
>>>> as a whole, so if the user sets any filter bit to 1 we want to enable
>>>> filtering:
>>>>
>>>>     PMSDSFR_EL1.S<m>
>>>>
>>>>     0b0  If PMSFCR_EL1.FDS is 1, do not record load operations that have
>>>>          bits [5:0] of the Data Source packet set to <m>.
>>>>
>>>>     0b1  Load operations with Data Source <m> are unaffected by
>>>>          PMSFCR_EL1.FDS.
>>>>
>>>> I think it's all the right way around and it ends up being the same as the
>>>> other filters in SPE. Because we're using any bit being set to enable the
>>>> filtering, the only thing you can't do is enable filtering with a 0 filter,
>>>> but I didn't think that was useful. See the previous discussion on this
>>>> here:
>>>> https://lore.kernel.org/all/5752f039-51c1-4452-b5df-03ff06da7be3@linaro.org/
>>>>
>>>> Reading the "Data source filtering" section in the docs change at the end
>>>> might help too.
>>>
>>> Sorry, but I still don't get it :/
>>>
>>> afaict, if any of the bits in 'data_src_filter' are _zero_ then we
>>> should set PMSFCR_EL1.FDS. That also means that a mask of zero means all
>>> loads are filtered, which is what the architecture says and is what we
>>> should provide to userspace.
>>>
>>> Will
>>
>> We'd have to add another format flag to enable data source filtering then,
>> because otherwise the default would be zero and people's samples would
>> disappear.
>>
>> But the only use cases I could think of were more like "I want to see
>> samples from data source 1":
>>
>>    -e arm_spe/data_src_filter=0x1/
>>
>> Or "I want to see all data sources except 1":
>>
>>    -e arm_spe/data_src_filter=0xfffffffe/
>>
>> Filtering out all samples with any data source didn't seem to make sense to
>> me, and I think you can already do that with the other filters (remove loads
>> etc).
>>
>> It would be a shame to be inconsistent and to add an enable flag just for
>> that one case because the other filters in SPE are auto enabled for non-zero
>> values. Although to be fair for PMSFCR.FT and others, zero filters are
>> explicitly not allowed:
>>
>>    If this field is set to 1 and the PMSFCR_EL1.{ST, LD, B} bits are all
>>    set to zero, it is CONSTRAINED UNPREDICTABLE whether no samples are
>>    recorded or the PE behaves as if PMSFCR_EL1.FT is set to 0
>>
>> Seems like FDS doesn't end up as neat as the others, but IMO I can't see
>> anyone needing a zero filter. I did discuss it with Leo and we decided that
>> we could always add the enable flag at a later date if a use case turned up
>> and it wouldn't be a breaking change.
>>
>> But if you think it's there so it should be exposed I can add it.
> 
> What about if we expose the inverse of PMSDSFR_EL1 to userspace instead?
> 
> Will

That's exactly what I was thinking. It does seem a bit weird, but I can 
call it inv_data_src_filter and document it appropriately so it should 
be fine.


