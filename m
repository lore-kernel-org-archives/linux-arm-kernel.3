Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80079CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	MIME-Version:Message-ID:In-Reply-To:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6M/CURYsQXY3/uzXGcUkzo+e+ViGdgH1Lhlm1R/1iI=; b=wm21PzyY8NVgt9gxP7PYL9YfRS
	bc1kscvd5XnZVzNNFsfHF7TVC0TzvdXxJh5H4FNMBpxyvQn0AWfW6P0uzqcyGmuDDC3klXXVmfgXb
	iAoT8gwXLOI+R5UB8KWYvbId3M6ki9jJr0phvZmPd8JlKzN5vZpsWjbldcmzXlzkVbwE3q6IriEeW
	bSLroLV1c+19L0E/g4JbxftXq8LL4qRh0wZSvP27AKlSBt8JmmSDq1gjF5MshIghd2qWSwRQVuQbb
	a9loqeaoYRB5+5J/y2Wxic0hqyN1+dEXkUFqc5/SopF5Q6rI7eAUELanumHK8AtMzAKZ9Iq91VpSl
	Yd5wk1Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0lB-00000007jZh-0rOa;
	Mon, 18 Aug 2025 14:22:53 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0bf-00000007i2w-2LV8;
	Mon, 18 Aug 2025 14:13:05 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250818141259euoutp01c5a5c72a970c88cb8463fa9bb50e5008~c4fDm0j1Y2172321723euoutp01y;
	Mon, 18 Aug 2025 14:12:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250818141259euoutp01c5a5c72a970c88cb8463fa9bb50e5008~c4fDm0j1Y2172321723euoutp01y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755526379;
	bh=f6M/CURYsQXY3/uzXGcUkzo+e+ViGdgH1Lhlm1R/1iI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FaiBwfuLMFd8wcxb0jvuhKpukO35xdhs1to++ZaQ4Yqh+Gs6k/xhff2Sy966nKB1u
	 Y4My6ONmPeJTOTI7B6gYhSXTwZkt1FTO9BnQ28BliriKoYXUtLcxp9F6Knuc9EUcs8
	 MtUVtnwteswlZeCnCsdleiFKIXspagyS25wUueR4=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250818141258eucas1p21f750bd71f615e61da60af4f01b2bcdb~c4fDEmByv0907809078eucas1p2Q;
	Mon, 18 Aug 2025 14:12:58 +0000 (GMT)
Received: from localhost (unknown [106.120.51.111]) by eusmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250818141258eusmtip1a60c9e78cf67f43b879dc2891aeb8d16~c4fDAo2330814408144eusmtip1y;
	Mon, 18 Aug 2025 14:12:58 +0000 (GMT)
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
Subject: Re: [PATCH 27/65] media: Reset file->private_data to NULL in
 v4l2_fh_del()
Date: Mon, 18 Aug 2025 16:12:58 +0200
In-Reply-To: <20250802-media-private-data-v1-27-eb140ddd6a9d@ideasonboard.com>
	(Jacopo Mondi's message of "Sat, 02 Aug 2025 11:22:49 +0200")
Message-ID: <oypijd5xekra51.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
	protocol="application/pgp-signature"
X-CMS-MailID: 20250818141258eucas1p21f750bd71f615e61da60af4f01b2bcdb
X-Msg-Generator: CA
X-RootMTR: 20250802092807eucas1p14e332744b667a8b03ef32135045d26c5
X-EPHeader: CA
X-CMS-RootMailID: 20250802092807eucas1p14e332744b667a8b03ef32135045d26c5
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
	<CGME20250802092807eucas1p14e332744b667a8b03ef32135045d26c5@eucas1p1.samsung.com>
	<20250802-media-private-data-v1-27-eb140ddd6a9d@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_071303_862618_61677CBA 
X-CRM114-Status: GOOD (  14.08  )
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
> Multiple drivers that use v4l2_fh and call v4l2_fh_del() manually reset
> the file->private_data pointer to NULL in their video device .release()
> file operation handler. Move the code to the v4l2_fh_del() function to
> avoid direct access to file->private_data in drivers. This requires
> adding a file pointer argument to the function.

[...]

> diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media=
/platform/samsung/s5p-g2d/g2d.c
> index e34cae9c9cf65d3161822b68233d28472171f917..922262f61e7b53baf1b5840d3=
5149bf5b4b2e7ad 100644
> --- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
> +++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
> @@ -280,7 +280,7 @@ static int g2d_release(struct file *file)
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>  	mutex_unlock(&dev->mutex);
>  	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> -	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_del(&ctx->fh, file);
>  	v4l2_fh_exit(&ctx->fh);
>  	kfree(ctx);
>  	v4l2_info(&dev->v4l2_dev, "instance closed\n");
> diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/driver=
s/media/platform/samsung/s5p-jpeg/jpeg-core.c
> index c4ad0196ed8f1bf579365a0a21dd8c4a78bdaa10..2a57efd181540183e7d2b66d5=
1f9f2f274ddd100 100644
> --- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> +++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> @@ -1005,7 +1005,7 @@ static int s5p_jpeg_open(struct file *file)
>  	return 0;
>=20=20
>  error:
> -	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_del(&ctx->fh, file);
>  	v4l2_fh_exit(&ctx->fh);
>  	mutex_unlock(&jpeg->lock);
>  free:
> @@ -1021,7 +1021,7 @@ static int s5p_jpeg_release(struct file *file)
>  	mutex_lock(&jpeg->lock);
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>  	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> -	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_del(&ctx->fh, file);
>  	v4l2_fh_exit(&ctx->fh);
>  	kfree(ctx);
>  	mutex_unlock(&jpeg->lock);

Acked-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>



[...]


=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmijNOoACgkQsK4enJil
gBAXpggAhxgfNJt5JHfaNRWL4tntTEflz9jY6aL37c5XVvyFfbAOD9ZUAipWxJ3g
fm3satj2+sGjeHZtH4lAnwpLpNY8egrTC1c9muXvIy/ExVz7jwo1JW/IKM9a0tZl
D9N1GuZeTlQeLoFPsXl4LQhDbj48llm8roSKgfK4mU8ymTEw6BYOQ7bMZcxWKd9+
amU+zqtKIXE3OHNKDB3Hoo9pLBhOIBPXcqEV8rwNbC0dyidV8GvVUUv4ptQBlAyV
SNaaVoSHo+4P9caRnQOeX3kj7NXJa3ES03Cgpj8IhhZigvTtXJ+VL0fL283OuvOe
p2JcG+pKY00NgIMbtv0xGbMhZGox9A==
=VvC9
-----END PGP SIGNATURE-----
--=-=-=--

