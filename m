Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AE2EF5862
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 06:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQr1KIdtCg4BgqPYVIhEydfZsGCVg8yetCxgBfSUU8g=; b=tSGXrgJHJ+KyEUUWMd5xqNfyev
	k6A7H167G6vrwB2g6hZlIPeZ3qIUNkDAH8dkkWZ7weZNuC7pBaaPGyQEDSMyS2jfeRcp82a3kUaPz
	b9SX8NKLA2HS5eqkoo2NcTIjmL9ed6aepKZcJLosz2LyJ/wkfr7oGKgydHWUMFV6GktGUHlvId9Fo
	Ha4z24BpQSLsrfZjIhtHbenKk7teVSGtRoGAGkZq+ZIBwIyUHd+3McOVyUCyXugf8CGj1IWLW0k6T
	jeoqVYnrUdK3LVepxHFHR02snSxENv2ZSIYWxRvdTdqfMMLUfnronGeXDIPOtJW1NP9gr+WAfjeY6
	wTNy6WUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8LZ-00000003Jzy-0MUo;
	Wed, 25 Feb 2026 06:26:09 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8LQ-00000003Jih-0G8u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 06:26:06 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=HQr1KIdtCg4BgqPYVIhEydfZsGCVg8yetCxgBfSUU8g=;
	b=MUtEuK/4x8KgYir8Lo++kTygCM5l2rCzR3lHSR3Xu5QN+njHzTKoER9L/zYtWIvVrWAMvJV6z
	cgk4RG/CAQQ6R6l5IdJdBdFN0MZUf+odI8BwUPHNaJQnIXGqgoWQcPpg3CDPCaGnjEHKmgmVacU
	DBKusdSKgIhng506On4+pHw=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fLPbf20kmzcb4G;
	Wed, 25 Feb 2026 14:20:46 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id D05FE40538;
	Wed, 25 Feb 2026 14:25:46 +0800 (CST)
Received: from [10.174.179.37] (10.174.179.37) by
 kwepemf100008.china.huawei.com (7.202.181.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 25 Feb 2026 14:25:44 +0800
Message-ID: <514cd4d8-e00d-54bc-c88a-516f28a05531@huawei.com>
Date: Wed, 25 Feb 2026 14:25:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 19/41] arm_mpam: resctrl: Add CDP emulation
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
References: <20260224175720.2663924-1-ben.horgan@arm.com>
 <20260224175720.2663924-20-ben.horgan@arm.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <20260224175720.2663924-20-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.37]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_222600_787451_425E2E17 
X-CRM114-Status: GOOD (  25.78  )
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



On 2026/2/25 1:56, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> Intel RDT's CDP feature allows the cache to use a different control value
> depending on whether the accesses was for instruction fetch or a data
> access. MPAM's equivalent feature is the other way up: the CPU assigns a
> different partid label to traffic depending on whether it was instruction
> fetch or a data access, which causes the cache to use a different control
> value based solely on the partid.
> 
> MPAM can emulate CDP, with the side effect that the alternative partid is
> seen by all MSC, it can't be enabled per-MSC.
> 
> Add the resctrl hooks to turn this on or off. Add the helpers that match a
> closid against a task, which need to be aware that the value written to
> hardware is not the same as the one resctrl is using.
> 
> Update the 'arm64_mpam_global_default' variable the arch code uses during
> context switch to know when the per-cpu value should be used instead. Also,
> update these per-cpu values and sync the resulting mpam partid/pmg
> configuration to hardware.
> 
> resctrl can enable CDP for L2 caches, L3 caches or both. When it is enabled
> by one and not the other MPAM globally enabled CDP but hides the effect
> on the other cache resource. This hiding is possible as CPOR is the only
> supported cache control and that uses a resource bitmap; two partids with
> the same bitmap act as one.
> 
> Awkwardly, the MB controls don't implement CDP and CDP can't be hidden as
> the memory bandwidth control is a maximum per partid which can't be
> modelled with more partids. If the total maximum is used for both the data
> and instruction partids then then the maximum may be exceeded and if it is
> split in two then the one using more bandwidth will hit a lower
> limit. Hence, hide the MB controls completely if CDP is enabled for any
> resource.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> CC: Dave Martin <Dave.Martin@arm.com>
> CC: Amit Singh Tomar <amitsinght@marvell.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> Fail cdp initialisation if there is only one partid
> Correct data/code confusion
> 
> Changes since v2:
> Don't include unused header
> 
> Changes since v3:
> Update the per-cpu values and sync to h/w
> 
> Changes since v4:
> Enable separately for L2 and L3
> Disable MB controls if CDP enabled
> Consider cdp hiding in resctrl_arch_update_one()

[...]

@ -245,6 +338,14 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, 
struct rdt_ctrl_domain *d,
>   	dom = container_of(d, struct mpam_resctrl_dom, resctrl_ctrl_dom);
>   	cprops = &res->class->props;
>   
> +	/*
> +	 * When CDP is enabled, but the resource doesn't support it,
> +	 * the control is cloned across both partids.
> +	 * Pick one at random to read:
> +	 */
> +	if (mpam_resctrl_hide_cdp(r->rid))
> +		type = CDP_DATA;
> +

Yes, I have observed that this issue had already been addressed in
resctrl_arch_get_config() before the mpam_resctrl_glue_v4 release.

>   	partid = resctrl_get_config_index(closid, type);
>   	cfg = &dom->ctrl_comp->cfg[partid];
>   
> @@ -272,6 +373,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
>   int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
>   			    u32 closid, enum resctrl_conf_type t, u32 cfg_val)
>   {
> +	int err;
>   	u32 partid;
>   	struct mpam_config cfg;
>   	struct mpam_props *cprops;
> @@ -289,6 +391,9 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
>   	dom = container_of(d, struct mpam_resctrl_dom, resctrl_ctrl_dom);
>   	cprops = &res->class->props;
>   
> +	if (mpam_resctrl_hide_cdp(r->rid))
> +		t = CDP_DATA;
> +

Fix for resctrl_arch_update_one() has been confirmed.

Reviewed-by: Zeng Heng <zengheng4@huawei.com>


Best regards,
Zeng Heng


