Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4A0CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 03:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixdAPYALMBfjHtlMi5593ygrQL5Cn1/ET3MN42moESc=; b=AME0++KTwWmB52FL5gFL6f9UF2
	9j5A+cxJItskOTr7fEFlZZgzuNv7kOaGo/bEjb8vJAbzaVTKUz/qJhqQ0FqJa0aWYRVkIzhKw0/Fn
	5so6+wBnFPvd51moR+PWvd2mwbD5w3zmokgfWURGKv5kO1dllN4OKzn/DwMsHiL7Fx1rLMKnda52q
	eXP4H6E1VsVbwa/HSYSQHhV9PNWT5GeSybJN13KFfWe4nHizuhXrJeaFeuztll45D6PexAeUfSnCL
	gAJIWT3vzaKrtGcr0c9mLrY1Lnp8vMx2D6SonjgoEJFQLdwHmFi7zI7trSMxU84El5xYo7mTHOi5d
	/ori4W/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPXnu-00000003PsW-2nhv;
	Wed, 20 May 2026 03:41:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPXno-00000003PrW-0f7J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 03:41:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 572F83552;
	Tue, 19 May 2026 20:40:50 -0700 (PDT)
Received: from [10.164.148.41] (MacBook-Pro.blr.arm.com [10.164.148.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A84D63F632;
	Tue, 19 May 2026 20:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779248455; bh=aQd+PCw8b7BF4wIqmSCt8liHy0QTsX/ju76AwR0LZ7U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nXAi6eGpG49BwLeuZ5K6Iu0DOJ6cwT5ftm/3BWj22C9BrV1ap/IfSGeyezvS3cDRW
	 TXBdq5BCMl+lEMT/38n3Hi0xibEuYnHJERTuEPRjQKP5zhktyLbxBXb/kNeM22vv88
	 WqrAGgPoR2snNJnGtPvPu+ceCfzNZtkC177zOuBA=
Message-ID: <e1aaa6a8-8b35-4fea-b2d7-b994064cc4db@arm.com>
Date: Wed, 20 May 2026 09:10:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: Andrew Morton <akpm@linux-foundation.org>,
 Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, will@kernel.org, urezki@gmail.com,
 baohua@kernel.org, Xueyuan.chen21@gmail.com, rppt@kernel.org,
 david@kernel.org, ryan.roberts@arm.com, anshuman.khandual@arm.com,
 ajd@linux.ibm.com, linux-kernel@vger.kernel.org,
 Wen Jiang <jiangwen6@xiaomi.com>
References: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
 <20260519131738.11a78ba88e1be28ba5cb26eb@linux-foundation.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260519131738.11a78ba88e1be28ba5cb26eb@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_204100_602238_B8660FD8 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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



On 20/05/26 1:47 am, Andrew Morton wrote:
> On Thu, 14 May 2026 17:41:01 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
> 
>> This patchset accelerates ioremap, vmalloc, and vmap when the memory
>> is physically fully or partially contiguous.
>>
>> ...
>>
>> On the RK3588 8-core ARM64 SoC, with tasks pinned to a little core and
>> the performance CPUfreq policy enabled, benchmark results:
>>
>> * ioremap(1 MB): 1.35× faster (3407 ns -> 2526 ns)
>> * vmalloc(1 MB) mapping time (excluding allocation) with
>>   VM_ALLOW_HUGE_VMAP: 1.42× faster (5.00 us -> 3.53us)
>> * vmap(100MB) with order-8 pages: 8.3× faster (1235 us -> 149 us)
> 
> Nice.
> 
> AI review found a bunch of things to ask about:
> 	https://sashiko.dev/#/patchset/20260514094108.2016201-1-jiangwen6@xiaomi.com
> 
> It doesn't appear that you'll be getting any more review on this
> series, so please check the above questions and resend?

I have to review this but struggling to find time right now. So please
don't wait for me : )
> 


