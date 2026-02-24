Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A54E9B259
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 12:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yCDCpzidXFJrqjKffj6ZqlqIj3OuDNjvIWiEPxPwWE=; b=ZpvpXTgMRR2B1bjIt8BG0DXbus
	T0vvyzwnIbBBT66HHMBqWYIWb3YMEtLr0BSJIN5vzQgQlcRWvlQNENiw5qM/T9llGTZaZgjt0eFyC
	rd5Fz8mPCMTjZmyYxTNwUQar4R+ZwwkMKmC10uCdrf0+Pga3xVKKsJUsOJk8nbEMQ1Z0iGljq/6A3
	x0cnm4zehhHEx04MKnWdQES0F5lvpCg8KkFhe1UcRDy0+ze594cAyUY3WIH+82yi9dvEPu1OCSxuV
	Xwh/Kfj+cO88d/lL04b9+ZldoJ2l1qRXRZsWOdQq1KJWqOx0zjdP4pZcbMn5MPHLcJS6vB7a+E3as
	gAaqNtqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vurBI-0000000219g-2r63;
	Tue, 24 Feb 2026 12:06:24 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vurBF-0000000218x-1EJT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 12:06:23 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fKxJN1R30zJ46fX;
	Tue, 24 Feb 2026 20:05:56 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id B598340539;
	Tue, 24 Feb 2026 20:06:17 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Feb
 2026 12:06:16 +0000
Date: Tue, 24 Feb 2026 12:06:15 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Nicolin Chen <nicolinc@nvidia.com>
CC: <jgg@nvidia.com>, <will@kernel.org>, <robin.murphy@arm.com>,
	<bhelgaas@google.com>, <joro@8bytes.org>, <praan@google.com>,
	<baolu.lu@linux.intel.com>, <kevin.tian@intel.com>,
	<miko.lenczewski@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <dan.j.williams@intel.com>
Subject: Re: [PATCH v2 3/3] iommu/arm-smmu-v3: Allow ATS to be always on
Message-ID: <20260224120615.00003ad9@huawei.com>
In-Reply-To: <bdeebd35e81cfa5f76d16706a775b23ee1f01fdd.1771886695.git.nicolinc@nvidia.com>
References: <cover.1771886695.git.nicolinc@nvidia.com>
	<bdeebd35e81cfa5f76d16706a775b23ee1f01fdd.1771886695.git.nicolinc@nvidia.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_040622_242400_85137B77 
X-CRM114-Status: GOOD (  22.72  )
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

On Mon, 23 Feb 2026 14:52:22 -0800
Nicolin Chen <nicolinc@nvidia.com> wrote:

> When a device's default substream attaches to an identity domain, the SMMU
> driver currently sets the device's STE between two modes:
> 
>   Mode 1: Cfg=Translate, S1DSS=Bypass, EATS=1
>   Mode 2: Cfg=bypass (EATS is ignored by HW)
> 
> When there is an active PASID (non-default substream), mode 1 is used. And
> when there is no PASID support or no active PASID, mode 2 is used.
> 
> The driver will also downgrade an STE from mode 1 to mode 2, when the last
> active substream becomes inactive.
> 
> However, there are PCIe devices that demand ATS to be always on. For these
> devices, their STEs have to use the mode 1 as HW ignores EATS with mode 2.
> 
> Change the driver accordingly:
>   - always use the mode 1
>   - never downgrade to mode 2
>   - allocate and retain a CD table (see note below)
> 
> Note that these devices might not support PASID, i.e. doing non-PASID ATS.
> In such a case, the ssid_bits is set to 0. However, s1cdmax must be set to
> a !0 value in order to keep the S1DSS field effective. Thus, when a master
> requires ats_always_on, set its s1cdmax to minimal 1, meaning the CD table
> will have a dummy entry (SSID=1) that will be never used.
> 
> Now, for these device, arm_smmu_cdtab_allocated() will always return true,
> v.s. false prior to this change. When its default substream is attached to
> an IDENTITY domain, its first CD is NULL in the table, which is a totally
> valid case. Thus, add "!master->ats_always_on" to the condition.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

In my head at least, it would be nice if a driver had to explicitly opt in
to this behavior. The presence of CXL.cache support for instance doesn't
actually mean the driver is going to enable it.  However it is probably
harmless so lets go with this as path of least resistance.

One trivial thing inline (ignore if you like!) Otherwise LGTM
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 4d00d796f0783..69d40918bc22f 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

> @@ -3274,7 +3294,10 @@ static void arm_smmu_attach_dev_ste(struct iommu_domain *domain,
>  		.old_domain = old_domain,
>  		.ssid = IOMMU_NO_PASID,
>  	};
> +	bool ats_always_on = false;
>  
> +	if (master->ats_always_on && s1dss != STRTAB_STE_1_S1DSS_TERMINATE)
> +		ats_always_on = true;
Maybe flatten this to not do the off then on dance.

	bool ats_always_on = master->ats_always_on && s1dss != STRTAB_STE_1_S1DSS_TERMINATE;



