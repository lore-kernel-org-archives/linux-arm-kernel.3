Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6416E67805
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 17:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kp5Cm/snhHhw/C8tj0MjuS5PK5Kyl87SGG/dhV+k2hg=; b=cFPGCRg6ivmlUX1RLM7CdrwVmy
	W2VGCES9JOAR1KdUUPp8PMxgVPHzylxY43jW7EukXGoRCSXRRlE61zLBBrZqQ9OlfGgTrriDA8h1z
	nF8uDHsU9db9G/S6tCJnuzV6bwhgSGTcLB5lcfalBiy53qIM2yJ8ypk8fiKp4IJThREotgIbKEBFQ
	DCwiFjweK6ZKrmbPQ7AvmkAR9XmSbyDIbz+OWBL96ryS7ytGwLoR/4Zwp0cCYaV/3Dk3iIpURep3J
	D8footyyF8o5tUWglQRLbuXVo0u8n5AfvtWNEHbM19hqU12Spe5Jj2b+kQYplfiWOhhwfH+bkgN5Q
	kSEjdMLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7IET-0000000A95n-33GN;
	Sat, 02 Nov 2024 17:48:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7IBu-0000000A8oA-0UjU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 17:45:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68869FEC;
	Sat,  2 Nov 2024 10:46:04 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06EB03F66E;
	Sat,  2 Nov 2024 10:45:32 -0700 (PDT)
Date: Sat, 2 Nov 2024 17:45:16 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: "=?UTF-8?B?Q3PDs2vDoXMs?= Bence" <csokas.bence@prolan.hu>
Cc: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Mesih Kilinc
 <mesihkilinc@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Philipp
 Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 2/5] dma-engine: sun4i: Add has_reset option to quirk
Message-ID: <20241102174516.02d124d6@minigeek.lan>
In-Reply-To: <20241102093140.2625230-3-csokas.bence@prolan.hu>
References: <20241102093140.2625230-1-csokas.bence@prolan.hu>
	<20241102093140.2625230-3-csokas.bence@prolan.hu>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_104538_264775_C40B4047 
X-CRM114-Status: GOOD (  22.39  )
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

On Sat, 2 Nov 2024 10:31:41 +0100
"Cs=C3=B3k=C3=A1s, Bence" <csokas.bence@prolan.hu> wrote:

Hi,

> From: Mesih Kilinc <mesihkilinc@gmail.com>
>=20
> Allwinner suniv F1C100s has a reset bit for DMA in CCU. Sun4i do not
> has this bit but in order to support suniv we need to add it. So add
> support for reset bit.
>=20
> Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
> [ csokas.bence: Rebased and addressed comments ]
> Signed-off-by: Cs=C3=B3k=C3=A1s, Bence <csokas.bence@prolan.hu>
> ---
>=20
> Notes:
>     Changes in v2:
>     * Call reset_control_deassert() unconditionally, as it supports optio=
nal resets
>     * Use dev_err_probe()
>     * Whitespace
>     Changes in v3:
>     * More dev_err_probe() fixes
>     Changes in v4:
>     * Use return value of dev_err_probe()
>     Changes in v5:
>     * More whitespace
>=20
>  drivers/dma/sun4i-dma.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
> index b2c1e4b9f696..9d1e3c51342d 100644
> --- a/drivers/dma/sun4i-dma.c
> +++ b/drivers/dma/sun4i-dma.c
> @@ -15,6 +15,7 @@
>  #include <linux/of_dma.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> =20
> @@ -159,6 +160,7 @@ struct sun4i_dma_config {
>  	u8 ddma_drq_sdram;
> =20
>  	u8 max_burst;
> +	bool has_reset;
>  };
> =20
>  struct sun4i_dma_pchan {
> @@ -208,6 +210,7 @@ struct sun4i_dma_dev {
>  	int				irq;
>  	spinlock_t			lock;
>  	const struct sun4i_dma_config *cfg;
> +	struct reset_control *rst;
>  };
> =20
>  static struct sun4i_dma_dev *to_sun4i_dma_dev(struct dma_device *dev)
> @@ -1215,6 +1218,13 @@ static int sun4i_dma_probe(struct platform_device =
*pdev)
>  		return PTR_ERR(priv->clk);
>  	}
> =20
> +	if (priv->cfg->has_reset) {
> +		priv->rst =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);

Can't we use devm_reset_control_get_optional_exclusive(), and then save
this whole has_reset bit?

> +		if (IS_ERR(priv->rst))
> +			return dev_err_probe(&pdev->dev, PTR_ERR(priv->rst),
> +					     "Failed to get reset control\n");
> +	}
> +
>  	platform_set_drvdata(pdev, priv);
>  	spin_lock_init(&priv->lock);
> =20
> @@ -1287,6 +1297,14 @@ static int sun4i_dma_probe(struct platform_device =
*pdev)
>  		return ret;
>  	}
> =20
> +	/* Deassert the reset control */
> +	ret =3D reset_control_deassert(priv->rst);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret,
> +			      "Failed to deassert the reset control\n");
> +		goto err_clk_disable;
> +	}
> +
>  	/*
>  	 * Make sure the IRQs are all disabled and accounted for. The bootloader
>  	 * likes to leave these dirty
> @@ -1355,6 +1373,7 @@ static struct sun4i_dma_config sun4i_a10_dma_cfg =
=3D {
>  	.ddma_drq_sdram		=3D SUN4I_DDMA_DRQ_TYPE_SDRAM,
> =20
>  	.max_burst		=3D SUN4I_MAX_BURST,
> +	.has_reset		=3D false,
>  };
> =20
>  static const struct of_device_id sun4i_dma_match[] =3D {


