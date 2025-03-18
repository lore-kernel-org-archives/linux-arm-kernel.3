Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1629CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 10:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57utoSkB2MWjRDZuFyIwHMOM2c+jS/zIgSozsuMhHC8=; b=QU7Gd+Q9TNrVrMODNgfU5yloAL
	AeOUOGrt3th9MtVqwLdLfgysU4rsq7Atdzblb0dETl9OGLY6kolySXjxaFIY3uopaudO5Nh9bFJal
	7KtWDn5YP0tDYEAyVrF00p5ARNPHElWaEP74XoebBC8XaCfEjqKF/l5CFHu4z3GlxbL5GZOYdrJUi
	Hv75h5716CFQc2qvwqYN11LQbeVOMT0Pjajz9/0L2bswwCcbBCUCbb7CzFVwuL/eyTiZ/ZGFYgSmD
	2aZhrJ6abxzJxte2d8pIuiaudTLk5sawdwoFeF7Zotn53G5w3IE1+5ZOHeQJRQ3zbGs1MGrT7SeDK
	JgppQF6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUb5-00000005bxo-3YaS;
	Tue, 18 Mar 2025 10:54:59 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUVC-00000005bBU-1zL8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 10:48:55 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3914a5def6bso2896398f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 03:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742294933; x=1742899733; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=57utoSkB2MWjRDZuFyIwHMOM2c+jS/zIgSozsuMhHC8=;
        b=Uof257UwpkpsIVaqsWdUBb0kfL77W1n9cJ3DnrY344ut31xWw/kLGfBjEGYZmkYcPX
         XsjhFVrqzXq8fYENCCx3cLRvLmU/Z6Uy7/+HoQPsf3GJdBApUUWgTU2CdQEXZ/WE/yPd
         +q9ls80yUDeCp4J/UHFXsQQOtQzDsRPWb/K5Qf42F+03RSSNvKc7qAQcTu8pj3Bu6wJ+
         xRXi0cnb5XTIkE4zXFqjYMkEtx7HlUWYlHlzTf/vYAtpTy0AXWyzFQsDjkmohP7sR3JM
         PGANXaJe2hHtHo3ugTb9Nb35/nsfWLinuBBIYMTQ1kCSnw64Fo2MHvBlbKsWWFzU3pIt
         kkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742294933; x=1742899733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=57utoSkB2MWjRDZuFyIwHMOM2c+jS/zIgSozsuMhHC8=;
        b=nQAByyW/sVmoNVYWy3ZuSSgAPg1ax1ARqyYFs0EUHyun1Yh1ChITjBkRm55mA806On
         j2c+lVzO7JhDJzAMd6UCe6OO5G6KD8lbcKoYXnegbJHo6ZBl/Rk8J+5Ze+r/wKgmzREI
         a6gX7tUNBJZO0cTMdkCpycIxyKwoNqV0vR6zePVLAAf9AaOJ/6HyluKByMd1fen3owNC
         nCYxxvfxYLeux1t7hsUu3m/q9pT1pXa8U/D4Gv7DbguInTyRJxtou5qX4tiiuPYA6CzV
         XryfR/QFQ0lybkgwCDO36sv9n57QQT6sRw4pOgttvkYXCNu3ju50w9xOdhR/8eyAzsG3
         3Pvg==
X-Gm-Message-State: AOJu0YxPOAS2UgqfMRQuAWHXGlca8aPxxOAOLJBO4HTCaclviMknPR69
	CRcnUSyPeNKOAM0XI4CF/K6yDbwm4o0Dba/gx3X0bKTm2ijYAlMzxOIlct0fMzw=
X-Gm-Gg: ASbGnctDVmpLhBWSRBsa6iuXBfKku7xe8E77WQYcCbWed0TSZoftFlC3gAObqoxJJcz
	6Vm7jPfiaJxk3QxxeK4aAAyFQDzYNYBdkrCqLO6wI+jqNNPjBR4etEnQigafc7ThHWqaM/KIatn
	95z02YGeZyulv9fDuPy6h7UmgsqOtcicOpc93ZAFjcpUu9glvWQRQg5f3kCQD+mVHIuRmzJUdAs
	mAWCd4D2JbRvPwDFqrfzPhj1r6Ob9rP/2b3Jn/T9I/xTRn9/5PQuw1HV6oGiFVTd5yRF2yR4akX
	1Dqp4QXCwioKYVlLAGKx8u07JOuX2uNOWP2caRZEb3+uHcgkz3LVLA==
X-Google-Smtp-Source: AGHT+IHPMxFmuHJUzKTFKL/MF46GBaJJT63dHFiZEkBnPXwgw4S7oW5rMJ47Bbnq0qrrRrKTBwKCKw==
X-Received: by 2002:a5d:64a9:0:b0:390:e7c1:59d3 with SMTP id ffacd0b85a97d-3971d03edbdmr20966967f8f.2.1742294932771;
        Tue, 18 Mar 2025 03:48:52 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.67.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d21d67819sm124534785e9.21.2025.03.18.03.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 03:48:52 -0700 (PDT)
Message-ID: <9fe071f9-27bb-4694-ace5-f23eb0d0e50d@linaro.org>
Date: Tue, 18 Mar 2025 10:48:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] perf vendor events arm64: AmpereOne/AmpereOneX: Mark
 LD_RETIRED impacted by errata
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Namhyung Kim <namhyung@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>
References: <20250313201559.11332-1-ilkka@os.amperecomputing.com>
 <20250313201559.11332-2-ilkka@os.amperecomputing.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250313201559.11332-2-ilkka@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_034854_522063_BF760EDE 
X-CRM114-Status: GOOD (  15.95  )
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



On 13/03/2025 8:15 pm, Ilkka Koskinen wrote:
> Atomic instructions are both memory-reading and memory-writing
> instructions and so should be counted by both LD_RETIRED and ST_RETIRED
> performance monitoring events. However LD_RETIRED does not count atomic
> instructions.
> 
> Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> ---
>   tools/perf/pmu-events/arch/arm64/ampere/ampereone/memory.json | 4 +++-
>   .../perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json  | 4 +++-
>   2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereone/memory.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereone/memory.json
> index 0711782bfa6b..13382d29b25f 100644
> --- a/tools/perf/pmu-events/arch/arm64/ampere/ampereone/memory.json
> +++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereone/memory.json
> @@ -1,6 +1,8 @@
>   [
>       {
> -        "ArchStdEvent": "LD_RETIRED"
> +        "ArchStdEvent": "LD_RETIRED",
> +        "Errata": "Errata AC03_CPU_52",
> +        "BriefDescription": "Instruction architecturally executed, condition code check pass, load. Impacted by errata -"

I think this could also have a 'Fixes:' tag, either way:

Reviewed-by: James Clark <james.clark@linaro.org>


