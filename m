Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AA9CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 18:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKHBJECgnLGdAWc/mgGZevJsXfPn2RfYBVUXXlCznPU=; b=w2UZvYpgviujgx2j13ZVbD994X
	9v/lcCNQQ+wNQfeeLIKe9nVHWXrF17Ag1ol1FSm2nN+Od2394YQW3x27go3u+tLKMkh07Hkzwtgat
	hI52MkPNsMTsqJbVYBuVaJCV4pT0O+UtdMsgcTxnjCph4iMaz3pMPE4aIjts1aHA/JzjvM82+e41V
	38JYbLoaoGcGDpLMgXcEra3BLJCJuq++sakEUZbQNG8Lc+hYDuhLLN4njtctk50PKRlFyy/HWrT7s
	e7s3EH1Z6sc4utCSEclajiYcYAQ0b/2pGimHU6kslSl7lDEWF3oBvINEyntU+vN+WPro+WuHze3vA
	OLw2okcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzfxX-00000003mFc-3vIL;
	Fri, 19 Sep 2025 18:35:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzfxV-00000003mF0-3D11
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 18:35:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4994243237;
	Fri, 19 Sep 2025 18:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8416C4CEF7;
	Fri, 19 Sep 2025 18:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758306949;
	bh=oo7MnNncuxbbEuJjYzS+KOutOdZkuh1LO0HXaCxkr0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IdrwFbGNBg+mcvrizzNAt938gwJnXeswj9demaxuYxuALGgDanebsnojheH/LeTzJ
	 9zpYxwBE4U4OObrIalWu5Azd0xgXyIe7ef5TUkP9SXKVp+Dm6iabs9fPwjGAL54A6l
	 zvPlmsCPiHxpeVc75UBZzAaSRhSe480HrH60JEfrG5qPZc0uCIvKKTx+47NF/0++0D
	 akeE47J1lxg4PC9L9ZJTxuUfImYiQl4JK4sh5BC2NQR8p08XW1frHb+DOOxi0arqtQ
	 GP6UCIKLk4gfk5efeBDwblvyTTWLJ/CqFpZCoKhJo4rMMkmI4xO5H5tafJQwa55POk
	 t79asfELyLhKg==
Date: Sat, 20 Sep 2025 00:05:38 +0530
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
Subject: Re: [PATCH v2 06/10] PCI: keystone: Add ks_pcie_free_intx_irq()
 helper for cleanup
Message-ID: <7sbyvk6vyrbyox5ghvhokrv67r2el4s4f6k42aygmfo3rltj27@6v5pjxbhdl5w>
References: <20250912122356.3326888-1-s-vadapalli@ti.com>
 <20250912122356.3326888-7-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250912122356.3326888-7-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_113549_848966_5870DF35 
X-CRM114-Status: GOOD (  20.33  )
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

On Fri, Sep 12, 2025 at 05:46:17PM +0530, Siddharth Vadapalli wrote:
> Introduce the helper function ks_pcie_free_intx_irq() which will undo the
> configuration performed by the ks_pcie_config_intx_irq() function. This
> will be required for implementing a future helper function to undo the
> configuration performed by the ks_pcie_host_init() function.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Please squash all patches introducing new helpers.

- Mani

> ---
> 
> v1: https://lore.kernel.org/r/20250903124505.365913-7-s-vadapalli@ti.com/
> No changes since v1.
> 
>  drivers/pci/controller/dwc/pci-keystone.c | 29 +++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index 81c3686688c0..074566fb1d74 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -745,6 +745,35 @@ static int ks_pcie_config_msi_irq(struct keystone_pcie *ks_pcie)
>  	return ret;
>  }
>  
> +static void ks_pcie_free_intx_irq(struct keystone_pcie *ks_pcie)
> +{
> +	struct device_node *np = ks_pcie->np;
> +	struct device_node *intc_np;
> +	int irq_count, i;
> +	u32 val;
> +
> +	/* Nothing to do if INTx Interrupt Controller does not exist */
> +	intc_np = of_get_child_by_name(np, "legacy-interrupt-controller");
> +	if (!intc_np)
> +		return;
> +
> +	/* irq_count should be non-zero. Else, ks_pcie_host_init would have failed. */
> +	irq_count = of_irq_count(intc_np);
> +
> +	/* Disable all legacy interrupts */
> +	for (i = 0; i < PCI_NUM_INTX; i++) {
> +		val = ks_pcie_app_readl(ks_pcie, IRQ_ENABLE_SET(i));
> +		val &= ~INTx_EN;
> +		ks_pcie_app_writel(ks_pcie, IRQ_ENABLE_SET(i), val);
> +	}
> +
> +	irq_domain_remove(ks_pcie->intx_irq_domain);
> +	for (i = 0; i < irq_count; i++)
> +		irq_set_chained_handler(ks_pcie->intx_host_irqs[i], NULL);
> +
> +	of_node_put(intc_np);
> +}
> +
>  static int ks_pcie_config_intx_irq(struct keystone_pcie *ks_pcie)
>  {
>  	struct device *dev = ks_pcie->pci->dev;
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

