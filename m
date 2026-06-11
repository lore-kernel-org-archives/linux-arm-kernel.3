Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737DFCD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 22:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=BlddrtjDVCAlCgNHnLo0GABr55ofYJLh22S8cPPK6vE=; b=U+M3Bf2R6v83o2
	IwPzsE4CPj4afxwXAQrdN+mfoXb/Pn1GWGhfyD6uih6iOY6QJHP4K3lzOW7mJPSeHd2s9rAcXwD4S
	sDTrF5SIW8w0LVFvUeD623HRoEU/jdM1k3l+6chrEa9mpl1q/O56GJG63RqVV7yzlga/FMZnjMrST
	HYHt5OjsAKLseJJanl2DRkk4KTAl3ztaplMFmKg9bP5GQY84y4g+wXF00wyaHFog+iDsIdcppA+/0
	Wqrelg3iLnNIBwzhTUtg+WS6OLlCVrzS/wcB+fx2ievQ/K+fHORRphN79ScwX4hh22jFzVlYeFHaA
	56PBbeaWL3GioD9j7jhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXnrV-0000000A8ma-3UzV;
	Thu, 11 Jun 2026 22:26:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXnrU-0000000A8mN-15Cp;
	Thu, 11 Jun 2026 22:26:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D6BB40DE6;
	Thu, 11 Jun 2026 22:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41BB71F00A3A;
	Thu, 11 Jun 2026 22:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781216815;
	bh=BlddrtjDVCAlCgNHnLo0GABr55ofYJLh22S8cPPK6vE=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=BcNwpAN9g6CyY54DyXzcOwLS0ZaRuogb/V+aAniatqyJ+wzg1FSqY5AOqNpmXnUTO
	 Ql/Q4qQoJYEKmyRlevaGJa32KVHmqEYeM4y+sJ6gg+PMaoYdt9EsJU2Oz6XQ9S2/Ui
	 ybBpcuVJWpAmmIEummwCwLeauvAlD+lEzDYeuYoJjElyiSEw8npN1zizgdbab/I7aB
	 5sla8YC1c08m19/0XjV8mpISxV4W4zSRmoGssrfFqlGwfNJ3p2JiGVRJjHaFHD0g1I
	 w3Uv1f7M5LBV0DaXbcE5tKiG8KeWUh8MRCtoD747Af2ovlYngx6DiEkVJlggtNlU5u
	 QecWu1lX5QjZw==
Date: Thu, 11 Jun 2026 17:26:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Shuvam Pandey <shuvampandey1@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Fan Ni <fan.ni@samsung.com>, Shradha Todi <shradha.t@samsung.com>,
	Hanjie Lin <hanjie.lin@amlogic.com>, linux-pci@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] PCI: meson: Add missing remove callback
Message-ID: <20260611222653.GA527114@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a0c86ab264cdc1c79c917e984b90991af51d827.1779123847.git.shuvampandey1@gmail.com>
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

On Mon, May 18, 2026 at 10:44:18PM +0545, Shuvam Pandey wrote:
> meson_pcie_probe() powers on the PHY and registers the DesignWare host
> bridge with dw_pcie_host_init(), but the driver has no remove callback.
> On driver unbind or module unload, the driver core therefore proceeds to
> devres cleanup without first unregistering the host bridge or powering off
> the PHY.
> 
> Add a remove callback that deinitializes the DesignWare host bridge and
> powers off the PHY while device-managed resources are still valid.

What's the user-visible effect of this?  Does it avoid an oops?
Reduce power usage?

Of the 34 instances of .probe() in drivers/pci/controller/dwc/, on 12
implement .remove(), so if this fixes a problem, I'm wondering whether
other drivers have the same problem.

> Fixes: 9c0ef6d34fdb ("PCI: amlogic: Add the Amlogic Meson PCIe controller driver")
> Signed-off-by: Shuvam Pandey <shuvampandey1@gmail.com>
> ---
>  drivers/pci/controller/dwc/pci-meson.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> index 0694084f6..c96e2244a 100644
> --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -451,6 +451,14 @@ static int meson_pcie_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +static void meson_pcie_remove(struct platform_device *pdev)
> +{
> +	struct meson_pcie *mp = platform_get_drvdata(pdev);
> +
> +	dw_pcie_host_deinit(&mp->pci.pp);
> +	meson_pcie_power_off(mp);
> +}
> +
>  static const struct of_device_id meson_pcie_of_match[] = {
>  	{
>  		.compatible = "amlogic,axg-pcie",
> @@ -464,6 +472,7 @@ MODULE_DEVICE_TABLE(of, meson_pcie_of_match);
>  
>  static struct platform_driver meson_pcie_driver = {
>  	.probe = meson_pcie_probe,
> +	.remove = meson_pcie_remove,
>  	.driver = {
>  		.name = "meson-pcie",
>  		.of_match_table = meson_pcie_of_match,
> -- 
> 2.50.1 (Apple Git-155)
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

