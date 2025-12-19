Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBE0D767F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 12:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6V2M7acUqd76BYeNHdW1k0N+Q8mKr4RiW5uTFwn79M=; b=C/Xe4aAmwYqqc6RjUG+r9FVqp/
	GFmw/kGcMXb8ki4p4MQFObpqvD3FhhCxvGkGgevCBKyG8hx3hb+iUZlKYYOVMDgBxPDkdyIqP6BEy
	XOImr3AVCL5dZC/HDlYJpRqcZJYwVqL1xxMIuusKtxwaKuNtfazj6SW44ix2xDs5yyBr/Wd2Q5Eh6
	nx5GGwxHupEBLWqY4BnV1X/aAtifYTC0GcuFdVGUmvPQA64uLJlSMFFvkvQUGd16D6sO6hpLpIbwT
	tb3CGLfnWrznBkziBFsqL754e5zsGNqC2DPl3b1qyJ1OPRIy3ukQKs2vptV4Kx1C3ecRgGX5SZFno
	7sOuGOUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZDW-0000000AFbY-2vz8;
	Fri, 19 Dec 2025 12:04:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZDU-0000000AFam-2eQW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 12:04:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38FAFFEC;
	Fri, 19 Dec 2025 04:04:08 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EFA803F5CA;
	Fri, 19 Dec 2025 04:04:11 -0800 (PST)
Message-ID: <931de5fc-d208-443d-a266-5cff580a66c0@arm.com>
Date: Fri, 19 Dec 2025 12:04:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 08/38] arm_mpam: resctrl: Pick the caches we will use
 as resctrl resources
To: Jonathan Cameron <jonathan.cameron@huawei.com>,
 James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com, Gavin Shan <gshan@redhat.com>,
 rohit.mathew@arm.com, reinette.chatre@intel.com,
 Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-9-james.morse@arm.com>
 <20251218113815.000055e7@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251218113815.000055e7@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_040416_773563_3221F264 
X-CRM114-Status: GOOD (  27.43  )
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

On 12/18/25 11:38, Jonathan Cameron wrote:
> On Fri, 5 Dec 2025 21:58:31 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> Systems with MPAM support may have a variety of control types at any
>> point of their system layout. We can only expose certain types of
>> control, and only if they exist at particular locations.
>>
>> Start with the well-know caches. These have to be depth 2 or 3
>> and support MPAM's cache portion bitmap controls, with a number
>> of portions fewer than resctrl's limit.
> 
> Another one that is a bit random on wrap point.  Probably worth tidying
> up formatting of all the commit messages so fussy people like me stop
> moaning ;)

Will do.

> 
> Otherwise trivial stuff inline.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> ---
>>  drivers/resctrl/mpam_resctrl.c | 91 +++++++++++++++++++++++++++++++++-
>>  1 file changed, 89 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 320cebbd37ce..ceaf11af4fc1 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -60,10 +60,96 @@ struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
>>  	return &mpam_resctrl_controls[l].resctrl_res;
>>  }
>>  
>> +static bool cache_has_usable_cpor(struct mpam_class *class)
>> +{
>> +	struct mpam_props *cprops = &class->props;
>> +
>> +	if (!mpam_has_feature(mpam_feat_cpor_part, cprops))
>> +		return false;
>> +
>> +	/* resctrl uses u32 for all bitmap configurations */
>> +	return (class->props.cpbm_wd <= 32);
> 
> For me those brackets aren't adding anything. It's not like
> anyone forgets precedence wrt return vs operators.
> 
>> +}
>> +
>> +/* Test whether we can export MPAM_CLASS_CACHE:{2,3}? */
>> +static void mpam_resctrl_pick_caches(void)
>> +{
>> +	struct mpam_class *class;
>> +	struct mpam_resctrl_res *res;
>> +
>> +	lockdep_assert_cpus_held();
>> +
>> +	guard(srcu)(&mpam_srcu);
>> +	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
>> +				 srcu_read_lock_held(&mpam_srcu)) {
>> +		if (class->type != MPAM_CLASS_CACHE) {
>> +			pr_debug("class %u is not a cache\n", class->level);
> 
> Lots of things aren't caches and seems unlikely that is a case that will
> make people wonder why pick caches didn't happen. So maybe this debug
> print is excessive?

Only memory or cache so far. I'll leave it here for now.

> 
>> +			continue;
>> +		}
>> +
>> +		if (class->level != 2 && class->level != 3) {
>> +			pr_debug("class %u is not L2 or L3\n", class->level);
>> +			continue;
>> +		}
>> +
>> +		if (!cache_has_usable_cpor(class)) {
>> +			pr_debug("class %u cache misses CPOR\n", class->level);
>> +			continue;
>> +		}
>> +
>> +		if (!cpumask_equal(&class->affinity, cpu_possible_mask)) {
>> +			pr_debug("class %u has missing CPUs\n", class->level);
>> +			pr_debug("class %u mask %*pb != %*pb\n", class->level,
>> +				 cpumask_pr_args(&class->affinity),
>> +				 cpumask_pr_args(cpu_possible_mask));
> 
> Unless this is getting more complex in later patches, doesn't seem like
> 			pr_debug("class %u has missing CPUs, mask %*pb != %*pb\n",
> is too much to put on one line.

Done.

> 
> 					 
>> +			continue;
>> +		}
>> +
>> +		if (class->level == 2)
>> +			res = &mpam_resctrl_controls[RDT_RESOURCE_L2];
>> +		else
>> +			res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
>> +		res->class = class;
>> +		exposed_alloc_capable = true;
>> +	}
>> +}
>> +
>>  static int mpam_resctrl_control_init(struct mpam_resctrl_res *res,
>>  				     enum resctrl_res_level type)
>>  {
>> -	/* TODO: initialise the resctrl resources */
>> +	struct mpam_class *class = res->class;
>> +	struct rdt_resource *r = &res->resctrl_res;
>> +
>> +	switch (res->resctrl_res.rid) {
> 
> 	switch (r->rid) { ?
> 
>> +	case RDT_RESOURCE_L2:
>> +	case RDT_RESOURCE_L3:
>> +		r->alloc_capable = true;
>> +		r->schema_fmt = RESCTRL_SCHEMA_BITMAP;
>> +		r->cache.arch_has_sparse_bitmasks = true;
>> +
>> +		r->cache.cbm_len = class->props.cpbm_wd;
>> +		/* mpam_devices will reject empty bitmaps */
>> +		r->cache.min_cbm_bits = 1;
>> +
>> +		if (r->rid == RDT_RESOURCE_L2) {
>> +			r->name = "L2";
>> +			r->ctrl_scope = RESCTRL_L2_CACHE;
>> +		} else {
>> +			r->name = "L3";
>> +			r->ctrl_scope = RESCTRL_L3_CACHE;
>> +		}
>> +
>> +		/*
>> +		 * Which bits are shared with other ...things...
>> +		 * Unknown devices use partid-0 which uses all the bitmap
>> +		 * fields. Until we configured the SMMU and GIC not to do this
>> +		 * 'all the bits' is the correct answer here.
>> +		 */
>> +		r->cache.shareable_bits = resctrl_get_default_ctrl(r);
>> +		break;
>> +	default:
>> +		break;
>> +	}
>>  
>>  	return 0;
>>  }
>> @@ -286,7 +372,8 @@ int mpam_resctrl_setup(void)
>>  		res->resctrl_res.rid = i;
>>  	}
>>  
>> -	/* TODO: pick MPAM classes to map to resctrl resources */
>> +	/* Find some classes to use for controls */
>> +	mpam_resctrl_pick_caches();
>>  
>>  	/* Initialise the resctrl structures from the classes */
>>  	for (i = 0; i < RDT_NUM_RESOURCES; i++) {
> 

Thanks,

Ben


