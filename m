Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72950C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNWSTKzUy1blZzyvhN25vL86fOsto5YWkWgeGQDDTjY=; b=KRwN3NIe1Yl9lBM3hlRIcDDMXE
	fgFIYhVoKMI96l7nP8dj1Npf9BafjqyRRe94haZnuWEmolCIvQafWxnbYglg6L32OhzHXpAjM2wJF
	Dg14NL4pdEWPSjNVmuXT8gKqa4tEez1W8KiEvOxVbkpFjYX1cvhk2cBqo7HiDVVj0Ta8shTnKMYeb
	pnBOAsOYU257M5TfDZzoosJNjpov/7a4d5mn0taerdHHXiPR+mnkT6MUl5RfO7uw3SxomkdxzqQ3h
	xAEehmu37XnZPwOPe86aYwKVM85BQlQ9c/ldW6GF3atpi7jeX3kaa7JqthPtvGeg02jrQmCr7miiF
	cAEClVIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH29O-00000009XU2-1BPH;
	Mon, 19 May 2025 15:11:34 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1Dl-00000009Pr7-1pi4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:12:02 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so54762585e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 07:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747663920; x=1748268720; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QNWSTKzUy1blZzyvhN25vL86fOsto5YWkWgeGQDDTjY=;
        b=cFlfrcjuQR1M98p3YEWSGiVBngUQgGQQFEFSaCG45ScYxsULU+nIS9Xu+JowMEFP2z
         sr0Qd3TiJQOI5WS5nMuZicrtwnKOITK2BWfwWGDk7JJFFH7wwGKUWaP95SYj58cVGYIr
         yoanNm+NT8qrEpkOWdmh8Mpwl7ujAQ2j0oErIkwWQtZtnCcY4p7PeabcXV6csV0jDvR7
         hA8qV7uM0IcYixEV8yCUFRuw0nMYLomyhhpU9TZQQIFzzGQu1MZy47BF2JsWtPctBjCN
         QoN4rQ/nUjVlC/KdXKPWEnN/OoBrkiG6+G3zBpI9CHvkqcO6NCKa1q7baJKnfP5Ue1wQ
         YZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747663920; x=1748268720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QNWSTKzUy1blZzyvhN25vL86fOsto5YWkWgeGQDDTjY=;
        b=nG9p7pb+9CCABvEeXUxT+9XWvuRP369pzC1Il+CdmNSVREFR7Gd0OPcum9mLIrMvTH
         Y0WLr0dtq2Rw4XdqFftnDXZ4+8NRV9CpqkjBYD2lTsVWP1Yu/rlLkA04RE0RTYkUA4/y
         24hf6HnX+cujQHJ6rJMn88LHbjcpVsXyJStizlbuk8atWC4clH4mMqkmoG35u57sg9sp
         RxZsZ5rl+ZCPkqSGTEeZEkBueCnAO2SOpcLmOOAYvx7QwRgKl/9lctqmFywCGyG/Xfz5
         qM49QFzxyjxdGQmWaNcTux8+1T5ApoSkr28oZE9rFNksNpb4Ztk1upgXaWjOQdFDHBI+
         LaBQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8WM36pda8O8hKcadVNhiQUCAaLZaPp3SJqYHnQ5JFwxIXX4Tnhvf++agE9z6OJeTeo2oR0TX+oE8lrGMnxxVY@lists.infradead.org
X-Gm-Message-State: AOJu0YyJP1s66RkCP8afH4g44I+/0NlzWZyYafnipy0VZzamFP0PpggG
	SwKOLslisKAmYZrJe92N7tlQgXSazqP6KznG5v2fce87qFmrEHVjg+zWRFpE7XEjKnU=
X-Gm-Gg: ASbGnctCtgAf318hZWaot2fAARusdtQcgEZUjAJaC84BZPyRZ+6p4g7RXPfgcoAWxAq
	a/r/9kH8dKfOkJ88p46WfgEXigBH3yRzlIJpj+hCuojApNAR0vCDaD3NK+0IEwXoawNDnsRjMb9
	e4K/osjY126hskv+Pkovfh3C1IH5s1v3VyyEZGwfRfhmowORBPfqF1SqpSDKZPwfbXynf1b//St
	8zRSb2BdqWf12dBup8XmaHt6d9jdwoU1TnMyKu2C50AGKDOzezy7O1bDc4EWNx4XeJdX64FXVOd
	8qj6LMKGSG2JnxPMi4vIjvdWBhWepWo/K01o0tW9yOwfi6UjAFWfLy6/0JeVvPiLm8Y=
X-Google-Smtp-Source: AGHT+IGLvFf2mokmXetF6bGNqH3uWolS1DtjEPpnIwoyt0CIMXCqbIq/B5oatYvzEfObQKfU5MtOpw==
X-Received: by 2002:a05:600c:524d:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-442fd6649bdmr116318835e9.24.1747663919925;
        Mon, 19 May 2025 07:11:59 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a366e08747sm9562193f8f.95.2025.05.19.07.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 07:11:59 -0700 (PDT)
Message-ID: <a6e1be6a-0684-4cef-9052-ff19fcff8a56@linaro.org>
Date: Mon, 19 May 2025 15:11:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: etm4x: Fix timestamp bit field handling
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
Cc: Tamas Zsoldos <tamas.zsoldos@arm.com>
References: <20250519135027.2204747-1-leo.yan@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250519135027.2204747-1-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_071201_484494_03B3916D 
X-CRM114-Status: GOOD (  21.30  )
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



On 19/05/2025 2:50 pm, Leo Yan wrote:
> Timestamps in the trace data appear as all zeros on recent kernels,
> although the feature works correctly on old kernels (e.g., v6.12).
> 
> Since commit c382ee674c8b ("arm64/sysreg/tools: Move TRFCR definitions
> to sysreg"), the TRFCR_ELx_TS_{VIRTUAL|GUEST_PHYSICAL|PHYSICAL} macros
> were updated to remove the bit shift. As a result, the driver no longer
> shifts bits when operates the timestamp field.
> 
> Fix this by using the FIELD_PREP() and FIELD_GET() helpers. Simplify the
> ts_source_show() function: return -1 when the value is zero, as this
> indciates an invalid value; otherwise return the decoded TS value
> directly.
> 
> Reported-by: Tamas Zsoldos <tamas.zsoldos@arm.com>
> Fixes: c382ee674c8b ("arm64/sysreg/tools: Move TRFCR definitions to sysreg")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   .../hwtracing/coresight/coresight-etm4x-core.c  |  2 +-
>   .../hwtracing/coresight/coresight-etm4x-sysfs.c | 17 ++---------------
>   2 files changed, 3 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 6a5898355a83..acb4a58e4bb9 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1237,7 +1237,7 @@ static void cpu_detect_trace_filtering(struct etmv4_drvdata *drvdata)
>   	 * tracing at the kernel EL and EL0, forcing to use the
>   	 * virtual time as the timestamp.
>   	 */
> -	trfcr = (TRFCR_EL1_TS_VIRTUAL |
> +	trfcr = (FIELD_PREP(TRFCR_EL1_TS_MASK, TRFCR_EL1_TS_VIRTUAL) |
>   		 TRFCR_EL1_ExTRE |
>   		 TRFCR_EL1_E0TRE);
>   
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index 49d5fb87a74b..8a2749eeb9a5 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -2315,23 +2315,10 @@ static ssize_t ts_source_show(struct device *dev,
>   	int val;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   
> -	if (!drvdata->trfcr) {
> +	val = FIELD_GET(TRFCR_EL1_TS_MASK, drvdata->trfcr);
> +	if (!val)
>   		val = -1;
> -		goto out;
> -	}
> -
> -	switch (drvdata->trfcr & TRFCR_EL1_TS_MASK) {
> -	case TRFCR_EL1_TS_VIRTUAL:
> -	case TRFCR_EL1_TS_GUEST_PHYSICAL:
> -	case TRFCR_EL1_TS_PHYSICAL:
> -		val = FIELD_GET(TRFCR_EL1_TS_MASK, drvdata->trfcr);
> -		break;
> -	default:
> -		val = -1;
> -		break;
> -	}
>   
> -out:
>   	return sysfs_emit(buf, "%d\n", val);
>   }
>   static DEVICE_ATTR_RO(ts_source);

Reviewed-by: James Clark <james.clark@linaro.org>


