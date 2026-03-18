Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C06A107BCF5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 10:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxNF+oMnIpFvmpePca9YY9OFSfpgVfVg+HqxPSd5+rI=; b=4T5wcY7oFZ5RsSCNNNVCaJ5VpM
	BGXE30IrCmrYf78X5Em38b62CaPyzClMQgRV3Njyu7DYcTqi4lmRHReT7Uwpt48H3j1p268kSTsYw
	VH28l9iv/QwP0C03Z1RQwLofwjUOTNZBN9f8eqxk92z3cKt26E84IWRXPu7JFsViwu4jqQ0wc3Gfu
	rFiHMKuzkH3WDrqvvaPZeTRzmLyOWgGN2dd7cRByiag03GwCv8En2uP5IRGi6EO6//+XK+8xo+YYD
	45uknJGaq2+dyBMxC3444oC9gGT+1zU2lEyr3vx5THcdngDkTYWfBF3gDUmKDlcZFs4Y6YRFgObLo
	nmz/NfJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oMR-00000008E3q-2ydS;
	Wed, 18 Mar 2026 10:42:47 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oMO-00000008E2f-17ls
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 10:42:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1w2oMB-00007O-N6; Wed, 18 Mar 2026 11:42:31 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1w2oMA-000tRR-2y;
	Wed, 18 Mar 2026 11:42:30 +0100
Received: from pengutronix.de (p4ffb2dc6.dip0.t-ipconnect.de [79.251.45.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 836A1507596;
	Wed, 18 Mar 2026 10:42:30 +0000 (UTC)
Date: Wed, 18 Mar 2026 11:42:30 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, 
	Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>, 
	Eric Chanudet <echanude@redhat.com>, Larisa Grigore <larisa.grigore@nxp.com>
Subject: Re: [PATCH 2/5] can: flexcan: add FLEXCAN_QUIRK_NR_IRQ_2 quirk for
 two interrupt lines
Message-ID: <20260318-meteoric-tentacled-chupacabra-347f1d-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <20260318092215.23505-1-ciprianmarian.costea@oss.nxp.com>
 <20260318092215.23505-3-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mmaqyshtoip65elf"
Content-Disposition: inline
In-Reply-To: <20260318092215.23505-3-ciprianmarian.costea@oss.nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_034244_461189_4DCF7049 
X-CRM114-Status: GOOD (  30.82  )
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


--mmaqyshtoip65elf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/5] can: flexcan: add FLEXCAN_QUIRK_NR_IRQ_2 quirk for
 two interrupt lines
MIME-Version: 1.0

On 18.03.2026 10:22:12, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> Introduce FLEXCAN_QUIRK_NR_IRQ_2 quirk to handle hardware integration

I understand, you followed the pattern and introduced
FLEXCAN_QUIRK_NR_IRQ_2.

I think it would be better to describe the actual reason why this IP
integration uses 2 IRQs: it has a dedicated combined bus error and state
change IRQ. What about: FLEXCAN_QUIRK_IRQ_BERR, this would match the
interrupt name from the bindings.

In a separate patch, we could migrate the s32g compatible SoCs to the
new quirk. But that's not subject to this patch series.

> where the FlexCAN module has two separate interrupt lines:
> - one for signaling error and bus state changes

Usually it's "bus error" and "state changes", as the errors happen
visible for everyone on the bus, while the state change is local to the
controller (every controller has it's own state).

> - one for mailboxes 0-127
>
> This is required for NXP S32N79 SoC support.
>
> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  drivers/net/can/flexcan/flexcan-core.c | 21 ++++++++++++++++++---
>  drivers/net/can/flexcan/flexcan.h      | 16 +++++++++-------
>  2 files changed, 27 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/fle=
xcan/flexcan-core.c
> index f5d22c61503f..a6b15496853c 100644
> --- a/drivers/net/can/flexcan/flexcan-core.c
> +++ b/drivers/net/can/flexcan/flexcan-core.c
> @@ -1770,7 +1770,10 @@ static int flexcan_open(struct net_device *dev)
>  				  flexcan_irq, IRQF_SHARED, dev->name, dev);
>  		if (err)
>  			goto out_free_irq;
> +	}
>
> +	if (priv->devtype_data.quirks &
> +			(FLEXCAN_QUIRK_NR_IRQ_2 | FLEXCAN_QUIRK_NR_IRQ_3)) {
>  		err =3D request_irq(priv->irq_err,
>  				  flexcan_irq, IRQF_SHARED, dev->name, dev);
>  		if (err)
> @@ -1791,7 +1794,8 @@ static int flexcan_open(struct net_device *dev)
>  	return 0;
>
>   out_free_irq_err:
> -	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_NR_IRQ_3)
> +	if (priv->devtype_data.quirks &
> +			(FLEXCAN_QUIRK_NR_IRQ_2 | FLEXCAN_QUIRK_NR_IRQ_3))
>  		free_irq(priv->irq_err, dev);
>   out_free_irq_boff:
>  	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_NR_IRQ_3)
> @@ -1823,10 +1827,12 @@ static int flexcan_close(struct net_device *dev)
>  	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_SECONDARY_MB_IRQ)
>  		free_irq(priv->irq_secondary_mb, dev);
>
> -	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_NR_IRQ_3) {
> +	if (priv->devtype_data.quirks &
> +			(FLEXCAN_QUIRK_NR_IRQ_2 | FLEXCAN_QUIRK_NR_IRQ_3))
>  		free_irq(priv->irq_err, dev);
> +
> +	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_NR_IRQ_3)
>  		free_irq(priv->irq_boff, dev);
> -	}
>
>  	free_irq(dev->irq, dev);
>  	can_rx_offload_disable(&priv->offload);
> @@ -2213,12 +2219,21 @@ static int flexcan_probe(struct platform_device *=
pdev)
>  	if (transceiver)
>  		priv->can.bitrate_max =3D transceiver->attrs.max_link_rate;
>
> +	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_NR_IRQ_2) {
> +		priv->irq_err =3D platform_get_irq(pdev, 1);

Please use platform_get_irq_byname()

> +		if (priv->irq_err < 0) {
> +			err =3D priv->irq_err;
> +			goto failed_platform_get_irq;
> +		}
> +	}
> +
>  	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_NR_IRQ_3) {
>  		priv->irq_boff =3D platform_get_irq(pdev, 1);
>  		if (priv->irq_boff < 0) {
>  			err =3D priv->irq_boff;
>  			goto failed_platform_get_irq;
>  		}
> +
>  		priv->irq_err =3D platform_get_irq(pdev, 2);
>  		if (priv->irq_err < 0) {
>  			err =3D priv->irq_err;
> diff --git a/drivers/net/can/flexcan/flexcan.h b/drivers/net/can/flexcan/=
flexcan.h
> index 16692a2502eb..f05036ca54f5 100644
> --- a/drivers/net/can/flexcan/flexcan.h
> +++ b/drivers/net/can/flexcan/flexcan.h
> @@ -58,22 +58,24 @@
>  #define FLEXCAN_QUIRK_SUPPORT_ECC BIT(10)
>  /* Setup stop mode with SCU firmware to support wakeup */
>  #define FLEXCAN_QUIRK_SETUP_STOP_MODE_SCFW BIT(11)
> +/* Setup 2 separate interrupts, main and err */
> +#define FLEXCAN_QUIRK_NR_IRQ_2 BIT(12)
>  /* Setup 3 separate interrupts, main, boff and err */
> -#define FLEXCAN_QUIRK_NR_IRQ_3 BIT(12)
> +#define FLEXCAN_QUIRK_NR_IRQ_3 BIT(13)
>  /* Setup 16 mailboxes */
> -#define FLEXCAN_QUIRK_NR_MB_16 BIT(13)
> +#define FLEXCAN_QUIRK_NR_MB_16 BIT(14)
>  /* Device supports RX via mailboxes */
> -#define FLEXCAN_QUIRK_SUPPORT_RX_MAILBOX BIT(14)
> +#define FLEXCAN_QUIRK_SUPPORT_RX_MAILBOX BIT(15)
>  /* Device supports RTR reception via mailboxes */
> -#define FLEXCAN_QUIRK_SUPPORT_RX_MAILBOX_RTR BIT(15)
> +#define FLEXCAN_QUIRK_SUPPORT_RX_MAILBOX_RTR BIT(16)
>  /* Device supports RX via FIFO */
> -#define FLEXCAN_QUIRK_SUPPORT_RX_FIFO BIT(16)
> +#define FLEXCAN_QUIRK_SUPPORT_RX_FIFO BIT(17)
>  /* Setup stop mode with ATF SCMI protocol to support wakeup */
> -#define FLEXCAN_QUIRK_SETUP_STOP_MODE_SCMI BIT(17)
> +#define FLEXCAN_QUIRK_SETUP_STOP_MODE_SCMI BIT(18)
>  /* Device has two separate interrupt lines for two mailbox ranges, which
>   * both need to have an interrupt handler registered.
>   */
> -#define FLEXCAN_QUIRK_SECONDARY_MB_IRQ	BIT(18)
> +#define FLEXCAN_QUIRK_SECONDARY_MB_IRQ	BIT(19)

As I want to change the quirks anyways, just add new quirk at the end.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--mmaqyshtoip65elf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCabqBkwAKCRDMOmT6rpmt
0vZfAQCcHiduJJiHqQlpBQ+Vi3ackoALdVecg7r1LhFi8U5J3gEA8x/8YRKjyyHq
e8ITNDj/HHimKZHGuSGD2mKfFELkDAc=
=F+OT
-----END PGP SIGNATURE-----

--mmaqyshtoip65elf--

