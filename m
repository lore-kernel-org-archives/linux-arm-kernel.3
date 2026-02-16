Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8613E81A29
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 14:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwv1JFmm7beuZB8wJwFWw7RKWXlH6J1ZkCp2RUcYxcA=; b=bejlMtZ3sEYdUYXa+j8a94VAWw
	peTagg8V6UruPLWCMbCa7vyddTk/LWGPBeh4VOikgouVu3Dothp3ZsVQ4VsAqsyTaIOJJ7yaQaO3m
	5qUtHkjWeAsS3sFy3ze1+rGsQXSvgRHWID9XITlG50MldTcVQs6SgSQRKMFZTXnmYFKokPFAM4ZWw
	y4Cu1urkcqgApcz1UVgQtHXedas2oJeaOVYxVlILZrY7HtWMK+4GOsY7V0vq8eARFQDhpk/KMqorS
	StzesUsfzXG9PiUxJnXO0UhjI/MpCls/aja8rhtsydDanINmArnai9jSNXjYoDVc17ehW+sZL695C
	OdPIte2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrzLW-00000006lEZ-2hMY;
	Mon, 16 Feb 2026 14:13:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrzLU-00000006lE9-00Hk;
	Mon, 16 Feb 2026 14:13:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF5DF4195E;
	Mon, 16 Feb 2026 14:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC4EC116C6;
	Mon, 16 Feb 2026 14:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771251179;
	bh=EStq2QD0H0mA/UsByWuRWqrjFkq14BjC8hjk5PPIczM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fzgatof2hRaZf6okmOOMQslNNV9opIOqczEdLXspaQBkgF0/LJq6vY3YKOFnSkYGl
	 Up3oI4B39konVYUDuCTYHQslk9hzIK+2FnYYIq3ILlUWR+5R+AsH50KpcvHSVRNOQ2
	 rHnpVpWjATbXEKNhRJlC/+bstMA4/vmPtea8yroscUrXckE1pNuioR6Orp3RXz6daE
	 PUGGAxTMjvr4v0K+jE7WLqKn7+XoppqJLb7OHET5T04BAQvmRJ41Ax84RPp6I+4GwG
	 E7BwmCMIKm3xmBRBuP6aFGYB0JFsA0UpZkDUpyFpgWmSTJ8JJhTYNaYo9AOmoi2qIJ
	 u4bavAOTvPsOw==
Date: Mon, 16 Feb 2026 15:12:53 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Cc: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
	heiko@sntech.de, kishon@kernel.org, jdmason@kudzu.us,
	dave.jiang@intel.com, allenbh@gmail.com, shawn.lin@rock-chips.com,
	Frank.Li@nxp.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, ntb@lists.linux.dev
Subject: Re: [PATCH v7 5/9] PCI: dwc: ep: Expose integrated eDMA resources
 via EPC aux-resource API
Message-ID: <aZMl5SVsF_mzEsNT@ryzen>
References: <20260215163847.3522572-1-den@valinux.co.jp>
 <20260215163847.3522572-6-den@valinux.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215163847.3522572-6-den@valinux.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_061304_096473_B9FEAFE9 
X-CRM114-Status: GOOD (  23.02  )
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

On Mon, Feb 16, 2026 at 01:38:43AM +0900, Koichiro Den wrote:
> Implement the EPC aux-resource API for DesignWare endpoint controllers
> with integrated eDMA.
> 
> Report:
>   - DMA controller MMIO window (PCI_EPC_AUX_DMA_CTRL_MMIO)
>   - interrupt-emulation doorbell register (PCI_EPC_AUX_DOORBELL_MMIO),
>     including its Linux IRQ
>   - per-channel LL descriptor regions (PCI_EPC_AUX_DMA_CHAN_DESC)
> 
> If the DMA controller MMIO window is already exposed via a
> platform-owned fixed BAR subregion, also provide the BAR number and
> offset so EPF drivers can reuse it without reprogramming the BAR.
> 
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
>  .../pci/controller/dwc/pcie-designware-ep.c   | 149 ++++++++++++++++++
>  1 file changed, 149 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 7e7844ff0f7e..ffd2797b7b81 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -808,6 +808,154 @@ dw_pcie_ep_get_features(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
>  	return ep->ops->get_features(ep);
>  }
>  
> +static const struct pci_epc_bar_rsvd_region *
> +dw_pcie_ep_find_bar_rsvd_region(struct dw_pcie_ep *ep,
> +				enum pci_epc_bar_rsvd_region_type type,
> +				enum pci_barno *bar,
> +				resource_size_t *bar_offset)
> +{
> +	const struct pci_epc_features *features;
> +	const struct pci_epc_bar_desc *bar_desc;
> +	const struct pci_epc_bar_rsvd_region *r;
> +	int i, j;
> +
> +	if (!ep->ops->get_features)
> +		return NULL;
> +
> +	features = ep->ops->get_features(ep);
> +	if (!features)
> +		return NULL;
> +
> +	for (i = BAR_0; i <= BAR_5; i++) {
> +		bar_desc = &features->bar[i];
> +
> +		if (!bar_desc->nr_rsvd_regions || !bar_desc->rsvd_regions)
> +			continue;
> +
> +		for (j = 0; j < bar_desc->nr_rsvd_regions; j++) {
> +			r = &bar_desc->rsvd_regions[j];
> +
> +			if (r->type != type)
> +				continue;
> +
> +			if (bar)
> +				*bar = i;
> +			if (bar_offset)
> +				*bar_offset = r->offset;
> +			return r;
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +static int
> +dw_pcie_ep_get_aux_resources(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
> +			     struct pci_epc_aux_resource *resources,
> +			     int num_resources)
> +{
> +	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	const struct pci_epc_bar_rsvd_region *rsvd;
> +	struct dw_edma_chip *edma = &pci->edma;
> +	enum pci_barno dma_ctrl_bar = NO_BAR;
> +	int ll_cnt = 0, needed, idx = 0;
> +	resource_size_t db_offset = edma->db_offset;
> +	resource_size_t dma_ctrl_bar_offset = 0;
> +	resource_size_t dma_reg_size;
> +	unsigned int i;
> +
> +	if (!pci->edma_reg_size)
> +		return 0;
> +
> +	dma_reg_size = pci->edma_reg_size;
> +
> +	for (i = 0; i < edma->ll_wr_cnt; i++)
> +		if (edma->ll_region_wr[i].sz)
> +			ll_cnt++;
> +
> +	for (i = 0; i < edma->ll_rd_cnt; i++)
> +		if (edma->ll_region_rd[i].sz)
> +			ll_cnt++;
> +
> +	needed = 1 + ll_cnt + (db_offset != ~0 ? 1 : 0);
> +
> +	/* Count query mode */
> +	if (!resources || !num_resources)
> +		return needed;
> +
> +	if (num_resources < needed)
> +		return -ENOSPC;
> +
> +	rsvd = dw_pcie_ep_find_bar_rsvd_region(ep,
> +					       PCI_EPC_BAR_RSVD_DMA_CTRL_MMIO,
> +					       &dma_ctrl_bar,
> +					       &dma_ctrl_bar_offset);
> +	if (rsvd && rsvd->size < dma_reg_size)
> +		dma_reg_size = rsvd->size;
> +
> +	/* DMA register block */
> +	resources[idx++] = (struct pci_epc_aux_resource) {
> +		.type = PCI_EPC_AUX_DMA_CTRL_MMIO,
> +		.phys_addr = pci->edma_reg_phys,
> +		.size = dma_reg_size,
> +		.bar = dma_ctrl_bar,
> +		.bar_offset = dma_ctrl_bar_offset,
> +	};
> +
> +	/*
> +	 * For interrupt-emulation doorbells, report a standalone resource
> +	 * instead of bundling it into the DMA controller MMIO resource.
> +	 */
> +	if (db_offset != ~0) {
> +		if (dma_reg_size < sizeof(u32) ||
> +		    db_offset > dma_reg_size - sizeof(u32))

In your other patch, you used:

	if (size_add(offset, sizeof(u32)) > epf->bar[bar].size)

For consistency, do you perhaps want to use the same here?

size_add(db_offset, sizeof(u32)) > dma_reg_size ?




Kind regards,
Niklas

