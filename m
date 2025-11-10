Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF43ACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 07:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbG9lriM/L33zjNkEpJyStrehopTiFPQZJpbt4PibWc=; b=GxlmrEGhjf7KqoR1H7lyNJmOYQ
	mI/rfPZ21f9lu/gA0/x9HTAnCjMErLYCW/LGoYGlDRGk1MyQEjLqdpNpgMv+AnAx/TlteYK2r+Ibx
	/8mUoCD7m+ETdIIKGUTfNXvAHNSuLfiHQkox0VEzSVoLVIiGqA9mMSEgCFeMBqJ721HsPPb430EbI
	Zj0nqZcLnRxRkSq9nWxu2wIG8OzYyfnbvjraVH2odtP/guWJyAQVha4MQ/5arVvzuSHYabQzokrs/
	BqpWHPtWTwzAnfJAAMEjVyhrncLHFZclXjfHZwlCgFLcDObTxAO+tUpzXndHLAYiboo2AQ/KY9gP/
	7AjfJ/eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIMiz-00000004vAp-0Gx5;
	Mon, 10 Nov 2025 07:54:05 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIMiv-00000004v8A-2GJI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 07:54:03 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIMiZ-0001jm-0O; Mon, 10 Nov 2025 08:53:39 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIMiX-007z4n-0e;
	Mon, 10 Nov 2025 08:53:37 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIMiX-000000002gp-0Uik;
	Mon, 10 Nov 2025 08:53:37 +0100
Message-ID: <90e735aa4d0121c4ec6cf9772b80823b570d5a43.camel@pengutronix.de>
Subject: Re: [PATCH RESEND v3 2/3] clk: en7523: Add reset-controller support
 for EN7523 SoC
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Michael Turquette	
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Felix
 Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>
Date: Mon, 10 Nov 2025 08:53:37 +0100
In-Reply-To: <20251110035645.892431-3-mikhail.kshevetskiy@iopsys.eu>
References: <20251110035645.892431-1-mikhail.kshevetskiy@iopsys.eu>
	 <20251110035645.892431-3-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_235401_578084_5DD67BFC 
X-CRM114-Status: GOOD (  18.92  )
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

On Mo, 2025-11-10 at 06:56 +0300, Mikhail Kshevetskiy wrote:
> Introduce reset API support to EN7523 clock driver. EN7523 uses the
> same reset logic as EN7581, so just reuse existing code.
>=20
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

> ---
>  drivers/clk/clk-en7523.c | 64 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 59 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 15bbdeb60b8e..08cc8e5acf43 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -9,6 +9,7 @@
>  #include <linux/regmap.h>
>  #include <linux/reset-controller.h>
>  #include <dt-bindings/clock/en7523-clk.h>
> +#include <dt-bindings/reset/airoha,en7523-reset.h>
>  #include <dt-bindings/reset/airoha,en7581-reset.h>
> =20
>  #define RST_NR_PER_BANK			32
> @@ -299,6 +300,53 @@ static const u16 en7581_rst_ofs[] =3D {
>  	REG_RST_CTRL1,
>  };
> =20
> +static const u16 en7523_rst_map[] =3D {
> +	/* RST_CTRL2 */
> +	[EN7523_XPON_PHY_RST]		=3D 0,
> +	[EN7523_XSI_MAC_RST]		=3D 7,
> +	[EN7523_XSI_PHY_RST]		=3D 8,
> +	[EN7523_NPU_RST]		=3D 9,
> +	[EN7523_I2S_RST]		=3D 10,
> +	[EN7523_TRNG_RST]		=3D 11,
> +	[EN7523_TRNG_MSTART_RST]	=3D 12,
> +	[EN7523_DUAL_HSI0_RST]		=3D 13,
> +	[EN7523_DUAL_HSI1_RST]		=3D 14,
> +	[EN7523_HSI_RST]		=3D 15,
> +	[EN7523_DUAL_HSI0_MAC_RST]	=3D 16,
> +	[EN7523_DUAL_HSI1_MAC_RST]	=3D 17,
> +	[EN7523_HSI_MAC_RST]		=3D 18,
> +	[EN7523_WDMA_RST]		=3D 19,
> +	[EN7523_WOE0_RST]		=3D 20,
> +	[EN7523_WOE1_RST]		=3D 21,
> +	[EN7523_HSDMA_RST]		=3D 22,
> +	[EN7523_I2C2RBUS_RST]		=3D 23,
> +	[EN7523_TDMA_RST]		=3D 24,
> +	/* RST_CTRL1 */
> +	[EN7523_PCM1_ZSI_ISI_RST]	=3D RST_NR_PER_BANK + 0,
> +	[EN7523_FE_PDMA_RST]		=3D RST_NR_PER_BANK + 1,
> +	[EN7523_FE_QDMA_RST]		=3D RST_NR_PER_BANK + 2,
> +	[EN7523_PCM_SPIWP_RST]		=3D RST_NR_PER_BANK + 4,
> +	[EN7523_CRYPTO_RST]		=3D RST_NR_PER_BANK + 6,
> +	[EN7523_TIMER_RST]		=3D RST_NR_PER_BANK + 8,
> +	[EN7523_PCM1_RST]		=3D RST_NR_PER_BANK + 11,
> +	[EN7523_UART_RST]		=3D RST_NR_PER_BANK + 12,
> +	[EN7523_GPIO_RST]		=3D RST_NR_PER_BANK + 13,
> +	[EN7523_GDMA_RST]		=3D RST_NR_PER_BANK + 14,
> +	[EN7523_I2C_MASTER_RST]		=3D RST_NR_PER_BANK + 16,
> +	[EN7523_PCM2_ZSI_ISI_RST]	=3D RST_NR_PER_BANK + 17,
> +	[EN7523_SFC_RST]		=3D RST_NR_PER_BANK + 18,
> +	[EN7523_UART2_RST]		=3D RST_NR_PER_BANK + 19,
> +	[EN7523_GDMP_RST]		=3D RST_NR_PER_BANK + 20,
> +	[EN7523_FE_RST]			=3D RST_NR_PER_BANK + 21,
> +	[EN7523_USB_HOST_P0_RST]	=3D RST_NR_PER_BANK + 22,
> +	[EN7523_GSW_RST]		=3D RST_NR_PER_BANK + 23,
> +	[EN7523_SFC2_PCM_RST]		=3D RST_NR_PER_BANK + 25,
> +	[EN7523_PCIE0_RST]		=3D RST_NR_PER_BANK + 26,
> +	[EN7523_PCIE1_RST]		=3D RST_NR_PER_BANK + 27,
> +	[EN7523_PCIE_HB_RST]		=3D RST_NR_PER_BANK + 29,
> +	[EN7523_XPON_MAC_RST]		=3D RST_NR_PER_BANK + 31,
> +};
> +
>  static const u16 en7581_rst_map[] =3D {
>  	/* RST_CTRL2 */
>  	[EN7581_XPON_PHY_RST]		=3D 0,
> @@ -357,6 +405,9 @@ static const u16 en7581_rst_map[] =3D {
>  	[EN7581_XPON_MAC_RST]		=3D RST_NR_PER_BANK + 31,
>  };
> =20
> +static int en7581_reset_register(struct device *dev, void __iomem *base,
> +				 const u16 *rst_map, int nr_resets);
> +
>  static u32 en7523_get_base_rate(const struct en_clk_desc *desc, u32 val)
>  {
>  	if (!desc->base_bits)
> @@ -552,7 +603,8 @@ static int en7523_clk_hw_init(struct platform_device =
*pdev,
> =20
>  	en7523_register_clocks(&pdev->dev, clk_data, base, np_base);
> =20
> -	return 0;
> +	return en7581_reset_register(&pdev->dev, np_base, en7523_rst_map,
> +				     ARRAY_SIZE(en7523_rst_map));

I wonder if this wouldn't be better moved out of hw_init(), with
rst_map and the corresponding ARRAY_SIZE() stored in struct
en_clk_soc_data. Registering a reset controller is not hardware
initialization, after all. But that's not an issue with this patch.

regards
Philipp

