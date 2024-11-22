Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E23FD75E59
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 14:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uknhb+ZqqVNQfqr335LaBKpGKLh7AyGgumHTFGMpwHk=; b=QN0o2dv34GXlCEnJscLK9ZifnR
	bzqgd+Wd1biNIYg0VQHBZXg79Okm0sIz2itB/XlohD0XscpmaNlmYwch09MGgwM3UJlH0K3kB+b95
	ROCbCMZtFfUZTcRH1fAqjJxR7iqbvszX72ZeOe+n3/nnMBEuOD1NStn45ug7zznmW2XJhB4QMjAi1
	dGobA3uvv0EP8xRj/ZQRmBvJH8hJoJTRlvDvxtpMAejWH8u9NHk7py7OjEZ7IcNB7C8p+blx0Jf52
	Dgaaw7Pb7fh971LCktDMvPeDAxcBOM76vphbhl1D4djUBuA5f9ERufCQEvFHgeo9htFkdI5AZa5Wm
	09QC8AaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEUyA-00000002f4k-32FL;
	Fri, 22 Nov 2024 14:49:14 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEUxD-00000002ex8-2LsH;
	Fri, 22 Nov 2024 14:48:17 +0000
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC4BE514;
	Fri, 22 Nov 2024 15:47:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732286874;
	bh=TObrhQKNEUiuXryF/VVXCnbuKWGFbmaoIBG5kOJEtIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fE92jn07FfcHM245KyQkhpg3e94a5DnYsUyqYHEawr0qIotNAkI/RDrm4SjJGXqYq
	 RDU1RrCp/8hBtu+zFuS+jJSojpBzS7/E6oUiklKr/B833Xcgq8zlQoDzmKR+a2oAk1
	 cPv40J0/fJ5aZoOZJ/t9MmHmgigd4y4EfBuO3seg=
Date: Fri, 22 Nov 2024 15:48:11 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v1 5/5] drivers: media: bcm2835-unicam: Correctly handle
 FS + FE ISR condition
Message-ID: <deremuh7mawzt6ke3c67fvzfyuksmuwon3dhorxbm5mr5rllmf@fbj2f5qvfpjd>
References: <20241122084152.1841419-1-naush@raspberrypi.com>
 <20241122084152.1841419-6-naush@raspberrypi.com>
 <xy44zndazbw7ehpzbc6hexgptjymevvupjhuy2x6zxp54qtepm@vlbb6js62cq4>
 <CAEmqJPrrAhhukn2H4nUhe1njVi-dyW9q=u1h8YgafvJGbYRG6Q@mail.gmail.com>
 <xadxi6rjcnmgjiqhinqnawj3mgps4b3xp6ftozap4ps6q5xaz7@bsdwrrkyniwt>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <xadxi6rjcnmgjiqhinqnawj3mgps4b3xp6ftozap4ps6q5xaz7@bsdwrrkyniwt>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_064815_738141_1B7627A1 
X-CRM114-Status: GOOD (  41.86  )
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


With Hans Sakari and Laurent in cc for real now

On Fri, Nov 22, 2024 at 03:41:31PM +0100, Jacopo Mondi wrote:
> Hi Naush
>
> On Fri, Nov 22, 2024 at 11:40:26AM +0000, Naushir Patuck wrote:
> > Hi Jacopo,
> >
> > On Fri, 22 Nov 2024 at 11:16, Jacopo Mondi
> > <jacopo.mondi@ideasonboard.com> wrote:
> > >
> > > Hi Naush
> > >
> > > On Fri, Nov 22, 2024 at 08:41:52AM +0000, Naushir Patuck wrote:
> > > > This change aligns the FS/FE interrupt handling with the Raspberry Pi
> > > > kernel downstream Unicam driver.
> > > >
> > > > If we get a simultaneous FS + FE interrupt for the same frame, it cannot
> > > > be marked as completed and returned to userland as the framebuffer will
> > > > be refilled by Unicam on the next sensor frame. Additionally, the
> > > > timestamp will be set to 0 as the FS interrupt handling code will not
> > > > have run yet.
> > > >
> > > > To avoid these problems, the frame is considered dropped in the FE
> > > > handler, and will be returned to userland on the subsequent sensor frame.
> > > >
> > > > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > > > ---
> > > >  .../media/platform/broadcom/bcm2835-unicam.c  | 39 +++++++++++++++++--
> > > >  1 file changed, 35 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > index f10064107d54..0d2aa25d483f 100644
> > > > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > @@ -773,10 +773,26 @@ static irqreturn_t unicam_isr(int irq, void *dev)
> > > >                        * as complete, as the HW will reuse that buffer.
> > > >                        */
> > > >                       if (node->cur_frm && node->cur_frm != node->next_frm) {
> > > > +                             /*
> > > > +                              * This condition checks if FE + FS for the same
> > > > +                              * frame has occurred. In such cases, we cannot
> > > > +                              * return out the frame, as no buffer handling
> > > > +                              * or timestamping has yet been done as part of
> > > > +                              * the FS handler.
> > > > +                              */
> > > > +                             if (!node->cur_frm->vb.vb2_buf.timestamp) {
> > > > +                                     dev_dbg(unicam->v4l2_dev.dev,
> > > > +                                             "ISR: FE without FS, dropping frame\n");
> > > > +                                     continue;
> > > > +                             }
> > > > +
> > > >                               unicam_process_buffer_complete(node, sequence);
> > > > +                             node->cur_frm = node->next_frm;
> > > > +                             node->next_frm = NULL;
> > > >                               inc_seq = true;
> > > > +                     } else {
> > > > +                             node->cur_frm = node->next_frm;
> > > >                       }
> > > > -                     node->cur_frm = node->next_frm;
> > > >               }
> > > >
> > > >               /*
> > > > @@ -812,10 +828,25 @@ static irqreturn_t unicam_isr(int irq, void *dev)
> > > >                                       i);
> > > >                       /*
> > > >                        * Set the next frame output to go to a dummy frame
> > > > -                      * if we have not managed to obtain another frame
> > > > -                      * from the queue.
> > > > +                      * if no buffer currently queued.
> > > >                        */
> > > > -                     unicam_schedule_dummy_buffer(node);
> > > > +                     if (!node->next_frm ||
> > > > +                         node->next_frm == node->cur_frm) {
> > > > +                             unicam_schedule_dummy_buffer(node);
> > > > +                     } else if (unicam->node[i].cur_frm) {
> > > > +                             /*
> > > > +                              * Repeated FS without FE. Hardware will have
> > > > +                              * swapped buffers, but the cur_frm doesn't
> > > > +                              * contain valid data. Return cur_frm to the
> > > > +                              * queue.
> > >
> > > So the buffer gets silently recycled ? Or should it be returned with
> > > errors to userspace ?
> >
> > The buffer silently gets recycled and we dequeue when we are sure it
> > is valid and will not get overwritten.  If we were to return to
>
> I haven't find in the v4l2 specs any reference to what the behaviour
> should be.
>
> If I can summarize it: When a frame capture is aborted after the DMA
> transfer has already started, should the corresponding capture buffer
> be returned to the user in error state or the frame drop can go
> silently ignored ?
>
> Cc-ing Hans Sakari and Laurent for opinions.
>
> > userspace with an error, there is still a race condition on the name
> > frame/buffer which will also have to return as error.
> >
>
> I'm sorry I didn't get this part :)
>
> > Regards,
> > Naush
> >
> >
> > >
> > > > +                              */
> > > > +                             spin_lock(&node->dma_queue_lock);
> > > > +                             list_add_tail(&node->cur_frm->list,
> > > > +                                           &node->dma_queue);
> > > > +                             spin_unlock(&node->dma_queue_lock);
> > > > +                             node->cur_frm = node->next_frm;
> > > > +                             node->next_frm = NULL;
> > > > +                     }
> > > >               }
> > > >
> > > >               unicam_queue_event_sof(unicam);
> > > > --
> > > > 2.34.1
> > > >
> > > >
> >

