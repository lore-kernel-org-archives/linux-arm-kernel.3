Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A9DD3B7EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 08:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jhf7UJAgjkqS9IEr+4/OYITR2vHwr6435xJDHVHDw+g=; b=FcTieBYk+XHNj0+ZxwoGsGRCbH
	61cJT73Re9faFCjtPm2/xPE/NQiD+SOVgqmiH2nmDpOmg/lEoxUrk/4DMBT/9tesF5zLN+ZXDWf4y
	Qv0eIeVVvI3uSv7Wmbhsa8/UkMUM+3rtWKIoBb0Wxh7+EKPq4tN8p2/23jKymntSVYwAAzmd1iygK
	MukQ3Pb7TWlD9zPE0m5/6XQMrBDLCiLOcLcvPV3UdCqtscxbmucyfytB+r/QjbYmPMVhZjyNOsr7J
	rzPPBTkacyMUP51S+3Kv9XfiZbt3umOZohkpHpPcVnOAo58wmAWPoAInN3HnRY/0CTJiwBORcduvc
	Yz7KIp6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUee-00000007QIK-34xu;
	Mon, 25 Nov 2024 08:41:12 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUbY-00000007PXf-1mji
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 08:38:02 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e387195210eso574988276.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 00:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732523879; x=1733128679; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jhf7UJAgjkqS9IEr+4/OYITR2vHwr6435xJDHVHDw+g=;
        b=CCibbDpCG55QVMx02q13PT9gnmZeo7T2OdM3Tko7FrfqEfSWsQ088AZdOW8POmGlsM
         QkJPy8iu3rQSa+6KoW9cRR6X4pSPs/PniKeB1NiOo/OUyeYkxst9qh5SXFevmvHWxtGy
         /+AD6Kdx9BAYKYKjMfTcriUTMUSB7TzJApEiTLzDi4/c4KVewGvn41GH1p97yFVoD2tY
         PtE6EVPZ+Nx4dJvhkU/tJmBCoCl4MBAUGPhTPa7IRornrb/uGP9wuIDFGNQKnlbliZh/
         gRkBYKjNs2BB1MjK9F0SXrcbuZrgJLQIUPUxnbtTUmnJjqIEeMzk9iArmJnpCiiWaNHk
         smNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732523879; x=1733128679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jhf7UJAgjkqS9IEr+4/OYITR2vHwr6435xJDHVHDw+g=;
        b=Z18KR++yTCwq98b0XFSLaAaR7qqNv7M2E8XQJWHGo/jnU3dwUpiy5GXQ01e73hQKzr
         jrQSme2t7qVJLMmiQP7lt7nDZVSvZkGeNd1I73F/RAqAj7l56ocUiWZXoYqzg2/+gq2X
         Xeg8i5vyCWeVVgAdrzc6fzJn07rNOBa8dqjuEtryPl/PkfMvdZhoWUfe0xVeN+r8A7/l
         psbXszKxT7kdaEH79wLXlu1zOh4+tTH6VDsVDHg63yI+nO1fCPo3GVUjtMpj9rWUIBuG
         SkIjSjhv6g1lrOfEDCz9134KiMQr5tqcL4ss2qIb0dNtEpwn4Eiwem0qbDS8t5SXZ6e5
         wBgw==
X-Forwarded-Encrypted: i=1; AJvYcCWWEWAqV+++o6qKUb61nxQCtmjWjkVvBju8gmUANMfRo4ExuNyleaCD55KOy6QgF8PcraT8qugRSRD6GG6ZRC0k@lists.infradead.org
X-Gm-Message-State: AOJu0YyIh0+2BwawSAVT2YKwJR6uwxNw3EX+Rw8RjfbWJqT6ODn2L1Sh
	Pejb4rWtGOLckSSGgKBjs6D6q68CPOfy/oIxL0OcE2c6dxrl+OY1WTDlIXBCr+bTCB1HvJk3CYk
	OJrcxEUrw5x6L03c4xiCglwCyksoXAFN7Kq9ZwA==
X-Gm-Gg: ASbGncuxm1xPeiQGQdes7thZbFyzDm0qjdD3eRtgkr5O8BsMP9MOCsDk2q6qTHagTre
	c84QyD+BeKR0V2+Ghj4y8Kx/e/34D5umCbt13Y2HUyYkX4/O0k+oQPQcU78Pt/J4=
X-Google-Smtp-Source: AGHT+IFqUQwBayan6EHR2PgI6nhPiQUSS+N/6Yi2pVJ6bDreyN7dWTXfIQHNKenhX/VU25atPq9Gdlp6/SGHZtv9xLM=
X-Received: by 2002:a05:690c:670d:b0:6e6:c8b:4ae3 with SMTP id
 00721157ae682-6eee0a49b45mr44025007b3.10.1732523878855; Mon, 25 Nov 2024
 00:37:58 -0800 (PST)
MIME-Version: 1.0
References: <20241122084152.1841419-1-naush@raspberrypi.com>
 <20241122084152.1841419-6-naush@raspberrypi.com> <xy44zndazbw7ehpzbc6hexgptjymevvupjhuy2x6zxp54qtepm@vlbb6js62cq4>
 <CAEmqJPrrAhhukn2H4nUhe1njVi-dyW9q=u1h8YgafvJGbYRG6Q@mail.gmail.com>
 <xadxi6rjcnmgjiqhinqnawj3mgps4b3xp6ftozap4ps6q5xaz7@bsdwrrkyniwt>
 <deremuh7mawzt6ke3c67fvzfyuksmuwon3dhorxbm5mr5rllmf@fbj2f5qvfpjd> <20241124070428.GG19573@pendragon.ideasonboard.com>
In-Reply-To: <20241124070428.GG19573@pendragon.ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Mon, 25 Nov 2024 08:37:22 +0000
Message-ID: <CAEmqJPrDvhz+np4MxKiwfrKyjxG0HnO45T+U2=Bpbmm6MW1uXg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241125_003800_656414_3870AC8F 
X-CRM114-Status: GOOD (  45.83  )
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

On Sun, 24 Nov 2024 at 07:04, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Nov 22, 2024 at 03:48:11PM +0100, Jacopo Mondi wrote:
> >
> > With Hans Sakari and Laurent in cc for real now
> >
> > On Fri, Nov 22, 2024 at 03:41:31PM +0100, Jacopo Mondi wrote:
> > > On Fri, Nov 22, 2024 at 11:40:26AM +0000, Naushir Patuck wrote:
> > > > On Fri, 22 Nov 2024 at 11:16, Jacopo Mondi wrote:
> > > > > On Fri, Nov 22, 2024 at 08:41:52AM +0000, Naushir Patuck wrote:
> > > > > > This change aligns the FS/FE interrupt handling with the Raspberry Pi
> > > > > > kernel downstream Unicam driver.
> > > > > >
> > > > > > If we get a simultaneous FS + FE interrupt for the same frame, it cannot
> > > > > > be marked as completed and returned to userland as the framebuffer will
> > > > > > be refilled by Unicam on the next sensor frame. Additionally, the
> > > > > > timestamp will be set to 0 as the FS interrupt handling code will not
> > > > > > have run yet.
> > > > > >
> > > > > > To avoid these problems, the frame is considered dropped in the FE
> > > > > > handler, and will be returned to userland on the subsequent sensor frame.
> > > > > >
> > > > > > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > > > > > ---
> > > > > >  .../media/platform/broadcom/bcm2835-unicam.c  | 39 +++++++++++++++++--
> > > > > >  1 file changed, 35 insertions(+), 4 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > index f10064107d54..0d2aa25d483f 100644
> > > > > > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > @@ -773,10 +773,26 @@ static irqreturn_t unicam_isr(int irq, void *dev)
> > > > > >                        * as complete, as the HW will reuse that buffer.
> > > > > >                        */
> > > > > >                       if (node->cur_frm && node->cur_frm != node->next_frm) {
> > > > > > +                             /*
> > > > > > +                              * This condition checks if FE + FS for the same
> > > > > > +                              * frame has occurred. In such cases, we cannot
> > > > > > +                              * return out the frame, as no buffer handling
> > > > > > +                              * or timestamping has yet been done as part of
> > > > > > +                              * the FS handler.
> > > > > > +                              */
> > > > > > +                             if (!node->cur_frm->vb.vb2_buf.timestamp) {
> > > > > > +                                     dev_dbg(unicam->v4l2_dev.dev,
> > > > > > +                                             "ISR: FE without FS, dropping frame\n");
> > > > > > +                                     continue;
> > > > > > +                             }
> > > > > > +
> > > > > >                               unicam_process_buffer_complete(node, sequence);
> > > > > > +                             node->cur_frm = node->next_frm;
> > > > > > +                             node->next_frm = NULL;
> > > > > >                               inc_seq = true;
> > > > > > +                     } else {
> > > > > > +                             node->cur_frm = node->next_frm;
> > > > > >                       }
> > > > > > -                     node->cur_frm = node->next_frm;
> > > > > >               }
> > > > > >
> > > > > >               /*
> > > > > > @@ -812,10 +828,25 @@ static irqreturn_t unicam_isr(int irq, void *dev)
> > > > > >                                       i);
> > > > > >                       /*
> > > > > >                        * Set the next frame output to go to a dummy frame
> > > > > > -                      * if we have not managed to obtain another frame
> > > > > > -                      * from the queue.
> > > > > > +                      * if no buffer currently queued.
> > > > > >                        */
> > > > > > -                     unicam_schedule_dummy_buffer(node);
> > > > > > +                     if (!node->next_frm ||
> > > > > > +                         node->next_frm == node->cur_frm) {
> > > > > > +                             unicam_schedule_dummy_buffer(node);
> > > > > > +                     } else if (unicam->node[i].cur_frm) {
> > > > > > +                             /*
> > > > > > +                              * Repeated FS without FE. Hardware will have
> > > > > > +                              * swapped buffers, but the cur_frm doesn't
> > > > > > +                              * contain valid data. Return cur_frm to the
> > > > > > +                              * queue.
> > > > >
> > > > > So the buffer gets silently recycled ? Or should it be returned with
> > > > > errors to userspace ?
> > > >
> > > > The buffer silently gets recycled and we dequeue when we are sure it
> > > > is valid and will not get overwritten.  If we were to return to
> > >
> > > I haven't find in the v4l2 specs any reference to what the behaviour
> > > should be.
> > >
> > > If I can summarize it: When a frame capture is aborted after the DMA
> > > transfer has already started, should the corresponding capture buffer
> > > be returned to the user in error state or the frame drop can go
> > > silently ignored ?
>
> If the DMA tranfer is aborted, I would return the buffer to userspace.
> This will indicate a frame loss better than deducing it from a gap in
> the sequence numbers.
>
> Is the DMA really aborted here though ?

No, the DMA continues, causing possilbe overwrite/tearing in the
framebuffer.  Hence we defer returning it until we can ensure we don't
overwrite into the buffer on the next frame.

Naush


>
> > > Cc-ing Hans Sakari and Laurent for opinions.
> > >
> > > > userspace with an error, there is still a race condition on the name
> > > > frame/buffer which will also have to return as error.
> > >
> > > I'm sorry I didn't get this part :)
> > >
> > > > > > +                              */
> > > > > > +                             spin_lock(&node->dma_queue_lock);
> > > > > > +                             list_add_tail(&node->cur_frm->list,
> > > > > > +                                           &node->dma_queue);
> > > > > > +                             spin_unlock(&node->dma_queue_lock);
> > > > > > +                             node->cur_frm = node->next_frm;
> > > > > > +                             node->next_frm = NULL;
> > > > > > +                     }
> > > > > >               }
> > > > > >
> > > > > >               unicam_queue_event_sof(unicam);
>
> --
> Regards,
>
> Laurent Pinchart

