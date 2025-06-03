Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A16C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 08:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jU949Yjzmup9pWrbnW8zZ5QB7r3zZXnxP+6dfTyVWWE=; b=XRuNqurp1p6zcSeWu49fKaG6ex
	cafeaimtKkty31Tkbnqbt8qEChSOaMi+Ti4jMoVInmtNBFUGxKygDe+Ub2s2eV5ZG+0AVKqfem+jb
	PBC5t6tUb21mewlM2JmqU1t2Im4zHKcN47oSL/ZwIdDGDtV6rrFy5CWp8iZ322ik5zF1t1g7JsV8g
	iMaDufB2IFhBVrVRSa8j4XQ5M1CsHVlJdbRGb0EgAGotAmqoHEXfjpuSO2tVavQS/EFuDR4jVUYEo
	bkHJ/3Dim5/Dn4WFIV8AWdky/X6YHHCD4nRDt5dKOw/3svxAKoFtLiEEs2rm3DDncO7/bmCHZIzgl
	r4UcduQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMMxV-0000000AK9s-3ezj;
	Tue, 03 Jun 2025 08:25:21 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMMvJ-0000000AJiz-1VOj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 08:23:07 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bBNwN2qyLztRw8;
	Tue,  3 Jun 2025 16:21:40 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id 8D564180B3F;
	Tue,  3 Jun 2025 16:22:53 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 3 Jun 2025 16:22:52 +0800
Subject: Re: [PATCH v2 3/5] genirq/msi: Move prepare() call to per-device
 allocation
To: Marc Zyngier <maz@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Sascha Bischoff <sascha.bischoff@arm.com>, Timothy
 Hayes <timothy.hayes@arm.com>
References: <20250513163144.2215824-1-maz@kernel.org>
 <20250513163144.2215824-4-maz@kernel.org>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <0b1d7aec-1eac-a9cd-502a-339e216e08a1@huawei.com>
Date: Tue, 3 Jun 2025 16:22:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20250513163144.2215824-4-maz@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_012305_716969_55DDBA86 
X-CRM114-Status: GOOD (  28.61  )
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

Hi Marc,

On 2025/5/14 0:31, Marc Zyngier wrote:
> The current device MSI infrastructure is subtly broken, as it
> will issue an .msi_prepare() callback into the MSI controller
> driver every time it needs to allocate an MSI. That's pretty wrong,
> as the contract (or unwarranted assumption, depending who you ask)
> between the MSI controller and the core code is that .msi_prepare()
> is called exactly once per device.
> 
> This leads to some subtle breakage in said MSI controller drivers,
> as it gives the impression that there are multiple endpoints sharing
> a bus identifier (RID in PCI parlance, DID for GICv3+). It implies
> that whatever allocation the ITS driver (for example) has done on
> behalf of these devices cannot be undone, as there is no way to
> track the shared state. This is particularly bad for wire-MSI devices,
> for which .msi_prepare() is called for. each. input. line.
> 
> To address this issue, move the call to .msi_prepare() to take place
> at the point of irq domain allocation, which is the only place that
> makes sense. The msi_alloc_info_t structure is made part of the
> msi_domain_template, so that its life-cycle is that of the domain
> as well.
> 
> Finally, the msi_info::alloc_data field is made to point at this
> allocation tracking structure, ensuring that it is carried around
> the block.
> 
> This is all pretty straightforward, except for the non-device-MSI
> leftovers, which still have to call .msi_prepare() at the old
> spot. One day...
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  include/linux/msi.h |  2 ++
>  kernel/irq/msi.c    | 35 +++++++++++++++++++++++++++++++----
>  2 files changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/msi.h b/include/linux/msi.h
> index 63c23003ec9b7..ba1c77a829a1c 100644
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -516,12 +516,14 @@ struct msi_domain_info {
>   * @chip:	Interrupt chip for this domain
>   * @ops:	MSI domain ops
>   * @info:	MSI domain info data
> + * @alloc_info:	MSI domain allocation data (arch specific)
>   */
>  struct msi_domain_template {
>  	char			name[48];
>  	struct irq_chip		chip;
>  	struct msi_domain_ops	ops;
>  	struct msi_domain_info	info;
> +	msi_alloc_info_t	alloc_info;
>  };
>  
>  /*
> diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
> index 31378a2535fb9..07eb857efd15e 100644
> --- a/kernel/irq/msi.c
> +++ b/kernel/irq/msi.c
> @@ -59,7 +59,8 @@ struct msi_ctrl {
>  static void msi_domain_free_locked(struct device *dev, struct msi_ctrl *ctrl);
>  static unsigned int msi_domain_get_hwsize(struct device *dev, unsigned int domid);
>  static inline int msi_sysfs_create_group(struct device *dev);
> -
> +static int msi_domain_prepare_irqs(struct irq_domain *domain, struct device *dev,
> +				   int nvec, msi_alloc_info_t *arg);
>  
>  /**
>   * msi_alloc_desc - Allocate an initialized msi_desc
> @@ -1023,6 +1024,7 @@ bool msi_create_device_irq_domain(struct device *dev, unsigned int domid,
>  	bundle->info.ops = &bundle->ops;
>  	bundle->info.data = domain_data;
>  	bundle->info.chip_data = chip_data;
> +	bundle->info.alloc_data = &bundle->alloc_info;
>  
>  	pops = parent->msi_parent_ops;
>  	snprintf(bundle->name, sizeof(bundle->name), "%s%s-%s",
> @@ -1061,11 +1063,18 @@ bool msi_create_device_irq_domain(struct device *dev, unsigned int domid,
>  	if (!domain)
>  		return false;
>  
> +	domain->dev = dev;
> +	dev->msi.data->__domains[domid].domain = domain;
> +
> +	if (msi_domain_prepare_irqs(domain, dev, hwsize, &bundle->alloc_info)) {

Does it work for MSI? hwsize is 1 in the MSI case, without taking
pci_msi_vec_count() into account.

bool pci_setup_msi_device_domain(struct pci_dev *pdev)
{
	[...]

	return pci_create_device_domain(pdev, &pci_msi_template, 1);

Thanks,
Zenghui

