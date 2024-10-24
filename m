Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF41D0BB6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 08:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yPFqKSzpajpi+JRVcSzA2vMB9V6OUl8g3SjnirUP8E=; b=gitBpEyGq/TxGD1B0Axoj7Vvpw
	7cDSa72UdiJt9urmRUmhrtizkZtImnR+itH5hljna8uW3amRAmG7kRcLxL/01cbdFUBAw4GfBz60U
	/PrSHQOYLy5Ed+qnQAKxDpmWei25hUAUpCKP0PCz9V1R0mbYaiOs5TxXPBv4uiAUe9QYynq6TGZiq
	eX69ymQPXXOMrPztawRc4tnRoR7sKRs7Mnj0yN/ssPgkAUxgxh7yr5Af/4HiJCOsr4pIM2oGtcjQI
	sX69rZPshm0mV+MSFj8uZaZD9yYKhBbZBec65rNzoJuE57rYR8VqkDqXr+3uxTBrMv5Pcj2Ud8XVn
	/NYJNApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3sy9-0000000HEOs-0er0;
	Thu, 24 Oct 2024 08:13:21 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3swW-0000000HDwT-1IXe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 08:11:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t3swS-00065c-Ug; Thu, 24 Oct 2024 10:11:36 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t3swR-000AFt-14;
	Thu, 24 Oct 2024 10:11:35 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t3swR-0002GS-0q;
	Thu, 24 Oct 2024 10:11:35 +0200
Message-ID: <83b9d2855f9513b2431fe31c43a992eb952f9b05.camel@pengutronix.de>
Subject: Re: [PATCH 02/10] dma-engine: sun4i: Add has_reset option to quirk
From: Philipp Zabel <p.zabel@pengutronix.de>
To: =?ISO-8859-1?Q?Cs=F3k=E1s=2C?= Bence <csokas.bence@prolan.hu>, 
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Mesih Kilinc <mesihkilinc@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Chen-Yu Tsai
	 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
	 <samuel@sholland.org>
Date: Thu, 24 Oct 2024 10:11:35 +0200
In-Reply-To: <20241024064931.1144605-3-csokas.bence@prolan.hu>
References: <20241024064931.1144605-3-csokas.bence@prolan.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_011140_372299_5E98AFC9 
X-CRM114-Status: GOOD (  19.15  )
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

On Do, 2024-10-24 at 08:49 +0200, Cs=C3=B3k=C3=A1s, Bence wrote:
> From: Mesih Kilinc <mesihkilinc@gmail.com>
>=20
> Allwinner suniv F1C100s has a reset bit for DMA in CCU. Sun4i do not
> has this bit but in order to support suniv we need to add it. So add
> support for reset bit.
>=20
> Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
> ---
>  drivers/dma/sun4i-dma.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
> index 5efbed7c546f..0b99b3884971 100644
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
> @@ -1215,6 +1218,15 @@ static int sun4i_dma_probe(struct platform_device =
*pdev)
>  		return PTR_ERR(priv->clk);
>  	}
> =20
> +	if (priv->cfg->has_reset) {
> +		priv->rst =3D devm_reset_control_get_exclusive(&pdev->dev,
> +							       NULL);

Aligning to open parenthesis will make checkpatch --strict happy.

> +		if (IS_ERR(priv->rst)) {
> +			dev_err(&pdev->dev, "Failed to get reset control\n");

Consider using dev_err_probe() here.

> +			return PTR_ERR(priv->rst);
> +		}
> +	}
> +
>  	platform_set_drvdata(pdev, priv);
>  	spin_lock_init(&priv->lock);
> =20
> @@ -1287,6 +1299,16 @@ static int sun4i_dma_probe(struct platform_device =
*pdev)
>  		return ret;
>  	}
> =20
> +	/* Deassert the reset control */
> +	if (priv->rst) {
> +		ret =3D reset_control_deassert(priv->rst);
> +		if (ret) {
> +			dev_err(&pdev->dev,
> +				"Failed to deassert the reset control\n");
> +			goto err_clk_disable;
> +		}
> +	}

You can just call reset_control_deassert() unconditionally, it accepts
a NULL parameter:

  https://docs.kernel.org/driver-api/reset.html#c.reset_control_deassert


regards
Philipp

