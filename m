Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FABCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 08:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32vBu0DN6FBF+6YBDAY6Nt1+U+wuJn/r1QiWXKemPtE=; b=X+eMzv2gGiqwnLlx78fGkUif/B
	fmaDLs/d+X7MxxTHYBulJiUlVbX8pfvIEzJ73ObUogbF5KDzlCFfDBLi4ggFS2DCZ+g82ehK47gL1
	mBEviI+npWzC9OZ2Dhe+euJj0WIopXnnxF9P7pggSfwxyzZaSX+HWh2TX5Gtu0QAmG3oRe98rFHBV
	PUQ1ESkXnN1XkzOz5dQ+/IYXzX1oYgjh7zNHT+N82nTx4WNC9M8fleP1BCGWrBB6MV3a4pXMreXja
	Z/SSiKoiNFuP8MhNNKWr6cNOswO31c24r+w43IA4YpnTK9k8Be6bHE6NPbPAC3mt7ZYpq+l1JA8an
	T+ntOt8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINFT-00000004z5l-2bVG;
	Mon, 10 Nov 2025 08:27:39 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINFN-00000004z4o-1odV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 08:27:35 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vINFB-0006EL-PQ; Mon, 10 Nov 2025 09:27:21 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vINFB-007zQY-0g;
	Mon, 10 Nov 2025 09:27:21 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vINFB-00000000472-0YzL;
	Mon, 10 Nov 2025 09:27:21 +0100
Message-ID: <90e5e430743eaca4b21097c64c42dd4f579bc48b.camel@pengutronix.de>
Subject: Re: [PATCH 5/6] media: staging: media: imx6-mipi-csi2: use guard()
 to simplify code
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>, Steve Longerbeam <slongerbeam@gmail.com>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team	 <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 10 Nov 2025 09:27:21 +0100
In-Reply-To: <20251107-stage-csi2-cleanup-v1-5-5d42535243ac@nxp.com>
References: <20251107-stage-csi2-cleanup-v1-0-5d42535243ac@nxp.com>
	 <20251107-stage-csi2-cleanup-v1-5-5d42535243ac@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_002733_560890_2ABC5933 
X-CRM114-Status: GOOD (  18.66  )
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
> Use guard() to simplify mutex locking. No functional change.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/staging/media/imx/imx6-mipi-csi2.c | 54 +++++++++++-------------=
------
>  1 file changed, 19 insertions(+), 35 deletions(-)
>=20
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging=
/media/imx/imx6-mipi-csi2.c
> index f8d0b3b8b250774af51f2aba731e639131aceff9..54e9491d3428686288a5bc9bb=
58a5a0a25aca696 100644
> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> @@ -413,21 +413,17 @@ static int csi2_s_stream(struct v4l2_subdev *sd, in=
t enable)
>  	struct csi2_dev *csi2 =3D sd_to_dev(sd);
>  	int i, ret =3D 0;
> =20
> -	mutex_lock(&csi2->lock);
> +	guard(mutex)(&csi2->lock);
> =20
> -	if (!csi2->src_sd) {
> -		ret =3D -EPIPE;
> -		goto out;
> -	}
> +	if (!csi2->src_sd)
> +		return -EPIPE;
> =20
>  	for (i =3D 0; i < CSI2_NUM_SRC_PADS; i++) {
>  		if (csi2->sink_linked[i])
>  			break;
>  	}
> -	if (i >=3D CSI2_NUM_SRC_PADS) {
> -		ret =3D -EPIPE;
> -		goto out;
> -	}
> +	if (i >=3D CSI2_NUM_SRC_PADS)
> +		return -EPIPE;
> =20
>  	/*
>  	 * enable/disable streaming only if stream_count is
> @@ -442,14 +438,12 @@ static int csi2_s_stream(struct v4l2_subdev *sd, in=
t enable)
>  	else
>  		csi2_stop(csi2);
>  	if (ret)
> -		goto out;
> +		return ret;
> =20
>  update_count:
>  	csi2->stream_count +=3D enable ? 1 : -1;
>  	if (csi2->stream_count < 0)
>  		csi2->stream_count =3D 0;
> -out:
> -	mutex_unlock(&csi2->lock);
>  	return ret;

This is mixing goto and cleanup in the same function, which the scope-
based cleanup helpers documentation suggests shouldn't be done.

In this case I see no problem because we only jump to update_count from
under the lock, but since issues with gotos around automatic cleanup
are easy to miss, I think it would be better to also turn the
update_count jump into a conditional block.


regards
Philipp

