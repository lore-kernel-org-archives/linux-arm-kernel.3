Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC8BCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 15:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFtRRdSk6EXHxiRkGSoXab9HwZbgtylqXqkki/BPNC0=; b=WkpC9/YfErw1CW5IgLKo2yv6U8
	gt4LfsbjVMfWIhoETRSzfZzKLNq/YJ5LFRly93w3jdt6iaaGnnooMM1dIlTnFfelD7VmpjsB1bTSW
	vyi4qae/b0irVqWgUwg7CntJu1TB8galZxAwKZ+7ltPk640ET0q0s1zdqIvK3tMPw8gsJ/eTcd0nV
	7j0tyml+UAGXPqm8zGKEXx4fHnlJswFoIAGcNJhDhLYk6u3RrMrX2VjGqN2wXYt9WIUKRSswurcR9
	j/yfjf71KW3xymjRYhOT28AVoC4EXRqQrm2ZDNpBIhsh9Li+yPSKlNy/AZ11PBN+yuDniM3zdZ0V0
	2Wktr+rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTmQ-0000000326B-3UrG;
	Fri, 22 Aug 2025 15:34:15 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upM2a-00000001nRS-0OCN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 07:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1755847104; x=1787383104;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PFtRRdSk6EXHxiRkGSoXab9HwZbgtylqXqkki/BPNC0=;
  b=Cw3PQuB1/Jiyo1nufG3d4IPuBC6sH9TWnxD3Ul8uWBEbOV7PD+L9MeMI
   HG9qtAvKf6p1/oYnB5xQx9EgrHN4SHGq2vAN0XNncEyRMzi17tji6kLQy
   TN6lrCT2wgBOYQq5tg4MlZm2t9TERSy4NCr5JxaAffkyVFLre/X9FBQtd
   Cfmfwl3Yp9SQ3JBt5cKWsYLV7DeveOU92V89kh4glIlTE9eXjT9cFDv6H
   a6LB53DChsGUu/rCmH3z9P+lGt8MfmO3542sLfjLKoMgElyBy4IJNGiv4
   LBjtc4Jbb4BJGj1qZVxIRbIxqh/YtfeYVeN4Y9+RlZJL/6VIC1+mdgHo3
   w==;
X-CSE-ConnectionGUID: jdtU2+6TTs+ljT2Y7Oo4iA==
X-CSE-MsgGUID: 66aOcjvFQSqa2upgXwJG5Q==
X-IronPort-AV: E=Sophos;i="6.17,309,1747692000"; 
   d="scan'208";a="45860505"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 22 Aug 2025 09:18:19 +0200
X-CheckPoint: {68A819BB-10-AD8F5F64-F0EACAA5}
X-MAIL-CPID: F8CEB0701F16A335037C7670FF115625_1
X-Control-Analysis: str=0001.0A002118.68A81968.004B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63873164EDC;
	Fri, 22 Aug 2025 09:18:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1755847094;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PFtRRdSk6EXHxiRkGSoXab9HwZbgtylqXqkki/BPNC0=;
	b=bflPl7O1lmdOWGFy1KCkTbLUjNvN3q0QihZmaWQnsB1oondb/nt7RRFoshqeyI7X5qPzfw
	qnylA7HzM40ttwRwy/UEbh0LvxaHdCeBSyuxGn8KRjVEFgvJXKpApQIxSq36DjoHUKxGkj
	T+X+sxy6yIFMa6JseA8+DW7D7yyYI7+f9Z1gvfddrLZJWDQQOmmoEydhPNwADgx4b88o9y
	GPYvtFvddBqC+iclHNmp7jCT5/CqAozX7aTg1nvis0Sc7op8raV104hMSr/8BByrk2mUxP
	rD267CXeLNhameyaAcnaguDd2CHsofZY5AT1skCb/dlP38XqaIaAf3NLLnnrCA==
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
Subject: Re: [PATCH v2 04/12] media: imx-mipi-csis: Shorten name of subdev state
 variables
Date: Fri, 22 Aug 2025 09:18:10 +0200
Message-ID: <5040209.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250821000944.27849-5-laurent.pinchart@ideasonboard.com>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
 <20250821000944.27849-5-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_001824_625052_A634F048 
X-CRM114-Status: GOOD (  17.67  )
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

Am Donnerstag, 21. August 2025, 02:09:36 CEST schrieb Laurent Pinchart:
> Rename subdev state parameters passed to subdev operations from sd_state
> to state. This standardizes the naming of the subdev state variables
> through the driver, and helps shortening lines.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Maybe add a 'No functionality change', it's just rename. Either way:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/p=
latform/nxp/imx-mipi-csis.c
> index 0f0863011230..894d12fef519 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -996,7 +996,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd,=
 int enable)
>  }
> =20
>  static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
> -				    struct v4l2_subdev_state *sd_state,
> +				    struct v4l2_subdev_state *state,
>  				    struct v4l2_subdev_mbus_code_enum *code)
>  {
>  	/*
> @@ -1009,7 +1009,7 @@ static int mipi_csis_enum_mbus_code(struct v4l2_sub=
dev *sd,
>  		if (code->index > 0)
>  			return -EINVAL;
> =20
> -		fmt =3D v4l2_subdev_state_get_format(sd_state, code->pad);
> +		fmt =3D v4l2_subdev_state_get_format(state, code->pad);
>  		code->code =3D fmt->code;
>  		return 0;
>  	}
> @@ -1026,7 +1026,7 @@ static int mipi_csis_enum_mbus_code(struct v4l2_sub=
dev *sd,
>  }
> =20
>  static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
> -			     struct v4l2_subdev_state *sd_state,
> +			     struct v4l2_subdev_state *state,
>  			     struct v4l2_subdev_format *sdformat)
>  {
>  	const struct csis_pix_format *csis_fmt;
> @@ -1038,7 +1038,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
>  	 * modified.
>  	 */
>  	if (sdformat->pad =3D=3D CSIS_PAD_SOURCE)
> -		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
> +		return v4l2_subdev_get_fmt(sd, state, sdformat);
> =20
>  	if (sdformat->pad !=3D CSIS_PAD_SINK)
>  		return -EINVAL;
> @@ -1076,7 +1076,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
>  			      &sdformat->format.height, 1,
>  			      CSIS_MAX_PIX_HEIGHT, 0, 0);
> =20
> -	fmt =3D v4l2_subdev_state_get_format(sd_state, sdformat->pad);
> +	fmt =3D v4l2_subdev_state_get_format(state, sdformat->pad);
> =20
>  	fmt->code =3D csis_fmt->code;
>  	fmt->width =3D sdformat->format.width;
> @@ -1090,7 +1090,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
>  	sdformat->format =3D *fmt;
> =20
>  	/* Propagate the format from sink to source. */
> -	fmt =3D v4l2_subdev_state_get_format(sd_state, CSIS_PAD_SOURCE);
> +	fmt =3D v4l2_subdev_state_get_format(state, CSIS_PAD_SOURCE);
>  	*fmt =3D sdformat->format;
> =20
>  	/* The format on the source pad might change due to unpacking. */
> @@ -1130,7 +1130,7 @@ static int mipi_csis_get_frame_desc(struct v4l2_sub=
dev *sd, unsigned int pad,
>  }
> =20
>  static int mipi_csis_init_state(struct v4l2_subdev *sd,
> -				struct v4l2_subdev_state *sd_state)
> +				struct v4l2_subdev_state *state)
>  {
>  	struct v4l2_subdev_format fmt =3D {
>  		.pad =3D CSIS_PAD_SINK,
> @@ -1147,7 +1147,7 @@ static int mipi_csis_init_state(struct v4l2_subdev =
*sd,
>  		V4L2_MAP_QUANTIZATION_DEFAULT(false, fmt.format.colorspace,
>  					      fmt.format.ycbcr_enc);
> =20
> -	return mipi_csis_set_fmt(sd, sd_state, &fmt);
> +	return mipi_csis_set_fmt(sd, state, &fmt);
>  }
> =20
>  static int mipi_csis_log_status(struct v4l2_subdev *sd)
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



