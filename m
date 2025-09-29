Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0E3CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 17:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjFCpZps/QMJgRTcesKPzrW6emXYgHeUJw7GpoV2dpA=; b=OKlC8h/y5pTjdJ7PidJJHpxAmQ
	WjqebbljW+t6+Wh+KYVDJd32LMjYn5EyjkVt77aFlQn2v7ad7dn6fk6KUO7QM5D6ZhE+NEawdBNcY
	gWFk7Y5imfQ0Yi5gHBUni4FgvxnmqkTQaz7DbzqvF9PttIKvrB/C/0EKvTiz3AoUjd4KxrzFbz3w8
	EGye5MCJ6n9oXWSrwAheg3ebliy7eNrhEo5XOX03UE93X0JbVjd9I2OEvw88lsZ4lWnrE5ImW6WcU
	ras1/gf4Ns9REsRzz8LaxfI19zfQ6iJPWE0aZI0QuXu2qxXeGLceknFdHKArk+npXc1wPGVynw25O
	LD5bG2LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3HwV-00000003AS9-3sQD;
	Mon, 29 Sep 2025 17:45:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Hw8-00000003AEf-2dc3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 17:45:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8993150C;
	Mon, 29 Sep 2025 10:45:11 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48C423F59E;
	Mon, 29 Sep 2025 10:45:14 -0700 (PDT)
Message-ID: <cde5498f-d470-49a3-89b7-6af8bd0f1de7@arm.com>
Date: Mon, 29 Sep 2025 18:45:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/29] arm_mpam: Merge supported features during
 mpam_enable() into mpam_class
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
 Danilo Krummrich <dakr@kernel.org>, Ben Horgan <ben.horgan@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-15-james.morse@arm.com>
 <20250912124937.00004250@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250912124937.00004250@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_104520_812712_79BC9208 
X-CRM114-Status: GOOD (  37.25  )
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

On 12/09/2025 12:49, Jonathan Cameron wrote:
> On Wed, 10 Sep 2025 20:42:54 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> To make a decision about whether to expose an mpam class as
>> a resctrl resource we need to know its overall supported
>> features and properties.
>>
>> Once we've probed all the resources, we can walk the tree
>> and produce overall values by merging the bitmaps. This
>> eliminates features that are only supported by some MSC
>> that make up a component or class.
>>
>> If bitmap properties are mismatched within a component we
>> cannot support the mismatched feature.
>>
>> Care has to be taken as vMSC may hold mismatched RIS.

> A trivial things inline.
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Thanks!


>> +/*
>> + * Combine two props fields.
>> + * If this is for controls that alias the same resource, it is safe to just
>> + * copy the values over. If two aliasing controls implement the same scheme
>> + * a safe value must be picked.
>> + * For non-aliasing controls, these control different resources, and the
>> + * resulting safe value must be compatible with both. When merging values in
>> + * the tree, all the aliasing resources must be handled first.
>> + * On mismatch, parent is modified.
>> + */
>> +static void __props_mismatch(struct mpam_props *parent,
>> +			     struct mpam_props *child, bool alias)
>> +{
>> +	if (CAN_MERGE_FEAT(parent, child, mpam_feat_cpor_part, alias)) {
>> +		parent->cpbm_wd = child->cpbm_wd;
>> +	} else if (MISMATCHED_FEAT(parent, child, mpam_feat_cpor_part,
>> +				   cpbm_wd, alias)) {
>> +		pr_debug("%s cleared cpor_part\n", __func__);
>> +		mpam_clear_feature(mpam_feat_cpor_part, &parent->features);
>> +		parent->cpbm_wd = 0;
>> +	}
>> +
>> +	if (CAN_MERGE_FEAT(parent, child, mpam_feat_mbw_part, alias)) {
>> +		parent->mbw_pbm_bits = child->mbw_pbm_bits;
>> +	} else if (MISMATCHED_FEAT(parent, child, mpam_feat_mbw_part,
>> +				   mbw_pbm_bits, alias)) {
>> +		pr_debug("%s cleared mbw_part\n", __func__);
>> +		mpam_clear_feature(mpam_feat_mbw_part, &parent->features);
>> +		parent->mbw_pbm_bits = 0;
>> +	}
>> +
>> +	/* bwa_wd is a count of bits, fewer bits means less precision */
>> +	if (alias && !mpam_has_bwa_wd_feature(parent) && mpam_has_bwa_wd_feature(child)) {
> 
> Seems like an overly long line given other local wrapping.

Fixed.


>> +		parent->bwa_wd = child->bwa_wd;
>> +	} else if (MISMATCHED_HELPER(parent, child, mpam_has_bwa_wd_feature,
>> +				     bwa_wd, alias)) {

>> +		pr_debug("%s took the min bwa_wd\n", __func__);

These __func__ arguments need to go as pr_fmt has this covered.


>> +		parent->bwa_wd = min(parent->bwa_wd, child->bwa_wd);
>> +	}
>> +
>> +	/* For num properties, take the minimum */
>> +	if (CAN_MERGE_FEAT(parent, child, mpam_feat_msmon_csu, alias)) {
>> +		parent->num_csu_mon = child->num_csu_mon;
>> +	} else if (MISMATCHED_FEAT(parent, child, mpam_feat_msmon_csu,
>> +				   num_csu_mon, alias)) {
>> +		pr_debug("%s took the min num_csu_mon\n", __func__);
>> +		parent->num_csu_mon = min(parent->num_csu_mon, child->num_csu_mon);
>> +	}
>> +
>> +	if (CAN_MERGE_FEAT(parent, child, mpam_feat_msmon_mbwu, alias)) {
>> +		parent->num_mbwu_mon = child->num_mbwu_mon;
>> +	} else if (MISMATCHED_FEAT(parent, child, mpam_feat_msmon_mbwu,
>> +				   num_mbwu_mon, alias)) {
>> +		pr_debug("%s took the min num_mbwu_mon\n", __func__);
>> +		parent->num_mbwu_mon = min(parent->num_mbwu_mon, child->num_mbwu_mon);
>> +	}


>> +
>> +/*
>> + * If a vmsc doesn't match class feature/configuration, do the right thing(tm).
>> + * For 'num' properties we can just take the minimum.
>> + * For properties where the mismatched unused bits would make a difference, we
>> + * nobble the class feature, as we can't configure all the resources.
>> + * e.g. The L3 cache is composed of two resources with 13 and 17 portion
>> + * bitmaps respectively.
>> + */
>> +static void
>> +__class_props_mismatch(struct mpam_class *class, struct mpam_vmsc *vmsc)
> 
> I'm not really sure what the __ prefix denotes here.

Just that its the innards of something and needs comprehending as part of its caller.


>> +{
>> +	struct mpam_props *cprops = &class->props;
>> +	struct mpam_props *vprops = &vmsc->props;
>> +
>> +	lockdep_assert_held(&mpam_list_lock); /* we modify class */
>> +
>> +	pr_debug("%s: Merging features for class:0x%lx &= vmsc:0x%lx\n",
>> +		 dev_name(&vmsc->msc->pdev->dev),
>> +		 (long)cprops->features, (long)vprops->features);

> According to https://docs.kernel.org/core-api/printk-formats.html
> should be fine using %x for u16 values. So why dance through a cast to long?

To isolate it from a subsequent change that makes that field a u32, the existence of which
means one day it'll be a u64. If it ever gets bigger than unsigned-long, it'll need to be
a bitmap array, which would need this code to change. Until then doing, it like this makes
changes to the size less churny.


>> +
>> +	/* Take the safe value for any common features */
>> +	__props_mismatch(cprops, vprops, false);
>> +}
>> +
>> +static void
>> +__vmsc_props_mismatch(struct mpam_vmsc *vmsc, struct mpam_msc_ris *ris)
>> +{
>> +	struct mpam_props *rprops = &ris->props;
>> +	struct mpam_props *vprops = &vmsc->props;
>> +
>> +	lockdep_assert_held(&mpam_list_lock); /* we modify vmsc */
>> +
>> +	pr_debug("%s: Merging features for vmsc:0x%lx |= ris:0x%lx\n",
>> +		 dev_name(&vmsc->msc->pdev->dev),
>> +		 (long)vprops->features, (long)rprops->features);
> 
> Same as above comment on casts being unnecessary.

I expect to have to change this in the future.

As these two debug messages have a dev to hand, they should probably use dev_debug()
instead of manually printing the dev_name().


>> +
>> +	/*
>> +	 * Merge mismatched features - Copy any features that aren't common,
>> +	 * but take the safe value for any common features.
>> +	 */
>> +	__props_mismatch(vprops, rprops, true);
>> +}
>> +
>> +/*
>> + * Copy the first component's first vMSC's properties and features to the
>> + * class. __class_props_mismatch() will remove conflicts.
>> + * It is not possible to have a class with no components, or a component with
>> + * no resources. The vMSC properties have already been built.
> 
> If it's not possible do we need the defensive _or_null and error checks?

This is just paranoia. I've removed it.


>> + */
>> +static void mpam_enable_init_class_features(struct mpam_class *class)
>> +{
>> +	struct mpam_vmsc *vmsc;
>> +	struct mpam_component *comp;
>> +
>> +	comp = list_first_entry_or_null(&class->components,
>> +					struct mpam_component, class_list);
>> +	if (WARN_ON(!comp))
>> +		return;
>> +
>> +	vmsc = list_first_entry_or_null(&comp->vmsc,
>> +					struct mpam_vmsc, comp_list);
>> +	if (WARN_ON(!vmsc))
>> +		return;
>> +
>> +	class->props = vmsc->props;
>> +}
> 
>> +/*
>> + * Merge all the common resource features into class.
>> + * vmsc features are bitwise-or'd together, this must be done first.
> 
> I'm not sure what 'this' is here - I think it's a missing plural that has
> me confused.  Perhaps 'these must be done first.'

The bitwise-or. It's singular because its done for each class/component at a time.

The reason is so that mpam_enable_init_class_features() see's all the features in the
first vmsc, not a subset of them. It's because vmsc hold non-overlapping features, which
is all to support a platform that has two RIS with different types of control that do the
same thing. (made up example:) memory min/max on ingress and memory portions on egress.
Both are memory bandwidth for the same hardware block, but for whatever structural reason,
it gets exposed as separate RIS.

Rephrased as:
| * vmsc features are bitwise-or'd together as the first step so that
| * mpam_enable_init_class_features() can initialise the class with a
| * representive set of features.



>> + * Next the class features are the bitwise-and of all the vmsc features.
>> + * Other features are the min/max as appropriate.
>> + *
>> + * To avoid walking the whole tree twice, the class->nrdy_usec property is
>> + * updated when working with the vmsc as it is a max(), and doesn't need
>> + * initialising first.
> 
> Perhaps state that this comment is about what happens in each call of
> mpam_enable_merge_vmsc_features()  Or move the comment to that function.

Sure. The comment is to try and stop people 'fixing' it to only loop over
class->components once. That'll work on 99% of platforms, but discard all the
controls on a few strange ones.


>> + */
>> +static void mpam_enable_merge_features(struct list_head *all_classes_list)
>> +{
>> +	struct mpam_class *class;
>> +	struct mpam_component *comp;
>> +
>> +	lockdep_assert_held(&mpam_list_lock);
>> +
>> +	list_for_each_entry(class, all_classes_list, classes_list) {
>> +		list_for_each_entry(comp, &class->components, class_list)
>> +			mpam_enable_merge_vmsc_features(comp);
>> +
>> +		mpam_enable_init_class_features(class);
>> +
>> +		list_for_each_entry(comp, &class->components, class_list)
>> +			mpam_enable_merge_class_features(comp);
>> +	}
>> +}
> 
> 


Thanks,

James


