Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068AECE8D4E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMIhhtle2a2xp6NyKTydE1LVPDYCY/qxlboHNvvD0Mk=; b=C42qCvj8p9rawGwzB5kSeCayeR
	OEljaKWrTPYE6d+rnFPLPweVxV+ak28YjGtSXi43o3jsxIE4W0u+O3ADUVpez7vX4+nBSxqSHhFXJ
	K0ry6WFAl0KRO993CTcFJuWUgj3TGus2jZPIgg+j8Wrkt6mVwduyr59vouaEU79mSxXwW3IPRTGT3
	X1aPVb/qBc/B1E90b/N0K4Va7te7awiMq0GkYsCojj3cBHDcoztif7stkY1fH65NzeIHyzoFJnRKx
	Yf99HHaXoYniok/dGEVU1NvidXxsN8Qj32anIx6p6bIWJzB+QijLXpdth/kepN16uXMvuUxoyaLpk
	TFjhM6EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwFk-0000000CeIo-0S7i;
	Fri, 14 Nov 2025 16:02:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwFi-0000000CeIW-2YGq
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 16:02:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zMIhhtle2a2xp6NyKTydE1LVPDYCY/qxlboHNvvD0Mk=; b=WgRN9znK7j95dC9/A/j4L7elbk
	h9SNgH1O3T74+HAIafBsNj3hJ6R1/QK9C80SqDRAyug5JNr7F5oLG867srMYkoztF4W9jp2OlhxXO
	E32rNk8p/nO+cUcOEVdm8MW7XYQeVLFWPWvJQckZ3aQ9Yqm+ZnwEWVLu0K9mwxOPnePyOpKthfvoV
	I5ifdRHpEk1CAft0j7TvbVmGOc/yRoR4K4fYYV93gcTSgt4syPpR4sOMZrXBHsfwL+z3tXs4ehYK7
	jz21DXEKwNyW9MTV2/R5Fv5ddsQRatjjdSR9XFwEaIcYzpzvpKzGOq9GZRzGyYN0RU/gBpCk8JTos
	Vur3mmfA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvO0-00000002uVo-3bmD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:06:54 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vJwFX-0001tc-Ks; Fri, 14 Nov 2025 17:02:11 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vJwFX-000RjJ-0w;
	Fri, 14 Nov 2025 17:02:11 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vJwFX-00000000Ags-0qAH;
	Fri, 14 Nov 2025 17:02:11 +0100
Message-ID: <8b225c56612ff01845a90388be0945c7d0b3f0d2.camel@pengutronix.de>
Subject: Re: [PATCH v5 4/6] reset: imx8mp-audiomix: Extend the driver usage
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	 <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, Daniel Baluta
	 <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li
	 <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Pengutronix Kernel Team
	 <kernel@pengutronix.de>
Date: Fri, 14 Nov 2025 17:02:11 +0100
In-Reply-To: <20251114133738.1762-5-laurentiumihalcea111@gmail.com>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
	 <20251114133738.1762-5-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_150652_959647_06E7F8BE 
X-CRM114-Status: GOOD (  14.66  )
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

On Fr, 2025-11-14 at 05:37 -0800, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>=20
> Switch to per-device reset map to allow reusing the driver for other NXP
> block control IPs.
>=20
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  drivers/reset/reset-imx8mp-audiomix.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-=
imx8mp-audiomix.c
> index 35df9bd5f71a..d3396f37d1ff 100644
> --- a/drivers/reset/reset-imx8mp-audiomix.c
> +++ b/drivers/reset/reset-imx8mp-audiomix.c
> @@ -24,7 +24,12 @@ struct imx8mp_reset_map {
>  	bool active_low;
>  };
> =20
> -static const struct imx8mp_reset_map reset_map[] =3D {
> +struct imx8mp_reset_info {
> +	const struct imx8mp_reset_map *map;
> +	int num_lines;
> +};
> +
> +static const struct imx8mp_reset_map imx8mp_reset_map[] =3D {
>  	[IMX8MP_AUDIOMIX_EARC_RESET] =3D {
>  		.offset	=3D IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
>  		.bit =3D 0,
> @@ -42,9 +47,15 @@ static const struct imx8mp_reset_map reset_map[] =3D {
>  	},
>  };
> =20
> +static const struct imx8mp_reset_info imx8mp_reset_info =3D {
> +	.map =3D imx8mp_reset_map,
> +	.num_lines =3D ARRAY_SIZE(imx8mp_reset_map),
> +};
> +
>  struct imx8mp_audiomix_reset {
>  	struct reset_controller_dev rcdev;
>  	struct regmap *regmap;
> +	const struct imx8mp_reset_info *rinfo;

Since only rinfo->map is used in imx8mp_audiomix_update(), you could
directly store a

	const struct imx8mp_reset_map *map;


regards
Philipp

