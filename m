Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F0BC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 11:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KeD4qvnpOAgIBY4Q5KTmpBQo8WVRBjthWxr3P8XIcks=; b=GXgKR7+SIpht6neBd2LEC2mCR9
	TiCHq2eW+OgQJRi5UOlrJyTM0as33UwEaWj2EwyIztCDI8AWs6pc+VxRZglxd9uOtB0ipipZzNidn
	kxrm6rF5w7O+GhzgHzWJkrB1y4gMtdYK/X7QlNerq3Lv5q9baJwmOjh3vlFgOKSJee0cAd/Otwdp8
	20I1TKU0CqfnzLLqDiWmyAL6wIDsFVwAWPjNGVDzDGWh5GVeOXXeK4tbmJVCb+UVWAUnd0kUv0ZF6
	9A7ULgaeDCspwN+PGtoMGd8sacmVu1LsH1EozgKcPZQQ+jIEZnK7IeQB329OHH4+hp8/JlqN1oXWi
	w5mXsA6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdkW-00000004vdy-32s1;
	Tue, 15 Jul 2025 11:23:04 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdct-00000004uxO-1L1l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 11:15:12 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a528243636so2925184f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 04:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752578109; x=1753182909; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KeD4qvnpOAgIBY4Q5KTmpBQo8WVRBjthWxr3P8XIcks=;
        b=wbUypbVYPFtYEQ6esK/+iLJceKj65NolSip/FnZetLzNkXujQIxIi8bmLHybxfpKEv
         Kh5lmzM8c5+cMg42g3RyCzwH6jz4NuiG+Efzhcg5jmrjPGHteM2zZS1jlOMLiWf+Fs7w
         bs3zzktBBnUNuR4KXsreiUnIauxIHqvu+ZU2tJIfhKQzGMiLBv3lOCtmZpZ8TjsVA6Ui
         qPQPaycF/Nn0rhJ4zhjUQiajzKfDnX5DnWOTuTSezD8SfPLaaRcgFWSPmnMKbPhW1TrQ
         Qf0qbOcCM/mDzlr1zedS5m1BNRsKAbnPbsVI4L207ayLR8Wpwqce9dMKTsNNOO1bk+CO
         ux0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752578109; x=1753182909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KeD4qvnpOAgIBY4Q5KTmpBQo8WVRBjthWxr3P8XIcks=;
        b=uIkk4iI2yo2T7RxCjDDJfS3QiQetIwuCHe+HIdlv0RKK09pLoGMUAPNv2zaXC1VHkL
         7Cvg/FyQkyurb+eA4ioQEtscynhxF5rs2/Epd9yCs/td/UB73gBddMrftTiPFWxCLJke
         M2f5MJMxRqYg1Sh7eCXQ8Zh4od5xNAX9fPk/Ux3FhqZ1NHmSbRslJv3ud6ybt3YtoC1G
         +/50zw3saFEfLWyqNx5ggiToL2g2CoZ+6O7O9UfCiLOxjdKyinxiihSTP3/6/pQQNd1/
         miiy8GIyOcIp8xXnPjqa9Z4mqYhaaN0Y/LRFYE4LNnHH2nSQsNJkz1qgFTTdEJqged1r
         /1OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbqdTOufqNy8htRc4TodBmRedyUV3l3i4AaeKpYLJc/Fd8HBprZt/Y+nYzXnunw2ndZ1XUaCN4xEdC2YQAtUcP@lists.infradead.org
X-Gm-Message-State: AOJu0YwTskjSmXbx8BnuLEKOTkDNswrZMUrnWReQU0s6qLF0TxNNf+D8
	2fEtIZGEB1jiDpmfPj7eQVXoxNk4D65OUsCIDlyaVShpqDDfHwW2ZuIIVW7+NR/C6Og=
X-Gm-Gg: ASbGncufUlKA6NoXXwfFEWV4mnC250HzrY6hGUvNFHtzfYdzJHvCXVkXajr0TfBPhiJ
	/4KC0OvhvV8weFd6upPRSaYKcQv0JKij2V1iWYWFSyN952wUzW0B5h8bN4JWUydwQJacUZYP9nz
	Ap5fECkkhb/64VqG9wXJzdeaQjyFpdFsKAurun+kalmCPy63IKvc3kOzHOD5TquteZVnfKnodGG
	LZr10PRhlDbib8H7Y8N0J3ANrXu3bMyrkVl4Na+uEI3sR3KJg0pPbQcAhu93234AXVxEfrTalr3
	+JJCw+ZU6gIGUkQQiXtqwQLftLusjNA10hT5H4+5BgBHKgyK1uw0XbHu8zk/5qSN42ym3ImQdR3
	QegaXAPC9Q94h7yvWonTWYL7qFzw=
X-Google-Smtp-Source: AGHT+IG8+RnncnWrWqe5aRURSefY3HnfmihLhWZ4TxPEcnqaK//NeNt6YcFH1RHEdf9sGBw4B0HHaA==
X-Received: by 2002:adf:e191:0:b0:3b6:c88:7b74 with SMTP id ffacd0b85a97d-3b60c887b83mr622884f8f.59.1752578109392;
        Tue, 15 Jul 2025 04:15:09 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd1a2bsm15131107f8f.14.2025.07.15.04.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 04:15:09 -0700 (PDT)
Message-ID: <f3393b26-a1ca-4d8f-9c22-0330956090b4@linaro.org>
Date: Tue, 15 Jul 2025 12:15:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] drivers/perf: arm_spe: Expose event filter
To: Leo Yan <leo.yan@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, German Gomez
 <german.gomez@arm.com>, Ali Saidi <alisaidi@amazon.com>,
 Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org
References: <20250707-arm_spe_support_hitm_overhead_v1_public-v3-0-33ea82da3280@arm.com>
 <20250707-arm_spe_support_hitm_overhead_v1_public-v3-1-33ea82da3280@arm.com>
 <aHUBFGPck-O3vs9b@willie-the-truck>
 <20250714150921.GE1093654@e132581.arm.com>
 <aHUerfpLyAPEc9R_@willie-the-truck>
 <20250714154251.GF1093654@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250714154251.GF1093654@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_041511_382432_98D094A4 
X-CRM114-Status: GOOD (  26.90  )
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



On 14/07/2025 4:42 pm, Leo Yan wrote:
> On Mon, Jul 14, 2025 at 04:13:49PM +0100, Will Deacon wrote:
> 
> [...]
> 
>>>> In other words, remove arm_spe_pmsevfr_res0() and the two checks that
>>>> use it in arm_spe_pmu_event_init(). If userspace tries to filter events
>>>> that aren't implemented, then it gets to keep the pieces.
>>>
>>> Then the question is: what information should be exposed to userspace
>>> so that tools can decide which events are valid?
>>>
>>> I would suggest to expose a new entry, "caps/version", to indicate the
>>> SPE version number. Tools can use this to apply the appropriate event
>>> validation. Please let me know if this works for you.
>>
>> I thought userspace typically had midr-based json files to figure this
>> stuff out?
> 
> Yes, the perf tool records the CPU MIDR in the metadata.
> 
> However, I deliberately tried to avoid relying on this approach,
> because the perf would then need to maintain a mapping between:
> 
>    MIDR -> Arm SPE version -> Events
> 
> Given the large number of CPU variants, maintaining this relationship
> between CPU ID and SPE version, and subsequently mapping it to supported
> events, would be quite complex. Additional effort would be required each
> time a new CPU variant is introduced.
> 
>> The supported events aren't probe-able afaict so I don't
>> think the driver can help.
> 

If the RAZ/WI for not implemented is guaranteed, can we not discover the 
supported filter by writing all ones and reading back what stuck?

> Although the events are not probe-able, some events are specific to
> certain Arm SPE versions. For example, E[23]:
> 
>    | Data snooped.
>    | When FEAT_SPEv1p4 is implemented
> 
> With SPE version information, the perf tool can decode E[23] == 0 as:
> 
>    "No snooping" for SPEv4
> 
>    "No available information for snooping" for earlier SPE versions
> 
> Without SPE version information, it's impossible to distinguish
> between these two cases.
> 
> Thanks,
> Leo
I think Leo has a point that some of these shouldn't require any MIDR 
mappings, and if we're using a filter for some builtin part of the Perf 
tool then it would be good to have that work everywhere, rather than 
having to update for every new CPU.

We're already publishing the SPE version in dmesg so if we decide to not 
publish the filters we'd probably go and try to parse that instead. At 
that point maybe we should publish the SPE version in sysfs properly. At 
least that's scalable unlike having to update the filters all the time.

James


