Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF023D0EE29
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 06:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XeK0u2TVOvN4f/SN0xTGzbjonpqj44JziKIfWQXgIwk=; b=zsufNoMvv5adBAm6GwqS1F2Fw+
	1hAYOMh83FjJwMMli+uabe/4M40SwUeWMo3YDByO99yqbBK4+FR977jYRnpLHBfv/PLRE8qSbQFCn
	0n+BGc+isUNdeZ05pvd46+k4mHc2vDJCuJBXBHOpfkLHHsraQOKQzLy6utWTe5lCuWzQS/AC9t76d
	TWwkKqqJ0hxDMkF0GH0bXbNOKTCsw7TdbHImw8vjKh/kWI5MV/A6jMKc4HlPY/j7cORl8F32/Hsss
	MBvMZRLNDR/E4/pJCPd9yI/ALcgbImwC17P7c3bX2otPHbJGr1RUE+CL96pgdfS5JqmoPfy/WnW99
	7bCH02+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO9BA-0000000ERrR-2I9V;
	Wed, 26 Nov 2025 06:39:04 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO9B7-0000000ERpu-0F1u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 06:39:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-477632d9326so37872835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 22:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764139139; x=1764743939; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XeK0u2TVOvN4f/SN0xTGzbjonpqj44JziKIfWQXgIwk=;
        b=bBSvoXMDJnOeNn1AJpyc97c1H+oPAReWZECIBE08f3Odng9103vAm8d3cDcSNlbX8u
         SWpg0WvJDOdBrrqWEU1fYmzZWdqDiKRZxFqou48ZC5dIBIP85OP0qk7xcoJTzA5B/Srl
         YvrVfaFj2q+K2VwiPykLDQSxthCQ8GSTvoItROs5t9Nz/aW8CxxW1p8/43F2WeTq7NtX
         XooxJruOX5hg+n/M1a/w/lUxZbj1kMgtZRGi/0GhDZTD7/cFnWWsRbMMStEsOof2EUqu
         UjAxUTagojGUaZUpGDd0CqYtVBVYK0pChTbueofCWDfy/EWFb438k52TWNM8LCHrxNUJ
         VIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764139139; x=1764743939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XeK0u2TVOvN4f/SN0xTGzbjonpqj44JziKIfWQXgIwk=;
        b=TrQwkcAbg7Wut3dG87Tk2GeN+/HPV4cengNY7+aOBf1ajjGOklarAxxOgvbtdUl9AN
         ZqMT0rbgJNX6hEx341OwMz/iDWn8HX8UnQyryFGLP0Zk1ogAlRkPX9iOfsiFtVliKDxA
         vv5M07AdwBnlZNJ35fLh9rKVYMz8ymbr4KqyyRAlcEBd2AWLQM95k0+El6pRu0nVNnNV
         9nhlPgi5e1QtRG+usLOCo+6Ded3UjyfgP+EH7JbPzlN7h1nSkrXGrEeT1VJPxGmrqJ9S
         OQlE2xIOFAOTn5dtYs/81gkR1jkzfoHbSSmojdOpyah75kESpya0OvC0s5SZ/lJL9cUr
         Njsg==
X-Forwarded-Encrypted: i=1; AJvYcCX8x0IRmW396MBdFtRjD9KWAH8JSKPTCcZzvE9X+CEpypPY/IoBh++Xxo966qW0+abAJUrEPPHQDawpbqYL/E2v@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4o04v6IbVd1DFoXtvHqOhDaSM6mLpGgCsqYQXma/Kanle+MrP
	jVnMveHLgZQ/wbZaaGfhhpuA80sAlHHBUw+9QNh8sIk8SdaCMz9rhqiFV2H6ft3OFN8=
X-Gm-Gg: ASbGnctd9zIt0HiJsMDp8/yaxVYp7Vme5M1Occ4dIU1DYyw7i0Ztmhzk4qvfH4XmSps
	BzNa5TRoJIyRqetcMKbT/AJx+1LouvCxOe/zcgn6uk/S65zh/r/xnBTOHmQZ8OujVsqzmGK4Dh3
	EmmWeZ7IXTLvqNKdFzZY18zjedq3reQEY5W5c6XjkkB+FZJ1Za5GyExW2K9Al/e4IpXqf4g94FB
	A/Bwi4Y3/dRiwZDWhX0JHcAELrym1DWPq1y/UgEYZAikYmmb0jdIY5hz29HqvNx3FXLSb3n4eTV
	7B4148XyaFIg3BLAwzO/sXZ1m+z3hbwIHx+Vpvs+PuPAUfPBS3oLvRDUvJds0zTAR033G1zvs7c
	aSi8u1v71GPVk1Yi/eW/A2ZQpK3EMHz74SPPaRj9OjGn1ScRZy7dNSkw/ksfMWkd52iKueqNB2D
	Z66nwx4T+G4ueVTVlG/Vqb+8h3Bt7striCsgunE/9V4/mNfV0jXgv4Qg7P
X-Google-Smtp-Source: AGHT+IE1KjxiGrCtY3epm9hXR1ydSh+Ibj1PiTQ0E3rejshywrVXqvECFX43oDn0HerzmZQcrLtvoQ==
X-Received: by 2002:a05:600c:524d:b0:477:c71:1fc1 with SMTP id 5b1f17b1804b1-477c01d44b4mr169143895e9.19.1764139138720;
        Tue, 25 Nov 2025 22:38:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790addddf6sm25591685e9.8.2025.11.25.22.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 22:38:58 -0800 (PST)
Message-ID: <4b22e7c4-4d3d-43b9-bc27-ffd7a86ad26a@rivosinc.com>
Date: Wed, 26 Nov 2025 07:38:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] riscv: add support for SBI Supervisor Software
 Events
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, hchauhan@ventanamicro.com,
 apatel@ventanamicro.com, luxu.kernel@bytedance.com, atishp@atishpatra.org,
 bjorn@rivosinc.com, cuiyunhui@bytedance.com,
 =?UTF-8?B?5byg5bGV6bmP?= <zhangzhanpeng.jasper@bytedance.com>
References: <20251105082639.342973-1-cleger@rivosinc.com>
 <176355541775.758643.18140349571928540394.git-patchwork-notify@kernel.org>
 <350edd01-56ce-6558-1473-4b9231647e1e@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <350edd01-56ce-6558-1473-4b9231647e1e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_223901_254492_E602FA58 
X-CRM114-Status: GOOD (  18.57  )
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



On 11/19/25 16:52, Paul Walmsley wrote:
> 
> To add more context:
> 
> On Wed, 19 Nov 2025, patchwork-bot+linux-riscv@kernel.org wrote:
> 
>> This series was applied to riscv/linux.git (for-next)
>> by Paul Walmsley <pjw@kernel.org>:
>>
>> On Wed,  5 Nov 2025 08:26:32 +0000 you wrote:
>>> The SBI Supervisor Software Events (SSE) extensions provides a mechanism
>>> to inject software events from an SBI implementation to supervisor
>>> software such that it preempts all other supervisor level traps and
>>> interrupts. This extension is introduced by the SBI v3.0 specification[1].
>>>
>>> Various events are defined and can be send asynchronously to supervisor
>>> software (RAS, PMU, DEBUG, Asynchronous page fault) from SBI as well
>>> as platform specific events. Events can be either local (per-hart) or
>>> global. Events can be nested on top of each other based on priority and
>>> can interrupt the kernel at any time.
>>>
>>> [...]
>>
>> Here is the summary with links:
>>   - [v8,1/5] riscv: add SBI SSE extension definitions
>>     https://git.kernel.org/riscv/c/7bba38249b8a
>>   - [v8,2/5] riscv: add support for SBI Supervisor Software Events extension
>>     https://git.kernel.org/riscv/c/b52179e6de7d
>>   - [v8,3/5] drivers: firmware: add riscv SSE support
>>     https://git.kernel.org/riscv/c/5ffe60d26107
>>   - [v8,4/5] perf: RISC-V: add support for SSE event
>>     https://git.kernel.org/riscv/c/c6f3f04d2a9c
>>   - [v8,5/5] selftests/riscv: add SSE test module
>>     https://git.kernel.org/riscv/c/a123316660af
> 
> This is a pretty sophisticated series.  I was hoping to get more test 
> reports on it and reviews (as Clément requested as well). In the meantime 
> I've pulled them into for-next in the hopes that it might increase the 
> number of potential testers.  Am still very much interested in any test 
> reports or additional reviews; if they come in this week, I'll consider 
> rebuilding for-next to add them.

Hey Paul,

Since we gathered additional bug/starvation reports with SSE from
Zhanpeng, it would be preferable to remove this series from your branch
if still possible. I'm not currently really available (just had a
newborn) so I won't be able to fix this quickly.

Thanks,

Clément


> 
> 
> - Paul


