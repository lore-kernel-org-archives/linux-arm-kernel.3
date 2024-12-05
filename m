Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AA4E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgpqTYmx1JwJV2MXhL2h0e8cSJoFw6QERgxshp0L/wQ=; b=H282jGBJVVUHtkZuZQJrQVVF5a
	6eqWptLqfsklLUwwRjTXEdGXfTFsg/bvXZDQKy5Ca0vIFqUdCbePnlRlFePIxlHofT7R7CAGVHMQo
	IF4sAv020NRdj1eyGh2a5FIQLe6jXWMz73qy+FYeOA+gXhZ01eNTdU8rmWqR0FfH8vEZeqnEQza6P
	LnSm0JEP1PX0Q3cYdqUltC4FSa+7QijnhiDvD6EZtkZy3FsqrDCa0MWzjQ+UnoKFMPDCTndGCSdvu
	7ZY1vfSdcOlijPjrII21qDGyrr8nni05yRB7r7o7tmQjUtIReLeZP9VbIYLS2ga8DSLA4BlnJZac5
	gxEhyPwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDhZ-0000000GWJ0-2ewf;
	Thu, 05 Dec 2024 15:23:37 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDgW-0000000GW2q-49CO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:22:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1733412153; x=1764948153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OgpqTYmx1JwJV2MXhL2h0e8cSJoFw6QERgxshp0L/wQ=;
  b=UCE2bKeroNkgMIM1TQc1O5JQXtGcel3ZeZHXxp8s60zoUipgU68PfnxG
   egn270suPQJj2EVrl79yGIOcOLIEPDRt8GcUdLGc79KA5MWNB857zw003
   r6GIV84aPGNpydLfoOsOc15wAd+6cW7V9LWN5t3ECRRTdGxn2enzIL01Q
   l3HA4jT2SV6igrLXZzxk+cHXqJL4szPPXSgLXC8aLA1Zbroyr9uwReRBF
   4SxeeuouEaM6UyNe4aCa2TeYU6kuOF75u7CDByTrWDZL7DciyNOqzf2iy
   Zo73PaGDAGpVNt9SfhU7ROcpnXTJpW+3ud1sY64vOut2ObW1NmtlBLAUG
   w==;
X-CSE-ConnectionGUID: UHuHdMOHR8eI0Ysd+CRJnQ==
X-CSE-MsgGUID: HUOL6jrqQzyh1aS6IVtEsA==
X-IronPort-AV: E=Sophos;i="6.12,210,1728943200"; 
   d="scan'208";a="40435227"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 05 Dec 2024 16:22:30 +0100
X-CheckPoint: {6751C536-37-86C05612-CA75E1CA}
X-MAIL-CPID: FCDE8C9170E3D42729ED4A0AD7E02C0D_1
X-Control-Analysis: str=0001.0A682F21.6751C537.0039,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 502B6163BB5;
	Thu,  5 Dec 2024 16:22:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1733412146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OgpqTYmx1JwJV2MXhL2h0e8cSJoFw6QERgxshp0L/wQ=;
	b=KHXc9JZXoqdeRsEZnWh0P2KoB3nAhvdjG7ZxHhi2Xl3w/sBB5T89MPHE34iZUVvxyoMME5
	ML7qUzm+CAyupIe4+o7+jDJrLIt1qwEuKrktHkyz/HRLGYrpKr90X2deBlIp4nR59D5qgh
	9pIBOjbeKpl2qtz8QhkW5s8c/O4JeSnWqP52TqhJbvMXOMwl+DeLzMDR0Y4HFiFwC5+3UW
	BQwCqL82hTsAwk7QhdJXIo1Sx1E/uQml8erg4mGT51+d5GrJY04rFF0gQUg2Sitj6Ma9z4
	5ITi7+M3JF6tRYAyJClPpB/liq9cxJjV0ohPX8+1y811NOGP0tVe7b+TgjY1xw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 1/4] media: i2c: imx290: Limit analogue gain according to module
Date: Thu, 05 Dec 2024 16:22:22 +0100
Message-ID: <4950196.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241120-media-imx290-imx462-v2-1-7e562cf191d8@raspberrypi.com>
References: <20241120-media-imx290-imx462-v2-0-7e562cf191d8@raspberrypi.com> <20241120-media-imx290-imx462-v2-1-7e562cf191d8@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_072233_515029_F0D785E4 
X-CRM114-Status: GOOD (  21.00  )
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

Hi Dave,

Am Mittwoch, 20. November 2024, 20:17:03 CET schrieb Dave Stevenson:
> The imx327 only supports up to 29.4dB of analogue gain, vs
> the imx290 going up to 30dB. Both are in 0.3dB steps.

While I agree for 30dB on imx290, my (maybe outdated) Rev0.2 datasheet says
up to 27dB in 0.3dB steps.

Despite that this change looks good.

Best regards,
Alexander

> As we now have model specific config, fix this mismatch,
> and delete the comment referencing it.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index ee698c99001d..da654deb444a 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -176,6 +176,7 @@ struct imx290_model_info {
>  	enum imx290_colour_variant colour_variant;
>  	const struct cci_reg_sequence *init_regs;
>  	size_t init_regs_num;
> +	unsigned int max_analog_gain;
>  	const char *name;
>  };
> =20
> @@ -876,14 +877,10 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  	 * up to 72.0dB (240) add further digital gain. Limit the range to
>  	 * analog gain only, support for digital gain can be added separately
>  	 * if needed.
> -	 *
> -	 * The IMX327 and IMX462 are largely compatible with the IMX290, but
> -	 * have an analog gain range of 0.0dB to 29.4dB and 42dB of digital
> -	 * gain. When support for those sensors gets added to the driver, the
> -	 * gain control should be adjusted accordingly.
>  	 */
>  	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> -			  V4L2_CID_ANALOGUE_GAIN, 0, 100, 1, 0);
> +			  V4L2_CID_ANALOGUE_GAIN, 0,
> +			  imx290->model->max_analog_gain, 1, 0);
> =20
>  	/*
>  	 * Correct range will be determined through imx290_ctrl_update setting
> @@ -1441,18 +1438,21 @@ static const struct imx290_model_info imx290_mode=
ls[] =3D {
>  		.colour_variant =3D IMX290_VARIANT_COLOUR,
>  		.init_regs =3D imx290_global_init_settings_290,
>  		.init_regs_num =3D ARRAY_SIZE(imx290_global_init_settings_290),
> +		.max_analog_gain =3D 100,
>  		.name =3D "imx290",
>  	},
>  	[IMX290_MODEL_IMX290LLR] =3D {
>  		.colour_variant =3D IMX290_VARIANT_MONO,
>  		.init_regs =3D imx290_global_init_settings_290,
>  		.init_regs_num =3D ARRAY_SIZE(imx290_global_init_settings_290),
> +		.max_analog_gain =3D 100,
>  		.name =3D "imx290",
>  	},
>  	[IMX290_MODEL_IMX327LQR] =3D {
>  		.colour_variant =3D IMX290_VARIANT_COLOUR,
>  		.init_regs =3D imx290_global_init_settings_327,
>  		.init_regs_num =3D ARRAY_SIZE(imx290_global_init_settings_327),
> +		.max_analog_gain =3D 98,
>  		.name =3D "imx327",
>  	},
>  };
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



