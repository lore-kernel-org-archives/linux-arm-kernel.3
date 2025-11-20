Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB713CF8564
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 09:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=20kuTsLD7mzN21Mbsnm6zJe9RI36sxYDFDB3fVbVRPA=; b=fIvz42MetidZws7XnobW+6pOzV
	jemjCegaoIfFQ+1xBv5IfBS15PIiF8D82nuhtVhI+q5OQEAWi/PHeZjtLgT4qbl1cupazhFe0CzLK
	utt5ZizUSb4UJPadt1IpJUr6XAVJ24ZcCy0NnVNctpFscwo7VziohuAer0MdoJibYuatU0fk+JT/A
	Zrcj5WsFYmlyDzbdvG8v67fuqzbGz4zH8iyrLZZzM4c0RUdjyhbxhxi8HnWy7VDzRmlFQbquMAfOM
	Hqp8o30UEnIjBQCm7kS69U0oG/5DGtdgMr6yuLuGup2SGnWXLerMWi5u6k2Nd8mkEX7sSxb+PbiX1
	ciSm/BVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM0p9-00000006PTq-2REm;
	Thu, 20 Nov 2025 09:19:31 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM0p7-00000006PTR-2Hnk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 09:19:31 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so6869205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 01:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763630368; x=1764235168; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=20kuTsLD7mzN21Mbsnm6zJe9RI36sxYDFDB3fVbVRPA=;
        b=boioGQvVPIEdmD56KLmM5nMlHOxczX6TOinD3VkBaYlj9hApAznUtMRJIbEu/LG6Mi
         9OQtDYWMT2P/qA4cXxBPGcAWwvMisOPHIMGMiMaXdXPXKTNqUO8ufjuoU71fkQENEk3A
         tvRUtiLhC2CSrTeokoqfyaSEhAMMtyJIS7gDDco0HqI9Pb2Z9y//+4Q/YXJzlVeZLLy4
         yguliy3H+6w8UX8/356znewgfU8T2Wp2kRBRxY/IbX1vt6cVz+qstv/wb3IfxxOMvb/I
         x23EC0yFeJjIyXKAgJ1HnFZrFjtiQqldCStm4+Eh3pEJnl/a0WKUcHTClNVGct3H8sqf
         s0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763630368; x=1764235168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20kuTsLD7mzN21Mbsnm6zJe9RI36sxYDFDB3fVbVRPA=;
        b=QAOuFPLs+M2IC+4VAcqBhMYLGL76guKpXvsM2i3Z/lcILsguNzeqalyAxN7bFVF6yg
         UfIolyMZyj5gDti9zB/hqWGNlAGbcIq7ZmnZDQcMCp0V2Tx40gPD/uBRMLUCLcwNN9cz
         sZ3s0k47eBRtXrO1lkw3GZ6uEFIN0qwzNJJjyO9TvQQtlmUBZUe7RVmWSkXPSYZsh7Mw
         KSBtzNp5wqyyEJTkXEIM0mR4zCjO2ZEaMTYEHH0Knn+GzGuZmmEDdLFvo+R+jRHW+Xym
         UnmMpXT3e5jA7kWwE9WPaGK5eN09wJ6IUkrfcQZnT8ZngZS6MrFtKyx0EpftXhPYshMg
         3hNw==
X-Forwarded-Encrypted: i=1; AJvYcCVg9aK1kfQ6YP2v55sfOLxriuE3wqD39yFhAelrE0912Bpq9pw/2pQLUAaChwT5sMUCCku4QfHfn/VwOzhqDIFj@lists.infradead.org
X-Gm-Message-State: AOJu0YzB5YgwkkLk3xEhKtuUQmjdkx7V62faYkJovfrzh6ZhZsNyao4H
	hAY6Pen/KTT9FvYc68CJ7Ru+Vp5jlQTj16Cz23HcM/jDTCzwe8Q6FApHKx5Efn+gsnk=
X-Gm-Gg: ASbGnctPbJN3stQA+0Wlz4An3/9t6wePmRTnukxKGpU53SXLp6WCSZStixVR8GL/aLH
	GRae0w2WbPUYC3QmFrJcKinaShZzy6Wx0LQcPSIRLqHa1VcaYaY5wV1AZrUYBreOkqNgQF6JV47
	M48dNNPA4v9hbkJzduB7gF6K7YlkIzFBDzGXroXnL84IGKkDUZn1Nh9krmtE5Y1Lqn+6Z2BYDk0
	4qc5DZMy5zRl07Nw1mvwKG5qez6zyVXEAsWYGwM+NjeKKWC7wW5BjpkLLMLsic5tRxD3U/CwAK1
	OX2XQxb0dbAT2hmaZtWcnowSl0LJi6q2reECgXh80fzlpjDWfRQ9zXoePqcBQNLrKvooFv8bRxA
	I7K8imoJpwvP3bHowU+34YlYPKmi/GvDleqYJlyOTSV3oX8BEmiA/8qgWuzu4XYe5oqs1HYZHq4
	4iy2eN5E+ibf3E+4bR
X-Google-Smtp-Source: AGHT+IG5tl/whbs/s+74YcG+m53Ghp9OLB4xBZ6tsdMgU8rY+wexmvaqdkIZY2ULXyjStCQ5oVkWfQ==
X-Received: by 2002:a05:600c:358f:b0:477:9650:3175 with SMTP id 5b1f17b1804b1-477b835c667mr30933245e9.0.1763630367552;
        Thu, 20 Nov 2025 01:19:27 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b831ad3fsm36561245e9.12.2025.11.20.01.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 01:19:27 -0800 (PST)
Message-ID: <d3dca311-5f2b-406f-a91b-0c5bf4dcb7ce@linaro.org>
Date: Thu, 20 Nov 2025 09:19:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/5] perf: arm_spe: Armv8.8 SPE features
To: Namhyung Kim <namhyung@kernel.org>, Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20251111-james-perf-feat_spe_eft-v10-0-1e1b5bf2cd05@linaro.org>
 <aR503-f-ZrnWzZh2@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aR503-f-ZrnWzZh2@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_011929_668376_A65C5F7E 
X-CRM114-Status: GOOD (  23.17  )
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



On 20/11/2025 1:54 am, Namhyung Kim wrote:
> Hello,
> 
> On Tue, Nov 11, 2025 at 11:37:54AM +0000, James Clark wrote:
>> Support SPE_FEAT_FDS data source filtering.
> 
> What's the state of this series?  I can merge the tools part (3, 4, 5)
> once the kernel part lands somewhere.
> 
> Thanks,
> Namhyung
> 

The SPE driver part was blocked on Peter's ack for the config4 change. 
He's given it now so Will should be able to take the driver.

Thanks
James

>>
>> ---
>> Changes in v10:
>> - Pick up Peter's ack
>> - Slightly clarify commit message regarding the difference between the
>>    data source filter and the data source
>> - Link to v9: https://lore.kernel.org/r/20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org
>>
>> Changes in v9:
>> - Fix another typo in docs: s/data_src_filter/inv_data_src_filter/g
>> - Drop already applied patches for other features. Only the data source
>>    filtering patches remain.
>> - Rebase on latest perf-tools-next
>> - Link to v8: https://lore.kernel.org/r/20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org
>>
>> Changes in v8:
>> - Define __spe_vers_imp before it's used
>> - "disable traps to PMSDSFR" -> "disable traps of PMSDSFR to EL2"
>> - Link to v7: https://lore.kernel.org/r/20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org
>>
>> Changes in v7:
>> - Fix typo in docs: s/data_src_filter/inv_data_src_filter/g
>> - Pickup trailers
>> - Link to v6: https://lore.kernel.org/r/20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org
>>
>> Changes in v6:
>> - Rebase to resolve conflict with BRBE changes in el2_setup.h
>> - Link to v5: https://lore.kernel.org/r/20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org
>>
>> Changes in v5:
>> - Forgot to pickup tags from v4
>> - Forgot to drop test and review tags on v4 patches that were
>>    significantly modified
>> - Update commit message for data source filtering to mention inversion
>> - Link to v4: https://lore.kernel.org/r/20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org
>>
>> Changes in v4:
>> - Rewrite "const u64 feat_spe_eft_bits" inline
>> - Invert data source filter so that it's possible to exclude all data
>>    sources without adding an additional 'enable filter' flag
>> - Add a macro in el2_setup.h to check for an SPE version
>> - Probe valid filter bits instead of hardcoding them
>> - Take in Leo's commit to expose the filter bits as it depends on the
>>    new filter probing
>> - Link to v3: https://lore.kernel.org/r/20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org
>>
>> Changes in v3:
>> - Use PMSIDR_EL1_FDS instead of 1 << PMSIDR_EL1_FDS_SHIFT
>> - Add VNCR offsets
>> - Link to v2: https://lore.kernel.org/r/20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org
>>
>> Changes in v2:
>> - Fix detection of FEAT_SPE_FDS in el2_setup.h
>> - Pickup Marc Z's sysreg change instead which matches the json
>> - Restructure and expand docs changes
>> - Link to v1: https://lore.kernel.org/r/20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org
>>
>> ---
>> James Clark (5):
>>        perf: Add perf_event_attr::config4
>>        perf: arm_spe: Add support for filtering on data source
>>        tools headers UAPI: Sync linux/perf_event.h with the kernel sources
>>        perf tools: Add support for perf_event_attr::config4
>>        perf docs: arm-spe: Document new SPE filtering features
>>
>>   drivers/perf/arm_spe_pmu.c                |  37 +++++++++++
>>   include/uapi/linux/perf_event.h           |   2 +
>>   tools/include/uapi/linux/perf_event.h     |   2 +
>>   tools/perf/Documentation/perf-arm-spe.txt | 104 +++++++++++++++++++++++++++---
>>   tools/perf/tests/parse-events.c           |  13 +++-
>>   tools/perf/util/parse-events.c            |  11 ++++
>>   tools/perf/util/parse-events.h            |   1 +
>>   tools/perf/util/parse-events.l            |   1 +
>>   tools/perf/util/pmu.c                     |   8 +++
>>   tools/perf/util/pmu.h                     |   1 +
>>   10 files changed, 170 insertions(+), 10 deletions(-)
>> ---
>> base-commit: 081006b7c8e19406dc6674c6b6d086764d415b5c
>> change-id: 20250312-james-perf-feat_spe_eft-66cdf4d8fe99
>>
>> Best regards,
>> -- 
>> James Clark <james.clark@linaro.org>
>>


