Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49225CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 18:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ODGH/+njiEiC3L6mPwG/6t7Cr+NSv+crwhoZU5dUFk=; b=vb1eKau3EqXJqKM0E7irifV303
	+KXRIw5A7M3E+jTnpGS6BJELMtU/ob7Y40CUH08Y4O/inz5Q9nOlVZ9SNKWCK3+/oGVsVA/ZIlRsK
	12VIKB07YHAJlwRQ+NwVy3floP/ONylKVefJQ7CG/prGJ+N1G7fdbMWFP6wb8RJzfvDuYq2oGwJi3
	QZMCl4HRJnnhnlQ/HHsTOW3HWZdtGygOYsHLWs3BmSfaigLL4yU6JBBr8GQsePz7mSR4skyUiCgGV
	Wky6B5jk9QePH1jTyjUe/h4X+1w2l7kTZ4vsrFPa5H6Xd4dy5h4lTUKsdPdWlB8A/F4inW0D9r5y/
	zZT9pHAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9paS-00000008jF7-1jvW;
	Fri, 17 Oct 2025 18:54:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9paN-00000008jDx-0Fah
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 18:53:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A93AF1515;
	Fri, 17 Oct 2025 11:53:46 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB1733F66E;
	Fri, 17 Oct 2025 11:53:48 -0700 (PDT)
Message-ID: <e1874826-2f18-4fae-b83d-cf099c0cf1e6@arm.com>
Date: Fri, 17 Oct 2025 19:51:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/29] arm_mpam: Add the class and component structures
 for firmware described ris
To: Gavin Shan <gshan@redhat.com>, linux-kernel@vger.kernel.org,
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
 Danilo Krummrich <dakr@kernel.org>, Ben Horgan <ben.horgan@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-9-james.morse@arm.com>
 <a66c6df0-f5e7-4704-a341-d34d07b8c6e1@redhat.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <a66c6df0-f5e7-4704-a341-d34d07b8c6e1@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_115355_257889_FBD5F356 
X-CRM114-Status: GOOD (  18.82  )
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

Hi Gavin,

On 07/10/2025 00:13, Gavin Shan wrote:
> On 9/11/25 6:42 AM, James Morse wrote:
>> An MSC is a container of resources, each identified by their RIS index.
>> Some RIS are described by firmware to provide their position in the system.
>> Others are discovered when the driver probes the hardware.
>>
>> To configure a resource it needs to be found by its class, e.g. 'L2'.
>> There are two kinds of grouping, a class is a set of components, which
>> are visible to user-space as there are likely to be multiple instances
>> of the L2 cache. (e.g. one per cluster or package)
>>
>> Add support for creating and destroying structures to allow a hierarchy
>> of resources to be created.

>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index efc4738e3b4d..c7f4981b3545 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c

>> +static struct mpam_class *
>> +mpam_class_get(u8 level_idx, enum mpam_class_types type)
>> +{
>> +    bool found = false;
>> +    struct mpam_class *class;
>> +
>> +    lockdep_assert_held(&mpam_list_lock);
>> +
>> +    list_for_each_entry(class, &mpam_classes, classes_list) {
>> +        if (class->type == type && class->level == level_idx) {
>> +            found = true;
>> +            break;
>> +        }
>> +    }
>> +
>> +    if (found)
>> +        return class;
>> +
>> +    return mpam_class_alloc(level_idx, type);
>> +}
>> +
> 
> The variable @found can be avoided if the found class can be returned immediately.
> 
>     list_for_each_entry(class, &mpam_classes, classes_list) {
>         if (class->type == type && class->level == level_idx)
>             return class;
>     }
> 
>     return mpam_class_alloc(level_idx, type);

Yes, feedback like this already came from Jonathan.


>> +static int mpam_ris_get_affinity(struct mpam_msc *msc, cpumask_t *affinity,
>> +                 enum mpam_class_types type,
>> +                 struct mpam_class *class,
>> +                 struct mpam_component *comp)
>> +{
>> +    int err;
>> +
>> +    switch (type) {
>> +    case MPAM_CLASS_CACHE:
>> +        err = mpam_get_cpumask_from_cache_id(comp->comp_id, class->level,
>> +                             affinity);
>> +        if (err)
>> +            return err;
>> +
>> +        if (cpumask_empty(affinity))
>> +            pr_warn_once("%s no CPUs associated with cache node",
>> +                     dev_name(&msc->pdev->dev));
>> +
>> +        break;
> 
> "\n" missed in the error message and dev_warn_once() can be used:
> 
>         if (cpumask_empty(affinity))
>             dev_warn_once(&msc->pdev->dev, "No CPUs associated with cache node\n");

Yup, I'd mopped up most of these but missed this one.


>> +    case MPAM_CLASS_MEMORY:
>> +        get_cpumask_from_node_id(comp->comp_id, affinity);
>> +        /* affinity may be empty for CPU-less memory nodes */
>> +        break;
>> +    case MPAM_CLASS_UNKNOWN:
>> +        return 0;
>> +    }
>> +
>> +    cpumask_and(affinity, affinity, &msc->accessibility);
>> +
>> +    return 0;
>> +}


Thanks,

James

