Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE0DC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 15:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wQdFBRo1TdSpxhGnQZqut65bQkPaCXrpPvYuJKTdUcs=; b=zvMNfHYSCpsZ1vrVtIlUJhfOg2
	wjHlhjCFri5E8n0qf2ZAdRP0Qu45NHLYl/M4F8KJ642n5Ks5cOpC/lqZaaWk5FoV3viSBAntcr01u
	vn3kFTQ05LJxQvknkZW4rE69hCAXqNw+YPdlvXraZbhYcqbi+a5t5R9+N02IFi6C7fs8P5UnfwKZj
	t3jNlCghNAMG7/i5uqoWUlbCgtrmCACEguDNY8Aop2i0zZanu+ivY2oNJ62TNphbHKSf6L87QQCX9
	V7lq665wAMpj38C2wr00BBniMdqaM+c59G/1JLr3eCErNNObsgBo50AYLieF5aX3jCzjKvRl3GVBo
	iRQWDg9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNip-00000003F88-19rZ;
	Mon, 27 Jul 2026 15:58:31 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNim-00000003F6i-3l40;
	Mon, 27 Jul 2026 15:58:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1785167901; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d8zZ9UX2zp2QPopT1k7QDq1kW/lQybmuIFYY4cni+yVhSUcdCfvUR9REWyU0xzjcN/ZwngpScp3aS0IDj8Bc1M/reBndeMfNbAIna5ahLRaL4OCCFpAEJf6a26Ut4sDu/ydinqi5+aifb1ZvXZV5xziocd68W03ip1/jPaBLvYU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785167901; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wQdFBRo1TdSpxhGnQZqut65bQkPaCXrpPvYuJKTdUcs=; 
	b=PJcqBWyL/lZ3oM0JFedFk8v4RbLYkAXz0qDPXQRl1tfWDi6RSifOSm+0HIQa90NRmES/A8eJICkAxx0vGVqRgTvvcI2Aoe9c9RLuJttAthsveixa0KbBj30P0OabONCe1PP8ZpRsKu55PPsuFUJRaQl+9pHhod6nYmRzQX1XI8g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785167901;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=wQdFBRo1TdSpxhGnQZqut65bQkPaCXrpPvYuJKTdUcs=;
	b=YC3N2N9OWM8ivM8DM354VhFSyHScwRxUZqwYrwL1eGhWfSKUgj0kKNZGdDtTeQdi
	puAihjPHQuqzg0YfXnHWEEDeDISIk3UacUVji07nNNPnm4LiIAsXzdzJCbf/6+l/NkB
	arXwCrXU0xOHNzvtG7DgjVkKN5xMy4aGJe+pxYWI=
Received: by mx.zohomail.com with SMTPS id 1785167897880403.5570477012601;
	Mon, 27 Jul 2026 08:58:17 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Igor Paunovic <royalnet026@gmail.com>,
 Francesco Saverio Pavone <pavone.lawyer@gmail.com>,
 Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
Subject: Re: [PATCH 4/4] media: rkvdec: align bytesperline to 64 bytes in
 rkvdec_fill_decoded_pixfmt()
Date: Mon, 27 Jul 2026 11:58:15 -0400
Message-ID: <cb8XVJu6RUmEjMZpl7NA1g@collabora.com>
In-Reply-To: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-4-180fb2d1f10c@gmail.com>
References: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
 <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-4-180fb2d1f10c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_085828_990227_198A88FC 
X-CRM114-Status: GOOD (  15.64  )
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

Hi !

On Sunday, 26 July 2026 16:25:37 EDT Venkata Atchuta Bheemeswara Sarma Darbha 
wrote:
> From: Igor Paunovic <royalnet026@gmail.com>
> 
> Ensure bytesperline is 64-byte aligned and scale sizeimage accordingly.
> 
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
> Signed-off-by: Venkata Atchuta Bheemeswara Sarma Darbha
> <vdarbha0473@gmail.com> ---
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c index
> 436bb460f04e..6ab6530b1cc9 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -102,12 +102,20 @@ static void rkvdec_fill_decoded_pixfmt(struct
> rkvdec_ctx *ctx, struct v4l2_pix_format_mplane *pix_mp)
>  {
>  	const struct rkvdec_variant *variant = ctx->dev->variant;
> +	struct v4l2_plane_pix_format *plane = &pix_mp->plane_fmt[0];
> +	u32 aligned_bpl;
> 
>  	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, pix_mp->width,
> pix_mp->height);
> 
> -	ctx->colmv_offset = pix_mp->plane_fmt[0].sizeimage;
> +	/* ensure bpl is 64 byte aligned and scale sizeimage accordingly. 
*/
> +	aligned_bpl = ALIGN(plane->bytesperline, 64);
> +	if (aligned_bpl != plane->bytesperline) {
> +		plane->sizeimage = plane->sizeimage / plane-
>bytesperline * aligned_bpl;
> +		plane->bytesperline = aligned_bpl;
> +	}

This shouldn't be needed. As you set step_width to 64, 
v4l2_apply_frmsize_constraints() should already do the alignment.

Do you have more context as to when width is not aligned ?

> 
> -	pix_mp->plane_fmt[0].sizeimage += variant->ops->colmv_size(pix_mp-
>width,
> pix_mp->height); +	ctx->colmv_offset = plane->sizeimage;
> +	plane->sizeimage += variant->ops->colmv_size(pix_mp->width,
> pix_mp->height); }
> 
>  static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f,

Regards,
Detlev.




