Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEFDE668A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 10:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26FZSeEdgO+NHa3EUYAzp6T4D/JS5Ge/APF1zhDq5PE=; b=ovFKfZg91+vIM6IH7UO/wA2Hmb
	zUjPN1fNyy/dFgQogz0Ox4nRB0pt0nsTbZJ2HKQHGuKH/u9oUGCv72IpMgwPh8GxYImvzoqoRQLKi
	2df9OfhZZyYzPdHqsfHo9wgR+6rHVjsNa1l0x35v6Bfk19oMlr5u/83nT4zraaeYuq+6K4YymRH1t
	mzirZIPsUnSZqCG7ty4MAIW8bkQlJMfEd633vkKP2qU3A93x+DJqfGKs3EC7pANiDyI+xyoCBAFXd
	2/6RpJ/Fi3qWJ9dNKVrEVRILzQTj4ZaN32ktZLNNAlM5MSMTU/mtDcp8jPyjsRFf2NvKKYwTRnfEF
	Kq6OMVAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWcz-00000007o7O-1hM3;
	Mon, 25 Nov 2024 10:47:37 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWc2-00000007o0t-0nA5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 10:46:39 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e393167dd71so73644276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 02:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732531597; x=1733136397; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=26FZSeEdgO+NHa3EUYAzp6T4D/JS5Ge/APF1zhDq5PE=;
        b=WqcaqIvPm4EFSAyhVB2OlqIULIABQOtpivKSE/QH+zD2scGGCZ7ccCbSVcyE/Y74V/
         i9IwVG75eXikoMDXvz00D2tSMeUaXTbqRVINS3vtRoJf+E1M4JFrKr63KLaHyHCaeR/Z
         exyfXY07f73khmWSL/KAUf/JQ5zX7YEGZHwP7aFOYXQIocaokgUwNFYiQJwHhA3NFo0D
         7lQriMRbtVAtQ0Qdo++cikOIV1dYxgra2Fa9k5jpjMFsqmomAsqZEVhUBxeY2KCzHpVm
         FIgUBCvPniqPpB51xFFkSGpbTNEpa+VXcWiE8LhYeska/rPu26wj2vS61M+I40zoJV+q
         evcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732531597; x=1733136397;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26FZSeEdgO+NHa3EUYAzp6T4D/JS5Ge/APF1zhDq5PE=;
        b=gbK+4wyoMtGGmof/xCP0UBfh+D+iJVovYK3HRgcoLjyXWcdbutV05x4dkaE/xDlb9K
         fgJ6cpTI87TH7NZoJfX2qDtIYbWBLBiICEhF67OVMd1G6wlKb1SsyloLuToEz66zKsn/
         sKQG3nl93AmwAwe8dC+FkUMmC5B04ytph/qvkyfeiVoGh7rcQs1/fEF21xgbLye+wRnP
         PbtaQSxQgFLqwl1VfebDex2/aTGdYICS6DxMxgXoZNIHMBMTWbDSBU584pd4/JIk/kTZ
         am9mhVaaHWPzkixHNBLEP9h52t2rIJZ6IajKXVFz6jVgIOOnsLjOqKN3Wfbulz4+4eCz
         xmDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMxhubfji25/L75VScAtz+2SRa4IhqouSb0+RKcrs7GyptV8RoGzg5dEDxgCwCPwLCjgiLRPbx5jySMMCy+App@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9yoN3cHzC1QJgXtV/MyUkLC+vHQ6rE32chkHTgw+H12/Lblvk
	ysln85cTWEPtIHm0FOyh6HjESuLAdVfrD46lBlo9OsZpv/bp2DTmyVYy7eojkY0/4aGvrA8+cfq
	fKw6kXGiF0haHTYv0AUsYVG/Icb1rj8Gmp9vAPQ==
X-Gm-Gg: ASbGncux7Q5tYruhzCekL68poz4f8vGVRjfz/uEIlvCRBA+KmSLwL2ymYsHuVTQ1BzU
	c0dPN7+/ZpvSGMg5XcF4/7YGyA907p0/J5RJSnbhbzsCxY+nEEi8ljssMLRwYcz4=
X-Google-Smtp-Source: AGHT+IEKBDUKsnQY2QvubNmp8u3yV1Nbr7olengon87+FnysXiAS6rV6LCeYk/aaPdprs28q0xV7/4+THizDS8P+rvc=
X-Received: by 2002:a05:6902:2210:b0:e38:b8bb:fb7d with SMTP id
 3f1490d57ef6-e38f8c11c69mr3265008276.11.1732531597130; Mon, 25 Nov 2024
 02:46:37 -0800 (PST)
MIME-Version: 1.0
References: <20241122084152.1841419-1-naush@raspberrypi.com>
 <20241122084152.1841419-6-naush@raspberrypi.com> <xy44zndazbw7ehpzbc6hexgptjymevvupjhuy2x6zxp54qtepm@vlbb6js62cq4>
 <CAEmqJPrrAhhukn2H4nUhe1njVi-dyW9q=u1h8YgafvJGbYRG6Q@mail.gmail.com>
 <xadxi6rjcnmgjiqhinqnawj3mgps4b3xp6ftozap4ps6q5xaz7@bsdwrrkyniwt>
 <deremuh7mawzt6ke3c67fvzfyuksmuwon3dhorxbm5mr5rllmf@fbj2f5qvfpjd>
 <20241124070428.GG19573@pendragon.ideasonboard.com> <CAEmqJPrDvhz+np4MxKiwfrKyjxG0HnO45T+U2=Bpbmm6MW1uXg@mail.gmail.com>
 <20241125092335.GL19381@pendragon.ideasonboard.com> <CAEmqJPo58OCosJhKZeut4=ZGQfk3CCJR_G8ZZZvmAUNTwfmKjw@mail.gmail.com>
 <20241125102707.GP19381@pendragon.ideasonboard.com>
In-Reply-To: <20241125102707.GP19381@pendragon.ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Mon, 25 Nov 2024 10:46:01 +0000
Message-ID: <CAEmqJPrDb5_L-9tv7nEuG7GoN6naKhM-vsC0tPfLQaAQYisqjg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241125_024638_273065_18BB778D 
X-CRM114-Status: GOOD (  56.50  )
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


On Mon, 25 Nov 2024 at 10:27, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Naush,
>
> On Mon, Nov 25, 2024 at 09:46:26AM +0000, Naushir Patuck wrote:
> > On Mon, 25 Nov 2024 at 09:23, Laurent Pinchart wrote:
> > > On Mon, Nov 25, 2024 at 08:37:22AM +0000, Naushir Patuck wrote:
> > > > On Sun, 24 Nov 2024 at 07:04, Laurent Pinchart wrote:
> > > > > On Fri, Nov 22, 2024 at 03:48:11PM +0100, Jacopo Mondi wrote:
> > > > > >
> > > > > > With Hans Sakari and Laurent in cc for real now
> > > > > >
> > > > > > On Fri, Nov 22, 2024 at 03:41:31PM +0100, Jacopo Mondi wrote:
> > > > > > > On Fri, Nov 22, 2024 at 11:40:26AM +0000, Naushir Patuck wrote:
> > > > > > > > On Fri, 22 Nov 2024 at 11:16, Jacopo Mondi wrote:
> > > > > > > > > On Fri, Nov 22, 2024 at 08:41:52AM +0000, Naushir Patuck wrote:
> > > > > > > > > > This change aligns the FS/FE interrupt handling with the Raspberry Pi
> > > > > > > > > > kernel downstream Unicam driver.
> > > > > > > > > >
> > > > > > > > > > If we get a simultaneous FS + FE interrupt for the same frame, it cannot
> > > > > > > > > > be marked as completed and returned to userland as the framebuffer will
> > > > > > > > > > be refilled by Unicam on the next sensor frame. Additionally, the
> > > > > > > > > > timestamp will be set to 0 as the FS interrupt handling code will not
> > > > > > > > > > have run yet.
> > > > > > > > > >
> > > > > > > > > > To avoid these problems, the frame is considered dropped in the FE
> > > > > > > > > > handler, and will be returned to userland on the subsequent sensor frame.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > > > > > > > > > ---
> > > > > > > > > >  .../media/platform/broadcom/bcm2835-unicam.c  | 39 +++++++++++++++++--
> > > > > > > > > >  1 file changed, 35 insertions(+), 4 deletions(-)
> > > > > > > > > >
> > > > > > > > > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > > > > > index f10064107d54..0d2aa25d483f 100644
> > > > > > > > > > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > > > > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > > > > > > @@ -773,10 +773,26 @@ static irqreturn_t unicam_isr(int irq, void *dev)
> > > > > > > > > >                        * as complete, as the HW will reuse that buffer.
> > > > > > > > > >                        */
> > > > > > > > > >                       if (node->cur_frm && node->cur_frm != node->next_frm) {
> > > > > > > > > > +                             /*
> > > > > > > > > > +                              * This condition checks if FE + FS for the same
> > > > > > > > > > +                              * frame has occurred. In such cases, we cannot
> > > > > > > > > > +                              * return out the frame, as no buffer handling
> > > > > > > > > > +                              * or timestamping has yet been done as part of
> > > > > > > > > > +                              * the FS handler.
> > > > > > > > > > +                              */
> > > > > > > > > > +                             if (!node->cur_frm->vb.vb2_buf.timestamp) {
> > > > > > > > > > +                                     dev_dbg(unicam->v4l2_dev.dev,
> > > > > > > > > > +                                             "ISR: FE without FS, dropping frame\n");
> > > > > > > > > > +                                     continue;
> > > > > > > > > > +                             }
> > > > > > > > > > +
> > > > > > > > > >                               unicam_process_buffer_complete(node, sequence);
> > > > > > > > > > +                             node->cur_frm = node->next_frm;
> > > > > > > > > > +                             node->next_frm = NULL;
> > > > > > > > > >                               inc_seq = true;
> > > > > > > > > > +                     } else {
> > > > > > > > > > +                             node->cur_frm = node->next_frm;
> > > > > > > > > >                       }
> > > > > > > > > > -                     node->cur_frm = node->next_frm;
> > > > > > > > > >               }
> > > > > > > > > >
> > > > > > > > > >               /*
> > > > > > > > > > @@ -812,10 +828,25 @@ static irqreturn_t unicam_isr(int irq, void *dev)
> > > > > > > > > >                                       i);
> > > > > > > > > >                       /*
> > > > > > > > > >                        * Set the next frame output to go to a dummy frame
> > > > > > > > > > -                      * if we have not managed to obtain another frame
> > > > > > > > > > -                      * from the queue.
> > > > > > > > > > +                      * if no buffer currently queued.
> > > > > > > > > >                        */
> > > > > > > > > > -                     unicam_schedule_dummy_buffer(node);
> > > > > > > > > > +                     if (!node->next_frm ||
> > > > > > > > > > +                         node->next_frm == node->cur_frm) {
> > > > > > > > > > +                             unicam_schedule_dummy_buffer(node);
> > > > > > > > > > +                     } else if (unicam->node[i].cur_frm) {
> > > > > > > > > > +                             /*
> > > > > > > > > > +                              * Repeated FS without FE. Hardware will have
> > > > > > > > > > +                              * swapped buffers, but the cur_frm doesn't
> > > > > > > > > > +                              * contain valid data. Return cur_frm to the
> > > > > > > > > > +                              * queue.
> > > > > > > > >
> > > > > > > > > So the buffer gets silently recycled ? Or should it be returned with
> > > > > > > > > errors to userspace ?
> > > > > > > >
> > > > > > > > The buffer silently gets recycled and we dequeue when we are sure it
> > > > > > > > is valid and will not get overwritten.  If we were to return to
> > > > > > >
> > > > > > > I haven't find in the v4l2 specs any reference to what the behaviour
> > > > > > > should be.
> > > > > > >
> > > > > > > If I can summarize it: When a frame capture is aborted after the DMA
> > > > > > > transfer has already started, should the corresponding capture buffer
> > > > > > > be returned to the user in error state or the frame drop can go
> > > > > > > silently ignored ?
> > > > >
> > > > > If the DMA tranfer is aborted, I would return the buffer to userspace.
> > > > > This will indicate a frame loss better than deducing it from a gap in
> > > > > the sequence numbers.
> > > > >
> > > > > Is the DMA really aborted here though ?
> > > >
> > > > No, the DMA continues, causing possilbe overwrite/tearing in the
> > > > framebuffer.  Hence we defer returning it until we can ensure we don't
> > > > overwrite into the buffer on the next frame.
> > >
> > > If the DMA continues then we certainly can't return the buffer to
> > > userspace. Is it the next frame being DMA'ed to the same buffer, or does
> > > the hardware put it the buffer at the back of its queue ?
> >
> > The next frame will be DMA'ed into the same buffer in this error
> > condition. The hardware really only has a 2-deep buffer queue (current
> > + next frame), and no reliable way of telling if next has been swapped
> > to been swapped.
>
> OK, that makes sense.
>
> In that case, is putting the buffer back to the back of the dma_queue
> the right option ? Shouldn't it be kept current and "just" be completed
> one frame later ? Or did I misunderstand the patch ?

Yes, I agree that the buffer handling logic below does seem
contradictory.  I'm going to need time to look into this in more
detail, it's been quite some time since I looked into this.  I would
suggest we remove this particular patch from the series until I get a
better understanding of the change.

Regards,
Naush


>
> > > > > > > Cc-ing Hans Sakari and Laurent for opinions.
> > > > > > >
> > > > > > > > userspace with an error, there is still a race condition on the name
> > > > > > > > frame/buffer which will also have to return as error.
> > > > > > >
> > > > > > > I'm sorry I didn't get this part :)
> > > > > > >
> > > > > > > > > > +                              */
> > > > > > > > > > +                             spin_lock(&node->dma_queue_lock);
> > > > > > > > > > +                             list_add_tail(&node->cur_frm->list,
> > > > > > > > > > +                                           &node->dma_queue);
> > > > > > > > > > +                             spin_unlock(&node->dma_queue_lock);
> > > > > > > > > > +                             node->cur_frm = node->next_frm;
> > > > > > > > > > +                             node->next_frm = NULL;
> > > > > > > > > > +                     }
> > > > > > > > > >               }
> > > > > > > > > >
> > > > > > > > > >               unicam_queue_event_sof(unicam);
>
> --
> Regards,
>
> Laurent Pinchart

