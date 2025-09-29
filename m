Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFED7CCA468
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 17:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1l9IfLP3+rrA1UJ5hrFOAryqrmCaYK5XKLxN/haV5wc=; b=0SwctCbLpvK+QwNXsCjtg6O+5a
	QTUVvINiRGX+xR/3tCvpmSCeeSlzepV+gEiOQVKea3OJL2kvDyfzDdds/HZoe/MZh4ZItHFjDTJaf
	Qj+ujlyMd+H3rWqS81jbaFsznHh+LSBguKDvW13tErJgJmF/yvwLMRAOlipOVeSkUbI69a0yfenbm
	ii7UsjBGoROmtU4UwKITXA4+9mistzgbaq64xarRge5cUNPr19HPyA6Z9QYBXuPQu/FuIMIBkdrFC
	rAuuq3hKCPFMbH5RL7L9HOVpiwqodoPaTP4DA6WEIwXAA7iJ1dQMw//iFk/eU44gFptfOYJ/LeGeR
	6EqiKZ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3HvP-000000039kv-2lng;
	Mon, 29 Sep 2025 17:44:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3HvL-000000039iH-3WlX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 17:44:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C286150C;
	Mon, 29 Sep 2025 10:44:23 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2F473F59E;
	Mon, 29 Sep 2025 10:44:25 -0700 (PDT)
Message-ID: <31c1cea8-8265-4d86-b9a7-d8f8955405bf@arm.com>
Date: Mon, 29 Sep 2025 18:44:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/29] arm_mpam: Add cpuhp callbacks to probe MSC
 hardware
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
 Danilo Krummrich <dakr@kernel.org>, Lecopzer Chen <lecopzerc@nvidia.com>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-11-james.morse@arm.com>
 <20250911160737.0000492f@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250911160737.0000492f@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_104431_965789_93620470 
X-CRM114-Status: GOOD (  28.74  )
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

On 11/09/2025 16:07, Jonathan Cameron wrote:
> On Wed, 10 Sep 2025 20:42:50 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> Because an MSC can only by accessed from the CPUs in its cpu-affinity
>> set we need to be running on one of those CPUs to probe the MSC
>> hardware.
>>
>> Do this work in the cpuhp callback. Probing the hardware will only
>> happen before MPAM is enabled, walk all the MSCs and probe those we can
>> reach that haven't already been probed as each CPU's online call is made.
>>
>> This adds the low-level MSC register accessors.
>>
>> Once all MSCs reported by the firmware have been probed from a CPU in
>> their respective cpu-affinity set, the probe-time cpuhp callbacks are
>> replaced.  The replacement callbacks will ultimately need to handle
>> save/restore of the runtime MSC state across power transitions, but for
>> now there is nothing to do in them: so do nothing.
>>
>> The architecture's context switch code will be enabled by a static-key,
>> this can be set by mpam_enable(), but must be done from process context,
>> not a cpuhp callback because both take the cpuhp lock.
>> Whenever a new MSC has been probed, the mpam_enable() work is scheduled
>> to test if all the MSCs have been probed. If probing fails, mpam_disable()
>> is scheduled to unregister the cpuhp callbacks and free memory.

> Trivial suggestion inline. Either way
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Thanks!


>> +/* Before mpam is enabled, try to probe new MSC */
>> +static int mpam_discovery_cpu_online(unsigned int cpu)
>> +{
>> +	int err = 0;
>> +	struct mpam_msc *msc;
>> +	bool new_device_probed = false;
>> +
>> +	guard(srcu)(&mpam_srcu);
>> +	list_for_each_entry_srcu(msc, &mpam_all_msc, all_msc_list,
>> +				 srcu_read_lock_held(&mpam_srcu)) {
>> +		if (!cpumask_test_cpu(cpu, &msc->accessibility))
>> +			continue;
>> +
>> +		mutex_lock(&msc->probe_lock);
>> +		if (!msc->probed)
>> +			err = mpam_msc_hw_probe(msc);
>> +		mutex_unlock(&msc->probe_lock);
>> +
>> +		if (!err)
>> +			new_device_probed = true;
>> +		else
>> +			break;

> Unless this going to get more complex why not
> 
> 		if (err)
> 			break;
> 
> 		new_device_probed = true;

Sure - its been both simpler and more complex in the past!


>> +	}
>> +
>> +	if (new_device_probed && !err)
>> +		schedule_work(&mpam_enable_work);
>> +	if (err) {
>> +		mpam_disable_reason = "error during probing";
>> +		schedule_work(&mpam_broken_work);
>> +	}
>> +
>> +	return err;
>> +}
> 
>> +static void mpam_enable_once(void)
>> +{
>> +	mpam_register_cpuhp_callbacks(mpam_cpu_online, mpam_cpu_offline);
>> +
>> +	pr_info("MPAM enabled\n");

> Feels too noisy given it should be easy enough to tell. pr_dbg() perhaps.

I was aiming for the driver to only print one thing - once all the hardware has been
probed. Once the driver is assembled, this prints the number of PARTID/PMG that were
discovered as the system wide limits.

The reason to print something is that if you see this message, but don't have resctrl
appear in /proc/filesystems - its never going to appear because the resctrl glue code
couldn't find anything it could use. As this isn't an error, so nothing gets printed in
this case.
This is the most common complaint I get - "our platform doesn't look like a Xeon - why
doesn't resctrl work with it?"

It also matters for other requesters, like the SMMU. If they probe after this point, they
can't reduce the PARTID/PMG range - and may get an error and have their MPAM abilities
disabled. Having an entry in the boot log makes this easier to debug.


The alternative would be to keep track of what the driver is up to, and expose that
through debugfs - but information that only exists for debug purposes is likely to be
wrong. It also doesn't help work out what order different drivers tried to probe in.


Thanks,

James

