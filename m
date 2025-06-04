Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FFBC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 13:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42EU1sJyYdG5F1cgKizvK41dUy6Q1Og1sjraWSNVWMs=; b=fA0e/kHjAxsBT5ScLW0LF2kYXN
	VBylIMZAUO4gAOqvuk5APWAx/nJ3jeOgoBuabtPhp11yEXzK47lGkYl1tJSYzRPFPsyUmXy767mZh
	1LuOcQ4BVB1/v04Ybb2Me/7fSi17sWni6ja/GFMbQ1dN5HWLCZUmGH6EG1MozBCtbH1oyOfONRpxp
	0h+FBS+wquA5h3u/3RwObVlmbJqB2j5PxIOZh8fHeChcPRWuWYvR7ELd3FPjDeLU3RSVWZX7AJcnZ
	rF29mp74g7ob1NQcBYI8BDr7JG8WE4sSC6NaDaTZCYMjZ85oxgo2nyGqklrJzWvCBWLnFLvTvTbrX
	RF7IH9pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMo6C-0000000DRBD-2ZBo;
	Wed, 04 Jun 2025 13:24:08 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMo44-0000000DQwk-2yyc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 13:21:58 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-2cc57330163so4300295fac.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 06:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749043315; x=1749648115; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42EU1sJyYdG5F1cgKizvK41dUy6Q1Og1sjraWSNVWMs=;
        b=1JxLbpZNa31SZMANvx8iIV1SwpkUfA35lPK+ljwfUmE0wH+SVkGQUJtcjRlSGZop1o
         y4nZl99vXdDksODj+spmgJsbNuuwdOtiwviXeWmXER/uFf5JiXGk+hnivk9j89Y2hdk/
         b2RdRzWUtEzVEJ3kasz/xVMu5BC4+KVaHM35MySBxC99KLKi2jCuXBi4E3GZ8RLH6Y+1
         dmMVRS6ehPH+LjQb3h8d3bHPl6fYUqlQBhpDki/lSBUE3qdLk3IEszc/5EwfJcoCyitq
         MzazWnxrzs+cRyrh77ahlMJZceRjFELQW0Hss8cMcTBA8DunoMN4o7FFL0zQmk5aZNAe
         MokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749043315; x=1749648115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=42EU1sJyYdG5F1cgKizvK41dUy6Q1Og1sjraWSNVWMs=;
        b=UMHNwBxSGp8AyJyMWCBywzTXbjZMkMcv9LHatISIwrIOS/hxnHxK1hIEq1vuQpQGrV
         bmyov7vrc2oTLQanAVC36Y2brIO9k+3vt0D2y9k9pFEoaHV+pfvqCC9Sxmf5+O/JIrJ7
         fNA0j+MDC1vlyRHrj66U4gPoUH341+3yrski3UhXXPI8KOUm2u7uNY8GKeKkBw9gd7ey
         y8Xcl6bpGJVRnrqNjcIqZLcYqvRzOKfXLs6QG2jhJZG/JMOQDXOKZMWw34//LgJCbwm0
         MCxnKDocP/95MJcTUYmGcG+7c1NtzoRI6HpzKVGQyfi51G/FY36zq9MaGLGORpqSQSOd
         bRrQ==
X-Gm-Message-State: AOJu0YzA93mob6hzyzIKnTkHdvXcn7DdRLUHr1nnrgjYsY8Pe3/CB3fX
	SqP8slWOLIle11K3YXM3hrm2BtBeuxaYRaTUq9ecf0Ln5/9PEVAbmhD34RnzZ9ABomc=
X-Gm-Gg: ASbGncvK8DRTEkqFtvjN3M3dbGfpYAx7ssNXiQimvOf5Wc4zyyRRSKOwTeFfa3qjdGX
	JQgVm/GvWXUVtnNPs5XI9IdP3Yg+xQwsZ3auoisW8xJEnG3PP/8sY7q1yniXt+/XQZUkK1Oe62q
	qA5sIKP2QC5y8QLvl5BsyRfXXdPdOZJ6hxBqMF/aAPe00RBiXVVFNEf2kJmw3O9HtYSEbywSpFG
	MmplU6KDyBQS3hpm+2PZMmuIg6/KKkgMDyAaM5qGL2GrEkloBN9p5eK8I0qWmjuhykzxm9oU1E8
	ZQcBrcxEpb1PEsoT4cm0GByjtHwpz6ufWoV3IahZE0NSU/SGJFBrpWzFDSm4DVTyOf/nFgyL8Iy
	qsbORP45t9LjccVGjvEBQwlmpBaJpAiNstPiYDj8=
X-Google-Smtp-Source: AGHT+IEeJlq8acVoI6eGj1GQFdyqUT4Gx77dcBUJqg3CfYkU0wTl237zJBQxk+ufigaGhCyRnVkMlA==
X-Received: by 2002:a05:6871:42c4:b0:2d4:d9d6:c8bf with SMTP id 586e51a60fabf-2e9bfc6c923mr1651646fac.32.1749043315015;
        Wed, 04 Jun 2025 06:21:55 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:56f4:67ce:c6e3:8f76? ([2600:8803:e7e4:1d00:56f4:67ce:c6e3:8f76])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e906816c51sm2622910fac.28.2025.06.04.06.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 06:21:53 -0700 (PDT)
Message-ID: <3ff77f5c-b13b-49f5-98b0-a799453768d0@baylibre.com>
Date: Wed, 4 Jun 2025 08:21:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] counter: microchip-tcb-capture: Add DMA support for
 TC_RAB register reads
To: Dharma.B@microchip.com, kamel.bouhara@bootlin.com, wbg@kernel.org,
 Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250528-mchp-tcb-dma-v1-0-083a41fb7b51@microchip.com>
 <20250528-mchp-tcb-dma-v1-2-083a41fb7b51@microchip.com>
 <b45ea46b-3e17-4cb9-8e69-9eea0a3f8241@baylibre.com>
 <27407669-a580-482c-8c60-226b56562ce6@microchip.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <27407669-a580-482c-8c60-226b56562ce6@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_062156_830278_CC263B97 
X-CRM114-Status: GOOD (  28.01  )
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

On 6/4/25 1:15 AM, Dharma.B@microchip.com wrote:
> On 29/05/25 9:03 pm, David Lechner wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 5/28/25 1:13 AM, Dharma Balasubiramani wrote:
>>> Add optional DMA-based data transfer support to read the TC_RAB register,
>>> which provides the next unread captured value from either RA or RB. This
>>> improves performance and offloads CPU when mchp,use-dma-cap is enabled in
>>> the device tree.
>>
>> It looks like this is using DMA to read a single register in the implementation
>> of a sysfs read. Do you have measurements to show the performance difference?
>> I find it hard to believe that this would actually make a significant difference
>> compared to the overhead of the read syscall to read the sysfs attribute.
>>
> Hi David,
> 
> Thanks for the feedback.
> 
> You're right — in our current testing setup, I didn't observe any 
> significant performance benefit from using DMA to read the TC_RAB 
> register via sysfs. I benchmarked both DMA-based and direct MMIO 
> register access using a userspace program generating high-frequency 
> capture events, and the overhead of the sysfs read path seems to 
> dominate in both cases.
> 
> Our initial motivation for using DMA was that the TCB IP in Microchip 
> SoCs includes optional DMA support specifically for capture value 
> transfers. I wanted to evaluate the potential benefit of offloading CPU 
> load when frequent capture events are occurring. However, in practice, 
> the complexity added (especially due to blocking behavior in atomic 
> contexts like watch) does not appear to be justified, at least via sysfs 
> or simple polling.
> 
> I also tried routing the DMA-based read through the 
> COUNTER_COMPONENT_EXTENSION watch path, but as you may expect, that 
> ended up hanging due to blocking behavior in non-sleepable contexts. So 
> that route seems unsuitable without a more complex asynchronous 
> buffering model.
> 
> Would you suggest exploring a different approach or a more appropriate 
> interface for DMA-based capture (e.g., via a dedicated ioctl or char 
> device with async support)? I’m happy to rework it if there's a suitable 
> context where DMA adds measurable value.
> 
> Thanks again for your review and time.
> 

Adding a feature just to make use of something a chip can do doesn't
seem like the wisest approach. Without know how people will actually
want to use it, we would only be guessing during the design of the
userspace interface. It would be better to wait until there is an
actual real-world use case and design something around that need.


