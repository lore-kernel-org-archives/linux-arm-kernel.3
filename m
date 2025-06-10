Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4764C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 07:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UniAvZESTfn+wymekpIinnCdI455GXxoi6+/rhJB6I=; b=W+b2dMgtfirqqISAL16VBV1oNC
	y9wlF71JcV2kU3zM1XIZdKu+MdVUsdhReSA36q1gqq8+salHRobJJZXmsqKH30tZc7wEw6mVETPXV
	S4P17h7AspZTOETLRzYbHd4fnxh+xCQmvYpxBGEL0adynhy9aT4NPxsCbFRcnIW7e9UDenH8W4t40
	UgyAyCElqR5BgSubpT14FpgcUJSHwV1Tp2hbmaYYcvtG+4tGX2MZcBYyeAr8IhY7iJG6O8sBVPM+j
	y97RqxPNfhLCcTi0vhsLrTY4PzVUHuDZE8MFeahaANTJQwrj/apiXGDKrkPZtZY64R8HL7+WNxZBI
	yKsN9psg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtGn-000000060bx-2QCp;
	Tue, 10 Jun 2025 07:19:41 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtEd-000000060Qi-3G8d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 07:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1749539847; x=1781075847;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5UniAvZESTfn+wymekpIinnCdI455GXxoi6+/rhJB6I=;
  b=K7x817UNCJ6WP36FkNyyUNbCjsuDUqSWjIUeLWxQfL+YQfeAg2p0tMtR
   BWd/C7GNfz2yc4sYhHXuHRo43IvQrmnx8rgCM9Wt0lFtm3MHPyicf/et4
   0dEqea9Jtop/JnZ4HxYps3Z5vwUfanpWeJ0+pyzMtpv3RyGdjBtLmkHqi
   tEubuT0TeGZyTZX4WztgdNtsqEIFde8i21R7TS5gITc3/6pssSW/qGZT5
   ragRjtj35dhdfXTN1GfwJHH0o1OWYGWpxnWhcxu4UdYCBhFA8jSVCoLdf
   dimw+HmAcVHRqLxnZI7jv+K/WGbyYXlC0p8N36VLKOln2VV3EFXKbwPmN
   g==;
X-CSE-ConnectionGUID: 72KKQk/iQpGdmGt2S3iHxQ==
X-CSE-MsgGUID: kcsNPqIcT7i6fBLfqngXGw==
X-IronPort-AV: E=Sophos;i="6.16,224,1744063200"; 
   d="scan'208";a="44535224"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Jun 2025 09:17:25 +0200
X-CheckPoint: {6847DC05-1E-569BE4A0-ECC5EE08}
X-MAIL-CPID: 6C1A0426CFBAA0EE75CFBB7B038D90B1_3
X-Control-Analysis: str=0001.0A006372.6847DC2D.0002,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 827F4164205;
	Tue, 10 Jun 2025 09:17:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1749539841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5UniAvZESTfn+wymekpIinnCdI455GXxoi6+/rhJB6I=;
	b=R6H7mn5wx8Yy1iyCyKn5ow/XqlgymnT62kYF+4BvsSfoR27tqm8c7A4pnUvpGXztHfePgM
	xADbNnPcy2kdOyMtcA3gSUFmyUM+0QR87TGSKmPrEJbdXMCrmnu1LdmiDr/9EEbtckPQcb
	0GjHa1XG1YjD4gVASESHYz9Ju4mi9jJkcN/Dwo8C2s4/axza7JtmEn1ksAk0h6no3reGOV
	eQqSLia3zNlF76r87KWnrg+u9LxiEP9qp/Mkr3uqxt/OAk9x/dECdVyGs0lrlFVX9n2hRr
	/bHuKKxJ+jb5h1GzAQKpI0IQ8c9aZ3tzILA5aJxWAf1QG2P6JJ0CiSm8N0ZwOA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>,
 Purism Kernel Team <kernel@puri.sm>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/8] media: imx-mipi-csis: Log per-lane start of transmission
 errors
Date: Tue, 10 Jun 2025 09:17:20 +0200
Message-ID: <5020258.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250608235840.23871-4-laurent.pinchart@ideasonboard.com>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_001728_120932_927A9417 
X-CRM114-Status: GOOD (  13.49  )
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

Hi Laurent,

thanks for the patch.

Am Montag, 9. Juni 2025, 01:58:35 CEST schrieb Laurent Pinchart:
> The CSIS has per-line start of transmission error interrupts. Log them
> all, instead of only the first data lane.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/p=
latform/nxp/imx-mipi-csis.c
> index b652d59851c2..e27467e6372f 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -100,7 +100,7 @@
>  #define MIPI_CSIS_INT_SRC_NON_IMAGE_DATA	(0xf << 28)
>  #define MIPI_CSIS_INT_SRC_FRAME_START		BIT(24)
>  #define MIPI_CSIS_INT_SRC_FRAME_END		BIT(20)
> -#define MIPI_CSIS_INT_SRC_ERR_SOT_HS		BIT(16)
> +#define MIPI_CSIS_INT_SRC_ERR_SOT_HS(n)		BIT((n) + 16)
>  #define MIPI_CSIS_INT_SRC_ERR_LOST_FS		BIT(12)
>  #define MIPI_CSIS_INT_SRC_ERR_LOST_FE		BIT(8)
>  #define MIPI_CSIS_INT_SRC_ERR_OVER		BIT(4)
> @@ -241,7 +241,10 @@ struct mipi_csis_event {
> =20
>  static const struct mipi_csis_event mipi_csis_events[] =3D {
>  	/* Errors */
> -	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error" },
> +	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(0),	"SOT 0 Error" },
> +	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(1),	"SOT 1 Error" },
> +	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(2),	"SOT 2 Error" },
> +	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(3),	"SOT 3 Error" },
>  	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error" },
>  	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error" },
>  	{ false, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error" },
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



