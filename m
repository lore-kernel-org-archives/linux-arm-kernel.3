Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C82E9A049
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 03:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJxYiClBW0yaU0UstjevB3SvAEeRfDkA/ZHkI+qZCGk=; b=mct/f+EkbQz1CKeiRC8+2UJahf
	/WX/gMT51PvUzsVWFB035YJLdgXMJFRnUi9XIo7m0gaYKBxwHxow6TrFC27y0ak7FNt8RWmiRzTxZ
	hZWb94cnjw1liOc0pZLpvFZKrpGoa14Mtzz0rHx6C2f5BJ9RTf7751brWKGPXgrbaPjaeACGDkDP+
	GeIl6os2Ml0fqq6MnXK/M9feZ8xlKbtkFLw/3OCvdauMbg2/1p5pPgPiDPCxq37eqXKjx8tpFA5XP
	DfkGPnLba9IylUYcqhxkQKHg5NnZmSWlhpJey0oLphN+x9NgflgJZn/34MFyYAC4yqYoGxTpm/NXX
	d+9Ix+2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsYAR-00000009ENp-2NWt;
	Wed, 18 Feb 2026 03:23:59 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsYAO-00000009ENM-3sd3;
	Wed, 18 Feb 2026 03:23:58 +0000
Received: from neptunite.rasen.tech (unknown [IPv6:2404:7a81:160:2100:e39a:e0d4:739a:978])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 425A166B;
	Wed, 18 Feb 2026 04:23:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771384982;
	bh=XATtTewez/t8FFgr/Q7a3oAK/bpwADOb4HhHCmUxTR4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qjQgakFimSjo+7hVS83lyznzRBzJ0wGgos8/mczeTo4OWWaGziEKi8WmzdwLOj6l3
	 zaaSV+S2q447z69uWL2HwUQH82Y4TNYgD9LxMajb9ODdF4Z4aGS1CHRwWrbh7l7stu
	 O92zjCg78vyhneBHkYq/+kv7XlZ0mejUHnISLgSw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <23791918-8fed-404d-ad51-d97966ff58c1@collabora.com>
References: <20260216-rkcif-fixes-v1-0-b16db20b6d68@collabora.com> <20260216-rkcif-fixes-v1-2-b16db20b6d68@collabora.com> <23791918-8fed-404d-ad51-d97966ff58c1@collabora.com>
Subject: Re: [PATCH 2/2] media: rockchip: rkcif: comply with minimum number of buffers requirement
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: Collabora Kernel Team <kernel@collabora.com>, stable@kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, Michael Riesch <michael.riesch@collabora.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 18 Feb 2026 12:23:48 +0900
Message-ID: <177138502835.607498.8225991057811144969@neptunite.rasen.tech>
User-Agent: alot/0.0.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_192357_128890_77D98DB8 
X-CRM114-Status: GOOD (  21.11  )
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

Hi Michael,

Thanks for the patch.

Quoting Michael Riesch (2026-02-17 21:25:10)
> Hi all,
>=20
> On 2/16/26 14:49, Michael Riesch via B4 Relay wrote:
> > From: Michael Riesch <michael.riesch@collabora.com>
> >=20
> > Each stream requires CIF_REQ_BUFS_MIN=3D1 buffers to enable streaming.
> > However, it failed with only one buffer provided.
> >=20
> > Comply with the minimum number of buffers requirement and accept
> > exactly one buffer.
> >=20
> > Fixes: 501802e2ad51 ("media: rockchip: rkcif: add abstraction for dma b=
locks")
> > Cc: stable@kernel.org
> > Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> > ---
> >  .../media/platform/rockchip/rkcif/rkcif-stream.c   | 41 +++++++++++---=
--------
> >  1 file changed, 21 insertions(+), 20 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/dri=
vers/media/platform/rockchip/rkcif/rkcif-stream.c
> > index e00010a91e8b..5a5ab9e7e86e 100644
> > --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> > +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> > @@ -106,19 +106,6 @@ static int rkcif_stream_init_buffers(struct rkcif_=
stream *stream)
> >  {
> >       struct v4l2_pix_format_mplane *pix =3D &stream->pix;
> > =20
> > -     stream->buffers[0] =3D rkcif_stream_pop_buffer(stream);
> > -     if (!stream->buffers[0])
> > -             goto err_buff_0;
> > -
> > -     stream->buffers[1] =3D rkcif_stream_pop_buffer(stream);
> > -     if (!stream->buffers[1])
> > -             goto err_buff_1;
> > -
> > -     if (stream->queue_buffer) {
> > -             stream->queue_buffer(stream, 0);
> > -             stream->queue_buffer(stream, 1);
> > -     }
> > -
> >       stream->dummy.size =3D pix->num_planes * pix->plane_fmt[0].sizeim=
age;
> >       stream->dummy.vaddr =3D
> >               dma_alloc_attrs(stream->rkcif->dev, stream->dummy.size,
> > @@ -132,16 +119,30 @@ static int rkcif_stream_init_buffers(struct rkcif=
_stream *stream)
> >                       stream->dummy.buffer.buff_addr[i - 1] +
> >                       pix->plane_fmt[i - 1].bytesperline * pix->height;
> > =20
> > -     return 0;
> > +     stream->buffers[0] =3D rkcif_stream_pop_buffer(stream);
> > +     if (!stream->buffers[0])
> > +             goto err_buff_0;
> > =20
> > -err_dummy:
> > -     rkcif_stream_return_buffer(stream->buffers[1], VB2_BUF_STATE_QUEU=
ED);
> > -     stream->buffers[1] =3D NULL;
> > +     stream->buffers[1] =3D rkcif_stream_pop_buffer(stream);
> > +     if (!stream->buffers[1]) {
> > +             stream->buffers[stream->frame_phase] =3D &stream->dummy.b=
uffer;
> > +             stream->buffers[stream->frame_phase]->is_dummy =3D true;
>=20
> Apparently I was too quick on the trigger here. This should read
> "stream->buffers[1]" in both lines *facepalm*. Will wait for other
> responses and send a v2.

With this fix I've tested that it works, and it looks good to me :)


Paul

>=20
> Best regards,
> Michael
>=20
> > +     }
> > +
> > +     if (stream->queue_buffer) {
> > +             stream->queue_buffer(stream, 0);
> > +             stream->queue_buffer(stream, 1);
> > +     }
> > +
> > +     return 0;
> > =20
> > -err_buff_1:
> > -     rkcif_stream_return_buffer(stream->buffers[0], VB2_BUF_STATE_QUEU=
ED);
> > -     stream->buffers[0] =3D NULL;
> >  err_buff_0:
> > +     dma_free_attrs(stream->rkcif->dev, stream->dummy.size,
> > +                    stream->dummy.vaddr,
> > +                    stream->dummy.buffer.buff_addr[0],
> > +                    DMA_ATTR_NO_KERNEL_MAPPING);
> > +     stream->dummy.vaddr =3D NULL;
> > +err_dummy:
> >       return -EINVAL;
> >  }
> > =20
> >=20
>

