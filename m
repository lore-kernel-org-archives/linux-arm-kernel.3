Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433AED6D229
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 13:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OfAXsq0+zQ7R2M3GPntXZlpgd+xTHqIuu/wC3TWoI/c=; b=s261LBoS9Y00irGRl9k0gw1Ecb
	ZZ3jZXtjQnrUoUgLSZXEwxzAClKl/pI0q6GSv+3LXqpMM4pwjv5xjS8YFpe8u84AePkoPdXaVMQWh
	3G8r4NCvyD77L+k3rH0Ov13RL4xVKKSUi8JBR/jgAPUfBg3doXaH0BpOdNdq46YZp00NdK4IJDSzb
	ZKA26qMowB6WPOh1fjonAMdfKtJMLHnWIdZ+d2Um+SIFoWCrtEIjfIRl8Eti3bh6UKYi/9vJkdvoA
	Ip3kqwJ75p20054Wq91ptN9W3WCrcSlRFHzI7Uhaomjo7vZnReNJ+JcnGrHLhvmAnWdNuKG0Mr9+W
	j9/ja0nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWERe-00000008ZOJ-0fsP;
	Thu, 18 Dec 2025 13:53:30 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWERY-00000008ZMy-2dOO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 13:53:26 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dXBv430bRzJ46d3;
	Thu, 18 Dec 2025 21:52:48 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 761E240565;
	Thu, 18 Dec 2025 21:53:19 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 18 Dec
 2025 13:53:18 +0000
Date: Thu, 18 Dec 2025 13:53:17 +0000
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
Subject: Re: [RFC PATCH 25/38] arm_mpam: resctrl: Add
 resctrl_arch_rmid_read() and resctrl_arch_reset_rmid()
Message-ID: <20251218135317.000004ba@huawei.com>
In-Reply-To: <20251205215901.17772-26-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
	<20251205215901.17772-26-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_055324_955264_8435D45E 
X-CRM114-Status: GOOD (  20.39  )
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

On Fri, 5 Dec 2025 21:58:48 +0000
James Morse <james.morse@arm.com> wrote:

> resctrl uses resctrl_arch_rmid_read() to read counters. CDP emulation
> means the counter may need reading in three different ways. The same
> goes for reset.
> 
> The helpers behind the resctrl_arch_ functions will be re-used for the
> ABMC equivalent functions.
> 
> Add the rounding helper for checking monitor values while we're here.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  drivers/resctrl/mpam_resctrl.c | 154 +++++++++++++++++++++++++++++++++
>  include/linux/arm_mpam.h       |   5 ++
>  2 files changed, 159 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index a2b238d47117..dc8a819d0976 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -355,6 +355,160 @@ void resctrl_arch_mon_ctx_free(struct rdt_resource *r,
>  	resctrl_arch_mon_ctx_free_no_wait(evtid, mon_idx);
>  }
>  
> +static int
> +__read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
> +	   enum mpam_device_features mon_type,
> +	   int mon_idx,
> +	   enum resctrl_conf_type cdp_type, u32 closid, u32 rmid, u64 *val)
> +{
> +	struct mon_cfg cfg = { };
> +
> +	if (!mpam_is_enabled())
> +		return -EINVAL;
> +
> +	/* Shift closid to account for CDP */
> +	closid = resctrl_get_config_index(closid, cdp_type);
> +
> +	if (mon_idx == USE_PRE_ALLOCATED) {
> +		int mbwu_idx = resctrl_arch_rmid_idx_encode(closid, rmid);
> +		mon_idx = mon->mbwu_idx_to_mon[mbwu_idx];
> +		if (mon_idx == -1) {
> +			if (mpam_resctrl_abmc_enabled()) {
> +				/* Report Unassigned */
> +				return -ENOENT;
> +			}
> +			/* Report Unavailable */
> +			return -EINVAL;
> +		}
> +	}
> +
> +	cfg.mon = mon_idx;
> +	cfg.match_pmg = true;
> +	cfg.partid = closid;
> +	cfg.pmg = rmid;
Maybe use
	cfg = (struct mon_cfg) {
		.mon = ...

and drop the earlier initialization.

	};
> +
> +	if (irqs_disabled()) {
> +		/* Check if we can access this domain without an IPI */
> +		return -EIO;
> +	}
> +
> +	return mpam_msmon_read(mon_comp, &cfg, mon_type, val);
> +}
> +
> +static int read_mon_cdp_safe(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
> +			     enum mpam_device_features mon_type,
> +			     int mon_idx, u32 closid, u32 rmid, u64 *val)
> +{
> +	if (cdp_enabled) {
> +		u64 code_val = 0, data_val = 0;
> +		int err;
> +
> +		err = __read_mon(mon, mon_comp, mon_type, mon_idx,
> +				 CDP_CODE, closid, rmid, &code_val);
> +		if (err)
> +			return err;
> +
> +		err = __read_mon(mon, mon_comp, mon_type, mon_idx,
> +				 CDP_DATA, closid, rmid, &data_val);
> +		if (!err)
> +			*val += code_val + data_val;

I'd stick to out of line error handling and just spend a couple more lines
for readability.
		if (err)
			return err;

		*val += ..
		return 0;

> +		return err;
> +	}
> +
> +	return __read_mon(mon, mon_comp, mon_type, mon_idx,
> +			  CDP_NONE, closid, rmid, val);
> +}



