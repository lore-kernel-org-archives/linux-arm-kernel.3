Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843F8D20697
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 13:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSmzlby0QxkDml2TLqk35SaCbc5wltAvOYPrtePTW+Q=; b=t0844RyhXfY5vUkZ7damXo2aEv
	RR9gejpVFnDoiBiOaYzCZiPT3hvYvDgtdLT1YlRbqGdPjMdJYn3abqqev91ghAptzLMjchhZ9DLls
	IPJmTXSs+kgCIbNB7LEbaEG7Wka9B8jguxGdMUxt4+laZQQ4efB+jd3uURqsIVHTxjQzJ6PuYp6OR
	cobyri7xVpQxW9mV4+KfZpRByz/ndk1LlS2MBH7OCNiMnq6wazM4hcJuELD2h5XY680+FITNum1Qo
	iEN4YzABp6ASwBU6rp0ptKYISzaL76s/fOXZzg0CScNAinh/QyJgOJZnwnXoI/T0IXFRJL1tN43ij
	x7OqFV6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9hO-0000000857C-2VsV;
	Thu, 04 Dec 2025 13:48:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9hM-0000000856p-0fw3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 13:48:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so8740305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 05:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764856122; x=1765460922; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vSmzlby0QxkDml2TLqk35SaCbc5wltAvOYPrtePTW+Q=;
        b=WEf+S+iFFbTG0MuC7WMKFZdkLsfOIyINN+5pbHqugpf7ZkHKqdRdpQRGHe8NoefAHC
         j8BMStC4F0Zsb64hvlA+VwVOkHYf6HfTQZP5lP3ND6PIZqaYP0SzEpm2uitcED9mifFl
         scEIhJTyR+j0RXBV9dbhGC0ZgRsT+2sHv6YI6hNlcm6+JSw+f1Aqlln+8JfVMoiZsGLz
         xCcPNqLz4ORNY9dgvEssywtmLPVYYuAsEpdfj8/uXPMW/JdfgAKl6YMuvxinBpm0tyXT
         1TYcerwp2V+Nm1JZVSipESB8ZStR6lv/iS5qECXhyyEvCQe5c5guWLNng67GOcTrpSnS
         WQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764856122; x=1765460922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSmzlby0QxkDml2TLqk35SaCbc5wltAvOYPrtePTW+Q=;
        b=NwsdDjZC05Cg4PtJ59+BkS0/uXUFb4/LxgpGJ3Wyyi/fF+SK4WmzpOy0kZDlPXsfTq
         iCtMzoRpWZL0k3n4pdb2MPM1R4cXSvVBUJ3CBrPzDmvlaFL5DnMTy60lDFR5rEZTpU+n
         G7ONPd+x9ZOf1G1+RISwO1fkZrNrKQBxCp6jzKqnaSNLQXYhYoh+k47NSgWXVk6DTd1K
         ZubhqmNX/V4RD76O2cB0NjiHxJRNAdCAqU5mTzE3SUuD309+Kgu8Ay+Yer4PEFZF7lEm
         YkanlPKDHREFiVaKgtCB5RXG/L4lNG8/4ZRu/wvvFgMe4gBMN3KlodzMdPKBu5XQjYuk
         S87w==
X-Forwarded-Encrypted: i=1; AJvYcCUaIZ+6cnFj1/yvMqNZafcg2v93pPnmDR8h+wpVAIVnDaX6cXq+YAH2Y7G+pauKSIDoCuwJdrKL6LYlJOMTCK+W@lists.infradead.org
X-Gm-Message-State: AOJu0Yykz0YAT/3LxorJ8WKmLeAGnSzPiZk/7tFk3BWuMBZqc1KAqflg
	AguF3XzEmiaHE5ryJWAdwqWrOKEuzvc1oUXMy12kxSde5uX7y/+nfiabdYEm+mWKvu0=
X-Gm-Gg: ASbGncuL9zAQO4CIH5RGl5BcTm5KRyuGYo0eI1nAfSYeG7DAKBh8BYuBn5cRs04IApK
	ebfR4PwX0Kqn16QxGA1YQyOXpPRk8HqvOl/UGW94F9KStRcF+ro69Jxncu8ryXHjZTW3T9EuDnh
	vbXSl8IGOPZYj9AqMMg5sJxHKtdeC34BtQk1ki+Qko3DPa7nnnlVwqYLghbjmb+JkgOG7EYVL0E
	PhAtLw02z3YA7jJxCa/I9v0sAVWANRC7iI2COkHb9pYjbN/U66DUEz/I3GR9nu5dHZ5ycdHu4+B
	J/EwqmE4SuxRihsbxhAPgZib2AnaXK9Gk7oJHDM87kTcc3RubC5ki9YOOdvljJp3efa7NQ/O8MR
	E/A9RdlegqlYNvLbphBwc9iPmSQKKnha+s6dzusyNFI96qlz1Ig7c2BnqBv47bv0jb58Qa+H5+z
	ovg/Zj+ufY3qqFE1qPqw05hkpgpXc=
X-Google-Smtp-Source: AGHT+IHhuWnPxDBYXMFRfc5k4QqYpRN3fnrmMm8SaBBgcHLUbKT5rPR0SBJCh2vK71cX/9bR7W04Dg==
X-Received: by 2002:a05:600c:1e8f:b0:477:a9e:859a with SMTP id 5b1f17b1804b1-4792f3861bdmr25709275e9.22.1764856122118;
        Thu, 04 Dec 2025 05:48:42 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310c802bsm31044775e9.6.2025.12.04.05.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 05:48:41 -0800 (PST)
Message-ID: <745f9aa8-6f09-46ac-9612-536fa8292825@linaro.org>
Date: Thu, 4 Dec 2025 13:48:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] perf cs-etm: Don't use hard coded config bits when
 setting up ETMCR
To: Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Leo Yan <leo.yan@linux.dev>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
References: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
 <20251201-james-perf-config-bits-v1-4-22ecbbf8007c@linaro.org>
 <20251202114300.GV724103@e132581.arm.com>
 <53b24702-eb3b-4e08-bca3-70402eaf4db5@linaro.org>
 <96c54895-cebe-4247-86e6-d41b8be0dd40@linaro.org>
 <CAJ9a7Vgn+HBSO0d3s-x+vjqk3Zfm2shpW1di12_OEZVSN6S0yw@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAJ9a7Vgn+HBSO0d3s-x+vjqk3Zfm2shpW1di12_OEZVSN6S0yw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_054844_256895_C7CF58C8 
X-CRM114-Status: GOOD (  33.51  )
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



On 04/12/2025 1:45 pm, Mike Leach wrote:
> Hi,
> 
> On Thu, 4 Dec 2025 at 10:55, James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 02/12/2025 11:53 am, James Clark wrote:
>>>
>>>
>>> On 02/12/2025 11:43 am, Leo Yan wrote:
>>>> On Mon, Dec 01, 2025 at 04:41:07PM +0000, Coresight ML wrote:
>>>>
>>>> [...]
>>>>
>>>>> @@ -746,7 +779,7 @@ static void cs_etm_get_metadata(struct perf_cpu
>>>>> cpu, u32 *offset,
>>>>>        case CS_ETMV3:
>>>>>            magic = __perf_cs_etmv3_magic;
>>>>>            /* Get configuration register */
>>>>> -        info->priv[*offset + CS_ETM_ETMCR] = cs_etm_get_config(itr);
>>>>> +        info->priv[*offset + CS_ETM_ETMCR] = cs_etm_guess_etmcr(itr);
>>>>
>>>> I still think cs_etm_get_config() is better than cs_etm_guess_etmcr().
>>>>
>>>> For ETMv3, we directly pass CONFIG to the kernel, and after validation
>>>> in the dirver, then the value will be set to ETMCR.  If we already know
>>>> the config value is consistent between user space and kernel, why
>>
>> One other note is that since moving the timestamp field, this is no
>> longer true either. The value in attr.config isn't directly put into ETMCR.
>>
>>>> introduce a redundant "guess" operation here?
>>>>
>>>> Thanks,
>>>> Leo
>>>
>>> Because userspace doesn't always come up with the same value as the
>>> driver. For example right now in ETM3, ETMCR_RETURN_STACK isn't set
>>> depending on certain conditions that userspace doesn't know about.  ETM4
>>> has the same for TRCCONFIGR_RS and maybe some others. In the future,
>>> other versions of the driver could do different things as long as we
>>> don't break decoding.
>>>
>>> I didn't want the function name to imply it was doing something it
>>> wasn't as that confused me a little bit. It's definitely not "getting"
>>> the value. Maybe "guess" isn't the best it could be, but it's not far off.
>>>
>>
> 
> Perhaps cs_etm_synth_etmcr()? We cannot read it directly as it has not

synth is a good name, I can use that.

> been set at the time of creating these headers. (unlike the sets of
> static read only IDR regs that we do read).
> 
> When in perf mode the only configuration bits set in the ConfigR for
> either ETM3 or 4 are those generated or implied by parameters on the
> perf command line.
> This info has to pass from perf to the driver somehow. Evidently many
> years ago, when only ETMv3/PTM existed the easy way was perf.config ==
> etm.configr, now that is no longer feasible.
> As long as perf and the drivers interpret the command line attributes
> in the same way - all is well.
> 
> As James says, the actual configr can differ from the synth one - the
> key is the bits that control the trace format - e.g. cyclecounts,
> rather than trace filtering e.g. userspace/kernel that affects the
> drivers configr but not the synthesized value in perf.
> Decode cares about format, not about filtering. Additionally some
> things - like return-stack are implementation dependent - optional on
> PTM, not at all on ETMv3. If the trace unit does not support it then
> the drivers ignore this. the only effect on the trace output is less
> compression if retstack cannot be used.
> 
> Generally decode needs to know about things that affect format and
> function, rather than filtering.
> 
> Mike


