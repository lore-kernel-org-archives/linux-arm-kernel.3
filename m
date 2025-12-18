Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351A8D6ACF0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 11:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0ML9mJeGkEVSocGkNMUZD8LeVIX0ltQ7afCSOmMLBQ=; b=nnJJ0VjTOZIlz3+UU/XY3hO7vl
	UqhHVaWtO/n2yqn+C/fCGG6N8pdaCCy2QUbKNQSnCKNjYp7lYEtmFBISEbpkw2ID9tzW3LW1xo1t1
	ImHvun3fPONSLyYvo7suc84iZ/iZhn5GADqjf9m/V1nvC/MCQPwpoIJ1eaV1Nh788c6xmAbeJ1Frw
	da2mfO5H7l2HmxDRh0jS1JZsdISrf1YF4/pecKu9xD7HrYBp0Pa+STBfILWjWljXEDfUq51a+20tZ
	FnsoxirsLew6ViWoujTrqxaeq96kW+pqTglfyew1z8W3MQlUSn/Id2nvYjcALVcboQF9B1TmNplE+
	P+Afnekw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCeR-00000008O5a-0I28;
	Thu, 18 Dec 2025 11:58:35 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCeN-00000008O5C-25ee
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 11:58:33 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dX8LR315rzHnH81;
	Thu, 18 Dec 2025 19:57:51 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 800B540565;
	Thu, 18 Dec 2025 19:58:18 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 18 Dec
 2025 11:58:17 +0000
Date: Thu, 18 Dec 2025 11:58:15 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, D
 Scott Phillips OS <scott@os.amperecomputing.com>,
	<carl@os.amperecomputing.com>, <lcherian@marvell.com>,
	<bobo.shaobowang@huawei.com>, <tan.shaopeng@fujitsu.com>,
	<baolin.wang@linux.alibaba.com>, Jamie Iles <quic_jiles@quicinc.com>, "Xin
 Hao" <xhao@linux.alibaba.com>, <peternewman@google.com>,
	<dfustini@baylibre.com>, <amitsinght@marvell.com>, David Hildenbrand
	<david@kernel.org>, Dave Martin <dave.martin@arm.com>, Koba Ko
	<kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	<fenghuay@nvidia.com>, <baisheng.gao@unisoc.com>, Gavin Shan
	<gshan@redhat.com>, Ben Horgan <ben.horgan@arm.com>, <rohit.mathew@arm.com>,
	<reinette.chatre@intel.com>, Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Subject: Re: [RFC PATCH 13/38] arm_mpam: resctrl: Add CDP emulation
Message-ID: <20251218115815.00003f2c@huawei.com>
In-Reply-To: <20251205215901.17772-14-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
	<20251205215901.17772-14-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_035832_206260_B3E8BAEA 
X-CRM114-Status: GOOD (  26.40  )
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

On Fri, 5 Dec 2025 21:58:36 +0000
James Morse <james.morse@arm.com> wrote:

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
> Add the resctrl hooks to turn this on or off. Add the helpers that
> match a closid against a task, which need to be aware that the value
> written to hardware is not the same as the one resctrl is using.
> 
> Update the 'arm64_mpam_global_default' variable the arch code uses
> during context switch to know when the per-cpu value should be used
> instead.
> 
> Awkwardly, the MB controls don't implement CDP. To emulate this, the
> MPAM equivalent needs programming twice by the resctrl glue, as
> resctrl expects the bandwidth controls to be applied independently for
> both data and isntruction-fetch.
> 
> CC: Dave Martin <Dave.Martin@arm.com>
> CC: Ben Horgan <ben.horgan@arm.com>
> CC: Amit Singh Tomar <amitsinght@marvell.com>
> Signed-off-by: James Morse <james.morse@arm.com>
More trivial stuff. It is clearly that kind of a day.

> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index c2650abb99ec..d5f75ed67e46 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c


> +int resctrl_arch_set_cdp_enabled(enum resctrl_res_level ignored, bool enable)
> +{
> +	u32 partid_i, partid_d;
> +
> +	cdp_enabled = enable;
> +	partid_i = partid_d = RESCTRL_RESERVED_CLOSID;


I'd do these at the declarations.  The kernel style guide does also
say not to do multiple assignments on one line. Obviously this
one is fairly obviously fine but none the less...

> +
> +	if (enable) {
> +		u32 partid = RESCTRL_RESERVED_CLOSID;
> +
> +		partid_d = resctrl_get_config_index(partid, CDP_CODE);
> +		partid_i = resctrl_get_config_index(partid, CDP_DATA);
> +	}
> +
> +	mpam_set_task_partid_pmg(current, partid_d, partid_i, 0, 0);
> +	WRITE_ONCE(arm64_mpam_global_default, mpam_get_regval(current));
> +
> +	resctrl_reset_task_closids();
> +
> +	return 0;
> +}


> @@ -272,6 +369,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
>  int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
>  			    u32 closid, enum resctrl_conf_type t, u32 cfg_val)
>  {
> +	int err;
>  	u32 partid;
>  	struct mpam_config cfg;
>  	struct mpam_props *cprops;
> @@ -311,7 +409,22 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
>  		return -EINVAL;
>  	}
>  
> -	return mpam_apply_config(dom->ctrl_comp, partid, &cfg);
> +	/*
> +	 * When CDP is enabled, but the resource doesn't support it, we need to
> +	 * apply the same configuration to the other partid.
> +	 */
> +	if (mpam_resctrl_hide_cdp(r->rid)) {
> +		partid = resctrl_get_config_index(closid, CDP_CODE);
> +		err = mpam_apply_config(dom->ctrl_comp, partid, &cfg);
> +		if (err)
> +			return err;
> +
> +		partid = resctrl_get_config_index(closid, CDP_DATA);
> +		return mpam_apply_config(dom->ctrl_comp, partid, &cfg);

Given you returned, maybe drop the else which will reduce the diff
as well as a bonus.  Definitely drop this blank line.

> +
> +	} else {
> +		return mpam_apply_config(dom->ctrl_comp, partid, &cfg);
> +	}
>  }



