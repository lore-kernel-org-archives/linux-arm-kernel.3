Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A84CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 18:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBr2pJWHRGVkJOgFCzFeV4M4+UcILMvWaX3frPyFFE4=; b=vW4tstq0k3c5TPjTLTx4lvuRcO
	baP5vNVL8s004fnkbRiypVsk6Hve4b32R9Xie36RW0I6tJc6x64scQpeQDn2jf0+Ay3xUHQgsHJi+
	x2hq+Sd8LWSM9bkgt2hYgw+F37Bv12h4SBpEF/BFGk1L7lIFj5vUAbnP5Y+Hwk+DPxQxLXcP7zS6h
	9jSLz8g83AIoqV1EwKhJzHF2KkXRpqZGoW27ToGnuj1BZ88tN6FaxwQEbLqgIZRrYpHlFm5SMkhwi
	ShWTzx5lJnqOy87Spz+JcHoac9hXhA8riKX/AksZXUNC15oN+1T9tdsH0TqLxusYVhpHjZLw0puPm
	gLY3aj0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pZ6-00000008isC-0GUO;
	Fri, 17 Oct 2025 18:52:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pZ3-00000008irH-44Md
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 18:52:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E5271515;
	Fri, 17 Oct 2025 11:52:25 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F01333F66E;
	Fri, 17 Oct 2025 11:51:52 -0700 (PDT)
Message-ID: <53ea0ae3-7ae6-4759-b6f4-6249b71a5ab4@arm.com>
Date: Fri, 17 Oct 2025 19:51:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/29] arm_mpam: Add the class and component structures
 for firmware described ris
To: Fenghua Yu <fenghuay@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Ben Horgan <ben.horgan@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-9-james.morse@arm.com>
 <a0afaae6-0b7c-4a94-9b2a-b09c8016922a@nvidia.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <a0afaae6-0b7c-4a94-9b2a-b09c8016922a@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_115234_083870_EF8A670D 
X-CRM114-Status: GOOD (  28.18  )
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

On 03/10/2025 17:54, Fenghua Yu wrote:
> On 9/10/25 13:42, James Morse wrote:
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

>> +#define add_to_garbage(x)                \
>> +do {                            \
>> +    __typeof__(x) _x = (x);                \
>> +    _x->garbage.to_free = _x;            \
>> +    llist_add(&_x->garbage.llist, &mpam_garbage);    \
>> +} while (0)
>> +static void mpam_free_garbage(void)
>> +{
>> +    struct mpam_garbage *iter, *tmp;
>> +    struct llist_node *to_free = llist_del_all(&mpam_garbage);
>> +
> 
> Should this be protected by mpam_list_lock and check if the lock is held?
> 
> +    lockdep_assert_held(&mpam_list_lock);
> 
> Multiple threads may add and free garbage in parallel. Please see later free_garbage() is
> not protected by any lock.

Indeed - because its using llist instead. That is safe for concurrent use as you can only
consume the whole list in one go with a cmpxchg(val, NULL). In the event of a race, one
gets to own the llist and walk throught it - the other sees an empty list.


> 
>> +    if (!to_free)
>> +        return;
>> +
>> +    synchronize_srcu(&mpam_srcu);
>> +
>> +    llist_for_each_entry_safe(iter, tmp, to_free, llist) {
>> +        if (iter->pdev)
>> +            devm_kfree(&iter->pdev->dev, iter->to_free);
>> +        else
>> +            kfree(iter->to_free);
>> +    }
>> +}

>> +static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
>> +                  enum mpam_class_types type, u8 class_id,
>> +                  int component_id)
>> +{
>> +    int err;
>> +    struct mpam_vmsc *vmsc;
>> +    struct mpam_msc_ris *ris;
>> +    struct mpam_class *class;
>> +    struct mpam_component *comp;
>> +
>> +    lockdep_assert_held(&mpam_list_lock);
>> +
>> +    if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
>> +        return -EINVAL;
>> +
>> +    if (test_and_set_bit(ris_idx, &msc->ris_idxs))
>> +        return -EBUSY;
>> +
> 
> Should setting msc->ris_idxs bit be moved to the end of this function after all error
> handling paths? The reason is this bit is better to be 0 (or recovered) if any error
> happens. It's hard to recover it to 0 for each error handling. The easiest way is to set
> it at the end of the function.

This is an up front test for firmware tables that describe one RIS twice.
No error recovery is needed as this is all this bitfield is used for.


>> +    ris = devm_kzalloc(&msc->pdev->dev, sizeof(*ris), GFP_KERNEL);
>> +    if (!ris)
>> +        return -ENOMEM;
>> +    init_garbage(ris);
>> +
>> +    class = mpam_class_get(class_id, type);
>> +    if (IS_ERR(class))
>> +        return PTR_ERR(class);
>> +
>> +    comp = mpam_component_get(class, component_id);
>> +    if (IS_ERR(comp)) {
>> +        if (list_empty(&class->components))
>> +            mpam_class_destroy(class);
>> +        return PTR_ERR(comp);
>> +    }
>> +
>> +    vmsc = mpam_vmsc_get(comp, msc);
>> +    if (IS_ERR(vmsc)) {
>> +        if (list_empty(&comp->vmsc))
>> +            mpam_comp_destroy(comp);
>> +        return PTR_ERR(vmsc);
>> +    }
>> +
>> +    err = mpam_ris_get_affinity(msc, &ris->affinity, type, class, comp);
>> +    if (err) {
>> +        if (list_empty(&vmsc->ris))
>> +            mpam_vmsc_destroy(vmsc);
>> +        return err;
>> +    }
>> +
>> +    ris->ris_idx = ris_idx;
>> +    INIT_LIST_HEAD_RCU(&ris->vmsc_list);
> 
> vmsc_list will be used but not initialized. Missing INIT_LIST_HEAD_RCU(&ris->msc_list) here?

Fixed,


>> +    ris->vmsc = vmsc;
>> +
>> +    cpumask_or(&comp->affinity, &comp->affinity, &ris->affinity);
>> +    cpumask_or(&class->affinity, &class->affinity, &ris->affinity);
>> +    list_add_rcu(&ris->vmsc_list, &vmsc->ris);
>> +

> Setting the msc->ris_idxs here is better to avoid to clear it in each error handling path.

But misses the error it is supposed to catch...


>> +    return 0;
>> +}
>> +
>> @@ -74,10 +469,10 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
>>           return;
>>         mutex_lock(&mpam_list_lock);
>> -    platform_set_drvdata(pdev, NULL);
>> -    list_del_rcu(&msc->all_msc_list);
>> -    synchronize_srcu(&mpam_srcu);
>> +    mpam_msc_destroy(msc);
>>       mutex_unlock(&mpam_list_lock);
>> +
>> +    mpam_free_garbage();
> 
> Should mpam_free_garbage() be protected by mpam_list_lock? It may race with adding
> garbage. I can see other adding and freeing garbage are protected by mpam_list_lock but
> not this one.

No - it uses llist and is part of the deferred freeing, it should not need any locks.


Thanks,

James

