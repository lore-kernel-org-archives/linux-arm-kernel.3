Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1473ED59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 08:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOvWJVHqe92dPhZ+P0BBeZG4l3s19nOAl9yNieAQXok=; b=CW9bqsZQ929enWf6808pf5pw5t
	0wCKkiLnU75MIpnNMr8mqFvDJZ9pwzwDznW9O1QQD7utET+RlGxmizpYhxJP7Mzh38ZChgPdXAu0C
	QRjlKSYu1hnJdOwiEY1T3aaEdczCQxyVQpKfqRdSt73m/d7WCY4DujbLaskkdvAH1S6d7pxm9O+16
	/rgRynDulkplPOo+zUCheD66EaMN0JHDpE39JAlXG9wep3zg/nigTPgIhktWEa0cvTrA0Wd0D3u/O
	ITBHyFdKfiospDNHAwmgA5PFo7tOJh9tc9NPiGSl8CGZdQOhYoBIPKhJ/t4LGfn4pVfFnguDuxSgn
	+e4DkspA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV47j-00000003Hap-0XCP;
	Mon, 15 Dec 2025 08:40:07 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV47g-00000003Ha2-2BQO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 08:40:05 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-47796a837c7so22374485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 00:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765788002; x=1766392802; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gOvWJVHqe92dPhZ+P0BBeZG4l3s19nOAl9yNieAQXok=;
        b=xAofnosMfdsoO9YX7Km6wL32kCboKRK+uATu5xws2v6NqsmMjRSWeuPIrGgla5MhRq
         erqHav7drf1AHMDdo/zNlxA9NhiA4pVdnEde4GQ1w9YuhMorl/9e2XKAmuPMOyHMyWcO
         Q0FZjPtetcIiOFggYOPsxjizpTKCSCflf2sP0bf/J4egu23gwwcq+4wUhmjdD8wIxezx
         fR1s7C1DFR6a1zNgtEsj18R44NT9dMf4ybuv6IihnjYb67+cRbRyXRjj7tr6mLKdyXF4
         3FQfPL+lTzaRys/MWp6N24zQqZ3XoK0COvPrzdZMsxAeEEvcZH+PxiGQUt+LmGkRqUX2
         YUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765788002; x=1766392802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOvWJVHqe92dPhZ+P0BBeZG4l3s19nOAl9yNieAQXok=;
        b=A3rQnc1B8DIfbv8O1mI0ZRjXNmYZ7TwIm3Nv02plATZ09bS7D2bfx6Idf2LCaffYyp
         DT4dggduxQ0BN5IOXf6T8y+eyYfZEYPfaPO3S8/OBZNI3hPTM3nVZnguTffQgN2FQZ2Z
         M9pAhe83ilGB69vw7WU8uO4KhOH8nuDhbFL6GzFzihu799scGOb2x5NhOVdYXJTe1kx4
         1obr1SeCyeOoWHq2dwh7uFX6AuNbfBfYToZV97KGiZgt+9TLQEN5QBTcemhBU11a/3fn
         6snE3oTnpXOfNC+Nmgx7QaAWwBWcbhdSJB8kqdFfU0UWW81ahhSOLPFAyrLAkCfwCbtv
         6FGw==
X-Gm-Message-State: AOJu0YzlBw2Mp+vXej5rzBV4+YwbWupHGb2C1iYKhzNQ5/ThnAp0IWhr
	MLsdOVJ9NLx1V/MYIXnnvHf452a+X2TqbdfoTQyZX3n7+h/qmV9N8qCqxJF+ti1kXWA=
X-Gm-Gg: AY/fxX5sGwmECEJXSHbTKJ8XXxZoDpkqoZJBFQ+mlrRvQEdrzUo6P98yFkJVtrKVXLj
	3CulryDQzxAdFSOu0DNlULN2egEB2nj6OuDakqkaRgtzs7KJs3ZGrvLbN+ZRARwEusNAMREg9A4
	m6St6UB6ax5da3mZPJnFFkyF42OVEyTHhJlMjtmalLAxyDGN3LFxrYgY8DC7u0vp8tNTVLIf7sI
	cizVuJ239/cWaNu8XT4mVjuqQ7BHJV8/4R3KmjvuxgbFkRtDS9xVdxQGhf59EE/RPBSu2QmvmMV
	PpWL57nRh4fMv+Pvi2E+GWktzzAsNfK+0WnN/kDyo2Pfwv4sXYS1EOmJBRsMcvds+hJrLZvVeji
	9qrxXCpMKXwz027jAHbfk2KC7sA+Ym8DkDG8a/0lznVil8Qe+VImDiZBd3TuytNmapUfDud8jzN
	QDpCNrFxY9mqOqM14CIX7f
X-Google-Smtp-Source: AGHT+IGAFPjjozwxCPXgm59vyjrVwkbrxG7ETDJg6c98bYHLWBLTFoMu/6fzFgarA/z2HfhN4eM9kQ==
X-Received: by 2002:a05:600c:46cb:b0:477:aed0:f3fd with SMTP id 5b1f17b1804b1-47a8f89ce2emr104709825e9.8.1765788002143;
        Mon, 15 Dec 2025 00:40:02 -0800 (PST)
Received: from [192.168.0.108] ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f38a4e9sm213401445e9.2.2025.12.15.00.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 00:40:01 -0800 (PST)
Message-ID: <651e1a79-356f-4f86-a6c3-8119f1c6c98f@linaro.org>
Date: Mon, 15 Dec 2025 10:40:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] perf c2c: Update documentation for adding memory
 event table
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Mike Leach <mike.leach@linaro.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>
References: <20251212-perf_c2c_update_event-v2-0-27df9a6cb1d4@arm.com>
 <20251212-perf_c2c_update_event-v2-2-27df9a6cb1d4@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251212-perf_c2c_update_event-v2-2-27df9a6cb1d4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_004004_632924_713383FD 
X-CRM114-Status: GOOD (  18.80  )
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



On 12/12/2025 19:25, Leo Yan wrote:
> Users may occasionally need to see which options are applied to memory
> events.  This helps to understand the behavior of "perf c2c" and
> "perf mem", and provides guidance for configuring memory event options
> directly.
> 
> Add a table to track memory events and their corresponding options, and
> include the Arm SPE events in it.
> 
> Suggested-by: Al Grant <al.grant@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: James Clark <james.clark@linaro.org>

> ---
>   tools/perf/Documentation/perf-c2c.txt | 51 +++++++++++++++++++++++++----------
>   1 file changed, 37 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/perf/Documentation/perf-c2c.txt b/tools/perf/Documentation/perf-c2c.txt
> index 40b0f71a2c44eb642ff3bb234631a614b7c4fc9d..e57a122b8719f1b2e20dd509959fc1563a6c20fd 100644
> --- a/tools/perf/Documentation/perf-c2c.txt
> +++ b/tools/perf/Documentation/perf-c2c.txt
> @@ -160,20 +160,43 @@ Following perf record options are configured by default:
>   
>     -W,-d,--phys-data,--sample-cpu
>   
> -Unless specified otherwise with '-e' option, following events are monitored by
> -default on Intel:
> -
> -  cpu/mem-loads,ldlat=30/P
> -  cpu/mem-stores/P
> -
> -following on AMD:
> -
> -  ibs_op//
> -
> -and following on PowerPC:
> -
> -  cpu/mem-loads/
> -  cpu/mem-stores/
> +The following table lists the events monitored on different architectures.
> +Unless specified otherwise with the -e option, the tool will select the
> +default events.
> +
> +  +--------+---------------+-----------------+--------------------------------------------------------------------------------+
> +  | Arch   | Configuration | Options         | Events                                                                         |
> +  +--------+---------------+-----------------+--------------------------------------------------------------------------------+
> +  | Intel  | Default       | -e ldlat-loads  | cpu/mem-loads,ldlat=30/P                                                       |
> +  |        |               | -e ldlat-stores | cpu/mem-stores/P                                                               |
> +  |        |---------------+-----------------+--------------------------------------------------------------------------------+
> +  |        | Load only     | -e ldlat-loads  | cpu/mem-loads,ldlat=30/P                                                       |
> +  |        |---------------+-----------------+--------------------------------------------------------------------------------+
> +  |        | Store only    | -e ldlat-stores | cpu/mem-stores/P                                                               |
> +  +--------+---------------+-----------------+--------------------------------------------------------------------------------+
> +  | Intel  | Default       | -e ldlat-loads  | {cpu/mem-loads-aux/,cpu/mem-loads,ldlat=30/}:P                                 |
> +  | with   |               | -e ldlat-stores | cpu/mem-stores/P                                                               |
> +  | AUX    |--------------+------------------+--------------------------------------------------------------------------------+
> +  |        | Load only     | -e ldlat-loads  | {cpu/mem-loads-aux/,cpu/mem-loads,ldlat=30/}:P                                 |
> +  |        |---------------+-----------------+--------------------------------------------------------------------------------+
> +  |        | Store only    | -e ldlat-stores | cpu/mem-stores/P                                                               |
> +  +--------+---------------+-----------------+--------------------------------------------------------------------------------+
> +  | AMD    | Default       | -e mem-ldst     | ibs_op// (without latency support)                                             |
> +  |        |               |                 | ibs_op/ldlat=30/ (with latency support)                                        |
> +  +--------+---------------+-----------------+--------------------------------------------------------------------------------+
> +  | PowerPC| Default       | -e ldlat-loads  | cpu/mem-loads/                                                                 |
> +  |        |               | -e ldlat-stores | cpu/mem-stores/                                                                |
> +  |        |---------------+-----------------+--------------------------------------------------------------------------------+
> +  |        | Load only     | -e ldlat-loads  | cpu/mem-loads/                                                                 |
> +  |        |---------------+-----------------+--------------------------------------------------------------------------------+
> +  |        | Store only    | -e ldlat-stores | cpu/mem-stores/                                                                |
> +  +--------+---------------+-----------------+--------------------------------------------------------------------------------+
> +  | Arm    | Default       | -e spe-ldst     | arm_spe_0/ts_enable=1,pa_enable=1,load_filter=1,store_filter=1,min_latency=30/ |
> +  | SPE    |---------------+-----------------+--------------------------------------------------------------------------------+
> +  |        | Load only     | -e spe-load     | arm_spe_0/ts_enable=1,pa_enable=1,load_filter=1,min_latency=30/                |
> +  |        |---------------+-----------------+--------------------------------------------------------------------------------+
> +  |        | Store only    | -e spe-store    | arm_spe_0/ts_enable=1,pa_enable=1,store_filter=1/                              |
> +  +--------+---------------+-----------------+--------------------------------------------------------------------------------+
>   
>   User can pass any 'perf record' option behind '--' mark, like (to enable
>   callchains and system wide monitoring):
> 


