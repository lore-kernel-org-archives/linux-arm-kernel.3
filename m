Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D529CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 21:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMQJnezk3mpyhZhePaVbT0pyos7XPa3iaau/Q4KItE8=; b=SMmjgYNP6HsJK1nJc8xt/JWjgj
	V5zrMajoxFBQ0Y7svSU1Oj6hFFTTDlLqZ1hXsdWMTh34TK4Fnp0tV1f81GKJiLAEeQ3EToFFsqhgX
	b+oA72RFUq2xZJzV7ZfxMChxfZ4B+ke4zKMHQPYLp0fRtbFMDp3VDx30C/0SgqYWSmrwGK7oEIQ0a
	hZL+q+e2N6JlezdKeDFrHwJezv1VbcGS9zWTQqvCXo/KA0B3hokL+0mZIeVkpyUgGITHKbx0aUDTL
	gqzaBVHR7uG7Y1Ru6LZaZv31CQ8igXfapU8oiA8y49wdOBOKv+agjCtqdlVa55A4c33MjejUwXLnh
	lnKAUzlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7Gb-0000000FyD5-3AIW;
	Wed, 15 Jul 2026 21:35:45 +0000
Received: from trager.us ([52.5.81.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7GZ-0000000FyBs-4B56
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 21:35:45 +0000
Received: from c-73-254-161-40.hsd1.wa.comcast.net ([73.254.161.40] helo=[192.168.1.226])
	by trager.us with esmtpsa (TLSv1.3:TLS_AES_128_GCM_SHA256:128)
	(Exim 4.92.3)
	(envelope-from <lee@trager.us>)
	id 1wk7GP-00008y-1O; Wed, 15 Jul 2026 21:35:33 +0000
Message-ID: <c53d8057-d3c3-4000-8ce2-876385ca3f25@trager.us>
Date: Wed, 15 Jul 2026 14:35:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mpam mpam/snapshot+extras/v6.18-rc1 v2 3/3] fs/resctrl:
 Migrate IOMMU groups when removing resource groups
To: Zeng Heng <zengheng4@huawei.com>, ben.horgan@arm.com,
 james.morse@arm.com, Dave.Martin@arm.com, fenghuay@nvidia.com,
 reinette.chatre@intel.com
Cc: xiaqinxin@huawei.com, sunnanyong@huawei.com, jonathan.cameron@huawei.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260414032610.1523958-1-zengheng4@huawei.com>
 <20260414032610.1523958-4-zengheng4@huawei.com>
Content-Language: en-US
From: Lee Trager <lee@trager.us>
In-Reply-To: <20260414032610.1523958-4-zengheng4@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_143544_037185_EFA730BF 
X-CRM114-Status: GOOD (  23.95  )
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

Hi Zeng,

Thanks for the series, I found it while backporting MPAM support to 6.18.

On 4/13/26 8:26 PM, Zeng Heng wrote:
> When deleting a control group, monitor group, or unmounting the resctrl
> filesystem, migrate all associated IOMMU groups to the appropriate
> destination:
>    * Control group deletion: move IOMMU groups to the default group
>    * Monitor group deletion: move IOMMU groups to the parent control group
>    * Filesystem unmount: move all IOMMU groups to the default group
>
> Without this migration, IOMMU groups remain bound to stale PARTID/PMG
> values of the destroyed group, causing them to "disappear" from the
> resctrl interface.
>
> Add rdt_move_group_iommus() to handle this migration, mirroring the
> existing rdt_move_group_tasks() pattern for task migration.
>
> When deleting a control group or unmounting the resctrl file system, it
> is necessary to move its all iommu_groups back to the default group. When
> removing a monitor group, need to move its iommu_groups back to the parent
> control group.
>
> Otherwise, these iommu_groups remain bound to the old PARTID and PMG, and
> they will appear to "disappear" from the resctrl fs.
>
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>   fs/resctrl/rdtgroup.c | 47 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
>
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index e92b5dcb6f2e..351e430bde1a 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -3292,6 +3292,44 @@ static void rdt_move_group_tasks(struct rdtgroup *from, struct rdtgroup *to,
>   	read_unlock(&tasklist_lock);
>   }
>   
> +static int rdt_move_group_iommus(struct rdtgroup *from, struct rdtgroup *to)
> +{
> +	struct kset *iommu_groups;
> +	struct iommu_group *group;
> +	int err = 0, iommu_group_id;
> +	struct kobject *group_kobj = NULL;
> +
> +	if (!IS_ENABLED(CONFIG_RESCTRL_IOMMU))
> +		return 0;
> +
> +	if (from == to)
> +		return 0;
> +
> +	iommu_groups = iommu_get_group_kset();
> +
> +	while ((group_kobj = kset_get_next_obj(iommu_groups, group_kobj))) {
> +		/* iommu_group_get_from_kobj() wants to drop a reference */
> +		kobject_get(group_kobj);
> +
> +		group = iommu_group_get_from_kobj(group_kobj);
> +		if (!group)
> +			continue;
> +
> +		if (!from || iommu_matches_rdtgroup(group, from)) {
> +			err = kstrtoint(group_kobj->name, 0, &iommu_group_id);
> +			if (err)
> +				break;
> +
> +			err = rdtgroup_move_iommu(iommu_group_id, to);
> +			if (err)
> +				break;
> +		}
> +	}
> +
> +	kset_put(iommu_groups);
> +	return err;
> +}

iommu_group_get_from_kobj() returns holding a reference on 
group->devices_kobj, the one iommu_group_put() releases. The 
kobject_get() above only compensates for the kobject_put(&group->kobj) 
done internally by iommu_group_get_from_kobj(). Nothing in this loop 
ever calls iommu_group_put(), so this leaks one iommu_group reference  
per group in the kset on every call, e.g on rmdir and every unmount. 
Since device_kobj pins the group's koject, the leaked groups can never 
be freed.

The same pattern exists in show_rdt_iommu() from "fs/resctrl: Add 
support for assigning iommu_groups to resctrl groups", where it leaks 
one reference per group on every read of a tasks file.

There is a second, smaller leak on these break paths: 
kset_get_next_obj() only drops its reference on the current kobject when 
it is passed back as @prev on the next iteration, so breaking out of the 
loop also leaks the group_kobj reference taken by the iterator. I am 
carrying the fix below:

if (!from || iommu_matches_rdtgroup(group, from)) {
	err = kstrtoint(group_kobj->name, 0, &iommu_group_id);
	if (!err)
		err = rdtgroup_move_iommu(iommu_group_id, to);
}

iommu_group_put(group);
if (err) {
	kobject_put(group_kobj);
	break;
}

Thanks,

Lee


