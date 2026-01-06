Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C828C47BFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 14:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAQWyKVF4TSj/Gs80bnTAyANjIn9+EoV7rBhLBxk1QU=; b=g8nRjgacI+FtakOy8EpGyVLXJE
	dly66yIbeJPdyeXmTUpbY5iuu1SeRKXYPP/XtCBARwQeJOhiwSUQDTumQ14yED8PS4KK7WbUjyZLN
	9c67pgtbC7myQKVxJ8HzERYdnSil5M2cVbepI8tesFG2aw42srBRMVoir01FfABGym+Iv95Ogh1hh
	w6y3Wz7GRTAbL06oaAvE4NUjxe2T7C8R5ufVB/iWT/5laT8WJymFi+peH3UtZJ7Xz0a6SqGKD/3NB
	RVV3VL79zi257OuhHFZm47w4RXLVi1SfZF1QYRwU82hBoR0ir2xSRr77YatXu8fKOeoePruamZCBy
	aS3i+M1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd84D-0000000DHup-1Wep;
	Tue, 06 Jan 2026 14:29:49 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd84A-0000000DHty-368C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 14:29:48 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dltpp5BHDzJ4682;
	Tue,  6 Jan 2026 22:29:38 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 62E614056F;
	Tue,  6 Jan 2026 22:29:40 +0800 (CST)
Received: from localhost (10.195.245.156) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 14:29:38 +0000
Date: Tue, 6 Jan 2026 14:29:37 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <reinette.chatre@intel.com>,
	<rohit.mathew@arm.com>, <scott@os.amperecomputing.com>,
	<sdonthineni@nvidia.com>, <tan.shaopeng@fujitsu.com>,
	<xhao@linux.alibaba.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<corbet@lwn.net>, <maz@kernel.org>, <oupton@kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <kvmarm@lists.linux.dev>
Subject: Re: [PATCH v2 30/45] arm_mpam: resctrl: Pre-allocate assignable
 monitors
Message-ID: <20260106142937.00000e33@huawei.com>
In-Reply-To: <20251219181147.3404071-31-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
	<20251219181147.3404071-31-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.195.245.156]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_062947_067327_6D49FCB4 
X-CRM114-Status: GOOD (  19.27  )
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

On Fri, 19 Dec 2025 18:11:32 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> From: James Morse <james.morse@arm.com>
> 
> When there are not enough monitors, MPAM is able to emulate ABMC by making
> a smaller number of monitors assignable. These monitors still need to be
> allocated from the driver, and mapped to whichever control/monitor group
> resctrl wants to use them with.
> 
> Add a second array to hold the monitor values indexed by resctrl's cntr_id.
> 
> When CDP is in use, two monitors are needed so the available number of
> counters halves. Platforms with one monitor will have zero monitors when
> CDP is in use.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> Move __free
> kmalloc -> kcalloc
>  

Trivial comments only,
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

>  static inline int mpam_alloc_csu_mon(struct mpam_class *class)
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index bea16bc096f7..e96d320c219c 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c

> +/*
> + * This must run after all event counters have been picked so that any free
> + * running counters have already been allocated.
> + */
> +static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
> +{
> +	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
> +	struct rdt_resource *l3 = &res->resctrl_res;
> +	struct mpam_class *class = mon->class;
> +	u16 num_mbwu_mon;
> +
> +	if (mon->mbwu_idx_to_mon) {
> +		pr_debug("monitors free running\n");
> +		return 0;
> +	}
> +
> +	int *rmid_array __free(kfree) =
> +		kcalloc(resctrl_arch_system_num_rmid_idx(), sizeof(int), GFP_KERNEL);

It's a long line, but I'd prefer sizeof(*rmid_array).
could use kmalloc_array to avoid zeroing just before you fill it with -1.

> +
> +	if (!rmid_array) {
> +		pr_debug("Failed to allocate RMID array\n");
> +		return -ENOMEM;
> +	}
> +	memset(rmid_array, -1, resctrl_arch_system_num_rmid_idx() * sizeof(int));
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



