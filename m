Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5112C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 20:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wuAJatc2JmXf0iY6WMCrv4PggaSVzunJXyftBhSJxQY=; b=LwkQm6q1jLGZVo2OnhP7NiQgnr
	YBLmlpv0rE5r7PLjA47Z0JEYQwyocfZQHlK4irx05mRk5McOWvAJ7YkJCOU+13QwncpoGsmJrFZ+d
	tzYJXO4Q7JhprVaZ4te5/zxsIChlbjw/pTVHqiA4D6838Uk5S4cLtJ9aWJslDVB8VY+ZOx9fpxXp4
	wPtdYcrDHxsuPFhKYpqfBADKaOfWQJQ5GiKevqjjxvS0qTUo5m8C/Srxp1OVZhfGzms+v5a8Eus4D
	u1hHN5S9psuMmXsb9RduHcw0G0ZAPyYC3yXmqmeweZa5qno+ZZzOA5eH8sjNdTeWxmoAFWZ9sIhDa
	G1EIZHQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtpQ-0000000BxlO-0EUO;
	Thu, 27 Mar 2025 20:27:52 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtR4-0000000Bv7m-1AQJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 20:02:43 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so2568259a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 13:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743105761; x=1743710561; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuAJatc2JmXf0iY6WMCrv4PggaSVzunJXyftBhSJxQY=;
        b=GJn0sXnUsQT7/IhHmmhAIlkgsXNCyBFhcNhjrpYR/gQlfClo3teM5qPxCnScHnasMQ
         h5etuGeF0n1dzaZ7+7m3WvADpTE75iSX7H31BT6nYvqoJ/vZJQIAVeYJpu8yhw9zJoKq
         cyxeGaSR4mrwSt5ddTOQl2FHfKCRVF0fVjAQ8H0JpAA0iMGIKga4tYAoaBNr/iLoCEi3
         WSKMljG3Wtkhc1QGJqc/Jht/0FoqOen7v9RRxlGwTlUZfTz6uUC394I9jmKw4A56P89m
         8VQdm2zvpWc0XFo5IAt4x6HGnWtdY5OCG5gAGE9qaGeC6YpGIBeNDmThDPJ9ALx6rVHh
         Tjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743105761; x=1743710561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wuAJatc2JmXf0iY6WMCrv4PggaSVzunJXyftBhSJxQY=;
        b=HEckYiTcQiVOvGy9MbKX9wJIv0J8/A/wakZrZYBKRsyWSJKisnvNz+Ogmyr5BUrHiD
         bsZQELR0cUilzUfX0ctdgFkeHvl/O0WPptGqqClHBlRbo4rb4zo2gy4PTWDlIu4lfZjv
         8Vkl5eJGztrAg3L7ZwFc/4sj1D6FyDr/JQB1vlIVnKnC1sm7PK2y0IaqSBj+H15HSBBe
         YsTKCa1R4coFdDm8RSw97yAv6HMgjfk+L24ZF8R9fEov1xCEdbShybZKJcrzRdyCAhBy
         N+Wa0Mf652HQ8A601nY4dVCot64Hwy6h9QsiRYlCKxON5SLVbXvOIJuNXDup+PeOtvz2
         4e8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWD2QB3VtGIIHiIp0u+zfD9nDj+YM27IM9RxX02ITL2saCOy1FtYeD92blAu6bZm9cW2HBSXt+23JNOCx8EBOmG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/cBFk3P9TpnLlfcgIbi1wWOMQEfM4Pyc4EE9jcKQo7KWZJflX
	qRmvQbMO05njUHbghaKpWB7v3p6z845npTdY4JnW/4RrT7awmh6w2b9ca4c4n8MBFUYbDvNEj9M
	MjFklIkbJJBURPNMaM8Z76QPt8d8=
X-Gm-Gg: ASbGnct402dufkVii8RAHTvOTK2Qf0BbhLdX5K/5EN8RBEtYm3V3Gp3i+ZbeKPF/ek2
	h7EsZMxBEtkp4tP8d8sgN6Ihb1tKxo4I2A7thByDQ0m1b7ydL/xAUaQwzSX5NZ/6GfE/oU5lAAt
	kgyoNqshdKLqD5XXjSxCZarO4YGg==
X-Google-Smtp-Source: AGHT+IFauHqFGz+l5KSmNKiQ87uiI0RmmUS7PE3RtYqUxj+Ju364KNFhZ3pFAY9xmj01bZt3AIVOI+wHC5S3cDOhqvE=
X-Received: by 2002:a17:90b:5686:b0:2fa:15ab:4dff with SMTP id
 98e67ed59e1d1-303a906ebc2mr6863917a91.31.1743105760980; Thu, 27 Mar 2025
 13:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com> <20250210-8qxp_camera-v3-4-324f5105accc@nxp.com>
In-Reply-To: <20250210-8qxp_camera-v3-4-324f5105accc@nxp.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 27 Mar 2025 15:02:29 -0500
X-Gm-Features: AQ5f1JpXPfB7WcMK1DcTCK1yjsON2ZzVKgj_sI1ozYwDfWnEj3NMxxnXx4v7m90
Message-ID: <CAHCN7x+6_xxkx-Fft6WnfsVyqy_v3c732uKuEanrP64jv3Kj1g@mail.gmail.com>
Subject: Re: [PATCH v3 04/12] media: nxp: imx8-isi: Allow num_sources to be
 greater than num_sink
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	Robert Chiras <robert.chiras@nxp.com>, "Guoniu.zhou" <guoniu.zhou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_130242_318918_40E958E1 
X-CRM114-Status: GOOD (  20.39  )
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

On Mon, Feb 10, 2025 at 3:01=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Allow num_sources (drvdata: num_channels) to be greater than num_sink
> (drvdata: num_ports + 1).
>
> ISI support stream multiplexing, such as differentiates multiple cameras
> from a single 2-lane MIPI input, or duplicates input stream into multiple
> outputs. So num_channels may be greater than num_ports at some platform.

Can you tell me which platforms support this?   Is this through
virtual channels, or do you physically connect lanes 1 and 2 to one
camera and lanes 3 and 4 to another?

adam
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v1 to v3
> - none
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/dr=
ivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 93a55c97cd173..ba5b2d3617a23 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -188,11 +188,11 @@ static int mxc_isi_crossbar_init_state(struct v4l2_=
subdev *sd,
>          * Create a 1:1 mapping between pixel link inputs and outputs to
>          * pipelines by default.
>          */
> -       routes =3D kcalloc(xbar->num_sources, sizeof(*routes), GFP_KERNEL=
);
> +       routes =3D kcalloc(xbar->num_sinks - 1, sizeof(*routes), GFP_KERN=
EL);
>         if (!routes)
>                 return -ENOMEM;
>
> -       for (i =3D 0; i < xbar->num_sources; ++i) {
> +       for (i =3D 0; i < xbar->num_sinks - 1; ++i) {
>                 struct v4l2_subdev_route *route =3D &routes[i];
>
>                 route->sink_pad =3D i;
> @@ -200,7 +200,7 @@ static int mxc_isi_crossbar_init_state(struct v4l2_su=
bdev *sd,
>                 route->flags =3D V4L2_SUBDEV_ROUTE_FL_ACTIVE;
>         }
>
> -       routing.num_routes =3D xbar->num_sources;
> +       routing.num_routes =3D xbar->num_sinks - 1;
>         routing.routes =3D routes;
>
>         ret =3D __mxc_isi_crossbar_set_routing(sd, state, &routing);
> @@ -453,7 +453,7 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
>          * the memory input.
>          */
>         xbar->num_sinks =3D isi->pdata->num_ports + 1;
> -       xbar->num_sources =3D isi->pdata->num_ports;
> +       xbar->num_sources =3D isi->pdata->num_channels;
>         num_pads =3D xbar->num_sinks + xbar->num_sources;
>
>         xbar->pads =3D kcalloc(num_pads, sizeof(*xbar->pads), GFP_KERNEL)=
;
>
> --
> 2.34.1
>
>

