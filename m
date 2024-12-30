Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5EEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 19:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=fZhIz7u5Vl/6339Xim1E9bhDB7oYB25RCnT6QNAOV5M=; b=nkAizj7pI3tAzM
	0WwS/a6ibBtUP340IT1OO01YQx5canWLJqFMnbBBs1k3gK0pzbtuSBHH5LKtu8azR8cR6/bwj0nsO
	1Brwm448iBOmbC6+gMfoc4BwJgjNB8PqwRkW/4LUL4A+Wz7neiBV5lm7qU23WZeQdSlrDL76RpHVe
	WgpI8nWIDLkhJc28bAL/oRsaD5zwNyxm6/qHwokniWEdUqkqLp6kL0xqEX3L7V2UH9K7hM8DGJkQJ
	AyyAmhw8sTXcSMvBx1VnXm1NEjKEj/c3CxWPiW0KSJQsG7UkoKnwCabWBfxcMzuxkV20s/02MxYPm
	l5ekiJpktMATKcPhRmiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSLJR-00000005jlK-3HnH;
	Mon, 30 Dec 2024 19:20:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSLIH-00000005jeN-0jAv;
	Mon, 30 Dec 2024 19:19:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AF8A6A40F2A;
	Mon, 30 Dec 2024 19:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 413F2C4CED0;
	Mon, 30 Dec 2024 19:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735586351;
	bh=X0EYxHXdyVdmOPGxViBjSU30WP05CYZbb75sYLlIZak=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=kfp+sQw+92xxFfPP5xyPzMvbLdqPXLOBdfm2btiHhnRSOn0NYolCFg2fwL3XgQKAn
	 xOicRxgCm/GJGDPPlA1icF7IXRfYE3/nsC96+2jqRnp0hGqo/2o8XSdbIH8kkhZ+33
	 U1CoYnr/nl19EduvPnO71DJYp0UQXyjA9EBs6V4jlbqZy0OPscozdhA1+EY+Ga0x6b
	 WYGDj60Nbj+wHpFf4LJVXkjQJ6xuTHhNAoUcn6kMqhgAtq4wWxVhi89CWGlv9RjWY/
	 eP6dAw6YUK2CzEUT5rGbij5l0zqVspX8PEGFSmy7GEeo4znW1yORMYIQQzn0bxg/Sr
	 v79iM6hEOHZsQ==
Date: Mon, 30 Dec 2024 13:19:08 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] PCI: dw-rockchip: Enumerate endpoints based on
 dll_link_up irq in the combined sys irq
Message-ID: <20241230191908.GA3962801@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127145041.3531400-2-cassel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_111913_278746_5A8810C8 
X-CRM114-Status: GOOD (  16.67  )
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

On Wed, Nov 27, 2024 at 03:50:42PM +0100, Niklas Cassel wrote:
> Most boards using the pcie-dw-rockchip PCIe controller lack standard
> hotplug support.
> 
> Thus, when an endpoint is attached to the SoC, users have to rescan the bus
> manually to enumerate the device. This can be avoided by using the
> 'dll_link_up' interrupt in the combined system interrupt 'sys'.
> 
> Once the 'dll_link_up' irq is received, the bus underneath the host bridge
> is scanned to enumerate PCIe endpoint devices.
> 
> This commit implements the same functionality that was implemented in the
> DWC based pcie-qcom driver in commit 4581403f6792 ("PCI: qcom: Enumerate
> endpoints based on Link up event in 'global_irq' interrupt").
> 
> The Root Complex specific device tree binding for pcie-dw-rockchip already
> has the 'sys' interrupt marked as required, so there is no need to update
> the device tree binding. This also means that we can request the 'sys' IRQ
> unconditionally.

Thanks for doing this!

> @@ -436,7 +481,16 @@ static int rockchip_pcie_configure_rc(struct rockchip_pcie *rockchip)
>  	pp = &rockchip->pci.pp;
>  	pp->ops = &rockchip_pcie_host_ops;
>  
> -	return dw_pcie_host_init(pp);
> +	ret = dw_pcie_host_init(pp);
> +	if (ret) {
> +		dev_err(dev, "failed to initialize host\n");
> +		return ret;
> +	}
> +
> +	/* unmask DLL up/down indicator */
> +	rockchip_pcie_writel_apb(rockchip, 0x20000, PCIE_CLIENT_INTR_MASK_MISC);

I know we already had a bare 0x60000 in rockchip_pcie_configure_ep(),
but can we add #defines for both of these PCIE_CLIENT_INTR_MASK_MISC
bits?

