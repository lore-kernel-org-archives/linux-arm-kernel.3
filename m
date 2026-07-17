Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7BBC44516
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 10:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNIrjaSLJz1l+01cxHUk/dkr8/Tcp9kC0XImG+1cKHg=; b=NfWhYOIUgy7xwpbfhUGbpf4Asp
	zfa+ms6pVDoU9a2LXeJ69KPdRqsMwRBSyDMtBtJ9p1WmJ7oQmiLDwS/izAsA2L9HqWHz8uzeq0dex
	v1/srxMh47+AjjkRHU+jscLNlgPn1MTAMLTSklUmbqPVqyKvDsiQ5l9SYh9/GZj5tJnOKUhoEckvh
	U2ZBgl9MnDNdqT+7Td5/FUdJlbe3HNPgJWuCcQH1V79kd5isKOAibowOrOazGPxdWuLRVLeQy3awC
	cW2MAN6cdbv3lgYtMNcIE/9HC/QM+qR2/V6WUCkAL3BmmX6jr8fKTiVGcsm69XP7Tlyce/099hPgB
	5CTh5Kmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfZ6-00000001vlD-31Ri;
	Fri, 17 Jul 2026 10:13:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfZ4-00000001vkm-00q2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 10:13:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC5921476;
	Fri, 17 Jul 2026 03:13:00 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B6B43F7D8;
	Fri, 17 Jul 2026 03:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784283184; bh=IbzdYhLneiEOTxgbETon//bLPPusokAVXvyXbnD3rwY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=AETqWx/BC2w44cYCugIvBq065SOia90FmCdRd4hIfml6RKqIPjm6Pt3x7J58OtLR8
	 Kz1oTy6ay4Ht/6La9NyYjGiwWGp0JwePx2ifwA+tj9z/rRKizBVw0ExW8tFgLFdSYU
	 XcbRaIKYQYA4eo+qvPmiU8j8CkpYxAek4aGuAUZ8=
Message-ID: <2ea1cc87-45cb-492e-8099-679b31a1a37b@arm.com>
Date: Fri, 17 Jul 2026 11:13:00 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH 03/23] resctrl: Expose MBA resource_schemata mode sysfs
From: Ben Horgan <ben.horgan@arm.com>
To: Fenghua Yu <fenghuay@nvidia.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Tony Luck
 <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
 Dave Martin <Dave.Martin@arm.com>, Shaopeng Tan <tan.shaopeng@fujitsu.com>,
 Chen Yu <yu.c.chen@intel.com>, Babu Moger <babu.moger@amd.com>,
 Drew Fustini <fustini@kernel.org>, Vikram Sethi <vsethi@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Newton Liu
 <newtonl@nvidia.com>, Gavin Shan <gshan@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <cover.1784217438.git.fenghuay@nvidia.com>
 <20260716210329.2914625-3-fenghuay@nvidia.com>
 <1778dc0e-4a5a-45d5-865c-ab8c65988636@arm.com>
Content-Language: en-US
In-Reply-To: <1778dc0e-4a5a-45d5-865c-ab8c65988636@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_031306_230855_7BA1AF8F 
X-CRM114-Status: GOOD (  42.36  )
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

Just coming back to this.

On 7/17/26 09:54, Ben Horgan wrote:
> Hi Fenghua,
> 
> On 7/16/26 22:02, Fenghua Yu wrote:
>> Node-scoped MBA on MPAM needs a way to distinguish native memory-side
>> controls from legacy L3-shaped MB emulation. Track the selected emulate
>> mode on rdt_resource and expose it as
>> info/<resource>/resource_schemata/mode ("native" or "legacy") when the
>> architecture enables emulation.
> 
> This doesn't sound right.
> 
> If the MPAM mbwu counters are counting traffic on the egress of the L3 they should be described in

The same point stands but I should say 'MPAM bandwidth partitioning controls' rather than 'MPAM mbwu
counters'.

> the acpi tables as such, if they are not then they shouldn't. If they are the MB resource can then
> be scoped to the L3.
> 
> If the MPAM mbwu counters are at the memory bandwidth controller then they should be described in
> the acpi tables as such. Currently there is no support for such counters except when there is a
> single L3 and a single NUMA node and so a single link between the caches and the memory. Counting at
> either end of the link, egress of the L3 or entry to the memory gives the same counts and so the
> driver performs some unfortunate gymnastics to use L3 scope in this case. Do you see a reason not to
> do this? If we change the scope to be NUMA node in these platforms all I see changing is the domain
> id for the sole MB domain.
> 
> As such, can't we just add support for a NUMA scope memory bandwidth allocation resource, MB_NODE,
> without having a legacy/native switch?

Is the idea to use whatever is closest to the meaning of the MB resource to represent it?

I see the benefit of stretching the existing interface to match new platforms but I am wary. For
instance, the power management of MSC at the memory is different from that at caches. When a memory
node is powered off the cpus can be still be on and so the user will see resctrl domains going
offline and online at different times for the two.

So far the MPAM driver has also been strict at only associating the MB with bandwidth allocation
that can be considered at the egress of the L3 and anything else not. Part of the reasoning for this
was that we didn't want to stop a better representation later. However, if there is an emulation
toggle (legacy/native) then this reasoning becomes less compelling.

For any node scoped support we need to consider power management. (For a single NUMA node this was
ok as you can't turn off all the memory.) James has some example patches at [1] which add the
hotplug lock to resctrl and add memory hotplug handlers to the mpam driver.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot%2bextras/v6.18-rc1

Thanks,

Ben

> 
> Thanks,
> 
> Ben
> 
>>
>> The mode file is only created when rdt_resource::mode is non-zero
>> (RESCTRL_CTRL_LEGACY or RESCTRL_CTRL_NATIVE). It defaults to
>> RESCTRL_CTRL_MODE_NONE, so resources whose architecture does not support
>> control emulation get no mode file and are unaffected. Architecture
>> backends that support emulation set the initial mode when they create
>> their controls; on MPAM this is wired up together with the node-scoped
>> MB_NODE control in a later patch, so this commit only adds the (dormant)
>> generic mechanism.
>>
>> The mode file is added read-only here: switching the mode at runtime
>> requires rebuilding the resource_schemata layout to match the new mode,
>> so the writable interface is added together with that rebuild logic in a
>> later patch. Keeping the file read-only until then avoids exposing a
>> writable-but-no-op interface.
>>
>> Store rdt_resource_final in the resource_schemata directory priv so the
>> mode file can resolve the backing resource without dereferencing NULL.
>>
>> Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
>> ---
>>  fs/resctrl/rdtgroup.c   | 77 ++++++++++++++++++++++++++++++++++++++++-
>>  include/linux/resctrl.h | 17 +++++++++
>>  2 files changed, 93 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 2abb7fda6091..6b1f24c6a1f2 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -2696,6 +2696,74 @@ static unsigned long fflags_from_resource(struct rdt_resource *r)
>>  	return WARN_ON_ONCE(1);
>>  }
>>  
>> +static int resctrl_ctrl_mb_mode_show(struct kernfs_open_file *of,
>> +				     struct seq_file *seq, void *v)
>> +{
>> +	struct rdt_resource_final *f = rdt_kn_parent_priv(of->kn);
>> +	struct rdt_resource *r = f->res;
>> +
>> +	guard(mutex)(&rdtgroup_mutex);
>> +
>> +	switch (r->mode) {
>> +	case RESCTRL_CTRL_LEGACY:
>> +		seq_puts(seq, "[legacy] native\n");
>> +		break;
>> +	case RESCTRL_CTRL_NATIVE:
>> +		seq_puts(seq, "legacy [native]\n");
>> +		break;
>> +	default:
>> +		WARN_ONCE(1, "%s: unexpected MB control mode %d\n",
>> +			  f->name, r->mode);
>> +		seq_puts(seq, "legacy native\n");
>> +		break;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static struct rftype resctrl_ctrl_mb_files[] = {
>> +	{
>> +		.name		= "mode",
>> +		.mode		= 0444,
>> +		.kf_ops		= &rdtgroup_kf_single_ops,
>> +		.seq_show	= resctrl_ctrl_mb_mode_show,
>> +		/*
>> +		 * Directory-level file, not per-control: fflags is only a
>> +		 * presence flag here, not the BIT(ctrl->type) type filter used
>> +		 * by resctrl_add_ctrl_files().
>> +		 */
>> +		.fflags		= 1,
>> +	}
>> +};
>> +
>> +static int resctrl_ctrl_add_files(struct kernfs_node *kn)
>> +{
>> +	struct rftype *rfts, *rft;
>> +	int ret, len;
>> +
>> +	rfts = resctrl_ctrl_mb_files;
>> +	len = ARRAY_SIZE(resctrl_ctrl_mb_files);
>> +
>> +	lockdep_assert_held(&rdtgroup_mutex);
>> +
>> +	for (rft = rfts; rft < rfts + len; rft++) {
>> +		if (rft->fflags) {
>> +			ret = rdtgroup_add_file(kn, rft);
>> +			if (ret)
>> +				goto error;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +error:
>> +	pr_warn("Failed to add %s, err=%d\n", rft->name, ret);
>> +	while (--rft >= rfts) {
>> +		if (rft->fflags)
>> +			kernfs_remove_by_name(kn, rft->name);
>> +	}
>> +	return ret;
>> +}
>> +
>>  /*
>>   * No need to cleanup on exit - caller calls the recursive kernfs_remove()
>>   * on failure.
>> @@ -2704,11 +2772,12 @@ static int resctrl_mkdir_schemata_dir(struct kernfs_node *kn,
>>  				      struct rdt_resource_final *f)
>>  {
>>  	struct kernfs_node *kn_subdir, *kn_ctrl;
>> +	struct rdt_resource *r = f->res;
>>  	struct resctrl_ctrl *ctrl;
>>  	char ctrl_full_name[20];
>>  	int ret;
>>  
>> -	kn_subdir = kernfs_create_dir(kn, "resource_schemata", kn->mode, NULL);
>> +	kn_subdir = kernfs_create_dir(kn, "resource_schemata", kn->mode, f);
>>  	if (IS_ERR(kn_subdir))
>>  		return PTR_ERR(kn_subdir);
>>  
>> @@ -2716,6 +2785,12 @@ static int resctrl_mkdir_schemata_dir(struct kernfs_node *kn,
>>  	if (ret)
>>  		return ret;
>>  
>> +	if (r->mode) {
>> +		ret = resctrl_ctrl_add_files(kn_subdir);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>  	for_each_resource_ctrl(ctrl, f->res) {
>>  		ret = snprintf(ctrl_full_name, sizeof(ctrl_full_name), "%s%s%s",
>>  			       f->name, resctrl_ctrl_is_default(ctrl) ? "" : "_",
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index 72fb7256270e..4fc41e269d0b 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -257,6 +257,16 @@ enum resctrl_ctrl_unit {
>>  	RESCTRL_CTRL_UNIT_GBPS,
>>  };
>>  
>> +enum resctrl_ctrl_mode {
>> +	/*
>> +	 * Default (zero) value: the resource does not support control
>> +	 * emulation, so no resource_schemata/mode file is created for it.
>> +	 */
>> +	RESCTRL_CTRL_MODE_NONE = 0,
>> +	RESCTRL_CTRL_LEGACY,
>> +	RESCTRL_CTRL_NATIVE,
>> +};
>> +
>>  /**
>>   * struct resctrl_membw - Memory bandwidth allocation related data
>>   * @min_bw:		Minimum memory bandwidth percentage user can request
>> @@ -399,6 +409,12 @@ struct resctrl_ctrl {
>>   *			different memory bandwidths
>>   * @cache_io_alloc_capable:True if portion of the cache can be configured
>>   *			   for I/O traffic.
>> + * @mode:		Control emulation mode for this resource.
>> + *			RESCTRL_CTRL_MODE_NONE if the resource does not support
>> + *			emulation. "legacy": keep the legacy MB control,
>> + *			emulating it with a native control when it has no MBW
>> + *			hardware of its own. "native": expose native controls
>> + *			directly with no emulation.
>>   * @controls:		List of controls of an alloc_capable resource
>>   */
>>  struct rdt_resource {
>> @@ -413,6 +429,7 @@ struct rdt_resource {
>>  	bool				bw_delay_linear;
>>  	enum membw_throttle_mode	bw_throttle_mode;
>>  	bool				cache_io_alloc_capable;
>> +	enum resctrl_ctrl_mode		mode;
>>  	struct list_head		controls;
>>  };
>>  
> 
> 


