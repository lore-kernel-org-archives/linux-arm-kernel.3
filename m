Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17092D25B4E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 12:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nt+rFMdfN8J/Od5ZxAlP0/NBOY04c1nwhZZHLMy+wd8=; b=LyF3QJMMYiFLOWn/S/+2hLzi9q
	JCmYaZAWumNfbfAbc0dcU2IoW9rGuM6cJvo8hNVsZNGl7oOMYXt9MxrhAoS9ok8+b4Gnpx/KTlkpj
	YGeohtIfeeWC7iwso/sENFUeM27JBeXPIgAkIDHCW7HY5SVWhGHdHzsFInPKLFgiXkHYMOVRRSDFn
	SZamT87rCA4K/TjFAm7tMCN/uaS9eb3/39px4pGfMnBIxWC/T/yg4iLNWesN/cfqIRe1DwsmfytAw
	QdvAG2c4gxTAJW2aJEs1xBZGAn0yzw8nZz0xWwotUTwRu2hRn/z1H009dZHToxp2ks1wYOLmoQikz
	Q0dUZjNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl4hL-0000000G0Nf-2NGM;
	Wed, 28 Jan 2026 12:31:03 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl4hH-0000000G0N4-3qI6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 12:31:01 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 002151A1B8C;
	Wed, 28 Jan 2026 13:30:57 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DD1241A1B7F;
	Wed, 28 Jan 2026 13:30:56 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id BF73520364;
	Wed, 28 Jan 2026 13:30:55 +0100 (CET)
Date: Wed, 28 Jan 2026 13:30:56 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: s32@nxp.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org, imx@lists.linux.dev
Subject: Re: [PATCH v5 1/3] net: stmmac: s32: use a syscon for
 S32_PHY_INTF_SEL_RGMII
Message-ID: <aXoBgO+qRRmB1yVM@lsv051416.swis.nl-cdc01.nxp.com>
References: <cover.1769592679.git.dan.carpenter@linaro.org>
 <b38f1c628cdac8e87271e5fa4e2b71110c15b42c.1769592679.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b38f1c628cdac8e87271e5fa4e2b71110c15b42c.1769592679.git.dan.carpenter@linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_043100_305659_53DA3DC4 
X-CRM114-Status: GOOD (  26.03  )
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

On Wed, Jan 28, 2026 at 12:54:01PM +0300, Dan Carpenter wrote:
> On the s32 chipsets the GMAC_0_CTRL_STS register is in GPR region.
> Originally, accessing this register was done in a sort of ad-hoc way,
> but we want to use the syscon interface to do it.
> 
> This is a little bit ugly because we have to maintain backwards
> compatibility to the old device trees so we have to support both ways
> to access this register.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v5: Return an error if regmap_write() fails
> v4: no change
> v3: no change
> v2: Fix forward porting bug.  s/PHY_INTF_SEL_RGMII/S32_PHY_INTF_SEL_RGMII/
> 
>  .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 28 +++++++++++++++----
>  1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> index 5a485ee98fa7..af594a096676 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> @@ -11,12 +11,14 @@
>  #include <linux/device.h>
>  #include <linux/ethtool.h>
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of_mdio.h>
>  #include <linux/of_address.h>
>  #include <linux/phy.h>
>  #include <linux/phylink.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/stmmac.h>
>  
>  #include "stmmac_platform.h"
> @@ -32,6 +34,8 @@
>  struct s32_priv_data {
>  	void __iomem *ioaddr;
>  	void __iomem *ctrl_sts;
> +	struct regmap *sts_regmap;
> +	unsigned int sts_offset;
>  	struct device *dev;
>  	phy_interface_t *intf_mode;
>  	struct clk *tx_clk;
> @@ -40,11 +44,17 @@ struct s32_priv_data {
>  
>  static int s32_gmac_write_phy_intf_select(struct s32_priv_data *gmac)
>  {
> -	writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
> +	int ret = 0;
> +
> +	if (gmac->ctrl_sts)
> +		writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
> +	else
> +		ret = regmap_write(gmac->sts_regmap, gmac->sts_offset,
> +				   S32_PHY_INTF_SEL_RGMII);
>  
>  	dev_dbg(gmac->dev, "PHY mode set to %s\n", phy_modes(*gmac->intf_mode));
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static int s32_gmac_init(struct device *dev, void *priv)
> @@ -125,10 +135,16 @@ static int s32_dwmac_probe(struct platform_device *pdev)
>  				     "dt configuration failed\n");
>  
>  	/* PHY interface mode control reg */
> -	gmac->ctrl_sts = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
> -	if (IS_ERR(gmac->ctrl_sts))
> -		return dev_err_probe(dev, PTR_ERR(gmac->ctrl_sts),
> -				     "S32CC config region is missing\n");
> +	gmac->sts_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
> +					"nxp,phy-sel", 1, &gmac->sts_offset);
> +	if (gmac->sts_regmap == ERR_PTR(-EPROBE_DEFER))
> +		return PTR_ERR(gmac->sts_regmap);
> +	if (IS_ERR(gmac->sts_regmap)) {
> +		gmac->ctrl_sts = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
> +		if (IS_ERR(gmac->ctrl_sts))
> +			return dev_err_probe(dev, PTR_ERR(gmac->ctrl_sts),
> +					     "S32CC config region is missing\n");
> +	}
>  
>  	/* tx clock */
>  	gmac->tx_clk = devm_clk_get(&pdev->dev, "tx");
> -- 
> 2.51.0
> 

Reviewed-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Thanks.
/Jan


