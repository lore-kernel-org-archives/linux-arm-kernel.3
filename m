Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21C2C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 01:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Stj7XRN1t+oCrImVFuhpTiatxFSWHyiqWK4ar3jhLs=; b=nRGu/qPLUgEXjSC/m+ik3KA+NF
	ayZXyoYu82FkUCzZxd/J+dIqshOX1wtkT+y2oGPgZ0uWNauBzU2sJT2nSmAEZk/l20E5KZUKtosCr
	NEORyL7f5ZyrP7RfuVy3dl1VSlO+rfpcibPGArW2RMlVwJI3sQf+i0636cTjRJLdL8F07shBh6vdP
	UpNfpXEFHK9vAGX7RFX6daVJ0iNO2aZoJ/a1IeoRjKsa4eFsAs5xkVIoXScfVQd7vyWirKyl+ztBk
	tm6EtYjgAliT6V8z3nEqWMgfCBCoD6ih6r5MG2v1R4uK8kzFuQg6RZLC0+IFpDx79TKAZvNkiccff
	TJ8QDJXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGScB-00000006V0W-0zO9;
	Sun, 18 May 2025 01:14:55 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGSa8-00000006UrQ-2FNq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 01:12:50 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4768f90bf36so36023371cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 May 2025 18:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747530767; x=1748135567; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Stj7XRN1t+oCrImVFuhpTiatxFSWHyiqWK4ar3jhLs=;
        b=Hdfy9eMRs1caRbT3io0a3Gq2trz4Snn8yQByoudnzHY6yPB/tPTHeVxHwJ6Ph/Zw+b
         MgLZmedCFwtLwz4FvQpSTVwiuwf/9NlQQsqxl4xoIFL/cxXdMBoLZykDJeY1Q2zJIYeX
         ggJzpMLCk0k1Sdt1AtZlKCeGxMb4ErHR0F1ezm3fzruM6u4yuAC+SxKEm/6EFf82R1CA
         Yy2G88iy/RXbgCHxE2KXtoENIqOZFD4wclh/vN71lJp5PFg3YTHQvG/zSTVziUkD4nY3
         rqQcN0dWO9kRmzA1E1b4jvDlwNWsAOn3gK6up8gFsNkRRfBI6Mg7z9vYZ/5De7Rf37id
         Q0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747530767; x=1748135567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Stj7XRN1t+oCrImVFuhpTiatxFSWHyiqWK4ar3jhLs=;
        b=IawSh5QqRMoAXTZCsmVM/grmnrgMnIcqAeDQAeB8TVG5g2kar+oBeXFa2d0/8QEDwI
         eNFOlF1x+ed1+NmPiH1TwCLVbSuHb+pSPKnDQg+wK/CAbHU+YMAl4visFJ+20ldP5YRR
         gJtkDCXlNd8xBHPx9jXaiwXUNuWpRnE+8/7OuYM1zmLE5Hu/BNHSC63/xBKPTwWH1zbJ
         XrAe0IUuEW6NssYRw/7mVUAEuGnaVhSQ16cH9+SaRCaBGvlbTsAzRJep2I4o/F/jOIB7
         pNsBFF85ucoE9Ylq9Y6v/U5ovH04uLzUOD7/nMqfzxGwOhwj4FzaIcj3J+7jIoo+BwLv
         ZNHA==
X-Forwarded-Encrypted: i=1; AJvYcCWosngkBfsgpGRV4/XSS8PfInSMA0oI0EyG9FPheZau+dbIUfyxJ9ubFNomRyPseI8PsyI4MUEIzwbjiP7oDRRj@lists.infradead.org
X-Gm-Message-State: AOJu0YyV9tTW6JboYH222RWp9u5f9aojxamrEVz8Zd5yaClL+6HpJAoC
	ROT4ZJreZPcX41+NZ9V+V59/zUjf40L1yG1kRBCDD+LvGSY1iIAbDhF8
X-Gm-Gg: ASbGncux1EG8vZ6p4GMt5bZtqo8hlHfsktXT/VpAnW7GzmpuFnp0y2GsMq5hG01EVNm
	xcrHVr8DCnQkBgrHL8fyjR/f9d4+RYlxkW+dhyhrxZs+u37w8x4RJlF3j0IArBn7p7C/zCTjoss
	skd5PbSHSOPc4J+ySeUylJkofCVblAmuSW6Wsbt8vrZu9NvEW3CajCPACj/r3nDl5DR+cgRU2uc
	TW683M483yp9BKL0lfz1plZxsGQIZcXV2S8paqD/2wn3PjgsRUzJGyEh3mqcNNgjkp+tGq7yb2Q
	zDDyx5F8p+u8PMSAx/nvjJZeT+E=
X-Google-Smtp-Source: AGHT+IEqpUoSLF4xMgehWhpJ/51Ri1bqGkDmQ3BY1ft3floCcjBj/opJDzbop8Lbtw0QfROAzDbS7A==
X-Received: by 2002:a05:622a:5c1a:b0:476:8eb5:1669 with SMTP id d75a77b69052e-494b0939b32mr148900261cf.32.1747530766850;
        Sat, 17 May 2025 18:12:46 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-494ae528b60sm32316441cf.74.2025.05.17.18.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 18:12:46 -0700 (PDT)
Date: Sun, 18 May 2025 09:12:10 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: weishangjuan@eswincomputing.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	richardcochran@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	p.zabel@pengutronix.de, yong.liang.choong@linux.intel.com, rmk+kernel@armlinux.org.uk, 
	jszhang@kernel.org, inochiama@gmail.com, jan.petrous@oss.nxp.com, 
	dfustini@tenstorrent.com, 0x1207@gmail.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com, 
	lizhi2@eswincomputing.com
Subject: Re: [PATCH v1 2/2] ethernet: eswin: Add eic7700 ethernet driver
Message-ID: <6rzz5snt5c5flvqj7fgunfn73pw2r2iklns2cdunx2gjl7mtab@hxa5nsuk63no>
References: <20250516010849.784-1-weishangjuan@eswincomputing.com>
 <20250516011130.818-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516011130.818-1-weishangjuan@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_181248_591788_D3331AB1 
X-CRM114-Status: GOOD (  33.47  )
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

On Fri, May 16, 2025 at 09:11:28AM +0800, weishangjuan@eswincomputing.com wrote:
> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Add Ethernet controller support for Eswin's eic7700 SoC. The driver
> provides management and control of Ethernet signals for the eiC7700
> series chips.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> Signed-off-by: Shangjuan Wei <weishangjuan@eswincomputing.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 521 ++++++++++++++++++
>  3 files changed, 533 insertions(+)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index 3c820ef56775..6a3970c92db7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -66,6 +66,17 @@ config DWMAC_ANARION
>  
>  	  This selects the Anarion SoC glue layer support for the stmmac driver.
>  
> +config DWMAC_EIC7700
> +	tristate "Support for Eswin eic7700 ethernet driver"
> +	select CRC32
> +	select MII
> +	depends on OF && HAS_DMA && ARCH_ESWIN || COMPILE_TEST
> +	help
> +	  This driver supports the Eswin EIC7700 Ethernet controller,
> +	  which integrates Synopsys DesignWare QoS features. It enables
> +	  high-speed networking with DMA acceleration and is optimized
> +	  for embedded systems.
> +
>  config DWMAC_INGENIC
>  	tristate "Ingenic MAC support"
>  	default MACH_INGENIC
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> index 594883fb4164..c9279bafdbb1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -14,6 +14,7 @@ stmmac-$(CONFIG_STMMAC_SELFTESTS) += stmmac_selftests.o
>  # Ordering matters. Generic driver must be last.
>  obj-$(CONFIG_STMMAC_PLATFORM)	+= stmmac-platform.o
>  obj-$(CONFIG_DWMAC_ANARION)	+= dwmac-anarion.o
> +obj-$(CONFIG_DWMAC_EIC7700)	+= dwmac-eic7700.o
>  obj-$(CONFIG_DWMAC_INGENIC)	+= dwmac-ingenic.o
>  obj-$(CONFIG_DWMAC_IPQ806X)	+= dwmac-ipq806x.o
>  obj-$(CONFIG_DWMAC_LPC18XX)	+= dwmac-lpc18xx.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> new file mode 100644
> index 000000000000..3483827e5652
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> @@ -0,0 +1,521 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Eswin DWC Ethernet linux driver
> + *
> + * Authors: Shuang Liang <liangshuang@eswincomputing.com>
> + * Shangjuan Wei <weishangjuan@eswincomputing.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/ethtool.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/ioport.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_net.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/stmmac.h>
> +#include "stmmac_platform.h"
> +#include "dwmac4.h"
> +#include <linux/mfd/syscon.h>
> +#include <linux/bitfield.h>
> +#include <linux/regmap.h>
> +#include <linux/gpio/consumer.h>
> +
> +/* eth_phy_ctrl_offset eth0:0x100; eth1:0x200 */
> +#define ETH_TX_CLK_SEL			BIT(16)
> +#define ETH_PHY_INTF_SELI		BIT(0)
> +
> +/* eth_axi_lp_ctrl_offset eth0:0x108; eth1:0x208 */
> +#define ETH_CSYSREQ_VAL			BIT(0)
> +
> +/* hsp_aclk_ctrl_offset (0x148) */
> +#define HSP_ACLK_CLKEN				BIT(31)
> +#define HSP_ACLK_DIVSOR				(0x2 << 4)
> +
> +/* hsp_cfg_ctrl_offset (0x14c) */
> +#define HSP_CFG_CLKEN			BIT(31)
> +#define SCU_HSP_PCLK_EN			BIT(30)
> +#define HSP_CFG_CTRL_REGSET		(HSP_CFG_CLKEN | SCU_HSP_PCLK_EN)
> +
> +/* RTL8211F PHY Configurations for LEDs */
> +#define PHY_ADDR				0
> +#define PHY_PAGE_SWITCH_REG		31
> +#define PHY_LED_CFG_REG			16
> +#define PHY_LED_PAGE_CFG		0xd04
> +
> +struct dwc_qos_priv {
> +	struct device *dev;
> +	int dev_id;
> +	struct regmap *crg_regmap;
> +	struct regmap *hsp_regmap;
> +	struct reset_control *rst;
> +	struct clk *clk_app;
> +	struct clk *clk_tx;
> +	struct gpio_desc *phy_reset;
> +	struct stmmac_priv *stmpriv;
> +	int phyled_cfgs[3];
> +	int phyaddr;
> +	unsigned int dly_hsp_reg[3];
> +	unsigned int dly_param_1000m[3];
> +	unsigned int dly_param_100m[3];
> +	unsigned int dly_param_10m[3];
> +};
> +
> +static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
> +				   struct plat_stmmacenet_data *plat_dat)
> +{
> +	struct device *dev = &pdev->dev;
> +	u32 burst_map = 0;
> +	u32 bit_index = 0;
> +	u32 a_index = 0;
> +
> +	if (!plat_dat->axi) {
> +		plat_dat->axi = kzalloc(sizeof(*plat_dat->axi), GFP_KERNEL);
> +
> +		if (!plat_dat->axi)
> +			return -ENOMEM;
> +	}
> +
> +	plat_dat->axi->axi_lpi_en = device_property_read_bool(dev,
> +							      "snps,en-lpi");
> +	if (device_property_read_u32(dev, "snps,write-requests",
> +				     &plat_dat->axi->axi_wr_osr_lmt)) {
> +		/**
> +		 * Since the register has a reset value of 1, if property
> +		 * is missing, default to 1.
> +		 */
> +		plat_dat->axi->axi_wr_osr_lmt = 1;
> +	} else {
> +		/**
> +		 * If property exists, to keep the behavior from dwc_eth_qos,
> +		 * subtract one after parsing.
> +		 */
> +		plat_dat->axi->axi_wr_osr_lmt--;
> +	}
> +
> +	if (device_property_read_u32(dev, "snps,read-requests",
> +				     &plat_dat->axi->axi_rd_osr_lmt)) {
> +		/**
> +		 * Since the register has a reset value of 1, if property
> +		 * is missing, default to 1.
> +		 */
> +		plat_dat->axi->axi_rd_osr_lmt = 1;
> +	} else {
> +		/**
> +		 * If property exists, to keep the behavior from dwc_eth_qos,
> +		 * subtract one after parsing.
> +		 */
> +		plat_dat->axi->axi_rd_osr_lmt--;
> +	}
> +	device_property_read_u32(dev, "snps,burst-map", &burst_map);
> +
> +	/* converts burst-map bitmask to burst array */
> +	for (bit_index = 0; bit_index < 7; bit_index++) {
> +		if (burst_map & (1 << bit_index)) {
> +			switch (bit_index) {
> +			case 0:
> +			plat_dat->axi->axi_blen[a_index] = 4; break;
> +			case 1:
> +			plat_dat->axi->axi_blen[a_index] = 8; break;
> +			case 2:
> +			plat_dat->axi->axi_blen[a_index] = 16; break;
> +			case 3:
> +			plat_dat->axi->axi_blen[a_index] = 32; break;
> +			case 4:
> +			plat_dat->axi->axi_blen[a_index] = 64; break;
> +			case 5:
> +			plat_dat->axi->axi_blen[a_index] = 128; break;
> +			case 6:
> +			plat_dat->axi->axi_blen[a_index] = 256; break;
> +			default:
> +			break;
> +			}
> +			a_index++;
> +		}
> +	}
> +
> +	/* dwc-qos needs GMAC4, AAL, TSO and PMT */
> +	plat_dat->has_gmac4 = 1;
> +	plat_dat->dma_cfg->aal = 1;
> +	plat_dat->flags |= STMMAC_FLAG_TSO_EN;
> +	plat_dat->pmt = 1;
> +
> +	return 0;
> +}
> +

> +static void dwc_qos_fix_speed(void *priv, int speed, unsigned int mode)
> +{
> +	unsigned long rate = 125000000;
> +	int i, err, data = 0;
> +	struct dwc_qos_priv *dwc_priv = (struct dwc_qos_priv *)priv;
> +
> +	switch (speed) {
> +	case SPEED_1000:
> +		rate = 125000000;
> +
> +		for (i = 0; i < 3; i++)
> +			regmap_write(dwc_priv->hsp_regmap,
> +				     dwc_priv->dly_hsp_reg[i],
> +				     dwc_priv->dly_param_1000m[i]);
> +
> +		if (dwc_priv->stmpriv) {
> +			data = mdiobus_read(dwc_priv->stmpriv->mii, PHY_ADDR,
> +					    PHY_PAGE_SWITCH_REG);
> +			mdiobus_write(dwc_priv->stmpriv->mii, PHY_ADDR,
> +				      PHY_PAGE_SWITCH_REG, PHY_LED_PAGE_CFG);
> +			mdiobus_write(dwc_priv->stmpriv->mii, PHY_ADDR,
> +				      PHY_LED_CFG_REG, dwc_priv->phyled_cfgs[0]);
> +			mdiobus_write(dwc_priv->stmpriv->mii, PHY_ADDR,
> +				      PHY_PAGE_SWITCH_REG, data);
> +		}
> +
> +		break;
> +	case SPEED_100:
> +		rate = 25000000;
> +
> +		for (i = 0; i < 3; i++) {
> +			regmap_write(dwc_priv->hsp_regmap,
> +				     dwc_priv->dly_hsp_reg[i],
> +				     dwc_priv->dly_param_100m[i]);
> +		}
> +
> +		if (dwc_priv->stmpriv) {
> +			data = mdiobus_read(dwc_priv->stmpriv->mii, PHY_ADDR,
> +					    PHY_PAGE_SWITCH_REG);
> +			mdiobus_write(dwc_priv->stmpriv->mii, PHY_ADDR,
> +				      PHY_PAGE_SWITCH_REG, PHY_LED_PAGE_CFG);
> +			mdiobus_write(dwc_priv->stmpriv->mii, PHY_ADDR,
> +				      PHY_LED_CFG_REG, dwc_priv->phyled_cfgs[1]);
> +			mdiobus_write(dwc_priv->stmpriv->mii, PHY_ADDR,
> +				      PHY_PAGE_SWITCH_REG, data);
> +		}
> +
> +		break;
> +	case SPEED_10:
> +		rate = 2500000;
> +
> +		for (i = 0; i < 3; i++) {
> +			regmap_write(dwc_priv->hsp_regmap,
> +				     dwc_priv->dly_hsp_reg[i],
> +				     dwc_priv->dly_param_10m[i]);
> +		}
> +
> +		if (dwc_priv->stmpriv) {
> +			data = mdiobus_read(dwc_priv->stmpriv->mii, PHY_ADDR,
> +					    PHY_PAGE_SWITCH_REG);
> +			mdiobus_write(dwc_priv->stmpriv->mii, PHY_ADDR,
> +				      PHY_PAGE_SWITCH_REG, PHY_LED_PAGE_CFG);
> +			mdiobus_write(dwc_priv->stmpriv->mii, PHY_ADDR,
> +				      PHY_LED_CFG_REG, dwc_priv->phyled_cfgs[2]);
> +			mdiobus_write(dwc_priv->stmpriv->mii, PHY_ADDR,
> +				      PHY_PAGE_SWITCH_REG, data);
> +		}
> +
> +		break;
> +	default:
> +		dev_err(dwc_priv->dev, "invalid speed %u\n", speed);
> +		break;
> +	}
> +
> +	err = clk_set_rate(dwc_priv->clk_tx, rate);
> +	if (err < 0)
> +		dev_err(dwc_priv->dev, "failed to set TX rate: %d\n", err);
> +}

check set_clk_tx_rate, and replace this with stmmac_set_clk_tx_rate
if possible.

> +
> +static int dwc_qos_probe(struct platform_device *pdev,
> +			 struct plat_stmmacenet_data *plat_dat,
> +			 struct stmmac_resources *stmmac_res)
> +{
> +	struct dwc_qos_priv *dwc_priv;
> +	int ret;
> +	int err;
> +	u32 hsp_aclk_ctrl_offset;
> +	u32 hsp_aclk_ctrl_regset;
> +	u32 hsp_cfg_ctrl_offset;
> +	u32 eth_axi_lp_ctrl_offset;
> +	u32 eth_phy_ctrl_offset;
> +	u32 eth_phy_ctrl_regset;
> +
> +	dwc_priv = devm_kzalloc(&pdev->dev, sizeof(*dwc_priv), GFP_KERNEL);
> +	if (!dwc_priv)
> +		return -ENOMEM;
> +
> +	if (device_property_read_u32(&pdev->dev, "id", &dwc_priv->dev_id)) {
> +		dev_err(&pdev->dev, "Can not read device id!\n");
> +		return -EINVAL;
> +	}
> +
> +	dwc_priv->dev = &pdev->dev;
> +	dwc_priv->phy_reset = devm_gpiod_get(&pdev->dev, "rst", GPIOD_OUT_LOW);
> +	if (IS_ERR(dwc_priv->phy_reset)) {
> +		dev_err(&pdev->dev, "Reset gpio not specified\n");
> +		return -EINVAL;
> +	}
> +
> +	gpiod_set_value(dwc_priv->phy_reset, 0);
> +
> +	ret = of_property_read_u32_index(pdev->dev.of_node, "eswin,led-cfgs", 0,
> +					 &dwc_priv->phyled_cfgs[0]);
> +	if (ret)
> +		dev_warn(&pdev->dev, "can't get phyaddr (%d)\n", ret);
> +	ret = of_property_read_u32_index(pdev->dev.of_node, "eswin,led-cfgs", 0,
> +					 &dwc_priv->phyled_cfgs[0]);
> +	if (ret)
> +		dev_warn(&pdev->dev, "can't get led cfgs for 1Gbps mode (%d)\n", ret);
> +
> +	ret = of_property_read_u32_index(pdev->dev.of_node, "eswin,led-cfgs", 1,
> +					 &dwc_priv->phyled_cfgs[1]);
> +	if (ret)
> +		dev_warn(&pdev->dev, "can't get led cfgs for 100Mbps mode (%d)\n", ret);
> +
> +	ret = of_property_read_u32_index(pdev->dev.of_node, "eswin,led-cfgs", 2,
> +					 &dwc_priv->phyled_cfgs[2]);
> +	if (ret)
> +		dev_warn(&pdev->dev, "can't get led cfgs for 10Mbps mode (%d)\n", ret);
> +
> +	ret = of_property_read_variable_u32_array(pdev->dev.of_node, "eswin,dly_hsp_reg",
> +						  &dwc_priv->dly_hsp_reg[0], 3, 0);
> +	if (ret != 3) {
> +		dev_err(&pdev->dev, "can't get delay hsp reg.ret(%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = of_property_read_variable_u32_array(pdev->dev.of_node, "dly-param-1000m",
> +						  &dwc_priv->dly_param_1000m[0], 3, 0);
> +	if (ret != 3) {
> +		dev_err(&pdev->dev, "can't get delay param for 1Gbps mode (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = of_property_read_variable_u32_array(pdev->dev.of_node, "dly-param-100m",
> +						  &dwc_priv->dly_param_100m[0], 3, 0);
> +	if (ret != 3) {
> +		dev_err(&pdev->dev, "can't get delay param for 100Mbps mode (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = of_property_read_variable_u32_array(pdev->dev.of_node, "dly-param-10m",
> +						  &dwc_priv->dly_param_10m[0], 3, 0);
> +	if (ret != 3) {
> +		dev_err(&pdev->dev, "can't get delay param for 10Mbps mode (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	dwc_priv->crg_regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> +							       "eswin,syscrg_csr");
> +	if (IS_ERR(dwc_priv->crg_regmap)) {
> +		dev_dbg(&pdev->dev, "No syscrg_csr phandle specified\n");
> +		return 0;
> +	}
> +
> +	ret = of_property_read_u32_index(pdev->dev.of_node, "eswin,syscrg_csr", 1,
> +					 &hsp_aclk_ctrl_offset);
> +	if (ret) {
> +		dev_err(&pdev->dev, "can't get hsp_aclk_ctrl_offset (%d)\n", ret);
> +		return ret;
> +	}
> +	regmap_read(dwc_priv->crg_regmap, hsp_aclk_ctrl_offset, &hsp_aclk_ctrl_regset);
> +	hsp_aclk_ctrl_regset |= (HSP_ACLK_CLKEN | HSP_ACLK_DIVSOR);
> +	regmap_write(dwc_priv->crg_regmap, hsp_aclk_ctrl_offset, hsp_aclk_ctrl_regset);
> +
> +	ret = of_property_read_u32_index(pdev->dev.of_node, "eswin,syscrg_csr", 2,
> +					 &hsp_cfg_ctrl_offset);
> +	if (ret) {
> +		dev_err(&pdev->dev, "can't get hsp_cfg_ctrl_offset (%d)\n", ret);
> +		return ret;
> +	}
> +	regmap_write(dwc_priv->crg_regmap, hsp_cfg_ctrl_offset, HSP_CFG_CTRL_REGSET);
> +
> +	dwc_priv->hsp_regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> +							       "eswin,hsp_sp_csr");
> +	if (IS_ERR(dwc_priv->hsp_regmap)) {
> +		dev_dbg(&pdev->dev, "No hsp_sp_csr phandle specified\n");
> +		return 0;
> +	}
> +
> +	ret = of_property_read_u32_index(pdev->dev.of_node, "eswin,hsp_sp_csr", 2,
> +					 &eth_phy_ctrl_offset);
> +	if (ret) {
> +		dev_err(&pdev->dev, "can't get eth_phy_ctrl_offset (%d)\n", ret);
> +		return ret;
> +	}
> +	regmap_read(dwc_priv->hsp_regmap, eth_phy_ctrl_offset, &eth_phy_ctrl_regset);
> +	eth_phy_ctrl_regset |= (ETH_TX_CLK_SEL | ETH_PHY_INTF_SELI);
> +	regmap_write(dwc_priv->hsp_regmap, eth_phy_ctrl_offset, eth_phy_ctrl_regset);
> +
> +	ret = of_property_read_u32_index(pdev->dev.of_node, "eswin,hsp_sp_csr", 3,
> +					 &eth_axi_lp_ctrl_offset);
> +	if (ret) {
> +		dev_err(&pdev->dev, "can't get eth_axi_lp_ctrl_offset (%d)\n", ret);
> +		return ret;
> +	}
> +	regmap_write(dwc_priv->hsp_regmap, eth_axi_lp_ctrl_offset, ETH_CSYSREQ_VAL);
> +
> +	dwc_priv->clk_app = devm_clk_get(&pdev->dev, "app");
> +	if (IS_ERR(dwc_priv->clk_app)) {
> +		dev_err(&pdev->dev, "app clock not found.\n");
> +		return PTR_ERR(dwc_priv->clk_app);
> +	}
> +
> +	err = clk_prepare_enable(dwc_priv->clk_app);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to enable app clock: %d\n",
> +			err);
> +		return err;
> +	}
> +
> +	dwc_priv->clk_tx = devm_clk_get(&pdev->dev, "tx");
> +	if (IS_ERR(plat_dat->pclk)) {
> +		dev_err(&pdev->dev, "tx clock not found.\n");
> +		return PTR_ERR(dwc_priv->clk_tx);
> +	}
> +
> +	err = clk_prepare_enable(dwc_priv->clk_tx);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to enable tx clock: %d\n", err);
> +		return err;
> +	}
> +	dwc_priv->rst = devm_reset_control_get_optional_exclusive(&pdev->dev, "ethrst");
> +	if (IS_ERR(dwc_priv->rst))
> +		return PTR_ERR(dwc_priv->rst);
> +
> +	ret = reset_control_assert(dwc_priv->rst);
> +	WARN_ON(ret != 0);
> +	ret = reset_control_deassert(dwc_priv->rst);
> +	WARN_ON(ret != 0);
> +
> +	plat_dat->fix_mac_speed = dwc_qos_fix_speed;
> +	plat_dat->bsp_priv = dwc_priv;
> +	plat_dat->phy_addr = PHY_ADDR;
> +
> +	return 0;
> +}
> +
> +static int dwc_qos_remove(struct platform_device *pdev)
> +{
> +	struct dwc_qos_priv *dwc_priv = get_stmmac_bsp_priv(&pdev->dev);
> +
> +	reset_control_assert(dwc_priv->rst);
> +	clk_disable_unprepare(dwc_priv->clk_tx);
> +	clk_disable_unprepare(dwc_priv->clk_app);
> +
> +	devm_gpiod_put(&pdev->dev, dwc_priv->phy_reset);
> +
> +	return 0;
> +}
> +
> +struct dwc_eth_dwmac_data {
> +	int (*probe)(struct platform_device *pdev,
> +		     struct plat_stmmacenet_data *data,
> +		     struct stmmac_resources *res);
> +	int (*remove)(struct platform_device *pdev);
> +};
> +
> +static const struct dwc_eth_dwmac_data dwc_qos_data = {
> +	.probe = dwc_qos_probe,
> +	.remove = dwc_qos_remove,
> +};
> +
> +static int dwc_eth_dwmac_probe(struct platform_device *pdev)
> +{
> +	const struct dwc_eth_dwmac_data *data;
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct stmmac_resources stmmac_res;
> +	struct net_device *ndev = NULL;
> +	struct stmmac_priv *stmpriv = NULL;
> +	struct dwc_qos_priv *dwc_priv = NULL;
> +	int ret;
> +
> +	data = device_get_match_data(&pdev->dev);
> +
> +	memset(&stmmac_res, 0, sizeof(struct stmmac_resources));
> +
> +	/**
> +	 * Since stmmac_platform supports name IRQ only, basic platform
> +	 * resource initialization is done in the glue logic.
> +	 */
> +	stmmac_res.irq = platform_get_irq(pdev, 0);
> +	if (stmmac_res.irq < 0)
> +		return stmmac_res.irq;
> +	stmmac_res.wol_irq = stmmac_res.irq;
> +	stmmac_res.addr = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(stmmac_res.addr))
> +		return PTR_ERR(stmmac_res.addr);
> +
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	if (IS_ERR(plat_dat))
> +		return PTR_ERR(plat_dat);
> +
> +	ret = data->probe(pdev, plat_dat, &stmmac_res);
> +	if (ret < 0) {
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "failed to probe subdriver: %d\n",
> +				ret);
> +
> +		return ret;
> +	}
> +
> +	ret = dwc_eth_dwmac_config_dt(pdev, plat_dat);
> +	if (ret)
> +		goto remove;
> +
> +	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> +	if (ret)
> +		goto remove;
> +
> +	ndev = dev_get_drvdata(&pdev->dev);
> +	stmpriv = netdev_priv(ndev);
> +	dwc_priv = (struct dwc_qos_priv *)plat_dat->bsp_priv;
> +	dwc_priv->stmpriv = stmpriv;
> +
> +	return ret;
> +
> +remove:
> +	data->remove(pdev);
> +
> +	return ret;
> +}
> +
> +static void dwc_eth_dwmac_remove(struct platform_device *pdev)
> +{
> +	const struct dwc_eth_dwmac_data *data;
> +	int err;
> +
> +	data = device_get_match_data(&pdev->dev);
> +
> +	stmmac_dvr_remove(&pdev->dev);
> +
> +	err = data->remove(pdev);
> +	if (err < 0)
> +		dev_err(&pdev->dev, "failed to remove subdriver: %d\n", err);
> +}
> +
> +static const struct of_device_id dwc_eth_dwmac_match[] = {
> +	{ .compatible = "eswin,eic7700-qos-eth", .data = &dwc_qos_data },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, dwc_eth_dwmac_match);
> +

Use common stammac helper for you code, do not do this by yourself!!!
The only thing you should add is the vendor specific logic, not the
common one for the stmmac driver.

> +static struct platform_driver eic7700_eth_dwmac_driver = {
> +	.probe  = dwc_eth_dwmac_probe,
> +	.remove = dwc_eth_dwmac_remove,
> +	.driver = {
> +		.name           = "eic7700-eth-dwmac",
> +		.pm             = &stmmac_pltfr_pm_ops,
> +		.of_match_table = dwc_eth_dwmac_match,
> +	},
> +};
> +module_platform_driver(eic7700_eth_dwmac_driver);
> +
> +MODULE_AUTHOR("Eswin");
> +MODULE_AUTHOR("Shuang Liang <liangshuang@eswincomputing.com>");
> +MODULE_AUTHOR("Shangjuan Wei <weishangjuan@eswincomputing.com>");
> +MODULE_DESCRIPTION("Eswin eic7700 qos ethernet driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.17.1
> 

