Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F81C02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 20:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=/N/3HULVkdBx3fVG1fPtEK4CkphcVinMtDjQk9joxFw=; b=tA3NeGYgDjBqE4
	Xpruxa3bXmCLonqrMb113Vp57KrpdyqBZJfbCk6GmEKaoUoNOQlSUiyBN0/mH/83uTQ6AXhdhqvmL
	sa8ZbSOUh7KPTryuotWLFP2FTcj4kM0cczYqdeDCChmwoLKR6K+rXnFRFjQTuUk2MRdXorQI0d53f
	BPQ6oWoxJrED1czLA+n/yy9+Y4cOCsDyI1fwQhgow8qgePgEfxG3V0np7TdsK8R7YqjXONGC3QVLJ
	5IBn0Sj0ppka8tXbd4CwlFKJVGCto2Vb+D5w+/+CFk6t+cWdRvfXqstg1l+xGEwcfJd9BNY/63+Ss
	JB710fy9cTZwIDk8Ch/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQyQ-00000006Xx2-3BjT;
	Mon, 13 Jan 2025 20:23:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQxC-00000006Xpj-1Iz3;
	Mon, 13 Jan 2025 20:22:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3A2E3A4101D;
	Mon, 13 Jan 2025 20:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE748C4CED6;
	Mon, 13 Jan 2025 20:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736799749;
	bh=4XBsIsziAr422cRjy/WKCVKgVG1YXMwN58TxJtr6+5c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=AHWuHhHnfKQrdFZTiZDwYEjqgFR6aq6ew0yAp3HDahpOWJMmbsvyso/AZlw4SrZph
	 hKRufIBPagMUNxFbWZ9Qjvo3+DFt5ufFZHxAhaU6Y0+sDfJhDbfVCiZnPKuR8Nk0TC
	 4bSigVWPsRMlrYwWC9BvWbcm2VIcGF0SL03eO37EqIM1/3nByWnMrnCBp51ZGv3BqI
	 UyWRmxz375UMEUqN68pVzZKeBa6JFZ/bDglBmsL/TsUjm8qqLdOMJsCWobg7LE4oLF
	 jyd2EEMUPKNcxZgZFJGrKsPfolj8ob7uCNb+xlqaNFGIo3P6Aw3wslqZOA0sns9r1G
	 ghu4BfDWwF6qA==
Date: Mon, 13 Jan 2025 14:22:26 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Anand Moon <linux.amoon@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: dw-rockchip: Skip waiting for link up
Message-ID: <20250113202226.GA420041@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-rockchip-no-wait-v1-1-25417f37b92f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_122230_418560_80E8CE0F 
X-CRM114-Status: GOOD (  18.75  )
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

On Mon, Jan 13, 2025 at 11:59:34AM +0100, Niklas Cassel wrote:
> The Root Complex specific device tree binding for pcie-dw-rockchip has the
> 'sys' interrupt marked as required.
> 
> The driver requests the 'sys' IRQ unconditionally, and errors out if not
> provided.
> 
> Thus, we can unconditionally set use_linkup_irq before calling
> dw_pcie_host_init().
> 
> This will skip the wait for link up (since the bus will be enumerated once
> the link up IRQ is triggered), which reduces the bootup time.
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>

Applied to pci/controller/dwc for v6.14, thanks!

> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 1170e1107508bd793b610949b0afe98516c177a4..62034affb95fbb965aad3cebc613a83e31c90aee 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -435,6 +435,7 @@ static int rockchip_pcie_configure_rc(struct rockchip_pcie *rockchip)
>  
>  	pp = &rockchip->pci.pp;
>  	pp->ops = &rockchip_pcie_host_ops;
> +	pp->use_linkup_irq = true;
>  
>  	return dw_pcie_host_init(pp);
>  }
> 
> ---
> base-commit: 2adda4102931b152f35d054055497631ed97fe73
> change-id: 20250113-rockchip-no-wait-403ffbc42313
> 
> Best regards,
> -- 
> Niklas Cassel <cassel@kernel.org>
> 

