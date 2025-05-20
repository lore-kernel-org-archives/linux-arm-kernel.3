Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E81FC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 10:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UsL0/X43Kovgl2CQvE90LVM3KYV/xDGuiojzqF3Gd64=; b=PNo/FJVjsxPDhVPS3NDumYNHiN
	OGVH8eosWMVS4CArjlTTaMZToIOKr4mw8GyLHVCk2YJWOMkYnXhuOWPxwebhaR1j2qkUZWJJ+P0yT
	3tP3QUZj3t+DhbxtJZTDa3213fu3VJjvzUiWIm37y+dfD8/BREpZFZc+kU6lvKCVXtYDLeI0TvuLa
	8pny1ZHuXeVyxJQnecJOpWyWSv35uwBviKe4DZjBnTyZQ4UmS9TFRCyr0Laa362ZvQlIv+YM0vONu
	ncPcnGkQEtZh4mK9yACQ/LaBiGrNYyQdMuO/EfqdcY0KtRvT6y8FP3bZPUU8En1E0fs4YvtSSFpnG
	+nDD97dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHK3N-0000000CJWX-3zIr;
	Tue, 20 May 2025 10:18:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJZr-0000000CFbz-38a4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 09:48:04 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so43564205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 02:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747734482; x=1748339282; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UsL0/X43Kovgl2CQvE90LVM3KYV/xDGuiojzqF3Gd64=;
        b=AyQPzxbthpA7w2squ/l/tjaQOP8L6w2vJvMy0W/4eoBYJj/yBBAV9xWj83DgyIgPkc
         Wd/GAfQSX0H1voa6i19zyDf3lFv9XUW4TdV/px/WKTIzGLzszAeZUNbSnS4iRpLelKwL
         H0aimMtFji5QwnEWWhFxIsD1diWSW6BgWU/G1dbWScLGQqShjcQuksgJK5+90IElvlJD
         ZiMkPY2eBIP2Gcxg/zvAx4UEWEHB8IdKPLb4mG418g2TcjaKwOXgG9NPWZPPsv6v2dYn
         b6A52GiQ4z6/ouxRfglxWLNe+B4Ke8NkMfe6webdJK7yIRjqaEGSmcQaxOO6jkx9IAVG
         s9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747734482; x=1748339282;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UsL0/X43Kovgl2CQvE90LVM3KYV/xDGuiojzqF3Gd64=;
        b=Jh4mhHOzc1YzCfQ3xm4PTBygcFY6/cLYEPsqUzo2zTajIiNYqSrXscSqvzc4l2SKUa
         Np95FJVu0l1dX42rXoG4DDXhAmO8Jro7Sw2UV2sRsSAjmqv3RtEAPDGJn6LFJ5KAoM+T
         Gn1xOKdD8HHn98VgV3ogZELIFTKztNANXbMA+TXOZgPtTeIuUi9FxZwaY/Kq+YyAxnQT
         xBn3JUxfMx089NXM/7ga+N5hbMZ0LCtJHI6g3TMazRzdaAlUc0QLbQTMBjBoYb3CIuEu
         QE8B+WShN/5E16mgjFwpwRuUmOjINwtsoHFgGRD0dde8oRxnSax0NOQ7Mwl2yt95y4jP
         nnSA==
X-Forwarded-Encrypted: i=1; AJvYcCWMkdVRjAwp7meZPWhRyoy/VWl29GHWN5JjXJm3pL/jonBqnE4emKlieEq+Tf456CgqkN3alL8Ph479s1SV7rEg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9o/S3NAnPhhb0di6qKx7ZLcA1b8NQNFh2sfypnlMxN5fpQSS8
	Z2Nfd2kfOyjadZqUdrLJZmS8GCwwxb2SrvkfpWObSt/3NErkBanj9X+mriua5aDQG6I=
X-Gm-Gg: ASbGncu8t24GKlcvrzeXkXnKjIf69b5tgpouXk0TTmsqCvF8JcC+/Zvv6+uJgEqq3cM
	AX4wNWjXq7pFcBMj1EVksBWxr1rDAtqTbHSzAwVWo4bFv7O05n++HSBijwZWxXvpN1hg2JfwnK1
	FzwFGdZ4NsDPtfWBCj9eQtSd1tZfQpJa8zFQfBsvRpfsKMTkypis3HLp3ImyCT+Docn2UcfGqLz
	55Q6IvvhQ7r5j26xj55H2emsZe0fw+zteH8Ma0Q22oZeU86Py38V1V9VD13s7Cz8TnBpBdnueRe
	SjvfmeJUNsNKKu4yxheaUF+ny78HOsgIZBy3cFFYYviFvG5qCqm7v2I/
X-Google-Smtp-Source: AGHT+IEgJADZfyQ+PYPZothDFv9d4A22FPank3mMv3U5tKOWPZqWZ+dZMmqSIQmuHLho+QwliaNi2g==
X-Received: by 2002:a05:600c:a378:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-442fd64dfb3mr192394795e9.16.1747734481883;
        Tue, 20 May 2025 02:48:01 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5beccsm15975018f8f.36.2025.05.20.02.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 02:48:01 -0700 (PDT)
Message-ID: <bb6f9f55-81fe-4dbf-8de3-f95185bf00de@linaro.org>
Date: Tue, 20 May 2025 10:48:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] coresight: etm4x: Fix timestamp bit field handling
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20250519174945.2245271-1-leo.yan@arm.com>
 <20250519174945.2245271-2-leo.yan@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250519174945.2245271-2-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_024803_792173_917343BD 
X-CRM114-Status: GOOD (  20.16  )
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



On 19/05/2025 6:49 pm, Leo Yan wrote:
> Timestamps in the trace data appear as all zeros on recent kernels,
> although the feature works correctly on old kernels (e.g., v6.12).
> 
> Since commit c382ee674c8b ("arm64/sysreg/tools: Move TRFCR definitions
> to sysreg"), the TRFCR_ELx_TS_{VIRTUAL|GUEST_PHYSICAL|PHYSICAL} macros
> were updated to remove the bit shift. As a result, the driver no longer
> shifts bits when operates the timestamp field.
> 
> Fix this by using the FIELD_PREP() and FIELD_GET() helpers.
> 
> Reported-by: Tamas Zsoldos <tamas.zsoldos@arm.com>
> Fixes: c382ee674c8b ("arm64/sysreg/tools: Move TRFCR definitions to sysreg")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c  | 2 +-
>   drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
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
> index 49d5fb87a74b..ab251865b893 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -2320,11 +2320,11 @@ static ssize_t ts_source_show(struct device *dev,
>   		goto out;
>   	}
>   
> -	switch (drvdata->trfcr & TRFCR_EL1_TS_MASK) {
> +	val = FIELD_GET(TRFCR_EL1_TS_MASK, drvdata->trfcr);
> +	switch (val) {
>   	case TRFCR_EL1_TS_VIRTUAL:
>   	case TRFCR_EL1_TS_GUEST_PHYSICAL:
>   	case TRFCR_EL1_TS_PHYSICAL:
> -		val = FIELD_GET(TRFCR_EL1_TS_MASK, drvdata->trfcr);
>   		break;
>   	default:
>   		val = -1;

Reviewed-by: James Clark <james.clark@linaro.org>


