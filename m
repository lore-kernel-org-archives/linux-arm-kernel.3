Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34B6C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 09:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nTaj3V4Mkje2f1xYZaK63sM715jvfiqC4wM4iuP4wM=; b=qJdeae90QlmTyC+yU6vuqxFGrG
	apbzGUAigpWN/mwMNvdZOwRx9nSlZfbr+y9Ap9LDJC5KzDvo/q4VavOsUjuTle2RM8mbpw8rJeFyF
	0zw52DIPGx7AlKgBAVcXofP71lfEGUY0eCprZ8tKNjcz02yLzRFxJJs/cB1+kufV8fhZLo3WOsNWR
	5MYWRMx7NGlsNYdhsCAB+v1JHBlubSbpnIThofyOpMYlaaIgAGvDHs75DXn+RsdCmervjWFse66rD
	SkeH9F2PUvLKndql5h7DCLKSU/Y7WLS+jl0eMDkM1RkDpJM3kiIm8LbMhFJZkVHCtTIMq8Yxebvmu
	JxO1nf6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXiP-00000004eTc-3n0Q;
	Tue, 01 Jul 2025 09:55:49 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXM0-00000004btb-2XsQ;
	Tue, 01 Jul 2025 09:32:41 +0000
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:7cdc:2548:b8ee:3b98])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2CD5C6F3;
	Tue,  1 Jul 2025 11:32:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751362335;
	bh=I11qWhbNN6U3C+Rd/QDSNHcVavQao4wKdPiAqL+l9x0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=V+yUEP0bAH1keElCHZayO0cnWaM3hDlCDOArE6a6uGOLxtHNTX7ZxHt4gvIyLfDZJ
	 2xZu5y8TcVZGYP51FZq0Je9wMu+9ZQGpaoLObGv8CU4R24SiluO9keRtI/+2St87E7
	 uJhf97xrzvUXqspGXqAXeNYlIXqwbBO1DxlMTJKA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250701-pispbe-clamp-v1-1-31243db3439b@ideasonboard.com>
References: <20250701-pispbe-clamp-v1-1-31243db3439b@ideasonboard.com>
Subject: Re: [PATCH] media: pisp_be: Use clamp() and define max sizes
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Date: Tue, 01 Jul 2025 11:32:34 +0200
Message-ID: <175136235475.2426344.4455960698221532956@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_023240_789892_E426EFB0 
X-CRM114-Status: GOOD (  13.82  )
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

Hi Jacopo,

Thank you for the patch.=20

Quoting Jacopo Mondi (2025-07-01 10:55:05)
> Use the clamp() from minmax.h and provide a define for the max size as
> they will be used in sequent patches.

nit-picking: I believe either "Use clamp() from" or "Use the clamp() functi=
on
from"

>=20
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Stefan Klug <stefan.klug@ideasonboard.com>=20

> ---
>  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c  | 11 +++++++----
>  include/uapi/linux/media/raspberrypi/pisp_be_config.h |  9 +++++----
>  2 files changed, 12 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drive=
rs/media/platform/raspberrypi/pisp_be/pisp_be.c
> index 7596ae1f7de6671484d4d351015b234829f642d4..ac5840b4be478ccdd7da9d6d0=
745649e0c1b2b6f 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> @@ -9,6 +9,7 @@
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/lockdep.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> @@ -1114,10 +1115,12 @@ static void pispbe_try_format(struct v4l2_format =
*f, struct pispbe_node *node)
>         f->fmt.pix_mp.pixelformat =3D fmt->fourcc;
>         f->fmt.pix_mp.num_planes =3D fmt->num_planes;
>         f->fmt.pix_mp.field =3D V4L2_FIELD_NONE;
> -       f->fmt.pix_mp.width =3D max(min(f->fmt.pix_mp.width, 65536u),
> -                                 PISP_BACK_END_MIN_TILE_WIDTH);
> -       f->fmt.pix_mp.height =3D max(min(f->fmt.pix_mp.height, 65536u),
> -                                  PISP_BACK_END_MIN_TILE_HEIGHT);
> +       f->fmt.pix_mp.width =3D clamp(f->fmt.pix_mp.width,
> +                                   PISP_BACK_END_MIN_TILE_WIDTH,
> +                                   PISP_BACK_END_MAX_TILE_WIDTH);
> +       f->fmt.pix_mp.height =3D clamp(f->fmt.pix_mp.height,
> +                                    PISP_BACK_END_MIN_TILE_HEIGHT,
> +                                    PISP_BACK_END_MAX_TILE_HEIGHT);
> =20
>         /*
>          * Fill in the actual colour space when the requested one was
> diff --git a/include/uapi/linux/media/raspberrypi/pisp_be_config.h b/incl=
ude/uapi/linux/media/raspberrypi/pisp_be_config.h
> index cbeb714f4d61ad53162c0450f2303431a5958040..2ad3b90684d7be80776af75b5=
c5009f7b677f466 100644
> --- a/include/uapi/linux/media/raspberrypi/pisp_be_config.h
> +++ b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
> @@ -21,10 +21,11 @@
>  /* preferred byte alignment for outputs */
>  #define PISP_BACK_END_OUTPUT_MAX_ALIGN 64u
> =20
> -/* minimum allowed tile width anywhere in the pipeline */
> -#define PISP_BACK_END_MIN_TILE_WIDTH 16u
> -/* minimum allowed tile width anywhere in the pipeline */
> -#define PISP_BACK_END_MIN_TILE_HEIGHT 16u
> +/* minimum allowed tile sizes anywhere in the pipeline */
> +#define PISP_BACK_END_MIN_TILE_WIDTH   16u
> +#define PISP_BACK_END_MIN_TILE_HEIGHT  16u
> +#define PISP_BACK_END_MAX_TILE_WIDTH   65536u
> +#define PISP_BACK_END_MAX_TILE_HEIGHT  65536u
> =20
>  #define PISP_BACK_END_NUM_OUTPUTS 2
>  #define PISP_BACK_END_HOG_OUTPUT 1
>=20
> ---
> base-commit: 35392e855abf7d02ad3b061cbc75c7c7c37f0577
> change-id: 20250623-pispbe-clamp-4b33011d0e85
>=20
> Best regards,
> --=20
> Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>=20
>

