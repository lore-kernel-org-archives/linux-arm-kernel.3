Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33551C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 15:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9o9XStLuurpqMGv7dh7QCRhtG3mn+IMSEac9X1lSv4g=; b=gohu8S8a+0vStXsVOeck/59yS8
	PORsuQNfEoVeNolNDiStmOuZwvByZkbdXHVM4LcHSHln3+mc9ac8ygvHrp/hJ9Hkn6ZHb4HdXQY6t
	XlC+KabhTVfRe8R9+wma9wGWJvnC7opUEnjcoGPgaxsNRK7IXlDPragZR2LH4Xvj9R6w1zKa1Q6u2
	yYpHHNBzTARE5+xwUC2N4BaIElP0TUBWF01U1WMUZJXaEtHVtIX6A+MTM0ljvEYq+zmEqGOVEhK8j
	H/UFPtxHZA6KfyYW8HK9O3WID61r0c1hQgcRNUfNHmOJ915DoWRQOxlOfbK2T8+RRGTdtdpnN832P
	GTR2I0Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQtQ-0000000AXrL-3fzq;
	Thu, 17 Jul 2025 15:51:32 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQLc-0000000AUSM-2bMx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 15:16:38 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso885724f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 08:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752765394; x=1753370194; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9o9XStLuurpqMGv7dh7QCRhtG3mn+IMSEac9X1lSv4g=;
        b=KQgOrRL4u3aePQ2cxX1N3DFt9NEGcH/7QxwgZioHf6dtII4G5q/CkySq/hXAZMHucF
         LFB/QLyZLbTqkaVmEGwqAu33Tsecb1woX95wugwQ/ahv6jJIJOxwJNz97bOwGRoLIZ1z
         q3qnTEX84wIMho+Rr0ndbn9IAAy2IbqVeKSiaaF/vaoQ3eggVtx2ps+TS/uBWhlHMYEa
         8Jo5AnTvY6i7bVE9eGAnRNPBJ4qsmxXxWkx1uABnc/enHRyUICQLLMelkFRLCsVNp9bz
         QuTlDywePlp9MBFD9UXUITEsrwy/LAr3HEXlmBUW9RkugpfoLSbn6+SMn2NclVCuhBW6
         Dw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752765395; x=1753370195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9o9XStLuurpqMGv7dh7QCRhtG3mn+IMSEac9X1lSv4g=;
        b=OqLRwaLmQF+otsyopDPNz3ctsXNS/eQCajxRaY+f69NRpfKz8ug0b174pB9Is19Wlr
         T/wPf9f4bKX0vm7AKVKfbw7T1rQk87W2A0OpE5RT8pwKZtYHKVSUTpfeNius75P8VD4K
         33jKXwLcoO0q//ditjcKaT/UuBbz+zUr/nWbsXxKgesGIZzGzbIDWCVpfWD8t7T+QyXA
         uVaAszC4fzYrv7D8cMLyvIYdmethJSpdG7Yjo1d7PpGB7fZHLAU6VXdOxOvG1ledUUa7
         WFCeZteXliYX8lzW2M7wXt+Le2IQqDgZsnsANl1jJGS66kUdtSdii26PI9qT/4GlcmKM
         t41A==
X-Forwarded-Encrypted: i=1; AJvYcCVSwSaEVjnoZYKf6r73nGXTcKbQ5ITzBGfL0oxN5t51ljqXyZlicON5WvO0VKN5m3rYo3k9thaQf0Hzfs8dKWzt@lists.infradead.org
X-Gm-Message-State: AOJu0YxYHRWS7F6Qt9aRGQtfazFsKJyla/E0t6wPsk8LYds6o6VY7OiJ
	NapGTsxc7eRmI0R7WUo6QusY79gplmRRtiSfOq7/4zuFf+0sYjWrqdai0hlCSbBLrpk=
X-Gm-Gg: ASbGncvlLMN0Py1DOO4My5lN8UvJ7Bx+p6K0RNqbB+4cJGqyL/9bAEQoZNnTdSnQfZZ
	D60BFd5mZVkiqdPOs9ta9/jPlmKHs9V/8WSQ8t+RJGP+H7TKnosvqUvnD0ekq0g7S2SXGHhgCWs
	RETXtgHdvhRrBsBclswTcFAPHKCoMWoxn47RDXZG1+OmrbuRzdk+0KBCo+7pv9V929K7TZD+icI
	5toLQmp7Ky4mfKoiDb/WlvfYD4QSF2lj59QeAkR/oPFyYIvXd6xKnTaEBnqjWavEwH4KoUDpPy/
	hmyWfkKFO6ksnJds60VgE/A83HYh5AUqa88jNijD7KSlNaicV6XuhV1PSM4hlXmlBH6u2gnavmE
	AURTZ3uB/2qla6ZgqQEr88u9O4IU=
X-Google-Smtp-Source: AGHT+IEOgsXesc4WriF6B4s4UdXOC/523vChLTF14vUDuJL5EdaGCxaHdXKmwN46VtYnX5eN75Kjsw==
X-Received: by 2002:a05:6000:40d9:b0:3b4:4876:9088 with SMTP id ffacd0b85a97d-3b60e510003mr5758377f8f.46.1752765394479;
        Thu, 17 Jul 2025 08:16:34 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5f32ed100sm18096525f8f.0.2025.07.17.08.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 08:16:33 -0700 (PDT)
Message-ID: <ca99af3b-e358-4c2b-8d62-0b6c29984391@linaro.org>
Date: Thu, 17 Jul 2025 16:16:32 +0100
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
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aHkI5_IOV35L4YJa@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_081636_677982_DC1EDB9A 
X-CRM114-Status: GOOD (  29.14  )
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



On 17/07/2025 3:29 pm, Will Deacon wrote:
> On Tue, Jul 15, 2025 at 02:04:18PM +0100, James Clark wrote:
>> On 14/07/2025 3:04 pm, Will Deacon wrote:
>>> On Thu, Jun 05, 2025 at 11:49:05AM +0100, James Clark wrote:
>>>> @@ -406,6 +416,9 @@ static u64 arm_spe_event_to_pmsfcr(struct perf_event *event)
>>>>    	if (ATTR_CFG_GET_FLD(attr, inv_event_filter))
>>>>    		reg |= PMSFCR_EL1_FnE;
>>>> +	if (ATTR_CFG_GET_FLD(attr, data_src_filter))
>>>> +		reg |= PMSFCR_EL1_FDS;
>>>
>>> Is the polarity correct here? The description of PMSDSFR_EL1.S<m> suggests
>>> that setting bits to 1 _excludes_ the FDS filtering.
>>>
>>
>> Setting filter bits to 1 means that samples matching are included. Setting
>> bits to 0 means that they are excluded. And PMSFCR_EL1.FDS enables filtering
>> as a whole, so if the user sets any filter bit to 1 we want to enable
>> filtering:
>>
>>    PMSDSFR_EL1.S<m>
>>
>>    0b0  If PMSFCR_EL1.FDS is 1, do not record load operations that have
>>         bits [5:0] of the Data Source packet set to <m>.
>>
>>    0b1  Load operations with Data Source <m> are unaffected by
>>         PMSFCR_EL1.FDS.
>>
>> I think it's all the right way around and it ends up being the same as the
>> other filters in SPE. Because we're using any bit being set to enable the
>> filtering, the only thing you can't do is enable filtering with a 0 filter,
>> but I didn't think that was useful. See the previous discussion on this
>> here:
>> https://lore.kernel.org/all/5752f039-51c1-4452-b5df-03ff06da7be3@linaro.org/
>>
>> Reading the "Data source filtering" section in the docs change at the end
>> might help too.
> 
> Sorry, but I still don't get it :/
> 
> afaict, if any of the bits in 'data_src_filter' are _zero_ then we
> should set PMSFCR_EL1.FDS. That also means that a mask of zero means all
> loads are filtered, which is what the architecture says and is what we
> should provide to userspace.
> 
> Will

We'd have to add another format flag to enable data source filtering 
then, because otherwise the default would be zero and people's samples 
would disappear.

But the only use cases I could think of were more like "I want to see 
samples from data source 1":

   -e arm_spe/data_src_filter=0x1/

Or "I want to see all data sources except 1":

   -e arm_spe/data_src_filter=0xfffffffe/

Filtering out all samples with any data source didn't seem to make sense 
to me, and I think you can already do that with the other filters 
(remove loads etc).

It would be a shame to be inconsistent and to add an enable flag just 
for that one case because the other filters in SPE are auto enabled for 
non-zero values. Although to be fair for PMSFCR.FT and others, zero 
filters are explicitly not allowed:

   If this field is set to 1 and the PMSFCR_EL1.{ST, LD, B} bits are all
   set to zero, it is CONSTRAINED UNPREDICTABLE whether no samples are
   recorded or the PE behaves as if PMSFCR_EL1.FT is set to 0

Seems like FDS doesn't end up as neat as the others, but IMO I can't see 
anyone needing a zero filter. I did discuss it with Leo and we decided 
that we could always add the enable flag at a later date if a use case 
turned up and it wouldn't be a breaking change.

But if you think it's there so it should be exposed I can add it.

James


