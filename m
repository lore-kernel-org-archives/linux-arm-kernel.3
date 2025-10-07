Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE84FCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 18:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jb3tcA1W3FmGk+8TVe8vqOzjSK1aS/TXDE04iZAy/ws=; b=XmHFmH6QTYM558m/Bc0W/eMu7R
	JWZxIY0dix5HLYGsAClv9xFG3hmy0rEGnOetCCGNGMZHzQNmpgMbmfSrpkfDjtr5liHNa7C6gRV2e
	acMqCy0flKU9v2wgu7FWo7QtTJvQIMn7mSDO5Mrs1rlt0rsDW4rPnJjE5A1pzQy00yj6/vaIWpqp/
	aDMzljfrlhkhbmtVgsCbDAFIijR0YYZIC+1bDjrK3LTBlD38n2hzOhnFTjMCyC2S5SSOvjqIGz+75
	ilRGjCJnjmRuQ5kYtgopvm/PEjXCAzAJgwZs0alW9DvEWapGJIahJLR8OqYvVuu1fy1shlt1kD4mk
	+Gq1hZ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6CSP-00000002asB-11lE;
	Tue, 07 Oct 2025 18:30:41 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6CSN-00000002ar3-0Rqi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 18:30:40 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-796d68804a0so79943336d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 11:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759861838; x=1760466638; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jb3tcA1W3FmGk+8TVe8vqOzjSK1aS/TXDE04iZAy/ws=;
        b=sDiFzyavivg/260NBizSf84xDptR/AfQqrR8zK+T2mStK1kYWE7W5Vlm4Qvjrinm6B
         luySKr3kULdnlsKzsYNRuOhSgMXOg5WZjSDNxEIUkQFYPAY87NSOhuo6s74xr/I/IHi6
         +J3ZN0fW6w6TBaQG9Ct7xqYMy+Df76c8ypnQSzhuwT66XDinMS4pKhi8EWgpVhSEw5JH
         1n3IFXNzeDsOK+BTNyaC/xhliNfjT9dRdEUY8RyFEg+fBwOztyqQSK+NU/mhBREdLTxg
         EeWsjyeWCbrQD4+H8k1Jo08VpvZLNena+CCI20qjbrYT28/wh3IpmUiU+buf1VQTL3iT
         jtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759861838; x=1760466638;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jb3tcA1W3FmGk+8TVe8vqOzjSK1aS/TXDE04iZAy/ws=;
        b=xHTnUvIvYEUCH7Bwl8hfjPrT4vmuaXEtrv4ApQ/q/sMzW41nXw1TS3sMt5T3BE6pdr
         hVKFxksCQCrAzQ8PiW3ksEoKOXIyy4LbdzHipihTJitXORYfsVV0a2BKl9Qf5gi/Umbh
         DRh047CIiwyyH+MWzQ3KiQ8hpWsdttPf0hcFE5S8RVHdOil1rcpqHhH71/IHAmCPUBI7
         ItAhUdumyQjs+t1jRkkSx7P73FfqHIErRxiWQ/DxoRrUzp7/ymPZQnU0Y5IpmBUdTPtC
         Q/yfmxxjgaqnZ7m77J1Vckwn2/NH+mI6TVoRn4LUwewLbJbB34AMrL5GdGafEkKNYZjW
         SyZA==
X-Forwarded-Encrypted: i=1; AJvYcCWC7wwc9pDCF0GGYPWp2SGQ0jpAS2a30Tfmf+rtiuH2kwkxbHPr+oUra88XyZezVuHkQmLGmETDiPbfqa2ESDP4@lists.infradead.org
X-Gm-Message-State: AOJu0YzDzt7QtCeA6QxbvuKGZnRvC2fPa1Jtkz8f+lIIDuM9/ZS7wLRN
	VIHe1K0yK644kJaWcRkQ3oa4c5g4aFA6VSYZx1/FfTEGLdzufHrt38H9uNnmYGwQfJw=
X-Gm-Gg: ASbGnctd9uLc7ikqqH7w3O3Qk86r5jJEKgDDuK++bkmiGNPPuPtwI9oLkadGr5R+LG7
	ICHgVF7Ljoy497kPLBB1hAem9gjY2AeY3cxqNr/2X6tLGp4G4iVLOJYuaXkVNg7PW1/8tGIkJlw
	iCyYmlnnSsbtn/mYIXd1jZdaCdzUdF3wk1x0ibMyNXH7Dn7PQ8wjGTmRjQUgosZGgZ6SZTxlNPR
	pRKrumZMUsRG/Jgx6CDH6OqUKChRsoNESwNaHuSzEGuIase/ip/yyMlm3Zyy1IAGGhY+WRHkZfZ
	muRuLbIPNnuODYXP6qb4EAvle9KehqUKi5b+wgp7pfk01mAIZaHFtTdGhuG4IJQVHQHF/773Kte
	daw+DH4FR3iKGlph6XYe0+Ezzi2xNl2U/aB/3T3fnnlz4JyT8Fv6/
X-Google-Smtp-Source: AGHT+IG7oPC1tRwzaeHEd7zVyRiz9owBfrM5atH+5WnqTKGdGFmZwYm2VcF1mt295mM1N+XGahIowQ==
X-Received: by 2002:a05:6214:c65:b0:78d:ae5d:961e with SMTP id 6a1803df08f44-87b2efc2c83mr5392146d6.44.1759861837282;
        Tue, 07 Oct 2025 11:30:37 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::c41? ([2606:6d00:17:ebd3::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878bb53badbsm144330446d6.21.2025.10.07.11.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:30:36 -0700 (PDT)
Message-ID: <97879b9b078055fb130edfd126d253320ce616a1.camel@ndufresne.ca>
Subject: Re: [PATCH 11/16] media: rockchip: rga: add iommu restore function
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Date: Tue, 07 Oct 2025 14:30:34 -0400
In-Reply-To: <20251007-spu-rga3-v1-11-36ad85570402@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
	 <20251007-spu-rga3-v1-11-36ad85570402@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-XMJL5X6bcbRTnPR2VvM0"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_113039_164771_298AF738 
X-CRM114-Status: GOOD (  25.46  )
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


--=-XMJL5X6bcbRTnPR2VvM0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 07 octobre 2025 =C3=A0 10:32 +0200, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Add an iommu restore function in preparation for the rga3 addition.
> This is necessary for a soft reset, as the rga3 will also reset
> it's iommu paging table to 0 and disable paging.
>=20
> The empty domain attach/detach to restore the iommu is copied
> from the rkvdec driver.

We did receive negative feedback after the fact on this one. We will likely
upset further the iommu subsystem maintainers with that. Have you considere=
d
adding a restore function in the rkiommu driver, similar to TI mmu and Benj=
amin
VSI MMU proposal ?

I have no precise objection, I know it works, but adding a restore function
seems also pretty straight forward.

>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c | 24 ++++++++++++++++++++=
++++
> =C2=A0drivers/media/platform/rockchip/rga/rga.h |=C2=A0 7 +++++++
> =C2=A02 files changed, 31 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c
> b/drivers/media/platform/rockchip/rga/rga.c
> index
> cd4da01645611e5fb51ed94e09b5f1463dad72c5..0a725841b0cfa41bbc5b861b8f5ceac=
2452f
> c2b5 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -9,6 +9,7 @@
> =C2=A0#include <linux/delay.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/interrupt.h>
> +#include <linux/iommu.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/of.h>
> =C2=A0#include <linux/pm_runtime.h>
> @@ -560,6 +561,19 @@ static const struct video_device rga_videodev =3D {
> =C2=A0	.device_caps =3D V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING,
> =C2=A0};
> =C2=A0
> +void rga_iommu_restore(struct rockchip_rga *rga)
> +{
> +	if (rga->empty_domain) {
> +		/*
> +		 * To rewrite mapping into the attached IOMMU core, attach a
> new empty domain that
> +		 * will program an empty table, then detach it to restore the
> default domain and
> +		 * all cached mappings.
> +		 */
> +		iommu_attach_device(rga->empty_domain, rga->dev);
> +		iommu_detach_device(rga->empty_domain, rga->dev);
> +	}
> +}
> +
> =C2=A0static int rga_parse_dt(struct rockchip_rga *rga)
> =C2=A0{
> =C2=A0	struct reset_control *core_rst, *axi_rst, *ahb_rst;
> @@ -657,6 +671,13 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0		goto err_put_clk;
> =C2=A0	}
> =C2=A0
> +	if (iommu_get_domain_for_dev(rga->dev)) {
> +		rga->empty_domain =3D iommu_paging_domain_alloc(rga->dev);
> +
> +		if (!rga->empty_domain)

Its an error pointer, see:

https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/6347dc=
7fb967521a77f9ff0774d25ef0cca4c6cd

> +			dev_warn(rga->dev, "cannot alloc new empty
> domain\n");
> +	}
> +
> =C2=A0	ret =3D v4l2_device_register(&pdev->dev, &rga->v4l2_dev);
> =C2=A0	if (ret)
> =C2=A0		goto err_put_clk;
> @@ -741,6 +762,9 @@ static void rga_remove(struct platform_device *pdev)
> =C2=A0	v4l2_device_unregister(&rga->v4l2_dev);
> =C2=A0
> =C2=A0	pm_runtime_disable(rga->dev);
> +
> +	if (rga->empty_domain)
> +		iommu_domain_free(rga->empty_domain);
> =C2=A0}
> =C2=A0
> =C2=A0static int __maybe_unused rga_runtime_suspend(struct device *dev)
> diff --git a/drivers/media/platform/rockchip/rga/rga.h
> b/drivers/media/platform/rockchip/rga/rga.h
> index
> fc4805ba4e8ef7fb311f780a198ba6ba4d3aff17..e19c4c82aca5ae2056f52d525138093=
fbbb8
> 1af8 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -75,6 +75,7 @@ struct rockchip_rga {
> =C2=A0	void __iomem *regs;
> =C2=A0	struct clk_bulk_data clks[3];
> =C2=A0	struct rockchip_rga_version version;
> +	struct iommu_domain *empty_domain;
> =C2=A0
> =C2=A0	/* vfd lock */
> =C2=A0	struct mutex mutex;
> @@ -114,6 +115,12 @@ static inline struct rga_vb_buffer *vb_to_rga(struct
> vb2_v4l2_buffer *vb)
> =C2=A0
> =C2=A0struct rga_frame *rga_get_frame(struct rga_ctx *ctx, enum v4l2_buf_=
type
> type);
> =C2=A0
> +/*
> + * This should be called in an interrupt handler to make sure no memory
> + * is mapped through the IOMMU while the empty domain is attached.
> + */
> +void rga_iommu_restore(struct rockchip_rga *rga);
> +
> =C2=A0/* RGA Buffers Manage */
> =C2=A0extern const struct vb2_ops rga_qops;
> =C2=A0

--=-XMJL5X6bcbRTnPR2VvM0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaOVcSgAKCRDZQZRRKWBy
9OYnAP9DZqU3/sor4ifbznDD8fkkIm921ew6ADeaBvy0V9AxfgEAwHVV4+jp7xPf
P3ZUAog4C977zT1IhEvYYMKGr4Gjpwg=
=aUgZ
-----END PGP SIGNATURE-----

--=-XMJL5X6bcbRTnPR2VvM0--

