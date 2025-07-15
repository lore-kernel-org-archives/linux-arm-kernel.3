Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FEFC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 09:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wentu35WzBTz2FfdFIRnADpD/NQKbxdQzM55pRJzSNE=; b=ays6pKQjVojAd1pUlkAC0XLa9g
	E0K/O3L8x25+nkl342zpTua+Tb947QAssyO4Y4OqblDxRILBs1MWAyBBLUFEK56xVcmwWLS3GZcCK
	N1ZYvyCpDeGOVxseHhM8HQsNpxkUl4EjOM3BShgHHRUJjdeXsVtPf5LS8q663EK7m/R9baUuFXLjp
	45nauBp/upr/+UOyRtYRQc23gEQ/bzVf0O2i/KIzMeXPMG3nTVCLTuCZsfjjnw35aMFi+wCbZy4nJ
	4fVGiNp60dg9W1NHglc7G7MYhHa7pv4LoSmH7LjNiVXPqpGKBvLe5vQY1+VkLPI1qNDn70VSjttii
	gqZF7w6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcNC-00000004lSy-3G63;
	Tue, 15 Jul 2025 09:54:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbpY-00000004eYH-3cJV;
	Tue, 15 Jul 2025 09:20:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46FF246316;
	Tue, 15 Jul 2025 09:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA07C4CEE3;
	Tue, 15 Jul 2025 09:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752571208;
	bh=zMX0HnJ6CCzw8b9lVKy3uhSYJilLYoAhgM5/FrM5H9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d4e/gA/XYvMMld3wapT7zeY1Gk0uwHEwJggXKWAa4A9zBaFmlJPabx3x1jsbR3yNJ
	 R0GpKskCbOugdis7UiMYxXYnDrOzn/3/1+OUIOLoEdjOIsos0z6JrQcMUjNzQlKcre
	 lz1944BNZHo8Y5XDm7f+ywdeXXcX700tfufNkwNk7XQYX5eOLTKfsLSCzXqjpCFC03
	 HjshEiqu1EwEsrzoU5vhtsQruoimF/UqS2FUcQbB60aU0ppgJ5dVZrk8/XJB8ZaWpR
	 hMimgMsxb0vHBX51jmnVu+jjDPdCVfJnQ9diGWXPuuv61GKkWjTE8KGEJ1K7gGO+Hq
	 zs+q6/TELjheg==
Date: Tue, 15 Jul 2025 14:49:56 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Wilczy??ski <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Niklas Cassel <cassel@kernel.org>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/4] PCI/ERR: Add support for resetting the Root Ports
 in a platform specific way
Message-ID: <tfpszamhfxx62vclkfxqfuuda24ps6e4yti7fgywycznpwfj5l@22nggkft2mph>
References: <20250715-pci-port-reset-v5-0-26a5d278db40@oss.qualcomm.com>
 <20250715-pci-port-reset-v5-1-26a5d278db40@oss.qualcomm.com>
 <aHYOW3P0wvHo5a1j@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aHYOW3P0wvHo5a1j@wunner.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_022008_924114_53C14D33 
X-CRM114-Status: GOOD (  13.56  )
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

On Tue, Jul 15, 2025 at 10:16:27AM GMT, Lukas Wunner wrote:
> On Tue, Jul 15, 2025 at 01:29:18PM +0530, Manivannan Sadhasivam wrote:
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -4964,7 +4964,19 @@ void pci_reset_secondary_bus(struct pci_dev *dev)
> >  
> >  void __weak pcibios_reset_secondary_bus(struct pci_dev *dev)
> >  {
> > +	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
> > +	int ret;
> > +
> > +	if (host->reset_root_port) {
> > +		ret = host->reset_root_port(host, dev);
> > +		if (ret)
> > +			pci_err(dev, "Failed to reset Root Port: %d\n", ret);
> > +
> > +		return;
> > +	}
> > +
> 
> There used to be a pci_is_root_bus() check here:
> 
> https://lore.kernel.org/r/20250524185304.26698-2-manivannan.sadhasivam@linaro.org/
> 

Right. I forgot to include that series, but somehow managed to remember the
s/slot/root_port change.

Will incorporate in next revision, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

