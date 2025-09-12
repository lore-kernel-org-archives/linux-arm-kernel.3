Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17407CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 13:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEKR4iWy2sHCx3bRqzYAl63htPeGw1ySGnz66+N2cJ0=; b=XvarJBlNls/ql4XpDbFNrfnseS
	mJL00PzOdsPooNt2QfC9rJgw51EaO15D8tbKzfIiKtVJcX6TkxmaR3olltBVYXGKUOIwQninbI7eZ
	E3xx/Kvsy0VbRzYOLfLUJpSEmefI8H/ejA4sYcW46LaxCMN/6QAD1Z8his3lcw5H9qSUWAftUSTh4
	ldMLhJXpBjLQ/pIsMS5Mqo7mLa5pTYrnrlm6xygbThZSwEdpii6n8CyzQqrC1U/82oHqk5W0UrQF0
	rDEpU2rsCGY+mCJGQlDzKK47jALDNgj01CM0rmBT7i/ny8V5orjqUWt9c0BYL4pR7EbncW7f5HNL8
	k9wbgUJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3Ys-00000009SWY-1x1V;
	Fri, 12 Sep 2025 13:11:34 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3Yp-00000009SUf-3VNY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 13:11:33 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cNZXb5JGLz6GDFb;
	Fri, 12 Sep 2025 21:10:07 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id E29FC1402A4;
	Fri, 12 Sep 2025 21:11:25 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 12 Sep
 2025 15:11:24 +0200
Date: Fri, 12 Sep 2025 14:11:23 +0100
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
	Danilo Krummrich <dakr@kernel.org>, Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH v2 22/29] arm_mpam: Add helpers to allocate monitors
Message-ID: <20250912141123.000068e2@huawei.com>
In-Reply-To: <20250910204309.20751-23-james.morse@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
	<20250910204309.20751-23-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_061132_167859_D835BC38 
X-CRM114-Status: GOOD (  18.69  )
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

On Wed, 10 Sep 2025 20:43:02 +0000
James Morse <james.morse@arm.com> wrote:

> MPAM's MSC support a number of monitors, each of which supports
> bandwidth counters, or cache-storage-utilisation counters. To use
> a counter, a monitor needs to be configured. Add helpers to allocate
> and free CSU or MBWU monitors.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>

One minor requested change inline that will probably otherwise get picked
up by someone's cleanup script

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  drivers/resctrl/mpam_devices.c  |  2 ++
>  drivers/resctrl/mpam_internal.h | 35 +++++++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index f536ebbcf94e..cf190f896de1 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -340,6 +340,8 @@ mpam_class_alloc(u8 level_idx, enum mpam_class_types type)
>  	class->level = level_idx;
>  	class->type = type;
>  	INIT_LIST_HEAD_RCU(&class->classes_list);
> +	ida_init(&class->ida_csu_mon);
> +	ida_init(&class->ida_mbwu_mon);
>  
>  	list_add_rcu(&class->classes_list, &mpam_classes);
>  
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 326ba9114d70..81c4c2bfea3d 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -210,6 +210,9 @@ struct mpam_class {
>  	/* member of mpam_classes */
>  	struct list_head	classes_list;
>  
> +	struct ida		ida_csu_mon;
> +	struct ida		ida_mbwu_mon;
> +
>  	struct mpam_garbage	garbage;
>  };
>  
> @@ -288,6 +291,38 @@ struct mpam_msc_ris {
>  	struct mpam_garbage	garbage;
>  };
>  
> +static inline int mpam_alloc_csu_mon(struct mpam_class *class)
> +{
> +	struct mpam_props *cprops = &class->props;
> +
> +	if (!mpam_has_feature(mpam_feat_msmon_csu, cprops))
> +		return -EOPNOTSUPP;
> +
> +	return ida_alloc_range(&class->ida_csu_mon, 0, cprops->num_csu_mon - 1,
> +			       GFP_KERNEL);
> +}
> +
> +static inline void mpam_free_csu_mon(struct mpam_class *class, int csu_mon)
> +{
> +	ida_free(&class->ida_csu_mon, csu_mon);
> +}
> +
> +static inline int mpam_alloc_mbwu_mon(struct mpam_class *class)
> +{
> +	struct mpam_props *cprops = &class->props;
> +
> +	if (!mpam_has_feature(mpam_feat_msmon_mbwu, cprops))
> +		return -EOPNOTSUPP;
> +
> +	return ida_alloc_range(&class->ida_mbwu_mon, 0,
> +			       cprops->num_mbwu_mon - 1, GFP_KERNEL);

ida_alloc_max() - which is just a wrapper that sets the minimum to 0
but none the less perhaps conveys things slightly better.

> +}
> +
> +static inline void mpam_free_mbwu_mon(struct mpam_class *class, int mbwu_mon)
> +{
> +	ida_free(&class->ida_mbwu_mon, mbwu_mon);
> +}
> +
>  /* List of all classes - protected by srcu*/
>  extern struct srcu_struct mpam_srcu;
>  extern struct list_head mpam_classes;


