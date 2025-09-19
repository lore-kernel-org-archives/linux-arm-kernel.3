Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77DACAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 18:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WhIA505+XxPtES8+P6RPKgJ+oqFSRmR93CdSfYNTXeU=; b=xbCZfAGFXdmB2RLMemFEcGrzoz
	9cX2ERtx6mj2F8WjnHt0N2Nc3h7NPvHmPOIPJygSacLx9ivZPrG2/yuyQduerrVZV7DSGWcK10+WA
	+uuyB2+KQDyQDNEQpXix6Llegar5xjMIAxn3fu8zjLABBs31SoVFnbf8ha4pUxTUzalfhOE6ObcFW
	s4oXPRtDIa1k7PbHWBB+Je6Q5Jpu5lRheo/kxBT+c9PToNNLMS7hWSaaDGTTW2LainW7Pin2pVpWr
	5fvIgb8Rvp9KbUxFCPTYFKBM+h+DWZgc2ZLXmUMojB02sqaOwQDtMfVmShgWQsIwClnmlVU7Dukah
	l9eMMMqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzfuZ-00000003lrt-2ETw;
	Fri, 19 Sep 2025 18:32:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzfuX-00000003lrn-2yW0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 18:32:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB35D6013A;
	Fri, 19 Sep 2025 18:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C725C4CEFA;
	Fri, 19 Sep 2025 18:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758306764;
	bh=VKgiU8c9iEOAvCN7BHO0m6A30oFDWlZgDPEVP3PArSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N5lhDtP9xd3iTmU9NVqk1pzPriLedbqSXptHsIofMIkKODunPAhXUZkoAY3U+1sju
	 OMNQK2S2UUlR4nVaPDlBvzz5ebfaSvbxoSS0ARHUUg7VXlU95wDlZNj44DI7bZ8wNY
	 VJ84mbJLVqGyV9Yj41vRxfJlpiEg/78k6Y/gUratYiGjOiWlvN1QbeA2kmo4ZliyBu
	 wLLBlJw33uGoy7tmGSQop7Dho3C5gE+knbIEvvcIYDoCzOD7hMG132RiM+akLSyUxy
	 E4e8tcqLwvdv9w6wTcFA/o+/YP2YU9w6GDiT6LcRGDDKXtSN8Nq/6PJEvxuIToHIpt
	 FMSBheSSAeuTw==
Date: Sat, 20 Sep 2025 00:02:34 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, jingoohan1@gmail.com, christian.bruel@foss.st.com, 
	qiang.yu@oss.qualcomm.com, mayank.rana@oss.qualcomm.com, thippeswamy.havalige@amd.com, 
	shradha.t@samsung.com, quic_schintav@quicinc.com, inochiama@gmail.com, 
	cassel@kernel.org, kishon@kernel.org, sergio.paracuellos@gmail.com, 
	18255117159@163.com, rongqianfeng@vivo.com, jirislaby@kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v2 05/10] PCI: keystone: Add ks_pcie_free_msi_irq()
 helper for cleanup
Message-ID: <rbyukvvhzoch4p54usbrjpjlhd6qknhp2er6gfxhcj5lxpgrqh@5wnwiijn2g5f>
References: <20250912122356.3326888-1-s-vadapalli@ti.com>
 <20250912122356.3326888-6-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250912122356.3326888-6-s-vadapalli@ti.com>
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

On Fri, Sep 12, 2025 at 05:46:16PM +0530, Siddharth Vadapalli wrote:
> Introduce the helper function ks_pcie_free_msi_irq() which will undo the
> configuration performed by the ks_pcie_config_msi_irq() function. This will
> be required for implementing a future helper function to undo the
> configuration performed by the ks_pcie_host_init() function.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
> 
> v1: https://lore.kernel.org/r/20250903124505.365913-6-s-vadapalli@ti.com/
> No changes since v1.
> 
>  drivers/pci/controller/dwc/pci-keystone.c | 25 +++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index d03e95bf7d54..81c3686688c0 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -666,6 +666,31 @@ static void ks_pcie_intx_irq_handler(struct irq_desc *desc)
>  	chained_irq_exit(chip, desc);
>  }
>  
> +static void ks_pcie_free_msi_irq(struct keystone_pcie *ks_pcie)
> +{
> +	struct device_node *np = ks_pcie->np;
> +	struct device_node *intc_np;
> +	int irq_count, irq, i;
> +
> +	if (!IS_ENABLED(CONFIG_PCI_MSI))

Isn't the CONFIG_PCI_KEYSTONE_HOST always depend on PCI_MSI?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

