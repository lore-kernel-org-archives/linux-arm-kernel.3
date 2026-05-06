Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1B4CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 02:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Date:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrGezS/XNq9+psZQ70L22Z8q+JOJb1NZlusetExcJPM=; b=cpmLkvY0K1wzfNQZSaC3dHinzD
	uJ4rP50+5WaPHa4/KOFEIT9SN2LD2vDK69DQiBiinVQYZzZvIwbBAv359VHJcGO04CvKjnICnXzmr
	ria98xnZfx52rxDKuzO9RIpLZ6C63ltUvQbBKIw45kEa5q92CZkycI/4qx4iyeWnDscRDIVtjLhTa
	yUAY52q1s0YGx9zrR/wCXsqSR7j25NNTI6oS7u4ViHPifgAo63ppEwUMTopd6kL6HO40g2A2x5Iuc
	PCe2vpmZaFvD6+wjHaYyMXnb9YZX+AdC4trqTie2DAMlM3z/9xQ3RznxtP8YOdStF+ohkvXYdC38r
	hX5ZMrwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKRjq-00000000UbZ-1CsF;
	Wed, 06 May 2026 02:11:50 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKRjo-00000000UaK-0t1F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 02:11:49 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-8ee7ffd738dso52103785a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 19:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1778033506; x=1778638306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrGezS/XNq9+psZQ70L22Z8q+JOJb1NZlusetExcJPM=;
        b=QiwjAW52BFCTjpXurD1JDiwdqiwDvKbAdOJhXtn5AVqr19/Rp1K0p6eZButK9bAgFN
         7Xr9pYHYt2A2gcWRSozr8C7gmIbxNOjZH5PINWXeF7Y5CoIA9+v20sgmnA2Ly2xX3Eg4
         /eczEF+04iWT21L6x5xv40w22/wiXJKA23j1kkk+92eYAz9khUrScxcUarEEzejv2yhS
         Z22y+0UQgxM8wt6tSLvvzel+rHoPjQ4XCBrkwumwwWRNE5TIHV6TjCGeKovJckjVpqdf
         Wl2AByru8N3lPfI4kjfrI3Olr791WaClSgCSW8NjMMze/Vwp3DN+3+N49F0V65tbs3Up
         +aHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778033506; x=1778638306;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yrGezS/XNq9+psZQ70L22Z8q+JOJb1NZlusetExcJPM=;
        b=P0lOlXJDBiT3tYz/STL8e8j6EcuafFnpmUq5TcVxkwVt1+wmtgTZeY7eurj46tKm/S
         m9TP91/pmYrz9E22jlQylXHXTEYCI9XpjDUTklPHft4gzLmyEWwFqs+T9J/B3ojPhGac
         E8ihNZG3/g9jnFivHH3eDExdc3YGYjD7EX4mnDEAlJ3zyifxM34WbYSzO/KsD03uOgUv
         5aOuOMsh3liCB8jowi9H4i8vp3ileKCgW8os3/svbHJZU745jQltDyjuSSi0h6ZgEKgG
         TPiIo7deuq4hxe0Zq13UAGYdcHbVrljFHscZYJa5Qf/dms0SeLVFz6lzB0S0VAfIhudX
         lhmg==
X-Forwarded-Encrypted: i=1; AFNElJ+nWYvReSb+3yGVvOaxnGb/VlX+tTbOGxSI2bfGP+O39iMUHJPNbHVNwlwR3xjPjQPCzUUzFSkogqtyYMcT58ni@lists.infradead.org
X-Gm-Message-State: AOJu0YwBz8t8v0bEWITmEEJDHcJQeCZGBP91QPail0duACdr5Je0W6Qf
	xRonse/wkZZPoIXWeuGFvgRTjGCRa7KyE+w7C8m0I9dozSZsGuwfEENhcVdUSlxEgA==
X-Gm-Gg: AeBDietdma7USdsCIpHAF419cEROsusBAoZZ5WigfCyqrX7YFovP6L5uwo5KqG0VerW
	9X0ZTJv5S3rbvSrm7CdmZQMD5QPGFXZ5sIvb72y+flumJcLDpA965dRHx7w+hd11fQ4tUqiT4aJ
	J2+bOzhaJtFNHUSQq15uMn8NxAPYVhKwf+cCBjmlydIUaO/mW41E5GbWkgbzyNpuAEJFzZ++JWI
	uGfSm45dpff7gw85b5D63iO4LsIEI5e2zI6DbQ7aynUd6W4m5BSmvub7CTfWj3xnOVfC0vkYP3c
	chP2r5nXobfTtvG4XDtMAVlXqTTgYTv5M3bdxRrr/GsmnwEZtj1AT0Ffsuyke2cVVLS7MbsqXtU
	6hEjduDDi+nB37HOhhZdQRAXywxGd3sPCkG8zqrAYKqsQD870j1QvsiyPNWfnXnGJG6Q+ESg73h
	uNn4dq6SThcbHikreyNhlL42qdszFVPYWh+xtoCgrJN6FtfYanWGC05NwfzxXyFwmGbaubx3x7J
	V25bo+LdvZSKUxt6lqMNw==
X-Received: by 2002:a05:620a:318e:b0:8ee:fc5e:e2e9 with SMTP id af79cd13be357-902e298aa9cmr923174085a.13.1778033506563;
        Tue, 05 May 2026 19:11:46 -0700 (PDT)
Received: from [192.168.7.16] (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91e11fsm1471690385a.40.2026.05.05.19.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 19:11:45 -0700 (PDT)
From: Paul Moore <paul@paul-moore.com>
To: Mimi Zohar <zohar@linux.ibm.com>
CC: Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan McDowell <noodles@earth.li>, <linux-security-module@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <linux-integrity@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>, <jmorris@namei.org>, <serge@hallyn.com>, <roberto.sassu@huawei.com>, <dmitry.kasatkin@gmail.com>, <eric.snowberg@oracle.com>, <jarkko@kernel.org>, <jgg@ziepe.ca>, <sudeep.holla@kernel.org>, <maz@kernel.org>, <oupton@kernel.org>, <joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>, <catalin.marinas@arm.com>, <will@kernel.org>, <noodles@meta.com>, <sebastianene@google.com>
Date: Tue, 05 May 2026 22:11:42 -0400
Message-ID: <19dfb0e2730.2843.85c95baa4474aabc7814e68940a78392@paul-moore.com>
In-Reply-To: <5debff82dc758d9c91223e4f1f5b9e39a3fcd4f5.camel@linux.ibm.com>
References: <cover.1777036497.git.noodles@meta.com>
 <7734099f5e7fda5480bca016a9e6707983325fbd.camel@linux.ibm.com>
 <afMlgstqahnZg68h@e129823.arm.com>
 <9f188536f09a2db30877d6bfbb84aeaf2565cccf.camel@linux.ibm.com>
 <CAHC9VhRsnmPp2KmQAns5uq5qXX5EF2xQQzyfTgrPi4O9AXyPpg@mail.gmail.com>
 <ba4bf28314b679474a6a8da6298e548e54b3754c.camel@linux.ibm.com>
 <CAHC9VhRE2kRr1fdDf6xgQgpSrtvqtP8Vy9LVGJhDZFUbzLKGmQ@mail.gmail.com>
 <ff28c6dcb60c357c752724927addaa8c4fd3bf2c.camel@linux.ibm.com>
 <CAHC9VhQY2TMkTvQq9P8oZteQWQSr7qq2utOuH+pdVx+8jWLBCw@mail.gmail.com>
 <a9412fe10e70ce95dd70556ace19368bec5c188c.camel@linux.ibm.com>
 <CAHC9VhRUgNA=Sj=jhD=zOt8R80Q+FQj+H0nYSy-FAujTL3EKPA@mail.gmail.com>
 <5debff82dc758d9c91223e4f1f5b9e39a3fcd4f5.camel@linux.ibm.com>
User-Agent: AquaMail/1.58.1 (build: 105801620)
Subject: Re: [PATCH] ima: debugging late_initcall_sync measurements
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_191148_678616_5687558F 
X-CRM114-Status: GOOD (  16.53  )
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

On May 5, 2026 9:57:23 PM Mimi Zohar <zohar@linux.ibm.com> wrote:
> On Tue, 2026-05-05 at 18:55 -0400, Paul Moore wrote:
>> On Tue, May 5, 2026 at 5:05 PM Mimi Zohar <zohar@linux.ibm.com> wrote:
>>> On Mon, 2026-05-04 at 16:51 -0400, Paul Moore wrote:
>>>> On Mon, May 4, 2026 at 8:03 AM Mimi Zohar <zohar@linux.ibm.com> wrote:
>>>>> On Sun, 2026-05-03 at 12:46 -0400, Paul Moore wrote:
>>>>>> Regardless, assuming you always want IMA to leverage a TPMs when they
>>>>>> exist, your reply suggests that using an initcall based IMA init
>>>>>> scheme, even a late-sync initcall, may not be sufficient because
>>>>>> deferred TPM initialization could happen later, yes?
>>>>>
>>>>> Well yeah.  The TPM could be configured as a module, but that scenario is 
>>>>> not of
>>>>> interest.  That's way too late.  The case being addressed in this patch set is
>>>>> when the TPM driver tries to initialize at device_initcall, returns
>>>>> EPROBE_DEFER, and is retried at deferred_probe_initcall (late_initcall).  Since
>>>>> ordering within an initcall is not supported, this patch attempts to initialize
>>>>> IMA at late_initcall and similarly retries, in this case, at 
>>>>> late_initcall_sync.
>>>>
>>>> Okay, so from a TPM initialization perspective you are satisfied with
>>>> a late-sync IMA initialization, yes?
>>>
>>> No. On some architectures moving IMA initialization from the late_initcall to
>>> late_initcall_sync does not miss any measurement records. However, as 
>>> previously
>>> mentioned, Linux running in a PowerVM LPAR the move would drop ~30 measurement
>>> records[1].  So no, only if the TPM is not initialized by late_initcall, should
>>> IMA retry at late_initcall_sync.
>>
>> What do you do in the PowerVM LPAR when the TPM is not avaiable at
>> late initcall and you have to defer IMA initialization until
>> late-sync?
>
> Your question is hypothetical ...

<heavy eye roll>

> ... as the TPM isn't deferred, so IMA doesn't go into
> TPM-bypass mode.  Testing on a PowerVM LPAR demonstrated that it skips ~30
> measurement list records.  So moving the initcall to late_initcall_sync would
> cause a regression.

Let me rephrase to make the question clear - how do you plan to handle a 
system where you lose measurements by waiting until late-sync, but the TPM 
is not available at the late initcall.

--
paul-moore.com




