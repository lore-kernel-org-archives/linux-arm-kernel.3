Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AA8D6D220
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 13:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2fubwmjnCd+xxEpXO//Qor30liBM/QpkqxXgI8/MGo=; b=sPjTbNcxiPKkom4QLuZt5qiArW
	+R+Pz1RZq5pq+Oigtxc8FeizlgVqB5bP+bkglj8DckTTN76QIswfyKaCYOpyGBuuxA/bsiC47fw5q
	r8M+A+DNq1tTaviK32WUcmVtPqnBmcOc5FSBwvd/zNl7HApvdkrFhV59GUw1ZMVu0RHIGvV0pzfdL
	Y6U7cmN95Hj2jgk7CvKndclEMxIZqpPYSXAXyvur4wnSBVM0f2pRfCnWYMOQU+GtZs99Z11eRNheC
	FqBZlgbgSmfJnhJEz6fBaSqMB0BOz73eIpgkkJbA8NrAazehw1zNNdQZc/I90AYY5b7tfANu0AOgx
	L6VXF+QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWEHJ-00000008YeF-0bHJ;
	Thu, 18 Dec 2025 13:42:49 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWEHG-00000008Ydk-1euL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 13:42:47 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dXBfr4r26zJ46Zm;
	Thu, 18 Dec 2025 21:42:12 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id B04C540576;
	Thu, 18 Dec 2025 21:42:43 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 18 Dec
 2025 13:42:42 +0000
Date: Thu, 18 Dec 2025 13:42:40 +0000
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
Subject: Re: [RFC PATCH 21/38] arm_mpam: resctrl: Pre-allocate assignable
 monitors
Message-ID: <20251218134240.00000a96@huawei.com>
In-Reply-To: <20251205215901.17772-22-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
	<20251205215901.17772-22-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_054246_729711_6BE6C82D 
X-CRM114-Status: GOOD (  21.30  )
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

On Fri, 5 Dec 2025 21:58:44 +0000
James Morse <james.morse@arm.com> wrote:

> When there are not enough monitors, MPAM is able to emulate ABMC by making
> a smaller number of monitors assignable. These monitors still need to be
> allocated from the driver, and mapped to whichever control/monitor group
> resctrl wants to use them with.
> 
> Add a second array to hold the monitor values indexed by resctrl's
> cntr_id.
> 
> When CDP is in use, two monitors are needed so the available number of
> counters halves. Platforms with one monitor will have zero monitors
> when CDP is in use.
> 
> Signed-off-by: James Morse <james.morse@arm.com>

> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index de5220fed97d..f607feaf0126 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c

> @@ -806,6 +863,41 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
>  	return comp->comp_id;
>  }
>  
> +/*
> + * This must run after all event counters have been picked so that any free
> + * running counters have already been allocated.
> + */
> +static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
> +{
> +	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
> +	size_t array_size = resctrl_arch_system_num_rmid_idx() * sizeof(int);
> +	int *rmid_array __free(kfree) = kmalloc(array_size, GFP_KERNEL);

kcalloc?  Given you call it an array I assume it is one.  Will zero though
and if you really care about optimizing that out add a comment.

Move this...

> +	struct rdt_resource *l3 = &res->resctrl_res;
> +	struct mpam_class *class = mon->class;
> +	u16 num_mbwu_mon;
> +
> +	if (mon->mbwu_idx_to_mon) {
> +		pr_debug("monitors free running\n");
> +		return 0;
> +	}

Down to here.  See cleanup.h notes that summarize how much Linus doesn't want
people not declaring these inline because of how much it hurts readability.

> +
> +	if (!rmid_array) {
> +		pr_debug("Failed to allocate RMID array\n");
> +		return -ENOMEM;
> +	}
> +	memset(rmid_array, -1, array_size);
> +
> +	num_mbwu_mon = class->props.num_mbwu_mon;
> +	mon->assigned_counters = __alloc_mbwu_array(mon->class, num_mbwu_mon);
> +	if (IS_ERR(mon->assigned_counters))
> +		return PTR_ERR(mon->assigned_counters);
> +	mon->mbwu_idx_to_mon = no_free_ptr(rmid_array);
> +
> +	mpam_resctrl_monitor_sync_abmc_vals(l3);
> +
> +	return 0;
> +}
> +
>  static void mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
>  				      enum resctrl_event_id type)
>  {
> @@ -847,6 +939,16 @@ static void mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
>  		 * space.
>  		 */
>  		l3->mon.num_rmid = 1;
> +
> +		switch (type) {
> +		case QOS_L3_MBM_LOCAL_EVENT_ID:
> +		case QOS_L3_MBM_TOTAL_EVENT_ID:
> +			mpam_resctrl_monitor_init_abmc(mon);
> +
> +			return;
> +		default:
> +			return;
> +		}
>  	}
>  }
>  


