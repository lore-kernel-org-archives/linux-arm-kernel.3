Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF3ACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 17:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNA5rK+BwCyPa7v4izOm+aNcFUyT8PKu95FOmdVNe7k=; b=xjS5HFhpoiSwqnXdR4mKmqJbpn
	i8nnFQnLbfYBx/EcJ1brOOQYL4mKNi9/dU4cbZxJKrH6ZKUgnZwEtCmhAmQtBrA4STiuTynawzSek
	8rdRb4CYUMRLtdaUXnxuDR0UfnhlTfGSkRQ2aPGht6xcIVC0X+exNzKlLw0kdV4JAVAxd3gp/ZT/j
	GtvjQo0JvRNzq+GBSkW5zze5+LkzJg/TYZF7dHbK2k6Lha4HQn6FvgICPbEsRq0yJU18MZZDdZIdU
	mTz5LULXwt458rbCWPGR92V7fs6LYRTYGuAsdsrPvZ0QYpZuG8ZM0CSFO+nVMf8Dv+BG6U7bhz8ii
	VuvkITXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVfy-00000005trp-0xAc;
	Mon, 10 Nov 2025 17:27:34 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVfv-00000005trL-116J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 17:27:33 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d4xRz5k1QzHnGjG;
	Tue, 11 Nov 2025 01:27:11 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 49F8E14033C;
	Tue, 11 Nov 2025 01:27:27 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 10 Nov
 2025 17:27:25 +0000
Date: Mon, 10 Nov 2025 17:27:24 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: <james.morse@arm.com>, <amitsinght@marvell.com>,
	<baisheng.gao@unisoc.com>, <baolin.wang@linux.alibaba.com>,
	<bobo.shaobowang@huawei.com>, <carl@os.amperecomputing.com>,
	<catalin.marinas@arm.com>, <dakr@kernel.org>, <dave.martin@arm.com>,
	<david@redhat.com>, <dfustini@baylibre.com>, <fenghuay@nvidia.com>,
	<gregkh@linuxfoundation.org>, <gshan@redhat.com>, <guohanjun@huawei.com>,
	<jeremy.linton@arm.com>, <kobak@nvidia.com>, <lcherian@marvell.com>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<lpieralisi@kernel.org>, <peternewman@google.com>, <quic_jiles@quicinc.com>,
	<rafael@kernel.org>, <robh@kernel.org>, <rohit.mathew@arm.com>,
	<scott@os.amperecomputing.com>, <sdonthineni@nvidia.com>,
	<sudeep.holla@arm.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
	<xhao@linux.alibaba.com>
Subject: Re: [PATCH 23/33] arm_mpam: Allow configuration to be applied and
 restored during cpu online
Message-ID: <20251110172724.00005675@huawei.com>
In-Reply-To: <20251107123450.664001-24-ben.horgan@arm.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
	<20251107123450.664001-24-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_092731_591415_22EEE752 
X-CRM114-Status: GOOD (  22.20  )
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

On Fri, 7 Nov 2025 12:34:40 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> From: James Morse <james.morse@arm.com>
> 
> When CPUs come online the MSC's original configuration should be restored.
> 
> Add struct mpam_config to hold the configuration. This has a bitmap of
> features that were modified. Once the maximum partid is known, allocate

I'm not following 'were modified'.  When?  Sometime in the past?
Perhaps "features that have been modified when XXX happens" or

Having read the code I think this is something like "are modified as configuration
is read".

> a configuration array for each component, and reprogram each RIS
> configuration from this.
> 
> CC: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Cc: Shaopeng Tan (Fujitsu) tan.shaopeng@fujitsu.com
> Cc: Peter Newman peternewman@google.com
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v3:
> Drop tags
> Fix component reset, otherwise cpbm wrong and controls not set.
> Add a cfg_lock to guard configuration of an msc

The use of bitmap_set() for things that aren't unsigned long (arrays) is a bad
idea. Much better to use GENMASK() to fill those.

> ---
>  drivers/resctrl/mpam_devices.c  | 268 ++++++++++++++++++++++++++++++--
>  drivers/resctrl/mpam_internal.h |  27 ++++
>  2 files changed, 280 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 3a0ad8d93fff..8b0944bdaf28 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c



> @@ -1125,6 +1225,9 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>  	if (err)
>  		return ERR_PTR(err);
>  	err = devm_mutex_init(dev, &msc->error_irq_lock);
> +	if (err)
> +		return ERR_PTR(err);
Trivial: As in earlier patches. I'd put a blank line here for readability.
> +	err = devm_mutex_init(dev, &msc->cfg_lock);
>  	if (err)
>  		return ERR_PTR(err);
>  	mpam_mon_sel_lock_init(msc);
> @@ -1585,6 +1688,70 @@ static void mpam_unregister_irqs(void)
>  	}
>  }
>  
> +static void __destroy_component_cfg(struct mpam_component *comp)
> +{
> +	add_to_garbage(comp->cfg);
> +}
> +
> +static void mpam_reset_component_cfg(struct mpam_component *comp)
> +{
> +	int i;
> +	struct mpam_props *cprops = &comp->class->props;
> +
> +	mpam_assert_partid_sizes_fixed();
> +
> +	if (!comp->cfg)
> +		return;
> +
> +	for (i = 0; i <= mpam_partid_max; i++) {
> +		comp->cfg[i] = (struct mpam_config) {};
> +		bitmap_fill(comp->cfg[i].features, MPAM_FEATURE_LAST);
> +		bitmap_set((unsigned long *)&comp->cfg[i].cpbm, 0, cprops->cpbm_wd);

Why manipulate a u32 with bitmap_set() with a horrible pretend it's an unsigned long cast.
Instead just do:
		comp->cfg[i].cpbm = GENMASK(cprops->cpbm_wd, 0);
Which is indeed what bitmap_set will do internally due to an optimization for small bitmaps
but lets avoid that making one integer pretend to be another of a different length.


> +		bitmap_set((unsigned long *)&comp->cfg[i].mbw_pbm, 0, cprops->mbw_pbm_bits);
> +		bitmap_set((unsigned long *)&comp->cfg[i].mbw_max, 16 - cprops->bwa_wd, cprops->bwa_wd);
> +	}
> +}


