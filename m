Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3FEC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 17:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZGgBpcp8HuoDdnVbyjD6nbTX5PiNpopNc/IO+zHmIo=; b=CywEiKMRwNGMkAQiB1XVGu4BzK
	afjpmXldZoqL5J0kGJFWCM4PUbQZdTTpYxWqa+sL1bYwUYZUGfTr5tpjLXv+W0C7kHNGy1y2uC11b
	wBRq4o/LBx92cKi/d5Pe8ZxA8ReZpxoTHcXr95Ct3mUvKlNzQB/1leQ9qrelUSa5UnKOKnSlFg/dA
	Bo2CaXGTPahS7Ozz+ZN4so9MLDz6qLqQU8wW6nJdz7s+V/+4+Kqy//jM6RGLKcjJwqofrbiZMfC8P
	K0d1OgY9SS9WokjBX5bXTtyyFlmhJs9l2iuCkrdsNI6b2bJqUqiW/opwVCpwKP8LMz7xQaBXLoUzb
	ipOKPDfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk5Bg-00000005VDq-1K4c;
	Mon, 17 Feb 2025 17:45:44 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3zL-00000005GNp-2jCO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 16:28:56 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38f3ea6207cso1234424f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 08:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739809734; x=1740414534; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RZGgBpcp8HuoDdnVbyjD6nbTX5PiNpopNc/IO+zHmIo=;
        b=auzMrMDlfQXLRqoNvqeGiMvnpfnHSlu6ZXHayfi26UA2twkc6LOacHgu1P1OcHfRP0
         RZJVRK5M8ipDCm2iEkU6g9FETvAsXCs9xyhEkcLD8q3LhQlwT7027DvPfl3wQkEJmYMZ
         +go6R1YmICjH+SjU1Fv7ABM8qBxq4SR7pkh8MXoCls+HPTl5TxNCLJn2EYcXlDexOhKx
         iIMRT+tqCO7ve/bPKjayHwR4b/lHeErwy570XssGMe5DJqD1kHHkfH/d3UkpffIxGayA
         1shgPR6IdCbKI5DrqzKSMDxKyCJjjh34wUtzNWLNschj8BA+QuN9o6cdb5fG3UqhReHV
         cEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739809734; x=1740414534;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RZGgBpcp8HuoDdnVbyjD6nbTX5PiNpopNc/IO+zHmIo=;
        b=eVTgC5lDctVp/skQrAZ7oMHjBIquHW+8RgA04fTKnLf/msafVDE/szc229qmLDW0b7
         6JdasqfbK19nI8XzI9DV6cg39uQoU9iG8myTTTirFNWNA5FAadlxnUyCgRsMhuX7rhJk
         SCmdzfHX/O5zOPC8HUBjbclgBAIOzE+KaXQ17uMeoXc5wh2uuNXvUecaNxAQT0KcD31o
         G/rzD92HfNaA8A0DDjAdwamJ6MvI28v0wuZ2WJkStx+FUqKySWFGQbw34t3ik/9SwJCN
         qeMzrC+PN0OC0d79ORTNveXguARFKq4bxIyOTCIPJucZLFYG3ZwNVA2cmjB6VkHpYO3i
         cA5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpgKaxOfLKiLLCgxGxZvuoBeNB/M7wY+RnICH2Q8CSXr1iDr5O/EyF+KBcbmFd+Vox/PZnMF0jFe+etCxNCzS1@lists.infradead.org
X-Gm-Message-State: AOJu0YwKYqwiuWAUQDl0E60nd9Ntc91vCxCLc3PnjpQ0+KHBn0uxz3d3
	yqYDfmOkWRqPUBjk+0a4SlUZikHvncy2V/EuzDtxyHoXmW6fb2levYv5x+48Ez0=
X-Gm-Gg: ASbGncu/DcpjajlpIVLHQi0sAEFxviVqksbBwyaNT/xRkBvIKpidQLVZsfdNoH90MSj
	8eZGR+fAKfgVUDiVdfZlKqyELM8hkoNNT58e/OwDEQdsy5waMQpDSd5RNKZrkoGw+YPKxhKckJl
	Y4WrQRG4oavoa38gPl6LkkSV+Cq4g04XzafZTEqE/07wKCYfq0DiRjQtAnyExdVeMZDkWzPRSZz
	1guH4zz5Chb026BMyYDXnti5JwYNEvQYEbKPHGb8jRov2vootDxqc2bEu7DRc6qS7mjqtXvRoCd
	GGREHK7fbtGS+Llax7Z2pIKpOQ==
X-Google-Smtp-Source: AGHT+IHuH77s0Gc3jaj6SvUYPZ9P8VnXHclSL5deuIzHmW+q14rWha9t/xkM04tw0RHHjunQ1PBdgA==
X-Received: by 2002:adf:e6ce:0:b0:385:f6b9:e762 with SMTP id ffacd0b85a97d-38f340676a5mr8093772f8f.36.1739809733997;
        Mon, 17 Feb 2025 08:28:53 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258cccd3sm12655932f8f.23.2025.02.17.08.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 08:28:53 -0800 (PST)
Message-ID: <cd0c08e2-351c-43fb-863c-85a405714284@linaro.org>
Date: Mon, 17 Feb 2025 16:28:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] perf script: Refactor branch flags for Arm SPE
To: Leo Yan <leo.yan@arm.com>
References: <20250214111936.15168-1-leo.yan@arm.com>
Content-Language: en-US
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Graham Woodward
 <graham.woodward@arm.com>, Paschalis.Mpeis@arm.com,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250214111936.15168-1-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_082855_700848_9AF16B88 
X-CRM114-Status: GOOD (  19.19  )
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



On 14/02/2025 11:19 am, Leo Yan wrote:
> This patch series refactors branch flags for support Arm SPE.  The patch
> set is divided into two parts, the first part is for refactoring common
> code and the second part is for enabling Arm SPE.
> 
> For refactoring branch flags, the sample flaghs are classified as branch
> types and events.  A program branch type can be conditional branch,
> function call, return or expection taken.  A branch event happens when
> taking a branch.  This series combines branch types and the associated
> events to present a sample flag.
> 
> The second part is to enable Arm SPE's sample flags for expressing
> branch types and events, and support branch stack.
> 
> Patches 01 - 03 are to refactor branch types and branch events.
> Patches 04, 05 extend to support not-taken event.
> 
> Patches 06 - 09 enables branch flags in Arm SPE.  This allows to print
> out sample flags for samples.
> 
> Patch 10 supports branch stack for Arm SPE.  Patch 11 is an enhancement
> for PBT feature.
> 
> Changes from v1:
> - For patch 05, changed to append the 'not_taken' bit in the branch_flags.
>    This can avoid altering bit layout and cause breakage.
> - Added Ian's review tags.
> 
> 
> Leo Yan (11):
>    perf script: Make printing flags reliable
>    perf script: Refactor sample_flags_to_name() function
>    perf script: Separate events from branch types
>    perf script: Add not taken event for branches
>    perf script: Add not taken event for branch stack
>    perf arm-spe: Extend branch operations
>    perf arm-spe: Decode transactional event
>    perf arm-spe: Fill branch operations and events to record
>    perf arm-spe: Set sample flags with supplement info
>    perf arm-spe: Add branch stack
>    perf arm-spe: Support previous branch target (PBT) address
> 
>   tools/perf/builtin-script.c                   |  30 ++--
>   .../util/arm-spe-decoder/arm-spe-decoder.c    |  23 ++-
>   .../util/arm-spe-decoder/arm-spe-decoder.h    |  11 +-
>   .../arm-spe-decoder/arm-spe-pkt-decoder.c     |  14 +-
>   .../arm-spe-decoder/arm-spe-pkt-decoder.h     |  12 +-
>   tools/perf/util/arm-spe.c                     | 135 ++++++++++++++++++
>   tools/perf/util/branch.h                      |   3 +-
>   tools/perf/util/event.h                       |  12 +-
>   tools/perf/util/trace-event-scripting.c       | 116 +++++++++++----
>   tools/perf/util/trace-event.h                 |   2 +
>   10 files changed, 307 insertions(+), 51 deletions(-)
> 

Just one potential issue on patch 8, with that fixed:

Reviewed-by: James Clark <james.clark@linaro.org>


