Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0065CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 08:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XohFlFyfMWtQ7KuNqOBLJ2SoJCgMcgP941hlwwB7xRA=; b=YOp/BjR9Nr1CVMOuuvJAt8WM1P
	Lc6lBx+/V3J/urRPT9GPMIMn4WriaEtSc6vOrKb3Yw4gov54oNflzZG/DR8BMOTNE2dRc5IaC9/K9
	PUt1esS46LfT3MjyXMP7zita77dXKWuEaukgOs7rQDcnYJAasiuZG5gWYxNbDwOM8HCa3sugEEMR/
	eMqz/QlIXjPP45sHgMe6N1I2vmWma49TZBX7Ea8zYz4kmlLEMwQ6e+ClJKPXQUmnA6YE//eMP+WAa
	TGEWaC1Wrv3dUStVbewcHkGlXRgkz11IiojEX7SW5AsJkh/TP2OWCJYofO3jGFlum8VyoFKYItDfd
	d1PPrx2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkcO-00000005fNE-3CgB;
	Fri, 31 Oct 2025 08:36:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkcM-00000005fN3-1n7j;
	Fri, 31 Oct 2025 08:36:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 84B4961483;
	Fri, 31 Oct 2025 08:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1566C4CEF8;
	Fri, 31 Oct 2025 08:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761899777;
	bh=Nx7zVNS1vjKGvEyYcqY9qSwj4mu6QiBOxd85u7jmiQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DB+REZMguC0RGfpKJBoX+sOgdcIi5yciIlZIxO5NxQ2mVNyBQW9mXbO1v7xcjyfm/
	 w8Bg2yVAzmmOEbt+/hkBBkl4ZurTPtxBiqblO+JZoh7dunXkUEpnG/3MQ6BVEDoyTS
	 PIfxNd0NLxnmLH6IG0YnjgRLCBYbkXlIw9C6bV28AQ8o13ULg0unlpsJOmdlUU72dD
	 7TTIF/yUIJt1sb628+EWRPk5KwytqYverSAvRnke86/lZPBok1k1Mi4oTgXV/Rxjnc
	 3QFS9RncRXyshpnHTskdxE6OFbLzimD+B/SshEmJDRd9YD0BzGvdV3QrZhW1iLSQPK
	 2H2LSV8a7jbrg==
Date: Fri, 31 Oct 2025 14:06:05 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Hans Zhang <18255117159@163.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] PCI: dw-rockchip: Add remove callback for
 resource cleanup
Message-ID: <b2micr4atfax2sgolsublmjk4kwvbmdnqjlk2lb7cflzeycm5i@bi62lg75ilo6>
References: <20251027145602.199154-1-linux.amoon@gmail.com>
 <20251027145602.199154-2-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251027145602.199154-2-linux.amoon@gmail.com>
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

On Mon, Oct 27, 2025 at 08:25:29PM +0530, Anand Moon wrote:
> Introduce a .remove() callback to the Rockchip DesignWare PCIe
> controller driver to ensure proper resource deinitialization during
> device removal. This includes disabling clocks and deinitializing the
> PCIe PHY.
> 

How can you remove a driver that is only built-in? You are just sending some
pointless patches that were not tested and does not make sense at all.

Please stop wasting others time.

- Mani

> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 87dd2dd188b4..b878ae8e2b3e 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -717,6 +717,16 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +static void rockchip_pcie_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
> +
> +	/* Perform other cleanups as necessary */
> +	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
> +	rockchip_pcie_phy_deinit(rockchip);
> +}
> +
>  static const struct rockchip_pcie_of_data rockchip_pcie_rc_of_data_rk3568 = {
>  	.mode = DW_PCIE_RC_TYPE,
>  };
> @@ -754,5 +764,6 @@ static struct platform_driver rockchip_pcie_driver = {
>  		.suppress_bind_attrs = true,
>  	},
>  	.probe = rockchip_pcie_probe,
> +	.remove = rockchip_pcie_remove,
>  };
>  builtin_platform_driver(rockchip_pcie_driver);
> -- 
> 2.50.1
> 

-- 
மணிவண்ணன் சதாசிவம்

