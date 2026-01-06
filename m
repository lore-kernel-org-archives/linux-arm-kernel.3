Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088F0C47BEA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 11:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2vDR55DTG2ONme2CDL+cASz9pS3HbjDZ78E0PsapfU=; b=xuVD5M/iLOyYdL71Ru5KsR63hH
	P1xK8wYJJmjRontIhcZCNrBiP7p9FL4UiFZB7/3l6ap0Gb1nhdgt6q+y+F+7puhG3mBQ50N/Qz58D
	y7SFf7LBTD0aVLfXkiwMD/MGM1QvALQzbYkXFj9EepdH7qCfQrvPPzClC/QTJFy3OJ9HXorlcpsSk
	QhC7BK4GFj8oca/Uq4M6rMnRbMn1S8OaW3SOKiNB+vufnLoPZ5vTvRwdA22PnJI74a34kidcjAwEc
	tGytTqACisxct6M3Xj3MSbqsjdBjEXEjmQ3jbGmwLjA6LxyUJ+spfvDwV+cgCOtj/EqKQCzOmYn7n
	ShE0zD1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5DU-0000000CsW1-1S6C;
	Tue, 06 Jan 2026 11:27:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5DS-0000000CsV2-1QpO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 11:27:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40B20497;
	Tue,  6 Jan 2026 03:17:27 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C0B63F5A1;
	Tue,  6 Jan 2026 03:17:29 -0800 (PST)
Message-ID: <c6c0acfa-8a9f-4c97-a116-40a2d20f6827@arm.com>
Date: Tue, 6 Jan 2026 11:17:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/45] arm_mpam: resctrl: Add boilerplate cpuhp and
 domain allocation
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20251219181147.3404071-1-ben.horgan@arm.com>
 <20251219181147.3404071-16-ben.horgan@arm.com>
 <20260105174005.00001ba0@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260105174005.00001ba0@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_032710_462496_9320C812 
X-CRM114-Status: GOOD (  26.84  )
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

On 1/5/26 17:40, Jonathan Cameron wrote:
> On Fri, 19 Dec 2025 18:11:17 +0000
> Ben Horgan <ben.horgan@arm.com> wrote:
> 
>> From: James Morse <james.morse@arm.com>
>>
>> resctrl has its own data structures to describe its resources. We can't use
>> these directly as we play tricks with the 'MBA' resource, picking the MPAM
>> controls or monitors that best apply. We may export the same component as
>> both L3 and MBA.
>>
>> Add mpam_resctrl_exports[] as the array of class->resctrl mappings we are
>> exporting, and add the cpuhp hooks that allocated and free the resctrl
>> domain structures.
>>
>> While we're here, plumb in a few other obvious things.
>>
>> CONFIG_ARM_CPU_RESCTRL is used to allow this code to be built even though
>> it can't yet be linked against resctrl.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>> Domain list is an rcu list
>> Add synchronize_rcu() to free the deleted element
>> Code flow simplification (Jonathan)
> 
> Just trivial stuff and that one what do we loop over thing that
> we continued discussing in the RFC thread (I think you already
> tidied that up)  Nothing here to stop:
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> (which is another way of saying I'm not planning to read it again :)

Yes, I've already made that change locally :) and just added your other
suggestions below.

> 
> 
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> new file mode 100644
>> index 000000000000..4beeeded00ff
>> --- /dev/null
>> +++ b/drivers/resctrl/mpam_resctrl.c
> 
>> +
>> +static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
>> +{
>> +	struct mpam_class *class = comp->class;
>> +
>> +	if (class->type == MPAM_CLASS_CACHE)
>> +		return comp->comp_id;
>> +
>> +	/* TODO: repaint domain ids to match the L3 domain ids */
>> +	/*
>> +	 * Otherwise, expose the ID used by the firmware table code.
> Maybe more turns up in here. Otherwise, easily fits in single line comment.
>> +	 */
>> +	return comp->comp_id;
>> +}
> 
>> +static struct mpam_resctrl_dom *
>> +mpam_resctrl_get_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
>> +{
>> +	struct mpam_resctrl_dom *dom;
>> +	struct rdt_ctrl_domain *ctrl_d;
>> +	struct rdt_resource *r = &res->resctrl_res;
>> +
>> +	lockdep_assert_cpus_held();
>> +
>> +	list_for_each_entry_rcu(ctrl_d, &r->ctrl_domains, hdr.list) {
> 
> As a reminder, though I think you already changed this, discussion carried
> on wrt to the RFC version of this loop.
> 
>> +		dom = container_of(ctrl_d, struct mpam_resctrl_dom,
>> +				   resctrl_ctrl_dom);
>> +
>> +		if (cpumask_test_cpu(cpu, &dom->ctrl_comp->affinity))
>> +			return dom;
>> +	}
>> +
>> +	return NULL;
>> +}
> 
>> +
>> +void mpam_resctrl_offline_cpu(unsigned int cpu)
>> +{
>> +	resctrl_offline_cpu(cpu);
>> +
>> +	guard(mutex)(&domain_list_lock);
>> +	for (int i = 0; i < RDT_NUM_RESOURCES; i++) {
>> +		struct mpam_resctrl_res *res;
>> +		struct mpam_resctrl_dom *dom;
>> +		struct rdt_mon_domain *mon_d;
>> +		struct rdt_ctrl_domain *ctrl_d;
>> +		bool ctrl_dom_empty, mon_dom_empty;
>> +
>> +		res = &mpam_resctrl_controls[i];
>> +		if (!res->class)
>> +			continue;	// dummy resource
>> +
>> +		dom = mpam_resctrl_get_domain_from_cpu(cpu, res);
>> +		if (WARN_ON_ONCE(!dom))
>> +			continue;
>> +
>> +		ctrl_dom_empty = true;
>> +		if (exposed_alloc_capable) {
>> +			ctrl_d = &dom->resctrl_ctrl_dom;
>> +			ctrl_dom_empty = mpam_resctrl_offline_domain_hdr(cpu, &ctrl_d->hdr);
>> +			if (ctrl_dom_empty)
>> +				resctrl_offline_ctrl_domain(&res->resctrl_res, ctrl_d);
>> +		}
> really small thing but I'd do 
> 		} else {
> 			ctrl_dom_empty = true;
> 		}
> here to make it visually obvious why that is set to true. The initialize and override
> if we have more info pattern is to me less readable.
> 
>> +
>> +		mon_dom_empty = true;
>> +		if (exposed_mon_capable) {
>> +			mon_d = &dom->resctrl_mon_dom;
>> +			mon_dom_empty = mpam_resctrl_offline_domain_hdr(cpu, &mon_d->hdr);
>> +			if (mon_dom_empty)
>> +				resctrl_offline_mon_domain(&res->resctrl_res, mon_d);
>> +		}
> Similar for this one.
>> +
>> +		if (ctrl_dom_empty && mon_dom_empty)
>> +			kfree(dom);
>> +	}
>> +}
> 

-- 
Thanks,

Ben


