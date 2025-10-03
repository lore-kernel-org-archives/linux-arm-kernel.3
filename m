Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B29CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 18:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfgh+rMDTBoily0sJrLGPj3ihI4LmKMhJ3/h56zR/zE=; b=eHHYXvE9IAMA74c7yVJ4Eql2yi
	ghlnpR1YVTsrr/3eX8Va92t9iJ1nePvi83vMyTzrrTF+oFK4vigZ0tRloyC+JBu0dfmfX8rKAetGI
	Ijlp0xEFfWR2AlaOOlPoFefMA0ySeQAlof6EhqVZU6DYFVpocKcS+HDiFesKuJeiTeMdiMxV+EhVE
	CBpHM2NhWdAtqTUu96HorDVfIxK+h1ZrZpp/7coi+VNGg1ysJmJxF1c9GFL5Ut8KK/hjvAuEOlRNE
	djUxrsb/TMpv8FTLnlIF4qCeRi7GDJmQmuhyWVvHaaADy12JRDku2uAImTYP5Fiqvs1YHPJrLvwao
	lyK16ErA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4k7m-0000000CtVr-32F5;
	Fri, 03 Oct 2025 18:03:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4k7j-0000000CtUl-3qhb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 18:03:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 057321596;
	Fri,  3 Oct 2025 11:03:11 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15F0B3F5A1;
	Fri,  3 Oct 2025 11:03:13 -0700 (PDT)
Message-ID: <b1e1c98b-d6ca-4d47-b33a-e3af8457c4fd@arm.com>
Date: Fri, 3 Oct 2025 19:03:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/29] arm_mpam: Register and enable IRQs
To: Fenghua Yu <fenghuay@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Xin Hao <xhao@linux.alibaba.com>,
 peternewman@google.com, dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-19-james.morse@arm.com>
 <83ec74cb-02c3-4be4-a182-c2c69619abaf@nvidia.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <83ec74cb-02c3-4be4-a182-c2c69619abaf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_110320_071889_80C3E916 
X-CRM114-Status: GOOD (  15.84  )
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

Hi Fenghua,

On 25/09/2025 07:33, Fenghua Yu wrote:
> On 9/10/25 13:42, James Morse wrote:
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

>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index a9d3c4b09976..e7e4afc1ea95 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -1318,11 +1405,172 @@ static void mpam_enable_merge_features(struct list_head

>> +static void mpam_unregister_irqs(void)
>> +{
>> +    int irq, idx;
>> +    struct mpam_msc *msc;
>> +
>> +    cpus_read_lock();
>> +    /* take the lock as free_irq() can sleep */
>> +    idx = srcu_read_lock(&mpam_srcu);

> guard(srcu)(&mpam_srcu);

Yes - Jonathan already suggested this.


>> +    list_for_each_entry_srcu(msc, &mpam_all_msc, all_msc_list,
>> +                 srcu_read_lock_held(&mpam_srcu)) {
>> +        irq = platform_get_irq_byname_optional(msc->pdev, "error");
>> +        if (irq <= 0)
>> +            continue;
>> +
>> +        if (test_and_clear_bit(MPAM_ERROR_IRQ_HW_ENABLED, &msc->error_irq_flags))
>> +            mpam_touch_msc(msc, mpam_disable_msc_ecr, msc);
>> +
>> +        if (test_and_clear_bit(MPAM_ERROR_IRQ_REQUESTED, &msc->error_irq_flags)) {
>> +            if (irq_is_percpu(irq)) {
>> +                msc->reenable_error_ppi = 0;
>> +                free_percpu_irq(irq, msc->error_dev_id);
>> +            } else {
>> +                devm_free_irq(&msc->pdev->dev, irq, msc);
>> +            }
>> +        }
>> +    }
>> +    srcu_read_unlock(&mpam_srcu, idx);
>> +    cpus_read_unlock();
>> +}


James

