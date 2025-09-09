Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5869CAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFGYAxN7KhpHBrugmRev4scw5IytGj3RswCGCmkqFTw=; b=D6RzlmJNhFBeMHb4UlCaWhmk5t
	h+cuywfCJeo5JkAXeEeSmVVpWuuBFbmuorxjMJ6xwwVAwccreq7eq5+CvEFg5NjkV2cimmWqgCCLd
	p8qvbdrBCVU0pTW/guleibMY4/IuEcyN2ri8gxOVJ3xaz6lz+FOO/+gf1oNZ9Rz+8CI2hs7neIuC3
	f1+lCW3vnQmaqtMDXKminHQRxC1dFMoQqcSWP3dUuJ8AfyFPnyy5YwGhwdzEJPC+LcwmOivU1DuNc
	n79TXJyB0rx4lpcwAPWrm5u2SysCICf0+9iPKZgX2LUsLlV6kFSsRsqVckyzBw2pf7e9nal5XH4Ce
	m5fqIbrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1vu-00000008nji-0tj5;
	Tue, 09 Sep 2025 17:15:06 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvv16-000000068nF-1eLO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 09:52:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso31735435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 02:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757411519; x=1758016319; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iFGYAxN7KhpHBrugmRev4scw5IytGj3RswCGCmkqFTw=;
        b=s3gYiBSnueyf7G5wFSIMEOKqGh6t0qDSTcdPVbPZt0dSECphVj4WxlJm8cX06oe89N
         hXNxb5PGYfwUyJ3su7vCqwT7Gczdb3l3Puc7rlRq0NvUrvZVcKRVhnzqv1oxzqnU4CdR
         AB3oMrk2k6HssUM9bSfAWWUoOGslMp/oa0QdJOmXOjvCBsqgDTGu2r0azV+fuYCPsNZE
         f+t79v6PUs3p3EHmNArEhXIjoNlJC/iOm/598T3OWjmO1aK/1DqNh9ui7o80Z5Khuvxz
         U0J3gXv1PqK0lbFUaa28F5G04aeCsw+jibSHgZuAZscSEIrnDAq2e3mkM4c7R6+p16gr
         ZNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757411519; x=1758016319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iFGYAxN7KhpHBrugmRev4scw5IytGj3RswCGCmkqFTw=;
        b=JVSg6bWr/Fv1NIDFaQFZbr3W1+K/w3+i0gUDGF0QqnFJT6N7kg3tqutZ3vv0iqXn32
         omAJfMFL86s+6MYMzxYUGgXo0A2QaDbTN7U9cFLaBzfxANzgCJTuqHss/VvNmZt2AwHx
         PISx9Muxwga6QDPUm7/sZK9l79xW8RbsIE7hsuH6ObVgW+NAwp/foNshiHtRPCZMlW/i
         jjy3qUkjUagWfb7Rsby7EX97HgbkjvvY2K29ddNQ/peP5A9hRo/kZ18ZE1ya+5/pyj1G
         PlCkPRlZtxD6BwStJgu4AuludoQNckLacncC+BO9aMvhLrZX5SGlTKxKTOTZDMvvbBmZ
         rVcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEVrMdjHcZsN9Pdhd+/sFC2zuUYwLBs6CqUB/AS5CzFZMdjSO9UaGAIVh3p6NsWZ1XdK4uA2oMFOr7/BA5RUrp@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj5D+K2ZI1MGdDfCmDtaVF9v5Ta3BOgvolYaanlJvKCczJ+YBf
	Awxs9wPPhQjiPyzT5aWEIuK4qaRR5CXHpTneXqf/KBj0NDTuv/o2koeapFLy2pTiU54=
X-Gm-Gg: ASbGncuyq4V8qOX6EeTCjgJ4vgJmhqL7fu2Oo5XJZ4PTlbZftkNI1LooQ2MdruFXNKE
	5kwR+wY7JidHpg41sOY4MgQfzMRwA8dSU+EaPfK2xWa0tkmvKcfGqiDqJxgL1StBz8KsdgW/Zvb
	S5/UL7qrQDqk0weGM/V6mwXjyMhbkjO8C5bzGG4Sb1v2jSxp26e0qh3bEwizs4nsdvuqvNTmZSX
	Ns00hUZIENf8j09zB5SwgzGdfm6EBeCb8IGjTWStx14NRT2dV9k5xc/ALxd1e6QJe3AH02QqIBX
	eurQKSjrpOLWy+7zqzQgPCR2evP5JhwUyiJKdVXVY7wUfFImrwWu0G9L9cbi0qLuVlQ8z2fSXp6
	1iP0wDjL4Jy4aAibBoaXefVGhTVk=
X-Google-Smtp-Source: AGHT+IESmYHdHard1McUHhkFXGOst3hEfh+qWrJbkAkYlZD2XyacUZJFctXBns93b9p1corUeRwWcg==
X-Received: by 2002:a05:6000:22c3:b0:3de:78c8:11fc with SMTP id ffacd0b85a97d-3e6497c0668mr9559747f8f.63.1757411518659;
        Tue, 09 Sep 2025 02:51:58 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75223ea15sm1916533f8f.47.2025.09.09.02.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 02:51:58 -0700 (PDT)
Message-ID: <02cba58e-86f6-48de-a59c-6d31a29258df@linaro.org>
Date: Tue, 9 Sep 2025 10:51:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] perf arm-spe: Improve --itrace options
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Leo Yan <leo.yan@linux.dev>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, George Wort <George.Wort@arm.com>,
 Graham Woodward <Graham.Woodward@arm.com>, Ben Gainey <Ben.Gainey@arm.com>,
 Michael Williams <Michael.Williams@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250908-james-perf-spe-period-v1-0-7ccd805af461@linaro.org>
 <aL9HvOl-n_IM0qiB@x1>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aL9HvOl-n_IM0qiB@x1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_025200_471388_9F0B4B94 
X-CRM114-Status: GOOD (  24.14  )
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



On 08/09/2025 10:16 pm, Arnaldo Carvalho de Melo wrote:
> On Mon, Sep 08, 2025 at 01:10:17PM +0100, James Clark wrote:
>> Most people also want all the SPE samples (instructions group), not just
>> the flagged samples that are put into the various memory groups. These
>> should have been shown by default but weren't because the default
>> interval type wasn't supported.
>>
>> Also when looking at this, it appears that the downsampling was behaving
>> in a way that would discard samples from one group but not another.
>> Improve that and the warning messages.
>>
>> I don't want to put fixes tags on these because it's only changing the
>> defaults and the behavior, but I don't think the previous behavior was
>> incorrect necessarily, just copied from tracing techs but not ideal for
>> SPE.
> 
> I keep trying to find some hardware to have in my homelab to test these
> series, but till then I depend on people having access to such hardware
> for acks or better, tested-by, so waiting a bit for those to appear.
> 
> - Arnaldo
>   

Unfortunately I don't have any good homelab suggestions. Radxa Orion O6 
are the only not-super-expensive boards that have it, but it's not 
currently working due to some ACPI issue. AWS Gravitons also have it, 
but you currently need a metal instance so that's expensive too.

Leo should be able to have a look at this one until the hardware 
trickles down further.

Thanks
James

>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>> James Clark (4):
>>        perf arm-spe: Show instruction sample types by default
>>        perf arm-spe: Downsample all sample types equally
>>        perf arm-spe: Display --itrace period warnings for all sample types
>>        perf docs: Update SPE doc to include default instructions group
>>
>>   tools/perf/Documentation/perf-arm-spe.txt | 14 +++++---
>>   tools/perf/util/arm-spe.c                 | 53 ++++++++++++++++---------------
>>   2 files changed, 37 insertions(+), 30 deletions(-)
>> ---
>> base-commit: 75a7b9d29215c5aa813b9620f3c56817918f9f8c
>> change-id: 20250908-james-perf-spe-period-4711a566cba4
>>
>> Best regards,
>> -- 
>> James Clark <james.clark@linaro.org>
>>


