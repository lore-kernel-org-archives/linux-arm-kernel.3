Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E96ED75E25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 11:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0sBqcbK1efD2Qn0RLXgO+HABCeGcow4GsKIzdjiZraQ=; b=phOgJYkwlA/eE9i0nL624d9bI7
	oBdGE+BLVUX9uC9GTje7BuRSnALX0oct/pZmP5EqY/26b2uYzIqGzGGJkz56ODsjcDiqdTCC64dAI
	K2eYxIUJHrEfja3r1e0FqUW7lkwZMsdqheFBGBAZeWJs9WAj4QyNGJfuIN4gTkl5MzdJB34rdJJuH
	moB6lV5+ZXqXUWi67XRxIv2D1kasIgep27PbmKT2431BYFeN0OHdM36o29LwM2Ws/BoyScn55sBaH
	Sfa7z/mu2YyUnusookU4E53J4a4MxLNsd0w+OR3eyatg39gg5xZZ8i55fCuUveekRCxY8FdZXR+63
	7P0zfzVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tERyi-00000002Nf3-3oTA;
	Fri, 22 Nov 2024 11:37:36 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tERxk-00000002NVu-3iFI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 11:36:38 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-6eed30536acso945047b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 03:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732275395; x=1732880195; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0sBqcbK1efD2Qn0RLXgO+HABCeGcow4GsKIzdjiZraQ=;
        b=d55bPyQh0C5PPbw8HPzlAOVkzej5Kg4h57ReWPOoyeKBd+iYqQOWorjno8HrLpn43W
         ZxAWcia39zYHuY292ie/tH5AKxbTcPPtwOU77ZajuuE/yYDhZ1bj/4ISHZDoBBhyPiW8
         EZ/ChLQO47iCnHnEK4JMUIT7gjGNqrWx/h6yzwFgD6TPDaXtnnWfU3Gk5o69221UfdAZ
         e1ai3+7C+YPQ45iI5i0v1/Q6BeZLgcBKGxxhzzUaZU6thj4xibwsPGv80LehVwLz31fj
         Uej0aMq0nUv2kCtDUv9WF3g/1rjl6xRtpLrzfTDN7ta3I4Zt8XbJIL8trBxM+BTAhQPQ
         Jo2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732275395; x=1732880195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sBqcbK1efD2Qn0RLXgO+HABCeGcow4GsKIzdjiZraQ=;
        b=ZZQas9199JugpE+2RMwW8ysRdU59aERKm7IQMYmAaNVk8cm0+66X0iFoDuAT5Wt9gq
         LL+wIyQc/H994d09G0yS5C5xaSfhDBXbtDCstKu6q6dwb5v1DdF2igYOozZhM5sQm2F0
         htCRMpsJMqsGeAvzz71fClnLiff19eWxpjOj9f5ZvQcTo186R7npaLYNH1G7egZldPA2
         hDvFQQP1cCtykXxyir2xg4IRH+7+MmqaKs3ikMV+yGHLjZPqUc94CNKhohB1TECPV4rG
         Jv0xfmIVIJHyPthFfOPyfwFtratDxACLTQyWSyORg9S4xQh6sKk3kISjALMmOqnhyjpB
         S6kg==
X-Forwarded-Encrypted: i=1; AJvYcCU7tFvAmPiTjW/TBWY2YjkvpVRWqEO5eyNZJ/I8pZLvCbzx/lRemMxHQQe+dOEoyFa35wb7T+xeyOvfEqhcynGP@lists.infradead.org
X-Gm-Message-State: AOJu0YxgeSOz684TAoDmudcB+BRC3Lb4Ky2oRJWd2ctr1bR3tHUzlMV/
	db3L3qlb5nyWAuc20faVLmNskqRZXlY0T+ktGWQfmxQrFO7AtEgRMkSlBi0UOFUocEyAAo92lnX
	lgDuXRcS5fvLxWVeORTeq0KW2oA3fAqPbO9zd0Q==
X-Gm-Gg: ASbGnctOpcsl/2pxTRBzHmlEkNkjC2Ik9hAOPuruy6s39RsBU/zmDjnQ14tmoSeq+sv
	1Xm5B/cQMj6vIWjHmgbRv8N9sd8gMFu4tpgwQYrsOmoAlaJOLfW3skhrIx5k9gnw=
X-Google-Smtp-Source: AGHT+IHsakElmZNZXg6tWaPdffed3q6eehdNBbS91/o+k90QEJ+G92HBPismmAOKH8alO8lyFFv7OZaI5ksBZxAF2lo=
X-Received: by 2002:a05:690c:284a:b0:6c8:7827:f289 with SMTP id
 00721157ae682-6eee0a15571mr8183727b3.5.1732275395350; Fri, 22 Nov 2024
 03:36:35 -0800 (PST)
MIME-Version: 1.0
References: <20241122084152.1841419-1-naush@raspberrypi.com>
 <20241122084152.1841419-5-naush@raspberrypi.com> <vnl2px6zcb7pchhfp3k3lngicamsjvidu75sixvubrohqaudlr@h6r54mzr3daz>
In-Reply-To: <vnl2px6zcb7pchhfp3k3lngicamsjvidu75sixvubrohqaudlr@h6r54mzr3daz>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Fri, 22 Nov 2024 11:35:59 +0000
Message-ID: <CAEmqJPrfGCB=hKN-+0cG3xFiZxS4BJ_FT=pXnt5U+48wk+A0sw@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] drivers: media: bcm2835-unicam: Fix for possible
 dummy buffer overrun
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_033637_097489_7AD3DE8A 
X-CRM114-Status: GOOD (  27.39  )
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

On Fri, 22 Nov 2024 at 11:20, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Naush
>
> On Fri, Nov 22, 2024 at 08:41:51AM +0000, Naushir Patuck wrote:
> > The Unicam hardware has been observed to cause a buffer overrun when
> > using the dummy buffer as a circular buffer. The conditions that cause
> > the overrun are not fully known, but it seems to occur when the memory
> > bus is heavily loaded.
> >
> > To avoid the overrun, program the hardware with a buffer size of 0 when
> > using the dummy buffer. This will cause overrun into the allocated dummy
> > buffer, but avoid out of bounds writes.
> >
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > ---
> >  drivers/media/platform/broadcom/bcm2835-unicam.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > index 550eb1b064f1..f10064107d54 100644
> > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > @@ -640,7 +640,14 @@ static inline void unicam_reg_write_field(struct unicam_device *unicam, u32 offs
> >  static void unicam_wr_dma_addr(struct unicam_node *node,
> >                              struct unicam_buffer *buf)
> >  {
> > -     dma_addr_t endaddr = buf->dma_addr + buf->size;
> > +     /*
> > +      * Due to a HW bug causing buffer overruns in circular buffer mode under
> > +      * certain (not yet fully known) conditions, the dummy buffer allocation
> > +      * is set to a a single page size, but the hardware gets programmed with
> > +      * a buffer size of 0.
> > +      */
> > +     dma_addr_t endaddr = buf->dma_addr +
> > +                          (buf != &node->dummy_buf ? buf->size : 0);
>
> So the DMA engine doesn't actually write any data to dummy_buf
> anymore ?
>
>
> Does it still need to be allocated at all ? Or can we simply set the
> dma transfer size to 0 ?

The DMA engine does still write to the buffer, so the allocation needs
to occur. The zero size programmed into the register is a quirk of the
HW itself, and is used to ensure the write wrap correctly in the
buffer.

Naush

>
> >
> >       if (node->id == UNICAM_IMAGE_NODE) {
> >               unicam_reg_write(node->dev, UNICAM_IBSA0, buf->dma_addr);
> > --
> > 2.34.1
> >
> >

