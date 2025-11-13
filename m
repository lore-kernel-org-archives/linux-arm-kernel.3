Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82498CD5BBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 10:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPfvqiPK0XBbGB7jgxZcnmtoFkef5Esy2Ux2OKDfXoY=; b=dr34yiAU6Uf9QlKGQiojbDIdBV
	oHMPoR3SMsDQ6g1+dKbpxT8/ei4BYvArNG0J414DljIHto9c/7pfIVP2+I6DeUKTnDcUazJjRd/IL
	f8offB9HHN4gimUdZwkCyVkWNNnATfAjfmt1DmV3FCliuPXuwSGYPsOv73jI4EtbGX0IiTPIeQQ5H
	Qef8FdSEanRHI4u2DPhXeTlk6Ept+PPi+9yhlKJ3fxAFq0LrxoBOH5Iu++/4uVG/kw9FyuHYmKQ7Z
	k7pMOPg7NLZuP3wOUR9V5HNjwIxC5ou0KMAH2vo+9xh/n2fDkqlXWj0oBdZA8vAkdp3mIc8k1d9hL
	d50iaGPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUrq-0000000AJk2-0clk;
	Thu, 13 Nov 2025 10:47:54 +0000
Received: from mx-relay50-hz3.antispameurope.com ([94.100.134.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUrl-0000000AJj9-02xn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 10:47:53 +0000
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=cPfvqiPK0XBbGB7jgxZcnmtoFkef5Esy2Ux2OKDfXoY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763030847;
 b=gEsS2e3FKqD+xQG7azxqPLnw528f04MO2TVo89ekyexrmfSj+mCOnmQA31ezu23Phmv9qSCn
 p3K4hkS4gnFtPGkvRvEEHccwLXRJ6dr+Sdm7b8pUsjG5u6DaYEjP9D3oxmdxrQFmrLpbzGy4lOH
 rYMMo+wMPIREDik2WeOIzc12a7Wj+8h4XzYvtTRJmwPS0IVQzTD+Xf5RG9pO4ZEjfjH6YL8VCmd
 tcCX9M15OfV0aWO1UIK4hmXqE8bW9Ql48/L4vQ8XweYfUaL7kvlR90pwfuCbtfGa19P/7XfKASr
 dDbiKgB8E+pOOTW1xtQFUN2iy6mV8+kBPsZrR7ceWTORA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763030847;
 b=fpOZ1EeESJ5R66oXZT1GCDRsHho6V5Mdmg0pNLxn67fOkeKzTLd9T/nHIJIrNLX+Q98yMu+o
 PP+C2scDSzwy7fcYzH2p6ZtWu4CWMwZY8CeVJztA5VfJNvsmB6Yo3U8UXgopr+DUjSpmBv51NXg
 Lb+5sUt/1f4mWLT9YogoByfbZKOwM5oDSEkpW/E2xtIcHONS1TQkRHU65q6Qh7O6pql1MFhOJvB
 1YyIq3izOl2VaWfbK2/QfNT8hugrpylGX9y1BTsahXvT2epXmi8XywDqcsqkZvMIWsgQAKS9cP3
 l+DOxPBFcOH6/c+bBWl/gpg5/bYz8TP394Z+KgSgM7V2g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Thu, 13 Nov 2025 11:47:27 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 7250ECC0A1D;
	Thu, 13 Nov 2025 11:47:14 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Liu Ying <victor.liu@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2 1/1] drm: lcdif: Use dev_err_probe()
Date: Thu, 13 Nov 2025 11:47:13 +0100
Message-ID: <3410946.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251020095846.116202-1-alexander.stein@ew.tq-group.com>
References: <20251020095846.116202-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4d6cR73sMNz2nGtR
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 8e80b3bb434ae492471754dc7e2ef656
X-cloud-security: scantime:2.077
DKIM-Signature: a=rsa-sha256;
 bh=cPfvqiPK0XBbGB7jgxZcnmtoFkef5Esy2Ux2OKDfXoY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763030846; v=1;
 b=DwaiW5zEk73383qG1EfxMMqiO1Q729emauU0THrUYkRSo4TQ3za30cTOxVuDQnY1zZh0YNDk
 bUe7gV4dZD+ARqWZB+Z26i7WjFfgz5y7MeTXLGzBen/RAwfndHvGCkchsIB0WE85bfkNt4EdQdB
 HeyzjjL7EDVnJmxcS9M5+bv+Ze4GfV7z9HHDUZp2f1lYBLduwo8iXf1JgLj/4dPGbUXosR9KZct
 QH6rLURJX94AKycPEpNU8WXs7fh77uY38IuM3tDziK5l+ThogQVTb76Ow+l/V6p3n0HYeMx1h2r
 WUuzpZg99qsYEVEcqmQPlgkbYzPtZN5g7phlOyUeFUD6A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_024749_411907_25BB41DE 
X-CRM114-Status: GOOD (  15.52  )
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

Am Montag, 20. Oktober 2025, 11:58:45 CET schrieb Alexander Stein:
> Use dev_err_probe() to add a reason for deferred probe. This can
> especially happen on lcdif3 which uses hdmi_tx_phy for 'pix' clock
>=20
> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Any other feedback?

Thanks and best regards
Alexander
> ---
> Changes in v2:
> * Collected Liu's and Marcos' R-b
>=20
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lc=
dif_drv.c
> index fcb2a7517377e..47da1d9336b90 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -149,15 +149,17 @@ static int lcdif_load(struct drm_device *drm)
> =20
>  	lcdif->clk =3D devm_clk_get(drm->dev, "pix");
>  	if (IS_ERR(lcdif->clk))
> -		return PTR_ERR(lcdif->clk);
> +		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk), "Failed to get pix=
 clock\n");
> =20
>  	lcdif->clk_axi =3D devm_clk_get(drm->dev, "axi");
>  	if (IS_ERR(lcdif->clk_axi))
> -		return PTR_ERR(lcdif->clk_axi);
> +		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_axi),
> +				     "Failed to get axi clock\n");
> =20
>  	lcdif->clk_disp_axi =3D devm_clk_get(drm->dev, "disp_axi");
>  	if (IS_ERR(lcdif->clk_disp_axi))
> -		return PTR_ERR(lcdif->clk_disp_axi);
> +		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_disp_axi),
> +				     "Failed to get disp_axi clock\n");
> =20
>  	platform_set_drvdata(pdev, drm);
> =20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



