Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CF3CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 18:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGTWs00Kfioopah64enZSg3nTLaoJJTg/Put8luH4pQ=; b=kCyu7wyXr4lnyp4xyX3kcAwVVx
	qf+gYP6Teai36LTXtPt05qCWvi99ZpX7bavJOo/BGzdv55K9+yTibGk4WJY0IeUgpJY0CgqCRQLn4
	xzIhxXLxXCabLVOqsMNsAwXU1kQmKboGcVZ5pl/kQkFY9RZJjsyxjyQbreBXkhxKeQq0a8UCH6yhQ
	9Z+JGMzIc+jDolV1VV0qMkWNSq76uK+QG927q8KTXJYwnkQusAsL7gj7yyWpD17f5fKI1BL3zQlbX
	m/3k8kdVQ+m23lm0CLKbKd0fqHhvieV+YkC5GsGNqQ050pWfC/JhoM0B36tlY3AUuus/rRN5aheFT
	neGrFmzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Ne0-0000000AyIR-24xC;
	Thu, 02 Oct 2025 18:03:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Ndy-0000000AyGq-240q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 18:03:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9671A1CE0;
	Thu,  2 Oct 2025 11:02:57 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF3863F66E;
	Thu,  2 Oct 2025 11:03:00 -0700 (PDT)
Message-ID: <9d21e5ca-5f35-44de-a11e-194f34dd8ff2@arm.com>
Date: Thu, 2 Oct 2025 19:02:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/29] arm_mpam: Register and enable IRQs
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
 <20250910204309.20751-19-james.morse@arm.com>
 <20250912131219.00000938@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250912131219.00000938@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_110306_613040_A8D8D850 
X-CRM114-Status: GOOD (  27.97  )
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

On 12/09/2025 13:12, Jonathan Cameron wrote:
> On Wed, 10 Sep 2025 20:42:58 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> Register and enable error IRQs. All the MPAM error interrupts indicate a
>> software bug, e.g. out of range partid. If the error interrupt is ever
>> signalled, attempt to disable MPAM.
>>
>> Only the irq handler accesses the ESR register, so no locking is needed.
>> The work to disable MPAM after an error needs to happen at process
>> context as it takes mutex. It also unregisters the interrupts, meaning
>> it can't be done from the threaded part of a threaded interrupt.
>> Instead, mpam_disable() gets scheduled.
>>
>> Enabling the IRQs in the MSC may involve cross calling to a CPU that
>> can access the MSC.
>>
>> Once the IRQ is requested, the mpam_disable() path can be called
>> asynchronously, which will walk structures sized by max_partid. Ensure
>> this size is fixed before the interrupt is requested.

>> @@ -1318,11 +1405,172 @@ static void mpam_enable_merge_features(struct list_head *all_classes_list)
>>  	}
>>  }
>>  
>> +static char *mpam_errcode_names[16] = {
>> +	[0] = "No error",
> 
> I think you had a bunch of defines for these in an earlier patch.  Can we use
> that to index here instead of [0] etc. 

Sure,


>> +	[1] = "PARTID_SEL_Range",
>> +	[2] = "Req_PARTID_Range",
>> +	[3] = "MSMONCFG_ID_RANGE",
>> +	[4] = "Req_PMG_Range",
>> +	[5] = "Monitor_Range",
>> +	[6] = "intPARTID_Range",
>> +	[7] = "Unexpected_INTERNAL",
>> +	[8] = "Undefined_RIS_PART_SEL",
>> +	[9] = "RIS_No_Control",
>> +	[10] = "Undefined_RIS_MON_SEL",
>> +	[11] = "RIS_No_Monitor",
>> +	[12 ... 15] = "Reserved"
>> +};
> 
> 
>> +static void mpam_unregister_irqs(void)
>> +{
>> +	int irq, idx;
>> +	struct mpam_msc *msc;
>> +
>> +	cpus_read_lock();
> 
> 	guard(cpus_read_lock)();
> 	guard(srcu)(&mpam_srcu);

Sure, looks like I didn't realise there was a cpus_read_lock version of this when I went
looking for places to add this.


>> +	/* take the lock as free_irq() can sleep */

The comment gets dropped as this mattered for an earlier locking scheme. (but free_irq()
can still sleep)


>> +	idx = srcu_read_lock(&mpam_srcu);
>> +	list_for_each_entry_srcu(msc, &mpam_all_msc, all_msc_list,
>> +				 srcu_read_lock_held(&mpam_srcu)) {
>> +		irq = platform_get_irq_byname_optional(msc->pdev, "error");
>> +		if (irq <= 0)
>> +			continue;
>> +
>> +		if (test_and_clear_bit(MPAM_ERROR_IRQ_HW_ENABLED, &msc->error_irq_flags))
>> +			mpam_touch_msc(msc, mpam_disable_msc_ecr, msc);
>> +
>> +		if (test_and_clear_bit(MPAM_ERROR_IRQ_REQUESTED, &msc->error_irq_flags)) {
>> +			if (irq_is_percpu(irq)) {
>> +				msc->reenable_error_ppi = 0;
>> +				free_percpu_irq(irq, msc->error_dev_id);
>> +			} else {
>> +				devm_free_irq(&msc->pdev->dev, irq, msc);
>> +			}
>> +		}
>> +	}
>> +	srcu_read_unlock(&mpam_srcu, idx);
>> +	cpus_read_unlock();
>> +}

>> @@ -1332,6 +1580,27 @@ static void mpam_enable_once(void)
>>  	partid_max_published = true;
>>  	spin_unlock(&partid_max_lock);
>>  
>> +	/*
>> +	 * If all the MSC have been probed, enabling the IRQs happens next.
>> +	 * That involves cross-calling to a CPU that can reach the MSC, and
>> +	 * the locks must be taken in this order:
>> +	 */
>> +	cpus_read_lock();
>> +	mutex_lock(&mpam_list_lock);
>> +	mpam_enable_merge_features(&mpam_classes);
>> +
>> +	err = mpam_register_irqs();
>> +	if (err)
>> +		pr_warn("Failed to register irqs: %d\n", err);
> 
> Perhaps move the print into the if (err) below?

More types of error get later, and its maybe useful to know which of these failed.


>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>> index 6e047fbd3512..f04a9ef189cf 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -32,6 +32,10 @@ struct mpam_garbage {
>>  	struct platform_device	*pdev;
>>  };
>>  
>> +/* Bit positions for error_irq_flags */
>> +#define	MPAM_ERROR_IRQ_REQUESTED  0
>> +#define	MPAM_ERROR_IRQ_HW_ENABLED 1
> 
> If there aren't going to be load more of these (I've not really thought
> about whether there might) then using a bitmap for these seems to add complexity
> that we wouldn't see with 
> bool error_irq_req;
> bool error_irq_hw_enabled;

It's a bitmap so that mpam_unregister_irqs() can use test_and_clear_bit() on them,
because with a real interrupt mpam_unregister_irqs() can run multiple times in parallel
with itself.
Doing this as bools would mean having a mutex to prevent that from happening.

I'll do that as its a slightly simpler.


Thanks,

James

