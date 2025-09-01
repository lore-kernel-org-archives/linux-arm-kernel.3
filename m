Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D55CA1006
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 14:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnfmWiYHUC8i19glkM7oL/LSJL9iA4N5hQ/wPd1r+F0=; b=PpSj+r0G02txxO391NLO/Fc2R2
	AZ/+V1ezWfD3qxq7kLIJ8t+LqLzbpwktULaNhp1oJrJcNuznc7ANmjH0IOFPekGMZ9SydLk9OUnq4
	8s+NmKasNgBVsYhHJCDOL4vFRXbA8C6f1YgAW5J1XJU4GSL8FbKT5c4biZe0JzT4OKJxMmGZboWzk
	lMglGGfetb08EmZHe+CaZY4pqatQtO5BO4IJJ7OLojmQRK/m9AAoOosFf7D7dUKgNBGH42DmU3tnj
	YZ6RrZCxavYV7wxtZg1YrTt4C3Weyi79T4xbrZnmWHIGr5y+zFhWMxO6TM+D6+0dVBUowkVSjhZ45
	5Aa67+qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5oc-0000000Csry-2Ece;
	Mon, 01 Sep 2025 14:47:26 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3FL-0000000C9Kk-1a8o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:02:52 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45b83ae1734so15115945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756728170; x=1757332970; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RnfmWiYHUC8i19glkM7oL/LSJL9iA4N5hQ/wPd1r+F0=;
        b=qssf/NAOkMRAFJDg3LRuvsGjiVsQP1pdUPe4GaiLW3PSZZ4vNKkqFOC8fFtdrL83pN
         xQnfEhbYdLShFddgYqEdEnJ6DdsKHP/HJQAatgbALIv6M2a/UYbA05DjexN94bTDsi41
         t4hy3ZiqUFzzw3zMBmy8u39Pu6ivVBonYAvRE+Ur6BIbs3lWPCa/Vkq3J3TDyQij4uGo
         ICRGLg9eJqfYRKZuXp7SYSsAu7fdTxPyO3XAxYHiaoFgbHyl/EPEd8QD8txA3w2Et5Gv
         0iUiJh/BXw9d1DyidiVZeybJ6Xu6gZyTyRelfp68/PN3fzwQmuh6p0f8WviucGBVk8o8
         tzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756728170; x=1757332970;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RnfmWiYHUC8i19glkM7oL/LSJL9iA4N5hQ/wPd1r+F0=;
        b=n4PhzH+hujKlskuKKf8+QDCBouoGDKXwQPZrzQ5SLdH1WFaDoxPWOXFoFr3xTEw0UD
         k9klHBS7LY2+O59YgPcF/0PegIwuY6l8rv26SG8MYBPxau4m0TQN9RfuWV7Ul15nzYb7
         Z8wgd8vF2BpBoLoVzK+5r0gQpa7YOxH7Iodhao6ZGhu87VH3udPhxt+ds5hIhSD7tu2Y
         nrH4kq8sYZcSYa8PGFCSSJFpz0aV3mUo3eAbkMOOZS3e64LfYbD7jfsee1n4RdCqgH9z
         nbbJ9wdOPrziVn1bN0e24aAMkmxJ5Bc7XM9HoY4m6sizym5zmf7Twy6K2T9dNGWL6VxZ
         7bcA==
X-Forwarded-Encrypted: i=1; AJvYcCVk1fYl2jcYbHfQLoOKJsqvgnnzgPglDcPq59TcAnwq5n4kDRosGuBSUP3tp1mWU1pCXoukOPUnWb0Tu6vSrgii@lists.infradead.org
X-Gm-Message-State: AOJu0YxWI/hPN7PYDn0LHOQL1LDrZBFT6/KrLMzYgPnwvGx/naW+3bR1
	dFQsVIaiLK/yneG2tb728Al8dP5t1uTqc8YlmynJtPSXXurmSWg3xJHQ+DvOdX3p8rY=
X-Gm-Gg: ASbGncsZyE5rew3fj1Ag1YT4AhoZtv+F/pd8B0Ikla1R+XxnbqhK1GidK7eF8nWaW5m
	uB38yQvWsd7cAvCiq9zlifkN7aUJD00USmHxM7VualYX9HRJtK7R661uhA0uaQD2U2/+CKAGNjG
	yYEGEIGAdFAIhsP2Jp/Wh7zNNyRf7ZqxTss2ZE6SXre/VDOeClWQhui808WYlnikfqnBiyDxl/6
	Y5ZqkcnGoTtgIh+tXKZtp6gjhnpfTlfqYWKHWh/UOwYI4DY/b8I45j9SqjSg+5LolquxnjQp78p
	D7fFWPtcHCp9uOy2czlZs4ngs2KUWvFr8TeIQHf2LSYszFe1Z+v3DfF1adzcb4evNDqJ+JM+bj6
	CoxTR88JE1mCGI9x15Nu6k7IhZxWeiSfyDLwvGtKjPHUmsivRaVH2F+zV4V9lBsxKeyG9b8gstC
	zdaZM=
X-Google-Smtp-Source: AGHT+IGtFYqe1NkisHt6TuhFoDyL75/fnRaNQlYXgCsJGFwGxCneAkzy9wIFe6z6w5vZIfrX/R2fCA==
X-Received: by 2002:a5d:5f90:0:b0:3d9:2fa8:1009 with SMTP id ffacd0b85a97d-3d92fa81454mr79263f8f.45.1756728169537;
        Mon, 01 Sep 2025 05:02:49 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:335e:2208:72de:40f7:b7be:9bb7? ([2a0d:3344:335e:2208:72de:40f7:b7be:9bb7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e88785bsm154333855e9.14.2025.09.01.05.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 05:02:48 -0700 (PDT)
Message-ID: <94f537ae-c2b1-4928-a3f3-6449c30cb624@linaro.org>
Date: Mon, 1 Sep 2025 15:02:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v2 22/29] mm/numa: Register information into Kmemdump
To: David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, tglx@linutronix.de,
 andersson@kernel.org, pmladek@suse.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 corbet@lwn.net, mojha@qti.qualcomm.com, rostedt@goodmis.org,
 jonechou@google.com, tudor.ambarus@linaro.org,
 Christoph Hellwig <hch@infradead.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
 <e66f29c2-9f9f-4b04-b029-23383ed4aed4@linaro.org>
 <751514db-9e03-4cf3-bd3e-124b201bdb94@redhat.com>
 <aJCRgXYIjbJ01RsK@tiehlicka>
 <e2c031e8-43bd-41e5-9074-c8b1f89e04e6@linaro.org>
 <23e7ec80-622e-4d33-a766-312c1213e56b@redhat.com>
 <f43a61b4-d302-4009-96ff-88eea6651e16@linaro.org>
 <77d17dbf-1609-41b1-9244-488d2ce75b33@redhat.com>
 <ecd33fa3-8362-48f0-b3c2-d1a11d8b02e3@linaro.org>
 <9f13df6f-3b76-4d02-aa74-40b913f37a8a@redhat.com>
 <64a93c4a-5619-4208-9e9f-83848206d42b@linaro.org>
 <f1f290fc-b2f0-483b-96d5-5995362e5a8b@redhat.com>
 <01c67173-818c-48cf-8515-060751074c37@linaro.org>
 <aab5e2af-04d6-485f-bf81-557583f2ae4b@redhat.com>
 <1b52419c-101b-487e-a961-97bd405c5c33@linaro.org>
 <99d2cc96-03ea-4026-883e-1ee083a96c39@redhat.com>
 <98afe1bd-99d2-4b5d-866a-e9541390fab4@linaro.org>
 <c59f2528-31b0-4b9d-8d20-f204a0600ff6@redhat.com>
 <40e802eb-3764-47af-8b4f-9f7c8b5b60c1@linaro.org>
 <7e1f4f64-dfc4-4366-8e01-0891b2d4d2b4@redhat.com>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <7e1f4f64-dfc4-4366-8e01-0891b2d4d2b4@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_050251_444974_2F1E9C23 
X-CRM114-Status: GOOD (  19.76  )
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



On 9/1/25 13:01, David Hildenbrand wrote:
>>>> What do you think ?
>>>
>>> Looks a bit over-engineered, and will require us to import a header
>>> (likely kmemdump.h) in these files, which I don't really enjoy.
>>>
>>> I would start simple, without any such macro-magic. It's a very simple
>>> function after all, and likely you won't end up having many of these?
>>>
>>
>> Thanks David, I will do it as you suggested and see what comes out of it.
>>
>> I have one side question you might know much better to answer:
>> As we have a start and a size for each region, this start is a virtual
>> address. The firmware/coprocessor that reads the memory and dumps it,
>> requires physical addresses.
> 
> Right. I was asking myself the same question while reviewing: should we 
> directly export physical ranges here instead of virtual ones. I guess 
> virtual ones is ok.

In patch 22/29, some areas are registered using
memblock_phys_alloc_try_nid() which allocates physical.
In this case , phys_to_virt() didn't work for me, it was returning a
wrong address. I used __va() and this worked. So there is a difference
between them.

> 
> What do you suggest to use to retrieve that
>> address ? virt_to_phys might be problematic, __pa or __pa_symbol? or
>> better lm_alias ?
> 
> All areas should either come from memblock or be global variables, right?

I would like to be able to register from anywhere. For example someone
debugging their driver, to just register kmalloc'ed struct.
Other use case is to register dma coherent CMA areas.

> 
> IIRC, virt_to_phys() should work for these. Did you run into any 
> problems with them or why do you think virt_to_phys could be problematic?
> 

I am pondering about whether it would work in all cases, considering
it's source code comments that it shall not be used because it does not
work for any address.

Someone also reported its unavailability like this:
drivers/debug/kmemdump_coreimage.c:67:24: error: call to undeclared
function 'virt_to_phys'; ISO C99 and later do not support implicit
function declarations [-Wimplicit-function-declaration]

I am yet to figure out which config fails.


