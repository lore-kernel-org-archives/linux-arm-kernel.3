Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99022C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 12:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FR7LOBfgMjA2RsqEaQnFiGMYbwNkGFoaG0P7aHkHt7Y=; b=YeU2nRItvpMxeGAsp+AL27Nu9K
	aRq1KJOs3dSFq5A/9OI361KXzRHHdp9pHw1JVTeHRih0XT66h7qMZcQh6nYqohQoT2h5syCp4AvI4
	TFG9ZsUJvykvIvn9ZdbRLNoS4O5MHGrfj8LJi+FIQsJWi9kMmL8kL6EE/q6/nTCEu3UABlJA0BHAJ
	hg/k7fHvkXFKWSt1ZGux/CMkmZH1SA1L0zVcMNp9/AJzaGmKgLm5Vb4NsxbNQca50oDiWk92G1yxA
	QABtyyiK0fEh8IH2Tq/k11KgCyDJfsO2BnjU4ZsQ8YooRVRKyjxEgSJWQCQ9ubgc8MkoPJ20hc4P1
	yDcCuY3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tusac-00000008yth-11UN;
	Wed, 19 Mar 2025 12:32:06 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tusYv-00000008ybs-00Sm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 12:30:22 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-391342fc1f6so5500556f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 05:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742387419; x=1742992219; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FR7LOBfgMjA2RsqEaQnFiGMYbwNkGFoaG0P7aHkHt7Y=;
        b=PDbYikBSSvEY3t+7QSHNJzTjSFOociymeIybKRLQ36oorYCWJQ+WXj7aq9tqfcQWNe
         kW9Ty7vU9cf/1B8YyEXk+tYvpzSoVdLu7iTPSvcTJeAMOL32K+b+pVusf9j9X82+mgE3
         12GhMvNbUKpJxlv25GYwPo6w7k8tsZPKAdKTnoZJxU1DNecMeTk0Ywz4zVYtpxauXTmB
         OD+A3aHV/LuE2zBmyBV8/66wCGpdNI+uErSZVR3MHcZbG7qAFcTb3k8qLbvAtNaC+SqF
         nbJyKTmt1ffSusokEczA2dRrH7p87IZG1jec695l4FdHT1sO+aViuv3f7CghW6fm1xm1
         Rxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742387419; x=1742992219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FR7LOBfgMjA2RsqEaQnFiGMYbwNkGFoaG0P7aHkHt7Y=;
        b=WemxxdVQ4dGOYWmQpBbqQsFd1BuFVf4Hm4OzrDTPMsiozNgS/tx8KySXTmaTgV8+LJ
         DkNX+QT4bibDHQHMTYUAsvPOHe8K9icaTCbbUZrmFopuFfaFaLHmGZDB6honw8Vb1eD9
         xux8tNMoqgzOWpucX7ItkrBngrPF3Zpqegr7fNIbMkieky1aGcgmbdlTzgIrOE5m7dxE
         g0mXdeeVD+n3n3z9DHKfssBot2rUgyN0/tzdKVtJX6C0TsRuO1O10n5makWvlfXO4aB4
         vSz2JYNceOAE2+TRXl0Hrp/wtpROG+jjpcMQ9LJqmzy8ri6wPubKAPGkssB4VVuv6SJC
         LNbw==
X-Forwarded-Encrypted: i=1; AJvYcCXS40m+cV9bAQAqKFEL8BGmjyapdVnKjSXlFCkQJkDWPcdP0HU0H/Wsp9eYr3WNhAfzC90XoJeUEbs/Xtw2A8MD@lists.infradead.org
X-Gm-Message-State: AOJu0YyF0eEK7C/edxHFgB9FttYtrxhX5pFc9qbA9L140KdsVFCTdTIU
	cNPS6cW0xGkRM4IzK44jbb5I+WcP23tRMd9gyPZKYCrJL2umIYbEq1OH4TrfqOo=
X-Gm-Gg: ASbGnctW2j1jCdix3wi378sCBpp6nx552l0G5Y/Czb8Eayz2AGKayKSXh/lI1ki/NGF
	0i5VkY4QDDYueL4eeHu9gJh2EkmOqZX4GaX2gmpglHxrsuMefGb4WBb6S7PiRFhxE6meFNtoY6J
	C7khNjaU9/jpT695B3pYv0VLNzhG3EDJhtWFtmv0zztuKmPuLYjYkje35w/Ov8ZBd6cA8XNfBuk
	+A2YSuNlZOTz7GMoaVZEtlUZ0HOpRlNmDjmWFqWyCwfXXi2htwYTKEcoS6VOIJ75J8FJ1gTvL6S
	CdHW76c/Jm6XqCqdnHIXxpT8lX2lnkbB+LJUaOykpbhWP/nF5yi9IQ==
X-Google-Smtp-Source: AGHT+IElD83yXdXLURLXF/axbPrNrrCeSAlJQC+eF2bcCRNhZkvyLSVVQgbNardWtBxjxy/EPmxOCw==
X-Received: by 2002:a05:6000:1847:b0:391:456b:6ac8 with SMTP id ffacd0b85a97d-399739ca1camr1959945f8f.24.1742387419344;
        Wed, 19 Mar 2025 05:30:19 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.67.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-397f2837e61sm15560737f8f.97.2025.03.19.05.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 05:30:19 -0700 (PDT)
Message-ID: <2700171e-dbaa-4218-9b46-5d181f5afee7@linaro.org>
Date: Wed, 19 Mar 2025 12:30:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] coresight: Convert tag clear function to take a
 struct cs_access
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, leo.yan@arm.com
References: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
 <20250318-james-coresight-claim-tags-v2-2-e9c8a9cde84e@linaro.org>
 <cc68d43f-4719-4f57-a38c-fb5afe8d29cc@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <cc68d43f-4719-4f57-a38c-fb5afe8d29cc@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_053021_046320_3FEAD07C 
X-CRM114-Status: GOOD (  22.37  )
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



On 19/03/2025 12:00 pm, Suzuki K Poulose wrote:
> On 18/03/2025 16:21, James Clark wrote:
>> The self hosted claim tag will be reset on device probe in a later
>> commit. We'll want to do this before coresight_register() is called so
>> won't have a coresight_device and have to use cs_access instead.
>>
>> Also make them public and create locked and unlocked versions for
>> later use.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
> 
> minor nit:
> 
> The restructuring looks a bit confusing. Could we start with :
> 
> coresight_{set,clear}_self_claim_tag_unlocked in Patch 1. Rather
> than rename what we renamed in patch 1 again here.
> 
> 

I considered collapsing these two actually, would you be ok with that?

>> ---
>>   drivers/hwtracing/coresight/coresight-core.c | 17 +++++++++++++----
>>   include/linux/coresight.h                    |  3 ++-
>>   2 files changed, 15 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>> hwtracing/coresight/coresight-core.c
>> index 3f1c996d668a..9ff601e2415a 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -151,12 +151,21 @@ static inline void 
>> coresight_set_self_claim_tag(struct coresight_device *csdev)
>>       isb();
>>   }
>> -static inline void coresight_clear_self_claim_tag(struct 
>> coresight_device *csdev)
>> +void coresight_clear_self_claim_tag(struct csdev_access *csa)
>>   {
>> -    csdev_access_relaxed_write32(&csdev->access, 
>> CORESIGHT_CLAIM_SELF_HOSTED,
>> +    CS_UNLOCK(csa->base);
> 
> This looks to be hard coding MMIO based access ? Should we abstract it 
> based on the csdev_access_** ?
> 
> 
> Suzuki
> 
> 

I did something similar earlier but it ended up being huge to do it 
properly and I wasn't sure of the benefits so I deleted it. By 
'properly' I mean change all of the CS_UNLOCK() calls to be abstracted 
and delete etm4_cs_unlock() because CS_UNLOCK() would handle both. It 
ends adding in an if and indirection for every lock/unlock for devices 
that are never sysreg access anyway.

Because there's already this:

static void etm4_cs_unlock(struct etmv4_drvdata *drvdata,
			   struct csdev_access *csa)
{
	if (csa->io_mem)
		CS_UNLOCK(csa->base);

But yeah I can add the if into coresight_clear_self_claim_tag(), 
although it technically doesn't do anything now because it's never 
called by any devices that aren't MMIO. And then it makes 
etm4_cs_unlock() stand out a bit because its not a core function when it 
could be. But that's probably fine.





