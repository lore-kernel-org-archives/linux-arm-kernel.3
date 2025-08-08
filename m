Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEF4C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 07:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tW9+9lL64knjEW1pdYdk1680F8T1wtSpVfpDTgQFIbA=; b=fFbispVnjUpJspqGuDkqAqvMRi
	k4x+2tGB7JImaoXeM32o2Lx3T924dSMpZ93lrdL+iOM6jcNPL9HltZkZbg3k5xyuOznPkNQnhOQd0
	isTsjhRyN0mgEKYqWBn/QaRmEzDXXzpqHJbXveAPK7DXv1r75J7HfCujapKnp5utR5t/PUk0H08lA
	eUPL74a0nUBoo+eOJybWMJ3OW+lLQEu9eXqijNEreshapWV2kNhRdMaMkQIxwyv/wNugXcmGGD0oz
	OfeLJkDEJAxD6zpNcxJEl05NINxXJ7T/4XCRyhAqU5x8jxSyCho4lyP5THAbZFk4CqXzldzvTk6pX
	M7y99Kew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHNj-00000002AwG-1YvT;
	Fri, 08 Aug 2025 07:19:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHGH-00000002A18-2M09
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 07:11:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAA5022EA;
	Fri,  8 Aug 2025 00:11:24 -0700 (PDT)
Received: from [10.57.5.99] (unknown [10.57.5.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8408D3F673;
	Fri,  8 Aug 2025 00:11:27 -0700 (PDT)
Message-ID: <02e4504c-dcee-46b7-b71c-8c7dac2db85b@arm.com>
Date: Fri, 8 Aug 2025 08:11:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 25/36] arm_mpam: Register and enable IRQs
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
 Rohit Mathew <rohit.mathew@arm.com>,
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
 <20250711183648.30766-26-james.morse@arm.com>
 <20250722160618.0000598f@huawei.com>
Content-Language: en-US
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250722160618.0000598f@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_001133_641191_548D4CBE 
X-CRM114-Status: GOOD (  18.15  )
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

On 22/07/2025 16:06, Jonathan Cameron wrote:
> On Fri, 11 Jul 2025 18:36:37 +0000
> James Morse <james.morse@arm.com> wrote:
>> Register and enable error IRQs. All the MPAM error interrupts indicate a
>> software bug, e.g. out of range partid. If the error interrupt is ever
>> signalled, attempt to disable MPAM.
>>
>> Only the irq handler accesses the ESR register, so no locking is needed.
>> The work to disable MPAM after an error needs to happen at process
>> context, use a threaded interrupt.
>>
>> There is no support for percpu threaded interrupts, for now schedule
>> the work to be done from the irq handler.
>>
>> Enabling the IRQs in the MSC may involve cross calling to a CPU that
>> can access the MSC.

> Sparse gives an imbalance warning in mpam_register_irqs()

>> +static int mpam_register_irqs(void)
>> +{
>> +	int err, irq, idx;
>> +	struct mpam_msc *msc;
>> +
>> +	lockdep_assert_cpus_held();
>> +
>> +	idx = srcu_read_lock(&mpam_srcu);
>> +	list_for_each_entry_srcu(msc, &mpam_all_msc, glbl_list, srcu_read_lock_held(&mpam_srcu)) {
>> +		irq = platform_get_irq_byname_optional(msc->pdev, "error");
>> +		if (irq <= 0)
>> +			continue;
>> +
>> +		/* The MPAM spec says the interrupt can be SPI, PPI or LPI */
>> +		/* We anticipate sharing the interrupt with other MSCs */
>> +		if (irq_is_percpu(irq)) {
>> +			err = request_percpu_irq(irq, &mpam_ppi_handler,
>> +						 "mpam:msc:error",
>> +						 msc->error_dev_id);
>> +			if (err)
>> +				return err;

> Looks like the srcu_read_lock is still held.

Oops,


> There is a DEFINE_LOCK_GUARD_1() in srcu.h so you can do
> 
> 	guard(srcu)(&mpam_srcu, idx);
> 
> I think and not worry about releasing it in errors or the good path.

Sure ... but having the compiler chose when to release locks makes me nervous!


Thanks,

James

