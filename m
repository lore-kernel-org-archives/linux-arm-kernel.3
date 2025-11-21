Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E22CFA762
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 09:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDUGi6ZGHsutZYAEKUijNwAxRhV3XAznuzlZLBKkNcA=; b=TlC/XEmWNnHShzgPQrPGlVA3bh
	efxUxG6UiPhrPfZAa80aWQrvXPlfuyAbXYI/3asNcHpydhb4dLXaJxhLDVf0uwrjprv0wCAADv0bY
	boUea07mWs+VDaPiyODPqDssNFPvMMhSrSHuYWzlla0xPHYyN3SFV4ydUJSQTXiWUMjdfxPnsisdZ
	Ru7ON1DwpsoZpvTnotydYO4nh5rsA3lC6WK4Ecc9Wnk9kWSn7+WVITcMxS6FLZ7cAU/U8XjFAlBab
	FF+s4xiZ8gyz6mp2hOavhHQ13S/FULARzmiMufbZxM1FTp5n1sbpKyquER3etMiqE7hwJjdwq058M
	Ew2f4OJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNmM-00000008Adl-0KXC;
	Fri, 21 Nov 2025 09:50:10 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNmJ-00000008AdG-1hkO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 09:50:08 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-429ce7e79f8so1053058f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 01:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763718605; x=1764323405; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dDUGi6ZGHsutZYAEKUijNwAxRhV3XAznuzlZLBKkNcA=;
        b=SXD17xa1ni7szBioyHxYeujRq3ntoBTl/m8anH2YP8zvqw14o6e/5P6wqgutMiBALb
         GD+F09+IOtchCacx9GIVxYzRR89C4jW0UQFVjojaFYdJwlhitfBeM/lRNNhXCl1G1h2p
         iDQIQ6JeDZbr4wj7VRoJSBV6yrEV5zF117Qmfyw9P6J962dYWKyMEqNn+hs0x13CtbMy
         mu7cn2yfjAbTfH1nkd2J9UP/L/w5cSwztnTmPnuZNjxtiIq2riJpcVd7IuHbEm30UYar
         0w1atOonMBUarUnTZDYPudtiuLfOZQzuUuUvtpSHk7Ykr9xpceBu0IlqSTCF7SCDzEBw
         7Lsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763718605; x=1764323405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dDUGi6ZGHsutZYAEKUijNwAxRhV3XAznuzlZLBKkNcA=;
        b=oVobRAHc2mUPfjr5HzQCrgNsn+eqyfTLwvo6WItYEdWeTq9jEG4UuIv3pbbqkxjYFH
         aqykAI+DtSPamy8hLVHZpb6iTYM16QsCU5Zuzge6LhvMODW1htGzZGdoGWzEsfGcVIUm
         MY3HPHwXgjXvAAoZWGXooxRwWJrPafL2wikTssnTkVihp5HSoGMR9aKIhNgVE90OJbFs
         xy8ABebKEsYEefNKN0N+z4b9KIEJJZqZDldIcb3ts3IbNe67UrP06bIMzgSDTIbdo/PD
         WsCT8NEKDhjfdCpZzYY/bb3z2uXaioV+71TOpcUpaSduWA2XlMfZikNoL9KWk63kZw10
         a1pg==
X-Forwarded-Encrypted: i=1; AJvYcCU2cVuNCKyr1ngs4LRzUJ7AkhrlHHjDtWHlMqCU/pArXUwNP4XqhZN/+pm3T1iai6sckn7owsYv1p5cObV+4Wrs@lists.infradead.org
X-Gm-Message-State: AOJu0YzW/m+XRNLF6OL88QRs56+0dMAg5CgOVxzTwkLSmFhgyJlTC8R2
	Bi4kLc+ovmNUv+PzloxrNPhtmaVZeCUgv3YGOWpeAGgmM/ccHB/wUHb1iX8yWHKraXk=
X-Gm-Gg: ASbGncup5cW6lyh8eKfts4LsE7bPZ008nK0rJILze7rgckmMWZ4FHvx47jM9oJsCZNc
	wT85+6m/Q7PYktGlHKjEt71Yfro9XyGmOvudIHAmFzWM+LAPVuRmu21t4OcmxPm8Nbgh+eRokRR
	Py5q5jeKF2DDt5l4S4lIr2s6EK7fY/hAGJqJY4ubVWMQfXgehELFmJO9LtSNTw7PR6qxS7hkd5T
	9kslZPMy0ZMf3ONj5k+wBemCz5+x58MXKguR1DGumjE/Pj0X3GQwg6rw1wH1iEHl9Gca6W0soLs
	AVI/ksJC9L6IHWq3Lrr1F7blnqPWFS/0Qznhil6nV9La6bT4tEBmgl6sNrAOPVK1l5rVvA7MeBm
	zQaXfpOoFhfYX6M+IKQyyahQ4Bzxf6smVONfd2o735Ze5SxRBrpUc4m7tUQwnI4in7t/HG5wf3H
	R8NPBTNHQxaSb3tDSIZtf7KwzDDbg=
X-Google-Smtp-Source: AGHT+IE8M+EHxlJLPo2q1ptcszz4xTi5Hcpr4PPexE02LnvTImirC4/2Tss40XTDEV8NnTZCE45Gbw==
X-Received: by 2002:a5d:5f48:0:b0:42b:32f5:ad18 with SMTP id ffacd0b85a97d-42cc1cd5deamr1732407f8f.9.1763718605414;
        Fri, 21 Nov 2025 01:50:05 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fddsm10479833f8f.14.2025.11.21.01.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 01:50:05 -0800 (PST)
Message-ID: <172ca2d9-4a6f-4498-bdfd-8aa7428581ce@linaro.org>
Date: Fri, 21 Nov 2025 09:50:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: etm3x: Fix buffer overwrite in cntr_val_show()
To: Kuan-Wei Chiu <visitorckw@gmail.com>, suzuki.poulose@arm.com
Cc: mike.leach@linaro.org, alexander.shishkin@linux.intel.com,
 pratikp@codeaurora.org, mathieu.poirier@linaro.org,
 gregkh@linuxfoundation.org, jserv@ccns.ncku.edu.tw, marscheng@google.com,
 ericchancf@google.com, milesjiang@google.com, nickpan@google.com,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251121002350.1166758-1-visitorckw@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251121002350.1166758-1-visitorckw@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_015007_493174_9D18D698 
X-CRM114-Status: GOOD (  30.82  )
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



On 21/11/2025 12:23 am, Kuan-Wei Chiu wrote:
> The cntr_val_show() function is meant to display the values of all
> available counters. However, the sprintf() call inside the loop was
> always writing to the beginning of the buffer, causing the output of
> previous iterations to be overwritten. As a result, only the value of
> the last counter was actually returned to the user.
> 
> Fix this by using the return value of sprintf() to calculate the
> correct offset into the buffer for the next write, ensuring that all
> counter values are appended sequentially.
> 
> Fixes: a939fc5a71ad ("coresight-etm: add CoreSight ETM/PTM driver")
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> Build tested only. I do not have the hardware to run the etm3x driver,
> so I would be grateful if someone could verify this on actual hardware.
> 
> I noticed this issue while browsing the coresight code after attending
> a technical talk on the subject. This code dates back to the initial
> driver submission over 10 years ago, so I was surprised it hadn't been
> caught earlier. Although I cannot perform runtime testing, the logic
> error seems obvious to me, so I still decided to submit this patch.

Nice find. I think the point that it wasn't caught changes how we fix 
it. Either nobody used it ever - so we can just delete it. Or someone 
was using it and they expect it to always return a single entry with the 
value of the last counter and this is a potentially breaking change. So 
maybe instead of fixing this we should add a new cntr_vals_show() which 
works correctly. But then again if nobody is using it we shouldn't do 
that either.

The interface isn't even that great, it should be a separate file per 
counter. You don't want to be parsing strings and colons to try to read 
a single value, especially in C. Separate files allows you to read it 
directly without any hassle.

> 
>   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> index 762109307b86..312033e74b7a 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> @@ -725,7 +725,7 @@ static ssize_t cntr_val_show(struct device *dev,
>   	if (!coresight_get_mode(drvdata->csdev)) {
>   		spin_lock(&drvdata->spinlock);
>   		for (i = 0; i < drvdata->nr_cntr; i++)
> -			ret += sprintf(buf, "counter %d: %x\n",
> +			ret += sprintf(buf + ret, "counter %d: %x\n",
>   				       i, config->cntr_val[i]);
>   		spin_unlock(&drvdata->spinlock);
>   		return ret;
> @@ -733,7 +733,7 @@ static ssize_t cntr_val_show(struct device *dev,
>   
>   	for (i = 0; i < drvdata->nr_cntr; i++) {
>   		val = etm_readl(drvdata, ETMCNTVRn(i));
> -		ret += sprintf(buf, "counter %d: %x\n", i, val);
> +		ret += sprintf(buf + ret, "counter %d: %x\n", i, val);
>   	}
>   
>   	return ret;


