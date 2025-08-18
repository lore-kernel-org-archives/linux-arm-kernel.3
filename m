Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF5CCA0EF1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	MIME-Version:Message-ID:In-Reply-To:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ts3A4MvB+pLF9b1fYr1OaRKHsIG9rXzjaSyR872fx0Q=; b=4vWvK33HMjuPBw6KsEOyeUuCUI
	0Gs3pMB8Lpq8Eqsm7zcFBQtB8+HNslGYLvXl07XYQSh0/gE3NMRe9pavAZ2Rj9Ncs+v/ajx76Vi9b
	Q+Dh6R4h7v0L+oNPeSc3OgeYJ2mZJrHN8IxEuD1APvMoP/6jmOfnEzw4SE3Nahaw2Cea7PE1Xa494
	OJjbwxM49yXENz4Sk6iFLmYHNeazpSonQZ7v5FVBO3w5+i/QnvSGe4KpPYY0uoCQ/SifdsmX8V2Au
	kBrFd8+YJ2MwFflGZlKmfbweEmtNHBQJcM6X1GQDE3i93BjLvVwON4RRbWB5rWc+LcQI5rt/NQoon
	LIKSSlrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0ib-00000007j5x-3wC1;
	Mon, 18 Aug 2025 14:20:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0ZX-00000007hig-3K8e;
	Mon, 18 Aug 2025 14:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ts3A4MvB+pLF9b1fYr1OaRKHsIG9rXzjaSyR872fx0Q=; b=bdxobbpPgUa/l1rJVgAmwPSVCU
	EwRtv0dOu5GIEla3hBn2Gw0BNRXwFDzN97gZt2hFx/Ddeoz+R2+5fTfgw57WZ58ZDhIR1YDIz+I6d
	yz5I0+NpGxVQe5oRebmUNR8dNggGmn/n8yclh3hOQaId/GGmPWCCXKxN6uXdcvyrc6JJz604/hpo/
	IbLGmqYy2mdpV0TOQYJwrWURC1CVciuLVL8D+e3/MaCKhq66GxDPGjZtuvJy14Bpq1oIPxDB7lpP1
	AJtA603T3UVMToVF7t768FMv1RP2sTC/iIOmKN944ekpXq27Ac6u8HgOBqodnSERnL+HCouz1n1qn
	fP+A7gKA==;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0ZT-0000000HP5N-3XHX;
	Mon, 18 Aug 2025 14:10:50 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250818141041euoutp01198781292bd5d26e9ea7136d3d3d73e8~c4dDIkjfs2135921359euoutp01S;
	Mon, 18 Aug 2025 14:10:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250818141041euoutp01198781292bd5d26e9ea7136d3d3d73e8~c4dDIkjfs2135921359euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755526241;
	bh=ts3A4MvB+pLF9b1fYr1OaRKHsIG9rXzjaSyR872fx0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nweMstTkqZUfTDcgSuzWRYVoV9JvbPK+l2fq2+I3gRx0SKOetrGBglidgci/XLRHG
	 yKiRGPTghNY65ZYuW+rQetbaj0UlX84N/HJy2tuH4Qs0xmThMbES7YZyWuK/y2EQwa
	 pANBPLppgOKGZUguwTqkajXJsHrX4XbKh4XzMW6k=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250818141040eucas1p12598f376bdd8cfcb984a8a799373111d~c4dCdErup2133021330eucas1p1j;
	Mon, 18 Aug 2025 14:10:40 +0000 (GMT)
Received: from localhost (unknown [106.120.51.111]) by eusmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250818141040eusmtip168497366a830534395c067398c2a3939~c4dCY3Ph_0814408144eusmtip1d;
	Mon, 18 Aug 2025 14:10:40 +0000 (GMT)
From: Lukasz Stelmach <l.stelmach@samsung.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,  linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,  linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH 11/65] media: Replace file->private_data access with
 custom functions
Date: Mon, 18 Aug 2025 16:10:40 +0200
In-Reply-To: <20250802-media-private-data-v1-11-eb140ddd6a9d@ideasonboard.com>
	(Jacopo Mondi's message of "Sat, 02 Aug 2025 11:22:33 +0200")
Message-ID: <oypijda53wra8v.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
	protocol="application/pgp-signature"
X-CMS-MailID: 20250818141040eucas1p12598f376bdd8cfcb984a8a799373111d
X-Msg-Generator: CA
X-RootMTR: 20250802092520eucas1p2d0edfe269d3c423e6157bd7a0ec0b43c
X-EPHeader: CA
X-CMS-RootMailID: 20250802092520eucas1p2d0edfe269d3c423e6157bd7a0ec0b43c
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
	<CGME20250802092520eucas1p2d0edfe269d3c423e6157bd7a0ec0b43c@eucas1p2.samsung.com>
	<20250802-media-private-data-v1-11-eb140ddd6a9d@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_151048_051603_5A14573A 
X-CRM114-Status: GOOD (  18.78  )
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

It was <2025-08-02 sob 11:22>, when Jacopo Mondi wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Accessing file->private_data manually to retrieve the v4l2_fh pointer is
> error-prone, as the field is a void * and will happily cast implicitly
> to any pointer type.
>
> Replace all remaining locations that read the v4l2_fh pointer directly
> from file->private_data and cast it to driver-specific file handle
> structures with driver-specific functions that use file_to_v4l2_fh() and
> perform the same cast.
>
> No functional change is intended, this only paves the way to remove
> direct accesses to file->private_data and make V4L2 drivers safer.
> Other accesses to the field will be addressed separately.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---

[...]

> diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media=
/platform/samsung/s5p-g2d/g2d.c
> index ffed16a34493be2edbdaee13619467417487c1e7..44fcedbbc90a9863827aacbcd=
5f56d850cb552ea 100644
> --- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
> +++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
> @@ -25,7 +25,10 @@
>  #include "g2d.h"
>  #include "g2d-regs.h"
>=20=20
> -#define fh2ctx(__fh) container_of(__fh, struct g2d_ctx, fh)
> +static inline struct g2d_ctx *file2ctx(struct file *filp)
> +{
> +	return container_of(file_to_v4l2_fh(filp), struct g2d_ctx, fh);
> +}
>=20=20
>  static struct g2d_fmt formats[] =3D {
>  	{
> @@ -272,7 +275,7 @@ static int g2d_open(struct file *file)
>  static int g2d_release(struct file *file)
>  {
>  	struct g2d_dev *dev =3D video_drvdata(file);
> -	struct g2d_ctx *ctx =3D fh2ctx(file->private_data);
> +	struct g2d_ctx *ctx =3D file2ctx(file);
>=20=20
>  	mutex_lock(&dev->mutex);
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);


Acked-by: Lukasz Stelmach <l.stelmach@samsung.com>


[...]


=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmijNGAACgkQsK4enJil
gBDoIQgAm0zhFQfQO2pDJE9DC0t6P4lrJ//jtdrQJtVSYpcaXDYP9Oq1iygQ3s54
2wjf/n/+kXlE2cUM5pvbFc0c1qeuZipb+lexBpwBdogDE3njAsinDf4ohsWPGhJC
TMOuWPadHmM0CXjuSWpeF+MoKtOJYJjdyVizq8ZoFwgGHssYApRxGVuXx6DRlsZK
aqNXp4P9HNaVsxLl5JOCaeEaJLBkU++5rhIooxbmm/jPuM6WuOWil+jQKADaODeJ
UfkLjfRCLFc4WdsXOBZuwqUiyU4imB8qJOlrjosCChiqKqr7up+cyr3YZ7PJEXPv
jN4MErP/mPjxbYUi+bON3CbY2FlWfw==
=alRq
-----END PGP SIGNATURE-----
--=-=-=--

