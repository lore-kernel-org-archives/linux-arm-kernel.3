Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7C6C98331
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 14:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Av0ZwOu/U3nt+lp6tcQcqW8Tx9VbHKbjDx4QA2+SZ0U=; b=11G7MtTSudhTbyXpwdKo38C+VR
	QU74GvecjnRRTnu7bVbk57hGjiWsgZ8IE6mOzPOvzlzWMOAbm92d3cNdWRw5FpVJLilMY/gN7ShDK
	8nMMcZuKP69Qft/el0MQc0zNL665PJoEQizpoEeJ20vb2vMleJi6aD0si1gXiT/yS+6WLOoGpq6X/
	Saq25TxM8SNSw6UvQEFActG/cMdA0zTeb+JzoJl12FbYM85dShG7WXTeGjgfSdrjSVku5LZfwXbLK
	79CD9JyIhf8FbtVaa0K2kFk8GWgRbKGDpY91wEtuJ+YQttFt3oqk0VFvZOuDmHfCKWanAX8p2Bz4s
	bd3+shXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd88J-0000000DIOW-1E8o;
	Tue, 06 Jan 2026 14:34:03 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd88G-0000000DIMO-1bqq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 14:34:01 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dltvf6MVlzHnHBS;
	Tue,  6 Jan 2026 22:33:50 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 36E344056A;
	Tue,  6 Jan 2026 22:33:55 +0800 (CST)
Received: from localhost (10.195.245.156) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 14:33:53 +0000
Date: Tue, 6 Jan 2026 14:33:49 +0000
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
Subject: Re: [PATCH v2 32/45] arm_mpam: resctrl: Add
 resctrl_arch_config_cntr() for ABMC use
Message-ID: <20260106143349.000007f3@huawei.com>
In-Reply-To: <20251219181147.3404071-33-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
	<20251219181147.3404071-33-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.195.245.156]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_063400_568988_760DD3AC 
X-CRM114-Status: GOOD (  15.59  )
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

On Fri, 19 Dec 2025 18:11:34 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> From: James Morse <james.morse@arm.com>
> 
> ABMC has a helper resctrl_arch_config_cntr() for changing the mapping
> between 'cntr_id' and a CLOSID/RMID pair.
> 
> Add the helper.
> 
> For MPAM this is done by updating the mon->mbwu_idx_to_mon[] array, and as
> usual CDP means it needs doing in three different ways.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  drivers/resctrl/mpam_resctrl.c | 37 ++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index e96d320c219c..328a81ab68b4 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -765,6 +765,43 @@ static void mpam_resctrl_pick_counters(void)
>  			     mpam_resctrl_counters[QOS_L3_MBM_TOTAL_EVENT_ID].class);
>  }
>  
> +static void __config_cntr(struct mpam_resctrl_mon *mon, u32 cntr_id,
> +			  enum resctrl_conf_type cdp_type, u32 closid, u32 rmid,
> +			  bool assign)
> +{
> +	u32 mbwu_idx, mon_idx = resctrl_get_config_index(cntr_id, cdp_type);
> +
> +	closid = resctrl_get_config_index(closid, cdp_type);
> +	mbwu_idx = resctrl_arch_rmid_idx_encode(closid, rmid);
> +	WARN_ON_ONCE(mon_idx > l3_num_allocated_mbwu);
> +
> +	if (assign)
> +		mon->mbwu_idx_to_mon[mbwu_idx] = mon->assigned_counters[mon_idx];
> +	else
> +		mon->mbwu_idx_to_mon[mbwu_idx] = -1;
> +}


