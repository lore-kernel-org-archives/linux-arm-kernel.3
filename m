Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CAECCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 08:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7r1yJFpKCkjLUfbUZcyXcTSjMKNnW7iNZayU/27BtE=; b=U/mCc13eey1itmbgWH6hxEsV9w
	ynf1usiFjr9xJc7edmHj15SMiGDGyD1mZ/h5mBGd5dvkaHJ+0f3KkrpjNlhRqxwd+mv+ZZxotI50R
	LYRP9K30NVstE1pUy0Gzbbo9ja2ADFJZ8sTA4L7uqucBZakT//tv8hz4XN6i7qNl2HipSqiwVKbCV
	XLBKGpJAZXS+ezRJ86z5JXm7WFFAp0syTRzdKCV+F3E7p4tJtvv18LfJVmT5Qhv8NFJp0dVOZ149G
	/Wc07hWzapxRyGwdnZO3XPaWiOM+dKCT9oAcXR+GcuhMawEPp93WQPzTP6hBUwCUNymRDuE7/KZFQ
	uQX8Lomg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lkM-00000005SxN-3Mzf;
	Thu, 09 Oct 2025 08:11:34 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lkK-00000005Sw0-0AcW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 08:11:33 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v6lkB-0000S0-Eg; Thu, 09 Oct 2025 10:11:23 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v6lkB-002hZe-0c;
	Thu, 09 Oct 2025 10:11:23 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v6lkB-000000001Qu-0U8v;
	Thu, 09 Oct 2025 10:11:23 +0200
Message-ID: <482fe3561e6b6b46e34042428657069015f3a498.camel@pengutronix.de>
Subject: Re: [PATCH 12/25] media: imx-pxp: Drop unneeded v4l2_m2m_get_vq()
 NULL check
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Shawn Guo
	 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Date: Thu, 09 Oct 2025 10:11:23 +0200
In-Reply-To: <20251008175052.19925-13-laurent.pinchart@ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
	 <20251008175052.19925-13-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_011132_080638_1D69D2C8 
X-CRM114-Status: GOOD (  15.80  )
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

On Mi, 2025-10-08 at 20:50 +0300, Laurent Pinchart wrote:
> The v4l2_m2m_get_vq() function never returns NULL.
>=20
> In the set format handler, the check may have been intended to catch
> invalid format types, but that's not needed as the V4L2 core picks the
> appropriate VIDIOC_S_FMT ioctl handler based on the format type, so the
> type can't be incorrect.
>=20
> In the get format handler, the return value is not used for any purpose
> other than the NULL check, which was therefore probably intended to
> catch invalid format types. That's not needed for the same reason as in
> the set format handler.
>=20
> Drop the unneeded return value checks and, as the function has no side
> effect, the unneeded function call as well.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-pxp.c | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platfor=
m/nxp/imx-pxp.c
> index 7f8ffbac582f..5386650ce194 100644
> --- a/drivers/media/platform/nxp/imx-pxp.c
> +++ b/drivers/media/platform/nxp/imx-pxp.c
> @@ -1180,13 +1180,8 @@ static int pxp_enum_fmt_vid_out(struct file *file,=
 void *priv,
> =20
>  static int pxp_g_fmt(struct pxp_ctx *ctx, struct v4l2_format *f)
>  {
> -	struct vb2_queue *vq;
>  	struct pxp_q_data *q_data;
> =20
> -	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> -	if (!vq)
> -		return -EINVAL;
> -
>  	q_data =3D get_q_data(ctx, f->type);
> =20
>  	f->fmt.pix.width	=3D q_data->width;
> @@ -1329,8 +1324,6 @@ static int pxp_s_fmt(struct pxp_ctx *ctx, struct v4=
l2_format *f)
>  	struct vb2_queue *vq;
> =20
>  	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> -	if (!vq)
> -		return -EINVAL;
> =20
>  	q_data =3D get_q_data(ctx, f->type);
>  	if (!q_data)


Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

