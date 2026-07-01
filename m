Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A55C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 09:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXbWsJdVyrdyTG0h5l7l2loSKTm6mVXPsPtw2ami5dk=; b=jJce4vhTpIaSKWyjB7Hxs1vjzY
	RiO2JtD1vL53uU9A0C/2RLPfocPh+4gbDxZTVKpHblfqiTKABOwz1l2E9HhHHFpnI/XDFQmUmODLf
	AeVvInJTBv+0tvgKHsmwjmZhMpl167kRzAo+1aQR7NEMF1boKMz9ynityeygbeBAJ6ZRcI+ejzvU1
	KqfvTFvVGi/WwOsBQiP0uAyr5h3oOA1bdcJKKSDG9mK4CrdpOuC70ucXmPGaTsSClSSAU92aNg3Um
	HEndcl1aHkxzgjnOTUFsZdRLtwxu61BB3NFPcLZkgXVZDB9ujmVKxD2/TmgSwUK0jDrU1mLRXlIka
	lqbxUTlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werfi-00000001FGF-2Wka;
	Wed, 01 Jul 2026 09:55:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werff-00000001FFR-1IWR;
	Wed, 01 Jul 2026 09:55:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=YXbWsJdVyrdyTG0h5l7l2loSKTm6mVXPsPtw2ami5dk=; b=CBFCH8L3XGKiP/K1ZN7vVXVeHO
	TYkbcdRb7HG3F74/uf8JkzcO+CYf/pQ8hVd/bQW64Ez2rZ4zxcV4TD0jnnJseomf1envfpC8mnB+Q
	AXx+xHjOmIhyrn9yFTao5hqiJWjmm1v9eFQzdTye49MOlx8QrLadNqQKz4MVVq9UicyCi7m9t222i
	SUAkN9B4gjxbnt2lMrxs+JROzdPZgH7xqe3MBWAMt+K5c4hXSLlrlhoQtMTZaYHbAKEzBypRxVrM4
	X4p3CoGibwpF2ye7JhDmqplKnFc8fTDvLGL3P4wY8T7vuXpwFxPsznPvG3gb2gCl+RTv1YHEL7YtO
	PBd3NovA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Marc Kleine-Budde <mkl@pengutronix.de>, linux-can@vger.kernel.org,
 1579567540@qq.com
Cc: Vincent Mailhol <mailhol@kernel.org>, kernel@pengutronix.de,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, luch00 <1579567540@qq.com>
Subject: Re: [PATCH 2/3] can: rockchip: add RK3588 CAN-FD support
Date: Wed, 01 Jul 2026 11:55:39 +0200
Message-ID: <2064877.jZfb76A358@diego>
In-Reply-To: <tencent_124D6134EB32480979234201E688087E5408@qq.com>
References: <20260701070128.2096267-1-1579567540@qq.com>
 <tencent_124D6134EB32480979234201E688087E5408@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_025555_546005_23A85632 
X-CRM114-Status: GOOD (  20.77  )
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

Hi,

Am Mittwoch, 1. Juli 2026, 09:01:27 Mitteleurop=C3=A4ische Sommerzeit schri=
eb 1579567540@qq.com:
> From: luch00 <1579567540@qq.com>

please use a real name, not an alias.


> Add support for the RK3588v2 CAN-FD controller by introducing a
> dedicated model ID and OF match entry.
>=20
> The block is closely related to the existing RK3568 variants, but it
> cannot reuse their match data unchanged. In particular, RK3588v2
> encodes RX_FIFO_CNT in bits 7:5 instead of 6:4, so the RX path needs
> SoC-specific handling.
>=20
> Validation on RK3588v2 also shows that its observed errata profile does
> not fully match rk3568v2/rk3568v3, so keep a dedicated devtype for this
> variant instead of relying on an rk3568 fallback.

=46unnily enough, we seem to have worked on the same topic
at the same time :-)

https://lore.kernel.org/lkml/20260630164336.3444550-1-heiko@sntech.de/

> Signed-off-by: luch00 <1579567540@qq.com>
> ---
>  drivers/net/can/rockchip/rockchip_canfd-core.c | 14 ++++++++++++++
>  drivers/net/can/rockchip/rockchip_canfd-rx.c   |  5 ++++-
>  drivers/net/can/rockchip/rockchip_canfd.h      | 12 +++++++++++-
>  3 files changed, 29 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net=
/can/rockchip/rockchip_canfd-core.c
> index 29de0c01e..3c2480785 100644
> --- a/drivers/net/can/rockchip/rockchip_canfd-core.c
> +++ b/drivers/net/can/rockchip/rockchip_canfd-core.c
> @@ -50,6 +50,15 @@ static const struct rkcanfd_devtype_data rkcanfd_devty=
pe_data_rk3568v3 =3D {
>  		RKCANFD_QUIRK_CANFD_BROKEN,
>  };
> =20
> +/* Tests on the rk3588v2 reproduce Erratum 5, but not
> + * Erratum 6 or the special CAN-FD frames that trigger Error Interrupts
> + * on rk3568v2/rk3568v3.
> + */

Here I could reproduce erratum 6 though:
https://lore.kernel.org/lkml/20260630164336.3444550-4-heiko@sntech.de/


[...]

> diff --git a/drivers/net/can/rockchip/rockchip_canfd-rx.c b/drivers/net/c=
an/rockchip/rockchip_canfd-rx.c
> index 475c0409e..fe64db373 100644
> --- a/drivers/net/can/rockchip/rockchip_canfd-rx.c
> +++ b/drivers/net/can/rockchip/rockchip_canfd-rx.c
> @@ -281,7 +281,10 @@ rkcanfd_rx_fifo_get_len(const struct rkcanfd_priv *p=
riv)
>  {
>  	const u32 reg =3D rkcanfd_read(priv, RKCANFD_REG_RX_FIFO_CTRL);
> =20
> -	return FIELD_GET(RKCANFD_REG_RX_FIFO_CTRL_RX_FIFO_CNT, reg);
> +	if (priv->devtype_data.model =3D=3D RKCANFD_MODEL_RK3588V2)
> +		return FIELD_GET(RKCANFD_REG_RX_FIFO_CTRL_RX_FIFO_CNT_RK3588, reg);
> +
> +	return FIELD_GET(RKCANFD_REG_RX_FIFO_CTRL_RX_FIFO_CNT_RK3568, reg);
>  }
> =20
>  int rkcanfd_handle_rx_int(struct rkcanfd_priv *priv)
> diff --git a/drivers/net/can/rockchip/rockchip_canfd.h b/drivers/net/can/=
rockchip/rockchip_canfd.h
> index 93131c7d7..f6105b904 100644
> --- a/drivers/net/can/rockchip/rockchip_canfd.h
> +++ b/drivers/net/can/rockchip/rockchip_canfd.h
> @@ -214,7 +214,8 @@
>  #define RKCANFD_REG_TXEVENT_FIFO_CTRL_TXE_FIFO_ENABLE BIT(0)
> =20
>  #define RKCANFD_REG_RX_FIFO_CTRL 0x118
> -#define RKCANFD_REG_RX_FIFO_CTRL_RX_FIFO_CNT GENMASK(6, 4)
> +#define RKCANFD_REG_RX_FIFO_CTRL_RX_FIFO_CNT_RK3568 GENMASK(6, 4)
> +#define RKCANFD_REG_RX_FIFO_CTRL_RX_FIFO_CNT_RK3588 GENMASK(7, 5)

Oh, didn't see this when doing my variant of the support, so cool that you
found this.


Heiko



