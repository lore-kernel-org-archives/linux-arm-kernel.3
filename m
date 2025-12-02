Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC0DCFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 07:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuuiLfEXz8Diy3RFrr3LRL4zmPRzauswvFKI19W6Rz8=; b=XydTjygYPxtPOtAuBbGWtKhoin
	7E666fwpVM1VvUAY51y4Mv7X2K0Ct+ZtlVbMTGS1X1Fbuu7N1zpB1z9Ej15nj1n5ykgasDsiVWBCl
	kgAMpuMGIUgqxOvlPa/b+DXSTCcpqlnPSgGIYVyaA4ma6ZoVj6/gni+lNwh4cFxLTloG9Lwb0yftf
	yOxcaqQfaznw3dnPv6k4rHABsiELCuNfyXWbMU0Wh08UDzHiIJljQ/YLnR3k9tYyRodm9Vx3DFYzF
	fCfoag2Q0l40OXX0nb4wl1CcJ+T0S7f0zSsfbuTPVnAzMEESXGGZ2cW2tSkeMh/ERZXMVADMNDswW
	KkkriRHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQL8W-00000004zwg-20mY;
	Tue, 02 Dec 2025 07:49:24 +0000
Received: from mx-relay93-hz2.antispameurope.com ([94.100.136.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQL8R-00000004zw9-360s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 07:49:23 +0000
ARC-Authentication-Results: i=1; mx-gate93-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ZuuiLfEXz8Diy3RFrr3LRL4zmPRzauswvFKI19W6Rz8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1764661745;
 b=aqqZfw6jSre7usw3oN9Vz7/qwpQAUx5oAZoM+Do4S9JYugOwRCNTN8SYAKd7EGzqwqS33CwI
 wIdnePUrwPWjEI7990FetY7Qxi7NeIK2hfX1tp6DsM/tg5Y59DbQbk4Yy5bjoBv5wIa92OqvmLN
 XSJvDpyrKHl2SMJjlSgj3e+qOOoq5ieqIU2nRCcBZC8se6L6VI/o6Oz++QMpjS+z2qn+/aqlyAW
 S9OnO9F7qKFN7bpmlpH/w8Eu76H8yd6tXFrh7/yOZB4FQlhFhV/VTcMQ6MbCtKJyLEK6U/9re2O
 673JW7Dt4eo0ygUlRptqFm0iyJ77cPemJPjn/nWOpDLcA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1764661745;
 b=ooSI79bVWwcwi5VulPuYZdYFe7qpVntkcq8aAwNPBwcqEdfPz7ecVXuAnVFDTOxjQUsL5Fup
 3rEggqZMaFOzp7jFKr3zLxhAVKO8wKv+xPtM/6CAM1Nkq7HvE9CaP54bJVUPPtDUomocaMCAsqx
 QmRTvvYACjViOBpMMkfyQti6m8HvSTfbEu9fE+dHcLff1jBxixQHZ1DfjElH9J4FmQb4yE/YdxF
 tODGkkQWZQKnYUyuyGpqC64kh0s5fGozfbTI06N9jnlTPoZTOSkhn4nqeqCqkBENKMv1iAn9n5x
 PVds6kJqJUbh59b9J6oUt+FGKV7YhrJswCH5fjGlD0o6g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay93-hz2.antispameurope.com;
 Tue, 02 Dec 2025 08:49:04 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 5F6F9CC0E91;
	Tue,  2 Dec 2025 08:48:55 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 1/3] pmdomain: imx93-blk-ctrl: cleanup error path
Date: Tue, 02 Dec 2025 08:48:54 +0100
Message-ID: <2812632.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251201-v6-18-topic-imx93-blkctrl-v1-1-b57a72e60105@pengutronix.de>
References: <20251201-v6-18-topic-imx93-blkctrl-v1-0-b57a72e60105@pengutronix.de>
 <20251201-v6-18-topic-imx93-blkctrl-v1-1-b57a72e60105@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-body-digest: 8acd2ce67e20b48317200392c5473c1b
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay93-hz2.antispameurope.com with 4dLCZc0Cw6z4Qbbv
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 49e900fe4f7bb522495f22f55c5fbd5b
X-cloud-security: scantime:2.076
DKIM-Signature: a=rsa-sha256;
 bh=ZuuiLfEXz8Diy3RFrr3LRL4zmPRzauswvFKI19W6Rz8=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1764661744; v=1;
 b=F5UF8y6qj0pgrwYP2d4gaUscXphCsdAk8qD2HjRiIg8bku1D2dsAxwboQ3n3lKw2pdgdD305
 BAqT05grU3jTTN8rurCbmoXEQtO0a7YaWGeF6aB6Dm+y1wYgWFsnQvhdB2iJA/+DzgIY11/62Lm
 emcNKpcSIHLs5dPc6dn1QUGrbUhk7sL5ExXzE4J4AIAFS+MGaHl86Imsr//INHYXJjfvV2htCYL
 c7XrZPdBxB9O2cD9haaLWpnK7YxUKopnWU3DrPoNHrYX0ldp132puLugj3HIDOlEDYG5xvcSHCr
 VrkgvlCirm4XpuyEISiaXXq0kPGAxlmPxNL7qFSTUL4vg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_234920_352022_E2E086F4 
X-CRM114-Status: GOOD (  15.39  )
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

Am Montag, 1. Dezember 2025, 18:12:05 CET schrieb Marco Felsch:
> Call dev_err_probe() directly during return to make the code more
> compact.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/pmdomain/imx/imx93-blk-ctrl.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx=
/imx93-blk-ctrl.c
> index e094fe5a42bf646c712f3eca4e66a313fa5a914c..2aa163aef8de4ee901b9cde76=
ce2aad246c8c08a 100644
> --- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
> @@ -240,10 +240,8 @@ static int imx93_blk_ctrl_probe(struct platform_devi=
ce *pdev)
>  	bc->num_clks =3D bc_data->num_clks;
> =20
>  	ret =3D devm_clk_bulk_get(dev, bc->num_clks, bc->clks);
> -	if (ret) {
> -		dev_err_probe(dev, ret, "failed to get bus clock\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get bus clock\n");
> =20
>  	for (i =3D 0; i < bc_data->num_domains; i++) {
>  		const struct imx93_blk_ctrl_domain_data *data =3D &bc_data->domains[i];
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



