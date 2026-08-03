Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7728AC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 12:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLwVMSmGYv83qQMDHymCgLJLan5WW0FRdVakjEqzBYA=; b=nyS7GWZjUwX8oyUwa0Owu16XPF
	gO/49QYFuXB3MQXLge2I81SPZwOvesaX9HoZM164ZeEepqNLzAc62ODq3dqlcrdmpdM83YpsMqhVr
	jLhtyZWdHiQlbnOEOiJNyr65tSbuawsItKQ8cKktwxD3z9IQYGzvnbDu/9nA+2jLBzpFCGkCBlE0P
	OroqTsTr9h5HRboXmy9W5LvGyp1BBn/yyv0dt5Zo3b93gKuvVFPk5wsraDtDl4Lk1OJA4XOQwvrzy
	zf2j0Eyjo5t5I+j/kKtW12IGemmixByOSCQbf3eqSA4mB+axjMqwMZDsP4nlgkvhC1lFsVghSxIWY
	HCtCvFQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrth-0000000H2VQ-0AIG;
	Mon, 03 Aug 2026 12:36:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrtf-0000000H2V2-0mZp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 12:36:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A843E143D;
	Mon,  3 Aug 2026 05:35:52 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB1FD3F66F;
	Mon,  3 Aug 2026 05:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785760556; bh=ZMjJJGjLX5qhiZfYr2Tg/ZhY4THZbGnUayhvkoYQLNk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gDnxl5xZCWP68FDWod6cKugXD7iQIhJj0mR82DmuQ9EeKCll0DdtT5w8qrPQDVHWY
	 nHMkNIuD5zM/pC/tJ7PTq3Qwa4RzaTpSgvpfkb7zkM7tThKfu9FYohLaynqTzKEDEX
	 mfGw3NeUO7/nBjRUl2XFRc0dl7brIgmUk4Ub81aM=
Message-ID: <00dae86e-cbc3-4d6e-966f-39afd4b8c2ec@arm.com>
Date: Mon, 3 Aug 2026 13:35:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] iommu/arm-smmu-v3: Replace sort_nonatomic() with
 sort()
To: Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, joro@8bytes.org,
 akpm@linux-foundation.org, cychu@google.com, hhchung@google.com,
 amitamishra@google.com, marscheng@google.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com
References: <20260730181216.2709088-1-visitorckw@gmail.com>
 <20260730181216.2709088-2-visitorckw@gmail.com>
 <am8MpGR14HAg58Gd@willie-the-truck> <am+CPy4+gcGPtR3G@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <am+CPy4+gcGPtR3G@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_053559_294592_FAEF2BDB 
X-CRM114-Status: GOOD (  13.88  )
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

On 02/08/2026 6:45 pm, Nicolin Chen wrote:
> On Sun, Aug 02, 2026 at 10:23:48AM +0100, Will Deacon wrote:
>> On Thu, Jul 30, 2026 at 06:12:15PM +0000, Kuan-Wei Chiu wrote:
>>> @@ -4047,9 +4047,9 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
>>>   	}
>>>   
>>>   	/* Put the ids into order for sorted to_merge/to_unref arrays */
>>> -	sort_nonatomic(master->streams, master->num_streams,
>>> -		       sizeof(master->streams[0]), arm_smmu_stream_id_cmp,
>>> -		       NULL);
>>> +	sort(master->streams, master->num_streams,
>>> +	     sizeof(master->streams[0]), arm_smmu_stream_id_cmp,
>>> +	     NULL);
>>
>> Makes sense to me. Nicolin, did you choose the nonatomic version
>> specifically?
> 
> It's probably rare to have a large multi-stream array, so I think
> sort() would be fine.

Yeah, probably 99% of the time the size of this array will be 1. An 
exceptional value of "large" might be something like 64 for a massive 
(non-PCI) DMA engine with separate read and write IDs per channel for no 
good reason.

If and when someone ever were to report RCU stalls here then we can 
first ask them what the heck their client device is... and unless and 
until then I wouldn't think it's worth worrying about.

Thanks,
Robin.

