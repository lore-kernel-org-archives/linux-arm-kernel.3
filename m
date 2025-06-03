Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98299C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 13:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtMuekYkbDUAbV7cQc7dtTW16jtfqNZYO6dnbo+XM7M=; b=ZPFQ3eiqX7sUZ58kOLCXhUZQ1J
	F1CQySy06ZQ5tAXqOwPcaNv1wnSseE/SWcpRQVpP2y//2IUef/d/KHzfU5N8iKIDmnzCaZimIYuwC
	G7BzLyD/9AqLHLBjowsONe8AkC94d355gIgfPDW8zmL78ikQ0/wVa0DiYlRyjojcSFLJYXR46eGI+
	vWTmcNsOYIfvTFCYDLt9j6RYM2SFWDCbYvO8lnk6KgROLKNESTJ47LEmFLLgoBt2QA6y6H5iSVjXt
	rk8wV+O44i3Uxui4RsexaqvqYI78ItbTP8fYSSWEcodlGv1+B4YSNJRNbAovNPCJVStevxidHWGJk
	3e+lzOSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRP4-0000000Azrh-3DNG;
	Tue, 03 Jun 2025 13:10:06 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRMI-0000000AzdM-0ovj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 13:07:15 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bBWCY1lSnz13Lvw;
	Tue,  3 Jun 2025 21:05:13 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id 85BA0140158;
	Tue,  3 Jun 2025 21:07:05 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 3 Jun 2025 21:07:04 +0800
Subject: Re: [PATCH v2 3/5] genirq/msi: Move prepare() call to per-device
 allocation
To: Marc Zyngier <maz@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Sascha Bischoff <sascha.bischoff@arm.com>, Timothy
 Hayes <timothy.hayes@arm.com>
References: <20250513163144.2215824-1-maz@kernel.org>
 <20250513163144.2215824-4-maz@kernel.org>
 <0b1d7aec-1eac-a9cd-502a-339e216e08a1@huawei.com>
 <87ldq9dm54.wl-maz@kernel.org>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <f0e9f15a-ade0-e79f-f26c-d9c9db42a0b4@huawei.com>
Date: Tue, 3 Jun 2025 21:07:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <87ldq9dm54.wl-maz@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_060714_554633_1944CC1E 
X-CRM114-Status: GOOD (  22.60  )
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

On 2025/6/3 20:50, Marc Zyngier wrote:
> Hi Zenghui,
> 
> On Tue, 03 Jun 2025 09:22:47 +0100,
> Zenghui Yu <yuzenghui@huawei.com> wrote:
> >
> > > +	domain->dev = dev;
> > > +	dev->msi.data->__domains[domid].domain = domain;
> > > +
> > > +	if (msi_domain_prepare_irqs(domain, dev, hwsize, &bundle->alloc_info)) {
> >
> > Does it work for MSI? hwsize is 1 in the MSI case, without taking
> > pci_msi_vec_count() into account.
> >
> > bool pci_setup_msi_device_domain(struct pci_dev *pdev)
> > {
> > 	[...]
> >
> > 	return pci_create_device_domain(pdev, &pci_msi_template, 1);
> 
> Well spotted.
> 
> This looks like a PCI bug ignoring Multi-MSI. Can you give the
> following a go and let people know whether that fixes your issue?

I hit this problem on Kunpeng920 with some HiSilicon SAS (Serial
Attached SCSI controller) on it. These controllers are MSI-capable and
didn't work after this commit.

# lspci -v -s 74:02.0
74:02.0 Serial Attached SCSI controller: Huawei Technologies Co., Ltd.
HiSilicon SAS 3.0 HBA (rev 21)
	Flags: bus master, fast devsel, latency 0, IRQ 42, NUMA node 0, IOMMU
group 27
	Memory at a2000000 (32-bit, non-prefetchable) [size=32K]
	Capabilities: [40] Express Root Complex Integrated Endpoint, MSI 00
	Capabilities: [80] MSI: Enable+ Count=32/32 Maskable+ 64bit+
	Capabilities: [b0] Power Management version 3
	Kernel driver in use: hisi_sas_v3_hw

> diff --git a/drivers/pci/msi/irqdomain.c b/drivers/pci/msi/irqdomain.c
> index d7ba8795d60f..89677a21d525 100644
> --- a/drivers/pci/msi/irqdomain.c
> +++ b/drivers/pci/msi/irqdomain.c
> @@ -287,7 +287,7 @@ static bool pci_create_device_domain(struct pci_dev *pdev, const struct msi_doma
>   *	- The device is removed
>   *	- MSI is disabled and a MSI-X domain is created
>   */
> -bool pci_setup_msi_device_domain(struct pci_dev *pdev)
> +bool pci_setup_msi_device_domain(struct pci_dev *pdev, unsigned int hwsize)
>  {
>  	if (WARN_ON_ONCE(pdev->msix_enabled))
>  		return false;
> @@ -297,7 +297,7 @@ bool pci_setup_msi_device_domain(struct pci_dev *pdev)
>  	if (pci_match_device_domain(pdev, DOMAIN_BUS_PCI_DEVICE_MSIX))
>  		msi_remove_device_irq_domain(&pdev->dev, MSI_DEFAULT_DOMAIN);
>  
> -	return pci_create_device_domain(pdev, &pci_msi_template, 1);
> +	return pci_create_device_domain(pdev, &pci_msi_template, hwsize);
>  }
>  
>  /**
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index 8b8848788618..81891701840a 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -449,7 +449,7 @@ int __pci_enable_msi_range(struct pci_dev *dev, int minvec, int maxvec,
>  	if (rc)
>  		return rc;
>  
> -	if (!pci_setup_msi_device_domain(dev))
> +	if (!pci_setup_msi_device_domain(dev, nvec))
>  		return -ENODEV;
>  
>  	for (;;) {
> diff --git a/drivers/pci/msi/msi.h b/drivers/pci/msi/msi.h
> index ee53cf079f4e..3ab898af88a7 100644
> --- a/drivers/pci/msi/msi.h
> +++ b/drivers/pci/msi/msi.h
> @@ -107,7 +107,7 @@ enum support_mode {
>  };
>  
>  bool pci_msi_domain_supports(struct pci_dev *dev, unsigned int feature_mask, enum support_mode mode);
> -bool pci_setup_msi_device_domain(struct pci_dev *pdev);
> +bool pci_setup_msi_device_domain(struct pci_dev *pdev, unsigned int hwsize);
>  bool pci_setup_msix_device_domain(struct pci_dev *pdev, unsigned int hwsize);
>  
>  /* Legacy (!IRQDOMAIN) fallbacks */

I have the exact same diff to get my box to work again ;-)

Tested-by: Zenghui Yu <yuzenghui@huawei.com>

Thanks for your fix!

Zenghui

