Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFD8EFB7F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 06:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSd0bIge3du5q4k1ITIqdipNWSaUEDd+YaQHudv3Gec=; b=ENI1Y5w59eZrAzs0tuz1+Ym+Zj
	AB42UjDEJuBYd9+7RA8ND09fk1/FnuBJBSchIDViRQvhOzdNZ0v/qIdKe3Fs9gPrOiBOWX/zXg6zJ
	LVzxK+XnxrBckf7gnufyIFVHzAeaJw/uPVWonBvI3bIMFtJviNs5q+GaRWJNN2n463bG+7g1Xsisn
	tZ6XiXoPsPesBzCjrVUyz+3xd3EWdPds0Dzar2tUd1Qzj7fwntOJxLgpy6fixyGoFhu0hvcY4G1Wh
	EnZ2TXqx1niPTg8zLyP/QqU6YgUASFJZsMocJR/ghcla+G4+HuBs5pi/XdLNbDqsHtQdITbjhbl/S
	bo+YYHSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8YM-00000003Lru-1CTB;
	Wed, 25 Feb 2026 06:39:22 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8YI-00000003LrM-2Stq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 06:39:20 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=PSd0bIge3du5q4k1ITIqdipNWSaUEDd+YaQHudv3Gec=;
	b=DPQL/IurM9+EUBSco39+DIWp20D9Za9zlHjxpKr6vQ6m/YmUSSm3K3pANqIS5kAfvdQlyM1tr
	CtLgq3AQ9BxuDrp3dFCWh5saGf4UyDXbH/XAY6017jBToLb7V5LirPd7WdZ5T48woRwPK33S+nz
	DU3+s6Nc+SwTDd339Lj25Kk=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4fLPvH4xvrz1K97v;
	Wed, 25 Feb 2026 14:34:19 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 234A1402AB;
	Wed, 25 Feb 2026 14:39:04 +0800 (CST)
Received: from [10.174.179.37] (10.174.179.37) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 25 Feb 2026 14:39:02 +0800
Message-ID: <7cb6092c-c4b2-46e6-9b32-ef82b694f9b0@huawei.com>
Date: Wed, 25 Feb 2026 14:39:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 18/41] arm_mpam: resctrl: Implement helpers to update
 configuration
Content-Language: en-US
To: Ben Horgan <ben.horgan@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<jonathan.cameron@huawei.com>, <kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <reinette.chatre@intel.com>,
	<rohit.mathew@arm.com>, <scott@os.amperecomputing.com>,
	<sdonthineni@nvidia.com>, <tan.shaopeng@fujitsu.com>,
	<xhao@linux.alibaba.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<corbet@lwn.net>, <maz@kernel.org>, <oupton@kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <kvmarm@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
 <20260203214342.584712-19-ben.horgan@arm.com>
 <d7de359e-9bf3-e41d-b00d-985ca7263ad8@huawei.com>
 <a5bc5d67-4dab-4699-8a11-5a92ca334159@arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <a5bc5d67-4dab-4699-8a11-5a92ca334159@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.37]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_223919_251844_4B78C46E 
X-CRM114-Status: GOOD (  33.14  )
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

Hi Ben,

On 2026/2/16 22:23, Ben Horgan wrote:
> Hi Zeng,
> 
> On 2/14/26 10:39, Zeng Heng wrote:
>> Hi Ben,
>>
>> On 2026/2/4 5:43, Ben Horgan wrote:
>>> From: James Morse <james.morse@arm.com>
>>>
>>> resctrl has two helpers for updating the configuration.
>>> resctrl_arch_update_one() updates a single value, and is used by the
>>> software-controller to apply feedback to the bandwidth controls, it
>>> has to
>>> be called on one of the CPUs in the resctrl:domain.
>>>
>>> resctrl_arch_update_domains() copies multiple staged configurations,
>>> it can
>>> be called from anywhere.
>>>
>>> Both helpers should update any changes to the underlying hardware.
>>>
>>> Implement resctrl_arch_update_domains() to use
>>> resctrl_arch_update_one(). Neither need to be called on a specific CPU as
>>> the mpam driver will send IPIs as needed.
>>>
>>> Tested-by: Gavin Shan <gshan@redhat.com>
>>> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>>> Tested-by: Peter Newman <peternewman@google.com>
>>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>>> Signed-off-by: James Morse <james.morse@arm.com>
>>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>>> ---
>>> Changes since rfc:
>>> list_for_each_entry -> list_for_each_entry_rcu
>>> return 0
>>> Restrict scope of local variables
>>>
>>> Changes since v2:
>>> whitespace fix
>>> ---
>>>    drivers/resctrl/mpam_resctrl.c | 70 ++++++++++++++++++++++++++++++++++
>>>    1 file changed, 70 insertions(+)
>>>
>>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/
>>> mpam_resctrl.c
>>> index ecf00386edca..48d047510089 100644
>>> --- a/drivers/resctrl/mpam_resctrl.c
>>> +++ b/drivers/resctrl/mpam_resctrl.c
>>> @@ -212,6 +212,76 @@ u32 resctrl_arch_get_config(struct rdt_resource
>>> *r, struct rdt_ctrl_domain *d,
>>>        }
>>>    }
>>>    +int resctrl_arch_update_one(struct rdt_resource *r, struct
>>> rdt_ctrl_domain *d,
>>> +                u32 closid, enum resctrl_conf_type t, u32 cfg_val)
>>> +{
>>> +    u32 partid;
>>> +    struct mpam_config cfg;
>>> +    struct mpam_props *cprops;
>>> +    struct mpam_resctrl_res *res;
>>> +    struct mpam_resctrl_dom *dom;
>>> +
>>> +    lockdep_assert_cpus_held();
>>> +    lockdep_assert_irqs_enabled();
>>> +
>>> +    /*
>>> +     * No need to check the CPU as mpam_apply_config() doesn't care, and
>>> +     * resctrl_arch_update_domains() relies on this.
>>> +     */
>>> +    res = container_of(r, struct mpam_resctrl_res, resctrl_res);
>>> +    dom = container_of(d, struct mpam_resctrl_dom, resctrl_ctrl_dom);
>>> +    cprops = &res->class->props;
>>> +
>>> +    partid = resctrl_get_config_index(closid, t);
>>
>>
>> As a victim, I must admit I cannot verify this feedback on my local
>> Kunpeng environment since MB functionality is not yet supported by the
>> driver. However, after careful consideration, I believe this is worth
>> bringing up for discussion.
> 
> Thank you for thinking and finding problems beyond your platform.
> 
>>
>> Regarding the MB configuration flow, the partid conversion should
>> include the mpam_resctrl_hide_cdp() condition check. Here's the
>> rationale:
>>
>> After resctrl parsing schemata update, MB configuration is set via
>> parse_bw() or rdtgroup_init_mba(), which stores the updated
>> configuration in dom->staged_config[CDP_NONE]. If the MB configuration
>> update directly uses t = CDP_NONE, it would result in MB obtaining the
>> wrong partid and cfg[partid].
>>
>> The specific fix would be like:
>>
>> -       partid = resctrl_get_config_index(closid, t);
>> +       if (mpam_resctrl_hide_cdp(r->rid))
>> +        /* The configuration of CDP_DATA is same as the CDP_CODE one. */
>> +               partid = resctrl_get_config_index(closid, CDP_DATA);
>> +       else
>> +               partid = resctrl_get_config_index(closid, t);
> 
> The CDP emulation support is added later in the series in patch 20, Add
> CDP emulation. However, I think you have spotted an actual problem. With
> hidden CDP the cfg is first found with
> 
> resctrl_get_config_index(closid, t) when CDP_NONE
> but then the setting does use CDP_CODE and CDP_DATA.
> 
> CDP in general is proving to be quite tricky.
> 
>>
>> Similarly, in resctrl_arch_get_config() requires the same treatment to
>> ensure consistency.
> 
> I don't see the problem here but maybe I'm missing something?
> 
> Isn't this handled by:
> 
> 	/*
> 	 * When CDP is enabled, but the resource doesn't support it,
> 	 * the control is cloned across both partids.
> 	 * Pick one at random to read:
> 	 */
> 	if (mpam_resctrl_hide_cdp(r->rid))
> 		type = CDP_DATA;
> 
> I think we could do similar in resctrl_arch_update_one()
> 
>>
>>


Yes, I noticed that handling has already been added to
resctrl_arch_get_config(), and I have updated the comments on v5
accordingly.


Thanks,
Zeng Heng

