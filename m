Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2374FD0651
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 14:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ScPnG58aqq2rKj5V4Ln0f95KwKGhklc24sWRuV/GqW8=; b=zaD8QKAlEaml/7EcvDUfuNrSyP
	Bo4T7Ms8Td88oeOndeNgadvk6KgfH287hPh8XmY4WrpkM9g8G6QFUkL6dLIJ//Vepfa9c6mWsS14/
	8BW1i2au0fyGwNcFG91yTp6eDUO9p9+HVm7BYFHu4iuZhLDbQxF4VwaSog83V4kCVfU1jSyRrg2wB
	+FnG0Mu6fDtjEvWkfFz/hkVven790fFhSC3d9QYBtiRIVwcMlFAvxNdlx3+DfuSRV/afCo8dQ4gvd
	M5FqHCIHLnZJli58DfAFUxdhJeia7nmY83OTZCsWWKipJrTvAepO3CJUUunpyQaQd4zbMz5FUpC60
	KgmG5VZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Kiv-0000000BioK-2IeT;
	Wed, 11 Mar 2026 14:39:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Kit-0000000BinB-3FNI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 14:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773239982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ScPnG58aqq2rKj5V4Ln0f95KwKGhklc24sWRuV/GqW8=;
	b=GqJPhwRcQpChOsOvuUwDyRXcz2emDAZ7vVyaF7PfawtCUp8gaZXUqy/y+2aeasXFFc6hq0
	9NMRhpy7g25JO1NpDniMgT+O6JFLfNQM8zre1n6zWwf2syjzb+ENADACW3jVtuszZMX/Ti
	G5sBPfjw/oXCTzTysA7mRi41kVgU95I=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-ikEvpiOHMFaS5r2znch9PQ-1; Wed, 11 Mar 2026 10:39:41 -0400
X-MC-Unique: ikEvpiOHMFaS5r2znch9PQ-1
X-Mimecast-MFC-AGG-ID: ikEvpiOHMFaS5r2znch9PQ_1773239981
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7de0e161so2338903685a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 07:39:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773239981; x=1773844781;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ScPnG58aqq2rKj5V4Ln0f95KwKGhklc24sWRuV/GqW8=;
        b=cyLkkUuYAMTELWmwkzTgi3YLhJFY/Ml+o/+HzlSyBJ3zdt9hA9P5D/6CfCHzdzLec9
         L/MHDMFzeo77RUfnGFNxYyf0+Um90Xj7tQoHAc59vW5Od71HkCHqOf3nbz1q52gJEb2j
         Fl9rIOJxwrhF7iYmP18mJu4d+R2gwwU8l31nrnjLmatY3glDaNn82CfdMkdI3G/nD9VI
         Ue1NtHyPu/NJlE6IwKVRCAuo4sjucf2Hr87IU42LTWyKm3x83zlq6/KW3FiV2dZPu03N
         iSiynXWvFIF6XQzFNWVJzqiOgghQ8BIQhKmWhECql3cp1g4L7GiPhLXI6WoYarBouyim
         Hq/A==
X-Forwarded-Encrypted: i=1; AJvYcCUOB9ltxPlMpcyZrVW3v2sSijqJpJIX93Pfl3w/MR0ME/V//6gNBuLd29QSksv7CYj0VTn8vuToJLXQBF5yfH3m@lists.infradead.org
X-Gm-Message-State: AOJu0YyDZImguuiMKJnNjtbP6Uruxz2D9mxzpkpPF/xOq1J42Nq7BFdu
	9LdohzwnjpwjlcuCmT5tb9WYixbalB0ccIiDSpccRwyA2mLtbnp/p8e55nft/nGtuuSP5pAA+Ci
	SRj804kyKZvypIkR8dXevSFniNn/er5/EuLQG1DOcQHLaR/85SUFLtNSRzVv7krAzW3e/VKhJOa
	wt
X-Gm-Gg: ATEYQzyf+SfdK/Jwo1j3/zAxHKdRA4wLhVB//oLuJZxUnalyYRYpxcflBetbQC3ucLJ
	u4Hs1C3l3z4B2XuhdZEmFkDS+l4l2IuPVYrLdqXow7LA1NDQXFZOWeE1taRiCrI6K/06tUJY5uy
	nLFCrKSNO5Lsn/M8f2wGoGjaf0OZlZOtRioexRmkb6PwG2YjL9jeUARAApMeyeLcOmVmsFCyTGI
	RK8rf4Mz4SXTBfAibVWmQriOdP37d9FTrXsy0KZ8j+2TYnX4p7feKOT1O7k6fjy7DK3tqHEjMuQ
	KfrNfCRR92orMuhSVqldSRUsfUR4swNF1ssTGLv3GyGNGhZXjjuBRpB9OsDk+IXuvHhibYa+26S
	Rpk3LOCys9A+9VHKZfGGQAJCcQkv1tlRo4mEcn4XhZfMpGi9bsilWRnU7
X-Received: by 2002:a05:620a:468d:b0:8b3:14dc:4821 with SMTP id af79cd13be357-8cda193ebb9mr330794485a.3.1773239980499;
        Wed, 11 Mar 2026 07:39:40 -0700 (PDT)
X-Received: by 2002:a05:620a:468d:b0:8b3:14dc:4821 with SMTP id af79cd13be357-8cda193ebb9mr330787285a.3.1773239979887;
        Wed, 11 Mar 2026 07:39:39 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65ce3924sm15069116d6.24.2026.03.11.07.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:39:39 -0700 (PDT)
Date: Wed, 11 Mar 2026 10:39:36 -0400
From: Brian Masney <bmasney@redhat.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tsbogend@alpha.franken.de,
	ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	bhelgaas@google.com, vkoul@kernel.org, neil.armstrong@linaro.org,
	p.zabel@pengutronix.de, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, nbd@nbd.name,
	ansuelsmth@gmail.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/8] clk: airoha: Add econet EN751221 clock/reset
 support to en7523-scu
Message-ID: <abF-qFC1Oa4dz-fh@redhat.com>
References: <20260309131818.74467-1-cjd@cjdns.fr>
 <20260309131818.74467-3-cjd@cjdns.fr>
MIME-Version: 1.0
In-Reply-To: <20260309131818.74467-3-cjd@cjdns.fr>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5XtQPpdTDiSGl-2UC7qwXKp1vU73AQojvg0ThE4RRYw_1773239981
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_073943_951226_EB618A17 
X-CRM114-Status: GOOD (  35.23  )
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

Hi Caleb,

On Mon, Mar 09, 2026 at 01:18:12PM +0000, Caleb James DeLisle wrote:
> EcoNet EN751221 clock/reset driver is significantly similar to the
> EN7523 / EN7581, however the EN751221 does not have a neat batch of clock
> divider registers so there are fewer known clocks, and the frequency of
> each clock is derived differently. This clock driver will probably work
> correctly on EN751627, EN7528, and EN7580.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  drivers/clk/Kconfig      |   6 +-
>  drivers/clk/clk-en7523.c | 238 ++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 236 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 3d803b4cf5c1..47df6073a72b 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -218,13 +218,13 @@ config COMMON_CLK_CS2000_CP
>  	  If you say yes here you get support for the CS2000 clock multiplier.
>  
>  config COMMON_CLK_EN7523
> -	bool "Clock driver for Airoha EN7523 SoC system clocks"
> +	bool "Clock driver for Airoha/EcoNet SoC system clocks"
>  	depends on OF
> -	depends on ARCH_AIROHA || COMPILE_TEST
> +	depends on ARCH_AIROHA || ECONET || COMPILE_TEST
>  	default ARCH_AIROHA
>  	help
>  	  This driver provides the fixed clocks and gates present on Airoha
> -	  ARM silicon.
> +	  and EcoNet silicon.
>  
>  config COMMON_CLK_EP93XX
>  	tristate "Clock driver for Cirrus Logic ep93xx SoC"
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 08cc8e5acf43..f7bd7034cf7f 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  
> +#include <linux/bitfield.h>
>  #include <linux/delay.h>
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
> @@ -11,6 +12,8 @@
>  #include <dt-bindings/clock/en7523-clk.h>
>  #include <dt-bindings/reset/airoha,en7523-reset.h>
>  #include <dt-bindings/reset/airoha,en7581-reset.h>
> +#include <dt-bindings/clock/econet,en751221-scu.h>
> +#include <dt-bindings/reset/econet,en751221-scu.h>
>  
>  #define RST_NR_PER_BANK			32
>  
> @@ -33,15 +36,49 @@
>  #define   REG_RESET_CONTROL_PCIEHB	BIT(29)
>  #define   REG_RESET_CONTROL_PCIE1	BIT(27)
>  #define   REG_RESET_CONTROL_PCIE2	BIT(26)
> +#define REG_HIR				0x064
> +#define   REG_HIR_MASK			GENMASK(31, 16)
>  /* EN7581 */
>  #define REG_NP_SCU_PCIC			0x88
>  #define REG_NP_SCU_SSTR			0x9c
>  #define REG_PCIE_XSI0_SEL_MASK		GENMASK(14, 13)
>  #define REG_PCIE_XSI1_SEL_MASK		GENMASK(12, 11)
>  #define REG_CRYPTO_CLKSRC2		0x20c
> +/* EN751221 */
> +#define EN751221_REG_SPI_DIV		0x0cc
> +#define EN751221_REG_SPI_DIV_MASK	GENMASK(31, 8)
> +#define EN751221_SPI_BASE		500000000
> +#define EN751221_SPI_BASE_EN7526C	400000000
> +#define EN751221_REG_BUS		0x284
> +#define EN751221_REG_BUS_MASK		GENMASK(21, 12)
> +#define EN751221_REG_SSR3		0x094
> +#define EN751221_REG_SSR3_GSW_MASK	GENMASK(9, 8)
>  
>  #define REG_RST_CTRL2			0x830
>  #define REG_RST_CTRL1			0x834
> +#define EN751221_REG_RST_DMT		0x84
> +#define EN751221_REG_RST_USB		0xec
> +
> +#define EN751221_MAX_CLKS		6
> +
> +enum en_hir {
> +	HIR_UNKNOWN	= -1,
> +	HIR_TC3169	= 0,
> +	HIR_TC3182	= 1,
> +	HIR_RT65168	= 2,
> +	HIR_RT63165	= 3,
> +	HIR_RT63365	= 4,
> +	HIR_MT751020	= 5,
> +	HIR_MT7505	= 6,
> +	HIR_EN751221	= 7,
> +	HIR_EN7526C	= 8,
> +	HIR_EN751627	= 9,
> +	HIR_EN7580	= 10,
> +	HIR_EN7528	= 11,
> +	HIR_EN7523	= 12,
> +	HIR_EN7581	= 13,
> +	HIR_MAX		= 14,
> +};
>  
>  struct en_clk_desc {
>  	int id;
> @@ -93,6 +130,8 @@ static const u32 bus7581_base[] = { 600000000, 540000000 };
>  static const u32 npu7581_base[] = { 800000000, 750000000, 720000000, 600000000 };
>  static const u32 crypto_base[] = { 540000000, 480000000 };
>  static const u32 emmc7581_base[] = { 200000000, 150000000 };
> +/* EN751221 */
> +static const u32 gsw751221_base[] = { 500000000, 250000000, 400000000, 200000000 };
>  
>  static const struct en_clk_desc en7523_base_clks[] = {
>  	{
> @@ -300,6 +339,13 @@ static const u16 en7581_rst_ofs[] = {
>  	REG_RST_CTRL1,
>  };
>  
> +static const u16 en751221_rst_ofs[] = {
> +	REG_RST_CTRL2,
> +	REG_RST_CTRL1,
> +	EN751221_REG_RST_DMT,
> +	EN751221_REG_RST_USB,
> +};
> +
>  static const u16 en7523_rst_map[] = {
>  	/* RST_CTRL2 */
>  	[EN7523_XPON_PHY_RST]		= 0,
> @@ -405,8 +451,61 @@ static const u16 en7581_rst_map[] = {
>  	[EN7581_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
>  };
>  
> +static const u16 en751221_rst_map[] = {
> +	/* RST_CTRL2 */
> +	[EN751221_XPON_PHY_RST]		= 0,
> +	[EN751221_GFAST_RST]		= 1,
> +	[EN751221_CPU_TIMER2_RST]	= 2,
> +	[EN751221_UART3_RST]		= 3,
> +	[EN751221_UART4_RST]		= 4,
> +	[EN751221_UART5_RST]		= 5,
> +	[EN751221_I2C2_RST]		= 6,
> +	[EN751221_XSI_MAC_RST]		= 7,
> +	[EN751221_XSI_PHY_RST]		= 8,
> +
> +	/* RST_CTRL1 */
> +	[EN751221_PCM1_ZSI_ISI_RST]	= RST_NR_PER_BANK + 0,
> +	[EN751221_FE_QDMA1_RST]		= RST_NR_PER_BANK + 1,
> +	[EN751221_FE_QDMA2_RST]		= RST_NR_PER_BANK + 2,
> +	[EN751221_FE_UNZIP_RST]		= RST_NR_PER_BANK + 3,
> +	[EN751221_PCM2_RST]		= RST_NR_PER_BANK + 4,
> +	[EN751221_PTM_MAC_RST]		= RST_NR_PER_BANK + 5,
> +	[EN751221_CRYPTO_RST]		= RST_NR_PER_BANK + 6,
> +	[EN751221_SAR_RST]		= RST_NR_PER_BANK + 7,
> +	[EN751221_TIMER_RST]		= RST_NR_PER_BANK + 8,
> +	[EN751221_INTC_RST]		= RST_NR_PER_BANK + 9,
> +	[EN751221_BONDING_RST]		= RST_NR_PER_BANK + 10,
> +	[EN751221_PCM1_RST]		= RST_NR_PER_BANK + 11,
> +	[EN751221_UART_RST]		= RST_NR_PER_BANK + 12,
> +	[EN751221_GPIO_RST]		= RST_NR_PER_BANK + 13,
> +	[EN751221_GDMA_RST]		= RST_NR_PER_BANK + 14,
> +	[EN751221_I2C_MASTER_RST]	= RST_NR_PER_BANK + 16,
> +	[EN751221_PCM2_ZSI_ISI_RST]	= RST_NR_PER_BANK + 17,
> +	[EN751221_SFC_RST]		= RST_NR_PER_BANK + 18,
> +	[EN751221_UART2_RST]		= RST_NR_PER_BANK + 19,
> +	[EN751221_GDMP_RST]		= RST_NR_PER_BANK + 20,
> +	[EN751221_FE_RST]		= RST_NR_PER_BANK + 21,
> +	[EN751221_USB_HOST_P0_RST]	= RST_NR_PER_BANK + 22,
> +	[EN751221_GSW_RST]		= RST_NR_PER_BANK + 23,
> +	[EN751221_SFC2_PCM_RST]		= RST_NR_PER_BANK + 25,
> +	[EN751221_PCIE0_RST]		= RST_NR_PER_BANK + 26,
> +	[EN751221_PCIE1_RST]		= RST_NR_PER_BANK + 27,
> +	[EN751221_CPU_TIMER_RST]	= RST_NR_PER_BANK + 28,
> +	[EN751221_PCIE_HB_RST]		= RST_NR_PER_BANK + 29,
> +	[EN751221_SIMIF_RST]		= RST_NR_PER_BANK + 30,
> +	[EN751221_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
> +
> +	/* RST_DMT */
> +	[EN751221_DMT_RST]		= 2 * RST_NR_PER_BANK + 0,
> +
> +	/* RST_USB */
> +	[EN751221_USB_PHY_P0_RST]	= 3 * RST_NR_PER_BANK + 6,
> +	[EN751221_USB_PHY_P1_RST]	= 3 * RST_NR_PER_BANK + 7,
> +};
> +
>  static int en7581_reset_register(struct device *dev, void __iomem *base,
> -				 const u16 *rst_map, int nr_resets);
> +				 const u16 *rst_map, int nr_resets,
> +				 const u16 *rst_reg_ofs);
>  
>  static u32 en7523_get_base_rate(const struct en_clk_desc *desc, u32 val)
>  {
> @@ -604,7 +703,8 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
>  	en7523_register_clocks(&pdev->dev, clk_data, base, np_base);
>  
>  	return en7581_reset_register(&pdev->dev, np_base, en7523_rst_map,
> -				     ARRAY_SIZE(en7523_rst_map));
> +				     ARRAY_SIZE(en7523_rst_map),
> +				     en7581_rst_ofs);

I assume the mix of en7523 and en7581 is ok here?

>  }
>  
>  static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
> @@ -705,7 +805,8 @@ static const struct reset_control_ops en7581_reset_ops = {
>  };
>  
>  static int en7581_reset_register(struct device *dev, void __iomem *base,
> -				 const u16 *rst_map, int nr_resets)
> +				 const u16 *rst_map, int nr_resets,
> +				 const u16 *rst_reg_ofs)
>  {
>  	struct en_rst_data *rst_data;
>  
> @@ -713,7 +814,7 @@ static int en7581_reset_register(struct device *dev, void __iomem *base,
>  	if (!rst_data)
>  		return -ENOMEM;
>  
> -	rst_data->bank_ofs = en7581_rst_ofs;
> +	rst_data->bank_ofs = rst_reg_ofs;
>  	rst_data->idx_map = rst_map;
>  	rst_data->base = base;
>  
> @@ -752,7 +853,123 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
>  	writel(val | 3, base + REG_NP_SCU_PCIC);
>  
>  	return en7581_reset_register(&pdev->dev, base, en7581_rst_map,
> -				     ARRAY_SIZE(en7581_rst_map));
> +				     ARRAY_SIZE(en7581_rst_map),
> +				     en7581_rst_ofs);
> +}
> +
> +static enum en_hir get_hw_id(void __iomem *np_base)
> +{
> +	u32 val = FIELD_GET(REG_HIR_MASK, readl(np_base + REG_HIR));
> +
> +	if (val < HIR_MAX)
> +		return (enum en_hir) val;

No space with the cast.

> +
> +	return HIR_UNKNOWN;
> +}
> +
> +static void en751221_try_register_clk(struct device *dev, int key,
> +				      struct clk_hw_onecell_data *clk_data,
> +				      const char *name, u32 rate)
> +{
> +	struct clk_hw *hw;
> +
> +	hw = clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
> +	if (IS_ERR(hw) || key >= EN751221_MAX_CLKS)
> +		pr_err("Failed to register clk %s: %pe\n", name, hw);

Is %pe correct in the case when key >= EN751221_MAX_CLKS?

> +	else
> +		clk_data->hws[key] = hw;

Should the error code be returned here? I know the function has try in
it's name, however if this fails, then it still registers it.

> +}
> +
> +static void en751221_register_clocks(struct device *dev,
> +				     struct clk_hw_onecell_data *clk_data,
> +				     struct regmap *map, void __iomem *np_base)
> +{
> +	enum en_hir hid = get_hw_id(np_base);
> +	struct clk_hw *hw;
> +	u32 rate;
> +	u32 div;
> +	int err;
> +
> +	/* PCI */
> +	hw = en7523_register_pcie_clk(dev, np_base);
> +	clk_data->hws[EN751221_CLK_PCIE] = hw;
> +
> +	/* SPI */
> +	rate = EN751221_SPI_BASE;
> +	if (hid == HIR_EN7526C)
> +		rate = EN751221_SPI_BASE_EN7526C;
> +
> +	err = regmap_read(map, EN751221_REG_SPI_DIV, &div);
> +	if (err) {
> +		pr_err("Failed reading fixed clk div %s: %d\n",
> +		       "spi", err);
> +	} else {
> +		div = FIELD_GET(EN751221_REG_SPI_DIV_MASK, div) * 2;
> +		if (!div)
> +			div = 40;

Should 40 be documented a little better with a #define?

> +
> +		en751221_try_register_clk(dev, EN751221_CLK_SPI, clk_data,
> +					  "spi", rate / div);
> +	}
> +
> +	/* BUS */
> +	rate = FIELD_GET(EN751221_REG_BUS_MASK,
> +			 readl(np_base + EN751221_REG_BUS));
> +	rate *= 1000000;
> +	en751221_try_register_clk(dev, EN751221_CLK_BUS, clk_data, "bus",
> +				  rate);
> +
> +	/* CPU */
> +	en751221_try_register_clk(dev, EN751221_CLK_CPU, clk_data, "cpu",
> +				  rate * 4);
> +
> +	/* HPT */
> +	switch (hid) {
> +	case HIR_EN751221:
> +	case HIR_EN751627:
> +	case HIR_EN7526C:
> +	case HIR_EN7580:
> +	case HIR_EN7528:
> +		rate = 200000000;
> +		break;
> +	case HIR_MT7505:
> +		rate = 100000000;
> +		break;
> +	case HIR_MT751020:
> +		rate = 800000000 / 3;
> +		break;
> +	default:
> +		rate = 250000000;

Should a warning be logged here or in get_hw_id() above? hid can be set
to HIR_UNKNOWN here.

> +	}
> +	en751221_try_register_clk(dev, EN751221_CLK_HPT, clk_data, "hpt",
> +				  rate);
> +
> +	/* GSW */
> +	rate = FIELD_GET(EN751221_REG_SSR3_GSW_MASK,
> +			 readl(np_base + EN751221_REG_SSR3));
> +	en751221_try_register_clk(dev, EN751221_CLK_GSW, clk_data, "gsw",
> +				  gsw751221_base[rate]);
> +}
> +
> +static int en751221_clk_hw_init(struct platform_device *pdev,
> +				struct clk_hw_onecell_data *clk_data)
> +{
> +	struct regmap *map;
> +	void __iomem *base;
> +
> +	map = syscon_regmap_lookup_by_compatible("econet,en751221-chip-scu");
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	en751221_register_clocks(&pdev->dev, clk_data, map, base);

Again, any reason why the error handling is missing here?

Brian


> +
> +	return en7581_reset_register(&pdev->dev, base, en751221_rst_map,
> +				     ARRAY_SIZE(en751221_rst_map),
> +				     en751221_rst_ofs);
>  }
>  
>  static int en7523_clk_probe(struct platform_device *pdev)
> @@ -799,9 +1016,20 @@ static const struct en_clk_soc_data en7581_data = {
>  	.hw_init = en7581_clk_hw_init,
>  };
>  
> +static const struct en_clk_soc_data en751221_data = {
> +	.num_clocks = EN751221_MAX_CLKS,
> +	.pcie_ops = {
> +		.is_enabled = en7523_pci_is_enabled,
> +		.prepare = en7523_pci_prepare,
> +		.unprepare = en7523_pci_unprepare,
> +	},
> +	.hw_init = en751221_clk_hw_init,
> +};
> +
>  static const struct of_device_id of_match_clk_en7523[] = {
>  	{ .compatible = "airoha,en7523-scu", .data = &en7523_data },
>  	{ .compatible = "airoha,en7581-scu", .data = &en7581_data },
> +	{ .compatible = "econet,en751221-scu", .data = &en751221_data },
>  	{ /* sentinel */ }
>  };
>  
> -- 
> 2.39.5
> 


