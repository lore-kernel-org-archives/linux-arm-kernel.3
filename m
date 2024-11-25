Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15ED9D3B7FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 10:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bE670VWrKFAJi/k6QF6YDyCcP2WOkY0/aumOzxz6kvQ=; b=dzJXRfjKbANri+eplOBDdjc8jH
	/EJCRW7covjzYOSonIccdAW2/r3KIhW6LH+4mKNyyq+sGS1PO90utH5c9gF7BYFw/EG2YeATxEw8i
	TcnxsHSLNyRvAB/IN/IwfFiBKrRp8HNv2JNgF0oHqEfoXxywoO2Fjh0xjP+PNywlzJe90R+k+tj3r
	kf3a7dEIAQ9SrRaLjKdM5+/oHQbElSnnVBh2X8TFBhJyRpznyCoKVlj69lH8XRJWe4yJzhGF35F69
	P1zXDxkOax6xMn4Z77Un0b6Ci+DgYZ1fyS08b/Cz8m37VgjyeIOBdZ7rGqbmRL7+419VFfwvUcHdA
	MlG9QiRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFW9q-00000007hhv-0E4z;
	Mon, 25 Nov 2024 10:17:30 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVgN-00000007dP7-3v6B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:47:05 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e393167dd71so65926276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 01:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732528023; x=1733132823; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bE670VWrKFAJi/k6QF6YDyCcP2WOkY0/aumOzxz6kvQ=;
        b=H/G0y9ceqyhUDvaGpZJNr99DxaFIuKGMdjb8lUwGn7wg6vos1GbMtoHkX9l2Xd7mY9
         DZkHnbyr9e65DRQ1kxkoCHcthXF/iymqounemmjJy8q1XhEnsjaH4P/7XbBOW054ElIF
         ZAEs5lLR7S6hQ2MPbaq38izRHZv85PYAtB9H/3GWJRfzquItwMr2OsSbF0OFf627CZGY
         JXngLaCUWlXB7iLqGhB0ih5GKvdtRquXVtf6kf6SqeouQzAhfJq4uiFPFf+mSmTchi79
         sokSNeGCQES9/ifXAMC6VV7f2zP51hAVnQfBdlGlF5eq3WyrtPav7UiRO2S3bX/MM2a4
         Ys8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732528023; x=1733132823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bE670VWrKFAJi/k6QF6YDyCcP2WOkY0/aumOzxz6kvQ=;
        b=ZqvHm+nf+7ph4GNW/db1fdhE+FPAZRMsw0AX84cj6w0UcwmDk0Bfwm2rp5kNXNHaIR
         zdLrkP81jRGcTumoUo4HS/hsXBbVp5GR8D46kV/PV6ddJ6dTqOwzYqSquiT8aKZPEUs0
         rneLKlbR7flIVMJYYQQg7ORynXwnrU3hZnj1YQWidjkY1MeQ/9R0hMW0536xrRhyfoZA
         nAEwEnndCwDY1nm6NQFJlaOnMsrrbWlJfl3gnI0RJvXLWHTCjQBospOPAi6Nc8KtNiNJ
         TDJWn5DjaYtEvKQHV29diH3XVqtaayimKdpn3obpWSl+/thcAjUNscp9fYEw+YBN8rMc
         tPCA==
X-Forwarded-Encrypted: i=1; AJvYcCUIh0UYCY4gRgUGleyrchrhGPQf5QcCmSX5CECg2hp96+k4Z8kOK3c64LePAhxwtZGwDtbaUPlahXPiJi+rA4yZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzwNwDdNfoFhjPRtbNxOdeYYLAKUWx7jSJ+oy0TAmpqKGc2yPaX
	Py8zpQSdRUt/AF6uAcBUzd8mQkM4ya64X1pE03ZjNolOnvtd+uj474cqu23WLkdVhukXnGsvY6h
	ao4Wki81tJkNGvIAH3oKBZpYVemlxF1dd7JktJQ==
X-Gm-Gg: ASbGncuWTsNxTHciY9xPBpKydmc+JTKM7Ju8m+ru5ifSFb2+GGDalGLsEJfl88e57wM
	rZVUgkYIOcRNk6qNmqDJB9Hdg1WTzQdAzUc18+rpTi7YQAAW7vZmPNoE86eiuPIc=
X-Google-Smtp-Source: AGHT+IHd0ValakmyJkPHUNRA+XE2BGtzAmKFDofJT/4iGoxBm2cj6JdKQe6Q9DhXX/URSJWtCBziiupwenCdRWIX0K0=
X-Received: by 2002:a05:690c:3603:b0:6ea:8cb3:32e9 with SMTP id
 00721157ae682-6eee076ceb3mr39495667b3.0.1732528022681; Mon, 25 Nov 2024
 01:47:02 -0800 (PST)
MIME-Version: 1.0
References: <20241122084152.1841419-1-naush@raspberrypi.com>
 <20241122084152.1841419-6-naush@raspberrypi.com> <xy44zndazbw7ehpzbc6hexgptjymevvupjhuy2x6zxp54qtepm@vlbb6js62cq4>
 <CAEmqJPrrAhhukn2H4nUhe1njVi-dyW9q=u1h8YgafvJGbYRG6Q@mail.gmail.com>
 <xadxi6rjcnmgjiqhinqnawj3mgps4b3xp6ftozap4ps6q5xaz7@bsdwrrkyniwt>
 <deremuh7mawzt6ke3c67fvzfyuksmuwon3dhorxbm5mr5rllmf@fbj2f5qvfpjd>
 <20241124070428.GG19573@pendragon.ideasonboard.com> <CAEmqJPrDvhz+np4MxKiwfrKyjxG0HnO45T+U2=Bpbmm6MW1uXg@mail.gmail.com>
 <20241125092335.GL19381@pendragon.ideasonboard.com>
In-Reply-To: <20241125092335.GL19381@pendragon.ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Mon, 25 Nov 2024 09:46:26 +0000
Message-ID: <CAEmqJPo58OCosJhKZeut4=ZGQfk3CCJR_G8ZZZvmAUNTwfmKjw@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] drivers: media: bcm2835-unicam: Correctly handle
 FS + FE ISR condition
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_014704_140609_A5A16340 
X-CRM114-Status: GOOD (  51.23  )
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

Hi Laurent,

On Mon, 25 Nov 2024 at 09:23, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Naush,
>
> On Mon, Nov 25, 2024 at 08:37:22AM +0000, Naushir Patuck wrote:
> > On Sun, 24 Nov 2024 at 07:04, Laurent Pinchart wrote:
> > > On Fri, Nov 22, 2024 at 03:48:11PM +0100, Jacopo Mondi wrote:
> > > >
> > > > With Hans Sakari and Laurent in cc for real now
> > > >
> > > > On Fri, Nov 22, 2024 at 03:41:31PM +0100, Jacopo Mondi wrote:
> > > > > On Fri, Nov 22, 2024 at 11:40:26AM +0000, Naushir Patuck wrote:
> > > > > > On Fri, 22 Nov 2024 at 11:16, Jacopo Mondi wrote:
> > > > > > > On Fri, Nov 22, 2024 at 08:41:52AM +0000, Naushir Patuck wrote:
> > > > > > > > This change aligns the FS/FE interrupt handling with the Raspberry Pi
> > > > > > > > kernel downstream Unicam driver.
> > > > > > > >
> > > > > > > > If we get a simultaneous FS + FE interrupt for the same frame, it cannot
> > > > > > > > be marked as completed and returned to userland as the framebuffer will
> > > > > > > > be refilled by Unicam on the next sensor frame. Additionally, the
> > > > > > > > timestamp will be set to 0 as the FS interrupt handling code will not
> > > > > > > > have run yet.
> > > > > > > >
> > > > > > > > To avoid these problems, the frame is considered dropped in the FE
> > > > > > > > handler, and will be returned to userland on the subsequent sensor frame.
> > > > > > > >
> > > > > > > > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > > > > > > > ---
> > > > > > > >  .../media/platform/broadcom/bcm2835-unicam.c  | 39 +++++++++++++++++--
> > > > > > > >  1 file changed, 35 insertions(+), 4 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > > > index f10064107d54..0d2aa25d483f 100644
> > > > > > > > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > > > @@ -773,10 +773,26 @@ static irqreturn_t unicam_isr(int irq, void *dev)
> > > > > > > >                        * as complete, as the HW will reuse that buffer.
> > > > > > > >                        */
> > > > > > > >                       if (node->cur_frm && node->cur_frm != node->next_frm) {
> > > > > > > > +                             /*
> > > > > > > > +                              * This condition checks if FE + FS for the same
> > > > > > > > +                              * frame has occurred. In such cases, we cannot
> > > > > > > > +                              * return out the frame, as no buffer handling
> > > > > > > > +                              * or timestamping has yet been done as part of
> > > > > > > > +                              * the FS handler.
> > > > > > > > +                              */
> > > > > > > > +                             if (!node->cur_frm->vb.vb2_buf.timestamp) {
> > > > > > > > +                                     dev_dbg(unicam->v4l2_dev.dev,
> > > > > > > > +                                             "ISR: FE without FS, dropping frame\n");
> > > > > > > > +                                     continue;
> > > > > > > > +                             }
> > > > > > > > +
> > > > > > > >                               unicam_process_buffer_complete(node, sequence);
> > > > > > > > +                             node->cur_frm = node->next_frm;
> > > > > > > > +                             node->next_frm = NULL;
> > > > > > > >                               inc_seq = true;
> > > > > > > > +                     } else {
> > > > > > > > +                             node->cur_frm = node->next_frm;
> > > > > > > >                       }
> > > > > > > > -                     node->cur_frm = node->next_frm;
> > > > > > > >               }
> > > > > > > >
> > > > > > > >               /*
> > > > > > > > @@ -812,10 +828,25 @@ static irqreturn_t unicam_isr(int irq, void *dev)
> > > > > > > >                                       i);
> > > > > > > >                       /*
> > > > > > > >                        * Set the next frame output to go to a dummy frame
> > > > > > > > -                      * if we have not managed to obtain another frame
> > > > > > > > -                      * from the queue.
> > > > > > > > +                      * if no buffer currently queued.
> > > > > > > >                        */
> > > > > > > > -                     unicam_schedule_dummy_buffer(node);
> > > > > > > > +                     if (!node->next_frm ||
> > > > > > > > +                         node->next_frm == node->cur_frm) {
> > > > > > > > +                             unicam_schedule_dummy_buffer(node);
> > > > > > > > +                     } else if (unicam->node[i].cur_frm) {
> > > > > > > > +                             /*
> > > > > > > > +                              * Repeated FS without FE. Hardware will have
> > > > > > > > +                              * swapped buffers, but the cur_frm doesn't
> > > > > > > > +                              * contain valid data. Return cur_frm to the
> > > > > > > > +                              * queue.
> > > > > > >
> > > > > > > So the buffer gets silently recycled ? Or should it be returned with
> > > > > > > errors to userspace ?
> > > > > >
> > > > > > The buffer silently gets recycled and we dequeue when we are sure it
> > > > > > is valid and will not get overwritten.  If we were to return to
> > > > >
> > > > > I haven't find in the v4l2 specs any reference to what the behaviour
> > > > > should be.
> > > > >
> > > > > If I can summarize it: When a frame capture is aborted after the DMA
> > > > > transfer has already started, should the corresponding capture buffer
> > > > > be returned to the user in error state or the frame drop can go
> > > > > silently ignored ?
> > >
> > > If the DMA tranfer is aborted, I would return the buffer to userspace.
> > > This will indicate a frame loss better than deducing it from a gap in
> > > the sequence numbers.
> > >
> > > Is the DMA really aborted here though ?
> >
> > No, the DMA continues, causing possilbe overwrite/tearing in the
> > framebuffer.  Hence we defer returning it until we can ensure we don't
> > overwrite into the buffer on the next frame.
>
> If the DMA continues then we certainly can't return the buffer to
> userspace. Is it the next frame being DMA'ed to the same buffer, or does
> the hardware put it the buffer at the back of its queue ?

The next frame will be DMA'ed into the same buffer in this error
condition. The hardware really only has a 2-deep buffer queue (current
+ next frame), and no reliable way of telling if next has been swapped
to been swapped.

Regards,
Naush


>
> > > > > Cc-ing Hans Sakari and Laurent for opinions.
> > > > >
> > > > > > userspace with an error, there is still a race condition on the name
> > > > > > frame/buffer which will also have to return as error.
> > > > >
> > > > > I'm sorry I didn't get this part :)
> > > > >
> > > > > > > > +                              */
> > > > > > > > +                             spin_lock(&node->dma_queue_lock);
> > > > > > > > +                             list_add_tail(&node->cur_frm->list,
> > > > > > > > +                                           &node->dma_queue);
> > > > > > > > +                             spin_unlock(&node->dma_queue_lock);
> > > > > > > > +                             node->cur_frm = node->next_frm;
> > > > > > > > +                             node->next_frm = NULL;
> > > > > > > > +                     }
> > > > > > > >               }
> > > > > > > >
> > > > > > > >               unicam_queue_event_sof(unicam);
>
> --
> Regards,
>
> Laurent Pinchart

