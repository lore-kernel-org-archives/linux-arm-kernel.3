Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3086DC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 09:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6ui2A06+HFUXrzVCYdCQ6l5hGM3pg2YROn2TeV4NgA=; b=1eo4tfQR0JoAcvDlTWOOLeBSlt
	iXfPwB7yC24ToAmzwfD3frdsdWCF2s2+YlmL/xMRrPwAcINMhPwQ8H6IJYDGL+qbZZnBIFUDEDyM8
	6H4tGLmcYsfM9pw1/SQvzo8+TtyPse9MaGyToay3Myec6dtKoeKvZgdfDtGGyiERS1qN0tPZK6CIU
	FzsHX4I0QoNqoQd+v8sPkg7ZroBTVXwbHyxMO1fSCivTefak+CTnaNjOr3ck8IeO7F/A3S3jm0+FA
	PpipqOTJxdw3wZbCqNyk3avstRw2/9MYNxdV+iKpQs8KWFMYtxYRvfB7KAVEQ/gDG57K7koEcuR73
	GPxcWlgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKCd-00000007acG-32WW;
	Tue, 18 Feb 2025 09:47:43 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJwq-00000007X4U-0aEX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 09:31:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJwo-0002Ll-Ee; Tue, 18 Feb 2025 10:31:22 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJwo-001YwO-0V;
	Tue, 18 Feb 2025 10:31:22 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJwo-0003RV-0F;
	Tue, 18 Feb 2025 10:31:22 +0100
Message-ID: <f8201731e9c5f590e0f60751a6bb31083b77a372.camel@pengutronix.de>
Subject: Re: [PATCH 4/5] reset: imx8mp-audiomix: Add support for DSP
 run/stall
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org, 
	mathieu.poirier@linaro.org
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, 
	linux-remoteproc@vger.kernel.org, iuliana.prodan@nxp.com, 
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, Frank.Li@nxp.com, 
	krzk@kernel.org
Date: Tue, 18 Feb 2025 10:31:21 +0100
In-Reply-To: <20250218085712.66690-5-daniel.baluta@nxp.com>
References: <20250218085712.66690-1-daniel.baluta@nxp.com>
	 <20250218085712.66690-5-daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_013124_175072_7D4E01B8 
X-CRM114-Status: GOOD (  16.44  )
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

On Di, 2025-02-18 at 10:57 +0200, Daniel Baluta wrote:
> We can Run/Stall the DSP via audio block control bits found in audiomix.
> Implement this functionality using the reset controller and use assert
> for Stall and deassert for Run.
>=20
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/reset/reset-imx8mp-audiomix.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-=
imx8mp-audiomix.c
> index 8cc0a6b58cbc..ee56d52a7278 100644
> --- a/drivers/reset/reset-imx8mp-audiomix.c
> +++ b/drivers/reset/reset-imx8mp-audiomix.c
> @@ -15,10 +15,14 @@
>  #define IMX8MP_AUDIOMIX_EARC_RESET_MASK		0x1
>  #define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	0x2
> =20
> +#define IMX8MP_AUDIOMIX_DSP_OFFSET		0x108
> +#define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	0x20
> +
>  #define IMX8MP_AUDIOMIX_EARC		0
>  #define IMX8MP_AUDIOMIX_EARC_PHY	1
> +#define IMX8MP_AUDIOMIX_DSP		2
> =20
> -#define IMX8MP_AUDIOMIX_RESET_NUM	2
> +#define IMX8MP_AUDIOMIX_RESET_NUM	3

See patch 2, this could be removed.

> =20
>  struct imx8mp_reset_map {
>  	unsigned int offset;
> @@ -37,7 +41,11 @@ static const struct imx8mp_reset_map reset_map[IMX8MP_=
AUDIOMIX_RESET_NUM] =3D {
>  		.mask	=3D IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
>  		.active_low =3D true,
>  	},
> -

This belongs in patch 2.

> +	[IMX8MP_AUDIOMIX_DSP] =3D {
> +		.offset	=3D IMX8MP_AUDIOMIX_DSP_OFFSET,
> +		.mask	=3D IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK,
> +		.active_low =3D false,
> +	},
>  };
> =20
>  struct imx8mp_audiomix_reset {

Otherwise,
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

