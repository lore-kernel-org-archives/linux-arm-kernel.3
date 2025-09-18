Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBD6CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HU+3hao0AGhNjnLWMfw1M5tpKm2iWkSqmAgvPnKhjc=; b=m1yMRe9zuQDCo3Dn+C1TqaTSkp
	RVTALSCn8RecVdrL8epOXZrjrZYYACeIRA9bKsmnSZw+Dgb8b/cYBVrnJ+9WXsdT03h/RIkUQSJpG
	hQWVTzQHXYHlRBxO2Tn/KwNmICSu9YxFqvle2OdjNJZL3Kbu7siu2++hgXX3AAULVeyWk6R5sMvXk
	1Q9DhdU6xEuE9SDWHYfqAH99BcBLlz0BjrW58bMidyTH6nC/UqEzzWXdOc+qIUiwt7cbILlh+4BYe
	BvBczfXZq6jkbWnPbBYd6uxCep2rtIlhnqyZhwx06uapRzUE7r1kgRozUfVT80kAeXU7v+FFrb6Hz
	tJ8cBnRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGTK-00000000M7W-02LC;
	Thu, 18 Sep 2025 15:22:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGTH-00000000M55-2BwV;
	Thu, 18 Sep 2025 15:22:56 +0000
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 093FA50A;
	Thu, 18 Sep 2025 17:21:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758208892;
	bh=GKkYmmR++BxIKlgEMM3q6UhznVoJrmD++tiTiNw8cpA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Ybga3xc7FMzy65hN5/59YAUSDmXg8YsVTcCIbnVdDEpD9Ef/9+hPNm3GMuh7wGO9J
	 FgaKQ69CvBpbgiJfZCMoNjcCNnG/CI8EkjBOtYOkdrrn3LIArrN42IHUiOkMRXhvSK
	 Rsmy+K0zZXIbQYOy74/V7BAMQdxQmMylSM5PWN2Y=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250918145504.111428-2-stefan.klug@ideasonboard.com>
References: <20250918145504.111428-2-stefan.klug@ideasonboard.com>
Subject: Re: [PATCH v2] media: rkisp1: Improve frame sequence correctness on stats and params buffers
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Dafna Hirschfeld <dafna@fastmail.com>, Heiko Stuebner <heiko@sntech.de>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Stefan Klug <stefan.klug@ideasonboard.com>, linux-media@vger.kernel.org
Date: Thu, 18 Sep 2025 16:22:48 +0100
Message-ID: <175820896821.1246375.16035780810428204673@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_082255_699131_426FCB03 
X-CRM114-Status: GOOD (  34.98  )
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

Quoting Stefan Klug (2025-09-18 15:54:33)
> On the rkisp1 (in my case on a NXP i.MX8 M Plus) the ISP interrupt
> handler is sometimes called with RKISP1_CIF_ISP_V_START (start of frame)
> and RKISP1_CIF_ISP_FRAME (end of frame) being set at the same time. In
> commit 8524fa22fd2f ("media: staging: rkisp1: isp: add a warning and
> debugfs var for irq delay") a warning was added for that. There are two
> cases where this condition can occur:
>=20
> 1. The v-sync and the frame-end belong to the same frame. This means,
>    the irq was heavily delayed and the warning is likely appropriate.
>=20
> 2. The v-sync belongs to the next frame. This can happen if the vertical
>    blanking between two frames is very short.
>=20
> The current code always handles case 1 although case 2 is in my
> experience the more common case and happens in regular usage. This leads
> to incorrect sequence numbers on stats and params buffers which in turn
> breaks the regulation in user space. Fix that by adding a frame_active
> flag to distinguish between these cases and handle the start of frame
> either at the beginning or at the end of the rkisp1_isp_isr().
>=20
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
>=20
> ---
>=20
> Hi all,
>=20
> Here is an updated version of the patch with some fixes from the review.
>=20
> Changes in v2:
> - Removed test for !frame_active in second v_start handler
> - Improved comments
>=20
> Best regards,
> Stefan
>=20
> ---
>  .../platform/rockchip/rkisp1/rkisp1-common.h  |  1 +
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 27 +++++++++++++++----
>  2 files changed, 23 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/dri=
vers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index ca952fd0829b..adf23416de9a 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -222,6 +222,7 @@ struct rkisp1_isp {
>         struct media_pad pads[RKISP1_ISP_PAD_MAX];
>         const struct rkisp1_mbus_info *sink_fmt;
>         __u32 frame_sequence;
> +       bool frame_active;
>  };
> =20
>  /*
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/driver=
s/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 8c29a1c9309a..2e49764d6262 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -965,6 +965,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd=
, int enable)
>         }
> =20
>         isp->frame_sequence =3D -1;
> +       isp->frame_active =3D false;
> =20
>         sd_state =3D v4l2_subdev_lock_and_get_active_state(sd);
> =20
> @@ -1086,12 +1087,15 @@ void rkisp1_isp_unregister(struct rkisp1_device *=
rkisp1)
>   * Interrupt handlers
>   */
> =20
> -static void rkisp1_isp_queue_event_sof(struct rkisp1_isp *isp)
> +static void rkisp1_isp_sof(struct rkisp1_isp *isp)
>  {
>         struct v4l2_event event =3D {
>                 .type =3D V4L2_EVENT_FRAME_SYNC,
>         };
> =20
> +       isp->frame_sequence++;
> +       isp->frame_active =3D true;
> +
>         event.u.frame_sync.frame_sequence =3D isp->frame_sequence;
>         v4l2_event_queue(isp->sd.devnode, &event);
>  }
> @@ -1111,15 +1115,20 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
> =20
>         rkisp1_write(rkisp1, RKISP1_CIF_ISP_ICR, status);
> =20
> -       /* Vertical sync signal, starting generating new frame */
> -       if (status & RKISP1_CIF_ISP_V_START) {
> -               rkisp1->isp.frame_sequence++;
> -               rkisp1_isp_queue_event_sof(&rkisp1->isp);
> +       /*
> +        * Vertical sync signal, starting new frame. Defer handling of vs=
ync
> +        * after RKISP1_CIF_ISP_FRAME if the previous frame was not compl=
eted
> +        * yet.
> +        */
> +       if (status & RKISP1_CIF_ISP_V_START && !rkisp1->isp.frame_active)=
 {
> +               status &=3D ~RKISP1_CIF_ISP_V_START;
> +               rkisp1_isp_sof(&rkisp1->isp);
>                 if (status & RKISP1_CIF_ISP_FRAME) {
>                         WARN_ONCE(1, "irq delay is too long, buffers migh=
t not be in sync\n");

Now I've read below - I see how in here we've had both a frame start and
a frame end without processing an IRQ at all.

I'm trying to figure out if the ISR should always just process frame end
events before frame starts ... but then i think we wouldn't catch this
case so I suspect this is fine keeping it how things are now.


>                         rkisp1->debug.irq_delay++;
>                 }
>         }
> +
>         if (status & RKISP1_CIF_ISP_PIC_SIZE_ERROR) {
>                 /* Clear pic_size_error */
>                 isp_err =3D rkisp1_read(rkisp1, RKISP1_CIF_ISP_ERR);
> @@ -1138,6 +1147,7 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
>         if (status & RKISP1_CIF_ISP_FRAME) {
>                 u32 isp_ris;
> =20
> +               rkisp1->isp.frame_active =3D false;
>                 rkisp1->debug.complete_frames++;
> =20
>                 /* New frame from the sensor received */
> @@ -1152,5 +1162,12 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
>                 rkisp1_params_isr(rkisp1);
>         }
> =20
> +       /*
> +        * Deferred handling of vsync if RKISP1_CIF_ISP_V_START and
> +        * RKISP1_CIF_ISP_FRAME occurrend in the same irq.

s/occurend/occured/



> +        */
> +       if (status & RKISP1_CIF_ISP_V_START)
> +               rkisp1_isp_sof(&rkisp1->isp);

Aha I see - so this makes sure we /complete/ the frame before we start
another one.

That definitely sounds like a very good thing.

I'd be curuious to add a counter for how often we process a frame start
and frame end in the same ISR too. That likely still means we've got
some undesirable delays?



> +
>         return IRQ_HANDLED;
>  }
> --=20
> 2.48.1
>

