Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64049C83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 07:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yEbAI3opm4LnixMNPD4CJAcS1fuxSWr4Pdo00xuzpFY=; b=zgIF470J0ypGXQ/OF78k3E39m5
	0siszxK65idYwM8GKlrChjGBVJ+mMDejy1vt4sQceJnUgbi36jUzgzliBKPH14zKrAqOqfc6YEJNx
	WRQ+wVfZcTOnhn9tW9EDM3Mk6Mz1MfbVYIl/Rt/+mGUe0iVoKxLNnk8iJMQTRIisUK+H8fhpCnEoC
	6gWD9AMKYFiqNE4OrSoLQa14QarmgTxGsX+9B93NsSirp+QjfjGw6LB1KdmoP3SGqFahSd2KAWZ6A
	c+wgpubnlj1EgaU7qfr3S64QcYYXAE6zzdLrttcu3G1YXnbUvE5g9yj67C3YTct099MzoYwoDDc5W
	R51eu/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWsFK-00000007Xu0-0MxB;
	Wed, 02 Jul 2025 07:51:10 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpp2-00000007G7Q-3oDl;
	Wed, 02 Jul 2025 05:15:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751433352; x=1782969352;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yEbAI3opm4LnixMNPD4CJAcS1fuxSWr4Pdo00xuzpFY=;
  b=jL883FqgrpXYTgfO5nEva22vf5ZLEgMeiEsoUoaHPGm+a25rGBzJwOUU
   tLWw8niG+R2QBtnmmXQpl/2x/zrv9fSHC5m8wxvCPzIcvzht5D2iCtKQw
   eY2gLIP1ujSob83reJuKEMcaH5mfntyKOpFGwz/IKhIFN3Emgi6Q4MrlW
   N+TSsOBKdwnMgRQiIr1/wvuU9iBiK6SavAnouII8vGHYCICiLB6VIk30i
   kdmckdircJ2LFQnMBawPaKBJw1pDtjqHFpKK8NAVFjEhdgPIsd/KNfw43
   P1wCnuWXv6kkfyNVXdr0ezLGeJPM1/0EtmyRhx/T1c3lfMNXM+5Ydp9YV
   Q==;
X-CSE-ConnectionGUID: eIs4CnGHQlWPEHsu6qr5AA==
X-CSE-MsgGUID: ERVeFJYmQfG8spIkNsSiLA==
X-IronPort-AV: E=Sophos;i="6.16,281,1744063200"; 
   d="scan'208";a="44969913"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 02 Jul 2025 07:15:50 +0200
X-CheckPoint: {6864C085-39-B6FA1C9B-ED1A9D03}
X-MAIL-CPID: 7C0C64754A18A0C5244284046CA090FF_2
X-Control-Analysis: str=0001.0A006371.6864C09E.0036,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B95DA1609FC;
	Wed,  2 Jul 2025 07:15:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751433345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yEbAI3opm4LnixMNPD4CJAcS1fuxSWr4Pdo00xuzpFY=;
	b=cF618pGXKLBuYLWJzcG6yKxN6HvPJZ3OnzuLEmANIX9+PK+VYRbMI4jhxz1Vp9MpJjcL4q
	DP/tq6zlyoJctpFzYH6DACLXA9gX9E4ETE1oCbnLP+OdSd0ldDYS7s5U91NVaRVj8YmGhD
	mi0e/RFIx3A+oxWRWYME+JgWfucWZeAmbB3vgaJTZwofsXB6zLTxPbYoWiMdk4LLFPN6Rv
	BimCqaXrReERUtViTT11VULX6JSEgaScb7ZQnJ2+QgOQtVwTVrv4uI3VVOiPNEak+PfBtO
	xwmC5iDg3mkguCVlmoDwq96bJgvsvhTiIScf1lrG5gGikyChpuTjvkDGXsvlhg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 3/7] pmdomain: imx93-blk-ctrl: populate child devices
Date: Wed, 02 Jul 2025 07:15:41 +0200
Message-ID: <2232630.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250701-95_cam-v1-3-c5172bab387b@nxp.com>
References: <20250701-95_cam-v1-0-c5172bab387b@nxp.com>
 <20250701-95_cam-v1-3-c5172bab387b@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_221553_428958_9BFE1F0E 
X-CRM114-Status: GOOD (  12.34  )
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

thanks for the patch.

Am Mittwoch, 2. Juli 2025, 00:06:08 CEST schrieb Frank Li:
> imx93-blk-ctrl is miscellaneous devices, which include reset, clock, MIPI
> CSI2 PHY and DSI's miscellaneous logic. Call of_platform_populate() to
> probe child nodes.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pmdomain/imx/imx93-blk-ctrl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx=
/imx93-blk-ctrl.c
> index 0e2ba8ec55d75..ba2dd8bd143d1 100644
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
> @@ -297,7 +298,7 @@ static int imx93_blk_ctrl_probe(struct platform_devic=
e *pdev)
> =20
>  	dev_set_drvdata(dev, bc);
> =20
> -	return 0;
> +	return of_platform_populate(dev->of_node, NULL, NULL, dev);

Please use devm_ same as in [1], which you Sob'ed as well.

[1] https://lore.kernel.org/all/20250304154929.1785200-4-alexander.stein@ew=
=2Etq-group.com/

> =20
>  cleanup_pds:
>  	for (i--; i >=3D 0; i--)
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



