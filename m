Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AC2CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 17:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a4czRjHc/m3cFCAVulkLbL5W2OuaXjbij7kLOHWaD7g=; b=40/v5OKGF5wVyC41ZqpUhXfkxN
	7oqhYytv1DhJ7ydCe0FpM2aAODzboZ6yJoneLGaFQGg1wUi5iNbo/y7oRZhewq9g7+aLWMhvqCVGo
	o9BCqYWwCJ5Hle2liIwCKUjneZFTfpiiohS6kuoigqW/ZN52+t1sV6Hsov8Zobfcbhby1s4DG1MFV
	2MfLql7BmnTO/DbMHaO8QHK05OrUyYkNZoFz5scmaHB+3Fl1+l6iUQvzd+CxpW/jnYJbq3nCHFiCW
	LZPWL+0mbXDiza0Mn+PfCVT1L8+1B35VakuwrBqeS9SawdVDcqiiiZ0lY8Dd6FbJmfeqXpNFs05XR
	/aNz3JvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH41C-0000000G2o2-0h6J;
	Thu, 06 Nov 2025 17:43:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH419-0000000G2ms-3BR5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 17:43:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A36A1596;
	Thu,  6 Nov 2025 09:43:19 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3888C3F694;
	Thu,  6 Nov 2025 09:43:22 -0800 (PST)
Message-ID: <8fada9f2-7aca-44e7-adc9-3d0e7a363baf@arm.com>
Date: Thu, 6 Nov 2025 17:43:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/29] arm_mpam: Add the class and component structures
 for firmware described ris
To: Jonathan Cameron <jonathan.cameron@huawei.com>,
 James Morse <james.morse@arm.com>
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
 Danilo Krummrich <dakr@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Gavin Shan <gshan@redhat.com>
References: <20251017185645.26604-1-james.morse@arm.com>
 <20251017185645.26604-9-james.morse@arm.com>
 <20251024174712.000051b6@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251024174712.000051b6@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_094327_885045_1F9DC065 
X-CRM114-Status: GOOD (  29.58  )
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

On 10/24/25 17:47, Jonathan Cameron wrote:
> n Fri, 17 Oct 2025 18:56:24 +0000
> James Morse <james.morse@arm.com> wrote:
> 
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
>>
>> CC: Ben Horgan <ben.horgan@arm.com>
>> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
> A few minor things inline.  Mostly code ordering related to make
> it easier to review!
> 
>> ---
>>  drivers/resctrl/mpam_devices.c  | 390 +++++++++++++++++++++++++++++++-
>>  drivers/resctrl/mpam_internal.h |  93 ++++++++
>>  include/linux/arm_mpam.h        |   8 +-
>>  3 files changed, 483 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index d18eeec95f79..8685e50f08c6 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -30,7 +30,7 @@
>>  static DEFINE_MUTEX(mpam_list_lock);
>>  static LIST_HEAD(mpam_all_msc);
>>  
>> -static struct srcu_struct mpam_srcu;
>> +struct srcu_struct mpam_srcu;
> 
> Meh. Others may be fussier about this but I'd rather you just
> added the extern when this was first introduced and didn't
> have this churn here.

I've dropped the static earlier now.

> 
> 
>> +static void mpam_vmsc_destroy(struct mpam_vmsc *vmsc)
>> +{
>> +	struct mpam_component *comp = vmsc->comp;
>> +
>> +	lockdep_assert_held(&mpam_list_lock);
>> +
>> +	list_del_rcu(&vmsc->comp_list);
>> +	add_to_garbage(vmsc);
>> +
>> +	if (list_empty(&comp->vmsc))
>> +		mpam_comp_destroy(comp);
>> +}
>> +
>> +static void mpam_ris_destroy(struct mpam_msc_ris *ris)
> I'd rather see the create / destroy next to each other if possible.
> Makes it easier to check this unwinds the creat path.

I've done this.

> 
>> +{
>> +	struct mpam_vmsc *vmsc = ris->vmsc;
>> +	struct mpam_msc *msc = vmsc->msc;
>> +	struct mpam_component *comp = vmsc->comp;
>> +	struct mpam_class *class = comp->class;
>> +
>> +	lockdep_assert_held(&mpam_list_lock);
>> +
>> +	/*
>> +	 * It is assumed affinities don't overlap. If they do the class becomes
>> +	 * unusable immediately.
>> +	 */
>> +	cpumask_andnot(&comp->affinity, &comp->affinity, &ris->affinity);
>> +	cpumask_andnot(&class->affinity, &class->affinity, &ris->affinity);
>> +	clear_bit(ris->ris_idx, &msc->ris_idxs);
>> +	list_del_rcu(&ris->vmsc_list);
>> +	list_del_rcu(&ris->msc_list);
> Can you reorder these so that they are reverse of what happens in create path?
> Makes not real difference other than slightly easier to check everything is done.
> Right now I'm failing to spot where this was added to ris->msc_list in the
> create path.

Yes, it is cleaner like that.

> 
> 
>> +	add_to_garbage(ris);
>> +
>> +	if (list_empty(&vmsc->ris))
>> +		mpam_vmsc_destroy(vmsc);
>> +}
>> +
> 
>> +
>> +/*
>> + * The cacheinfo structures are only populated when CPUs are online.
>> + * This helper walks the device tree to include offline CPUs too.
> 
> Comment stale?  It does walk a tree of devices but I'm not sure that's
> what people will read device tree as meaning.

Dropped.

> 
>> + */
>> +int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
>> +				   cpumask_t *affinity)
>> +{
>> +	return acpi_pptt_get_cpumask_from_cache_id(cache_id, affinity);
>> +}
> 
>> +
>> +static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
>> +				  enum mpam_class_types type, u8 class_id,
>> +				  int component_id)
>> +{
> ...
> 
>> +	ris = devm_kzalloc(&msc->pdev->dev, sizeof(*ris), GFP_KERNEL);
>> +	if (!ris)
>> +		return -ENOMEM;
>> +	init_garbage(&ris->garbage);
>> +	ris->garbage.pdev = pdev;
> I wonder if it's cleaner to just pass the pdev (sometimes null) in
> as a parameter to init_garbage()

Maybe... but I've left it as is for now.

>> +
>> +	class = mpam_class_find(class_id, type);
>> +	if (IS_ERR(class))
>> +		return PTR_ERR(class);
> 
> 
> 
>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>> index 6ac75f3613c3..1a5d96660382 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
> 
>> +/*
>> + * Structures protected by SRCU may not be freed for a surprising amount of
>> + * time (especially if perf is running). To ensure the MPAM error interrupt can
>> + * tear down all the structures, build a list of objects that can be gargbage
> 
> Spell check.  garbage

Ack.

> 
>> + * collected once synchronize_srcu() has returned.
>> + * If pdev is non-NULL, use devm_kfree().
>> + */
>> +struct mpam_garbage {
>> +	/* member of mpam_garbage */
>> +	struct llist_node	llist;
>> +
>> +	void			*to_free;
>> +	struct platform_device	*pdev;
>> +};
> 

Thanks,

Ben


