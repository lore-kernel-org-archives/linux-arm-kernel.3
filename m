Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0C2CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 21:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kO1m5LqFHJxf8DWdb/7mVe4tFOYj20Dk1WkRKFf112s=; b=mm5gctY04GxlUvQj1eULLSdYQb
	IrwIYZwtU4kiedETJLoif3R3R0HdKsMnLuGKt6WLrw4al3opCDDk8IIjzQtDvwr3L8DHe+KhLuYTi
	YXDkYoPMKHYNLZDHAOHv189ehH+2AXPa/DokvNe11f/rbJcyWc5Poah3+AU9BetQCVJmwouoTLbB2
	/2zDf0R4o8OyC4pY7ZJIkbyJPGhpxXf3jFQ8GExHHldab2bA68mb5tDyokSh3SMAar4dMaXad+KAm
	ucN1Umqj5tiuiJrbVy+3EB4wa2FpZSVT8LaYpNE36vuNUF/HH7Eou8eQ5pQYKbLUK/ZE18nqFbvyO
	oAKzg2Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2G2z-00000004hH1-3uvj;
	Fri, 26 Sep 2025 21:32:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2G2x-00000004hEe-1lAc;
	Fri, 26 Sep 2025 21:32:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D6E9C45A26;
	Fri, 26 Sep 2025 21:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA28C4CEF7;
	Fri, 26 Sep 2025 21:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758922326;
	bh=s11rU3UFLaS0Sp8EzrbQgKe7uppn0ywvUykAZ5Jlu+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KpYdeDfnhMqz1YxGrCTA0V5KRELoLAUV9N8OpcWmOafoCcc2MoUgARxKF4e+LgwYB
	 bwf8l5nL/62riCbPcp1/3Jg2qR0xVozoaBP7lgUPISAvfDR2qplS0Bsyzth/Rg+sU1
	 cXfZM3eBYe6rJ5kKYSc7APTXRU+Dnhyj1WAoTvgvEjoG7nKRs4bhVExMyhO0J1s7VB
	 K6PXj5BZJoLWsY3r/pNNkYyxMUy/javEKi1h0IA/Q6qjYI9OZhzHgefObwy0TB/yyc
	 h7p+VMuNQgR3oxqKeQ3/Bwc6kgGa2+QxjRmcLxShiJxxmrZaC0A5dpNVc/usPR++dB
	 5Bvo4nOiPS6yw==
Date: Fri, 26 Sep 2025 16:32:02 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v3 4/4] PCI: mediatek: add support for Airoha AN7583 SoC
Message-ID: <20250926213202.GB1573360-robh@kernel.org>
References: <20250925162332.9794-1-ansuelsmth@gmail.com>
 <20250925162332.9794-5-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925162332.9794-5-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_143207_505071_37DC08CD 
X-CRM114-Status: GOOD (  27.31  )
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

On Thu, Sep 25, 2025 at 06:23:18PM +0200, Christian Marangi wrote:
> Add support for the second PCIe line present on Airoha AN7583 SoC.
> 
> This is based on the Mediatek Gen1/2 PCIe driver and similar to Gen3
> also require workaround for the reset signals.
> 
> Introduce a new bool to skip having to reset signals and also introduce
> some additional logic to configure the PBUS registers required for
> Airoha SoC.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 85 +++++++++++++++++++-------
>  1 file changed, 63 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 24cc30a2ab6c..640d1f1a6478 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -147,6 +147,7 @@ struct mtk_pcie_port;
>   * @need_fix_class_id: whether this host's class ID needed to be fixed or not
>   * @need_fix_device_id: whether this host's device ID needed to be fixed or not
>   * @no_msi: Bridge has no MSI support, and relies on an external block
> + * @skip_pcie_rstb: Skip calling RSTB bits on PCIe probe
>   * @device_id: device ID which this host need to be fixed
>   * @ops: pointer to configuration access functions
>   * @startup: pointer to controller setting functions
> @@ -156,6 +157,7 @@ struct mtk_pcie_soc {
>  	bool need_fix_class_id;
>  	bool need_fix_device_id;
>  	bool no_msi;
> +	bool skip_pcie_rstb;
>  	unsigned int device_id;
>  	struct pci_ops *ops;
>  	int (*startup)(struct mtk_pcie_port *port);
> @@ -679,28 +681,30 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
>  		regmap_update_bits(pcie->cfg, PCIE_SYS_CFG_V2, val, val);
>  	}
>  
> -	/* Assert all reset signals */
> -	writel(0, port->base + PCIE_RST_CTRL);
> -
> -	/*
> -	 * Enable PCIe link down reset, if link status changed from link up to
> -	 * link down, this will reset MAC control registers and configuration
> -	 * space.
> -	 */
> -	writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
> -
> -	/*
> -	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal) and
> -	 * 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST# should
> -	 * be delayed 100ms (TPVPERL) for the power and clock to become stable.
> -	 */
> -	msleep(100);
> -
> -	/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
> -	val = readl(port->base + PCIE_RST_CTRL);
> -	val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
> -	       PCIE_MAC_SRSTB | PCIE_CRSTB;
> -	writel(val, port->base + PCIE_RST_CTRL);
> +	if (!soc->skip_pcie_rstb) {
> +		/* Assert all reset signals */
> +		writel(0, port->base + PCIE_RST_CTRL);
> +
> +		/*
> +		 * Enable PCIe link down reset, if link status changed from link up to
> +		 * link down, this will reset MAC control registers and configuration
> +		 * space.
> +		 */
> +		writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
> +
> +		/*
> +		 * Described in PCIe CEM specification sections 2.2 (PERST# Signal) and
> +		 * 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST# should
> +		 * be delayed 100ms (TPVPERL) for the power and clock to become stable.
> +		 */
> +		msleep(100);
> +
> +		/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
> +		val = readl(port->base + PCIE_RST_CTRL);
> +		val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
> +		       PCIE_MAC_SRSTB | PCIE_CRSTB;
> +		writel(val, port->base + PCIE_RST_CTRL);
> +	}
>  
>  	/* Set up vendor ID and class code */
>  	if (soc->need_fix_class_id) {
> @@ -1105,6 +1109,33 @@ static int mtk_pcie_probe(struct platform_device *pdev)
>  	if (err)
>  		goto put_resources;
>  
> +	if (device_is_compatible(dev, "airoha,an7583-pcie")) {

This should check some match data flag rather than checking compatible 
again. Otherwise this becomes device_is_compatible() || 
device_is_compatible() || device_is_compatible()...

Rob

