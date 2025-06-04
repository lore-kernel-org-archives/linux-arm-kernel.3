Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3182C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 10:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5sSR4VthV+UJjIVdZVDHAUlb3ts5Dw2RpQM29jUnbM=; b=zmFERAwyfNwHWcdeezenylLrL7
	EKMwnbWaMmvZQBlSfCv0pfT0aCwCyqGXymzkglMccwSVyrtuwG83caCPkAbaC5uoRnMja4y9COEmr
	ZkemZzf6N5E7WobKcO6lHA+In7gIvCtEcgWw9qgAo1UB2NIElJGm1Vsjh7vhPlofNCddBRAUMpA06
	sHIzrCIxHG0MKqSi1BIDcxwtzy1F1Mtu4wLor+MdZl80mgPKWiF8hMydeu5KtKosff5dTNiPPxhOa
	7ZNJNteLEyNH7pHifYhbKUKFGK4qj8F16VY37dXjlcgxiBQsdlslFlsDSL+wfDwgjndWqJfa1Z4qr
	HeV6WnyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMl0T-0000000D6Ag-0TVm;
	Wed, 04 Jun 2025 10:06:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkyO-0000000D5xh-00I9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 10:03:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D7F012FC;
	Wed,  4 Jun 2025 03:03:34 -0700 (PDT)
Received: from [10.57.48.144] (unknown [10.57.48.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3333E3F673;
	Wed,  4 Jun 2025 03:03:50 -0700 (PDT)
Message-ID: <64ad6b4b-73f0-4812-911f-2742636a327d@arm.com>
Date: Wed, 4 Jun 2025 11:03:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/11] coresight: Set per CPU source pointer
Content-Language: en-GB
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, Yabin Cui <yabinc@google.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20250516160742.1200904-1-leo.yan@arm.com>
 <20250516160742.1200904-3-leo.yan@arm.com>
 <f50facc1-6872-4c6e-a44a-cf5f76b23208@linaro.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <f50facc1-6872-4c6e-a44a-cf5f76b23208@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_030352_082199_C02CE1C0 
X-CRM114-Status: GOOD (  10.78  )
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

On 03/06/2025 15:12, James Clark wrote:
> 
> 
> On 16/05/2025 5:07 pm, Leo Yan wrote:
>> Introduce coresight_set_percpu_source() for setting CPU source device. 
>> The
>> sources are maintained in a per CPU structure 'csdev_source'.
>>
>> The coresight_register() function cannot be used for setting CPU source
>> device as it is absent info for CPU ID.  So this commit uses the ETM3 and
>> ETM4 drivers to set and clear CPU sources in probing and removal,
>> respectively.
>>
> 
> I agree that doing it in coresight_register() would be better and 
> slightly less fragile.
> 
> You could add 'cpu' to 'struct coresight_desc' and then do the 
> assignment to 'csdev_source' in coresight_register() if 
> coresight_is_percpu_source() == true.

+1, add it to the coresight_desc and you could use the dev.subtype to 
detect if this is per-cpu source.

Suzuki

