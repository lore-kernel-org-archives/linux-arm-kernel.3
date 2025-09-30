Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B970ACCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 17:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBFcNqPWvUDAgykQEZdDnsOv2fcMlfqDrPSb2BEb8xQ=; b=yxygaftFs25K18L3rJzzqc9rbc
	63pmUA+JClINRjEQLV5rVMW3QpNxlLAaQdUBhrhb3Hb/DtxiWZl2w6I0aBIrk3saUddq6pr1+3tNN
	ImdbETm6S+Ct0ueINc57vW2dKgIb6QDPSIhNpYDGYHsWOsQ/CUNL1POMMDIHOuPsBW5osaKS5UVfT
	ijHtT78rVLk94RmLvLO560D4R0rH9PO4+tC/7ZmXDZL3EBiZRxhzU3l4atA4j2a6kK4vm45pYMMDj
	IZ5iFp43mnwk5gkc+TAlluN0iPWK9L4L4pMLKvEP9jkanqS4jbnMpcXeDZ9jB3Z1J7A2qAy6LaUEI
	Xg4IWVvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3do7-00000005qJq-3FeJ;
	Tue, 30 Sep 2025 17:06:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3do5-00000005qJH-23cZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 17:06:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD4F812FC;
	Tue, 30 Sep 2025 10:06:19 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08F273F59E;
	Tue, 30 Sep 2025 10:06:21 -0700 (PDT)
Message-ID: <eea8e8c5-d9da-43cc-914b-bba6e59b6e8f@arm.com>
Date: Tue, 30 Sep 2025 18:06:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/29] arm_mpam: Extend reset logic to allow devices to
 be reset any time
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com, Rob Herring <robh@kernel.org>,
 Rohit Mathew <rohit.mathew@arm.com>, Rafael Wysocki <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-18-james.morse@arm.com>
 <20250912130216.00006d92@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250912130216.00006d92@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_100629_580771_903B23D5 
X-CRM114-Status: GOOD (  18.42  )
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

On 12/09/2025 13:02, Jonathan Cameron wrote:
> On Wed, 10 Sep 2025 20:42:57 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> cpuhp callbacks aren't the only time the MSC configuration may need to
>> be reset. Resctrl has an API call to reset a class.
>> If an MPAM error interrupt arrives it indicates the driver has
>> misprogrammed an MSC. The safest thing to do is reset all the MSCs
>> and disable MPAM.
>>
>> Add a helper to reset RIS via their class. Call this from mpam_disable(),
>> which can be scheduled from the error interrupt handler.

>> Changes since v1:
>>  * Use guard macro for srcu.
> 
> I'm not seeing a strong reason for doing this for the case here and not
> for cases in earlier patches like in mpam_cpu_online() 

I just missed them...


> I'm a fan of using
> these broadly in a given code base, so would guard(srcu) in those earlier patches
> as well.

I've done the online/offline - I'll take another pass through them.


> Anyhow, one other trivial thing inline that you can ignore or not as you wish.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Thanks!

>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index e7faf453b5d7..a9d3c4b09976 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c

>> @@ -1340,8 +1338,56 @@ static void mpam_enable_once(void)
>> +static void mpam_reset_component_locked(struct mpam_component *comp)
>> +{
>> +	struct mpam_msc *msc;
>> +	struct mpam_vmsc *vmsc;
>> +	struct mpam_msc_ris *ris;
>> +
>> +	lockdep_assert_cpus_held();
>> +
>> +	guard(srcu)(&mpam_srcu);
>> +	list_for_each_entry_srcu(vmsc, &comp->vmsc, comp_list,
>> +				 srcu_read_lock_held(&mpam_srcu)) {
>> +		msc = vmsc->msc;
> 
> Might be worth reducing scope of msc and ris

Sure,


Thanks,

James

