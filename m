Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E47CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 17:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6gj7Y9KIE72fAuYms5mCRKN7+Q0kBQcfLtIwzlEoCo=; b=qNPUEPHdr3/jSYWCkouqHQ9BRQ
	rKkAJlg5/SyHgpNiqld0AJmZdffsvOSN9tJ0nvTUj+QSAFjb5nmdCjOUy558Ohegr847H4HjfZz7n
	2QJRoXPJJ6ehwD0J5vSAyDmsVkZNNHfddG1GbkyaiI0ZpcjSS7o9nhlxxAzKHgpapjg3Zn5rotrNB
	l23SMJg1MsaNvm89vbHw3bOm0eNjkD5iLJMXyeRr9ip/4qQtXpvXJkU7vj197ehHJkocxuteDQqUX
	WLemdRjfC3zq8iZL2MHm9eQgi9iZU1V4JcKuju8aCXLfXxyP5+87AWCieZiyJK5JEtABFXl6fJISw
	1eOhTn2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLtP-0000000A93p-2jaW;
	Fri, 24 Oct 2025 17:47:59 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLtN-0000000A93U-2Z7q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 17:47:59 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ctVdR3hSQz6M4f9;
	Sat, 25 Oct 2025 01:44:11 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id DCB5F1402ED;
	Sat, 25 Oct 2025 01:47:54 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 24 Oct
 2025 18:47:53 +0100
Date: Fri, 24 Oct 2025 18:47:51 +0100
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
	Danilo Krummrich <dakr@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
	Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v3 13/29] arm_mpam: Probe the hardware features resctrl
 supports
Message-ID: <20251024184751.00003a81@huawei.com>
In-Reply-To: <20251017185645.26604-14-james.morse@arm.com>
References: <20251017185645.26604-1-james.morse@arm.com>
	<20251017185645.26604-14-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_104757_962843_6DB9397F 
X-CRM114-Status: GOOD (  13.02  )
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

On Fri, 17 Oct 2025 18:56:29 +0000
James Morse <james.morse@arm.com> wrote:

> Expand the probing support with the control and monitor types
> we can use with resctrl.
> 
> CC: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>

Trivial thing inline. LGTM.

> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 1afc52b36328..be9ea0aab6d2 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -5,6 +5,7 @@
>  #define MPAM_INTERNAL_H
>  
>  #include <linux/arm_mpam.h>
> +#include <linux/bitmap.h>
>  #include <linux/cpumask.h>
>  #include <linux/io.h>
>  #include <linux/llist.h>
> @@ -13,6 +14,7 @@
>  #include <linux/sizes.h>
>  #include <linux/spinlock.h>
>  #include <linux/srcu.h>
> +#include <linux/types.h>
>  
>  #define MPAM_MSC_MAX_NUM_RIS	16
>  
> @@ -111,6 +113,33 @@ static inline void mpam_mon_sel_lock_init(struct mpam_msc *msc)
>  	raw_spin_lock_init(&msc->_mon_sel_lock);
>  }
>  
> +/* Bits for mpam features bitmaps */
> +enum mpam_device_features {
> +	mpam_feat_cpor_part = 0,

Given you are using this for internal stuff and the numbers don't mean anything explicit
I think you can drop the = 0.

> +	mpam_feat_mbw_part,
> +	mpam_feat_mbw_min,
> +	mpam_feat_mbw_max,
> +	mpam_feat_msmon,
> +	mpam_feat_msmon_csu,
> +	mpam_feat_msmon_csu_hw_nrdy,
> +	mpam_feat_msmon_mbwu,
> +	mpam_feat_msmon_mbwu_hw_nrdy,
> +	MPAM_FEATURE_LAST
> +};



