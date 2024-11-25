Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FC2D3B7FF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 10:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KilTs5QCxhYzl33hfpmaqeWmT9q3w6T0zfnbBI6Cd4I=; b=miATkPOsToairIVhZdfLGo80Qc
	jHFxmfhdtBjAQggqyfHpw+bf+PqOOmBK4AVH0u+qtwR6mQDq32AW8+FVpSTPzDZ2VQjpmLCb9nL4l
	QVfDwFrJy79M7DuKn5JopJE4q0RSN9S7x1M74dPgN/vx3OH8X0qgTpk+sbKoB/+wqXICKghUqPQyY
	gI3TQtal5tfNUYR2L6q59coBqYddwPXIGWNf1Qt4u9o16fzyOm36DjqjjcOudIZ1CB9MiclJ/eMUh
	96/oXLTZc8/VdvxVttWmULCK8O8QOCn5zPZKbMVML/vgQZFCWHv+MFyhlW9QCcKFYkf7WOxvGdCxu
	CguM8TBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWKH-00000007lA9-3T3m;
	Mon, 25 Nov 2024 10:28:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWJK-00000007kzN-1IWm;
	Mon, 25 Nov 2024 10:27:19 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 029136B5;
	Mon, 25 Nov 2024 11:26:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732530415;
	bh=OooKzt1Ahe9gvg6xRWq0/KLttWsiFa/a2KRBdbv8qjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vWBBAE1YsYdi0hQ3TzaiQxeZZheFHwQ5RTtGio9pSwSyjY4SWYZClta5UacsAoIUi
	 tllpi9+7bq9HIa3pIeBLw4Fuxws7hr6sqdRNIqSTshSQzOhpNHLHU39RZ02DDDu1kQ
	 CmfmGj1z9DGqlySAikGz182lJ7+ALIviKiRN1hqs=
Date: Mon, 25 Nov 2024 12:27:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v1 5/5] drivers: media: bcm2835-unicam: Correctly handle
 FS + FE ISR condition
Message-ID: <20241125102707.GP19381@pendragon.ideasonboard.com>
References: <20241122084152.1841419-1-naush@raspberrypi.com>
 <20241122084152.1841419-6-naush@raspberrypi.com>
 <xy44zndazbw7ehpzbc6hexgptjymevvupjhuy2x6zxp54qtepm@vlbb6js62cq4>
 <CAEmqJPrrAhhukn2H4nUhe1njVi-dyW9q=u1h8YgafvJGbYRG6Q@mail.gmail.com>
 <xadxi6rjcnmgjiqhinqnawj3mgps4b3xp6ftozap4ps6q5xaz7@bsdwrrkyniwt>
 <deremuh7mawzt6ke3c67fvzfyuksmuwon3dhorxbm5mr5rllmf@fbj2f5qvfpjd>
 <20241124070428.GG19573@pendragon.ideasonboard.com>
 <CAEmqJPrDvhz+np4MxKiwfrKyjxG0HnO45T+U2=Bpbmm6MW1uXg@mail.gmail.com>
 <20241125092335.GL19381@pendragon.ideasonboard.com>
 <CAEmqJPo58OCosJhKZeut4=ZGQfk3CCJR_G8ZZZvmAUNTwfmKjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAEmqJPo58OCosJhKZeut4=ZGQfk3CCJR_G8ZZZvmAUNTwfmKjw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_022718_486780_739F134F 
X-CRM114-Status: GOOD (  51.00  )
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

Hi Naush,

On Mon, Nov 25, 2024 at 09:46:26AM +0000, Naushir Patuck wrote:
> On Mon, 25 Nov 2024 at 09:23, Laurent Pinchart wrote:
> > On Mon, Nov 25, 2024 at 08:37:22AM +0000, Naushir Patuck wrote:
> > > On Sun, 24 Nov 2024 at 07:04, Laurent Pinchart wrote:
> > > > On Fri, Nov 22, 2024 at 03:48:11PM +0100, Jacopo Mondi wrote:
> > > > >
> > > > > With Hans Sakari and Laurent in cc for real now
> > > > >
> > > > > On Fri, Nov 22, 2024 at 03:41:31PM +0100, Jacopo Mondi wrote:
> > > > > > On Fri, Nov 22, 2024 at 11:40:26AM +0000, Naushir Patuck wrote:
> > > > > > > On Fri, 22 Nov 2024 at 11:16, Jacopo Mondi wrote:
> > > > > > > > On Fri, Nov 22, 2024 at 08:41:52AM +0000, Naushir Patuck wrote:
> > > > > > > > > This change aligns the FS/FE interrupt handling with the Raspberry Pi
> > > > > > > > > kernel downstream Unicam driver.
> > > > > > > > >
> > > > > > > > > If we get a simultaneous FS + FE interrupt for the same frame, it cannot
> > > > > > > > > be marked as completed and returned to userland as the framebuffer will
> > > > > > > > > be refilled by Unicam on the next sensor frame. Additionally, the
> > > > > > > > > timestamp will be set to 0 as the FS interrupt handling code will not
> > > > > > > > > have run yet.
> > > > > > > > >
> > > > > > > > > To avoid these problems, the frame is considered dropped in the FE
> > > > > > > > > handler, and will be returned to userland on the subsequent sensor frame.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > > > > > > > > ---
> > > > > > > > >  .../media/platform/broadcom/bcm2835-unicam.c  | 39 +++++++++++++++++--
> > > > > > > > >  1 file changed, 35 insertions(+), 4 deletions(-)
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > > > > index f10064107d54..0d2aa25d483f 100644
> > > > > > > > > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > > > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > > > > @@ -773,10 +773,26 @@ static irqreturn_t unicam_isr(int irq, void *dev)
> > > > > > > > >                        * as complete, as the HW will reuse that buffer.
> > > > > > > > >                        */
> > > > > > > > >                       if (node->cur_frm && node->cur_frm != node->next_frm) {
> > > > > > > > > +                             /*
> > > > > > > > > +                              * This condition checks if FE + FS for the same
> > > > > > > > > +                              * frame has occurred. In such cases, we cannot
> > > > > > > > > +                              * return out the frame, as no buffer handling
> > > > > > > > > +                              * or timestamping has yet been done as part of
> > > > > > > > > +                              * the FS handler.
> > > > > > > > > +                              */
> > > > > > > > > +                             if (!node->cur_frm->vb.vb2_buf.timestamp) {
> > > > > > > > > +                                     dev_dbg(unicam->v4l2_dev.dev,
> > > > > > > > > +                                             "ISR: FE without FS, dropping frame\n");
> > > > > > > > > +                                     continue;
> > > > > > > > > +                             }
> > > > > > > > > +
> > > > > > > > >                               unicam_process_buffer_complete(node, sequence);
> > > > > > > > > +                             node->cur_frm = node->next_frm;
> > > > > > > > > +                             node->next_frm = NULL;
> > > > > > > > >                               inc_seq = true;
> > > > > > > > > +                     } else {
> > > > > > > > > +                             node->cur_frm = node->next_frm;
> > > > > > > > >                       }
> > > > > > > > > -                     node->cur_frm = node->next_frm;
> > > > > > > > >               }
> > > > > > > > >
> > > > > > > > >               /*
> > > > > > > > > @@ -812,10 +828,25 @@ static irqreturn_t unicam_isr(int irq, void *dev)
> > > > > > > > >                                       i);
> > > > > > > > >                       /*
> > > > > > > > >                        * Set the next frame output to go to a dummy frame
> > > > > > > > > -                      * if we have not managed to obtain another frame
> > > > > > > > > -                      * from the queue.
> > > > > > > > > +                      * if no buffer currently queued.
> > > > > > > > >                        */
> > > > > > > > > -                     unicam_schedule_dummy_buffer(node);
> > > > > > > > > +                     if (!node->next_frm ||
> > > > > > > > > +                         node->next_frm == node->cur_frm) {
> > > > > > > > > +                             unicam_schedule_dummy_buffer(node);
> > > > > > > > > +                     } else if (unicam->node[i].cur_frm) {
> > > > > > > > > +                             /*
> > > > > > > > > +                              * Repeated FS without FE. Hardware will have
> > > > > > > > > +                              * swapped buffers, but the cur_frm doesn't
> > > > > > > > > +                              * contain valid data. Return cur_frm to the
> > > > > > > > > +                              * queue.
> > > > > > > >
> > > > > > > > So the buffer gets silently recycled ? Or should it be returned with
> > > > > > > > errors to userspace ?
> > > > > > >
> > > > > > > The buffer silently gets recycled and we dequeue when we are sure it
> > > > > > > is valid and will not get overwritten.  If we were to return to
> > > > > >
> > > > > > I haven't find in the v4l2 specs any reference to what the behaviour
> > > > > > should be.
> > > > > >
> > > > > > If I can summarize it: When a frame capture is aborted after the DMA
> > > > > > transfer has already started, should the corresponding capture buffer
> > > > > > be returned to the user in error state or the frame drop can go
> > > > > > silently ignored ?
> > > >
> > > > If the DMA tranfer is aborted, I would return the buffer to userspace.
> > > > This will indicate a frame loss better than deducing it from a gap in
> > > > the sequence numbers.
> > > >
> > > > Is the DMA really aborted here though ?
> > >
> > > No, the DMA continues, causing possilbe overwrite/tearing in the
> > > framebuffer.  Hence we defer returning it until we can ensure we don't
> > > overwrite into the buffer on the next frame.
> >
> > If the DMA continues then we certainly can't return the buffer to
> > userspace. Is it the next frame being DMA'ed to the same buffer, or does
> > the hardware put it the buffer at the back of its queue ?
> 
> The next frame will be DMA'ed into the same buffer in this error
> condition. The hardware really only has a 2-deep buffer queue (current
> + next frame), and no reliable way of telling if next has been swapped
> to been swapped.

OK, that makes sense.

In that case, is putting the buffer back to the back of the dma_queue
the right option ? Shouldn't it be kept current and "just" be completed
one frame later ? Or did I misunderstand the patch ?

> > > > > > Cc-ing Hans Sakari and Laurent for opinions.
> > > > > >
> > > > > > > userspace with an error, there is still a race condition on the name
> > > > > > > frame/buffer which will also have to return as error.
> > > > > >
> > > > > > I'm sorry I didn't get this part :)
> > > > > >
> > > > > > > > > +                              */
> > > > > > > > > +                             spin_lock(&node->dma_queue_lock);
> > > > > > > > > +                             list_add_tail(&node->cur_frm->list,
> > > > > > > > > +                                           &node->dma_queue);
> > > > > > > > > +                             spin_unlock(&node->dma_queue_lock);
> > > > > > > > > +                             node->cur_frm = node->next_frm;
> > > > > > > > > +                             node->next_frm = NULL;
> > > > > > > > > +                     }
> > > > > > > > >               }
> > > > > > > > >
> > > > > > > > >               unicam_queue_event_sof(unicam);

-- 
Regards,

Laurent Pinchart

