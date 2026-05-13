Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87FBCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 23:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvzC6SPYvZSyjdlthzbzYP5hoAsuR79HHiU+cDLDiTQ=; b=RqvNf2791ivk+C7vb5YleK+TB+
	GUvS4KLoyhjjGrIkjU4cv6mYRpzmp2XEmtdQR6M8K7ZZ538pxtpxh1HF5Q0Zx8YTCH1V+5G0QBBEl
	NWfRevs6gbTlPhUp+oV1ASnykk+Gqna+g7GxWyl/Hn8z7Lw6Rz//yqDWx040kkEkpyC7C/ZjJcjcI
	LRdMbVeXoll50lz2IDe8q//6+Rp4FoeQYO7E4i5J88+zgxqmwHW1axIKw2bwREK5EoCnzWytznM2f
	i2d6g80XG2vAx5POsSYb2sf5JSE36NUiDTU/6j8ILZOM2Aiaj6k/Ajkb0T07gtS62s++eMfTIo4xh
	16m/+OZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIv7-000000041RL-0Yxf;
	Wed, 13 May 2026 23:23:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIv4-000000041Qq-26Xy;
	Wed, 13 May 2026 23:23:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14B3132D1;
	Wed, 13 May 2026 16:23:06 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 345083F85F;
	Wed, 13 May 2026 16:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778714591; bh=UqKXtkxhUYUmfTGbxi8Ej81/IDEynkmKhfdkw0638Vw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fSvsGtuvB/105JKD4o3LcVotY4DW3QbA/HGA3OSKyNCw8KiZLDRFrH6AapSLcK9X3
	 5rHVRN64SOkwH6d95nd5ZB+CVH6eVnGEFoevpsgJnAWLaznwLhRJhkZtv94fiw7LAz
	 dJjNjs448lM6fKyzNmYgRnX9e5QGrXgYg8PlHjzg=
Date: Thu, 14 May 2026 01:22:26 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran
 <richardcochran@gmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH RFC 8/8] clk: sunxi-ng: a733: Add reset lines
Message-ID: <20260514012226.691ae185@ryzen.lan>
In-Reply-To: <20260310-a733-clk-v1-8-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech>
	<20260310-a733-clk-v1-8-36b4e9b24457@pigmoral.tech>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_162314_758664_5F80E00F 
X-CRM114-Status: GOOD (  21.90  )
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

On Tue, 10 Mar 2026 16:34:01 +0800
Junhui Liu <junhui.liu@pigmoral.tech> wrote:

Hi,

compare the list below against my version of the manual. You list more
than shown there, can you say where those extra reset bits come from?

> Add the reset lines for the Allwinner A733 SoC. These reset control bits
> are integrated into the Bus Gate Reset (BGR) registers, typically
> sharing the same register address with their corresponding bus clock
> gates. Integrate them into the main CCU driver using the existing
> sunxi-ng ccu_reset framework, allowing the CCU to also function as a
> reset controller for the SoC.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/clk/sunxi-ng/ccu-sun60i-a733.c | 128 +++++++++++++++++++++++++++++++++
>  1 file changed, 128 insertions(+)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> index c0b09f9197d1..7d1ee9235436 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> @@ -17,6 +17,7 @@
>  #include "../clk.h"
>  
>  #include "ccu_common.h"
> +#include "ccu_reset.h"
>  
>  #include "ccu_div.h"
>  #include "ccu_gate.h"
> @@ -2169,11 +2170,138 @@ static struct clk_hw_onecell_data sun60i_a733_hw_clks = {
>  	.num	= CLK_FANOUT3 + 1,
>  };
>  
> +static struct ccu_reset_map sun60i_a733_ccu_resets[] = {
> +	[RST_BUS_ITS_PCIE]		= { 0x574, BIT(16) },
> +	[RST_BUS_NSI]			= { 0x580, BIT(30) },

What is this NSI device? Some interconnect? Do we really want to handle
this reset and clock? Is there some device referencing this? Otherwise
the kernel will turn at least the clock off, which is probably fatal.
Also the manual says this is a secure register, so I feel like the
kernel must not mess with this.

> +	[RST_BUS_NSI_CFG]		= { 0x584, BIT(16) },

Similar here, I guess, though this might not be secure only.

> +	[RST_BUS_IOMMU0_SYS]		= { 0x58c, BIT(16) },
> +	[RST_BUS_MSI_LITE0_AHB]		= { 0x594, BIT(16) },
> +	[RST_BUS_MSI_LITE0_MBUS]	= { 0x594, BIT(17) },
> +	[RST_BUS_MSI_LITE1_AHB]		= { 0x59c, BIT(16) },
> +	[RST_BUS_MSI_LITE1_MBUS]	= { 0x59c, BIT(17) },
> +	[RST_BUS_MSI_LITE2_AHB]		= { 0x5a4, BIT(16) },
> +	[RST_BUS_MSI_LITE2_MBUS]	= { 0x5a4, BIT(17) },
> +	[RST_BUS_IOMMU1_SYS]		= { 0x5b4, BIT(16) },
> +	[RST_BUS_DMA0]			= { 0x704, BIT(16) },
> +	[RST_BUS_DMA1]			= { 0x70c, BIT(16) },
> +	[RST_BUS_SPINLOCK]		= { 0x724, BIT(16) },
> +	[RST_BUS_MSGBOX]		= { 0x744, BIT(16) },
> +	[RST_BUS_PWM0]			= { 0x784, BIT(16) },
> +	[RST_BUS_PWM1]			= { 0x78c, BIT(16) },
> +	[RST_BUS_DBG]			= { 0x7a4, BIT(16) },
> +	[RST_BUS_SYSDAP]		= { 0x7ac, BIT(16) },
> +	[RST_BUS_TIMER0]		= { 0x850, BIT(16) },
> +	[RST_BUS_DE]			= { 0xa04, BIT(16) },
> +	[RST_BUS_DI]			= { 0xa24, BIT(16) },
> +	[RST_BUS_G2D]			= { 0xa44, BIT(16) },
> +	[RST_BUS_EINK]			= { 0xa6c, BIT(16) },
> +	[RST_BUS_DE_SYS]		= { 0xa74, BIT(16) },
> +	[RST_BUS_VE_ENC]		= { 0xa8c, BIT(16) },

The manual calls this ENC0, and since bit 17 is not documented, I
wonder if there is an ENC1 used with some other packaging, maybe? So
maybe calling it ENC0 would be safer here.

> +	[RST_BUS_VE_DEC]		= { 0xa8c, BIT(18) },
> +	[RST_BUS_CE]			= { 0xac4, BIT(16) },
> +	[RST_BUS_CE_SYS]		= { 0xac4, BIT(17) },
> +	[RST_BUS_NPU_CORE]		= { 0xb04, BIT(16) },
> +	[RST_BUS_NPU_AXI]		= { 0xb04, BIT(17) },
> +	[RST_BUS_NPU_AHB]		= { 0xb04, BIT(18) },
> +	[RST_BUS_NPU_SRAM]		= { 0xb04, BIT(19) },
> +	[RST_BUS_GPU]			= { 0xb24, BIT(16) },
> +	[RST_BUS_DRAM]			= { 0xc0c, BIT(16) },
> +	[RST_BUS_NAND]			= { 0xc8c, BIT(16) },
> +	[RST_BUS_MMC0]			= { 0xd0c, BIT(16) },
> +	[RST_BUS_MMC1]			= { 0xd1c, BIT(16) },
> +	[RST_BUS_MMC2]			= { 0xd2c, BIT(16) },
> +	[RST_BUS_MMC3]			= { 0xd3c, BIT(16) },
> +	[RST_BUS_UFS_AHB]		= { 0xd8c, BIT(16) },
> +	[RST_BUS_UFS_AXI]		= { 0xd8c, BIT(17) },
> +	[RST_BUS_UFS_PHY]		= { 0xd8c, BIT(18) },
> +	[RST_BUS_UFS_CORE]		= { 0xd8c, BIT(19) },
> +	[RST_BUS_UART0]			= { 0xe00, BIT(16) },
> +	[RST_BUS_UART1]			= { 0xe04, BIT(16) },
> +	[RST_BUS_UART2]			= { 0xe08, BIT(16) },
> +	[RST_BUS_UART3]			= { 0xe0c, BIT(16) },
> +	[RST_BUS_UART4]			= { 0xe10, BIT(16) },
> +	[RST_BUS_UART5]			= { 0xe14, BIT(16) },
> +	[RST_BUS_UART6]			= { 0xe18, BIT(16) },
> +	[RST_BUS_I2C0]			= { 0xe80, BIT(16) },
> +	[RST_BUS_I2C1]			= { 0xe84, BIT(16) },
> +	[RST_BUS_I2C2]			= { 0xe88, BIT(16) },
> +	[RST_BUS_I2C3]			= { 0xe8c, BIT(16) },
> +	[RST_BUS_I2C4]			= { 0xe90, BIT(16) },
> +	[RST_BUS_I2C5]			= { 0xe94, BIT(16) },
> +	[RST_BUS_I2C6]			= { 0xe98, BIT(16) },
> +	[RST_BUS_I2C7]			= { 0xe9c, BIT(16) },
> +	[RST_BUS_I2C8]			= { 0xea0, BIT(16) },
> +	[RST_BUS_I2C9]			= { 0xea4, BIT(16) },
> +	[RST_BUS_I2C10]			= { 0xea8, BIT(16) },
> +	[RST_BUS_I2C11]			= { 0xeac, BIT(16) },
> +	[RST_BUS_I2C12]			= { 0xeb0, BIT(16) },
> +	[RST_BUS_SPI0]			= { 0xf04, BIT(16) },
> +	[RST_BUS_SPI1]			= { 0xf0c, BIT(16) },
> +	[RST_BUS_SPI2]			= { 0xf14, BIT(16) },
> +	[RST_BUS_SPIF]			= { 0xf1c, BIT(16) },
> +	[RST_BUS_SPI3]			= { 0xf24, BIT(16) },
> +	[RST_BUS_SPI4]			= { 0xf2c, BIT(16) },

SPI4 isn't mentioned in my version of the manual.

> +	[RST_BUS_GPADC]			= { 0xfc4, BIT(16) },
> +	[RST_BUS_THS]			= { 0xfe4, BIT(16) },
> +	[RST_BUS_IRRX]			= { 0x1004, BIT(16) },
> +	[RST_BUS_IRTX]			= { 0x100c, BIT(16) },
> +	[RST_BUS_LRADC]			= { 0x1024, BIT(16) },
> +	[RST_BUS_SGPIO]			= { 0x1064, BIT(16) },
> +	[RST_BUS_LPC]			= { 0x1084, BIT(16) },

Where do those two come from? There are not in my version of the manual.

> +	[RST_BUS_I2SPCM0]		= { 0x120c, BIT(16) },
> +	[RST_BUS_I2SPCM1]		= { 0x121c, BIT(16) },
> +	[RST_BUS_I2SPCM2]		= { 0x122c, BIT(16) },
> +	[RST_BUS_I2SPCM3]		= { 0x123c, BIT(16) },
> +	[RST_BUS_I2SPCM4]		= { 0x124c, BIT(16) },
> +	[RST_BUS_OWA]			= { 0x128c, BIT(16) },
> +	[RST_BUS_DMIC]			= { 0x12cc, BIT(16) },
> +	[RST_USB_PHY0]			= { 0x1300, BIT(30) },
> +	[RST_BUS_OHCI0]			= { 0x1304, BIT(16) },
> +	[RST_BUS_EHCI0]			= { 0x1304, BIT(20) },
> +	[RST_BUS_OTG]			= { 0x1304, BIT(24) },
> +	[RST_USB_PHY1]			= { 0x1308, BIT(30) },
> +	[RST_BUS_OHCI1]			= { 0x130c, BIT(16) },
> +	[RST_BUS_EHCI1]			= { 0x130c, BIT(20) },
> +	[RST_BUS_USB2]			= { 0x135c, BIT(16) },
> +	[RST_BUS_PCIE]			= { 0x138c, BIT(17) },
> +	[RST_BUS_PCIE_PWRUP]		= { 0x138c, BIT(16) },

Just a nit, but those two are ordered wrongly.

> +	[RST_BUS_SERDES]		= { 0x13c4, BIT(16) },
> +	[RST_BUS_GMAC0]			= { 0x141c, BIT(16) },
> +	[RST_BUS_GMAC0_AXI]		= { 0x141c, BIT(17) },
> +	[RST_BUS_GMAC1]			= { 0x142c, BIT(16) },
> +	[RST_BUS_GMAC1_AXI]		= { 0x142c, BIT(17) },

GMAC1 is not listed in my manual, where does this come from?

> +	[RST_BUS_TCON_LCD0]		= { 0x1504, BIT(16) },
> +	[RST_BUS_TCON_LCD1]		= { 0x150c, BIT(16) },
> +	[RST_BUS_TCON_LCD2]		= { 0x1514, BIT(16) },

No LCD2 in my manual.

The rest looks alright.

Cheers,
Andre

> +	[RST_BUS_LVDS0]			= { 0x1544, BIT(16) },
> +	[RST_BUS_LVDS1]			= { 0x154c, BIT(16) },
> +	[RST_BUS_DSI0]			= { 0x1584, BIT(16) },
> +	[RST_BUS_DSI1]			= { 0x158c, BIT(16) },
> +	[RST_BUS_TCON_TV0]		= { 0x1604, BIT(16) },
> +	[RST_BUS_TCON_TV1]		= { 0x160c, BIT(16) },
> +	[RST_BUS_EDP]			= { 0x164c, BIT(16) },
> +	[RST_BUS_HDMI_MAIN]		= { 0x168c, BIT(16) },
> +	[RST_BUS_HDMI_SUB]		= { 0x168c, BIT(17) },
> +	[RST_BUS_HDMI_HDCP]		= { 0x168c, BIT(18) },
> +	[RST_BUS_DPSS_TOP0]		= { 0x16c4, BIT(16) },
> +	[RST_BUS_DPSS_TOP1]		= { 0x16cc, BIT(16) },
> +	[RST_BUS_VIDEO_OUT0]		= { 0x16e4, BIT(16) },
> +	[RST_BUS_VIDEO_OUT1]		= { 0x16ec, BIT(16) },
> +	[RST_BUS_LEDC]			= { 0x1704, BIT(16) },
> +	[RST_BUS_DSC]			= { 0x1744, BIT(16) },
> +	[RST_BUS_CSI]			= { 0x1844, BIT(16) },
> +	[RST_BUS_VIDEO_IN]		= { 0x1884, BIT(16) },
> +	[RST_BUS_APB2JTAG]		= { 0x1c04, BIT(16) },
> +};
> +
>  static const struct sunxi_ccu_desc sun60i_a733_ccu_desc = {
>  	.ccu_clks	= sun60i_a733_ccu_clks,
>  	.num_ccu_clks	= ARRAY_SIZE(sun60i_a733_ccu_clks),
>  
>  	.hw_clks	= &sun60i_a733_hw_clks,
> +
> +	.resets		= sun60i_a733_ccu_resets,
> +	.num_resets	= ARRAY_SIZE(sun60i_a733_ccu_resets),
>  };
>  
>  static const u32 pll_regs[] = {
> 


