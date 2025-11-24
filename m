Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74633CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 16:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9kUwL5iJCQukHjA2c6jwYym9BNWDh7Ih2TgBHqMmyUg=; b=vh9lu86bq3cSfil+G50keYq2zQ
	amrHKJ9r+RlXzvrqvUakPmduu7JBNydKpGIOnivXH/etZegayMt64k8kP4wx5wiW7c380APXa1YjA
	l3y47fCb9ZmRQfYqXfcgs5a2EDaSWVKBEdYXw9aqISQxFF6AI+QTxM2i72xT0gRV62eorN0mPKtSF
	Gi4zWH39zHDkzY8hEe7Q31F5kLM0XLtJAbx4OSxubEePNdHS3iylZ6T7BfaoAr5Swhi9kX0prpaj+
	GxEHi4yNIZX1DD7iba66bCF0dmBtGY93lpI1dByjughoiKDgAW2PykGEs4gQOrE/XBDLK8gZCQwbN
	3htmBtCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZBA-0000000ByaP-4BhM;
	Mon, 24 Nov 2025 16:12:41 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZB7-0000000ByZI-3qIq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 16:12:39 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso29890315e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 08:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764000756; x=1764605556; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9kUwL5iJCQukHjA2c6jwYym9BNWDh7Ih2TgBHqMmyUg=;
        b=h1lXKNvLyTvRDunT/hZncKQOZZa4x8ctKigku6HcDGr2t592gTnfN/P7cHmiV9ZTA2
         dXQhysH9u3PMJDLk2Lco2mHmnJ1b8Ofe5w+hooNNZql0Y4kqE4aLcoewDQwKWyIJSuBp
         juNTHez9hTk/+gjhS/sEBOJLJq+G6DK0k4U21PtbSB0nIbj4vc5dGWF/X2bWeIKQIIIf
         t2LzLxSNarU2uFAVCJnMBzMRiOmw7jC2wwSaGWhFqTgyHC+p2xuzgzQdM011Wd5fMV6h
         NpKtV0w5AuOgSrxyxP0UtYGDZ2Sykyswjrqrn2eyDpgcW/aOu2520Nap9+O16m9hTyTL
         mNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764000756; x=1764605556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kUwL5iJCQukHjA2c6jwYym9BNWDh7Ih2TgBHqMmyUg=;
        b=uMY+tdfkNFzyQkHwXG8XqQJpWigmjfOREWxnnx3CsK/dicTWGXyL0Nm34fXxalnWRi
         n7dpMeQyYNb6I6pS5zEl5GcSdzP0hauzpePgQJUl7+XKT88h8p6g4CFEDTr7FSRF5Vk7
         uLvYK89UFe+Pkep5KuXpnd0hIkr8f0+XFw8RqfpmhNrZAAlx9td36XC9xYBLMHQfcFJ5
         sLVp4lxnP04j/hDz1YrDF3dtFkRfDmULzNZQeSl0M9BVIsNDygZPY0V/nmsb4ef/8Jxq
         0kYbgpCgbuwLu9PqjcVkwigwv1+bmy+jRScU8f2/rzqO1n1NbnqL/RP8UykhXmvE5KGE
         1ZzA==
X-Forwarded-Encrypted: i=1; AJvYcCXF5FiAplYTBjuREJfbOd4A/pu9laczuOT1GIuvMw6SUu3K1ksVf/2xOs1j/UeFLYE9S7kTQCITQY7jccZS84K6@lists.infradead.org
X-Gm-Message-State: AOJu0YyllktqtLssbAtZE+bS3eyg4jdUFXYVDqrtEFKAWvjoIfWmRkOZ
	Gne++m2b3zrtKOgZa8fCCvbhF/1tv+eGfNawK1psESLR2dQuJzHivU02xqNXFv/NvWI=
X-Gm-Gg: ASbGnctOJeDU2AsLTF/QMtz6c2a/SHLkV/GjACGt8PVjR8bIaFYa3U7wCVrpEFGD3U3
	jyerI4krkkfxAVXuFTdNT4TeQZFKe3FMl2bob0pI1p7T6+XnjvpWgc1OGIgQvfnx3WHLNsSinTk
	cCiN3jlaG9qcJhTMIhT4grepMchMb5kOD2+oqyZeR4t/FVeCdrs39ssexDqSuc9NVa93bMbHxJ1
	KpHRAGYVHhQS26rzl+BBu2MJUrH4KcZDRrNt8qUho/KGE+/k9KJ7CKJQJQrpRaCwOCnT0tfo3uv
	qMeOQVez5rKr/0CRr8AXhDeaMZn4sEBFNnFJkaGLJqDY09HQqa16KJcCtAvPEAwQvsNt+zPsBUx
	xVP8kcQu8AsQip/gQu5YUjQOOWjgEDsx5Pfe8JPr2odAh0piRwx7gu9VdPg6ciRe+GYEgusLsNc
	WYs+wR9UnHgaNDh0BD
X-Google-Smtp-Source: AGHT+IFy72lQUXBFhPuwWRndjDr59yWxK1zJh9Nt3ZYz3copTeRMO5SUVt2oB9vIYaFjGLRGWbz7rA==
X-Received: by 2002:a05:600c:1d0e:b0:477:89d5:fdb2 with SMTP id 5b1f17b1804b1-477c017d9damr124191795e9.14.1764000755679;
        Mon, 24 Nov 2025 08:12:35 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf1df392sm205509945e9.1.2025.11.24.08.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 08:12:35 -0800 (PST)
Message-ID: <05babb6d-a588-49f8-a34a-c82d5f58adf5@linaro.org>
Date: Mon, 24 Nov 2025 16:12:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: etm3x: Fix buffer overwrite in cntr_val_show()
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org,
 alexander.shishkin@linux.intel.com, pratikp@codeaurora.org,
 mathieu.poirier@linaro.org, gregkh@linuxfoundation.org,
 jserv@ccns.ncku.edu.tw, marscheng@google.com, ericchancf@google.com,
 milesjiang@google.com, nickpan@google.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251121002350.1166758-1-visitorckw@gmail.com>
 <172ca2d9-4a6f-4498-bdfd-8aa7428581ce@linaro.org>
 <aSCbJR9aT1vOpz0a@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aSCbJR9aT1vOpz0a@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_081238_004719_4745A30B 
X-CRM114-Status: GOOD (  39.33  )
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



On 21/11/2025 5:02 pm, Kuan-Wei Chiu wrote:
> Hi James,
> 
> On Fri, Nov 21, 2025 at 09:50:03AM +0000, James Clark wrote:
>>
>>
>> On 21/11/2025 12:23 am, Kuan-Wei Chiu wrote:
>>> The cntr_val_show() function is meant to display the values of all
>>> available counters. However, the sprintf() call inside the loop was
>>> always writing to the beginning of the buffer, causing the output of
>>> previous iterations to be overwritten. As a result, only the value of
>>> the last counter was actually returned to the user.
>>>
>>> Fix this by using the return value of sprintf() to calculate the
>>> correct offset into the buffer for the next write, ensuring that all
>>> counter values are appended sequentially.
>>>
>>> Fixes: a939fc5a71ad ("coresight-etm: add CoreSight ETM/PTM driver")
>>> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
>>> ---
>>> Build tested only. I do not have the hardware to run the etm3x driver,
>>> so I would be grateful if someone could verify this on actual hardware.
>>>
>>> I noticed this issue while browsing the coresight code after attending
>>> a technical talk on the subject. This code dates back to the initial
>>> driver submission over 10 years ago, so I was surprised it hadn't been
>>> caught earlier. Although I cannot perform runtime testing, the logic
>>> error seems obvious to me, so I still decided to submit this patch.
>>
>> Nice find. I think the point that it wasn't caught changes how we fix it.
>> Either nobody used it ever - so we can just delete it. Or someone was using
>> it and they expect it to always return a single entry with the value of the
>> last counter and this is a potentially breaking change. So maybe instead of
>> fixing this we should add a new cntr_vals_show() which works correctly. But
>> then again if nobody is using it we shouldn't do that either.
> 
> Thanks for your feedback.
> 
> I agree that if any tool relies on the current behavior, this patch
> would break the ABI and violate the hard rule that we must never break
> userspace.
> 
> However, I am not sure how to determine if any userspace tools are
> actually using this sysfs interface. Is there a recommended way to
> verify this, or a standard procedure/convention to follow in this
> situation?
> 
> Regards,
> Kuan-Wei
> 

There's no way of knowing apart from deducing that there are 0 users of 
the 'correct' version of the API because it never existed. This isn't 
even a regression, it was broken from the beginning.

I suppose it does work when hardware only has one counter, but I don't 
know how likely that is?

Looking at cntr_val_store() I think I was wrong before when I said it 
should be a separate file for each counter. Writing to it already writes 
to the counter currently selected by cntr_idx and splitting it out to 
separate files would have to break that too. So we can fix the display 
bug by making show operate on the currently selected counter in the same 
way as store. Then it makes a bit more sense and we can delete the 
"counter %d: " prefix.

ETM4 already does it this way too.

>>
>> The interface isn't even that great, it should be a separate file per
>> counter. You don't want to be parsing strings and colons to try to read a
>> single value, especially in C. Separate files allows you to read it directly
>> without any hassle.
>>
>>>
>>>    drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
>>> index 762109307b86..312033e74b7a 100644
>>> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
>>> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
>>> @@ -725,7 +725,7 @@ static ssize_t cntr_val_show(struct device *dev,
>>>    	if (!coresight_get_mode(drvdata->csdev)) {
>>>    		spin_lock(&drvdata->spinlock);
>>>    		for (i = 0; i < drvdata->nr_cntr; i++)
>>> -			ret += sprintf(buf, "counter %d: %x\n",
>>> +			ret += sprintf(buf + ret, "counter %d: %x\n",
>>>    				       i, config->cntr_val[i]);
>>>    		spin_unlock(&drvdata->spinlock);
>>>    		return ret;
>>> @@ -733,7 +733,7 @@ static ssize_t cntr_val_show(struct device *dev,
>>>    	for (i = 0; i < drvdata->nr_cntr; i++) {
>>>    		val = etm_readl(drvdata, ETMCNTVRn(i));
>>> -		ret += sprintf(buf, "counter %d: %x\n", i, val);
>>> +		ret += sprintf(buf + ret, "counter %d: %x\n", i, val);
>>>    	}
>>>    	return ret;
>>


