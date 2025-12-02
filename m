Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B06D116F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 07:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7axZz2df+9J33mOBW3vXS7fIUw+GxQw5eU/LsYk4ww=; b=VO75970hPI7X9QbhLBdAArPXWP
	NY92gacKsXDw0nOgrjZPJ4WB18i3yEDIj334zmxvHq+rHt4CzaBUrBhJfApIAWZiBnrw1ks60LdgK
	kAb44dwteRcSg3H1RjML9iRlJcUcVWvhpalcfJUPV76zIwgnhdZtd3Vt2E75iZfzfhdKoRdom84Ww
	+zuQY913Tyu8K3dXPklbBtNwXUE1nH2BnLzi6CW34HlGeJ8Aefq+9/jyXyQO5yBA8H8r/bHVZZwAL
	hpW1ojFNMgpat4e7Zj5CHWY8sSuUz9ITgO429jD235EgQttOIaCatnDDYAIqGfdHCtbdqDnPQ6YbA
	oNzY1qVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQL8Y-00000004zxS-3ETI;
	Tue, 02 Dec 2025 07:49:26 +0000
Received: from mx-relay09-hz2.antispameurope.com ([83.246.65.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQL8W-00000004zwZ-1CWK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 07:49:25 +0000
ARC-Authentication-Results: i=1; mx-gate09-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=T7axZz2df+9J33mOBW3vXS7fIUw+GxQw5eU/LsYk4ww=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1764661751;
 b=ZyUmR2gpL95xfA1MQivi//pTvKfhpnPE+nE2dLN5SFJiebBKHuq8l+SmJk7WoxwqLURoh/1b
 y2bpNHsvMwRgMf0rg5jpF93UwQXFX/GON9JnbqIG3ty9RY+HikjA8rfzsvE4jSfRttDcjWGzjX7
 ZtXOaAf9YxAU4qjT1kkKSeFN9ll8zE1Bg0v3jZDsnXWvD/WL9cUzRwbcIOSwftyiX4R2WCMQxBV
 qtZuC5oGJhw2UFy2vfJLVo7iQu7KRlFBoRIC85KknjzQ9pIFQrnKZR9a67C4cbDPNweF86LQ/Vz
 Rj958x6U057zrROkx43pnrfy0Sm2m12UTugAdRJDkotig==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1764661751;
 b=rQtUGUiBmAvqevAeY9PT7zMk4eRI8DXuibOAvhvzrYDhVqgOh1t+R3lA3II9+zkG/0JPI4rj
 0K5A41bVk+FyZB2k/lFlXo4iT1AZGVKJWr1BriP56vefYtwa40ICRRmiPHZ7P5py1ECXZBzkxL9
 2eCv7ibbPSSGhLApYXpvsvVo+snFPW0NC2Bwql3AQx/hOW8vzGiXKbE+pRr2S51ayS+u7efdoB8
 Y1v/xpq3WZp9q/nP25rCBEZL+6jfv8C2m1hhcjr2xZFSim/HEOtlz+06wMlspmXQzhjYor+QZkc
 K2A1WQVh6Bw188Wed6sie2tl93VJtuOlMlluD2j8jApGw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay09-hz2.antispameurope.com;
 Tue, 02 Dec 2025 08:49:11 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 0FBFA220D91;
	Tue,  2 Dec 2025 08:49:02 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 3/3] pmdomain: imx93-blk-ctrl: add support for optional subnodes
Date: Tue, 02 Dec 2025 08:49:01 +0100
Message-ID: <5948751.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251201-v6-18-topic-imx93-blkctrl-v1-3-b57a72e60105@pengutronix.de>
References: <20251201-v6-18-topic-imx93-blkctrl-v1-0-b57a72e60105@pengutronix.de>
 <20251201-v6-18-topic-imx93-blkctrl-v1-3-b57a72e60105@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6220726.lOV4Wx5bFT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay09-hz2.antispameurope.com with 4dLCZk50ntz20pyl
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 60d645e73f706042f63d5b5154e78e90
X-cloud-security: scantime:1.971
DKIM-Signature: a=rsa-sha256;
 bh=T7axZz2df+9J33mOBW3vXS7fIUw+GxQw5eU/LsYk4ww=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1764661750; v=1;
 b=M4cMhaIXDnvDFvfmeyCjcj84Del6XptNgle5MqGU5YgZFI2Dd9DJHw2AHMITilIJbEnCt5nd
 d3bvpouGsQRLbwEZb3AeWreiciaslW7prXa1UZxAbgLFkpMZ91KlV1Wwbo/b87EGv3fHwxjDJtv
 TIqTI7LpsTtb+pmUF35GIC4t1XpPulJJpsRiSHJE4aqyMtmazBImO6KqGW+rfxLyMz3Yhpnpncd
 MEIr/0ByQ/jkyAPlqJVx4vLPPnuqHfPd+jsOkflvA98YmmCa0rsapZL7A+WNf0e2blLtcoUDmeZ
 oedat5H2E8bqpmttWZyqBLSH6rM9zlEW6PSJWRLV2cfxg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_234924_469012_8B34BD28 
X-CRM114-Status: GOOD (  18.11  )
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

--nextPart6220726.lOV4Wx5bFT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
Date: Tue, 02 Dec 2025 08:49:01 +0100
Message-ID: <5948751.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
MIME-Version: 1.0

Am Montag, 1. Dezember 2025, 18:12:07 CET schrieb Marco Felsch:
> This particular block can have DT subnodes describing the LVDS LDB, MIPI
> DSI and parallel DPI bridge.
>=20
> Scan for possible sub-devices within the driver, instead of misusing the
> simple-bus to perform the scan.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/pmdomain/imx/imx93-blk-ctrl.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx=
/imx93-blk-ctrl.c
> index 13b0de6dd689cf944e034f7666a4e97b0118e3bd..8f79cabe07face872cb396bfb=
7329c230c4a97fe 100644
> --- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
> @@ -7,6 +7,7 @@
>  #include <linux/device.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> @@ -311,6 +312,10 @@ static int imx93_blk_ctrl_probe(struct platform_devi=
ce *pdev)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to add genpd_provider release c=
allback\n");
> =20
> +	ret =3D devm_of_platform_populate(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to populate blk-ctrl sub-device=
s\n");
> +
>  	return 0;
>  }
> =20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart6220726.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmkume0ACgkQaS+g2M0Z
/iX2lggAjXJx/4qelXC+7BDMe922feOOwInko8Lie9ONTE7qj6W7OFZpk+lw3FzN
uckuThVlH8J/DFn1iGpYrVg3QnZAdh5wsgibfcZm67i894UiianaQOlqgtRpA7Oq
E+Kb9+gVB3vr5Nj9eaghmTFfXHFrVvDAsi7SIhq7oXJLO288+LbacOL5SzJVV/Gt
HvcoZwTu+eudlm0Dlu2/99zRaxHhQqpzSko46NY6Zn+UsR+0kx7FsqgQEwOo/Hg9
h4Uvf6VYLdFs/CYu9L5W1o9Ovov/axFFFkDW67miip5KQO9WpcYppaWSHJ9QxqSL
LS/86Nft9wctDFklkTJPdEYpWZc7xA==
=DoZw
-----END PGP SIGNATURE-----

--nextPart6220726.lOV4Wx5bFT--




