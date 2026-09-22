Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E2AC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4VKp8BPpudiuKa1U2dBNHICwuRelag7fHLm76D5sWX8=; b=oR8l32UWUSS31dWBXSmCCAy8rm
	hIA0mRuIdj6liYVjZqt/inQzPRUwCOfcqM+MLeNn5AUSi8P9gntZE9FkfZ9epgV5tntMja4TLWv5A
	Z97M2+VKQpS1DC7Z3e8skFPEUwn+j/kuFMSOATh19q2cYu+fgpFTDfxQXmOCtfu3y//oluWG/etyY
	g3IySB47R+CRuGhU0PJ1b33b4egHZDQrozvCB6XU6O1kJwVq6eeYDfBW9uOadlfb7pbyxP1dQndm6
	VyUFL3mDLbUHiJ/7Gikm8w1dbKcXIye4gsJqc/G3G1CHJm7CbO2Ht1pEsqAmsQnCl8vjcj8E0u20v
	qooLmIpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92nU-00000005woY-2Kl6;
	Tue, 22 Sep 2026 15:52:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92nR-00000005wnC-3BR8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:52:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6D231576;
	Tue, 22 Sep 2026 08:52:34 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39CF83F86F;
	Tue, 22 Sep 2026 08:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790092358; bh=QXkqCPySi5pz7XgdaRzbBeXXq0xzGh50Y6EVmcAY8zY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oZix9XUP55kqOWVW+bfYG9UjgcMAazDK3HOVVEbFE3DS3uNXTOXe520r1mUw6E6lo
	 20jvGUvIZtXOrhSY+gykvbq9ah2h0pYuQyUF+IHtdmoHFiK2hXDtWVL34VCdra+7Xz
	 jzeycyKKbWFEKl6P58faJ33saYp+8eGTfCsMCwYk=
Message-ID: <31be5621-92f6-4101-898f-806335d56155@arm.com>
Date: Tue, 22 Sep 2026 16:52:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/4] iommu/arm-smmu-v3: Support shared SIDs in
 insert/remove_master
To: Peng Fan <peng.fan@oss.nxp.com>, Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, joro@8bytes.org, jpb@kernel.org, jgg@ziepe.ca,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, peng.fan@nxp.com
References: <20260921-smmu-shared-sid-v2-0-4b656ce68178@nxp.com>
 <20260921123846.1663580-1-peng.fan@oss.nxp.com> <arG6hmng3NddGEHm@nvidia.com>
 <arKNJH2YWQT9KL7x@shlinux89>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <arKNJH2YWQT9KL7x@shlinux89>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_085241_892756_A85EA5B3 
X-CRM114-Status: GOOD (  21.53  )
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

On 22/09/2026 3:13 pm, Peng Fan wrote:
> On Mon, Sep 21, 2026 at 04:15:18PM -0700, Nicolin Chen wrote:
>> On Mon, Sep 21, 2026 at 08:38:46PM +0800, Peng Fan (OSS) wrote:
>>> @@ -976,6 +976,24 @@ struct arm_smmu_device {
>>>   struct arm_smmu_stream {
>>>   	u32				id;
>>>   	struct arm_smmu_master		*master;
>>> +	/*
>>> +	 * ref_count > 1 means multiple masters share this SID.  Protected by
>>> +	 * smmu->streams_mutex.
>>> +	 */
>>> +	unsigned int			ref_count;
>>> +	/*
>>> +	 * When ref_count > 1 the STE has already been written by the first
>>> +	 * master; subsequent masters must skip the write.
>>> +	 */
>>> +	bool				ste_installed;
>>> +	/*
>>> +	 * Links all arm_smmu_stream objects that share the same SID across
>>> +	 * different masters.  The canonical (XArray-stored) entry is the list
>>> +	 * head; non-owning sharers are linked into it.  Used to transfer
>>> +	 * XArray ownership when the current owner is removed.
>>> +	 * Protected by smmu->streams_mutex.
>>> +	 */
>>> +	struct list_head		shared_link;
>>>   };
>>
>> SID-sharing masters still allocate their own streams. Though the
>> SIDs are the same number, they own duplicated streams linked via
>> that "shared_link" list.
>>
>>   master_a->stream[0] --> stream (SID=X) --|
>>                                       shared_link
>>   master_b->stream[0] --> stream (SID=X) --|
>>
>> But maybe they could share the stream structure directly? I.e.
>>
>>   master_a->stream[0] --|
>>                         |--> shared stream (SID=X)
>>   master_b->stream[0] --|
>>
>>
>> The stream structure would still need a list for shared_masters:
>>
>> struct arm_smmu_stream {
>> [...]
>> 	/* Every sharing master, ->master included. Empty unless shared */
>> 	struct list_head shared_masters;
>> };
>>
>> ref_count could be simply !list_empty(&stream->shared_masters).
> 
> Agree.
> 
>>
>>
>> Does i.MX need to support SID-sharing with multi-SD device? If not,
>> the master could have only a simple shared_masters_elm:
> 
> For i.MX, there is no need to support SID sharing for multi-SID device for now.
> Not sure, in future there are cases that needs SID sharing for multi-SID device.

I have a system meeting those conditions :)

Specifically, I have a physical PCIe-to-PCI bridge board with a couple 
of ancient cards plugged into it (such that they each end up with their 
own RID plus the common bridge alias RID) just in case I ever got round 
to looking at this myself...

(And for added fun, one of the cards only supports 31-bit DMA and the 
machine doesn't have any RAM low enough for it to work without the SMMU 
at all)

Cheers,
Robin.

> 
> I could update in V3 following your suggestion.
> 
> Thanks,
> Peng
> 
>>
>> struct arm_smmu_master {
>> [....]
>> 	/* Supports num_streams == 1 only. Empty if SID is not shared */
>> 	struct list_head shared_masters_elm;
>> };
>>
>>> @@ -1024,6 +1042,11 @@ struct arm_smmu_master {
>>>   	bool				ste_ats_enabled : 1;
>>>   	bool				stall_enabled;
>>>   	bool				ats_always_on;
>>> +	/*
>>> +	 * True when at least one of this master's SIDs is shared with another
>>> +	 * master.  SVA, stall and IOPF are disabled for such masters.
>>> +	 */
>>> +	bool				shared_sid;
>>
>> Then, this could be !list_empty(&master->shared_masters_elm).
>>
>> Nicolin
>>
>>


