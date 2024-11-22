Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290A9E65D32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 08:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMD2mdjlpFqaHKrkK26yzFTEcmuAs55YSaXgREhafHw=; b=IrMzEyKSBfzQvhFSw6kRZUFwYq
	EKSXvn2umRovyhNAaabISSPQxW8dF4pftYyz5A9pDHqR+DgujqlbRZpE4J3rbmnGaWHAjXtDsI1G0
	zW1Q2caO1z9ZcWSoq+QhVNA48eRYz8gKkyfSqhiq01tngxvQ6DXt5Ds8TC7hjIUWogKQ/0hRN4N7u
	g+VrRalR89tlG0d9vkGLCJ0pScaODlf4GqpUkv5S/O7gBEHnsG4NSrt7s0dq+4nQ9Tz2OP+aQp/mZ
	3r56QJH1sE18Ew5VTlBDwSeAEBLstRKGG/23EWKOuSjqMX+8dsboLes7YhA1mpJETFPHm0p51JYao
	k9xArKlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEOcM-00000001sIk-2l1B;
	Fri, 22 Nov 2024 08:02:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEObP-00000001s8e-40vr;
	Fri, 22 Nov 2024 08:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OMD2mdjlpFqaHKrkK26yzFTEcmuAs55YSaXgREhafHw=; b=ldO9/HYBBQJ0Obh5Yeds+F34kQ
	wmUmZWEyvRzrKAlLf2IF3xED6dzrS34N6BGQeVACHNQvkgFWzsDJVcWyCdLrO30NHJABnHILB20hq
	AcBToaqK84O1dDrlJCPVALnOilxNUmAAQiW0MTe318MDs9m95sOy7rFrpSpqQbzIDJL425Tskazxu
	tlFQcEX7iiWL7kU5RK4bZaD9plyyUVL5DSAczRW3K4s/GmA5lO3wKG84Vz5X65kle2ZcTnbHP41gY
	L8DDbXMFX8kmJgEg0XcGgC7cZC3DvmqUntVdfKd++6qlW8uZl+1HVlPKCr5oRmLM8rXlWRVgfZKX7
	PuwYAq0g==;
Received: from [185.156.123.69] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tEObJ-0004J3-G4; Fri, 22 Nov 2024 09:01:13 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, Chukun Pan <amadeus@jmu.edu.cn>,
 FUKAUMI Naoki <naoki@radxa.com>,
 Michael Zimmermann <sigmaepsilon92@gmail.com>
Subject: Re: [PATCH 2/2] phy: rockchip: naneng-combphy: fix phy reset
Date: Fri, 22 Nov 2024 09:01:12 +0100
Message-ID: <6110148.lOV4Wx5bFT@phil>
In-Reply-To: <20241122073006.99309-2-amadeus@jmu.edu.cn>
References: <20241122073006.99309-1-amadeus@jmu.edu.cn>
 <20241122073006.99309-2-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_000119_995977_B0DF0652 
X-CRM114-Status: GOOD (  18.11  )
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

Am Freitag, 22. November 2024, 08:30:06 CET schrieb Chukun Pan:
> Currently, the USB port via combophy on the RK3528/RK3588 SoC is broken.
> 
>   usb usb8-port1: Cannot enable. Maybe the USB cable is bad?
> 
> This is due to the combphy of RK3528/RK3588 SoC has multiple resets, but
> only "phy resets" need assert and deassert, "apb resets" don't need.
> So change the driver to only match the phy resets, which is also what
> the vendor kernel does.
> 
> Fixes: 7160820d742a ("phy: rockchip: add naneng combo phy for RK3568")
> Cc: FUKAUMI Naoki <naoki@radxa.com>
> Cc: Michael Zimmermann <sigmaepsilon92@gmail.com>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> index 0a9989e41237..2eb3329ca23f 100644
> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> @@ -309,7 +309,7 @@ static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy
>  
>  	priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
>  
> -	priv->phy_rst = devm_reset_control_array_get_exclusive(dev);
> +	priv->phy_rst = devm_reset_control_get(dev, "phy");
>  	if (IS_ERR(priv->phy_rst))
>  		return dev_err_probe(dev, PTR_ERR(priv->phy_rst), "failed to get phy reset\n");

That reset-control is deasserted in the driver in a place where
already parts of the phy are supposed to be configured, so it
wiggling the apb_reset at those places (i.e. after running
priv->cfg->combphy_cfg()) probably causes strange effects, so

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



