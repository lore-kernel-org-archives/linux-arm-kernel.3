Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7A0C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrOsmcdvA/5wJCPrBaMjHgUh2GbSq1QH5NZgRqR6064=; b=uhuOoFItq0HZ6BTne4myayvBhV
	FG7BS6vW9g+Dx8UAUrNSs7xl7CKKJNUCfVUDzB09lewGVD17dkIq3pSYLgktM4x7OOdI+QR8127fk
	jxQGgBIl/DBdxBsQtLPtQVOZa3AQicLg7qGurXdXVD2/frKXjRzepM8TL2ktSwkQ9tBchYc6rV1a+
	Ty487iCx6lpeJ6Xo8Kcb/Y8Xm8TtEptiplROfk4nLGLESIz3rTnmU7cGbU5VWMF6EgPPbOwKIv2dk
	hNGXZjq7zEEYdZAR0Gqkw7NTogvDUEmtaovkQPsOb0opksmOWgM2B6YSr0SXlw4os039Y2+qJ7iYC
	wco0DmtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEMu-0000000FY61-0mcF;
	Fri, 27 Jun 2025 19:04:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVC6b-0000000FJ3A-2U7J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 16:39:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDEF91A00;
	Fri, 27 Jun 2025 09:38:55 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B8D93F58B;
	Fri, 27 Jun 2025 09:39:10 -0700 (PDT)
Message-ID: <6b50806b-3b0e-442f-a056-166cba039c2d@arm.com>
Date: Fri, 27 Jun 2025 17:39:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] cacheinfo: Expose the code to generate a cache-id
 from a device_node
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>,
 'Jonathan Cameron' <Jonathan.Cameron@huawei.com>
Cc: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
 "'linux-arm-kernel@lists.infradead.org'"
 <linux-arm-kernel@lists.infradead.org>,
 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>,
 "'Rafael J . Wysocki'" <rafael@kernel.org>,
 "'sudeep.holla@arm.com'" <sudeep.holla@arm.com>,
 'Rob Herring' <robh@kernel.org>, 'Ben Horgan' <ben.horgan@arm.com>
References: <20250617172132.00002844@huawei.com>
 <OSZPR01MB8798CDE4E2ED8E1B1B40E6608B45A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <OSZPR01MB8798CDE4E2ED8E1B1B40E6608B45A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_093913_714959_61FC4CC7 
X-CRM114-Status: GOOD (  12.35  )
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

Hi Shaopeng,

On 27/06/2025 06:54, Shaopeng Tan (Fujitsu) wrote:
>> On Fri, 13 Jun 2025 13:03:55 +0000
>> James Morse <james.morse@arm.com> wrote:
>>> The MPAM driver identifies caches by id for use with resctrl. It needs
>>> to know the cache-id when probe-ing, but the value isn't set in
>>> cacheinfo until the corresponding CPU comes online.
>>>
>>> Expose the code that generates the cache-id. This allows the MPAM
>>> driver to determine the properties of the caches without waiting for
>>> all CPUs to come online.

>>> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c index
>>> d8e5b4c7156c..6316d80abab8 100644
>>> --- a/drivers/base/cacheinfo.c
>>> +++ b/drivers/base/cacheinfo.c
>>> @@ -200,7 +200,7 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
>> struct device_node *np)
>>>  		id = arch_compact_of_hwid(id);
>>>  		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {

> Since "id" was compressed into 32bits by the function arch_compact_of_hwid(),
> is this required?

The need for this is clearer in the patch that introduces it - arch_compact_of_hwid() may
not be implemented by all architectures that use OF, and arch_compact_of_hwid() needs to
be able to fail if it can't produce a 32bit version of the hwid. (on arm64 this would
happen if an aff4 was allocated in the RES0 bits of MPIDR_EL1 - which is why the helper
checks those bits are all zero).
This check ensures that if any cache-id is greater than 32 bits, then the platform doesn't
expose any cache-id to user-space, which will let use fix it up in some way without
changing the values user-space saw for the 'other' caches.


Thanks,

James

