Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865EFCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 09:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vc/Ld1NtDq8exCNprRyMYMB04P0L2ZADAHjfvj1U/gg=; b=v3QVA/XY+J55MbJQfLeDvHcP8O
	t3EQgtV81JwCVRk4UR7jPabW/55JoSBeC5NNSmtSNV/Uc8YU9plmDnV+HuAgQSfiyXg3LRF1ITmaI
	L7EsOuk9pTL9vTRgU+CmhYn4Vl4o8nYaPfQIvKHGWDGNF0qz+/SEhIOeIz61VBiPDNjcoPVvKMQl4
	hi7AvEy4Es8wr56IaxyfcwzS8/iyScyW4I/y6WYjvKcTIhW93UpQ4BpOAIZd/mXJkHKy85RNMrz7q
	EzOtQOr8mcPKDWuC9qOA+zCjKCPviesFR4Q+gH5DuhU1mMsONNh2CmwN5Frv9U0eXYFRyFw5n9Z3a
	mvLIEiSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGDTZ-0000000BXob-1SWF;
	Tue, 04 Nov 2025 09:37:17 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGDTW-0000000BXoA-3MWI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 09:37:15 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E01321A0135;
	Tue,  4 Nov 2025 10:37:10 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D26211A004C;
	Tue,  4 Nov 2025 10:37:10 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 38F12202E8;
	Tue,  4 Nov 2025 10:37:10 +0100 (CET)
Date: Tue, 4 Nov 2025 10:37:10 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH net-next 02/11] net: stmmac: s32: move PHY_INTF_SEL_x
 definitions out of the way
Message-ID: <aQnJRgJqFY99kDUj@lsv051416.swis.nl-cdc01.nxp.com>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
 <E1vFt4S-0000000ChoS-2Ahi@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vFt4S-0000000ChoS-2Ahi@rmk-PC.armlinux.org.uk>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_013714_995172_74997131 
X-CRM114-Status: GOOD (  16.19  )
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

On Mon, Nov 03, 2025 at 11:50:00AM +0000, Russell King (Oracle) wrote:
> S32's PHY_INTF_SEL_x definitions conflict with those for the dwmac
> cores as they use a different bitmapping. Add a S32 prefix so that
> they are unique.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> index ee095ac13203..2b7ad64bfdf7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> @@ -24,10 +24,10 @@
>  #define GMAC_INTF_RATE_125M	125000000	/* 125MHz */
>  
>  /* SoC PHY interface control register */
> -#define PHY_INTF_SEL_MII	0x00
> -#define PHY_INTF_SEL_SGMII	0x01
> -#define PHY_INTF_SEL_RGMII	0x02
> -#define PHY_INTF_SEL_RMII	0x08
> +#define S32_PHY_INTF_SEL_MII	0x00
> +#define S32_PHY_INTF_SEL_SGMII	0x01
> +#define S32_PHY_INTF_SEL_RGMII	0x02
> +#define S32_PHY_INTF_SEL_RMII	0x08
>  
>  struct s32_priv_data {
>  	void __iomem *ioaddr;
> @@ -40,7 +40,7 @@ struct s32_priv_data {
>  
>  static int s32_gmac_write_phy_intf_select(struct s32_priv_data *gmac)
>  {
> -	writel(PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
> +	writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
>  
>  	dev_dbg(gmac->dev, "PHY mode set to %s\n", phy_modes(*gmac->intf_mode));
>  
> -- 
> 2.47.3
> 

Reviewed-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Thanks.
/Jan


