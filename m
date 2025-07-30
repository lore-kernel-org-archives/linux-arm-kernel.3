Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F2AC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 14:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jk6Gtn926lXsIj4x4Dh1A7mGQexyVuqQFAqQu1Vz/9Y=; b=V/MxzorKQ/jMDPmr6TcN9NUL8z
	VHLhXFHMsT5fAzryGJCWf0Q6TikALEr7oeajWmObtxVmAncgJOQOuwLXlhH13wa6ttzUlwtLM8h4T
	JAOdM1twGPlJDnC2DXtIt5niL1GmyA+mDdmvfBiT8QyTIJnAFB2cyFzU373RaSy3EtwRiSOO7fCC6
	ELi0UzZg1MOO3byv5O8zk6H2q2Q75kNHJLSqL3WYgVJi2phqYyWIclj4uAmpFvdkEzIZPzQAl2PTQ
	AwdMwKfFO8r+OADIiuSNrdUew8jj/LSgYvLw+vlOzY4+OjOWwYeO+RT/MQrIJBKJUuajyTt8WqBQB
	C5M5csCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7bH-00000001iGd-1j6c;
	Wed, 30 Jul 2025 14:16:11 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7Pt-00000001gds-1kSC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 14:04:27 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-45634205adaso30714195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 07:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753884264; x=1754489064; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jk6Gtn926lXsIj4x4Dh1A7mGQexyVuqQFAqQu1Vz/9Y=;
        b=OtuSJlsa2216atMTATLSZbsw8R2IAQv9l87FXARlAv5twpsTHWoeVlj/xq48N1z2+t
         8CjrogreiGKjPJZk5CErfgdeoYrlEqgjvOtP8lwxYc9up5iZ2bVXRJajtzugVVJWTM4h
         MW1gTZopFoMHXMj26S+ePevizlbffelWKYnjsS1pYs4xQ1lPzZwMl0gd3O4qobDtZ6dC
         EWzb96+Eafzu8mV+rLI+F2vjGHs2p9NtqGb/yDzK0uNrgy/HFtSZqdy/KTYGS86jpj77
         SvCXv27wIjWK5SYH+PN7pUaYgYaDDKaoK0cLP/2Trp2fQJj1iWzXUVJ4ZwVEiH3B/3Ly
         ct8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753884264; x=1754489064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jk6Gtn926lXsIj4x4Dh1A7mGQexyVuqQFAqQu1Vz/9Y=;
        b=N+uUzpj1Ynl8PB+LXgVP2NQbZqUxxlUuTUJJzbedy1nN5PlTg2algvwLAdCtC8AhXg
         sJW7YUeAAvOhZjYkFTgg+lEjSxwEKGGUKN7PePvEnS/dIwBCehVVdsBKj7t2h0p8WESq
         7sVwXoO/HGSGhZ0e+LxVErRh9bgBWfzMEQQGyRMcsTjoZpkIjPPHLKDoxQVwcLu34oVP
         wj28PI0SDgQjzJtrUG6d7XEMh3Ghhd+2uJNimjVqvdMjvaSMLJKj/p+d1W0cSaEECW/C
         P8BOw9OwWb6KJcMJKpeB64R6uSoqBz2NLyPjN5J9XJ0bJ65WYVynSMbpbAar/CrF10wB
         iOdw==
X-Gm-Message-State: AOJu0YxB37N5J4HkU9X9uEEoIZkZmShcxAiFhAPB1QRULxW/rQimLNTG
	3zNqHIQh69FMw63wrlo60Otw/FEKkcIKLI0rPCeygSrCVxmaxZhZrwGOGvu4eavBOdA=
X-Gm-Gg: ASbGncsloM7wyuPYgh/LrfGaz8DLjaHGgY+FK35VX/EoqRIp+EulWB4O8jUKPnfAQSH
	SLN2u7uO/NChFwN/RFHSYeVk/EH6mWGztwP+DhYHuoogeuhTGJkuHxnJrCNOOOX/h4wODsEjOT6
	hko+vdDpdAOLKqE46FgFqzZcxDMiiu5wKHJ63QzmN8anj0oENRlcZvIeN6ySFjgZig1ugYZ6KSE
	nspebaEty4My+TpfDCLewdH5DyCbb73eZcklL9kFCen/FURyvNWNR4RFu4zslzqzKXliL2uFKvv
	YF1i3jvC11s5aIG2NTAZINrh9HlZQlEVHVbkXvKF2dzHXmaA8HRfGnJ9uEjB9EWQ1t/mhtcduvU
	XzTbvtIX7+X1OFdR4S/foLjUR50EjYzci4ZfHIb/D
X-Google-Smtp-Source: AGHT+IHNA6XybUky+XOgMeIdLaBli11kALj6z7ErPNCO0GKInoPJQDHw2ePlzrIieSLuzlwB0GbSLA==
X-Received: by 2002:a05:600c:630f:b0:456:18ca:68fd with SMTP id 5b1f17b1804b1-45898a828a3mr27912095e9.10.1753884263659;
        Wed, 30 Jul 2025 07:04:23 -0700 (PDT)
Received: from [192.168.0.33] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b788f5f255sm10023729f8f.13.2025.07.30.07.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 07:04:23 -0700 (PDT)
Message-ID: <9843578b-2adb-4f6f-b3c1-99dac003e2bf@linaro.org>
Date: Wed, 30 Jul 2025 17:04:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v2 16/29] mm/show_mem: Annotate static information
 into Kmemdump
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 corbet@lwn.net, mojha@qti.qualcomm.com, rostedt@goodmis.org,
 jonechou@google.com, tudor.ambarus@linaro.org
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
 <20250724135512.518487-17-eugen.hristev@linaro.org>
 <7ecaae9e-a088-4c1b-9caf-6a006a756544@redhat.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <7ecaae9e-a088-4c1b-9caf-6a006a756544@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_070425_467276_6EBF1230 
X-CRM114-Status: GOOD (  16.16  )
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



On 7/30/25 16:55, David Hildenbrand wrote:
> On 24.07.25 15:54, Eugen Hristev wrote:
>> Annotate vital static information into kmemdump:
>>   - _totalram_pages
>>
>> Information on these variables is stored into dedicated kmemdump section.
>>
>> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
>> ---
>>   mm/show_mem.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/mm/show_mem.c b/mm/show_mem.c
>> index 41999e94a56d..93a5dc041ae1 100644
>> --- a/mm/show_mem.c
>> +++ b/mm/show_mem.c
>> @@ -14,12 +14,14 @@
>>   #include <linux/mmzone.h>
>>   #include <linux/swap.h>
>>   #include <linux/vmstat.h>
>> +#include <linux/kmemdump.h>
>>   
>>   #include "internal.h"
>>   #include "swap.h"
>>   
>>   atomic_long_t _totalram_pages __read_mostly;
>>   EXPORT_SYMBOL(_totalram_pages);
>> +KMEMDUMP_VAR_CORE(_totalram_pages, sizeof(_totalram_pages));
> 
> Tagging these variables that way is really rather ... controversial.
> 
> As these are exported globals, isn't there a way to have a list of what 
> to include and what not somewhere else?
> 
> Not sure if any of that would win a beauty price, though.
> 

Annotating the variable was suggested here :

https://lore.kernel.org/lkml/87h61wn2qq.ffs@tglx/

It does not win a beauty prize but it's simple and efficient at least.
Do you think it would be better to gather all the annotations for the
globals in a single place ?

Eugen

