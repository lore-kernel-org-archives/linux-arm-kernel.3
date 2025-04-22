Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73995C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 11:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNINs7M2o9vd+SBezH0yP/ujTeUn6xAS8cN62bJ9t3Y=; b=sx1YLd2Lq+gKU050ktAysCNPoy
	FXiPa6ZZS1keUrwI/kQeGMg3SrGnLngRB7WWX4dVSbTLywJ/KjEMti1ql6EAfckXghhpgsAn6rig+
	8vrk5yW2PqUjM6DuSm8AIJEGyzbYFpjZrZKss9h9p+yM15XdnCy7zzlKLXM3Dx1ccBFvhxEoECxLe
	3OGgKGe1QVzPxOdYpVtND+86GkPr6jsJkrgs6pe0hRi5V4GrAtNzJ6E85nBFxbU8BLUG0KEDeOxUT
	TzJsDn6124lgxZkTKDkviYXR5QL+CqwZ1IS+bN8YKDA2D/Dr7fk4KWrsQpnTbsDb/x5DbPyo9byVu
	xF4nfjXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BVD-00000006tDT-0tNu;
	Tue, 22 Apr 2025 11:09:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Api-00000006kRT-1Stl;
	Tue, 22 Apr 2025 10:26:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E60F84A5B6;
	Tue, 22 Apr 2025 10:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881A5C4CEE9;
	Tue, 22 Apr 2025 10:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745317589;
	bh=a48T1W6ayZnSmBTLl9Hby5irJfOBZFiPxukJ54xS6Yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GAhfaXt4FivY0Ggc8JbjcyVTm5fBgEgFFJ+HJs2jmAcmeivMjfAOuuhJn0rIgcbfD
	 KxP6kQdwbjsGzKn6/6WOUVKSywylazAXEAcMHA7oGsA8Y0I57BdQEMWNp875LvvfNc
	 IV+z7n4+Gopkt4J83v90H2/w514iwInHmnfkTf45b5o9xYaVd7gqAwcqojzCLVQuqK
	 Pq0WCBUWD5Zj3uaeDzuH3ORbFZuD80XBg8GJGQyd6rcsTubFbANc/hl3K71Iu7a6qO
	 p9XQy2QBswSu6Xc9yW13ZN7KhD5YI5PprLcEAWIc124ZZhklfAM/GQeN7Yg56ELQBt
	 JYFYJ7VKBtVVw==
Date: Tue, 22 Apr 2025 12:26:24 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] PCI: dw-rockchip: Fix function call sequence in
 rockchip_pcie_phy_deinit
Message-ID: <aAdu0ODyj7FkVarb@ryzen>
References: <20250417142138.1377451-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417142138.1377451-1-didi.debian@cknow.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_032630_405691_5EE66EBE 
X-CRM114-Status: GOOD (  17.67  )
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

On Thu, Apr 17, 2025 at 04:21:18PM +0200, Diederik de Haas wrote:
> The documentation for the phy_power_off() function explicitly says
> 
>   Must be called before phy_exit().
> 
> So let's follow that instruction.
> 
> Fixes: 0e898eb8df4e ("PCI: rockchip-dwc: Add Rockchip RK356X host controller driver")
> Cc: stable@vger.kernel.org	# v5.15+
> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index c624b7ebd118..4f92639650e3 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -410,8 +410,8 @@ static int rockchip_pcie_phy_init(struct rockchip_pcie *rockchip)
>  
>  static void rockchip_pcie_phy_deinit(struct rockchip_pcie *rockchip)
>  {
> -	phy_exit(rockchip->phy);
>  	phy_power_off(rockchip->phy);
> +	phy_exit(rockchip->phy);
>  }
>  
>  static const struct dw_pcie_ops dw_pcie_ops = {
> -- 
> 2.49.0
> 

Reviewed-by: Niklas Cassel <cassel@kernel.org>

