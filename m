Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B72CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 18:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PyG34fBi+WaarUUjeMzLoWwzdQycKHF/YGP2wejwDgo=; b=jyHha8m4qAwGuFGm5aFLtg3ljn
	UyiMKBrNOVyloh8nPWkxbtjJb4+47ds12qtLdLc77aG/f9n5WsBnhksx/ZBA2OBPflZxlp/lRPfzD
	Gpu6H9Cg5XW6+dIAIazTl2+2WM7s1gnL/6KvGni2vXywkhBtUg0Pb6aoO7OKNDeAOZ8Ysg0FUjU7Y
	gQ0lt3Nsfefy6tbWiJoEyfSRlg4U2F88WkdPyRQ0I7NVquK2ZlnboenYX1oI+acg7iq10feByPgR/
	tzvUJ51cBnksna25jbPGK7hMzRum8q6Gz6i+BH8AUTzP2L7OuSZbnQ6CDupMg5rEcIiNuw7rD390T
	pchg99/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4NeA-0000000AySu-1Ukb;
	Thu, 02 Oct 2025 18:03:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Ne8-0000000AyRL-39VG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 18:03:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23F661CE0;
	Thu,  2 Oct 2025 11:03:08 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24C923F66E;
	Thu,  2 Oct 2025 11:03:11 -0700 (PDT)
Message-ID: <3f0894fc-adf8-4465-b1f8-55bb5eab7c5c@arm.com>
Date: Thu, 2 Oct 2025 19:03:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/29] arm_mpam: Register and enable IRQs
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-19-james.morse@arm.com>
 <487a736c-27c8-427c-97d5-31fd2d97e919@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <487a736c-27c8-427c-97d5-31fd2d97e919@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_110316_831882_FFD45BB4 
X-CRM114-Status: GOOD (  17.47  )
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

On 12/09/2025 15:40, Ben Horgan wrote:
> On 9/10/25 21:42, James Morse wrote:
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


>> +static int __setup_ppi(struct mpam_msc *msc)
>> +{
>> +	int cpu;
>> +	struct device *dev = &msc->pdev->dev;
>> +
>> +	msc->error_dev_id = alloc_percpu(struct mpam_msc *);
>> +	if (!msc->error_dev_id)
>> +		return -ENOMEM;
>> +
>> +	for_each_cpu(cpu, &msc->accessibility) {
>> +		struct mpam_msc *empty = *per_cpu_ptr(msc->error_dev_id, cpu);
>> +
>> +		if (empty) {
> 
> I'm confused about how this if conditioned can be satisfied. Isn't the
> alloc clearing msc->error_dev_id for each cpu and then it's only getting
> set for each cpu later in the iteration.

Yes, you're right.

I think this was part of the support for PPI partitions, where multiple partitions would
get set up here. This was a sanity check that they didn't overlap...


I've ripped that out.


>> +			dev_err_once(dev, "MSC shares PPI with %s!\n",
>> +				     dev_name(&empty->pdev->dev));
>> +			return -EBUSY;
>> +		}
>> +		*per_cpu_ptr(msc->error_dev_id, cpu) = msc;
>> +	}
>> +
>> +	return 0;
>> +}

Thanks,

James

