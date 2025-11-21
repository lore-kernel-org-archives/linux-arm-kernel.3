Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F13CFC29B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 18:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3reEjUab7HQIYE8MwmDCD1KFRlukjdmGK/LzC0B9YJA=; b=aazqDSMuOC6FHKz4a2AeF1NWMK
	rLl7Zlg7Nvk0hiVHgK0fNWvVqWLZ4U6b9KmGKqVYD5UaEl6iv4QqkrfmNXcqqCp2t0Vg+dQ27P14Q
	bPCq9V0rhvRVyOl95+OifRK7jBoLg33DUF8mZVLk2gImYYfYgxNQ+XEzkL08lBOl5UjFT3sFe29HW
	46sdNXOnStFipNE8jCxR/R62/4weVXsWRwp4YqTTTdspKy2DUg4w9rx68AlJsStlbe9hni55E7Fsh
	S2NHa7gCwhWl3SRNY/MuBPS3DGwLXXRTd6wQiA6A/njfBDzfiP/J2kzYS0q06AwSGu2vcSic96tzA
	8cefZ5AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMVXu-00000008pnl-3O2D;
	Fri, 21 Nov 2025 18:07:46 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMVXo-00000008pmD-12Ul
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 18:07:41 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-882390f7952so23912796d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 10:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1763748458; x=1764353258; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3reEjUab7HQIYE8MwmDCD1KFRlukjdmGK/LzC0B9YJA=;
        b=qQCSeeKxCfXIJ3TZvo9KDLvKE6rHwXs6OLiCPDtmCvlaGB8Gzso5XuhuewOtTTreb8
         AQkHAHRXB5YhTKN3TTWZ1KXHXOkzWJRIFFCOgetsgXMHval/VxBKd1xJ80oBKfnCkrVF
         CeeS3ujNHFNgBjUitd1o8cP0Wn/z9TbcpabXFDaiLVVbjioOLCWvrtTHUT9HdLTCT6LP
         gzyiCGw/QwEZN+7ryFSPNOGsT4tllku03Kf1/pOf45M1y0+o1Tc3Vtru6N4eO9ZpAn5g
         gXV8jz5nTJha9QghCqNkPS0s9xLqeMqsq3/936XTb8FsXCiavN0vvzJFvfaQbzkXD2zN
         4okA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763748458; x=1764353258;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3reEjUab7HQIYE8MwmDCD1KFRlukjdmGK/LzC0B9YJA=;
        b=fb7tM6F1lV450UdKwUO1pisTNJ5tEgEPjDNaxUzShXo0RuSULnXxlKNfhmjBg9wnj7
         583Nz47Rwgi2LKpdVXobPI5Rox33eJ1paFkNarfGS8Ruyt5l16XFxuugqofMfVq6qaBx
         xg/wIs0cqrGUH366E8cbWVxmK6qywp0Q5rkmN1Q9FeOZwoGQ7KI5fKLE8EsIDgCzR4QY
         t4O7wYcoIcOKp+EjNc5TFCGDj+UhI0Motxv1zyUItBuPR7fpkosFNt7jjXk5Megn1uh8
         ZSh7aWG0oZi9252+XmrtbtVWScYrolhQf/odgggzsYELn61P9EisrZjbOOnFXhhhUb+L
         2QdA==
X-Forwarded-Encrypted: i=1; AJvYcCX488jexnBx1hKrdR9xuIyD+uD4wxdTAAvUegLivojCxSKSNbj0XFoxaaMMRIMIE51/OYBqTN3CuyJwxX/vYDKW@lists.infradead.org
X-Gm-Message-State: AOJu0YwJyeFIwR2+4pj9dYL7jyzwXW6ysNmmzNvF486dRNMVtM/A5d77
	gOHpVybN555FAALDO3zJBejmIwf+0Z5Zz8Nwt2e08kaeevDTtT97e5rH0R1fxgvsqjc=
X-Gm-Gg: ASbGnctldc8R5Vg7L0eqAzVPMXKFQvvzh0w/htVSdsdmsZO9VL1DP0Va22oNJaAwEdj
	bcNIhCTG9qKBFfPgEbi5ZrsbsRsAL+VeK3g4JnsV3dIYwpVGTRZarZ4tbA1hlvL6OpHRMBey2l1
	yheUXStBScoSNFjI5yiqU8pTMOGQFth6nQEOiw5NmAbuyF6Jds0ZzJK+GFnTz8TWCyTBI3UiHjw
	DzAvmKFAIyP+ROuoAEd3mEH4MbGKSsT3K2v/Ut0tIkb2A6JM/j46HiO3A8K8SMHcwI0XBmp0BXy
	oEg3PKrWLPg/hR4VtmIj7E27nl7+DWNBPt4jXgv8yI0PthtJaf9txA/EYOcBteyoi1zDwBzOTn9
	pRTgKywLOdqlzObNP/ljqHYB6wVSf9dkEB6PPLQ3AktMlg3SPA4WHA3dlx9EgBGwdFTAE3y87Wp
	gWRzyOi7WF3zF0132P
X-Google-Smtp-Source: AGHT+IGSn6lWVFdXMF2O7+16BxyboE+vLKmTO8u+vsDg8rBpHj7vHOjDlUdUHZhhn3mvBIHkM4SR0A==
X-Received: by 2002:a05:6214:f01:b0:882:4987:367 with SMTP id 6a1803df08f44-8847c546402mr35659826d6.65.1763748458256;
        Fri, 21 Nov 2025 10:07:38 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e599ac9sm44053446d6.49.2025.11.21.10.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 10:07:37 -0800 (PST)
Message-ID: <11354064b251d01f8a0f8974c451c91d515be1a4.camel@ndufresne.ca>
Subject: Re: [PATCH 1/2] pmdomain: imx8m-blk-ctrl: Remove separate rst and
 clk mask for 8mq vpu
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	benjamin.gaignard@collabora.com, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 ulf.hansson@linaro.org, 	s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, 	linux-imx@nxp.com, l.stach@pengutronix.de,
 peng.fan@nxp.com, eagle.zhou@nxp.com, 	imx@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Fri, 21 Nov 2025 13:07:35 -0500
In-Reply-To: <20251121081911.1682-1-ming.qian@oss.nxp.com>
References: <20251121081911.1682-1-ming.qian@oss.nxp.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-CGluF/KiYEHV7bilRPFN"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_100740_567740_C2258BBD 
X-CRM114-Status: GOOD (  17.21  )
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


--=-CGluF/KiYEHV7bilRPFN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ming,

thanks a lot for working on this.

Le vendredi 21 novembre 2025 =C3=A0 16:19 +0800, ming.qian@oss.nxp.com a =
=C3=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> The ADB in the VPUMIX domain has no separate reset and clock
> enable bits, but is ungated and reset together with the VPUs.
> So we can't reset G1 or G2 separately, it may led to the system hang.
> Remove rst_mask and clk_mask of imx8mq_vpu_blk_ctl_domain_data.
> Let imx8mq_vpu_power_notifier() do really vpu reset.
>=20
> Fixes: 608d7c325e85 ("soc: imx: imx8m-blk-ctrl: add i.MX8MQ VPU blk-ctrl"=
)
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> =C2=A0drivers/pmdomain/imx/imx8m-blk-ctrl.c | 4 ----
> =C2=A01 file changed, 4 deletions(-)
>=20
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx=
/imx8m-blk-ctrl.c
> index 5c83e5599f1e..1f07ff041295 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -852,16 +852,12 @@ static const struct imx8m_blk_ctrl_domain_data imx8=
mq_vpu_blk_ctl_domain_data[]
> =C2=A0		.clk_names =3D (const char *[]){ "g1", },
> =C2=A0		.num_clks =3D 1,
> =C2=A0		.gpc_name =3D "g1",
> -		.rst_mask =3D BIT(1),
> -		.clk_mask =3D BIT(1),
> =C2=A0	},
> =C2=A0	[IMX8MQ_VPUBLK_PD_G2] =3D {
> =C2=A0		.name =3D "vpublk-g2",
> =C2=A0		.clk_names =3D (const char *[]){ "g2", },
> =C2=A0		.num_clks =3D 1,
> =C2=A0		.gpc_name =3D "g2",
> -		.rst_mask =3D BIT(0),
> -		.clk_mask =3D BIT(0),
> =C2=A0	},

That was also our impression, but we could not get information about this H=
W.
One question here, how do we ensure that we don't reset twice on power on ?

Nicolas

> =C2=A0};
> =C2=A0

--=-CGluF/KiYEHV7bilRPFN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSCqZwAKCRDZQZRRKWBy
9A6ZAP90EgdxFgS1MNEpip8ViNpAOQ1t5ODnf13yvBhSJ87yTwD/W2WHO1JhMsym
rs/FdLqAmGCaIVG4rntDh6YMtk3p6gc=
=VrGj
-----END PGP SIGNATURE-----

--=-CGluF/KiYEHV7bilRPFN--

