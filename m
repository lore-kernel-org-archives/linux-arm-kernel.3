Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFF8E65D39
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 09:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kGVIObe0vVdWgPVNKUPs0E9cZC3gBnTEl6g/zCTMjk=; b=mmBhLEP+ZSWA1hhx+/o3Yvxi6t
	ez7q1NdxUnjMBMGpaHUhOZPWmdEvehI11k1f1dHkyCp3oGFDYe0YZNNI+vy8dPD719FOF3bbqJ9Fs
	uGtUlXqYbnpz2x8Ic97to/1YKbncDg7lKgbwYaDPigykKSCNOfN/AUXevBR6sJziGHeJGReIufHq6
	T2RvV7ccHKsuWS09+NSMk6S4XvxG/lp4iDWBE3Kry15zWUx7SO2L9r7g5fNCeZ7rJia633LZyR3pt
	wAyrwYPCziHHvyKYd2agpoolkwjmEgtGmbJAVgBefx9zh6f8z1WOVb7PBzFzaBMD7LKv80XRTcICu
	mEquT8Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPxn-0000000267h-2laK;
	Fri, 22 Nov 2024 09:28:31 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPvE-000000025ZT-0Y1N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 09:25:53 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aa20c733e92so235192966b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 01:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732267550; x=1732872350; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kGVIObe0vVdWgPVNKUPs0E9cZC3gBnTEl6g/zCTMjk=;
        b=Tq1pn0ZdKYY0H4LY7y7oxym30M1AsCxDMSNecHug2fqgn1wvV570I3CDJ4lqdxRWjo
         JcKmab0RskzP92JknwiA9lowNienU71iqsMvYji2tr5qLG5nw2hzaEhc3X4lgvBw+1Az
         93q0xKpd0NxuEN7pvLzbJgUKzdrb2xPSfv/q58c9VNz8FugKTJ3tSkaa4aFpCMGgO6kC
         dhhzYQiqS7IRv1favZqiP2ZkR1/3LMzsnHoyYYliU1LcDcw7oXp1C6zcaSCH85Hh4HxD
         GrrHcjkZwJbRyKXRr7dzgxqZHL0cbkGb6JNREI1jZnZtEHtoLAPXtacfJ9Ew4UeJw/8M
         wLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732267550; x=1732872350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kGVIObe0vVdWgPVNKUPs0E9cZC3gBnTEl6g/zCTMjk=;
        b=SmM1885tLAdkyvhJfLsvR9QLQfLXiF5DkOtqI4DDRhQ14sPLEqcJcEJyqjqBQVi5L8
         nR2Gm7bn1Xls4fcK+n9Wm8QzJdUwFZvtbj7hb1O3l9JA28QRDHcx2tVAfBLXBS2VlTjQ
         SjGnouAAT0FTw50F/5l8jVRdiXNJgFoGWjeMETVKe/T4uou+wDrFfgWBZcVC0rSM5cOe
         mUtwED+MV8It2BlAWXqbVUPVdwcnjHVWoMffgZkIWWliS31xWezFFV4FkuqTyhh7qjxX
         wsUc67kkp301TzFgq8xe1y5ZXfF8m4++reqOEupI8YKpJoxSD5sunGM6t4zKfCtTd6pJ
         hkqw==
X-Forwarded-Encrypted: i=1; AJvYcCUbRVAl4riucXI4ZuAwHFC3x9RkRSAZ/sP0UpzeLNM1s5nV3JvPnbdeVw/qqmCQzkn8AQEsWkQYt48It3odxQzN@lists.infradead.org
X-Gm-Message-State: AOJu0YzCvucnDeaR19kB6d0yi2beDm3Y+Os316brqEyxwzyjCaecuomO
	zTBSCR+sNhYUzRWD94x52NXzTUMyfhkk42ByLja/Z4zNqLdo6K41in4VfRzfPJex7++iXnL6PFE
	eBzZhnS8TVR1iGbEMD86wZcxL7uqORFbDQsv1mQ==
X-Gm-Gg: ASbGnctQvXGYJyPXTtnypIwxGPLFA0NbWjEdPBryA1syVxzuQIKUWq5aVQb++B0R3ql
	TTCVwmX2DA/kNqJeS0KW+/dXYc/ipIg==
X-Google-Smtp-Source: AGHT+IGelwCxgal9/XHOQ4gQV2eBA2tvjKzser7OohWcveCSBW6AFI6GvR8S/BH009DfNRCjqG5gbgXZGS6L6ZzyHyQ=
X-Received: by 2002:a17:906:3101:b0:a99:5f16:3539 with SMTP id
 a640c23a62f3a-aa509694028mr173072766b.0.1732267550340; Fri, 22 Nov 2024
 01:25:50 -0800 (PST)
MIME-Version: 1.0
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com> <767085562b5efb43f248e8528bb154a6c30d3999.camel@mediatek.com>
In-Reply-To: <767085562b5efb43f248e8528bb154a6c30d3999.camel@mediatek.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 22 Nov 2024 10:25:39 +0100
Message-ID: <CAEHHSvaePj2MUg+zgmkpZF4HTj_F9ED0RxuzQr2oOAUJgOieng@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, =?UTF-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>, "pnguyen@baylibre.com" <pnguyen@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_012552_172899_5CB1C085 
X-CRM114-Status: GOOD (  29.15  )
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

Le ven. 22 nov. 2024 =C3=A0 09:41, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) <ck.=
hu@mediatek.com> a =C3=A9crit :
>
> Hi, Julien:
>
> On Thu, 2024-11-21 at 09:53 +0100, Julien Stephan wrote:
> > External email : Please do not click links or open attachments until yo=
u have verified the sender or the content.
> >
> >
> > From: Phi-bang Nguyen <pnguyen@baylibre.com>
> >
> > This driver provides a path to bypass the SoC ISP so that image data
> > coming from the SENINF can go directly into memory without any image
> > processing. This allows the use of an external ISP.
> >
> > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > [Paul Elder fix irq locking]
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
>
> [snip]
>
> > +static irqreturn_t isp_irq_camsv30(int irq, void *data)
> > +{
> > +       struct mtk_cam_dev *cam_dev =3D (struct mtk_cam_dev *)data;
> > +       struct mtk_cam_dev_buffer *buf;
> > +       unsigned int irq_status;
> > +
> > +       spin_lock(&cam_dev->buf_list_lock);
> > +
> > +       irq_status =3D mtk_camsv30_read(cam_dev, CAMSV_INT_STATUS);
> > +
> > +       if (irq_status & INT_ST_MASK_CAMSV_ERR)
> > +               dev_err(cam_dev->dev, "irq error 0x%lx\n",
> > +                       irq_status & INT_ST_MASK_CAMSV_ERR);
> > +
> > +       /* De-queue frame */
> > +       if (irq_status & CAMSV_IRQ_PASS1_DON) {
> > +               cam_dev->sequence++;
> > +
> > +               buf =3D list_first_entry_or_null(&cam_dev->buf_list,
> > +                                              struct mtk_cam_dev_buffe=
r,
> > +                                              list);
> > +               if (buf) {
> > +                       buf->v4l2_buf.sequence =3D cam_dev->sequence;
> > +                       buf->v4l2_buf.vb2_buf.timestamp =3D
> > +                               ktime_get_ns();
> > +                       vb2_buffer_done(&buf->v4l2_buf.vb2_buf,
> > +                                       VB2_BUF_STATE_DONE);
> > +                       list_del(&buf->list);
> > +               }
> > +
> > +               buf =3D list_first_entry_or_null(&cam_dev->buf_list,
> > +                                              struct mtk_cam_dev_buffe=
r,
> > +                                              list);
> > +               if (buf)
> > +                       mtk_camsv30_update_buffers_add(cam_dev, buf);
>
> If buf =3D=3D NULL, so hardware would automatically stop DMA?
> I don't know how this hardware work.
> Below is my imagine about this hardware.
>
> 1. Software use CAMSV_IMGO_FBC_RCNT_INC to increase software buffer index=
.
> 2. Hardware has a hardware buffer index. After hardware finish one frame,=
 hardware buffer index increase.
> 3. After software buffer index increase, hardware start DMA.
> 4. When hardware buffer index is equal to software buffer index, hardware=
 automatically stop DMA.
>
> Does the hardware work as my imagine?
> If hardware could automatically stop DMA, add comment to describe.
> If hardware could not automatically stop DMA, software should do somethin=
g to stop DMA when buf =3D=3D NULL.
>

You are right except that dma is not stopped but frames are
automatically dropped by hardware until a new buffer is enqueued and
software uses CAMSV_IMGO_FBC_RCNT_INC to increase the software buffer
index.

What about adding the following comment:

/*
* If there is no user buffer available, hardware will drop automatically
* frames until buf_queue is called
*/

Let me know if that works for you

Cheers
Julien

> Regards,
> CK
>
> > +       }
> > +
> > +       spin_unlock(&cam_dev->buf_list_lock);
> > +
> > +       return IRQ_HANDLED;
> > +}
> > +
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

