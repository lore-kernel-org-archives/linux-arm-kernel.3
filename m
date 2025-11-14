Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F88CE7A8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 10:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrQJj+UBZFNYF2dhW3PzZmg/h3v8iAh4uR7Mb9IBPf8=; b=BfqfIC3BljFygZs+164T7I+jxp
	RfPB9xrAe4U/azvzWF610AnFMueXT6nPMTgLbH9GdzEKSGJJclQqhlU4Td1orYuz9g0T2r3JzpA4X
	GqhxvT0t4mb3K7JpwZJ++VEYmzpUKmfMjLmTaSeuczto8w/Iehy+AgT9gkAKcaZ0ta938T9o6HcQ3
	xJd73Nae1kRvqS9niLML1lViJ4U1hmm6RqSj5kzjqjZs32nyAyuxMZgTlxwKAErx/Hhl4T8UfX6GJ
	8DueoW91/paUGitAU93wG9HA/OC5mjAqJzHMYVULlTXvULSMqjVdF+GggnbV4dr92g1Oy+L3fkxLn
	zPhTfscw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqau-0000000Bxxx-1KgO;
	Fri, 14 Nov 2025 09:59:52 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqar-0000000BxxV-3rm1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 09:59:51 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42b312a086eso1077650f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 01:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763114388; x=1763719188; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nrQJj+UBZFNYF2dhW3PzZmg/h3v8iAh4uR7Mb9IBPf8=;
        b=zFU11PUO8dWLHeS0XfgKU5f6QWI4uXsKwcXXeFmt2+9TMCZGQqkItjUNFJzHs7nH11
         SESaRQTBsYXQPOJI6dhu06zlFDipL4xk5Lziwhynx1/qu7ltQzz4C39jR+tL/nJ2IFe8
         y6ImEd5RKke3O3oRfi3tNp23+gFkXlwsNyJnLAccXVOX1AQpYQSTYXueBdyQU9JPpQwv
         1NnT/cahd/CCYx5/PuKx/9mFQZ4iqXRg9zljhDlsm2hnfEhcKitqKUpbould9smhFrFO
         tg1xSDCVVcPSUUW/J14LhJx1RSq89xIiRxxP5SZCuRJhl/9CdNEZdbFwJ6g3gm3FPqlu
         sLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763114388; x=1763719188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nrQJj+UBZFNYF2dhW3PzZmg/h3v8iAh4uR7Mb9IBPf8=;
        b=VuHTYEKPs0MQmj2uJ3ZhtkxjZyjsUi2uZhdM4K1R3rjJP0BQ4mHs8tS/5wct8pMjYm
         3swkk+sqtfiWWu+YT7Kf2KxULoAebj8zsmqcnh9ZZmkE6Kj5v+a62OMICXJ40PWYPjBO
         1ZYJDvUi5xgbSPaRJHyls9jIAkt+yopvWqVMEXdZmztQDWZewx2KH9HYzRYBhYQfJB8C
         jBj/5p0y5tL5wpjOIIqcj3E4OUc6Qx4Yeh7N6BlpSzw9UZ2+9lWOwD3ImX7T8L/cTLq0
         M2z25RMkp94v5tbCAeesGtFbW+LNm3dRepDK66V6D/4l2WOngcofCuHzE5VnhWqNURLT
         p/9A==
X-Forwarded-Encrypted: i=1; AJvYcCUXkv2GDCTweU5oG7Um4nczTCyzZ/yMPsYlXF5ZdXHDBRCFdUqKYH+06PLwKKuAyqCRpHCHT1AeYOUM+A+ouGtr@lists.infradead.org
X-Gm-Message-State: AOJu0YyMkfTTlivDM8azUZwENKMXRqVlB+2alR27PvPaOL9FENdnsnti
	TZJz7jNxgxykRYl1iiHiZNyYycyRslcH9LzcST8YJIfAO9l+3fsuNSgEjBJTd1BJQG4=
X-Gm-Gg: ASbGncvIzc+pVDeURQCLItqQD59hGrxNa92kG8CxZd573rv+3OCbZ4MgcoGdRh5k+S+
	o1nHw7pI27MoGNJBZ//6BQUqrQMqBqEkZx3xj7ENMGWTFg9oNEr9bGd1UuomR3avACLeqAPaV6e
	20H8mzjlLjeWcSLZugeAXtO+J2rilXVVmYyCh2p4iEUpzJlzKcfRf/wiSwFZQV3cFD97Pl1/uBK
	woVJRSGmqe8TEVoxuHArv5EHnt+zUAwQZHtXw5THZ4/i7S7MhxIOCU5y8EBWvli/hZdMzPPYIfc
	eJo7nw+e1ehac7jtv82TuzK3BqxYJ3NbX6z8v2V+BL8TI9All01jMrZmlXVxPGBG/M8Wd1h+qCF
	9ZpfvEJGuTkNLFpDNVnIjO8HQi5atGdm7BIWsThgeCFz5GbI4wQZmVmIZWPzPZm6Ko7iTMTiIzY
	2A2ndHq9aTGD6zS8PV
X-Google-Smtp-Source: AGHT+IHr/RGTftbN2wZlrzbDKOZVG2oNeQkhL8m189JNVIJ0i0dp6Io7uXTllB06dYu72314ISgwTQ==
X-Received: by 2002:a05:6000:2c09:b0:429:c2fb:c268 with SMTP id ffacd0b85a97d-42b5959ec5amr2193055f8f.56.1763114387741;
        Fri, 14 Nov 2025 01:59:47 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm8780535f8f.35.2025.11.14.01.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 01:59:47 -0800 (PST)
Message-ID: <67142b63-b413-4ed6-8526-b18b38667d42@linaro.org>
Date: Fri, 14 Nov 2025 09:59:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] coresight: docs: Document etm4x timestamp
 interval option
To: Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-13-165ba21401dc@linaro.org>
 <0eb1a2b7-8064-4ac5-bcf8-b4898a8b5ac7@infradead.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <0eb1a2b7-8064-4ac5-bcf8-b4898a8b5ac7@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_015950_026214_179A2460 
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



On 14/11/2025 5:02 am, Randy Dunlap wrote:
> 
> 
> On 11/12/25 7:22 AM, James Clark wrote:
>> Document how the new field is used, maximum value and the interaction
>> with SYNC timestamps.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   Documentation/trace/coresight/coresight.rst | 15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
>> index 806699871b80..80b5ed09d69b 100644
>> --- a/Documentation/trace/coresight/coresight.rst
>> +++ b/Documentation/trace/coresight/coresight.rst
>> @@ -613,8 +613,19 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
>>        - Session local version of the system wide setting: :ref:`ETM_MODE_RETURNSTACK
>>          <coresight-return-stack>`
>>      * - timestamp
>> -     - Session local version of the system wide setting: :ref:`ETMv4_MODE_TIMESTAMP
>> -       <coresight-timestamp>`
>> +     - Controls generation and interval of timestamps.
>> +
>> +       0 = off, 1 = maximum interval .. 15 = minimum interval.
>> +
>> +       Values 1 - 14 use a counter that decrements every cycle to generate a
>> +       timestamp on underflow. The reload value for the counter is 2 raised to
>> +       the power of timestamp interval - 1. If the value is 1 then the reload
>> +       value is 1, if the value is 11 then the reload value is 1024 etc.
> 
> 	  value = 11: 2^11-1 = 2047
> 
> Maybe add some parens?
> 
> 

Will do. I had them but I removed them because it was in a sentence so 
it made it look like a side note. I think I'll change from words to symbols:

   The reload value for the counter is 2 ^ (interval - 1).

Thanks
James


