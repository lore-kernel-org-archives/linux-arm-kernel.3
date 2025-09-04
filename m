Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2269CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFkBz8t+kCT8UUeu24okw56fSQSLiELatilmrdAB8x0=; b=wV8bNKMZlyJ6giSH2QocT/lJu0
	9QlkhiKbljQQ6Uv70MITZMaTqy2JoQe1EIJZ+s4If6ax5NaJkKlvc+ZDCpO0Y/ckACLtjxqWxBFgp
	uIAxpK9hqNaIojp026HkxrSJ0RcmbLcBiistV2EszMB7QWwHXCBiZLWhQV7NeMUqOloi5f96FjGju
	jQaOuT59Ofn4zOs/j4jdUIMZ3j6gmdGS8Q6L3sUHwpXLzapp6ZIgkuwAOOfyRKZ6Wx/RlxL6uSmhA
	is0M1Y0UQqNazeEiw3T2p3muMkHN++t71azMBroxMB4yzC5JMB6Iwu8hDzxPYTcxfcz1NzgBSAYdf
	eQSbYuNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuClA-0000000CqPK-3EVK;
	Thu, 04 Sep 2025 16:24:28 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu8dJ-0000000BPPv-2OXX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 12:00:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45b8b1a104cso9082075e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 05:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756987204; x=1757592004; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AFkBz8t+kCT8UUeu24okw56fSQSLiELatilmrdAB8x0=;
        b=erEMlPHFeNocJJslVl7tfSZzrc9cgk8THcCb641eH2xb+IpVewiYDTgao9gn0R5g9d
         UnhzZ9JmpjZI8bAbKM4byGgY4sBgqXFj1yXdPnWFAFve0XuegJtIDLffNuUqVL3crJUG
         dSS2OtABso3C/7ALRfCQoK319dbNsMFD9K/GucUankoHguNRe8Vjp4p3Mciei9C4+Cp+
         4dpf9UyPFkKcUkNPrU6Jq0cUH1StB8tyqU7L/zinz0Pg+TProBFG3RNG9jbijOOGzlUb
         hcMk8yIZo2IeiSdF+kqVmDkuL2Ki6vuaCKhrhTjeUvsSlSjzEr9fqETdLSpGh2owbfa+
         FH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756987204; x=1757592004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AFkBz8t+kCT8UUeu24okw56fSQSLiELatilmrdAB8x0=;
        b=lGMJmW5WsYDc4uBbV0MoYI6qQLPqO2JJi2JNan7qTWYiDaG/Emih6nKEQG27qR4W0r
         yrGh233IiHBjlmswOBj64pBsMu+zKV1HqIHy90XvQd+kRbzM1ihBaHahnlHHzAcVZgOn
         Y4HEfzRdN529TaPWZJNRwuC1UDKr6OoaXzhywblyTnLrvXWitS8iotZ+BrPWkJubRDt2
         IdK/Peh9zocSzOOdquruAA5bSsadCgvN2G+xFOHc9qKAuzkoMFFFAm2D50zGy//p9m7I
         Zu5GVqF4K+8COaFv39AZ5aFO0Ec2z5S13Mr9zqUTHX4OTblXAUgAtLBwI6LynOvCFWaq
         3iUg==
X-Forwarded-Encrypted: i=1; AJvYcCVaxnJg7NS7RXv3yHT3FB1GRrU0p39YxDPcoYKPeN7Y1+c3N1ilHcLo7m4A7mQgtgHD525HO1IaqTocTIIfGGyi@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4tqoySETa81hDNpgL+ct2VAsgYNOrTZ4aEXw5WeWeZDThcMSF
	EDl29M22LGGIcm/Xe8XDkC3aBm9M6XFqRXmHGmu8afdLNNrDLNiwG9VrCeoUnQSSolA=
X-Gm-Gg: ASbGnctBQ3LlMX0WPQ7Qn3FhXMLFjNFKQhSKk2EwmOcifW8C8gLRYMOZEalpHgxc6d+
	j4Z3fZEOY6zSpAPP9q39KkZdHL8sNSTNyFsAB32ANvXSHYdf8cgKioq6eRP+JAP2yjVyBKUbUsr
	IkU3bitJnAO8e2BJiZ/MrPv1/IUc2+WGsvM36AIjBgLeJ7Zqi766EcEqmfD1Lp3ZKZYt3CwVlpp
	QCrvGf84PYX+Rs6cEkw5HSicYPdLZ3RR/Qck1M4TenjxSo7NjFugqZK41du4kNjG5pdBfg/QemV
	+YlH+fV1kvl/Fwkh53EcFCNXVLhTwxhsqtSR9A6ZvuIuMwuzIlzN9tqLgp9ZsW/2wpCtuggwzYv
	flPMBDthCLpTvQ3aU5eNN6hBf5TyCQjGax7ggMg==
X-Google-Smtp-Source: AGHT+IEeJr8/W7i384dfItP0nBlu/2Q4pZvcih8lGi8Ow9/IMWLIJQ8ZyVlqeIZXNl/vx/mclRKwsQ==
X-Received: by 2002:a05:600c:1f0e:b0:458:a7b5:9f6c with SMTP id 5b1f17b1804b1-45b855335a8mr163914835e9.11.1756987203568;
        Thu, 04 Sep 2025 05:00:03 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b8f2d3c88sm151251345e9.19.2025.09.04.05.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 05:00:03 -0700 (PDT)
Message-ID: <5f24d286-629c-404f-8e0f-aa01e27bcb80@linaro.org>
Date: Thu, 4 Sep 2025 13:00:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: perf: Fix pointer check with IS_ERR_OR_NULL()
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20250904-cs_etm_auxsetup_fix_error_handling-v1-1-ecc5edf282a5@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250904-cs_etm_auxsetup_fix_error_handling-v1-1-ecc5edf282a5@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_050005_627043_EAF68F43 
X-CRM114-Status: GOOD (  20.68  )
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



On 04/09/2025 11:53 am, Leo Yan wrote:
> The returned pointer from .alloc_buffer() callback can be an error, if
> only checking NULL pointer the driver cannot capture errors. The driver
> will proceed even after failure and cause kernel panic.
> 
> Change to use IS_ERR_OR_NULL() check for capture error cases.
> 
> Fixes: 0bcbf2e30ff2 ("coresight: etm-perf: new PMU driver for ETM tracers")
> Reported-by: Tamas Zsoldos <tamas.zsoldos@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index f677c08233ba1a28b277674662c6e6db904873dd..440d967f5d0962df187a81b0dd69a7d82a8b62ba 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -198,7 +198,7 @@ static void free_sink_buffer(struct etm_event_data *event_data)
>   	cpumask_t *mask = &event_data->mask;
>   	struct coresight_device *sink;
>   
> -	if (!event_data->snk_config)
> +	if (IS_ERR_OR_NULL(event_data->snk_config))
>   		return;
>   
>   	if (WARN_ON(cpumask_empty(mask)))
> @@ -450,7 +450,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   	event_data->snk_config =
>   			sink_ops(sink)->alloc_buffer(sink, event, pages,
>   						     nr_pages, overwrite);
> -	if (!event_data->snk_config)
> +	if (IS_ERR_OR_NULL(event_data->snk_config))
>   		goto err;

I think the bug is in TRBE. It's the only one that returns an error 
pointer, but only for -ENOMEM which would normally be NULL for alloc 
type functions anyway.

Also it's assigned to event_data->snk_config which is later NULL checked 
rather than IS_ERR_OR_NULL in free_sink_buffer(). Maybe that path 
doesn't happen, but all instances should be updated anyway.

It's much easier to keep it as NULL and make the fix in TRBE. It also 
wouldn't need to be backported as far.

>   
>   out:
> 
> ---
> base-commit: fa71e9cb4cfa59abb196229667ec84929bdc18fe
> change-id: 20250904-cs_etm_auxsetup_fix_error_handling-cb7e07ed9adf
> 
> Best regards,


