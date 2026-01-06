Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3987CD0438
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 05:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECD/Gw311pK5j9heXLLxvC+4KGv1c1Hn58Q6Vbk6fiw=; b=TD9AWnw9mEWCl6ny1fh04uANyy
	7+RJN0nNSNIwUMmxeOrjQNuq6bWCG/+1VCiZa5ZEtYcNJTLKxHPbqRLHk131+6zKS9cwZYzUIYCdv
	a3LHcySKovdZOooeHF2gs0/FVzMEdgrRJzI68lvHd3q+1njqMYgZUPXuY17psk+hif9VsvwVrBubh
	/sgCHzBMHbPu1W/izKmiTZWgwzrNeGXF0Lw+WFhCMFJFnFB+6xEJCU2r3OGr26YXQSKvQMVx5ODYN
	rV52/hOOU43nLglu1d7Vdzavjy9yNbpRyQVl4ldr9vkUenLY+tGeAOQFv6LEJQQcpRqhp9xPAtIqr
	8P4HyfPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vczTn-0000000CRG7-0RZA;
	Tue, 06 Jan 2026 05:19:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vczTk-0000000CRFr-0SDv;
	Tue, 06 Jan 2026 05:19:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 073FA6011E;
	Tue,  6 Jan 2026 05:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7117FC116C6;
	Tue,  6 Jan 2026 05:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767676774;
	bh=h2nYGKojRr759U41EwbB4BsmLSlNtVAL8aBfQlF4xTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fn7eNbq+r0jsnqP0Mix+RIWDvZUr1tdAgbjsrEGr2Ms9oW27hgMlnJw0ZkpSpIB7H
	 VFVpNZUQpOrDUTBWHMpyZi9/eKY0Qb+AnhG52J5zL8WWqo88g/p5j0J5Zy85RsIztz
	 P2mn8L1AGv1qK0pNNdB/HsIJIkBXeXj+VG0BiSfhQJOHcPXQkEZQG6mMUihoezwrSB
	 w8K6ZeXkX1jI/ZfTN4Zm7awLzTo9nbMlCOwvaMpLHDKzcXwj3pixaITdVMhWoVjGKB
	 KrSBHZeR6A15yHPveYgjG/D2gFY70Y8Q5JReXwCWQqbWYvWeEnIvCRk91nnGFYGIc8
	 dYoNqcI1m3mfg==
Date: Tue, 6 Jan 2026 10:49:19 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Sumit Kumar <sumit.kumar@oss.qualcomm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Richard Zhu <hongxing.zhu@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Chuanhua Lei <lchuanhua@maxlinear.com>, 
	Marek Vasut <marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Pratyush Anand <pratyush.anand@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] PCI: dwc: Add multi-port controller support
Message-ID: <m5ukeugo2lazipljqpubyvm7j3xk2j5o7i2xgdbkkhii57xmyk@lh32qdzjhe4n>
References: <20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com>
 <20260105-dt-parser-v1-2-b11c63cb5e2c@oss.qualcomm.com>
 <aVvkmkd5mWPmxeiS@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aVvkmkd5mWPmxeiS@ryzen>
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

On Mon, Jan 05, 2026 at 05:19:38PM +0100, Niklas Cassel wrote:
> On Mon, Jan 05, 2026 at 05:57:55PM +0530, Sumit Kumar wrote:
> > The current DesignWare PCIe RC implementation supports only the controller
> > (Host Bridge) node for specifying the Root Port properties in an assumption
> > that the underlying platform only supports a single root Port per
> > controller instance. This limits support for multi-port controllers where
> > different ports may have different lane configurations and speed limits.
> > 
> > Introduce a separate dw_pcie_port structure to enable multi-port support.
> > Each Root Port can have independent lane count, speed limit through pcie@N
> > child nodes in device tree. Add dw_pcie_parse_root_ports()
> > API to parse these child nodes.
> > 
> > Equalization presets and link width detection currently use common DBI
> > space for all the root ports. Per-port DBI space assignment for these
> > features will be added in future.
> > 
> > Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> 
> Hello Sumit,
> 
> Is there a reason why you represent this as a list of ports rather than a
> simple array?
> 
> The number of ports is known by parsing the device tree, so it should be
> static, no?
> 
> At least to me, this seem similar to e.g. how a gpio_device has multiple
> gpio_descriptors "struct gpio_desc *descs":
> https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib.h#L68C1-L68C26
> 
> A list is usually used for something that is dynamic.
> I don't think that the number of ports to a PCIe controller will be dynamic.
> 
> I can see that struct qcom_pcie in pcie-qcom.c has struct list_head ports,
> but that does not necessarily mean that we need to have a list of ports in
> pcie-designware-host.c. (pcie-qcom could also be modified to have an array
> of ports if there is a desire for similar design pattern.)
> 

Only reason why I went with lists in pcie-qcom is flexibility. There are useful
helpers available for traversing the lists and they seem much more elegant to
use rather than manually traversing the array in C.

But to be frank, I don't really care which one is used as there is going to be
only a handful of ports at max anyway and there is not much overhead.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

