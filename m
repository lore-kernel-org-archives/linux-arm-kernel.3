Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AA6E81A29
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 14:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AaxVBeP9uSF4zOmLs5Ni1CGFi5L+0qp+uyM4RI7xVeQ=; b=4Cw4GUZLUBe7881wD952tCRDv8
	OdSggPK9J9yrHTN5ONZHb6DZqt/MNNEAbDrWDb4nqosIhe8FGCmohEBN/ITdZ0yQuo10+K0CIMNbm
	ENRcy+1/WQc/BmEUi5p53khZK1Xiqmhehxk3+o1rKisLnL3CRx01/BqFqzYEkBeFG6yMoqHEtBy2K
	27767KzCd0HWAxbQOlg4iinamWo9go+WJ+gpRFpLgLsrlXayzpt3e42SHiQOBk54FoAREU2y927HM
	vIGB9Hvv8QiPgGMJreOrrX0l3sbwoGgQUpObPIIBsukTEpyMwnw3Fd0ppxYnFsm95zHng2/7JhveW
	X6Y4IyFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrzWB-00000006mXj-1dn8;
	Mon, 16 Feb 2026 14:24:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrzW2-00000006mWa-2yLM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 14:24:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D50EA1570;
	Mon, 16 Feb 2026 06:23:50 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4F463F73F;
	Mon, 16 Feb 2026 06:23:51 -0800 (PST)
Message-ID: <a5bc5d67-4dab-4699-8a11-5a92ca334159@arm.com>
Date: Mon, 16 Feb 2026 14:23:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/41] arm_mpam: resctrl: Implement helpers to update
 configuration
To: Zeng Heng <zengheng4@huawei.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 linux-doc@vger.kernel.org, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
 <20260203214342.584712-19-ben.horgan@arm.com>
 <d7de359e-9bf3-e41d-b00d-985ca7263ad8@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <d7de359e-9bf3-e41d-b00d-985ca7263ad8@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_062403_064041_11B705BF 
X-CRM114-Status: GOOD (  35.53  )
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

On 2/14/26 10:39, Zeng Heng wrote:
> Hi Ben,
> 
> On 2026/2/4 5:43, Ben Horgan wrote:
>> From: James Morse <james.morse@arm.com>
>>
>> resctrl has two helpers for updating the configuration.
>> resctrl_arch_update_one() updates a single value, and is used by the
>> software-controller to apply feedback to the bandwidth controls, it
>> has to
>> be called on one of the CPUs in the resctrl:domain.
>>
>> resctrl_arch_update_domains() copies multiple staged configurations,
>> it can
>> be called from anywhere.
>>
>> Both helpers should update any changes to the underlying hardware.
>>
>> Implement resctrl_arch_update_domains() to use
>> resctrl_arch_update_one(). Neither need to be called on a specific CPU as
>> the mpam driver will send IPIs as needed.
>>
>> Tested-by: Gavin Shan <gshan@redhat.com>
>> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>> Tested-by: Peter Newman <peternewman@google.com>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>> Changes since rfc:
>> list_for_each_entry -> list_for_each_entry_rcu
>> return 0
>> Restrict scope of local variables
>>
>> Changes since v2:
>> whitespace fix
>> ---
>>   drivers/resctrl/mpam_resctrl.c | 70 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 70 insertions(+)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/
>> mpam_resctrl.c
>> index ecf00386edca..48d047510089 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -212,6 +212,76 @@ u32 resctrl_arch_get_config(struct rdt_resource
>> *r, struct rdt_ctrl_domain *d,
>>       }
>>   }
>>   +int resctrl_arch_update_one(struct rdt_resource *r, struct
>> rdt_ctrl_domain *d,
>> +                u32 closid, enum resctrl_conf_type t, u32 cfg_val)
>> +{
>> +    u32 partid;
>> +    struct mpam_config cfg;
>> +    struct mpam_props *cprops;
>> +    struct mpam_resctrl_res *res;
>> +    struct mpam_resctrl_dom *dom;
>> +
>> +    lockdep_assert_cpus_held();
>> +    lockdep_assert_irqs_enabled();
>> +
>> +    /*
>> +     * No need to check the CPU as mpam_apply_config() doesn't care, and
>> +     * resctrl_arch_update_domains() relies on this.
>> +     */
>> +    res = container_of(r, struct mpam_resctrl_res, resctrl_res);
>> +    dom = container_of(d, struct mpam_resctrl_dom, resctrl_ctrl_dom);
>> +    cprops = &res->class->props;
>> +
>> +    partid = resctrl_get_config_index(closid, t);
> 
> 
> As a victim, I must admit I cannot verify this feedback on my local
> Kunpeng environment since MB functionality is not yet supported by the
> driver. However, after careful consideration, I believe this is worth
> bringing up for discussion.

Thank you for thinking and finding problems beyond your platform.

> 
> Regarding the MB configuration flow, the partid conversion should
> include the mpam_resctrl_hide_cdp() condition check. Here's the
> rationale:
> 
> After resctrl parsing schemata update, MB configuration is set via
> parse_bw() or rdtgroup_init_mba(), which stores the updated
> configuration in dom->staged_config[CDP_NONE]. If the MB configuration
> update directly uses t = CDP_NONE, it would result in MB obtaining the
> wrong partid and cfg[partid].
> 
> The specific fix would be like:
> 
> -       partid = resctrl_get_config_index(closid, t);
> +       if (mpam_resctrl_hide_cdp(r->rid))
> +        /* The configuration of CDP_DATA is same as the CDP_CODE one. */
> +               partid = resctrl_get_config_index(closid, CDP_DATA);
> +       else
> +               partid = resctrl_get_config_index(closid, t);

The CDP emulation support is added later in the series in patch 20, Add
CDP emulation. However, I think you have spotted an actual problem. With
hidden CDP the cfg is first found with

resctrl_get_config_index(closid, t) when CDP_NONE
but then the setting does use CDP_CODE and CDP_DATA.

CDP in general is proving to be quite tricky.

> 
> Similarly, in resctrl_arch_get_config() requires the same treatment to
> ensure consistency.

I don't see the problem here but maybe I'm missing something?

Isn't this handled by:

	/*
	 * When CDP is enabled, but the resource doesn't support it,
	 * the control is cloned across both partids.
	 * Pick one at random to read:
	 */
	if (mpam_resctrl_hide_cdp(r->rid))
		type = CDP_DATA;

I think we could do similar in resctrl_arch_update_one()

> 
> 
> Best regards,
> and happy Lunar New Year!
> 
> Zeng Heng
> 
> 
>> +    if (!r->alloc_capable || partid >= resctrl_arch_get_num_closid(r)) {
>> +        pr_debug("Not alloc capable or computed PARTID out of range\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    /*
>> +     * Copy the current config to avoid clearing other resources when
>> the
>> +     * same component is exposed multiple times through resctrl.
>> +     */
>> +    cfg = dom->ctrl_comp->cfg[partid]; > +
>> +    switch (r->rid) {
>> +    case RDT_RESOURCE_L2:
>> +    case RDT_RESOURCE_L3:
>> +        cfg.cpbm = cfg_val;
>> +        mpam_set_feature(mpam_feat_cpor_part, &cfg);
>> +        break;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
>> +    return mpam_apply_config(dom->ctrl_comp, partid, &cfg);
>> +}
>> +
>> +int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid)
>> +{
>> +    int err;
>> +    struct rdt_ctrl_domain *d;
>> +
>> +    lockdep_assert_cpus_held();
>> +    lockdep_assert_irqs_enabled();
>> +
>> +    list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list) {
>> +        for (enum resctrl_conf_type t = 0; t < CDP_NUM_TYPES; t++) {
>> +            struct resctrl_staged_config *cfg = &d->staged_config[t];
>> +
>> +            if (!cfg->have_new_ctrl)
>> +                continue;
>> +
>> +            err = resctrl_arch_update_one(r, d, closid, t,
>> +                              cfg->new_ctrl);
>> +            if (err)
>> +                return err;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}


Thanks,

Ben


