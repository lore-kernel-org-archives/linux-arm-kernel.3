Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E72D2ECE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 15:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfHF8XX2sLoiWwn6mh6WL+QXvB0XHx4J/lS+4r+T224=; b=vIImkpxoXhZlGFHZehV7W1LXOP
	yAbniMtPxYkZvPzCO6TebSVEEA09Mu9SY09ZZP+TrQ4Tw6g9HHywvxP+69fJ9NCiLMWOICksneH2G
	2jdwMPnwbqpT3BpG2+mCo1x8VSCQaPeXY4gyPYEn/QocvizFalL+3PXpAan2WJfZzVQA1rNk6tx5U
	QAFENFswL2VCOALhuc++/M22LVbF1eRde066rqdtQHt7r//jba6z1di1E5PKciLo15bGTEooiQJ+8
	G6nUFIoTeXYQjDvxdgw5FVbDMrhK9A5oIFXEVkByd4Ij1TOAfTOah+410fhS3QnRdKXXi7Q9druno
	i3HZVCNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDQZ-000000043iD-2MLO;
	Tue, 20 Jan 2026 15:13:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDQX-000000043hn-0Inl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 15:13:54 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso32848145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 07:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768922031; x=1769526831; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KfHF8XX2sLoiWwn6mh6WL+QXvB0XHx4J/lS+4r+T224=;
        b=fYsoBoX9Vy233NbAGwiBOLo7RQ+8kKjwzoGjWShpjuyE5vxnpvoAnV9hux7n6HdA0e
         ylxrmWM5m/Uf9dC/akQQWo3+hLzEKhs2BUCUXGGhRnqOlsq+n7GsHkqafGu1Krih4Oqh
         /GLEW6hvY2LUW8clI+h8b+6A5yjTRayvEJGt7T1jSpzgTzzlJ3R3pmo43J1hbe6hJmmz
         jaFzFalicf3xxpoXpXVih0nklymiX69cjZaePHoFwYWZMAU/zv6c3L/ofVPHJBAKu++U
         cbv4jy7Ub2GYnVAlKLeW3bEWTl7KbEueZkrQDewta9EOgeMcRXXnV8B6dAt6nZKpmmAx
         BtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768922031; x=1769526831;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfHF8XX2sLoiWwn6mh6WL+QXvB0XHx4J/lS+4r+T224=;
        b=Xe/CTpD+qpUxZgkWwYq97yvqZ3FiH2CQ6+vQkHrNeEOQSn5Uu8gaajRsMxGo6Km/pa
         XR5aTislV53FbihnvgDMBiCfP8Zs+8hzC/q7LA7lI5DUAM17wVW86/h8PgpuX507Df2w
         3bCEF7fvU5CbKjQPMWWOqJYP/9luAvdW5dAjTepEnZe+9MQBny8A5HXutkpg0CQds+ZH
         6BN+6s6vdn7VAXI5dLWyrMNc2eM2xGDuj9jgFnsDcLYdKQZQf3IA8I3T1iAKvczcpAan
         fG4aqy0IEkdDgW7v3WO5S9vY7R0czXYLnsRSlv9AW7N2yIo+TvHAEZ4kgYizW2T6vb+i
         qRbg==
X-Forwarded-Encrypted: i=1; AJvYcCUgwbyFbbDhL/OrDTsgqc2ljT74E/z9uqg+cWEGCu3kXsHMvoX95ugpF1EMNhi2Tue5WyViZcQoInmYcOigchF4@lists.infradead.org
X-Gm-Message-State: AOJu0YzTBOvx0g+AcQIffgpU25pYzPa4Oefkp7dQbGJ1xDZEaAD3kvqY
	kmioAe9mAszvOoi1rfJPbBylHXHLvZ9hDtfn0W76a4S3qbE4jWMgcKuan75geF3vtNg=
X-Gm-Gg: AY/fxX4Ht1nHuMhrNZjWk1Q85/9FcpBk6U6v1EdOZVCLlFZF00C6jjusv2grvyYnaDK
	Q434NVipEPwr1upmnRl3VZGtYxoClY+S2hFt3xWkSD2k5344g5V6lUC6ysN44DOR5W2bnHWMdox
	qO1ecA9VSC0PXnHKZf3H4KdOjLQ4mMma7t2CxLjoL9+q8d+PhAAXfdCcWXNJ2X1DG6cxFRKvA2Z
	ug2fzifvbTyh4WoMItAlA6ywx3gPFWB8YWZHJjj0VKnXx+jknbqmQobYzsnsQPKlhSY66AcGvD1
	pZBIaxAevlQfrZ+RqRSlmrRjsT3TPmrgUeEG4qCYRjxF00KmNo0wdgbAQviv7BkihEAz94bsUvA
	ZtcxU90IV+dGjLqjSFXi5rCkZ8IHdNTVzccxQiMNxxbB1B3o/LccDixvp5pw4ZtoSa+CNVPSuoN
	2harcOGUKkHQ9gH8fRsqVPCnrkTKeJ5YM=
X-Received: by 2002:a05:600c:458d:b0:47d:264e:b435 with SMTP id 5b1f17b1804b1-4801e34209cmr173700875e9.22.1768922030743;
        Tue, 20 Jan 2026 07:13:50 -0800 (PST)
Received: from [192.168.1.221] ([94.202.56.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e9ee5c3sm113053335e9.2.2026.01.20.07.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 07:13:50 -0800 (PST)
Message-ID: <ae85df64-b6b7-43d7-ba50-9c0525481299@linaro.org>
Date: Tue, 20 Jan 2026 17:13:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/26] mm/memblock: Add MEMBLOCK_INSPECT flag
To: Mike Rapoport <rppt@kernel.org>, david@redhat.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, mhocko@suse.com,
 tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <20251119154427.1033475-19-eugen.hristev@linaro.org>
 <aVImIneFgOngYdSn@kernel.org>
 <4b8953ac-567b-4d68-9c25-72a69afdf1b3@linaro.org>
 <aVlsqdgXSBLIE9Xi@kernel.org>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <aVlsqdgXSBLIE9Xi@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_071353_137220_83B7546C 
X-CRM114-Status: GOOD (  25.17  )
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



On 1/3/26 21:23, Mike Rapoport wrote:
> On Sat, Jan 03, 2026 at 08:36:40AM +0200, Eugen Hristev wrote:
>>
>>
>> On 12/29/25 08:56, Mike Rapoport wrote:
>>> Hi Eugen,
>>>
>>> On Wed, Nov 19, 2025 at 05:44:19PM +0200, Eugen Hristev wrote:
>>>> This memblock flag indicates that a specific block is registered
>>>> into an inspection table.
>>>> The block can be marked for inspection using memblock_mark_inspect()
>>>> and cleared with memblock_clear_inspect()
>>>
>>> Can you explain why memblock should treat memory registered for inspection
>>> differently?
>>
>> It should not, at a first glance.
>>
>> The purpose of the flag is to let memblock be aware of it.
>> The flag is there to have a "memblock way" of registering the memory,
>> which inside memblock , it can translate to a meminspect way of
>> registering the memory. It's just an extra layer on top of meminspect.
>> With this, it would be avoided to call meminspect all over the places it
>> would be required, but rather use the memblock API.
> 
> memblock APIs are not available after boot on many architectures, most
> notable being x86.
> 
> But regardless, I can't say I understand why using memblock APIs for
> meminspect is better than using meminspect directly.
> I'd imagine that using meminspect register APIs would actually make it more
> consistent and it would be easier to identify what memory is registered
> with meminspect.
> 
> In the end, memblock_alloc*() returns dynamically allocated memory, just
> like kmalloc(), the difference is that memblock is active very early at
> boot and disappears after core MM initialization.

Hi Mike,

Thanks for sharing your opinion.

David, what do you think, does it make sense to have this flag or we can
ditch it and use meminspect directly ?

Also, for some memory blocks, they do not disappear ever, e.g. the
printk log buffer, it's allocated early and never freed, so it's
required to have some memblocks marked for inspection.

Eugen

> 
>> And further, inside memblock, it would be a single point where
>> meminspect can be disabled (while preserving a no-op memblock flag), or
>> easily changed to another API if needed.
>> Ofcourse, one can call here directly the meminspect API if this is desired.
>> Do you think it would be better to have it this way ?
>>
>> Thanks for looking into it,
>> Eugen
> 


