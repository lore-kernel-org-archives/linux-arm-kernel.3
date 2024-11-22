Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46990E65D3F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 09:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8CB8WOobi0NsUlzpJw2qyuKbbHXDJo9rU7wn4TqR3oA=; b=Eepq/yX4pUEYse6wZEGIJH4DU4
	HjsMSIE2Offd5Xpb3qiyAEeiOV8LY8nzqTezqbPsaLYaVW3owTls7wKJYoMYYCMvgwDCn0n0ZqMa3
	s2ArOFLX2zObnneCq4fXZx3vqU/V672kRYnZ+DjVR4WG1iUrBp/xRYWht1yTyhsv6DGsORie0tsQo
	rGASg4lmSDDGjg3d/fpBdCKL8giNFa0MnpqcvbSdxNfuh9SgRQp9JFrLRoiStZ1VnXF/f2HJp7pxO
	ZjwGJw41xsQLdtIzj6tVwVPC3J8WtwCn3+qz7FLr8NyiMKdBLEpkOhHB/ATi7kmxFBnf4EdWOtkUz
	ki8nV8ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQKg-000000029JP-20DK;
	Fri, 22 Nov 2024 09:52:10 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQJi-0000000297I-0HDf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 09:51:12 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5cfd2978f95so2707465a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 01:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732269068; x=1732873868; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CB8WOobi0NsUlzpJw2qyuKbbHXDJo9rU7wn4TqR3oA=;
        b=VoKosvhrQm3eLIf8FVPDv2y8cuNMFzot2Y7oMm+FlRhEtX4LlNv3cO41JRHpfhTtyh
         e+htnITIQ3ptadqjh8AYMk1EdnqQ5XSdMQVKy/s2VyP+7zptVThLw/gHVLeySTSqsxHA
         2clI3E68LMcz+iZZgjF8u/K0xwLni6mnftwtBzoc8EjkhQzdbNm62TxkrywHkrmeNVft
         PL8xwJ9X/bmtuORmOs8yDIzLNOQZboc4/aGrGp98DlOMGv75GbdVr0TES6zZY5t3QE0S
         WdskTvh00z/b4G38cOAtXCuu+t1OPnrjMjdoRew1H9+rbJWsZFUKUxMcJHU4Wktwtm8c
         cQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732269068; x=1732873868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CB8WOobi0NsUlzpJw2qyuKbbHXDJo9rU7wn4TqR3oA=;
        b=AJdvD0UZQ2O1qq990hJEWWu/nI3FJnVyR6E4i2yoxxlEPqdn1N94B4fDaqUqYD+Acp
         Y1x7Oavz6XnIWSpLAft33y+D1igQa5rQgIULS0QmRl3Ip4yVdyaYaGlXCqeReUR7VXlr
         8MGTiMRUY5kcBsKkm1P1sVjXclUr1AJxcU7DGRdkYTU2GqXXIQKDOr2kBztd4eEUr57Q
         w42GUF1Pk+Irq/hfQ4RROAWlq+FZZQlX0ehWggQBmYt6HE9T5/cDOOENcbrmTsHI+8g7
         QaNVccziQHLiAB5hi+1RsPwzKiGIkDNKLnjp3u9nC/1fQ7hUudP+UaZpPDpSkmH3UAhr
         DVKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZqYDKXaKt1S+kwiiyePBKJpdYQtq03S2f6w0UZH6/TixQRhUZJtCZi05D7gnwPQy/kQbTR7+LqlRl3xr3/1Am@lists.infradead.org
X-Gm-Message-State: AOJu0YwP3slRBzXWHC2wFXAij/COqjT4ssIY5+O7a/b76n3pHMMu2ay7
	t1S5Fk0WVKXgSsdOGAP31ga0H0CJn6Pm705HgyRZTXVFy+YPB1QVm/i90yLtswbtX7GxlhD1GlF
	gKQui4YIWQgfD+jcBF7nFghrvDnFvkF55F+o59Q==
X-Gm-Gg: ASbGncvB0kIG9ZjC+tm9md5le3jBhlgpODyJS1Bb6scN8jduOeuMpQvwakFkNfyppDs
	LFPa4TcIZpbeiXMzCizOXFYUmZG1d+A==
X-Google-Smtp-Source: AGHT+IEkU0Mn40THI/AVHurhKWm5N7rlSNrjj7ZiLosKeFVer5SPt3gDYvZssurTE0nVTHMxqmXqPCZcZcDt8ABysRo=
X-Received: by 2002:a17:907:771a:b0:a9a:5cf8:9e40 with SMTP id
 a640c23a62f3a-aa5099fb9f6mr154285266b.24.1732269068577; Fri, 22 Nov 2024
 01:51:08 -0800 (PST)
MIME-Version: 1.0
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
 <767085562b5efb43f248e8528bb154a6c30d3999.camel@mediatek.com>
 <CAEHHSvaePj2MUg+zgmkpZF4HTj_F9ED0RxuzQr2oOAUJgOieng@mail.gmail.com> <bd73658d8ceac0ce236f08f31065350123056724.camel@mediatek.com>
In-Reply-To: <bd73658d8ceac0ce236f08f31065350123056724.camel@mediatek.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 22 Nov 2024 10:50:57 +0100
Message-ID: <CAEHHSvZLx3MqzK_qheiXm1UsB=i=8f2QbGTpXPkdU2aqUJtvww@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	=?UTF-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "fsylvestre@baylibre.com" <fsylvestre@baylibre.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"pnguyen@baylibre.com" <pnguyen@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_015110_127491_A4B6540B 
X-CRM114-Status: GOOD (  39.71  )
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

Le ven. 22 nov. 2024 =C3=A0 10:49, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) <ck.=
hu@mediatek.com> a =C3=A9crit :
>
> On Fri, 2024-11-22 at 10:25 +0100, Julien Stephan wrote:
> > External email : Please do not click links or open attachments until yo=
u have verified the sender or the content.
> >
> >
> > Le ven. 22 nov. 2024 =C3=A0 09:41, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) =
<ck.hu@mediatek.com> a =C3=A9crit :
> > >
> > > Hi, Julien:
> > >
> > > On Thu, 2024-11-21 at 09:53 +0100, Julien Stephan wrote:
> > > > External email : Please do not click links or open attachments unti=
l you have verified the sender or the content.
> > > >
> > > >
> > > > From: Phi-bang Nguyen <pnguyen@baylibre.com>
> > > >
> > > > This driver provides a path to bypass the SoC ISP so that image dat=
a
> > > > coming from the SENINF can go directly into memory without any imag=
e
> > > > processing. This allows the use of an external ISP.
> > > >
> > > > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > > > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > > > [Paul Elder fix irq locking]
> > > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.co=
m>
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> > > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > > ---
> > >
> > > [snip]
> > >
> > > > +static irqreturn_t isp_irq_camsv30(int irq, void *data)
> > > > +{
> > > > +       struct mtk_cam_dev *cam_dev =3D (struct mtk_cam_dev *)data;
> > > > +       struct mtk_cam_dev_buffer *buf;
> > > > +       unsigned int irq_status;
> > > > +
> > > > +       spin_lock(&cam_dev->buf_list_lock);
> > > > +
> > > > +       irq_status =3D mtk_camsv30_read(cam_dev, CAMSV_INT_STATUS);
> > > > +
> > > > +       if (irq_status & INT_ST_MASK_CAMSV_ERR)
> > > > +               dev_err(cam_dev->dev, "irq error 0x%lx\n",
> > > > +                       irq_status & INT_ST_MASK_CAMSV_ERR);
> > > > +
> > > > +       /* De-queue frame */
> > > > +       if (irq_status & CAMSV_IRQ_PASS1_DON) {
> > > > +               cam_dev->sequence++;
> > > > +
> > > > +               buf =3D list_first_entry_or_null(&cam_dev->buf_list=
,
> > > > +                                              struct mtk_cam_dev_b=
uffer,
> > > > +                                              list);
> > > > +               if (buf) {
> > > > +                       buf->v4l2_buf.sequence =3D cam_dev->sequenc=
e;
> > > > +                       buf->v4l2_buf.vb2_buf.timestamp =3D
> > > > +                               ktime_get_ns();
> > > > +                       vb2_buffer_done(&buf->v4l2_buf.vb2_buf,
> > > > +                                       VB2_BUF_STATE_DONE);
> > > > +                       list_del(&buf->list);
> > > > +               }
> > > > +
> > > > +               buf =3D list_first_entry_or_null(&cam_dev->buf_list=
,
> > > > +                                              struct mtk_cam_dev_b=
uffer,
> > > > +                                              list);
> > > > +               if (buf)
> > > > +                       mtk_camsv30_update_buffers_add(cam_dev, buf=
);
> > >
> > > If buf =3D=3D NULL, so hardware would automatically stop DMA?
> > > I don't know how this hardware work.
> > > Below is my imagine about this hardware.
> > >
> > > 1. Software use CAMSV_IMGO_FBC_RCNT_INC to increase software buffer i=
ndex.
> > > 2. Hardware has a hardware buffer index. After hardware finish one fr=
ame, hardware buffer index increase.
> > > 3. After software buffer index increase, hardware start DMA.
> > > 4. When hardware buffer index is equal to software buffer index, hard=
ware automatically stop DMA.
> > >
> > > Does the hardware work as my imagine?
> > > If hardware could automatically stop DMA, add comment to describe.
> > > If hardware could not automatically stop DMA, software should do some=
thing to stop DMA when buf =3D=3D NULL.
> > >
> >
> > You are right except that dma is not stopped but frames are
> > automatically dropped by hardware until a new buffer is enqueued and
> > software uses CAMSV_IMGO_FBC_RCNT_INC to increase the software buffer
> > index.
> >
> > What about adding the following comment:
> >
> > /*
> > * If there is no user buffer available, hardware will drop automaticall=
y
> > * frames until buf_queue is called
> > */
>
> You say DMA is not stopped. Do you mean hardware still write data into la=
test buffer which would be dequeued to user space?
> I think hardware should not write data into the buffer which has been tak=
e away by user space.
> I think software should do something to stop DMA. Maybe use mtk_camsv30_c=
mos_vf_hw_disable() to stop DMA.
>

No, I said frame is dropped.. It does not write any data.

> Regards,
> CK
>
> >
> > Let me know if that works for you
> >
> > Cheers
> > Julien
> >
> > > Regards,
> > > CK
> > >
> > > > +       }
> > > > +
> > > > +       spin_unlock(&cam_dev->buf_list_lock);
> > > > +
> > > > +       return IRQ_HANDLED;
> > > > +}
> > > > +
> > >
> > > ************* MEDIATEK Confidentiality Notice ********************
> > > The information contained in this e-mail message (including any
> > > attachments) may be confidential, proprietary, privileged, or otherwi=
se
> > > exempt from disclosure under applicable laws. It is intended to be
> > > conveyed only to the designated recipient(s). Any use, dissemination,
> > > distribution, printing, retaining or copying of this e-mail (includin=
g its
> > > attachments) by unintended recipient(s) is strictly prohibited and ma=
y
> > > be unlawful. If you are not an intended recipient of this e-mail, or =
believe
> > > that you have received this e-mail in error, please notify the sender
> > > immediately (by replying to this e-mail), delete any and all copies o=
f
> > > this e-mail (including any attachments) from your system, and do not
> > > disclose the content of this e-mail to any other person. Thank you!
>
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

