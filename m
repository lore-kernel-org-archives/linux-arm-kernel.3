Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD159C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 20:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=irRBCZ97yNHwkRrUWU5/kfE06qPJK1oV1W26gEsNkaw=; b=QTiVy9dSwbKeGV
	KdvlRWBIt3jifxtoXaQaTPICiHl2RCw6YqUg7HYvGCNi2AVC5tZvLWeg+n8vh6OBiUoc8oJ8OqdHA
	EdFL9AKnt6131l+uqYQenv1S1GZ3Xt10q8A7K3o/TnIP1cGo2L8RUlwm4PiC2PaBX3C4v4ukeIjUw
	l83QHZnqrrFhAdEWZHwfG3hJWExCfjM9sZ+ZZNrvf9xCEUWobC5pQYY0qqSDghO/NCxhviQ32BLj0
	Bzw6zYr/d9alg+E4IV84grVlSfrKPiy4ak0/qGYVPZ+yLe7+0ISS/ZkY7E/73gyXmAxRWh4oF0At4
	HWRbInpemvsIrpEtqmNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u59ar-0000000AqaI-2faf;
	Wed, 16 Apr 2025 20:42:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u59Z0-0000000AqAy-3JuV;
	Wed, 16 Apr 2025 20:40:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 76C815C0550;
	Wed, 16 Apr 2025 20:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5B9C4CEE4;
	Wed, 16 Apr 2025 20:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744836053;
	bh=EvvTI2dVum18RivfEtnLiFFNULxxc8d7/TvWnBJ57e0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=eKd7z5T9E+knRBpQ3jKb/8ftx91rIF0bQBduS15ZAE2ht6hl19zLfGIL9jHC8vshl
	 ykdizw73AakIuy3I1ly2//T08eeyRE3ODKNdIFqgSHtB8hcBfBJ4LJzlAXzQu/t7Zm
	 SxWbJqE5V3eH2DBbGvY8tdy1KPA+cXGIi7fCUQ0pQrR4Qsloroe1ehc3TYdmQyzw9q
	 N9vYSg1SXVhHXpRvwzpeWwPWveWbjNh0kAPClbvhKFeY/KZ3j7OEnAqbmNQSYWp/AH
	 pkrq53hr0Xo0jqC6lng23FIZb2jtzv4zasaBJGtDpm9etx3bJvK3BIgUA6SyMXkGwn
	 T9sqLP0GT211Q==
Date: Wed, 16 Apr 2025 15:40:51 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
	heiko@sntech.de, manivannan.sadhasivam@linaro.org, robh@kernel.org,
	jingoohan1@gmail.com, thomas.richard@bootlin.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] PCI: dw-rockchip: Configure max payload size on host init
Message-ID: <20250416204051.GA78956@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416151926.140202-1-18255117159@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_134054_940151_D05AB6E2 
X-CRM114-Status: GOOD (  26.13  )
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

On Wed, Apr 16, 2025 at 11:19:26PM +0800, Hans Zhang wrote:
> The RK3588's PCIe controller defaults to a 128-byte max payload size,
> but its hardware capability actually supports 256 bytes. This results
> in suboptimal performance with devices that support larger payloads.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index c624b7ebd118..5bbb536a2576 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -477,6 +477,22 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
>  	return IRQ_HANDLED;
>  }
>  
> +static void rockchip_pcie_set_max_payload(struct rockchip_pcie *rockchip)
> +{
> +	struct dw_pcie *pci = &rockchip->pci;
> +	u32 dev_cap, dev_ctrl;
> +	u16 offset;
> +
> +	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +	dev_cap = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCAP);
> +	dev_cap &= PCI_EXP_DEVCAP_PAYLOAD;
> +
> +	dev_ctrl = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
> +	dev_ctrl &= ~PCI_EXP_DEVCTL_PAYLOAD;
> +	dev_ctrl |= dev_cap << 5;
> +	dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, dev_ctrl);
> +}

I can't really complain too much about this since meson does basically
the same thing, but there are some things I don't like about this:

  - I don't think it's safe to set MPS higher in all cases.  If we set
    the Root Port MPS=256, and an Endpoint only supports MPS=128, the
    Endpoint may do a 256-byte DMA read (assuming its MRRS>=256).  In
    that case the RP may respond with a 256-byte payload the Endpoint
    can't handle.  The generic code in pci_configure_mps() might be
    smart enough to avoid that situation, but I'm not confident about
    it.  Maybe I could be convinced.

  - There's nothing rockchip-specific about this.

  - It's very similar to meson_set_max_payload(), so it'd be nice to
    share that code somehow.

  - The commit log is specific about Max_Payload_Size Supported being
    256 bytes, but the patch actually reads the value from Device
    Capabilities.

  - I'd like to see FIELD_PREP()/FIELD_GET() used when possible.
    PCIE_LTSSM_STATUS_MASK is probably the only other place.

These would be material for a separate patch:

  - The #defines for register offsets and bits are kind of a mess,
    e.g., PCIE_SMLH_LINKUP, PCIE_RDLH_LINKUP, PCIE_LINKUP,
    PCIE_L0S_ENTRY, and PCIE_LTSSM_STATUS_MASK are in
    PCIE_CLIENT_LTSSM_STATUS, but you couldn't tell that from the
    names, and they're not even defined together.

  - Same for PCIE_RDLH_LINK_UP_CHGED, PCIE_LINK_REQ_RST_NOT_INT,
    PCIE_RDLH_LINK_UP_CHGED, which are in
    PCIE_CLIENT_INTR_STATUS_MISC.

  - PCIE_LTSSM_ENABLE_ENHANCE is apparently in
    PCIE_CLIENT_HOT_RESET_CTRL?  Sure wouldn't guess that from the
    names or the order of #defines.

  - PCIE_CLIENT_GENERAL_DEBUG isn't used at all.

>  static int rockchip_pcie_configure_rc(struct platform_device *pdev,
>  				      struct rockchip_pcie *rockchip)
>  {
> @@ -511,6 +527,8 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
>  	pp->ops = &rockchip_pcie_host_ops;
>  	pp->use_linkup_irq = true;
>  
> +	rockchip_pcie_set_max_payload(rockchip);
> +
>  	ret = dw_pcie_host_init(pp);
>  	if (ret) {
>  		dev_err(dev, "failed to initialize host\n");
> 
> base-commit: a24588245776dafc227243a01bfbeb8a59bafba9
> -- 
> 2.25.1
> 

