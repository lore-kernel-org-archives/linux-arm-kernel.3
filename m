Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE318D6D22A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 14:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AmFATop4bVM5apN0tr5DzFV+iocSpIPIn9XyuuhFxbs=; b=ckpTQh+BFzVSrBaJKKrwP9pr9m
	ipLu9pzXPx8lgrJojGslc1OafCMIzEfapjno/Bv547EXdydV23TA4+R9AuJdqGfNCX3yM/RK9qCqT
	GMrWbey+jGYGgBxaGusdBy9PeEHM+EG0EaNIZfnf25VhOnwmRRyzGYvcU0Q1JPjtxuO9lXNw6OO2O
	erLOUwndHSBC4esX77BD51Nqede1PTTgoGk1yzzWmfZYi3q5AzSJllso04mcs4UKFLZWIofY/tsRx
	8Qb02wGuSBpcipFSZzKiUNZ4EHHl13tNRnt/QdYVV8PNSMgimhsprrdLSPOqc+MmiqgUc/SPttyqS
	r9BtYweg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWEc5-00000008aHh-3pLv;
	Thu, 18 Dec 2025 14:04:17 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWEc3-00000008aGl-0Fyr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 14:04:17 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dXC7X5stWzHnH4q;
	Thu, 18 Dec 2025 22:03:36 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 17A4B40569;
	Thu, 18 Dec 2025 22:04:04 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 18 Dec
 2025 14:04:02 +0000
Date: Thu, 18 Dec 2025 14:04:01 +0000
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
Subject: Re: [RFC PATCH 34/38] arm_mpam: Add quirk framework
Message-ID: <20251218140401.000062ce@huawei.com>
In-Reply-To: <20251205215901.17772-35-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
	<20251205215901.17772-35-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_060415_414151_4A628E8D 
X-CRM114-Status: GOOD (  23.11  )
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

On Fri, 5 Dec 2025 21:58:57 +0000
James Morse <james.morse@arm.com> wrote:

> From: Shanker Donthineni <sdonthineni@nvidia.com>
> 
> The MPAM specification includes the MPAMF_IIDR, which serves to
> uniquely identify the MSC implementation through a combination of
> implementer details, product ID, variant, and revision. Certain
> hardware issues/errata can be resolved using software workarounds.
> 
> Introduce a quirk framework to allow workarounds to be enabled based
> on the MPAMF_IIDR value.
> 
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> [ morse: Stash the IIDR so this doesn't need an IPI, enable quirks only
>   once, move the description to the callback so it can be pr_once()d, add
>   an enum of workarounds for popular errata. Add macros for making lists
>   of product/revision/vendor half readable ]
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c  | 27 +++++++++++++++++++++++++++
>  drivers/resctrl/mpam_internal.h | 26 ++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 741e14e1e6cf..f0f6f9b55ad4 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -630,6 +630,25 @@ static struct mpam_msc_ris *mpam_get_or_create_ris(struct mpam_msc *msc,
>  	return ERR_PTR(-ENOENT);
>  }
>  
> +static const struct mpam_quirk mpam_quirks[] = {
> +	{ NULL }, /* Sentinel */

Drop the trailing , given I assume whole point is nothing after this?

> +};
> +
> +static void mpam_enable_quirks(struct mpam_msc *msc)
> +{
> +	const struct mpam_quirk *quirk;
> +
> +	for (quirk = &mpam_quirks[0]; quirk->iidr_mask; quirk++) {
> +		if (quirk->iidr != (msc->iidr & quirk->iidr_mask))
> +			continue;
> +
> +		if (quirk->init)
> +			quirk->init(msc, quirk);

I'm curious why you don't return a bool from this and call
mpam_set_quirk() if that's not indicating it should not be set.
Seems a bit odd to push the tracking that is relevant to the generic
framework (mpam_set_quirk) down into the particular quirk inits.

> +		else
> +			mpam_set_quirk(quirk->workaround, msc);
> +	}
> +}

> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index d381906545ed..de3e5faa12b2 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -88,6 +88,8 @@ struct mpam_msc {
>  	u8			pmg_max;
>  	unsigned long		ris_idxs;
>  	u32			ris_max;
> +	u32			iidr;
> +	u16			quirks;
>  
>  	/*
>  	 * error_irq_lock is taken when registering/unregistering the error
> @@ -215,6 +217,29 @@ struct mpam_props {
>  #define mpam_set_feature(_feat, x)	set_bit(_feat, (x)->features)
>  #define mpam_clear_feature(_feat, x)	clear_bit(_feat, (x)->features)
>  
> +/* Workaround bits for msc->quirks */
> +enum mpam_device_quirks {
> +	MPAM_QUIRK_LAST,

Dropping this comma should make it harder for anyone to stick an entry
after this.

