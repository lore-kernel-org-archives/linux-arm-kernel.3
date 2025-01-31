Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB41C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 16:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4e2zWnVciebZyfvuHW95kgPCvuoCJzRXSsGttBVDuo=; b=eMU/tAGJzVfUExIo4zuRJhzFdg
	6mX9cSYRadMLzmZY5QGxO1Qnwg8dbPtP4G2acmFqeZsFr25/9qpF1peIK1eLHaTHP2GDFKg/c9Cb7
	0md16x2gIZdctZocOI0zxIp9oOYyahGZ6jT5jhiYSLGJHKnEzyKWmxaflwsMWtfev9stvFrzqsb07
	Ds0JaRhXUeqMRLZLvRvW0fu6pUX816xrOUOt5xRLFDLwg1bGTVyJTos6azlseZhz3zXF6OiPRMo4B
	uurzMQfOMsuk/VYGeTQyr1y8R3WabW/QcwtdT+UZEGA7T0vHqStJ0T0n4cBiu97afHTt23WkfXbRV
	KbXaAbmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tduEv-0000000B2hA-39lF;
	Fri, 31 Jan 2025 16:51:33 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdu7K-0000000B1fF-1zGE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 16:43:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so22010495e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jan 2025 08:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738341821; x=1738946621; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M4e2zWnVciebZyfvuHW95kgPCvuoCJzRXSsGttBVDuo=;
        b=KJZnZG7ifTZojxkzc18c9c644hTbrQ08U5pAlbTF1KxISENihpTzCjMxWhvCfrMwPT
         E2d08a7DaGmzpSmEdCl+0RoDoQECD3uf2dhFI6RsBgMuuT2vN2JkR/pM5cP3d5ep9fk0
         iWY2U8SFTATZEm7TKZm00YXfPjTH1+sMvKj146+02KUDyhqQcjCE+6HTtAjwY40LjP/1
         q3loCbImKG8xQCpJUj1mhr7Rh/tZWCQaS7thakzEwLLSBhq6aejrbNCbKOkHieoKnshM
         CVrlcWCiXkjk2qVlmZDph9ZXzJx4ASqeOmi0KU/kob2vi4IEraDMCvwBwZMJRwlLr6u2
         o3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738341821; x=1738946621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M4e2zWnVciebZyfvuHW95kgPCvuoCJzRXSsGttBVDuo=;
        b=L1DMVoEKdjTgeB9P/m98Hk92jxqY4l5rv8upZ7lbAuR//YqfeVUsc9DL2btLn7RUxj
         ka7oYZHQINWtOSS0uaythzhW2ZUc3tCLm1VvZDAM0VwhrIa24Xnn/3qjJ+sDmekvGX0r
         +JYNqsUf+hemLT7H2UMaZZfWzP4p5JM/OuVnQWnwQRKmvQD9qQBD8HZ1HbA0rNAhP73v
         F2DB6EXlpNzdNEtuwt+aIdHsJ/hFWahMmui23/sIGNxepCTMxNQZPzaLs0rXCoCZqyJj
         kSXJGNrtZvS+gcrfJa/jjru7JW+9RvfqvZ6kFlVm5gcuMP5EH/SDpYTdOavNY0I708ui
         02JA==
X-Forwarded-Encrypted: i=1; AJvYcCWVQ4oopWegr/2Mq8+kwoSB0RzLpCBZbDQdh2oVd4rmsHfkvXJMdT2cCUxtxFaNUKql+pxXuoNeczES0Lw0+paa@lists.infradead.org
X-Gm-Message-State: AOJu0YyQOAQlrYRhdItYa/NJyulOrYpxTMFdx4AhuVEhYdtuMQJonLoY
	V+eunMjiidVt7fObR0vEztIDuV+zLRId8P40op2k64dWQvfp81BwAuDybcdvu0w=
X-Gm-Gg: ASbGncv6tmlfk4C335F2dKFV6d8/VCGUYZ6H/EoqpwUz7Oi6Fqy3PzpbWO95VOqGuKg
	M2NND9Bv9D4G3IPe9Ia3B2lf6+RAsJ9UxIcPZW5X1ZPGlhg2YoHJGEndA74GI3VGnwR8p+4qt+e
	cgsW1L3eVBnxlXNnn5G3XgR/S5B9ouT+IcPbxex/vd9GylisBQAwTV7cy+H+M7Cvxt69IPIDGzu
	wn/MDCMZY7c9xLvuBr23ZHbxSd2A/zYmutJYRyDIgS3ON/GYfhAaqdJwkOYtxppfG9spgc6Jnjg
	wmACmpj/nBiAkenzyYipaeqQUg==
X-Google-Smtp-Source: AGHT+IFTTPVO+a34Yzx36UVXc0Rk4aOZPFhQnFzSj9GM9HcFqkLze7zFulEsR/ai1dusk+GIBTsVkw==
X-Received: by 2002:a05:600c:46cb:b0:438:a20b:6a2a with SMTP id 5b1f17b1804b1-438dc3c8676mr119292945e9.14.1738341820745;
        Fri, 31 Jan 2025 08:43:40 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc27130sm95257635e9.16.2025.01.31.08.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 08:43:35 -0800 (PST)
Message-ID: <0e3f8f35-7ab0-4c2a-b7ce-f5d4f1164af0@linaro.org>
Date: Fri, 31 Jan 2025 16:43:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] Coresight: Introduce a new struct coresight_path
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250124072537.1801030-1-quic_jiegan@quicinc.com>
 <20250124072537.1801030-4-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250124072537.1801030-4-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_084342_515544_DCEB3F25 
X-CRM114-Status: GOOD (  13.07  )
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



On 24/01/2025 7:25 am, Jie Gan wrote:
> Add 'struct coresight_path' to store the data that is needed by
> coresight_enable_path/coresight_disable_path. The structure
> will be transmitted to the helper and sink device to enable
> related funcationalities.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
[...]
>   	/*
>   	 * If we still have access to the event_data via handle,
> @@ -595,11 +599,11 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	if (!csdev)
>   		return;
>   
> -	path = etm_event_cpu_path(event_data, cpu);
> -	if (!path)
> +	cs_path = etm_event_cpu_path(event_data, cpu);
> +	if (!cs_path)

I don't think renaming 'path' to 'cs_path' is worth the churn. It's in a 
lot of places in this change, but I think path is already good enough.

>   		return;
>   
> -	sink = coresight_get_sink(path);
> +	sink = coresight_get_sink(cs_path->path);

coresight_get_sink() is always called with cs_path->path, so we might as 
well make it take a whole path struct. The same with any of the other 
functions that operate on path like coresight_get_source().


