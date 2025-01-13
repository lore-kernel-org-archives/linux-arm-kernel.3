Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EA9C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCDwiC2ChTMIMuF5sErsTKTOGH/i2ual/aPVMi/EvR4=; b=U7W+pwQwBmpf2+l25uchWVudFV
	FhwS9OT8FiBpep4VbaYXI+eLBQ37Jgkcq9fqLZXqQBm5CSQg0VvgITtjEk2k2cHKRhTMRWZCNQBrw
	8AiMvDZe0e1xRIJwGX1daAK5fALCSDiAn69AVmK9OZ2+8jtIu0xF02OUnLeaDvwTki6XgatTTCdGC
	2hiCnrEtROPlOq3+5N/+UczIV5HSm/D6lMA2w6k8M0Fm1uQfTpGA2A39CtRjsgZuHgpSCMmmMBGAo
	2W+pcuoWmz0kt0D5k7ERp8ngiTad6t1irnJPjAbmhwCYLBkztNTdpHE9Q6tMGlxbgd4u21cpbJcxl
	g4adtH5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNd2-00000005wC4-1jfq;
	Mon, 13 Jan 2025 16:49:28 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNbm-00000005vvM-17Ov
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 16:48:11 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so32769805e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 08:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736786888; x=1737391688; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DCDwiC2ChTMIMuF5sErsTKTOGH/i2ual/aPVMi/EvR4=;
        b=gjqtnHJU+8KY1KWz3VGz/WQpnJMreRpWqPF8ouOKY/0MepkaxnDeTkqA5V/3C/7ek0
         o6HiMgeGfJvlZIgNt4QhjkxqFFz8uJ+yc0rEUmp8qmlm62+BzID0E0ZtZOPT6DaxZHiA
         nVJevmuBcpnct+PCCMesyLSxEHf1gh7pk0BylC0Zs2FQFFlaSu3Tg17ikS1D5tHsOHoV
         7PgSFzFVfxH2NonQjxN1jlymbzz8sP6Ok4FuOZhkdjZ8wp0iPUoTcrxyPFAgH+89dLt4
         ViEFgwFkp3ej2Wrp4Av4felwZUB9PHO2gybEAW4wedUoTXFoYuUmwzDO8HfaZex0OP4t
         MrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736786888; x=1737391688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DCDwiC2ChTMIMuF5sErsTKTOGH/i2ual/aPVMi/EvR4=;
        b=rVXvpZJVNaaDJXg49nprk11CKSa+IAkB7DnTyJuHCAvw8zFZLQ/Ekq6mlD1TC9xSr/
         uI4iLIf1Q74ljXdrZ7y8qfaC0aZ1l0dS8eJMCWy1Dth392O0TDqhnh0U4id9VXq5vnbz
         NkuY9PuKH1XT4P6D4X+ScsYTjUSVK6fEelDaB0kD0DHjizN6qSjHYRPfVnGGjMnrvErJ
         Z1xKb81HoED4ynv89p6Ayz85UZJe0LAHXkjE9i346+OVanULukdqriaIvDfz2LLqzWSY
         skbVru9dcJY1ptZtwVHhIA2gE2PT+B2vDf/XxkDFR3W4XsNNBR0cNtfypT3Ckl5HWwab
         0bSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd0Bcybm+OAJGJSJXMGJH8+5BYgRQGK9DKhUVQ3dWe2v7ZzUTxjwhKZk0thU0YkMooaIQwh3dh0E470GaUCsiz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/MJ/J1LnAIaQ7niiYot4O3f+/nSZqhQzkZU+/xvtIA2RX2SAu
	30IuIc44h3to/Gl6jN6osorS2WJRP3J3oihEBCnhmtFpR605wk4STvn4sGWVIZg=
X-Gm-Gg: ASbGncsTbGZuFg/GuAGYiIKPsfSqJrCZZRcAMLvfRwdULJvI6sUDUDN9J3pJ4nF75/c
	Q6H8IgxxQCk8sQlI32S1UNm6xKTdsdfBYg+mZunNLhyWDYEVHF7NwR0MDJ6PW53EN/ULwx9Mh2O
	7tQ3wuPMWXiRvOMDHaZF9rvwhxhNPJgES3UkSD7EurJd19VpMFuiZYA0dqipuBdNontCqiq5eCv
	hRSF+7L7UHI+o4M9KnbrSofTnnt69SQKQjT2UpYjXsygXJraicebU6r4oMslaNjEiwz
X-Google-Smtp-Source: AGHT+IER6KYF6RQvQUMNV9juLdwNdllc6fPKkCHKfac+vsy4zTDSEgoZ/Ee/dPPZGpy7n4GhLF2KjA==
X-Received: by 2002:a05:600c:1987:b0:434:a386:6ae with SMTP id 5b1f17b1804b1-436e267850cmr200788085e9.7.1736786888373;
        Mon, 13 Jan 2025 08:48:08 -0800 (PST)
Received: from [192.168.68.163] ([212.105.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9d8fb99sm150640805e9.3.2025.01.13.08.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 08:48:08 -0800 (PST)
Message-ID: <d0ebae42-99b6-42be-beaa-947160da3b88@linaro.org>
Date: Mon, 13 Jan 2025 16:48:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] perf vendor events arm64: Add N3 events/metrics
To: Ian Rogers <irogers@google.com>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kan Liang <kan.liang@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 Nick Forrington <nick.forrington@arm.com>
References: <20250110172006.680753-1-irogers@google.com>
 <da5792c3-8f53-4be8-8f53-e1cf6660feab@linaro.org>
 <CAP-5=fXyVtZChi1fkochiyKw6AztdhEE_rfpJUsz_P9po5bhXA@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAP-5=fXyVtZChi1fkochiyKw6AztdhEE_rfpJUsz_P9po5bhXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_084810_306530_E35D0FF9 
X-CRM114-Status: GOOD (  22.86  )
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



On 13/01/2025 3:51 pm, Ian Rogers wrote:
> On Mon, Jan 13, 2025 at 4:35 AM James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 10/01/2025 5:20 pm, Ian Rogers wrote:
>>> Using the scripts at:
>>> https://gitlab.arm.com/telemetry-solution/telemetry-solution/
>>>
>>> Generate perf json for neoverse-n3 using the following command:
>>> ```
>>> $ telemetry-solution/tools/perf_json_generator/generate.py \
>>>     tools/perf/ --telemetry-files \
>>>     telemetry-solution/data/pmu/cpu/neoverse/neoverse-n3.json:neoverse-n3
>>> ```
>>>
>>> Signed-off-by: Ian Rogers <irogers@google.com>
>>> ---
>>>    .../arm64/arm/neoverse-n3/core-imp-def.json   | 930 ++++++++++++++++++
>>
>> I assume you got warnings about missing groups, if one is missing that
>> results in everything being dumped in core-imp-def.json. I have an
>> internal ticket open about it which is why I didn't post N3 and V3 jsons
>> yet, I'll check on it again.
> 
> I was testing with JEVENTS_ARCH=all. I'm not sure what the group
> warning is, do you have a link?
> 

 From the perf_json_generator:

  $ telemetry-solution/tools/perf_json_generator/generate.py \
    tools/perf/ --telemetry-files \
    telemetry-solution/data/pmu/cpu/neoverse/neoverse-n3.json:neoverse-n3

  Warning: Not writing events which do not have a group (note that the
  mnemonic printed may differ to the one in the source json if it differs
  in the common Perf files):

  IMP_CT_FLUSH: Counts flushes including architectural,
  microarchitectural, and branch redirects.
  ...

>> Up to you whether you want to continue with it like this and I can send
>> a fix up later but there's also a conflict with the recent Fujitsu
>> Monaka events.
> 
> I'm happy to let you push the updates. An alternative, that may work
> around the group issue, is just to push the event updates. Any chance
> on an ETA?
> 
> Thanks,
> Ian

Can't say on an eta. There was a fix already done but not made live yet, 
but now it turns out maybe we don't want to put these particular events 
into Perf because they're not in the TRM. Could be several weeks before 
anything goes live.

It's a bit of a hack but I can regenerate them without these particular 
events in a V2, and then whatever the outcome is from above will be an 
incremental change later.


