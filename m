Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB879C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 21:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=IUAT9aWPmaRehFMh+48Kia4RzfBIDvuDPFY9sTyLg2Y=; b=BTFCaZq2lQo3bD
	7DCsCg9sJ0apldd5GdQC9HZIfuwlaAHwBz8NEHmw9fL1Jm8xDyfiFsjI+bSXigv+hGGdG9yQJetlK
	Z0TP5fcBufNpdhfP0QHbuKHSSouY4XsZd55zlwRIlgpyqVeOt+B+vkycwe/c4+P8hVn99jAg/n8Tw
	0DcYvfexsbfrd4s5vtDHeEaht11ERn3ZzpSu0k55eL0Y01Xk3Qu+DR3H+6iZOyn39H8gv78lFQFMc
	AZzo6DfNvAnxhe4CUKDVLJMDmWWZBgZBZ5ZZwHNFTNU+IVxxZwp9vil7JDwBk0HjT1QCZZwZMCv/s
	tEcek9xWqwP56GJ35TCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsTwT-00000009Z8w-2qB8;
	Wed, 12 Mar 2025 21:48:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsTup-00000009Z4T-3Qvx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 21:47:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB3FC5C51B6;
	Wed, 12 Mar 2025 21:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 237DAC4CEDD;
	Wed, 12 Mar 2025 21:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741816022;
	bh=eukJfZ9lLW2zVXuJ19t/+gNkbCNm+nSMBj7VGlDh7R4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=S7peAbpQbGMzX3T47ZwjFOUvtYLAA9TG1NmfFHLT4cKlayaOCdIaXuKBmBbPtcQqi
	 yD1eRfVjG2/9w23hUlqrcvoB7ZeImSFosNLcfld3E2n4LFkWc+fMuh0nAmqCq7vEXi
	 MMrwdR9zHrd0EuoXCxSVzdw5PZHekzIbznL18rz4l0l5xn5Ft6tNwTQN5b+VVE4VKH
	 hDCQykz6hnGsksUFPvytnXMx0P1cNMAS122LN8IpNVhueFUjnabpwSnqlBTVtNkF/B
	 ww6pS817d6S7VGYdsIBsOCWHPzH3ZqcZOq8yh0CE5DWz74vJ5bsB2f43MUppiQEUUt
	 luQSd19EsinVg==
Date: Wed, 12 Mar 2025 16:47:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v10 09/10] PCI: dwc: ep: Ensure proper iteration over
 outbound map windows
Message-ID: <20250312214700.GA710620@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310-pci_fixup_addr-v10-9-409dafc950d1@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_144703_913553_13B42276 
X-CRM114-Status: GOOD (  22.57  )
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

On Mon, Mar 10, 2025 at 04:16:47PM -0400, Frank Li wrote:
> Most systems' PCIe outbound map windows have non-zero physical addresses,
> but the possibility of encountering zero increased with commit
> ("PCI: dwc: ep: Add bus_addr_base for outbound window").

What is this commit?  I don't see it in the tree, and I don't see it
in this series.

It look like it might be a fixup for something in this series.  In
that case it should go *before* the other commit (or be squashed into
it if it's logically part of it).

I don't think this series touches ep->ob_window_map, so if it's a fix
it looks like it could go anywhere earlier.

> 'ep->outbound_addr[n]', representing 'parent_bus_address', might be 0 on
> some hardware, which trims high address bits through bus fabric before
> sending to the PCIe controller.
> 
> Replace the iteration logic with 'for_each_set_bit()' to ensure only
> allocated map windows are iterated when determining the ATU index from a
> given address.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v9 to v10
> - remove commit hash value
> 
> change from v8 to v9
> - new patch
> ---
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 62bc71ad20719..e333855633a77 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -282,7 +282,7 @@ static int dw_pcie_find_index(struct dw_pcie_ep *ep, phys_addr_t addr,
>  	u32 index;
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  
> -	for (index = 0; index < pci->num_ob_windows; index++) {
> +	for_each_set_bit(index, ep->ob_window_map, pci->num_ob_windows) {
>  		if (ep->outbound_addr[index] != addr)
>  			continue;
>  		*atu_index = index;
> 
> -- 
> 2.34.1
> 

