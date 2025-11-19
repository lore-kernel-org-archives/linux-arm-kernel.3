Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921B2CF31A9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 11:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9oWUgdV1H4j7xM7VCXc76DVxug1qnbqfi8eo3se1cmc=; b=ow11f8Jb/OmNLhbgyRR0qrANq5
	7GPz8KRBg0eXmV2JGQMXbAer4lrn8sYf2WPGRiE9xRF7+voXsb41KAOJqrQ8U+FLT5uzmtSbALmqc
	SyTV3mWAB38BOBhppVpPAAwCL/hSmTssI5vFupJkfRU+TQMkXSnYUir92jkUy/8Ynod2UmaCmfWsc
	jgCWP8TCqRB/buNMRmNbrr/mUPKDn3Zc0TTEgPvWGSP3fV/KBGaIsySRCcTaro4uLx71ZKHI7xcmL
	nSfeyk+0+90x4jwMwJSvp0OgxyXEXtBWXHXFdJq7TONJJnW0n0PTsRAE7oSwUp9mFsicKBT1NcELM
	/PjLbuKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgKL-000000031aH-0Eol;
	Wed, 19 Nov 2025 11:26:21 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgKF-000000031Ze-13DF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 11:26:19 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-477a1c28778so40859915e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 03:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763551570; x=1764156370; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9oWUgdV1H4j7xM7VCXc76DVxug1qnbqfi8eo3se1cmc=;
        b=bHMSScJvre27g/zN4dRVzlh9cXxjQ1DZJlijbJj662ExyvzQwjft5YfiKdFOf8Tli0
         NNO+0NG3JXY0fZz1HwAkgGNmMoe9X4NuHJDkz2MaXc3hJCLTkmCvoXHRb2X8xvujobwJ
         /GTFWvPztzmb9113VvtZU8X+yB4Z+s0P9VicBxiCDBZ+bNAu8fly5j2EGiAKZoMTINdR
         yk9ELOLGOcFNY6UEUujuuZHFoWcsZXuOJfN9yB80hcnTfJFGLmRRH6VSuW7SfjngKOn8
         4FgeBJHK3na2rY233UVNZ55hIt3W9H+ZEK5P0HGdqzOMYvEIp8baQ8y9e/EDoc7wC2Fy
         irTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763551570; x=1764156370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9oWUgdV1H4j7xM7VCXc76DVxug1qnbqfi8eo3se1cmc=;
        b=CGeKfycpGcbqcb44Og2ApaIjckaEPI7E5zgIxxzFbjXZduC7zIVabH0Anuxo6q47lX
         0vkwpjLOl9yroJxle02+/KUZu7DGteyykN9/BdYk125Vw9drrqBTVzqHfoHCFVlhUahv
         nD3bR17Z7EEdpxljXTUKB4AVheVJr04+x9+BDItF6fn9lBlUB3k9A0Z/9Ej6Gmj3yjwN
         /e9FXqzg+vHE72xlbrOYux+ZYV7VX0U6L6bhtBCYGkdQeOaXFgMCXeu7+ZOAf/Qrxpxl
         JNiWwMqFdZvJnFdUCY6Fy9xTeOoIGcOm/PNysDdVhPXNTqCzIFyoFsLsjZiRTfybbtxA
         peDA==
X-Forwarded-Encrypted: i=1; AJvYcCVObcbLLBXCVzU1SkXg0UgzuxuEprg5jxJ65HNMqh145PwkxwdT598bLp+oZfVuyCoUaHjCdm/5ApA/WF8hDReO@lists.infradead.org
X-Gm-Message-State: AOJu0YzvDe1fJkR12M5BtDX0NjVDtmOIs/9Rh2kFs419mL+dfnqaAgl/
	PwBv8dJkOrFDULKqAG1kDcQvqC9kWk/BY2vx6f5eUx9x89+RtTueoy4PS2oBexx+Fww=
X-Gm-Gg: ASbGnctMBnr1dffciOEQ2KgJuV2nu49BxZcpoeU7eyowNr4+yZFXzy9arg7ZnNVIQ5z
	FnugEBgQuIiXeQy/W+RX2vt0h5/0B79L3vQaf/3ll0Kx7L56gB1xR/5r2ytyANJ3ppxbYuPti0z
	lLvlLXdDe7RULo6PRHyLdcz2gBVS8DxwyjqUxuSi8TRzwvTsbFWd95U1H5YKYJpO8pqGczDOUq0
	Leb9YKy4NeRk2zdXHeWgczWLwlJs+8RbygPkCbr4G/yNXXCNNky0wl8YKb6ALwt2e/g481c4YxC
	GXP7zGxodMTS1J1eKjK2X95qa4iI+iS437MoTKWe07nBbhqVwsy9Hh7YQxVMSDYLY8sAlXA1A53
	iYBZdCL3tQO1ai5cj4md9P544fNGUec5UJ+1fMxVFCp9SZQ9HG5FjLfDx6RhxTKrwyYGKyBDzFc
	njebiCqGtixr2AJUTz9Ypu6pZhAwQ=
X-Google-Smtp-Source: AGHT+IGe8fJfkQN0l8WespUyvIlqiHPxZFXrEGy+rBfciXs6pY1j7OqqJ24AL/wb750j5kxbZz4Z/g==
X-Received: by 2002:a05:600c:a47:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-4778fea195emr225174955e9.30.1763551570462;
        Wed, 19 Nov 2025 03:26:10 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f206aasm37765550f8f.40.2025.11.19.03.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 03:26:10 -0800 (PST)
Message-ID: <416cf32d-d647-46dd-bcef-acc019490561@linaro.org>
Date: Wed, 19 Nov 2025 11:26:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>,
 Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-8-82efd7b1a751@linaro.org>
 <CAJ9a7VgQH4yc8490CQSv1S6k+=Uc6dEjyEpgRp1EwUQdwdxOHQ@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAJ9a7VgQH4yc8490CQSv1S6k+=Uc6dEjyEpgRp1EwUQdwdxOHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_032615_367381_366592D9 
X-CRM114-Status: GOOD (  21.95  )
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



On 19/11/2025 9:32 am, Mike Leach wrote:
> Hi James
> 
> On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
>>
>> The "config:" string construction in format_attr_contextid_show() can be
>> removed because it either showed the existing context1 or context2
>> formats which have already been generated, so can be called themselves.
>>
>> The other conversions are straightforward replacements.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-etm-perf.c | 26 +++++++++++++++---------
>>   1 file changed, 16 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> index 28f1bfc4579f..1b9ae832a576 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> @@ -80,12 +80,19 @@ static ssize_t format_attr_contextid_show(struct device *dev,
>>                                            struct device_attribute *attr,
>>                                            char *page)
>>   {
>> -       int pid_fmt = ETM_OPT_CTXTID;
>> +       /*
>> +        * is_kernel_in_hyp_mode() isn't defined in arm32 so avoid calling it
>> +        * even though is_visible() prevents this function from being called.
>> +        */
>> +#if IS_ENABLED(CONFIG_ARM64)
>> +       if (is_kernel_in_hyp_mode())
>> +               return contextid2_show(dev, attr, page);
>>
>> -#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
>> -       pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
>> +       return contextid1_show(dev, attr, page);
>> +#else
>> +       WARN_ONCE(1, "ETM contextid not supported on arm32\n");
>> +       return 0;
> 
> Context ID is supported in aarch32 - and traced in etmv3 / ptm and etmv4.
> 
> Mike
> 

Not in Perf mode unless I'm missing something:

#define ETM3X_SUPPORTED_OPTIONS (ETMCR_CYC_ACC | \
				 ETMCR_TIMESTAMP_EN | \
				 ETMCR_RETURN_STACK)

Only these options are currently accepted. I suppose the comment is 
describing what the current behavior is, whether that is what we want is 
another thing.

But if we do start supporting context ID in ETMv3 we can update that 
comment.

>>   #endif
>> -       return sprintf(page, "config:%d\n", pid_fmt);
>>   }
>>
>>   static struct device_attribute format_attr_contextid =
>> @@ -337,7 +344,7 @@ static bool sinks_compatible(struct coresight_device *a,
>>   static void *etm_setup_aux(struct perf_event *event, void **pages,
>>                             int nr_pages, bool overwrite)
>>   {
>> -       u32 id, cfg_hash;
>> +       u32 sink_hash, cfg_hash;
>>          int cpu = event->cpu;
>>          cpumask_t *mask;
>>          struct coresight_device *sink = NULL;
>> @@ -350,13 +357,12 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>>          INIT_WORK(&event_data->work, free_event_data);
>>
>>          /* First get the selected sink from user space. */
>> -       if (event->attr.config2 & GENMASK_ULL(31, 0)) {
>> -               id = (u32)event->attr.config2;
>> -               sink = user_sink = coresight_get_sink_by_id(id);
>> -       }
>> +       sink_hash = ATTR_CFG_GET_FLD(&event->attr, sinkid);
>> +       if (sink_hash)
>> +               sink = user_sink = coresight_get_sink_by_id(sink_hash);
>>
>>          /* check if user wants a coresight configuration selected */
>> -       cfg_hash = (u32)((event->attr.config2 & GENMASK_ULL(63, 32)) >> 32);
>> +       cfg_hash = ATTR_CFG_GET_FLD(&event->attr, configid);
>>          if (cfg_hash) {
>>                  if (cscfg_activate_config(cfg_hash))
>>                          goto err;
>>
>> --
>> 2.34.1
>>
> 
> 


