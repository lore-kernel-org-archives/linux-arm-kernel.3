Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FB5C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 17:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uaz9+iN5QDzFbCk8rxHxSf6WYCl8OJp9n7PX8yVOxxo=; b=Mk+czf4A3Pv7M25V/2PPXXjih7
	5Whl+dsTwdaSmCoQEnPdEqkPV223ae23w89z3mE3O/y2FykZnSjsn0qeQAEVvp1lzKpt5YAkV5iLJ
	u6r5HU/dtNktVy7wlLiP+y+/qorn+BBFkGRxi1UU96SEslSwq3ZgVTLfX8Uu9HHqovo/Mow2Udy7H
	kqq8Q1B+9Sl2V0ONj8YfW1JC0KSrvn1NvFGTpUhodgbDqsBWv0TRSret7R2NXBeSYJ0y/frbzjZ+7
	CW3er91k+JwzGz+s2iReUc+FRXmfbHqTdlvYakmiZs88u/W45wi7p0V+p9hrJ2h3fmNL1xa5b6f3C
	H6fa3V7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVDAY-0000000FRUJ-2Ma9;
	Fri, 27 Jun 2025 17:47:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVC6A-0000000FItA-0gfa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 16:38:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AE0028C7;
	Fri, 27 Jun 2025 09:38:28 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F4E23F58B;
	Fri, 27 Jun 2025 09:38:44 -0700 (PDT)
Message-ID: <d1756a25-97e2-4a3b-a3be-cb2d95cfb7c1@arm.com>
Date: Fri, 27 Jun 2025 17:38:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] cacheinfo: Expose the code to generate a cache-id
 from a device_node
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com,
 Rob Herring <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>
References: <20250613130356.8080-1-james.morse@arm.com>
 <20250613130356.8080-5-james.morse@arm.com>
 <20250617172132.00002844@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250617172132.00002844@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_093846_242385_AD0E045F 
X-CRM114-Status: GOOD (  13.59  )
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

Hi Jonathan,

On 17/06/2025 17:21, Jonathan Cameron wrote:
> On Fri, 13 Jun 2025 13:03:55 +0000
> James Morse <james.morse@arm.com> wrote:

>> The MPAM driver identifies caches by id for use with resctrl. It
>> needs to know the cache-id when probe-ing, but the value isn't set
>> in cacheinfo until the corresponding CPU comes online.
>>
>> Expose the code that generates the cache-id. This allows the MPAM
>> driver to determine the properties of the caches without waiting
>> for all CPUs to come online.

> Feels to me like this needs to come with the user.
> The earlier patches at least expose it via existing infrastructure
> this isn't used at all yet...

Yeah, I'm damned whatever I do here. I can move this (and patch 5) to the series with the
MPAM driver - this was me trying to reduce the number of people that get copied on that,
and the number of trees that it touches...


>> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
>> index d8e5b4c7156c..6316d80abab8 100644
>> --- a/drivers/base/cacheinfo.c
>> +++ b/drivers/base/cacheinfo.c
>> @@ -188,7 +188,7 @@ static bool cache_node_is_unified(struct cacheinfo *this_leaf,
>>  #define arch_compact_of_hwid(_x)	(_x)
>>  #endif
>>  
>> -static void cache_of_set_id(struct cacheinfo *this_leaf, struct device_node *np)
>> +unsigned long cache_of_get_id(struct device_node *np)

> Bit confusing to have cache_of_set_id() call cache_of_get_id() like this because
> they are in no way mirrors of each other.   Rename?
> (and naturally I'm providing no suggestions :)

I'll try cache_of_calculate_id() ...


>>  {
>>  	struct device_node *cpu;
>>  	u32 min_id = ~0;


Thanks,

James

