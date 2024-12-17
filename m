Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EBFE77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 17:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLefb8Z/1dQ9RlGboLgWSvRAfBbTlhXb7ifP2jXYA0o=; b=NzS1HRjO+roqIEdk1lv+c41tX+
	pH4oms6Cl5u82D8gTk3dulDdCABdgaAJgye82DBHZVemLWH62HFa/Y3Ny6PuSFgDqD6Jpb3AcEqoU
	jiHZO4iYtjJX96alSeGub7gNjIYm0ypYMEIBTPtA7Wi25maebfvxiG0Mx+QnjT3vP97UTFmXYKEGv
	owztWG+tm2hyNMaZBlfHHEt2/TgT7CpECrFdzyfhFkhkcj4UFG0rb3gCXwXTY2W4p32m9ct0ZALig
	CwYT3XOtswNNekgr9nFckEyKaFnVYYOYI16omWNyjJ2PQz32rBORT/zfkoj4Qnnb23iVV4BlZ+s0K
	qWC3sKBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbD5-0000000EItH-2FwU;
	Tue, 17 Dec 2024 17:18:15 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbBx-0000000EIlp-2TSc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 17:17:07 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so3837192f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 09:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734455823; x=1735060623; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XLefb8Z/1dQ9RlGboLgWSvRAfBbTlhXb7ifP2jXYA0o=;
        b=nAfH3A1VDuE6TPsxTkxuss16qJEYlxMswYXM0ucNtkG6u6RFEGeKHJapX+txmlE+0K
         72qc0DzKgn/sjYTiyPd0jBbeV1IHF8KKoByFG4Dvuw+0Wy1qnBn6erZobFzHeMSVvdyQ
         EZLCJJn1h1VK+Py+iuYD2jB3UQDIokY0fdQwkuWBpV0MaKke7gFZtuBg/5kXaCNXmyWb
         OZk5HcGUPBG5ioCkQYP4NXcGXv+gYSHTLfbETUeMmLqdg9gQjFJEHOraalFddJ6QOnlN
         twwU3L8mAATIMDMdvcmidTAPuD58kO3YTjl/kGmBZLV/HM0trzdQGKHWHcHwbtfW0RCA
         WEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734455823; x=1735060623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XLefb8Z/1dQ9RlGboLgWSvRAfBbTlhXb7ifP2jXYA0o=;
        b=kmXMgeT52ydYW3+Y3xGA/a1PxKMEtjYJMYUBE96SiFIO60AmfJ+eXhBHnlG0rz6Nub
         QC2EcyvXsFI2/31KdinjO6KH4Ukn9pqd4LqghbFVbgovpvCIjDTvzchEHYuNF68ES9DN
         ORxyQqmBdTVxAVohvaTZjAGnb/NR8u1/AelthRtsO1UF2RvaeBMEWYt1HWYaEMGVuLAd
         v2H3WlNSIVrrA5Vb+zbfdIC+J2MIinZAW0+5Pxs1I2TaWUfLq5YLQ3t+pLS9vlo0kWEQ
         hYyGC1nvSnulmLavJdvH834l7xgHJ4wZIvxPwqShwV4Y5eOdg7YZ73wvnkEqh868Y7h7
         d5JQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4tHldIhJ2FoyhPToLHo/UyxW7fNHNgERwKnej0V4F0Vp7CRNHIvrlsXX0nlY9Zie+vDgufKTu32dnymee2YaD@lists.infradead.org
X-Gm-Message-State: AOJu0YwS3d6Szgu1AI+Yp9nonVVqRA+k2lcx2FTJ6giLMhlFgN+R7wVA
	ESFLzmtrxgNbjtVuxPLVbUgC3vAX/yR8k5omA/WjyFNqsKZU7QD2YDcRlAsztiI=
X-Gm-Gg: ASbGncsOIIGOX4wtZsevUqTgYoXhhmYe44lo4hrlLADxHyNViOOdZVEEAdckSAE+UcX
	GtBECu4sTvTHvYj6tX5akuQjCLNGfDjwFNa9V+ikgxh+EhC5/luWwvXuePtlb4iT1SQf43uICT8
	jRSYhUJLMc/jd+dpkE7YcgfAEP5t1QgeP4pvl8iymlCxqOqnBT0sRVPxTQRlyPJA4SaXiyKJApB
	3UWXpx1AbAl8GGGI1WK+pzuN/gW+AfoayhV5J9V8JSpM+tqEOtR9JhdY/Hzx2hVnBY=
X-Google-Smtp-Source: AGHT+IHW8FLcQvFLOkTfiFxTJUM786W3SLQIjmtJNRIgKR/TJsAsPI22IQ/snWtB5ESeIpY/+CTaUw==
X-Received: by 2002:a05:6000:4b12:b0:385:f1bc:765c with SMTP id ffacd0b85a97d-38880ac1909mr14900187f8f.6.1734455823556;
        Tue, 17 Dec 2024 09:17:03 -0800 (PST)
Received: from [192.168.68.163] ([145.224.66.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80608e3sm11544818f8f.103.2024.12.17.09.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 09:17:03 -0800 (PST)
Message-ID: <50e4aab7-d262-48a0-b956-2c2df0faeb25@linaro.org>
Date: Tue, 17 Dec 2024 17:17:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: docs: Remove target sink from examples
To: scclevenger@os.amperecomputing.com, coresight@lists.linaro.org
Cc: yeoreum.yun@arm.com, Mike Leach <mike.leach@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@linux.dev>,
 Namhyung Kim <namhyung@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241210144933.295798-1-james.clark@linaro.org>
 <9e53f5b9-d8a9-46b8-8ff1-7f018e2d9c06@os.amperecomputing.com>
 <24299600-277f-48f4-9be5-cbd65ab6ddb7@linaro.org>
 <75ce4def-b0ca-428f-99a5-19ca98e876a0@os.amperecomputing.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <75ce4def-b0ca-428f-99a5-19ca98e876a0@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_091705_631687_234FBC6F 
X-CRM114-Status: GOOD (  24.62  )
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



On 12/12/2024 7:38 pm, Steve Clevenger wrote:
> 
> 
> On 12/12/2024 7:27 AM, James Clark wrote:
>>
>>
>> On 11/12/2024 6:01 pm, Steve Clevenger wrote:
>>>
>>> Hi James,
>>>
>>> I thought I'd mention this issue with multicore self-hosted trace. The
>>> perf command line syntax does not allow a sink "type" to be specified
>>> (e.g. @tmc_etf or @tmc_etr). For multicore, it doesn't make sense to
>>> specify a processor mapped sink as would be the case for single core
>>> trace. A sink "type" should be allowed to avoid the auto select default.
>>> In our case, the default is the ETF sink.
>>>
>>> Thanks,
>>> Steve C.
>>>
>>
>> I'm sure it would be possible to add support for this, but I'm wondering
>> if the real issue is that the default selection logic is wrong? Are you
>> saying the default you get is ETF but you want ETR? And there is both
>> for each ETM? The default selection logic isn't easy to summarize but it
>> should prefer ETR (sysmem) over ETF (link sink), see coresight_find_sink().
>>
>> It's probably better to fix that rather than add a new sink selection
>> feature. Maybe if you shared a diagram of your coresight architecture it
>> would help.
>>
>> Thanks
>> James
> 
> Hi James,
> 
> It appears the default sink selection is ETF for multicore trace. In any
> case, for the Arm® CoreSight Base System Architecture STC Level
> compliance, I need to be able to specify the sink type.

Yep it makes sense to add support for selecting it then then, I will put 
it on the list but not sure about the priority. I think looking into why 
the default isn't working is more important for now.

> 
> The Ampere CoreSight hierarchy is described to the ACPI as follows:
> 
> 
> +-----------------+
> |                 |
> |       ETM       |
> |                 |
> +--------+--------+
>           |
>           |
> +--------+--------+
> |                 |
> |       ETF       |
> |                 |
> +--------+--------+
>           |
>           |
> +--------+--------+
> |                 |
> |       ETR       |
> |                 |
> +--------+--------+
>           |
>           |
> +--------+--------+
> |                 |
> |      CATU       |
> |                 |
> +--------+--------+
> 
> Steve C.
> 

I recreated this in the test here: 
https://lore.kernel.org/linux-kernel/20241217171132.834943-1-james.clark@linaro.org/T/#u

But it looks like it correctly selects ETR rather than ETF, so I'm not 
sure what the difference is between your setup and that. If you can have 
a look at that test and compare it that would be very helpful.

Thanks
James



