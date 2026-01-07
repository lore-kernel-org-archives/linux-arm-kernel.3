Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8535CFD652
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 15:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hgMqgbgShA2FAhAz0vCbCFPBbTWlqIyAHgQAX9Ujhk=; b=lgdVKLCqM+4HsZZywmQwWSt4ib
	glNR62IWqyph9kUcW2aUtCyBB9nDe3k6LmHKsDWaDXfYiCjIn6ol3WXJZavoqnxrq/NN7ja2LDFHp
	mmMFE8e9iDt1oMAV/PCVcBJF/0aWNBG3NlnpflGep3TqClK2oq52T+NxXC4bppk6y6Mprq9fn6W9e
	LMsDSdBSYtEwVpj4My7ew06lKstmFSCzyoDo4DpkR0jIQOY3uY3R11vi5aZj//AV3j5sNbgXalyal
	jLOLt5GuzyRNJ9bBUf26E7JfXX3BNiKmJdM8Sw1wO3ciOxdNtX9h0051V0qhdZW6muikN/qM76BCQ
	t5pbpV8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVKN-0000000FAGV-1lTI;
	Wed, 07 Jan 2026 15:20:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVKL-0000000FAG3-0WZ9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 15:20:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDE06497;
	Wed,  7 Jan 2026 07:19:51 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C84803F5A1;
	Wed,  7 Jan 2026 07:19:53 -0800 (PST)
Message-ID: <6e1eb268-c7fc-4b36-b641-8fb7e7a42fa1@arm.com>
Date: Wed, 7 Jan 2026 15:19:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 28/45] arm_mpam: resctrl: Pick classes for use as mbm
 counters
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
 <20251219181147.3404071-29-ben.horgan@arm.com>
 <20260106140126.0000558f@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260106140126.0000558f@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_072001_274777_64F3CB05 
X-CRM114-Status: GOOD (  30.67  )
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

On 1/6/26 14:01, Jonathan Cameron wrote:
> On Fri, 19 Dec 2025 18:11:30 +0000
> Ben Horgan <ben.horgan@arm.com> wrote:
> 
>> From: James Morse <james.morse@arm.com>
>>
>> resctrl has two types of counters, NUMA-local and global. MPAM has only
>> bandwidth counters, but the position of the MSC may mean it counts
>> NUMA-local, or global traffic.
>>
>> But the topology information is not available.
>>
>> Apply a heuristic: the L2 or L3 supports bandwidth monitors, these are
>> probably NUMA-local. If the memory controller supports bandwidth monitors,
>> they are probably global.
>>
>> This also allows us to assert that we don't have the same class backing two
>> different resctrl events.
>>
>> Because the class or component backing the event may not be 'the L3', it is
>> necessary for mpam_resctrl_get_domain_from_cpu() to search the monitor
>> domains too. This matters the most for 'monitor only' systems, where 'the
>> L3' control domains may be empty, and the ctrl_comp pointer NULL.
>>
>> resctrl expects there to be enough monitors for every possible control and
>> monitor group to have one. Such a system gets called 'free running' as the
>> monitors can be programmed once and left running.  Any other platform will
>> need to emulate ABMC.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Hi Ben,
> 
> A few minor comments inline. + one question on a worrying sounding todo.
> 
> Jonathan
> 
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 5fde610cc9d7..51caf3b82392 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
> 
> 
> 
>> @@ -925,6 +982,20 @@ static void mpam_resctrl_domain_insert(struct list_head *list,
>>  	list_add_tail_rcu(&new->list, pos);
>>  }
>>  
>> +static struct mpam_component *find_component(struct mpam_class *victim, int cpu)
> 
> This is a lovely generic sounding thing, but then the term victim comes in which
> is very usecase specific.  Maybe something could have a better name? (either
> function or avoid the victim naming).

I'll keep it friendly and drop the victim naming.

> 
>> +{
>> +	struct mpam_component *victim_comp;
>> +
>> +	guard(srcu)(&mpam_srcu);
>> +	list_for_each_entry_srcu(victim_comp, &victim->components, class_list,
>> +				 srcu_read_lock_held(&mpam_srcu)) {
>> +		if (cpumask_test_cpu(cpu, &victim_comp->affinity))
>> +			return victim_comp;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>>  static struct mpam_resctrl_dom *
>>  mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
>>  {
>> @@ -973,8 +1044,32 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
>>  	}
>>  
>>  	if (exposed_mon_capable) {
>> +		int i;
>> +		struct mpam_component *mon_comp, *any_mon_comp;
>> +
>> +		/*
>> +		 * Even if the monitor domain is backed by a different
>> +		 * component, the L3 component IDs need to be used... only
>> +		 * there may be no ctrl_comp for the L3.
>> +		 * Search each event's class list for a component with
>> +		 * overlapping CPUs and set up the dom->mon_comp array.
>> +		 */
>> +		for (i = 0; i < QOS_NUM_EVENTS; i++) {
> For consistency with other loops (some of them anyway, I've not done
> a detailed survey ;) I'd do
> 		for (int i = 0; ...
> Probably bring scope of the mon_comp in here too.

Done.

> 
> 
>> +			struct mpam_resctrl_mon *mon;
>> +
>> +			mon = &mpam_resctrl_counters[i];
>> +			if (!mon->class)
>> +				continue;       // dummy resource
>> +
>> +			mon_comp = find_component(mon->class, cpu);
>> +			dom->mon_comp[i] = mon_comp;
>> +			if (mon_comp)
>> +				any_mon_comp = mon_comp;
>> +		}
>> +		WARN_ON_ONCE(!any_mon_comp);
>> +
>>  		mon_d = &dom->resctrl_mon_dom;
>> -		mpam_resctrl_domain_hdr_init(cpu, ctrl_comp, &mon_d->hdr);
>> +		mpam_resctrl_domain_hdr_init(cpu, any_mon_comp, &mon_d->hdr);
>>  		mon_d->hdr.type = RESCTRL_MON_DOMAIN;
>>  		mpam_resctrl_domain_insert(&r->mon_domains, &mon_d->hdr);
>>  		err = resctrl_online_mon_domain(r, mon_d);
>> @@ -996,6 +1091,39 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
>>  	return dom;
>>  }
>>  
>> +/*
>> + * We know all the monitors are associated with the L3, even if there are no
>> + * controls and therefore no control component. Find the cache-id for the CPU
>> + * and use that to search for existing resctrl domains.
>> + * This relies on mpam_resctrl_pick_domain_id() using the L3 cache-id
>> + * for anything that is not a cache.
>> + */
>> +static struct mpam_resctrl_dom *mpam_resctrl_get_mon_domain_from_cpu(int cpu)
>> +{
>> +	u32 cache_id;
>> +	struct rdt_mon_domain *mon_d;
>> +	struct mpam_resctrl_dom *dom;
>> +	struct mpam_resctrl_res *l3 = &mpam_resctrl_controls[RDT_RESOURCE_L3];
>> +
>> +	lockdep_assert_cpus_held();
>> +
>> +	if (!l3->class)
>> +		return NULL;
>> +	/* TODO: how does this order with cacheinfo updates under cpuhp? */
> 
> Considered a blocking todo or something that is future work to resolve if there
> is an issue?

This is synchronized by the wait_event() in mpam_resctrl_setup() but I
realize now that this is only added later in the series. I'll consider
bringing that earlier in the series.

> 
>> +	cache_id = get_cpu_cacheinfo_id(cpu, 3);
>> +	if (cache_id == ~0)
>> +		return NULL;
>> +
>> +	list_for_each_entry_rcu(mon_d, &l3->resctrl_res.mon_domains, hdr.list) {
>> +		dom = container_of(mon_d, struct mpam_resctrl_dom, resctrl_mon_dom);
> Might as well move this under the condition.
> I'm assuming no later patch needs dom for other reasons.
> 
> 		if (mon_d->hdr.id == cache_id)
> 			return container_of(mon_d, struct mpam_resctrl_dom, resctrl_mon_dom);

I've updated to this already based on your comments on the rfc.

> 
>> +
>> +		if (mon_d->hdr.id == cache_id)
>> +			return dom;
>> +	}
>> +
>> +	return NULL;
>> +}

Thanks,

Ben


