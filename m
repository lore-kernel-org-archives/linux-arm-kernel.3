Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F62CCFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 14:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rnlc1dtXuVp5Avi/r2iLQdz0CX/cLLUFEsKgUqsEt14=; b=01W4/he5PQcb9rUypwX/pVZo2l
	vNTrZS59KBMlD9ugi7YQYfG0jFaYPJ0pM/B4pehVf7u9hnQBkPijjWsnEx8Ilr0DRcmqj1T5k6Fcr
	myy7kX4xWs9nJQqiy5F0ZjxcVDBYE1rC/nsM4Qj8Z9ewUResWlv36rH2DVV64U9gk8pzLCmFtXoB5
	EVecNPNEX+6jawKqAc55CwYcRkTITRrG2Hzc8Ew1k+NW7InElMbHZRaEiNgkRk82/IpRESZPKLihO
	M+XYGe3X5Xba7Uuj1lt61vdmQcftD+UqY5+GT7MYX0MmNbkWKRpVlapVqkklmXNt5cN39ElrSNJu0
	RxRm60Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOzqP-00000000YKQ-1i3I;
	Fri, 28 Nov 2025 14:53:09 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOzqN-00000000YK0-0yn6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 14:53:08 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso19891225e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 06:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764341585; x=1764946385; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rnlc1dtXuVp5Avi/r2iLQdz0CX/cLLUFEsKgUqsEt14=;
        b=O+N03h/HuvECFzeqDmy4pz9KFGHDp1MvAxSEWN80baABQEMG9XdlWeRZXrTtSnnau1
         nt19AUs1VBD4bxK4iP5+LTZRhwSa89dC7L27pVXdII1ieIGURjSNOLgprG6v6BMlyRWt
         IaSm9uxOYIyr6fV8/HUUD64vO2RwV8VSM39+io4nDYoiEkvCJdzbqzCx8YhdKdkuF5lE
         4tew2THM+FLWdjO/6quzwXKl4cbLItn2tuf608yK11b8ycFmNWr6kcXIXAXwcycb9CP0
         Ht6wYqI6Cfy3TEalWeOPUNRa59E0RrbjNTUs++5fqXRfzZ7f5/fkkQO7chUxo49MbI59
         lQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764341585; x=1764946385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rnlc1dtXuVp5Avi/r2iLQdz0CX/cLLUFEsKgUqsEt14=;
        b=wLeFT6BcHZCN9ZG3K9vVFwKcMlS84/AHcPPaDq86hqmCHTkBoQHBVUquswe+iNNtmB
         4SBLkl/iIoCF3osNjfT0cv++ZZbf1YwSCVDzJXHNA9qT/9i4k0gRulGGR9N1ljmyM8Jy
         7Oks87dwPm13WN0CZhYmIHjeuTHuXXFhU9Olu6KfAU4J/eNMx/LVnWfMWu4QBjw6yYKD
         xvtxAooCiXf82DWrt3Rr+E3h7sJA0IKsSBgubN7BJ0BJjkiF7+I6QjvPo9fmZEDbXUpZ
         IzatVcURP5t5/kRkEOCI++ibj1L9zXJI54KHv0PWgqwLvssaF0PmWwaFSL9BcoxqdlGC
         ZSgw==
X-Forwarded-Encrypted: i=1; AJvYcCULJnltKkQervyxKA83/89TR6btATqHU58G9j6wBLqy6y7K+EkEGJUedeY/wqnuuc2gAuRkq0FeSku/fEayyYxK@lists.infradead.org
X-Gm-Message-State: AOJu0YyvPvwMrKiDLUcH/HCQkIidElDPjT1uh1o3EPTwwvcZGnS6ezxT
	PO9K+eHsK9ttTXv9Zy8iJs8aGEP8zb26/fnPtbpiOkeTvxZk5QlV6GHVQeegstiW0rI=
X-Gm-Gg: ASbGnct3NZQJsVejLhOPdDlaNJ8zrMFKIuIXjmcOzbosOA/nAdEt7Zvx95H9ql+BigQ
	GELlZoGHYOyOvAPzzCeKIlnBlROnP97lhsHblbgMdSsxT+/6bOmPZt5uZf61t0d+mQGsig4pTZY
	Ev2mu1VuXvvpy5zmUnlzyOBKNGZJsJFQFFdlF8cTndQ6GLSXsDLn0BwGtYrl0QBzZSheBL7kFrn
	rRXLXq1QRk+3wt3OEp+MWNqLbGa4DOng2kjmSPp845+XcvnsHJWfHx3GBGW8XbPSdA3aaHvyofo
	thaSquSryWoXro46QHAbHhk4+zgAWXW3Gn8vvL1lGKIAT9Xfqt3NdTTFpJmMksUMtoBovBvDMOG
	uvr0PMK90Uzje5E9kQ8tbXmQRnry1/0HmV3AeHKMQCnHxPeA3fBYoS/we95F4UvHHkaDhuK8YLl
	TI6OnQWdSPaGeZih99
X-Google-Smtp-Source: AGHT+IHInRzHYPgTVT3G43Xp1WGE5iHIgv9aeTIFvYapraVaTFrOoNIvykgpSsOowov7B8jkgKaA5Q==
X-Received: by 2002:a05:600c:3111:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-477c10deffamr287739505e9.12.1764341585201;
        Fri, 28 Nov 2025 06:53:05 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479052cfd9dsm92060745e9.7.2025.11.28.06.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 06:53:04 -0800 (PST)
Message-ID: <8c7be69b-2227-45c2-9096-a49ec6df9a09@linaro.org>
Date: Fri, 28 Nov 2025 14:53:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: etm3x: Fix buffer overwrite in cntr_val_show()
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, suzuki.poulose@arm.com,
 alexander.shishkin@linux.intel.com, pratikp@codeaurora.org,
 mathieu.poirier@linaro.org, gregkh@linuxfoundation.org,
 jserv@ccns.ncku.edu.tw, marscheng@google.com, ericchancf@google.com,
 milesjiang@google.com, nickpan@google.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251121002350.1166758-1-visitorckw@gmail.com>
 <20251126120914.GH724103@e132581.arm.com>
 <da2a3e18-80e0-4aca-bbc7-45c1353217d3@linaro.org>
 <20251126123147.GI724103@e132581.arm.com>
 <CAJ9a7VhD2p3qMGXNg6deYjE8myB5euHR4FcAFwgg0KWF2HO9JQ@mail.gmail.com>
 <15d536f2-0829-4f3f-b111-b15b14236bd2@linaro.org>
 <CAJ9a7Vjia4ENewP48nyDWBcBFbDmwb3vM2JNbNCw4-3yF3ABVQ@mail.gmail.com>
 <20251127092942.GO724103@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251127092942.GO724103@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_065307_318686_84777FF0 
X-CRM114-Status: GOOD (  23.09  )
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



On 27/11/2025 9:29 am, Leo Yan wrote:
> On Wed, Nov 26, 2025 at 04:14:19PM +0000, Mike Leach wrote:
> 
> [...]
> 
>>>> The key to this is not the questions we are asked, but which platforms
>>>> are still supported by the linux kernel.
>>>>
>>>> The ETMv3 driver supports both ETMv3 and PTM trace (the programming
>>>> model is the same, even if the trace decode is vastly different).
>>>>
>>>> So as long as there are  platforms supported that use either of those,
>>>> we need to keep the driver in.
>>>>
>>>
>>> We're not running tests though, so if we find out it's fundamentally
>>> broken somehow it could be another justification to remove it, even if
>>> the kernel supports the devices. Do you have a board that you can test
>>> on Mike?
>>
>> Don't have one myself, but I believe the TC2 was used in development,
>> (that's the A15/A7 32 bit part - not total compute!) which somewhat
>> conveniently had both etmv3 and ptm trace.
> 
> If ETMv4 can be used by Armv7 (arm32) CPUs, and nowdays if Armv7 + ETMv4
> is a popular design, it makes sense for me to remove ETMv3 driver.
> 
> If Armv7 CPUs are always bound to ETMv3 / PTM, then we should keep the
> driver.
> 
> Thanks,
> Leo

Based on the the build system I don't think what the hardware supports 
matters that much. We've always only built the ETM4 driver on Arm64 and 
only build the ETM3 driver on Arm32.

I just found another bug which I think makes sense to log here. We've 
pretty much always turned on timestamps automatically in Perf, but for 
some reason the option validator in Perf thinks they're not supported in 
ETM3. The driver has always accepted it as an option so I'm not sure 
why. The end result is that the command will always fail, and you 
couldn't even undo it with "timestamp=0" until more recently when I 
fixed that.

Sysfs or per-thread Perf mode would be working, but it's one more bit of 
evidence to take in.


