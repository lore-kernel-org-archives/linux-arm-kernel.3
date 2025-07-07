Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB0DC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 12:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e95bf7oOR+ED4k8+7lZWCy2NP0f754IpCvyw/3GJAtg=; b=tRAHksrWqudXqkcspFTNCus4PW
	7oipXeKbOE0T5K6UpygUaa+0Fbv/i3TcSavFuf84qy3h9cCnGzE1AmdvBIngLlsihLDqqChvfddcD
	zvfHQHKT0bzEjK0ioAPfsS4koEcyVkgyZiyw2DZyqd7Wv1sGmEIup3J+de+Z4AjvzmajnfpoE7P1e
	9XHKqX+vx139uEcDUED93UY2Mr1jjLumt70ItRYh2sB8PTO+cFrkOotwmmTBn/FIM076iSth/SjnF
	REv/7uc5A0xK7BBz1ZmhR8OELMwx9FtWvpRhbO8v3nKrEEm2x9FqVwTq1Kl1zKrg7fKYk5HbEO5vX
	zRWXieyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYlRk-00000002TDM-1xDj;
	Mon, 07 Jul 2025 12:59:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjnc-00000002FbN-03n2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 11:14:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 287F55C54B8;
	Mon,  7 Jul 2025 11:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C78FC4CEE3;
	Mon,  7 Jul 2025 11:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751886854;
	bh=4P+JwJErfYuQ5fEKcfeUj7iZinodj4+jfPTq8yZkb3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MT/UeOPX0fZZqUIKrHROx9YtvsXfraiKpkJg/dAv1Kbz6HIJBJl8ah43FPm0UK2ax
	 ozmRiGQKuSRDoG94vgh9ZBavYlzXsCvAZ6/4+tD00et/fgBAyUPgn5g1/zTY4Lz3pX
	 Ld/HStopyqlbbJj50Ix3dch/vpkqFmKd4KYglFmPT5I73WYbjp5zdMSi0mKLbTlHau
	 o7vU9MW1BhnuPBEun+CjoCvjCN0tytta73syHtPFeEsdAeusGD+NxsE4nPZKxr+qDQ
	 997Pt6ALtmRorte/EK3wKN1+tgCogtBWrg9MR9YxyYPmmwmdSiOC3wnkCNI0nGP0Pr
	 gteuG7YYY1ctQ==
Date: Mon, 7 Jul 2025 13:14:09 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Toan Le <toan@os.amperecomputing.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 12/12] PCI: xgene-msi: Restructure handler setup/teardown
Message-ID: <aGusAeAYqneyp9t3@lpieralisi>
References: <20250628173005.445013-1-maz@kernel.org>
 <20250628173005.445013-13-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628173005.445013-13-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_041416_151326_29354F9A 
X-CRM114-Status: GOOD (  32.23  )
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

On Sat, Jun 28, 2025 at 06:30:05PM +0100, Marc Zyngier wrote:
> Another utterly pointless aspect of the xgene-msi driver is that
> it is built around CPU hotplug. Which is quite amusing since this
> is one of the few arm64 platforms that, by construction, cannot
> do CPU hotplug in a supported way (no EL3, no PSCI, no luck).
> 
> Drop the CPU hotplug nonsense and just setup the IRQs and handlers
> in a less overdesigned way, grouping things more logically in the
> process.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/pci/controller/pci-xgene-msi.c | 109 +++++++++----------------
>  1 file changed, 37 insertions(+), 72 deletions(-)
> 
> diff --git a/drivers/pci/controller/pci-xgene-msi.c b/drivers/pci/controller/pci-xgene-msi.c
> index a22a6df7808c7..9f05c2a12da94 100644
> --- a/drivers/pci/controller/pci-xgene-msi.c
> +++ b/drivers/pci/controller/pci-xgene-msi.c
> @@ -216,12 +216,6 @@ static int xgene_allocate_domains(struct device_node *node,
>  	return msi->inner_domain ? 0 : -ENOMEM;
>  }
>  
> -static void xgene_free_domains(struct xgene_msi *msi)
> -{
> -	if (msi->inner_domain)
> -		irq_domain_remove(msi->inner_domain);
> -}
> -
>  static int xgene_msi_init_allocator(struct device *dev)
>  {
>  	xgene_msi_ctrl->bitmap = devm_bitmap_zalloc(dev, NR_MSI_VEC, GFP_KERNEL);
> @@ -271,26 +265,48 @@ static void xgene_msi_isr(struct irq_desc *desc)
>  	chained_irq_exit(chip, desc);
>  }
>  
> -static enum cpuhp_state pci_xgene_online;
> -
>  static void xgene_msi_remove(struct platform_device *pdev)
>  {
> -	struct xgene_msi *msi = platform_get_drvdata(pdev);
> -
> -	if (pci_xgene_online)
> -		cpuhp_remove_state(pci_xgene_online);
> -	cpuhp_remove_state(CPUHP_PCI_XGENE_DEAD);

No question on the patch - just noticed we could remove
CPUHP_PCI_XGENE_DEAD from cpuhp_state since it would become
unused AFAICS.

Thanks,
Lorenzo

> +	for (int i = 0; i < NR_HW_IRQS; i++) {
> +		unsigned int irq = xgene_msi_ctrl->gic_irq[i];
> +		if (!irq)
> +			continue;
> +		irq_set_chained_handler_and_data(irq, NULL, NULL);
> +	}
>  
> -	xgene_free_domains(msi);
> +	if (xgene_msi_ctrl->inner_domain)
> +		irq_domain_remove(xgene_msi_ctrl->inner_domain);
>  }
>  
> -static int xgene_msi_hwirq_alloc(unsigned int cpu)
> +static int xgene_msi_handler_setup(struct platform_device *pdev)
>  {
> +	struct xgene_msi *xgene_msi = xgene_msi_ctrl;
>  	int i;
> -	int err;
>  
> -	for (i = cpu; i < NR_HW_IRQS; i += num_possible_cpus()) {
> -		unsigned int irq = xgene_msi_ctrl->gic_irq[i];
> +	for (i = 0; i < NR_HW_IRQS; i++) {
> +		u32 msi_val;
> +		int irq, err;
> +
> +		/*
> +		 * MSInIRx registers are read-to-clear; before registering
> +		 * interrupt handlers, read all of them to clear spurious
> +		 * interrupts that may occur before the driver is probed.
> +		 */
> +		for (int msi_idx = 0; msi_idx < IDX_PER_GROUP; msi_idx++)
> +			xgene_msi_ir_read(xgene_msi, i, msi_idx);
> +
> +		/* Read MSIINTn to confirm */
> +		msi_val = xgene_msi_int_read(xgene_msi, i);
> +		if (msi_val) {
> +			dev_err(&pdev->dev, "Failed to clear spurious IRQ\n");
> +			return EINVAL;
> +		}
> +
> +		irq = platform_get_irq(pdev, i);
> +		if (irq < 0)
> +			return irq;
> +
> +		xgene_msi->gic_irq[i] = irq;
>  
>  		/*
>  		 * Statically allocate MSI GIC IRQs to each CPU core.
> @@ -298,7 +314,7 @@ static int xgene_msi_hwirq_alloc(unsigned int cpu)
>  		 * to each core.
>  		 */
>  		irq_set_status_flags(irq, IRQ_NO_BALANCING);
> -		err = irq_set_affinity(irq, cpumask_of(cpu));
> +		err = irq_set_affinity(irq, cpumask_of(i % num_possible_cpus()));
>  		if (err) {
>  			pr_err("failed to set affinity for GIC IRQ");
>  			return err;
> @@ -311,19 +327,6 @@ static int xgene_msi_hwirq_alloc(unsigned int cpu)
>  	return 0;
>  }
>  
> -static int xgene_msi_hwirq_free(unsigned int cpu)
> -{
> -	struct xgene_msi *msi = xgene_msi_ctrl;
> -	int i;
> -
> -	for (i = cpu; i < NR_HW_IRQS; i += num_possible_cpus()) {
> -		if (!msi->gic_irq[i])
> -			continue;
> -		irq_set_chained_handler_and_data(msi->gic_irq[i], NULL, NULL);
> -	}
> -	return 0;
> -}
> -
>  static const struct of_device_id xgene_msi_match_table[] = {
>  	{.compatible = "apm,xgene1-msi"},
>  	{},
> @@ -333,7 +336,6 @@ static int xgene_msi_probe(struct platform_device *pdev)
>  {
>  	struct resource *res;
>  	struct xgene_msi *xgene_msi;
> -	u32 msi_val, msi_idx;
>  	int rc;
>  
>  	xgene_msi_ctrl = devm_kzalloc(&pdev->dev, sizeof(*xgene_msi_ctrl),
> @@ -343,8 +345,6 @@ static int xgene_msi_probe(struct platform_device *pdev)
>  
>  	xgene_msi = xgene_msi_ctrl;
>  
> -	platform_set_drvdata(pdev, xgene_msi);
> -
>  	xgene_msi->msi_regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>  	if (IS_ERR(xgene_msi->msi_regs)) {
>  		rc = PTR_ERR(xgene_msi->msi_regs);
> @@ -364,48 +364,13 @@ static int xgene_msi_probe(struct platform_device *pdev)
>  		goto error;
>  	}
>  
> -	for (int irq_index = 0; irq_index < NR_HW_IRQS; irq_index++) {
> -		rc = platform_get_irq(pdev, irq_index);
> -		if (rc < 0)
> -			goto error;
> -
> -		xgene_msi->gic_irq[irq_index] = rc;
> -	}
> -
> -	/*
> -	 * MSInIRx registers are read-to-clear; before registering
> -	 * interrupt handlers, read all of them to clear spurious
> -	 * interrupts that may occur before the driver is probed.
> -	 */
> -	for (int irq_index = 0; irq_index < NR_HW_IRQS; irq_index++) {
> -		for (msi_idx = 0; msi_idx < IDX_PER_GROUP; msi_idx++)
> -			xgene_msi_ir_read(xgene_msi, irq_index, msi_idx);
> -
> -		/* Read MSIINTn to confirm */
> -		msi_val = xgene_msi_int_read(xgene_msi, irq_index);
> -		if (msi_val) {
> -			dev_err(&pdev->dev, "Failed to clear spurious IRQ\n");
> -			rc = -EINVAL;
> -			goto error;
> -		}
> -	}
> -
> -	rc = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "pci/xgene:online",
> -			       xgene_msi_hwirq_alloc, NULL);
> -	if (rc < 0)
> -		goto err_cpuhp;
> -	pci_xgene_online = rc;
> -	rc = cpuhp_setup_state(CPUHP_PCI_XGENE_DEAD, "pci/xgene:dead", NULL,
> -			       xgene_msi_hwirq_free);
> +	rc = xgene_msi_handler_setup(pdev);
>  	if (rc)
> -		goto err_cpuhp;
> +		goto error;
>  
>  	dev_info(&pdev->dev, "APM X-Gene PCIe MSI driver loaded\n");
>  
>  	return 0;
> -
> -err_cpuhp:
> -	dev_err(&pdev->dev, "failed to add CPU MSI notifier\n");
>  error:
>  	xgene_msi_remove(pdev);
>  	return rc;
> -- 
> 2.39.2
> 

