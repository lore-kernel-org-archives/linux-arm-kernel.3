Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C890C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZp/AEb4hxAqnyCQYTXS28pStfCGgay23vNzxYZJaTA=; b=qBSa2ELDUSLpm1HZP2FCEZMgqH
	tNrmC8dxhROS7NtjmgYn+b67/tF6S4pu9S4jGExhFS55x43LFlcDIJNoQLzxdGmGuB7iyv/YAdJDV
	bjukCJ2UOoVJw37742GUxlY6BJl6H9zD7qx+D5+fWCEjT+0G9AzxXPCAvkKiJZJO1rgvfTMT0LyQk
	BU1fANJXW9hFOQx5q4jGegPNMWxnd9E2GDTpszjg/qFS469Apt011kIaoyUutKuvSApRz7jK1KHjB
	Goae5tWqIzFLusqWnIVFykTJzpimHPs4mZQmxqf5oSZeaPvLFz0WIDpXp4mhpOaFoYmN8Xqb10Jo8
	zMz6+/fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowZ-0000000EXZ0-3BoX;
	Thu, 12 Jun 2025 20:54:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjC2-0000000DfOG-49NT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 14:46:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 57630A50DE0;
	Thu, 12 Jun 2025 14:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE90C4CEEA;
	Thu, 12 Jun 2025 14:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749739574;
	bh=ktOIi/BfUKsUMRQMoHe23J8/rEqdQAIOh2BtMJa3q38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FUqjF7ONFa/8MEpHuAC0lNeK4nPttPf0Hz1juF4yxJk6qw8h112kn2pLn1gxQU2GR
	 xCfBIrIgpwpX6PMUvf1+rkx53ho53XJD7FhpIpSg6XY583benADFDIXPTpvBIeCOx/
	 sMkLO/n4wtblZxvr0nsVsALTLT9VlmquhajDWK4k4cCeuh5oK7ZMeTxTEk/TQn2kGV
	 3urV9802dpwb86AfhMelys5oT6bfUdNxba0TbtaJ//L1qsgnPseh7br0VCwoVkk6NU
	 fI3ekhZupD9ExVKASnX2ixaxELjUVMbNqc5VPV1WfHXySfMmM735xE4LOD2duATKcy
	 pQg6+NcnmoIbg==
Date: Thu, 12 Jun 2025 20:16:03 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.Li@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v11 10/11] PCI: dwc: Print warning message when
 cpu_addr_fixup() exists
Message-ID: <v77jy5tldwuasjzqirlwx45zigt6bpnaiz67e4w7r2lxqrdsek@5qzzobothf5r>
References: <20250313-pci_fixup_addr-v11-0-01d2313502ab@nxp.com>
 <20250313-pci_fixup_addr-v11-10-01d2313502ab@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313-pci_fixup_addr-v11-10-01d2313502ab@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_074615_091972_211A132B 
X-CRM114-Status: GOOD (  18.29  )
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

On Thu, Mar 13, 2025 at 11:38:46AM -0400, Frank Li wrote:
> If the parent 'ranges' property in DT correctly describes the address
> translation, the cpu_addr_fixup() callback is not needed. Print a warning
> message to inform users to correct their DTB files and prepare to remove
> cpu_addr_fixup().
> 

This patch seem to have dropped, but I do see a value in printing the warning to
encourage developers/users to fix the DTB in some way. Since we fixed the driver
to parse the DT 'ranges' properly, the presence of cpu_addr_fixup() callback
indicates that the translation is not properly described in DT. So DT has to be
fixed.

Bjorn, thoughts?

- Mani

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v10 to v11
> - change to dev_warn()
> - Bjorn: this is opitional patches to encourage user fix their dtb file.
> 
> change from v9 to v10
> - new patch
> ---
>  drivers/pci/controller/dwc/pcie-designware.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 8b546131b97f6..d4dc8bf06d4c1 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -1125,6 +1125,8 @@ int dw_pcie_init_parent_bus_offset(struct dw_pcie *pci, const char *reg_name,
>  
>  	fixup = pci->ops->cpu_addr_fixup;
>  	if (fixup) {
> +		dev_warn(pci->dev, "cpu_addr_fixup() usage detected. Please fix your DTB!\n");
> +
>  		fixup_addr = fixup(pci, cpu_phy_addr);
>  		if (reg_addr == fixup_addr) {
>  			dev_warn(dev, "%#010llx %s reg[%d] == %#010llx; %ps is redundant\n",
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

