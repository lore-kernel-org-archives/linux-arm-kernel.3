Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8F7CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 07:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WpWRtK8ySNywc6vRa98PoYyByFQ95dBRMegxQcqflQ=; b=rrx/f4nszspjfQQH+Df0F8wHMA
	OPXH3lT28nFqUZQWKf7CjIF0g1u2vSz9b4ZqkesxrzHcMWLzELmqd51SClOewcBW4bTxNweejkx7E
	fpVamuBDuvdn0R+wSamsdCg0tdPvEn7UN7F4lpozlcVIl0M+l+xtT5iLizFko13Zw6o4uNL3gBzK+
	fIshcH9yKw+zohqx03TdNvy08/WOyv+kYb2e4dzN/hK9onQYXMKk4LRFN9O7islPV30ud8vwqjDC7
	nYoGalr+pj3lkUSj6dPFIWeISHvpsZWyDwONCAUD1WCf12cfnYaNa6wg1hXOFxJ6c+pq7ZG956zN5
	XUnd6QLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQRF-000000074nt-0HXP;
	Tue, 16 Sep 2025 07:49:21 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQRC-000000074mZ-2NcS;
	Tue, 16 Sep 2025 07:49:20 +0000
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:fcf9:6932:9f30:ab03])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CA1A2EC1;
	Tue, 16 Sep 2025 09:47:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758008876;
	bh=0K2ndIPUcsxZYFawVHte97ZxYQVyku5PVXGa06xvoiE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=a8A885MHl+p6S2+cVzoXH8JS+qsIpjE37+wwQdEtWw9MgrsfoU6JWWfhKvQ07DL7W
	 iL+kAeb5HNTK8WQPJXTFRWJD8mQ+mZb6Ig/sCvHWSXb2NLhik22bpbpTFDHbxr0FZY
	 /pjr39ew63H4+AmvyuvMSSYl96v1VbR01k4xxyXs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <rthpkuipbpbp2lv2ddmruwb7fmpkmtlsnx3q6kk7gaskzpdaar@5bk3r44f2mpo>
References: <20250908094200.48002-1-stefan.klug@ideasonboard.com> <rthpkuipbpbp2lv2ddmruwb7fmpkmtlsnx3q6kk7gaskzpdaar@5bk3r44f2mpo>
Subject: Re: [PATCH] media: rkisp1: Improve frame sequence correctness on stats and params buffers
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 16 Sep 2025 09:49:12 +0200
Message-ID: <175800895207.653594.14948138348210533073@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_004919_043461_6CF95AE6 
X-CRM114-Status: GOOD (  44.13  )
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

Thank you for the review.

Quoting Jacopo Mondi (2025-09-15 18:55:44)
> Hi Stefan
>=20
> On Mon, Sep 08, 2025 at 11:41:48AM +0200, Stefan Klug wrote:
> > On the rkisp1 (in my case on a NXP i.MX8 M Plus) the ISP interrupt
> > handler is sometimes called with RKISP1_CIF_ISP_V_START (start of frame)
> > and RKISP1_CIF_ISP_FRAME (end of frame) being set at the same time. In
> > commit 8524fa22fd2f ("media: staging: rkisp1: isp: add a warning and
> > debugfs var for irq delay") a warning was added for that. There are two
> > cases where this condition can occur:
> >
> > 1. The v-sync and the frame-end belong to the same frame. This means,
> >    the irq was heavily delayed and the warning is likely appropriate.
> >
> > 2. The v-sync belongs to the next frame. This can happen if the vertical
> >    blanking between two frames is very short.
> >
> > The current code always handles case 1 although case 2 is in my
> > experience the more common case and happens in regular usage. This leads
>=20
> I would rather argue that 8524fa22fd2f is possibily wrong, and case 1)
> would imply the interrupt has been delayed for the whole frame
> duration (+ blanking), which seems unlikely to me ?

I am not completely sure about that. I didn't hunt for that condition.
Note that RKISP1_CIF_ISP_FRAME comes before the blanking. So I could
imagine that this might occur for very small sensor crop rectangles at
high datarates.

>=20
> True we handle stats collection and parameters programming in irq
> context, which is less than ideal and could take time (I wonder if we
> should use a threaded irq, but that's a different problem)
>=20
> If that's the case and we only should care about 2) would simply
> handling RKISP1_CIF_ISP_FRAME before RKISP1_CIF_ISP_V_START be enough ?

That was my first try. But it felt not right to run a whole
rkisp1_isp_isr() with frame_sequence being set to -1. And as I believe
that there is at least a slight chance that 1) might occur, I'd prefer
frame_sequence to be 0 in that case.

>=20
> > to incorrect sequence numbers on stats and params buffers which in turn
> > breaks the regulation in user space. Fix that by adding a frame_active
> > flag to distinguish between these cases and handle the start of frame
> > either at the beginning or at the end of the rkisp1_isp_isr().
> >
> > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-common.h    |  1 +
> >  .../media/platform/rockchip/rkisp1/rkisp1-isp.c | 17 +++++++++++++----
> >  2 files changed, 14 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/d=
rivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > index ca952fd0829b..adf23416de9a 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > @@ -222,6 +222,7 @@ struct rkisp1_isp {
> >       struct media_pad pads[RKISP1_ISP_PAD_MAX];
> >       const struct rkisp1_mbus_info *sink_fmt;
> >       __u32 frame_sequence;
> > +     bool frame_active;
> >  };
> >
> >  /*
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/driv=
ers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > index 8c29a1c9309a..1469075b2d45 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > @@ -965,6 +965,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *=
sd, int enable)
> >       }
> >
> >       isp->frame_sequence =3D -1;
> > +     isp->frame_active =3D false;
> >
> >       sd_state =3D v4l2_subdev_lock_and_get_active_state(sd);
> >
> > @@ -1086,12 +1087,15 @@ void rkisp1_isp_unregister(struct rkisp1_device=
 *rkisp1)
> >   * Interrupt handlers
> >   */
> >
> > -static void rkisp1_isp_queue_event_sof(struct rkisp1_isp *isp)
> > +static void rkisp1_isp_sof(struct rkisp1_isp *isp)
> >  {
> >       struct v4l2_event event =3D {
> >               .type =3D V4L2_EVENT_FRAME_SYNC,
> >       };
> >
> > +     isp->frame_sequence++;
> > +     isp->frame_active =3D true;
> > +
> >       event.u.frame_sync.frame_sequence =3D isp->frame_sequence;
> >       v4l2_event_queue(isp->sd.devnode, &event);
> >  }
> > @@ -1112,14 +1116,15 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
> >       rkisp1_write(rkisp1, RKISP1_CIF_ISP_ICR, status);
> >
> >       /* Vertical sync signal, starting generating new frame */
> > -     if (status & RKISP1_CIF_ISP_V_START) {
> > -             rkisp1->isp.frame_sequence++;
> > -             rkisp1_isp_queue_event_sof(&rkisp1->isp);
> > +     if (status & RKISP1_CIF_ISP_V_START && !rkisp1->isp.frame_active)=
 {
> > +             status &=3D ~RKISP1_CIF_ISP_V_START;
> > +             rkisp1_isp_sof(&rkisp1->isp);
> >               if (status & RKISP1_CIF_ISP_FRAME) {
> >                       WARN_ONCE(1, "irq delay is too long, buffers migh=
t not be in sync\n");
> >                       rkisp1->debug.irq_delay++;
> >               }
> >       }
> > +
> >       if (status & RKISP1_CIF_ISP_PIC_SIZE_ERROR) {
> >               /* Clear pic_size_error */
> >               isp_err =3D rkisp1_read(rkisp1, RKISP1_CIF_ISP_ERR);
> > @@ -1138,6 +1143,7 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
> >       if (status & RKISP1_CIF_ISP_FRAME) {
> >               u32 isp_ris;
> >
> > +             rkisp1->isp.frame_active =3D false;
> >               rkisp1->debug.complete_frames++;
> >
> >               /* New frame from the sensor received */
> > @@ -1152,5 +1158,8 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
> >               rkisp1_params_isr(rkisp1);
> >       }
> >
> > +     if (status & RKISP1_CIF_ISP_V_START && !rkisp1->isp.frame_active)
>=20
> I think you can drop the  && !rkisp1->isp.frame_active because if you
> get here and 'status & RKISP1_CIF_ISP_V_START' it means that:
>=20
> 1) frame_active was false and you have entered the above
>=20
>         if (status & RKISP1_CIF_ISP_V_START && !rkisp1->isp.frame_active)=
 {
>=20
>    and now the RKISP1_CIF_ISP_V_START bit in 'status' has been cleared
>    so you don't need to handle VSYNC here
>=20
> 2) frame_active was true and you delayed handling V_START till here.
>    If also ISP_FRAME was set, frame_start has been set to false here
>    above. If ISP_FRAME was not set then it has been delivered by a
>    previous interrupt and then frame_start is false.
>=20
> So I guess it's enough to check if at this point RKISP1_CIF_ISP_V_START
> is still set in 'status' ?

I think you are right. I can't come up with a sane condition where
frame_active=3D=3Dtrue and RKISP1_CIF_ISP_V_START is set and we *don't* want
to increase the frame count. I'll drop that condition.

>=20
> However, as said, it's seems unlikely to that your above 1) can
> happen. Have you ever hit a WARN() again with this patch applied ?

I don't remember seeing it again. But as noted above, I didn't try to
provoke it and took the "better safe than sorry" route. Could you go
with that?

Best regards,
Stefan

>=20
> > +             rkisp1_isp_sof(&rkisp1->isp);
> > +
> >       return IRQ_HANDLED;
> >  }
> > --
> > 2.48.1
> >
> >

