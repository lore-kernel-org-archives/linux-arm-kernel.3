Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65684CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 11:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	MIME-Version:Message-ID:In-Reply-To:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ir3x0swwBGd6XitlxOubmabNH2rY0f45K2OexaHZmP4=; b=BZUQ4BOgK8T8j3v4/N1wRHRznj
	dIVM9uyiGL0Iph7/CxOTF5meg0MFvM0r6kZFE9aFBen+Ser/ktoZYpUtJDHr7/o+cH1aOlmULYcds
	Yr7g6pDPRLs9MSdfRka0ERNUPQCeVFpttN3cNX5a6T8n9LglHO1gNUG8IjcgACjiKn5cx1H3F4z19
	tCP6GzMoj0cPGi8QNP4fHVfp/b/gI5EtTmXdrlxdA1t556RIAI4xE68oBuoQdgHrHawOaxBIkT8EQ
	QeuHeDyOXa/IwHT8xRoIgNCLjzXcHD6orEH+9JZlJYYqx7OBibpYCxnetMK69eSv1FnKN+WFvpCLN
	aP/CQnbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ArB-00000008JNN-0aI7;
	Fri, 10 Oct 2025 11:00:17 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Ar6-00000008JMq-4BhD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 11:00:15 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251010110007euoutp0198334a56c1e281aced139f1d9abc40ab~tHCy5C9b_1521215212euoutp01Q;
	Fri, 10 Oct 2025 11:00:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251010110007euoutp0198334a56c1e281aced139f1d9abc40ab~tHCy5C9b_1521215212euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760094007;
	bh=ir3x0swwBGd6XitlxOubmabNH2rY0f45K2OexaHZmP4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ekbdCyXOMZGugMSo0+tQQkBAc4fpEMjXKT1yNIc0F5+IB8agcCFy04xR3j4PlkbDR
	 s1KWGiNrQkm392seMJ+rvt46MMf2su6qOst3b7Q/eSQXO2Fo5cfr8dJvPCoRiQ+w9k
	 TJ5SqyCJY5iFJFdZ32P1G+IqCfuQR9lKYvHa0Sag=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251010110007eucas1p1e2052e63b1b36046298c3c2c4ad303b0~tHCyiyju42872228722eucas1p1Y;
	Fri, 10 Oct 2025 11:00:07 +0000 (GMT)
Received: from localhost (unknown [106.120.51.111]) by eusmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251010110007eusmtip14117cd889c992a54b4345025b25e4516~tHCyfZrY43244032440eusmtip1g;
	Fri, 10 Oct 2025 11:00:07 +0000 (GMT)
From: Lukasz Stelmach <l.stelmach@samsung.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Marek Szyprowski
	<m.szyprowski@samsung.com> 
Subject: Re: [PATCH 20/25] media: samsung: s5p-g2d: Drop unneeded
 v4l2_m2m_get_vq() NULL check
Date: Fri, 10 Oct 2025 13:00:01 +0200
In-Reply-To: <20251008175052.19925-21-laurent.pinchart@ideasonboard.com>
	(Laurent Pinchart's message of "Wed, 8 Oct 2025 20:50:47 +0300")
Message-ID: <oypijd4is7m37y.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
	protocol="application/pgp-signature"
X-CMS-MailID: 20251010110007eucas1p1e2052e63b1b36046298c3c2c4ad303b0
X-Msg-Generator: CA
X-RootMTR: 20251008175139eucas1p225b8b48b4152566f6a6eca0207961c1b
X-EPHeader: CA
X-CMS-RootMailID: 20251008175139eucas1p225b8b48b4152566f6a6eca0207961c1b
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
	<CGME20251008175139eucas1p225b8b48b4152566f6a6eca0207961c1b@eucas1p2.samsung.com>
	<20251008175052.19925-21-laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_040013_618798_E8023FDE 
X-CRM114-Status: GOOD (  20.97  )
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

It was <2025-10-08 =C5=9Bro 20:50>, when Laurent Pinchart wrote:
> The v4l2_m2m_get_vq() function never returns NULL. The check was
> probably intended to catch invalid format types, but that's not needed
> as the V4L2 core picks the appropriate VIDIOC_G_FMT ioctl handler based
> on the format type, so the type can't be incorrect. Drop the unneeded
> return value check and, as the return value is not used for other
> purposes and the function has no side effect, the function call as well.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/samsung/s5p-g2d/g2d.c | 4 ----
>  1 file changed, 4 deletions(-)
>

Reviewed-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>

> diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media=
/platform/samsung/s5p-g2d/g2d.c
> index ffed16a34493..7b0481c7f953 100644
> --- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
> +++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
> @@ -306,12 +306,8 @@ static int vidioc_enum_fmt(struct file *file, void *=
prv, struct v4l2_fmtdesc *f)
>  static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format=
 *f)
>  {
>  	struct g2d_ctx *ctx =3D prv;
> -	struct vb2_queue *vq;
>  	struct g2d_frame *frm;
>=20=20
> -	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> -	if (!vq)
> -		return -EINVAL;
>  	frm =3D get_frame(ctx, f->type);
>  	if (IS_ERR(frm))
>  		return PTR_ERR(frm);

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmjo5zEACgkQsK4enJil
gBCLEQf6AmaPcjoiunRnBc4iXTZhWRTMZQAaCNCSv1NeNza95+/aF18AwBnYq9q7
AzLWKhAVaj5w1W7bCQFkcEmoPRKR4hB/QwnnCQZJ322bqzRgqhb8bMMw5myRFsiY
3NQKCiZf4teMiE7FIG26t7JSDMX3UjGb/1Fn7gxy10LfSlS435Dixzq4w0G4SXI7
TFJ+XfkDB9RvFHrK9ih7OpSkdZRlgGVnOD4qWVa0KH9i9u1c0q0ZSzFMkKPbJlmy
kC8Z56LpjZpZzJk76yV/BdJ/qFBrPuWMGnDD14UWIAd/gKLTNv7MGtmUMkrOHzcr
3u507zuMqpgOm039YYzWu5ZbMC47Sw==
=rSgm
-----END PGP SIGNATURE-----
--=-=-=--

