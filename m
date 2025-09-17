Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA91CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 08:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXGykCGQ86an+jiBCXOsI+KgOYzm8EHQAjzOF93pp8Q=; b=sxIyZUtqPru1yKutvSK1v656FE
	JNlP0a4mdoX/75b1BaKJ4jpvXnkb0wtz1ZEvL6FTiSNE9nxL7ZTSD+Gw1LuuJ/FpWFvaBbMecnQhC
	xvuk9NB7MZSSK1xCrHzSWIjS08bxLLaQS3/g6J7dk+6GKMYLK3WL76LMJxj7Lzm97nz37xVuQI60/
	JSNE9glHh3ULmAtDbLEput4zlYBIxzS5RCM+gj6CkUGhFzyxUg5+iIwp3qLjwY1Tnw/HkybcRecLd
	JDq6UiwCPAwlRt3YrzTIivuDZ4Kz4PyEVmXCLvmcvGSq/9UPb7ASRQ0GhamEIHiLlJ2H0Yh5tqmWX
	Izm20PlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynZi-0000000Adpr-3Lvt;
	Wed, 17 Sep 2025 08:31:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynZg-0000000AdpV-0ygn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 08:31:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D32F012FC;
	Wed, 17 Sep 2025 01:31:26 -0700 (PDT)
Received: from [10.1.31.40] (unknown [10.1.31.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 936693F673;
	Wed, 17 Sep 2025 01:31:33 -0700 (PDT)
Message-ID: <bee2351a-f264-4e3c-9c28-5dacc3605dba@arm.com>
Date: Wed, 17 Sep 2025 09:31:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] coresight: Fix possible deadlock in coresight_panic_cb
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Sean Anderson <sean.anderson@linux.dev>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Yeoreum Yun <yeoreum.yun@arm.com>, Mike Leach <mike.leach@linaro.org>,
 Linu Cherian <lcherian@marvell.com>, linux-kernel@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 James Clark <james.clark@linaro.org>
References: <20250912151314.3761026-1-sean.anderson@linux.dev>
 <20250915095820.GH12516@e132581.arm.com>
 <3e618117-96bd-44f3-bede-7cadfe0264dd@linux.dev>
 <20250916160027.GK12516@e132581.arm.com>
 <a35e2d54-f1f5-4ae4-9daa-ae1f3a8a302b@linux.dev>
 <20250916164854.GM12516@e132581.arm.com>
 <42f1c98c-1432-47bb-9203-e878f011ff6e@linux.dev>
 <20250916171702.GO12516@e132581.arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250916171702.GO12516@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_013136_316738_3223E24A 
X-CRM114-Status: GOOD (  15.44  )
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

On 16/09/2025 18:17, Leo Yan wrote:
> On Tue, Sep 16, 2025 at 12:51:11PM -0400, Sean Anderson wrote:
>> On 9/16/25 12:48, Leo Yan wrote:
>>> On Tue, Sep 16, 2025 at 12:14:40PM -0400, Sean Anderson wrote:
>>>
>>> [...]
>>>
>>>>> Could you check if the drafted patch below looks good to you? If so, I
>>>>
>>>> As stated above I disagree with a half-hearted removal. If you want to do that,
>>>> then I will resend v2 done with an rcu list and you can make your own follow-up.
>>>
>>> It is fine to disagree, but please don't resend v2 :)
>>>
>>> We have plan to refactor locking in CoreSight driver, I will try my
>>> best to avoid adding new lock unless with a strong reason.
>>
>> As said above it will be done with an rcu list, so no new lock.
>>
>> Or I can do this patch but stick the notifier block in csdev as suggested by Suzuki.
> 
> I am fine for adding the notifier block in csdev.
> 
> Suzuki, could you confirm if this is the right way to move forward?

Yes, if we are planning to keep a csdev panic_ops, why not stick in the
notifier there, rather than splitting it between core code and drivers.

Suzuki




> 
> Thanks,
> Leo


