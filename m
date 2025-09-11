Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51161CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 15:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYZYtw/JPxg20sVGnfo3JOrkSaeDARxk45CELMND6dg=; b=cHRmQDkploMmUb+YH7wtp+Lt3M
	194qYbPVWpG9M+tx16m7kR/lYFOiWYXuW6zPIne8mSLTgY7Fr1mOcfgW1ssilVhpAUK4bySAKDrKO
	XynQKo1+XlddTmHQGnTQG1Y5OHQEGK4gjqE58WlW6b9he5owOFYWpBGHZtxxjcDQ0M5CFYRBSjadD
	P8/l++7RRos7342FvRsmvuJxrvrjlRApLCbzLxZggxJpckMlecBuLiHqvtPhNprVlQNz6aV1AHDwM
	efLcEt7CebQ8x32cjlQH/F6Q7LSd0CCWgPGLp2EToUz8f/Ys/dSJwV1sJVst+5+n3RDWtRrP1k8AU
	PtSFRe2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwj4g-00000003pkZ-2tgC;
	Thu, 11 Sep 2025 15:19:02 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwj4e-00000003piA-0OpR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 15:19:02 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cN1NY10YNz6LDBg;
	Thu, 11 Sep 2025 23:16:13 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 319A3140446;
	Thu, 11 Sep 2025 23:18:53 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 11 Sep
 2025 17:18:51 +0200
Date: Thu, 11 Sep 2025 16:18:50 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>, Koba
 Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	<fenghuay@nvidia.com>, <baisheng.gao@unisoc.com>, Rob Herring
	<robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>, "Rafael Wysocki"
	<rafael@kernel.org>, Len Brown <lenb@kernel.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 11/29] arm_mpam: Probe hardware to find the supported
 partid/pmg values
Message-ID: <20250911161850.00005667@huawei.com>
In-Reply-To: <20250910204309.20751-12-james.morse@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
	<20250910204309.20751-12-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_081900_424763_157D7FB6 
X-CRM114-Status: GOOD (  27.23  )
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

On Wed, 10 Sep 2025 20:42:51 +0000
James Morse <james.morse@arm.com> wrote:

> CPUs can generate traffic with a range of PARTID and PMG values,
> but each MSC may also have its own maximum size for these fields.
> Before MPAM can be used, the driver needs to probe each RIS on
> each MSC, to find the system-wide smallest value that can be used.
> The limits from requestors (e.g. CPUs) also need taking into account.
> 
> While doing this, RIS entries that firmware didn't describe are created
> under MPAM_CLASS_UNKNOWN.
> 
> While we're here, implement the mpam_register_requestor() call
> for the arch code to register the CPU limits. Future callers of this
> will tell us about the SMMU and ITS.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
Trivial stuff inline.
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
> Changes since v1:
>  * Change to lock ordering now that the list-lock mutex isn't held from
>    the cpuhp call.
>  * Removed irq-unmaksed assert in requestor register.
>  * Changed captialisation in print message.
> ---
>  drivers/resctrl/mpam_devices.c  | 150 +++++++++++++++++++++++++++++++-
>  drivers/resctrl/mpam_internal.h |   6 ++
>  include/linux/arm_mpam.h        |  14 +++
>  3 files changed, 169 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index c265376d936b..24dc81c15ec8 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c


> +int mpam_register_requestor(u16 partid_max, u8 pmg_max)
> +{
> +	int err = 0;
> +
> +	spin_lock(&partid_max_lock);
guard() perhaps so you can return early in the error pat and avoid
need for local variable err.

> +	if (!partid_max_init) {
> +		mpam_partid_max = partid_max;
> +		mpam_pmg_max = pmg_max;
> +		partid_max_init = true;
> +	} else if (!partid_max_published) {
> +		mpam_partid_max = min(mpam_partid_max, partid_max);
> +		mpam_pmg_max = min(mpam_pmg_max, pmg_max);
> +	} else {
> +		/* New requestors can't lower the values */
> +		if (partid_max < mpam_partid_max || pmg_max < mpam_pmg_max)
> +			err = -EBUSY;
> +	}
> +	spin_unlock(&partid_max_lock);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL(mpam_register_requestor);

> @@ -470,9 +547,37 @@ int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>  	return err;
>  }
>  
> +static struct mpam_msc_ris *mpam_get_or_create_ris(struct mpam_msc *msc,
> +						   u8 ris_idx)
> +{
> +	int err;
> +	struct mpam_msc_ris *ris, *found = ERR_PTR(-ENOENT);
> +
> +	lockdep_assert_held(&mpam_list_lock);
> +
> +	if (!test_bit(ris_idx, &msc->ris_idxs)) {
> +		err = mpam_ris_create_locked(msc, ris_idx, MPAM_CLASS_UNKNOWN,
> +					     0, 0);
> +		if (err)
> +			return ERR_PTR(err);
> +	}
> +
> +	list_for_each_entry(ris, &msc->ris, msc_list) {
> +		if (ris->ris_idx == ris_idx) {
> +			found = ris;
I'd return ris;

Then can do return ERR_PTR(-ENOENT) below and not bother with found.

Ignore if this gets more complex later.

> +			break;
> +		}
> +	}
> +
> +	return found;
> +}

> @@ -675,9 +813,18 @@ static struct platform_driver mpam_msc_driver = {
>  
>  static void mpam_enable_once(void)
>  {
> +	/*
> +	 * Once the cpuhp callbacks have been changed, mpam_partid_max can no
> +	 * longer change.
> +	 */
> +	spin_lock(&partid_max_lock);
> +	partid_max_published = true;
> +	spin_unlock(&partid_max_lock);
> +
>  	mpam_register_cpuhp_callbacks(mpam_cpu_online, mpam_cpu_offline);
>  
> -	pr_info("MPAM enabled\n");
> +	printk(KERN_INFO "MPAM enabled with %u PARTIDs and %u PMGs\n",
> +	       mpam_partid_max + 1, mpam_pmg_max + 1);

Not sure why pr_info before and printk now.  

>  }



