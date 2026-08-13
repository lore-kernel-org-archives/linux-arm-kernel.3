Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4E0C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yUisejUB/RXblzXQvMfPo73Fse8gZhIxVZGVkZNBxE=; b=0O9cdkIKNf3pEnhhwksIa5W4M9
	ktHADVB1dX25Ldz3p8QUCrC/aM86ED0qZodARidFAlbtorWBHUrwMwjmr3+VNxwFToF6yuMEr5EW/
	iT/WyohM8vS7Ih0EEwPKxT47+m1NisIASx1yGOUbuTvUbhj7TpGm+w5fwOgxxxDtLF1Pn76C00uDA
	dM4s+8Bc5WvXj55gVX0SAtTutIvVZoLsc6d1spFB0s+nIOiCUOeWCoTM5IdESwqszhjIyIm75VhmV
	boiamY0io4HoIFhKYr/6ABfZeDGAyMf9neTYNryFnDJ93+4mN6vxJpz1QEIwIWxURJD2hxfH/vejX
	FQhXgZYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQqa-000000008pa-2TX4;
	Thu, 13 Aug 2026 08:31:32 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQqW-000000008nu-0Jhy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:31:31 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6983d3dae7aso1151221a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 01:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786609886; x=1787214686; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7yUisejUB/RXblzXQvMfPo73Fse8gZhIxVZGVkZNBxE=;
        b=JP5KRRVtXMxGZFBUNaqa/PAHz4dDS0QO+WTJ+bxzS10nVWC/OaL/SNQSxNbX59rMew
         SBbAHITKqWpN5UPIpkpBt0f9Tp3vJG8tRQViOO8XuclwBSaprMebfWCJXPaUDyViBTUr
         z0BK9rOEJV4jJGNIG6yVjpXD0IbFtj0BKyCUZnOZmI9kDsA1gRVFRK3LAD7dSPPpp693
         0+FMtHX3383B9Wuaae6YD3sSOvZClxGy5rM/6p8TV8/ILS5/jE7tUHJ4cN+lkNP9mQkQ
         2EypkPSkurxiZfNXJA3PMfRENOCEUs90vteNkYot9NNpsQ9yBOnJZQrezGn+qj+GcMhT
         4SQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786609886; x=1787214686;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7yUisejUB/RXblzXQvMfPo73Fse8gZhIxVZGVkZNBxE=;
        b=c68qOmZfRaBXaM2xATAerS/GLk1tWLRiqTCBq08yWXrP+CP3XLGMxZEDXcAo+sOx1o
         UZk0k5HiI/BqDYInmFfot2FbexgyNwDA2OZYfYKUQAyYbFagOGrCoc4/zZHZbFXp4uHG
         iUBUHDqTVcJG0EGrhnqxdLJg724OaOqAhb6QXlKLHxZEYBi2WvwDzw+zXxEVHAYKr0Nn
         sK5C8+Qvxk8GfGMy2ZZN5YSKW3yujV11tL01ORPA4R2vxuqT4MRufFEcXr20KnuwqjtG
         9PXqtFUzkSra5L5oozzZW98JUMATRZzehRK3kZKOKu3cYmDJ7kcielmgUHZBOfO8oJwL
         ATfw==
X-Forwarded-Encrypted: i=1; AHgh+Ro9e+DqhtFXGihRDxkPRzMPEns5tqOwZ4++5aBkCUyN5cdgO4UFIwBSOyejBovjaFcuWtv/5HVyxCdGXMnUOPkA@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq/bsSNxgT5NQym+uX1ldaJNxTQhR6w7id3V+WZHmiO5/QR+fG
	RDfn9bxcJYGiWGSxX1R7Ws4WCt7gcmyA/+GR7E5O6K2pjWJ8BJO/4X7rPVBGwVEoRAY=
X-Gm-Gg: AR+sD12xkIjpXNolJOccXl5EnD8RPDZHdsB8/KJlCAbOxMcGjltrlASzNVTDZxKCh1n
	U/28Nr6YMMruSUeAMjrmBMxrBXGo75EkCWaeROUhXkxExrso7LZmlh7sYrPIn2LREgpZySt3+bP
	1n+1aj31P4RR2zgKY3Q0ziAhihTfLYqlPHvfbx7gQ7q+BnNcDEax9WFeLDeoP5myOsodEfWdxrH
	ULl/nvAShyjnpwJdlJ5fi26DWklf15C26F3pf8CcKXWAhR7voiPAmk2ELvXycFxcV2chYKs3xvN
	c4SuJ/38GU5uihjeTI119iA9l2exTaHx7B9j8F1MQMOzZsXN6wui0CMQrWSzjQhz54W8/l67KuE
	2J7R9peTIF2K6GXGlA6Nf1fM1gIaIwXuP+tLgRD5ZCP5rv4nPIizRi2zUsnm3XFcFmNtMyo1cQ+
	AwVVl+F29drZTpsb678Pz/b8IhMlvcQJ3O8kIykXVat8jnrEzJed+w82z+BdE838GA+A==
X-Received: by 2002:a17:907:a686:b0:c15:a7b9:2ae1 with SMTP id a640c23a62f3a-c210a820123mr158648066b.6.1786609886208;
        Thu, 13 Aug 2026 01:31:26 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21087e2c7dsm61260066b.39.2026.08.13.01.31.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 01:31:25 -0700 (PDT)
Message-ID: <856c4a5a-6b45-42ea-822a-01791b952af3@linaro.org>
Date: Thu, 13 Aug 2026 09:31:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] perf dlfilter: Add non-empty branch stack filter
To: Amir Ayupov <aaupov@fb.com>
Cc: linux-doc@vger.kernel.org, Mike Leach <mike.leach@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Swapnil Sapkal <swapnil.sapkal@amd.com>, linux-perf-users@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, John Garry
 <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>
References: <20260803090640.2412336-1-aaupov@fb.com>
 <20260803090640.2412336-4-aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260803090640.2412336-4-aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_013128_143791_06D97013 
X-CRM114-Status: GOOD (  22.38  )
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



On 03/08/2026 10:06, Amir Ayupov wrote:
> --itrace=L adds decoded branch history to existing samples, but a sample
> that was recorded while the decoder had no trace for that thread keeps an
> empty branch stack. Consumers of the resulting perf script output, such
> as profile generators for context-sensitive PGO, have no use for those
> samples.
> 
> Add an opt-in dlfilter that drops samples whose parsed branch stack is
> empty, so users can exclude them without changing default sample
> semantics. Build and install it alongside perf's existing dlfilters.
> 
> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> ---
>   tools/perf/Makefile.perf                      |  1 +
>   .../dlfilters/dlfilter-nonempty-brstack.c     | 26 +++++++++++++++++++
>   2 files changed, 27 insertions(+)
>   create mode 100644 tools/perf/dlfilters/dlfilter-nonempty-brstack.c
> 
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index 0031112c036e8..aeb8085b0756d 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -427,6 +427,7 @@ PROGRAMS += $(OUTPUT)$(LIBJVMTI)
>   endif
>   
>   DLFILTERS := dlfilter-test-api-v0.so dlfilter-test-api-v2.so dlfilter-show-cycles.so
> +DLFILTERS += dlfilter-nonempty-brstack.so
>   DLFILTERS := $(patsubst %,$(OUTPUT)dlfilters/%,$(DLFILTERS))
>   
>   # what 'all' will build and 'install' will install, in perfexecdir
> diff --git a/tools/perf/dlfilters/dlfilter-nonempty-brstack.c b/tools/perf/dlfilters/dlfilter-nonempty-brstack.c
> new file mode 100644
> index 0000000000000..9e66205b841d5
> --- /dev/null
> +++ b/tools/perf/dlfilters/dlfilter-nonempty-brstack.c
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * dlfilter-nonempty-brstack.c: Filter out samples with no branch stack
> + * Copyright (c) 2026, Meta Platforms, Inc.
> + */
> +#include <stddef.h>
> +
> +#include <perf/perf_dlfilter.h>
> +
> +int filter_event(void *data, const struct perf_dlfilter_sample *sample, void *ctx)
> +{
> +	/* Return 1 to filter out the sample, 0 to keep it */
> +	return !sample->brstack_nr;
> +}
> +
> +const char *filter_description(const char **long_description)
> +{
> +	static char *long_desc =
> +		"Instruction trace decoders can add branch history to existing "
> +		"samples, but samples that were recorded while no trace was "
> +		"being collected get an empty branch stack. Filter those out so "
> +		"that only samples carrying branch history remain.";
> +
> +	*long_description = long_desc;
> +	return "Keep only samples with a non-empty branch stack";
> +}

Reviewed-by: James Clark <james.clark@linaro.org>


