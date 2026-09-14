Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4A8C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zgLB2e2SnSUxxE6PGm4/w2bNDxWisrkCAM2LeztIrG4=; b=W+zi+Iw+Ayn2vuiFFewI59P3kd
	4kHwWUPQFtfnaD7Wq7wXuWUpZRTQdcLDLPoXhcX8bNRfrazeThYu7a3yHFEeIqcke5Uje7UKOfOLQ
	cpMAmMX6+M8/WvZlBb+xJw0104ZstolJAIHramCVbqhKuvlzdWgWYSBDZ1XBBT1Kpm3QPQWvP224F
	ymH4W01dt0W2IB5SPhRORvGAz6fWjSmHuPtdfmxd5Ltfw9RZLgtWaPfWMBSG2U70jJJVmMjQloG73
	b2G2UhM4Rk5zyS4yB+a0Vvxd8V3xTshX1+XYG5dUDAK8FHdVNtFyor/PDHdumh4sFyJEisuFdoVGW
	/RxWGKnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61ud-00000002hky-26xi;
	Mon, 14 Sep 2026 08:19:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61ua-00000002hk9-3idz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 08:19:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2155F1570;
	Mon, 14 Sep 2026 01:19:30 -0700 (PDT)
Received: from [10.0.128.139] (unknown [10.0.128.139])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 347C73F7B4;
	Mon, 14 Sep 2026 01:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789373973; bh=m0ynvs3ASpXg1FC+68FV0PXhWfrNCCs02XWVdpFI/DQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=qn7Y86S79uT/YwzISi20g2289oLffqODkAmnxFgB2/f7TGFSQH0pkD3Flpjb9goCV
	 JVxc5wzSGZPvwfsvk8giDVPvJZb6nSQiZf9vHgvAswACRxWTw5hI/Q8OEqEP2oUPT0
	 WdpXR2joVP3TKazZtFh5ODPYF2WekqdLue2DS+xI=
Message-ID: <1fca136f-5802-449a-81f1-3a76c31a2f74@arm.com>
Date: Mon, 14 Sep 2026 09:19:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 4/7] firmware: arm_rmm: Add support for SRO
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-5-suzuki.poulose@arm.com>
 <f00d01d1-8df0-4865-8e52-c85171cf4ca5@redhat.com>
 <4f18aa66-2296-4b63-87f5-6ab493faecbc@arm.com>
In-Reply-To: <4f18aa66-2296-4b63-87f5-6ab493faecbc@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_011937_002995_1DAAA28E 
X-CRM114-Status: GOOD (  16.01  )
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

On 14/09/2026 07:22, Suzuki K Poulose wrote:
> Hi Gavin
> 
> Thank you for the review, I will address most of them. Responses inline.
> 
> On 14/09/2026 06:04, Gavin Shan wrote:
>> On 9/12/26 6:36 PM, Suzuki K Poulose wrote:
>>> RMM v2.0 introduces the concept of "Stateful RMI Operations" (SRO). This
>>> means that an SMC can return with an operation still in progress. The
>>> host is expected to continue the operation until it reaches a conclusion
>>> (either success or failure). During this process the RMM can request
>>> additional memory ('donate') or hand memory back to the host
>>> ('reclaim'). The host can request an in progress operation is cancelled,
>>> but still continue the operation until it has completed (otherwise the
>>> incomplete operation may cause future RMM operations to fail).
>>>
>>> The SRO is tracked using a struct rmi_sro_state object which keeps track
>>> of any memory which has been allocated but not yet consumed by the RMM
>>> or reclaimed from the RMM. This allows the memory to be reused in a
>>> future request within the same operation. It will also permit an
>>> operation to be done in a context where memory allocation may be
>>> difficult (e.g. atomic context) with the option to abort the operation
>>> and retry the memory allocation outside of the atomic context. The
>>> memory stored in the struct rmi_sro_state object can then be reused on
>>> the subsequent attempt.
>>>
>>> Wrappers for SRO RMI commands are also provided here because they depend
>>> on the rmi_sro_execute() implementation added by this patch.
>>> Delegate/undelegate handles are also added here because they now use the
>>> SRO/stateful command infrastructure and are also used for the memory
>>> DONATE/RECLAIM flows.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> Co-Developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> 
> 
>>> ---
>>>   drivers/firmware/arm_rmm/rmi.c | 586 +++++++++++++++++++++++++++++++++
>>>   include/linux/arm-rmi-cmds.h   |  41 +++
>>>   2 files changed, 627 insertions(+)
>>>
>>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/ 
>>> arm_rmm/rmi.c
>>> index 5b0e342ce3d58..4f9898ece7547 100644
>>> --- a/drivers/firmware/arm_rmm/rmi.c
>>> +++ b/drivers/firmware/arm_rmm/rmi.c
> 
>>
>> I would drop rmi_granule_range_{delegate, undelegate}() by combining 
>> their logics to
>> their only callers rmi_{delegate, undelegate}_range(). More details 
>> are provided for
>> rmi_{delegate, undelegate}_range() in the below.
> 
> Ack

I have moved them closer, but kept the logic separate, since this is not
a simple RMI call.

Cheers
Suzuki


