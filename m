Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DE4CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	MIME-Version:Message-ID:Date:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tla4LIP0HEFHoX1w40Aji8U/IZUoIzvhT3y/D99OCOM=; b=DKck/Iuuv5cSpVvMkIyzoGq8pg
	LpTyOICNs7qF/MQdXUrOzdElxkstrixYx9N7QHSRVBnaH9AkeZLjhJAtwDa67pwSkxfDc79NoArCJ
	dpT9okHcfn7eK/LOGvlaDbLgcD4VvNERX8totDFKo5xjAU88nwg0I726kNOnqbIdvTMLrI6BZA3UK
	N5Qm7EItQVjhd/Y9iaXrdC4rQxIyuxk3yNAuECromfZMW4KxMu68aqklhEG4ZBQQMJLLesC7UaYJC
	19TVmzisohA9V6TAtxvr/Yg7RsKt/QHZXJUa1p573m76C4/e50sCFi3WuKrRAlgcqFiQV8AjB5OtZ
	dMhNFgog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzXW-00000007HS8-0j03;
	Thu, 21 May 2026 09:18:02 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzXQ-00000007HPx-2p5P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 09:18:00 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260521091750euoutp029019ead77c04b2458adeccf709e02a6d~xigJrSrAF2230022300euoutp02D;
	Thu, 21 May 2026 09:17:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260521091750euoutp029019ead77c04b2458adeccf709e02a6d~xigJrSrAF2230022300euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1779355070;
	bh=tla4LIP0HEFHoX1w40Aji8U/IZUoIzvhT3y/D99OCOM=;
	h=From:To:Cc:Subject:In-Reply-To:Date:References:From;
	b=JWBCucmL7WVMJM9IsjHOplWSYB8TAS+pQfF3q1fVesX3jVDIbFESbMlVhLPvCqoHx
	 N9CWIQ/CTnGFge8SjaB2JJ+AE97haJdA1bK1IIxMCsb6knPRj6qpy5nW36HHbH6vSp
	 S2UTPGvg/kuh2tkLNe2SSiMAQ5d+KQdvZ+0kxBjg=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260521091750eucas1p1b3186d0ad37643279c08c842482c461b~xigJGJI1B0858208582eucas1p1H;
	Thu, 21 May 2026 09:17:50 +0000 (GMT)
Received: from localhost (unknown [106.120.51.111]) by eusmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260521091750eusmtip1aa20055378fcc28431326a001e937a4c~xigJCdYqo2518325183eusmtip1C;
	Thu, 21 May 2026 09:17:50 +0000 (GMT)
From: Lukasz Stelmach <l.stelmach@samsung.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,  Kamil Debski
	<k.debski@samsung.com>,  Kyungmin Park <kyungmin.park@samsung.com>,  Marek
	Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: s5p-g2d: avoid double free on video register
 failure
In-Reply-To: <20260517114642.951949-1-lgs201920130244@gmail.com> (Guangshuo
	Li's message of "Sun, 17 May 2026 19:46:42 +0800")
Date: Thu, 21 May 2026 11:17:49 +0200
Message-ID: <oypijdv7ch86ki.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
	protocol="application/pgp-signature"
X-CMS-MailID: 20260521091750eucas1p1b3186d0ad37643279c08c842482c461b
X-Msg-Generator: CA
X-RootMTR: 20260517114658eucas1p26d540bb0740e60f04f7be661f2991add
X-EPHeader: CA
X-CMS-RootMailID: 20260517114658eucas1p26d540bb0740e60f04f7be661f2991add
References: <CGME20260517114658eucas1p26d540bb0740e60f04f7be661f2991add@eucas1p2.samsung.com>
	<20260517114642.951949-1-lgs201920130244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_021757_309393_979B6614 
X-CRM114-Status: GOOD (  23.69  )
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

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was 2026-05-17 nie 19:46, when Guangshuo Li wrote:
> g2d_probe() allocates a video_device with video_device_alloc() and
> releases it from the rel_vdev error path if video_register_device()
> fails.
>
> This can double free the video_device when __video_register_device()
> reaches device_register() and that call fails:
>
>   video_register_device()
>     -> __video_register_device()
>        -> device_register() fails
>           -> put_device(&vdev->dev)
>              -> v4l2_device_release()
>                 -> vdev->release(vdev)
>                    -> video_device_release(vdev)
>
>   g2d_probe()
>     -> rel_vdev
>        -> video_device_release(vfd)
>
> Use video_device_release_empty() while registering the device so that
> registration failure paths do not free vfd through vdev->release().
> g2d_probe() then releases vfd exactly once from rel_vdev. Restore
> video_device_release() after successful registration so the registered
> device keeps its normal lifetime handling.
>
> This issue was found by a static analysis tool I am developing.

Thank you for taking time to analyze our code. I was going to write
something along the lines Marek Szyprowski has laready written in this
thread https://lore.kernel.org/all/CANUHTR-RfWnoMRRAoDb6CPZsaiAYBLy61dd0P6T=
nKYgjNeBWpA@mail.gmail.com/
Do follow his advise with this one too.

> Fixes: 918847341af0 ("[media] v4l: add G2D driver for s5p device family")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/media/platform/samsung/s5p-g2d/g2d.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media=
/platform/samsung/s5p-g2d/g2d.c
> index a18b13db19d5..f38c28abd6d9 100644
> --- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
> +++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
> @@ -684,6 +684,7 @@ static int g2d_probe(struct platform_device *pdev)
>  		goto unreg_v4l2_dev;
>  	}
>  	*vfd =3D g2d_videodev;
> +	vfd->release =3D video_device_release_empty;
>  	set_bit(V4L2_FL_QUIRK_INVERTED_CROP, &vfd->flags);
>  	vfd->lock =3D &dev->mutex;
>  	vfd->v4l2_dev =3D &dev->v4l2_dev;
> @@ -711,6 +712,8 @@ static int g2d_probe(struct platform_device *pdev)
>  		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
>  		goto free_m2m;
>  	}
> +
> +	vfd->release =3D video_device_release;
>  	video_set_drvdata(vfd, dev);
>  	dev->vfd =3D vfd;
>  	v4l2_info(&dev->v4l2_dev, "device registered as /dev/video%d\n",

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmoOzb0ACgkQsK4enJil
gBDAvwf/UqBCHoEFcpYoctqpNZB9CoQg5p5yFhsNbYNDc15ydTPBINYKGRXBzPLe
U+mHRQeqxMHzlzKnBYGJX7LYWXJyK0HAi0Et+jlb4o/v43eoBTBfaaRrbm+ST3sT
8qVUOcBjdV3AkiXggyGqS5F9XSqEAlcVFc6QJ+YgpIDvu4Kkp6KWBPXqgBT+THPa
6z+mLGHQNX0NNalw1XBLjbNGlbec6UMFMYk8NJgMV1I5sWdIiDuvUCWyk/oiVwOM
FTq/BI8ey1+z1bOCux903ak+3iz22voLKCfQPYESX84hDSRs/gAwOh0x5iM5a6kU
+8oCn5DaDhL/D4jVXb7Dq2PVIWahdA==
=CxIp
-----END PGP SIGNATURE-----
--=-=-=--

