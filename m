Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9280AC9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 09:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrUZW93Kpo3duA4VkIX/sYF08Cc0xHufuLcywAkXwOQ=; b=xRrGiK4vttVsZ6SGzkhKOwaphP
	gwUelnP7+XBmOdRKU38r3WicCbni7FCoeIOo7SfRrsw/hWh2ZLH2LRDXMzi53bpivhToY1wM8WhF4
	mCIui44Uu60VJpVyjpsgNFDfG04WX9dskB97e+g0s6HSKVy8+fpOvv3PnZDg2y8jLKPk+EJvtaWfy
	UYWAtu5dnxXb1jGxg6zDbEOwcxdZtTOcRpsZrry41Kl1IXJEwP3pZfCkb5NAinRySNDBSdm4DPiQv
	SW9TL/TbbcVD4Q/MWo6MLSEr03PYXuOYleG1EoVvcoZ7sM7pM0P1VBkv8QaXouXzcQmxRu8JwYFZJ
	DIlYBHLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7QH-00000000C1i-2v0Z;
	Mon, 28 Sep 2026 09:13:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7QG-00000000C1V-24DH
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Sep 2026 09:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zrUZW93Kpo3duA4VkIX/sYF08Cc0xHufuLcywAkXwOQ=; b=i4AfHERCYFrh/GI/rReI2wTj6I
	BhkLbBoZLAZu/XsjaWOPCyLxeopIzHy2qEKZ5tdG7JOibY4R6K7Wb3z4EZVWy0/B5AXOGHj7ThZ1K
	duiYwZInySVXIQ4kuxbIx44VSXblBxEMB+6XdzZLf1lnmmnejcR3gHNv9GICIXktGCPp1gq+iTkTO
	W0g12JH7DZlDdbxSYSYgYqpQJ3pBaFaid8y0rtSBsPnyzVYpCNSnH+eznRg5+5SjK/EdGGzRHrHvG
	lboG1srp+VRksJe5LXvIRXW+ZkVJsR+QTt5wIEZl6kMCNdBS9JPIi4i4xHLdepJXIRhQRhqSnuib1
	N6BjzWpg==;
Received: from mail-ed2-x0d.google.com ([2a00:1450:4864:33::d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xB7QD-00000001Hpy-07tu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 09:13:18 +0000
Received: by mail-ed2-x0d.google.com with SMTP id 4fb4d7f45d1cf-6abe19c4262so1659700a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 02:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790586795; x=1791191595; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zrUZW93Kpo3duA4VkIX/sYF08Cc0xHufuLcywAkXwOQ=;
        b=yC5UfMB1f8BBvGW8crpwovjJjsFc+WSaiq6o2NvoPd1Vl7djghIVFfl+P1gzSySu1o
         HjO1h312yOAJ3jJfhktqD6vxZx+f/9ct1Gkos9Q/3gqzs8Hpc811tiCuUGtPmdIFWe/I
         JogvCaAvwU2QwgHMc4SKYiqXRJLcPC/tzXgyLB/VScB8Z1tb6NZFnFuDIUpitkh7Y97i
         y9qxrIs1fXUlgNpQmq9e4Ni41lOdeJ2Xy8pyN5lSzsu/tw6Bx/7M40Q8BqpMFZiBT4OV
         sf9RFZ1H0crv/gJtVYoDUMDOhkN8JPvv8mQqrSaJcPVZ3QC/pdLOGTLWn7IWWIKcXRWD
         KddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586795; x=1791191595;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zrUZW93Kpo3duA4VkIX/sYF08Cc0xHufuLcywAkXwOQ=;
        b=yH0r7NAKGCmdsMtQAQ3BGNmYOrdc8+Xjxj0NUy8kbNXYcOcc/GcLP8emasPsp9YiKi
         YUGOBWmZH0ESofsYKmzXAnw/mf8J8BIS56BRoLy3LtclQqz8D3TMDZSJltNHTOYQ2JXw
         OwB1v6agwvp66YN9N3RI2GCWUcIvL/U0VbEI91YjYI7ThZOxWogdGq2b/TAYn7gHoTeo
         wPWXk3edRRvOv8qPdl6o4qllPg4Zyk3CnNtofVUHX3lPLoY/1BJaRcTPT46ZpfnOg9xg
         nq5wnirvsYabPeTBFgXCeov1Oh+McRxtGt+tl2GEAOH33Lx2tjgmZvrHLdUpcVB7RJaT
         uQQg==
X-Forwarded-Encrypted: i=1; AKwUvBzr9kcdI+Fz+NZI8PmEYB5HChvyB9rZwoYPcONg6PJGRMh2+8gEPaS/KbFzzbW+Shp6BBn27bU5bQNn7qZgqmHN@lists.infradead.org
X-Gm-Message-State: AFq9FYKmUDyDtVl7VUdkk8sX6qVN7xiTB6TjDdokd98hR30jvThP15L8
	zDnP1ffYdody1kRgWSv8CxpmGX1BfiDp0eQlfwIm+OpkELU9sey6ln5byz9dgpKWmHk=
X-Gm-Gg: AYBFou3d17xOd4Dv4yrcMBSacwITYSy7YIIJeT6esw8GEAIBdB9cjQoo4N1L4firJVs
	whwBUdeiyOm6RJPiVUuozfiFg33qC2yQFwIrFtIOVed3ng6c6mkczBwTx+iFMH8urMFeg6y7duQ
	ivBarAxGJbNzq1Tdaw06rUbj1IP2woaRvt01gEaRHpqmXQ+B4LEoYhnjHeyRm6hf8n6kJReUBpJ
	xaf44f5i4tB+RgmDJNFXmzqh2eVA+3PJS8wC22jQe3rpZW/Oqn1p4xJMWe89W6+fB2e0JRqM+HH
	c+1aPr4XBZ6ZRm9fns/eyo3x4ACwZDoIckYeoBjul+UHtmz6NJ50ebKF7VFdhKpqq4TuExq1EUy
	B4/3a5gk/Un8eGwR5/XJz3+W0nuZDPu0jY8srr/UdkPThb4jlCMChaZmFCNE3+PHMMYEM3k46AW
	rGxqMcKzmL/jVHg7/1hh7VMfCWYK8/DcvgGZ5DwywoRb9zHY+ww+1CfVxGkP0TC837D6njnwzaA
	Utw
X-Received: by 2002:a05:6402:2552:b0:6aa:f809:ef41 with SMTP id 4fb4d7f45d1cf-6aaf809f225mr5554167a12.3.1790586794617;
        Mon, 28 Sep 2026 02:13:14 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dc0cddsm3868145a12.14.2026.09.28.02.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 02:13:13 -0700 (PDT)
Message-ID: <efd21aac-4faf-46bc-b1ef-7791e7458cf0@linaro.org>
Date: Mon, 28 Sep 2026 10:13:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf test: Record kcore for the CoreSight callchain test
To: Leo Yan <leo.yan@arm.com>
References: <20260928090644.24346-1-leo.yan@arm.com>
Content-Language: en-US
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260928090644.24346-1-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_101317_266270_239478F7 
X-CRM114-Status: GOOD (  20.35  )
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



On 28/09/2026 10:06, Leo Yan wrote:
> The CoreSight callchain test traces both userspace and kernel execution
> and checks the callchain across a syscall.
> 
> Add --kcore to perf record to save the running kernel image alongside
> the trace data so perf script can use it to decode the kernel trace.
> 
> Add a Fixes tag so the change can be backported to stable kernels and
> improve the test reliability.
> 
> Fixes: ca0e19074bd6 ("perf test: Add Arm CoreSight callchain test")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/tests/shell/coresight/callchain.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/tests/shell/coresight/callchain.sh b/tools/perf/tests/shell/coresight/callchain.sh
> index 13cca7dc1118..b69187f1a37f 100755
> --- a/tools/perf/tests/shell/coresight/callchain.sh
> +++ b/tools/perf/tests/shell/coresight/callchain.sh
> @@ -43,7 +43,7 @@ record_trace()
>   
>   	mkfifo "$cf" "$af"
>   
> -	perf record -o "$data" -e cs_etm// --per-thread -D -1 --control fifo:"$cf","$af" -- \
> +	perf record --kcore -o "$data" -e cs_etm// --per-thread -D -1 --control fifo:"$cf","$af" -- \
>   		perf test --record-ctl fifo:"$cf","$af" -w callchain >/dev/null 2>&1 &&
>   
>   	# It is safe to use 'i3i' with a three-instruction interval, since the

Reviewed-by: James Clark <james.clark@linaro.org>

