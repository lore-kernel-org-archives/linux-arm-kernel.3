Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7E2C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 23:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=BbkOE60l3S8EGDU1exnsY4Aweym2YiWNTKhYlqhzO+Q=; b=B9Lb22aIff+FQq
	2/iRnUDjFEIEvobOfKuRJ7/pEJzHQKQWb/D5ZvozFnflpAYL3AZTE31+PtCRUku3L2QFuUq3Vjaz6
	nDJiTF534vkNVs7x88cQnxO7JSUiLKwWkl8bSgDTICZwBknWB8s/W9bghs1uPzD1fTLZ7PjmShg0j
	rNEwyqaXwvAXG2IMmPrykrerjJg3xijRAxYBhRBYOb74mGTNkq3suEaXfKWVMAK5g/sNmAMw+LOh8
	nNa16Q/86VKPnhCxrvMZmtDRnV4G18CrEepzYy2QLZt8BWdRmr0jCBQfQRZQkjY5bJi4wB24XGp90
	cXNNXakt6lEb8srPbPMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdHMm-00000007wPd-3LRT;
	Wed, 29 Jan 2025 23:21:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdHLR-00000007wD7-1Buo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 23:19:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A805C5C5FFF;
	Wed, 29 Jan 2025 23:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 357B5C4CED1;
	Wed, 29 Jan 2025 23:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738192779;
	bh=Zlz47JZTSZjs6GkXMUpoX5Ar7Yt8/Hbx6Ol2UOf5Ut4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ZGm9/PajtiH2zlIiysQmjQCT7xD11s1wJMreoSshovuRxFLol+F3KFa0BK2JBM+xJ
	 xbYOoBhA7v6SsT362GM/xdQlTb8xggGVdrb7WlAoGCGsVOwnfKeaDIvZ9KkJbbo/f6
	 /85E1yTqT1++PIOhDftZIkwJBlM0ucyGyrZSQvpDYChQ81fcdx8DiJQxurnDd56k+s
	 FH8yRHzpjlPMMn88MsgnhzUL274aKyT9kuwCz2glvRwxpXyLSpCfgHbSZUiSf/5KuP
	 EsRm3iJJWlIgw/eCzA/SvixQW7ZW6opr8ZYqIzOhlyshWBqOuZN0kSs/xGUtnnxe46
	 e+ABxRyncP5XA==
Date: Wed, 29 Jan 2025 17:19:37 -0600
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
Subject: Re: [PATCH v9 1/7] PCI: dwc: Use resource start as iomap() input in
 dw_pcie_pme_turn_off()
Message-ID: <20250129231937.GA523281@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-pci_fixup_addr-v9-1-3c4bb506f665@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_151941_523740_AFA013F5 
X-CRM114-Status: GOOD (  21.52  )
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

On Tue, Jan 28, 2025 at 05:07:34PM -0500, Frank Li wrote:
> Pass resource start as the input argument to iomap() instead of
> atu.cpu_address in dw_pcie_pme_turn_off(). While atu.cpu_address happens to
> be the same here, it actually represents the parent bus address before ATU,
> which may not always align with the CPU address. Using resource start
> ensures correctness and clarity.

1) "atu.cpu_address happens to be the same here" is currently true
   but only because this function is buggy and assumes the ATU input
   address is the same as a CPU physical address.

2) We're trying to make a correctness fix, not a clarity fix.  This
   patch by itself isn't a functional change because of the cpu_addr
   bug, but without this patch, fixing the cpu_addr bug would break
   the iomap.

3) "Pass resource start as the input to iomap()" just restates the
   patch.  We should say *why* this is important.  Something like
   this:

     The msg_res region translates writes into PCIe Message TLPs.
     Previously we mapped this region using atu.cpu_addr, the input
     address programmed into the ATU.

     "cpu_addr" is a misnomer because when a bus fabric translates
     addresses between the CPU and the ATU, the ATU input address is
     different from the CPU address.  A future patch will rename
     "cpu_addr" and correct the value to be the ATU input address
     instead of the CPU physical address.

     Map the msg_res region before writing to it using the msg_res
     resource start, a CPU physical address.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v9 to v10
> - new patch
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index ffaded8f2df7b..ae3fd2a5dbf85 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -908,7 +908,7 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
>  	if (ret)
>  		return ret;
>  
> -	mem = ioremap(atu.cpu_addr, pci->region_align);
> +	mem = ioremap(pci->pp.msg_res->start, pci->region_align);
>  	if (!mem)
>  		return -ENOMEM;
>  
> 
> -- 
> 2.34.1
> 

