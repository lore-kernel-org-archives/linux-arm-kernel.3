Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC88BC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 18:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Om4ps8LWfWrE7iytBcnEp0gl/lf6uH6lcmL7E5D5m/8=; b=lqK2zhtbXxpfsPsJcMBYkFYOKC
	poOfIJzC3sDSGpMHthVzYpxatjxZIGfEx10iJ+jv5R6DxZe6SlZKq7WNXKVTzcqgLftkL/8/mZE5P
	6yvOYBtR1ARU6BSfNYNoTZcVy3Uprrr0pqDkveCdMT7gpCe9ylqPKAiOhm8tRFyhlsgUpBccEBo+U
	tTVASTvHYQwX2Cm0fdwfQ8ym7juUifPX2jz17P71v/oJ5IFsIIL/dShY/VkSmuJ/ml3fI1/nLXaik
	GY6daavYuz2ZU67DUoNQD7ApxpUhhFTo23sq/aEOlpPen6ZNVl8LtTw+Gy+2SElnecrySHJ0UWgHY
	UQgoeWEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujioD-0000000G3jM-24Bz;
	Wed, 06 Aug 2025 18:24:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiXo-0000000G1aE-2uoD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 18:07:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05FBB176C;
	Wed,  6 Aug 2025 11:07:12 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81FBC3F738;
	Wed,  6 Aug 2025 11:07:16 -0700 (PDT)
Message-ID: <4da6ec99-0de5-46f1-859e-8246bc3025ff@arm.com>
Date: Wed, 6 Aug 2025 19:07:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 17/36] arm_mpam: Add cpuhp callbacks to probe MSC
 hardware
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Zeng Heng
 <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-18-james.morse@arm.com>
 <48e482f2-e7a8-4d6a-bf16-ad29f9331e3b@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <48e482f2-e7a8-4d6a-bf16-ad29f9331e3b@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_110720_774816_850B8D58 
X-CRM114-Status: GOOD (  13.07  )
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

Hi Ben,

On 24/07/2025 15:13, Ben Horgan wrote:
> On 11/07/2025 19:36, James Morse wrote:
>> Because an MSC can only by accessed from the CPUs in its cpu-affinity
>> set we need to be running on one of those CPUs to probe the MSC
>> hardware.
>>
>> Do this work in the cpuhp callback. Probing the hardware will only
>> happen before MPAM is enabled, walk all the MSCs and probe those we can
>> reach that haven't already been probed.
>>
>> Later once MPAM is enabled, this cpuhp callback will be replaced by
>> one that avoids the global list.
>>
>> Enabling a static key will also take the cpuhp lock, so can't be done
>> from the cpuhp callback. Whenever a new MSC has been probed schedule
>> work to test if all the MSCs have now been probed.

>> diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/
>> mpam_devices.c
>> index 0d6d5180903b..89434ae3efa6 100644
>> --- a/drivers/platform/arm64/mpam/mpam_devices.c
>> +++ b/drivers/platform/arm64/mpam/mpam_devices.c
>> @@ -513,9 +541,84 @@ int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>>       return err;
>>   }
>>   -static void mpam_discovery_complete(void)
>> +static int mpam_msc_hw_probe(struct mpam_msc *msc)
>>   {
>> -    pr_err("Discovered all MSC\n");
>> +    u64 idr;
>> +    int err;
>> +
>> +    lockdep_assert_held(&msc->probe_lock);
>> +
>> +    mutex_lock(&msc->part_sel_lock);
>> +    idr = mpam_read_partsel_reg(msc, AIDR);
>> +    if ((idr & MPAMF_AIDR_ARCH_MAJOR_REV) != MPAM_ARCHITECTURE_V1) {
>> +        pr_err_once("%s does not match MPAM architecture v1.0\n",
>> +                dev_name(&msc->pdev->dev));

> The error message need only mention the major revision. You've added support for v1.1 and
> v1.0.

Makes sense,


Thanks,

James

