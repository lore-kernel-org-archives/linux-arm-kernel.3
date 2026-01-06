Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728D8CE9D45
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 14:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sKYb2Yi6IRrVeRgg1H4GGIOpNFRsvLGScMXMKPTWbg=; b=jKCAOzTYmsOpMA8l10Hv4Vxu4+
	U9cLnHrh9Kwg3Cl0ki3R4huFmvfdMS8wgKLxu8MXf6TiBulMHPmmnxa6yXw3/GP+FwmdAza3FiTJu
	rnOwjupdaBfldzlqNwz6Mx3RLGdeNWR1btngzPk6dBO6ZyW6GNSPddhTY8wxyDaXseUZoxYbL/Bo9
	L7VKVZ1mZYBu1kj7T4bYPj0+2rkDlHxV0m7TuAPB+1fEQqpD2xcmHfdERNi2KHqfMydhi65p0Hpep
	iB4GdvR0Qjop3yNJgV62DkhFIG1R1O2j0PTaFquktc7D/QNSDSairpHSEskRq2RCwTupkD+y286zZ
	eJiV7Fag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8WG-0000000DLpK-0hxT;
	Tue, 06 Jan 2026 14:58:48 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8WD-0000000DLoo-24Is
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 14:58:47 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlvS76XsDzHnGfC;
	Tue,  6 Jan 2026 22:58:31 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 447044056A;
	Tue,  6 Jan 2026 22:58:36 +0800 (CST)
Received: from localhost (10.195.245.156) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 14:58:34 +0000
Date: Tue, 6 Jan 2026 14:58:31 +0000
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
Subject: Re: [PATCH v2 39/45] arm_mpam: resctrl: Call resctrl_init() on
 platforms that can support resctrl
Message-ID: <20260106145831.000055aa@huawei.com>
In-Reply-To: <20251219181147.3404071-40-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
	<20251219181147.3404071-40-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.195.245.156]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_065845_819111_1BCAE046 
X-CRM114-Status: GOOD (  20.00  )
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

On Fri, 19 Dec 2025 18:11:41 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> From: James Morse <james.morse@arm.com>
> 
> Now that MPAM links against resctrl, call resctrl_init() to register the
> filesystem and setup resctrl's structures.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

Just minor suggestions inline.  I'm not sure the for loop macros
are worth doing but that particular pair of loops feel awfully familiar
at this point, so maybe. 

Either way..

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 059148c38a38..bbb12b5dfd8c 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c

> @@ -1840,11 +1861,70 @@ int mpam_resctrl_setup(void)
>  		pr_warn("Number of PMG is not a power of 2! resctrl may misbehave");
>  	}
>  
> -	/* TODO: call resctrl_init() */
> +	err = resctrl_init();
> +	if (!err)
> +		WRITE_ONCE(resctrl_enabled, true);

Trivial but I'd prefer the error path out of line.

	if (err)
		return err;

	WRITE_ONCE(resctrl_enabled, true);
	
	return 0;
>  
>  	return err;
>  }

> +
> +/*
> + * The driver is detaching an MSC from this class, if resctrl was using it,
> + * pull on resctrl_exit().
> + */
> +void mpam_resctrl_teardown_class(struct mpam_class *class)
> +{
> +	int i;
> +	struct mpam_resctrl_res *res;
> +	struct mpam_resctrl_mon *mon;
> +
> +	might_sleep();
> +
> +	for (i = 0; i < RDT_NUM_RESOURCES; i++) {
There are enough iterators over these that I wonder
if it is worth some macros.
 
	for_each_mpam_resctrl_control(res) {
	}
and
	for_each_mpam_resctrl_counter(mon) {
	}


> +		res = &mpam_resctrl_controls[i];
> +		if (res->class == class) {
> +			res->class = NULL;
> +			break;
> +		}
> +	}
> +	for (i = 0; i < QOS_NUM_EVENTS; i++) {
> +		mon = &mpam_resctrl_counters[i];
> +		if (mon->class == class) {
> +			mon->class = NULL;
> +
> +			mpam_resctrl_teardown_mon(mon, class);
> +
> +			break;
> +		}
> +	}
> +}
> +
>  static int __init __cacheinfo_ready(void)
>  {
>  	cacheinfo_ready = true;


