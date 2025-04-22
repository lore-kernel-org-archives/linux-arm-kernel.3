Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3209FC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 11:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvWmQrsXg9zHl1MPjQw5tN8WwrpI48NyLqFNhUg6Edg=; b=sFjrFbE2DE9lDPCai7Rh03jpGo
	WCeAj9DycANY4Z6I6ZswLC2lqv0R/2E2DV8SRwU6Pl8KcC0KNe51iE5JpTCjF9h6Te3jzQUz6VQVN
	OjO+YWqWmIsbxHi6rFFsNbxUCQGU7OTOocIXnRSoI8nGxrNrC+9mLVAWwic4Fou+uFkoDJvkq9KhP
	vpqP+RlqP5fiMKSrcp7FRrBFEVN6bluEvhK2/7v7BPYZZVikd49vqqNHbF/nYj/gJeP2Xxwpy8cUW
	rMN+V1taNm9UAvufSb2JuUCn78xFCsn/gpu8E9fn463oP9UuSb98nVx2E3BG18QIM5IA60tBAcMy/
	oehkjddQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BRV-00000006sdY-3jgr;
	Tue, 22 Apr 2025 11:05:33 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Akt-00000006jan-1Z2o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 10:21:32 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so42715045e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 03:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745317290; x=1745922090; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JvWmQrsXg9zHl1MPjQw5tN8WwrpI48NyLqFNhUg6Edg=;
        b=WQO1ZAEGCepObcOORaI0URF7iMVzRuJRicmj7fUM7r8llc4/yZfDgDtmN6zC8lctFv
         1riq8kypuY40+Zzd/8UUOY98nuJBz5S0TYSn2c40N+LOy0Y3lw3jXxielC4E0X+7gLav
         gj4v9AWDSt0NnteRhXCunimSeIyiUV6iyZE8r99+veyGnGJ9Mgo+RVoj6lndqYRilAxP
         aB9uKdpzNp2hELXlwKtp/N6NlNsIh0+fLvvfmZUZUeXGipC07gOsa1/gKYvZH1aZybmh
         nm2Z6KZwN6WmKO++N7nv6Qsq19LeqL74OHEE6AVKGkne9bjjPBkwVNy4ESl1+daeOBEN
         cMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317290; x=1745922090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JvWmQrsXg9zHl1MPjQw5tN8WwrpI48NyLqFNhUg6Edg=;
        b=AKv4qytDM1CL6x1k7AHORZqR3PJYz0nzyx+NrrkdPyUEK1/DArKbQUI642qZUkHsEo
         AH7F1OyFMYQzT2iFd2CXDarxNpaR8mai6NU4cjZH4R9R4rcn994pwF9rII6g4slwbigz
         WadvpqjkOpMRUjTJaFdIltNkP0aDLxvqAXwWJXpd+flZGzGDlpcoKksRfUKKV6MMggEz
         aS3lYaAeeSj2QLYGZgyO7dV7BZKTd5i+ZguJ+3AkcdlJ/seDa067qlUhyRrkJQpKkLPe
         Dog51rlLTL+o/HyITuS+L4B0ocl1ADsG2yxMsulS/tv4T6I+O2jWqI1JRBGIe5s8R0Xw
         z79w==
X-Forwarded-Encrypted: i=1; AJvYcCUK3CZBlCgt5z1yjyzhnH+wPYHizKPCY4VTHVKyao8MFwP81aXEtj9cGkR9np++CAleR5rMEDbG6XGx1A9gy2I6@lists.infradead.org
X-Gm-Message-State: AOJu0YzLkzZQRl3WIb7C1ggaAaEkms7TLifeahfedfRs12oJ/uHEU6Eu
	thg93HFdFnTYJ6EhClniFUWDRDSeymxpJ6ak1RHoNo2PY9fMKggqWy9j10OnWo8=
X-Gm-Gg: ASbGncvgsmJoDFgPSz6oplDZr7CBzz4EcpEpNplz0Vrha7j7Pv3mmMRRnsdF2Hn8Avm
	lBdioH1xW1u9eknBBPLrnNY2tmj6+mjoxpKrk0rUsVd3ld1OKZiBK4oHuB8D/j5W8NyeQYWuNwH
	+LSMLNjC1X1UlDlbpsG8KjxnZqli64w5koinuOongYAX6tYaFAJpTHH1B7NMCzqpFq1qbfdUjRp
	sU5M1HdR2iVqwH/DQm3YZHO9IVfaboiQHsP/zDda38lhdcMit3V6820mWMgtAOLB3j+YVRnPQwZ
	BiPsosXv5fWu+a8J3x2fNCewv4gGnHJ9QdwdJ14kp8g=
X-Google-Smtp-Source: AGHT+IFaqQKcJYU0wnjYmq4qKpdD7Qb4L05M0qqkdyijsfGrapNInK3N9dhMXV0eheuNB4H3XoJVdQ==
X-Received: by 2002:a5d:6daf:0:b0:39a:c9cb:819f with SMTP id ffacd0b85a97d-39efbae0e1fmr10293740f8f.37.1745317289921;
        Tue, 22 Apr 2025 03:21:29 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43bf20sm14488732f8f.48.2025.04.22.03.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 03:21:29 -0700 (PDT)
Message-ID: <48640298-effa-42d4-9137-a18a51637f03@linaro.org>
Date: Tue, 22 Apr 2025 11:21:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] perf: Allow non-contiguous AUX buffer pages via PMU
 capability
To: Yabin Cui <yabinc@google.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Liang Kan <kan.liang@linux.intel.com>
References: <20250421215818.3800081-1-yabinc@google.com>
 <20250421215818.3800081-2-yabinc@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250421215818.3800081-2-yabinc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_032131_421101_E501787E 
X-CRM114-Status: GOOD (  23.51  )
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



On 21/04/2025 10:58 pm, Yabin Cui wrote:
> For PMUs like ARM ETM/ETE, contiguous AUX buffers are unnecessary
> and increase memory fragmentation.
> 
> This patch introduces PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES, allowing
> PMUs to request non-contiguous pages for their AUX buffers.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> ---
>   include/linux/perf_event.h  | 1 +
>   kernel/events/ring_buffer.c | 6 ++++++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 0069ba6866a4..26ca35d6a9f2 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -301,6 +301,7 @@ struct perf_event_pmu_context;
>   #define PERF_PMU_CAP_AUX_OUTPUT			0x0080
>   #define PERF_PMU_CAP_EXTENDED_HW_TYPE		0x0100
>   #define PERF_PMU_CAP_AUX_PAUSE			0x0200
> +#define PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES	0x0400
>   
>   /**
>    * pmu::scope
> diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
> index 5130b119d0ae..87f42f4e8edc 100644
> --- a/kernel/events/ring_buffer.c
> +++ b/kernel/events/ring_buffer.c
> @@ -710,6 +710,12 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
>   		max_order = ilog2(nr_pages);
>   		watermark = 0;
>   	}
> +	/*
> +	 * When the PMU doesn't prefer contiguous AUX buffer pages, favor
> +	 * low-order allocations to reduce memory fragmentation.
> +	 */
> +	if (event->pmu->capabilities & PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES)
> +		max_order = 0;
>   
>   	/*
>   	 * kcalloc_node() is unable to allocate buffer if the size is larger

Hi Yabin,

I was wondering if this is just the opposite of PERF_PMU_CAP_AUX_NO_SG, 
and that order 0 should be used by default for all devices to solve the 
issue you describe. Because we already have PERF_PMU_CAP_AUX_NO_SG for 
devices that need contiguous pages. Then I found commit 5768402fd9c6 
("perf/ring_buffer: Use high order allocations for AUX buffers 
optimistically") that explains that the current allocation strategy is 
an optimization.

Your change seems to decide that for certain devices we want to optimize 
for fragmentation rather than performance. If these are rarely used 
features specifically when looking at performance should we not continue 
to optimize for performance? Or at least make it user configurable?

Thanks
James


