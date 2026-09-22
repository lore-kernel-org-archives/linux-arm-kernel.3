Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C25C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 06:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYJeYVq+zoPSXgvrTiKhlttbrwfDZWH+MXsuurAOmL4=; b=YVrLUo+75feGVTWDLx5E/+g5O5
	PXEf7D93//fVsGLnGnvC/EJ2mk8Jo49Pa5ZvB6bxgMHCN19juehUV9DCPAZOMZgAQoK0y5iIZrg8X
	e33i5UaAnXYA3IeigJ8WFlhtGc/KswUvPK2ErWpf54xC8J0l/RNvagGS8ZVNIhrsoJvGVkltdXwCg
	I0jLfCHPNOf7Egx1SBKH+b97WlVTn+1Tce7jcTI8oT6VmdrgcVb0xTDvZykPc5tawNQUMzmqm5dLw
	DxXu/cr5a5KmsY69dGUL7whTrKGn2nBTjVQ+SyssN5DUxEqVnoMSj2AzYaeQztZKbnTbStRoZpcBH
	6WQ1hbyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uTV-00000004QlD-1Okl;
	Tue, 22 Sep 2026 06:59:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uTS-00000004QjZ-0VhW
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 06:59:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CYJeYVq+zoPSXgvrTiKhlttbrwfDZWH+MXsuurAOmL4=; b=nWMLWIRt15KpBfBd3oz6NuLXyC
	K+UtYtf4dScE3zzennDQ58DbM8u7C6lY7qRRX9tr6VKNa2NRsD7Wn4Qx0e8X/VXaBzT47DNi9wmWs
	8jeu5WpcmAGyHU3lSaCZK3MdMJXIt9fvzoKpIFCjO0GZRvfQbrWGss8A8gbUeKNgWwqWar7hEeDVI
	CzxxOpHQYORZF0jV/UzaKq/8iOACONgx7mVJASMB5BnjXBiSnaEDdZ756iiJjD3BayXX1L6CsdNEo
	KSn5V3Dwa3YXIoPa6uYP/EFjRFMx47f9uBtyAD9VXDAwpwruEedvMd4b1RF4Kf+/uwD32Re93P1pT
	osz5WpTQ==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8uTO-0000000DBWP-2vnh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 06:59:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E123C4E40EC4;
	Tue, 22 Sep 2026 06:59:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9947560580;
	Tue, 22 Sep 2026 06:59:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2AD541032920C;
	Tue, 22 Sep 2026 08:59:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790060361; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=CYJeYVq+zoPSXgvrTiKhlttbrwfDZWH+MXsuurAOmL4=;
	b=04z+sDMfWGyJYBXSgQNXBy3AkYLFY8XpueASItQKWpzYTtG8+ABBFthFjuGX7LlEsXTh5T
	2TQ/8CPiNBsIHa5Wxg3NMxlaB/ekvbjTBgF/LPvPYvJjPEd9ZiDyHmMURMMwMt7RSSo09m
	PRdjI3GEuMVpgPBiFEc45AXbxcuhVOm3pOb3eNgj1Y+hPTojTMjAtUgsZql5UnqYLxEzaf
	JLQqOFIOz8QGxZOGo/0lln2uuvMiodSirzz3w1ZXmE6Jp/BJP1BoosQEmyTSEaJWT0K/SY
	MKLBHtp3HUpFOMk+MPyJN35Gd2n1rfSIwY70mcoBkcc0nPUTrmM9FintCMWsJg==
Message-ID: <839fd50c-f74a-4189-86f4-1d5173050fca@bootlin.com>
Date: Tue, 22 Sep 2026 08:59:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 4/4] net: stmmac: dwmac-socfpga: Add support
 for Agilex5 TSN GMAC with FPGA converter
To: muhammad.nazim.amirul.nazle.asmade@altera.com, dinguyen@kernel.org
Cc: rmk+kernel@armlinux.org.uk, krzk+dt@kernel.org, conor+dt@kernel.org,
 robh@kernel.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260908070557.3585-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260908070557.3585-5-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260908070557.3585-5-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_075927_140993_43E7E740 
X-CRM114-Status: GOOD (  21.54  )
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

Hi,

On 9/8/26 09:05, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> The Agilex5 SoCDK TSN Config2 board uses a GMII-to-RGMII converter
> implemented as FPGA soft IP between gmac1 and its PHY. This converter
> provides the RGMII TX/RX clock delays, so the MAC interface selector
> must be configured for GMII while the PHY is configured without delays.
> 
> Add the "altr,socfpga-stmmac-agilex5-tsn" compatible with dedicated
> match .data ops that extend the standard Agilex5 setup: force GMII for
> the MAC interface selector and strip delay bits from phy_interface so
> the PHY is not configured to add delays already provided by the FPGA
> converter.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
> v6: No changes from v5.
> v5: Replace of_device_is_compatible() probe check with dedicated
>     socfpga_agilex5_tsn_gmac_ops via match .data, per Krzysztof
>     Kozlowski and Dinh Nguyen.
> v4: Add Reviewed-by from Andrew Lunn.
> 
>  .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 23 ++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> index 1d7f0a57d288..0632105b420f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> @@ -69,12 +69,13 @@ struct socfpga_dwmac {
>  	void __iomem *tse_pcs_base;
>  	void __iomem *sgmii_adapter_base;
>  	bool f2h_ptp_ref_clk;
> +	phy_interface_t mac_interface;
>  	const struct socfpga_dwmac_ops *ops;
>  };
>  
>  static phy_interface_t socfpga_get_plat_phymode(struct socfpga_dwmac *dwmac)
>  {
> -	return dwmac->plat_dat->phy_interface;
> +	return dwmac->mac_interface;
>  }
>  
>  static void socfpga_sgmii_config(struct socfpga_dwmac *dwmac, bool enable)
> @@ -650,6 +651,8 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
>  	plat_dat->pcs_exit = socfpga_dwmac_pcs_exit;
>  	plat_dat->select_pcs = socfpga_dwmac_select_pcs;
>  
> +	dwmac->mac_interface = plat_dat->phy_interface;
> +
>  	ops->setup_plat_dat(dwmac);
>  
>  	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
> @@ -670,10 +673,28 @@ static const struct socfpga_dwmac_ops socfpga_agilex5_ops = {
>  	.setup_plat_dat = socfpga_agilex5_setup_plat_dat,
>  };
>  
> +static void socfpga_agilex5_tsn_gmac_setup_plat_dat(struct socfpga_dwmac *dwmac)
> +{
> +	struct plat_stmmacenet_data *plat_dat = dwmac->plat_dat;
> +
> +	socfpga_agilex5_setup_plat_dat(dwmac);
> +
> +	/* FPGA converter supplies RGMII delays; MAC uses GMII, PHY gets plain RGMII */
> +	dwmac->mac_interface = PHY_INTERFACE_MODE_GMII;
> +	if (phy_interface_mode_is_rgmii(plat_dat->phy_interface))
> +		plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII;
> +}
> +
> +static const struct socfpga_dwmac_ops socfpga_agilex5_tsn_gmac_ops = {
> +	.set_phy_mode = socfpga_gen10_set_phy_mode,
> +	.setup_plat_dat = socfpga_agilex5_tsn_gmac_setup_plat_dat,
> +};
> +
>  static const struct of_device_id socfpga_dwmac_match[] = {
>  	{ .compatible = "altr,socfpga-stmmac", .data = &socfpga_gen5_ops },
>  	{ .compatible = "altr,socfpga-stmmac-a10-s10", .data = &socfpga_gen10_ops },
>  	{ .compatible = "altr,socfpga-stmmac-agilex5", .data = &socfpga_agilex5_ops },
> +	{ .compatible = "altr,socfpga-stmmac-agilex5-tsn", .data = &socfpga_agilex5_tsn_gmac_ops },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, socfpga_dwmac_match);


