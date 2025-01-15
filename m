Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57888C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 16:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXbEAizqUTZVuiKMmXI2f5b0xWse2rfqahkj0NXB3Bg=; b=TkYM/fUXO0lNuF
	dq3+2Dj25SAbCZWhzA8ObM3O2dz3GtkVgXjL49zdvPCTtaEnONTBMqaD4hxaA61PIZuXoQGZniqhy
	EqzeRmffVQtOb7dC9rcZ1TdFqI1zgBWisIqScB3pNTh2E2wE+272d0db5Zltn9TasPupOuOVuDjUi
	rezIYwHoIxQydb/62MQnIE27bsCGWERbxcbMg59q2qumuc/IhfGyh30OsnW+N4ewIcbnL4hg6JVbC
	5MYCJKk0JaKyBGaDkE4XLiVRdPgYyzhynTbV5Uh5VfopwkjGQWHbTBI34xdo5l+lCQHElG+VgFTZI
	sGo9W6u7y00wANPRuyUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6j3-0000000CWNI-2HiV;
	Wed, 15 Jan 2025 16:58:41 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6gz-0000000CW6k-2J5F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 16:56:34 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-436246b1f9bso8816825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 08:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736960192; x=1737564992; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rXbEAizqUTZVuiKMmXI2f5b0xWse2rfqahkj0NXB3Bg=;
        b=gPDICvOiJmmWsYEszfrCG9g8wMcHmyS2rOpsMLbg9NY0i4KGnQ5tMrPrOeq8OUdCyF
         +NAnfMS5osW9Oq4d+N1uPwc2vuSuJv46GtZp64xR8sOrHXQHM/WbyDMJtBFAqxcQirsg
         1TXkHqP9kd/SINydtHFnoCl9vrSc5h3+lIERcOzphXVYjGNeqOr+bZqlm5ZDWs7HavjN
         f31vJOfSiAjWfac9BSdTAWD1z06w3lb6RdS1pofSeV5kL/OTjfFy+GH/PuzQEqEUla5n
         oCpP3MSera3iKwtuucgbvLt+NTk/dgL5nJ0NyS/OFnOESfV6fWINn9pSvcVsVG95aViP
         TDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736960192; x=1737564992;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXbEAizqUTZVuiKMmXI2f5b0xWse2rfqahkj0NXB3Bg=;
        b=sFsp/k2JxcsuRpmqgFyb3e7PMgdQ0p+zH9DX7zYGegYbS+hk87Afy8kuKjGU5ueHTR
         Ub3+vWYAgmwcsNH6TfRoLuZJdP1qils3+BaCz3Ond2fSNmwAUDZgsmEC9oxKhwFc3g40
         2byWG9WYqY2ndIem4FN2QUeHaOMQaFEWQAmIk4Yzgk1FnvUBHkF81P/T+llUU9AKMdGP
         ECg5jXI7grevb9Zpc3q987S9h1QgODL46u02IwUWDS1qpSOqHWxc1rdfatbQUPhwDpTS
         N+6CLRcYvExaQARg2lUSUXw7Wrp+P31j58AYzewIrsqUWma/M4bCv4ettRbcj6zihAby
         Q5Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUa38TUhnggXmGz68hVEm6z2XPqQkwVIWnxfIHzDtbaxae++rbF4N8FZMEMOVspaYNJIyKFujToHkA3jA7fb0C1@lists.infradead.org
X-Gm-Message-State: AOJu0YyP44ynlN85p+M0UV5Ph0VauB6jwfivoY2nTB8LqeAqRadAhEuP
	3khPKKDeMeiu0V+u0i+AjZklnWMcS1at6EbZZL6M8c4rN4kLmiL+wHAbxb+MAJ4=
X-Gm-Gg: ASbGncu+oQPah3AB9TT+YzXMPj6xXsMZfTZvEL2ztkrtECEhezTCQJlOqPwD4huX/bq
	Kz4Y2Y+RfzRdhpAs+onc6FJoiypslLrjscofGAEd1YEG00fG6mTvNID2mAPCV6R9ZpjLqieIwKa
	d4bTgX5lLjxJRxs1YGIfK/dPKZoDktu9Zz3kdzK4+LjcAn4jJsn5X6PNA5kTcG26RTO9wXMrLRf
	q/VhXGJyRKoRXS7Gh7RAQD9gmvroCEUc4UlLAKOOVd/jDjaGzAyyZe5S3LFeymPgQL40Y2f46w0
X-Google-Smtp-Source: AGHT+IGwicwetGUijtzDTGRfb/TOLnPoZiMKKj/JyRkm5goIVswOyx9tIDQ25q8nW4vkAV3O6qjxbA==
X-Received: by 2002:a05:600c:3b83:b0:434:f586:7535 with SMTP id 5b1f17b1804b1-436e256093dmr107352995e9.0.1736960191852;
        Wed, 15 Jan 2025 08:56:31 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74c5817sm29082365e9.19.2025.01.15.08.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 08:56:31 -0800 (PST)
Message-ID: <8976e64c-34aa-47ca-9d5c-81cb06392621@linaro.org>
Date: Wed, 15 Jan 2025 17:56:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: Use str_enable_disable-like helpers
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20250114203623.1013555-1-krzysztof.kozlowski@linaro.org>
 <20250115162923ddf1d821@mail.local>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250115162923ddf1d821@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_085633_592125_D0890C02 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, Joshua Kinard <kumba@gentoo.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 15/01/2025 17:29, Alexandre Belloni wrote:
>>  /*
>> @@ -252,7 +253,7 @@ static int at91_rtc_proc(struct device *dev, struct seq_file *seq)
>>  	u32 mr = rtt_readl(rtc, MR);
>>  
>>  	seq_printf(seq, "update_IRQ\t: %s\n",
>> -		   (mr & AT91_RTT_RTTINCIEN) ? "yes" : "no");
>> +		   str_yes_no(mr & AT91_RTT_RTTINCIEN));
>>  	return 0;
>>  }
>>  
>> diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
>> index 78f2ce12c75a..1f556cdd778f 100644
>> --- a/drivers/rtc/rtc-cmos.c
>> +++ b/drivers/rtc/rtc-cmos.c
>> @@ -32,6 +32,7 @@
>>  #include <linux/init.h>
>>  #include <linux/interrupt.h>
>>  #include <linux/spinlock.h>
>> +#include <linux/string_choices.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/log2.h>
>>  #include <linux/pm.h>
>> @@ -604,12 +605,12 @@ static int cmos_procfs(struct device *dev, struct seq_file *seq)
>>  		   "DST_enable\t: %s\n"
>>  		   "periodic_freq\t: %d\n"
>>  		   "batt_status\t: %s\n",
>> -		   (rtc_control & RTC_PIE) ? "yes" : "no",
>> -		   (rtc_control & RTC_UIE) ? "yes" : "no",
>> -		   use_hpet_alarm() ? "yes" : "no",
>> +		   str_yes_no(rtc_control & RTC_PIE),
>> +		   str_yes_no(rtc_control & RTC_UIE),
>> +		   str_yes_no(use_hpet_alarm()),
>>  		   // (rtc_control & RTC_SQWE) ? "yes" : "no",
>>  		   (rtc_control & RTC_DM_BINARY) ? "no" : "yes",
> 
> I guess you missed those two.


Yeah, indeed.

> However, I'm in favor of ripping the whole procfs out of the kernel
> 
I can send changing these two or skipping procfs parts entirely.

Best regards,
Krzysztof

