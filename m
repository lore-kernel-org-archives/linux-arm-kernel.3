Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BD4CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 08:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LKGkHYkGjsfNCOSbIuI2ofA1LRYegvw5OmZRbl6Suuw=; b=OoME50+/lbbdQufhc7miOZ/4tH
	jByd8b4xQSFRpEmv5D5pSEa1hnD8/xbWE5NRpRCb0KFsKB361CrQJOWdHwuLrQyqgfLOwz0nSmVKt
	3uHkWRLQ0BraHQMjWb9Gf6I1FLfPHXNEzaUtwX/5JNiQmuyfuvlfqvyX/ycPMzVUzTF1EdqDeoFuP
	+bEt+DoPMYLVdwOQ1GFKsZYRv83m5jkbdQs69PK09X35i5wrhivOWLg80neZC1YEoLV8OghFz3a/C
	XRuOXZEvKOmuR3KX8h98aGIXRHDz9CtcoHywKKSdpb5uy9GLtxn5O3vH5aJGM6j3mczOyWxUSRiWe
	2ATv39og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINGV-00000004zHT-11kH;
	Mon, 10 Nov 2025 08:28:43 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINGS-00000004zGE-2M7k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 08:28:41 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vINGI-0006Qj-Bo; Mon, 10 Nov 2025 09:28:30 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vINGI-007zQs-00;
	Mon, 10 Nov 2025 09:28:30 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vINGC-0000000048w-3mgZ;
	Mon, 10 Nov 2025 09:28:24 +0100
Message-ID: <6ec725f916737f2f25bf3ce4df412b4c07f6449e.camel@pengutronix.de>
Subject: Re: [PATCH 2/6] media: staging: media: imx6-mipi-csi2: use
 devm_add_action_or_reset() to simplify code
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>, Steve Longerbeam <slongerbeam@gmail.com>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team	 <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 10 Nov 2025 09:28:24 +0100
In-Reply-To: <20251107-stage-csi2-cleanup-v1-2-5d42535243ac@nxp.com>
References: <20251107-stage-csi2-cleanup-v1-0-5d42535243ac@nxp.com>
	 <20251107-stage-csi2-cleanup-v1-2-5d42535243ac@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_002840_596267_97447493 
X-CRM114-Status: GOOD (  17.65  )
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

On Fr, 2025-11-07 at 15:44 -0500, Frank Li wrote:
> Use devm_add_action_or_reset() to simplify the code. No functional change=
.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/staging/media/imx/imx6-mipi-csi2.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging=
/media/imx/imx6-mipi-csi2.c
> index 42256441b881d9f132ad7ff899d6f1e35643b4ac..eba9a650030f5e380aa900b94=
728ad375171c6a5 100644
> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> @@ -716,6 +716,14 @@ static int csi2_async_register(struct csi2_dev *csi2=
)
>  	return ret;
>  }
> =20
> +static void csi2_nf_cleanup(void *data)
> +{
> +	struct csi2_dev *csi2 =3D data;
> +
> +	v4l2_async_nf_unregister(&csi2->notifier);
> +	v4l2_async_nf_cleanup(&csi2->notifier);
> +}
> +
>  static int csi2_probe(struct platform_device *pdev)
>  {
>  	struct csi2_dev *csi2;
> @@ -749,6 +757,10 @@ static int csi2_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D devm_add_action_or_reset(&pdev->dev, csi2_nf_cleanup, csi2);
> +	if (ret)
> +		return ret;
> +
>  	csi2->pllref_clk =3D devm_clk_get(&pdev->dev, "ref");
>  	if (IS_ERR(csi2->pllref_clk)) {
>  		v4l2_err(&csi2->sd, "failed to get pll reference clock\n");
> @@ -800,8 +812,6 @@ static int csi2_probe(struct platform_device *pdev)
>  	return 0;
> =20
>  clean_notifier:
> -	v4l2_async_nf_unregister(&csi2->notifier);
> -	v4l2_async_nf_cleanup(&csi2->notifier);
>  	clk_disable_unprepare(csi2->dphy_clk);
>  pllref_off:
>  	clk_disable_unprepare(csi2->pllref_clk);
> @@ -815,8 +825,6 @@ static void csi2_remove(struct platform_device *pdev)
>  	struct v4l2_subdev *sd =3D platform_get_drvdata(pdev);
>  	struct csi2_dev *csi2 =3D sd_to_dev(sd);
> =20
> -	v4l2_async_nf_unregister(&csi2->notifier);
> -	v4l2_async_nf_cleanup(&csi2->notifier);
>  	v4l2_async_unregister_subdev(sd);

This effectively moves the notifier unregister after the subdev
unregister. Is that safe to do?


regards
Philipp

