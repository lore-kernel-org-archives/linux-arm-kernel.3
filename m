Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA19D75E2B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 11:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJAb2wfaEGwYjP5tGhyEnaRAxPwQNw0aCt1/mnNWsV8=; b=xVYqLk5p+FUk/ONNJRVVqDQLtM
	M+2MmEK+bRVio+H83zm9m8K4rYMlqK78Q09z8qZIxQcQT5c0SXU2iegKwmwtVI3fNk7Xc52ECltby
	et1YzABgqi1ZwjS1A1qUj7GvTjitttwUPGmZF0tdd7gVcFRQ3uynSeDlRXrvuA0UwNJbQUpitWxbr
	s1Eat5NZcbKDxyTDOq9yP05rj51s1YVy3nCvFvyjHlQyrDan0QOYlI8zY5+yOHwyesNSWH8pYHfKg
	gpXW/SBtjDc2SSDIh3ieB4/XhqN3t+weozCyUqvjoyyWag1URteHxdd492J0uNDCbuPcun2HZD4HN
	W3DzFvOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tES30-00000002O6S-2PyK;
	Fri, 22 Nov 2024 11:42:02 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tES22-00000002Nyl-2dUb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 11:41:03 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-dfdcda2bdbcso60510276.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 03:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732275662; x=1732880462; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jJAb2wfaEGwYjP5tGhyEnaRAxPwQNw0aCt1/mnNWsV8=;
        b=d+j8izIfM7GvwL+0hA1WvSQgKgsUGgjaKiAfbPGxFP1gPWhKHNgEFopBf2EiqVz6iL
         eu6gsFcSdRczFs5LvsT5lMXmX5RjrfGT0ENoi2A+YvnB14Xseuf3KmaPADKjN1PYdFwx
         sLagcUb61JDRrWhmUDc3nfFeVPL5d0rJf7T5OT7jZQAyK3tnJ6Cc/40gEJ3yZtEBscJf
         XWQ1LzVfBUrqrZ4CxPHD7catoVhX/xhHJ40zxqauOYJPJr/faxmbRptQXW1Pd9TzaH2o
         7jBEFZuxrhTN0+KehcKDWDdkvzmEDAHzwae1xfIDcOyDxovb866lLv5HvVm9LiP/NSBH
         2svA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732275662; x=1732880462;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJAb2wfaEGwYjP5tGhyEnaRAxPwQNw0aCt1/mnNWsV8=;
        b=Q5nsKswgxRZS0wDFt4X1Cjpi88WPcEJDRBcGxsTXek+SqFnrpl5HFc/q8WqgeBUoBz
         3LN22NGtZrXTaNbY1i6+k4YPc61jjYFzmT7Pbujsq1pKzSw93aMZR1cUewci5je0oiNG
         NSyLU7RAmM3uOs5nFeY5So4W8aoI3MINT3GW9ln8JSk1VhxdxLqqkTnujhWNEGw5RWuh
         Sm0M9/rOk3lw4+MA+xopp959ZZAAjZQsrN84GwcFWOL03f85GLgazLAi9BgbNI6b1ryj
         lP0INNCeKAAxNlYk37v9yoPFrqjsII8QYa6fzJwu+qPN9Xi9gcb1+p6xe3qARJama//o
         H5oA==
X-Forwarded-Encrypted: i=1; AJvYcCUmdG8TXlYKIY1NfcXxnUACn3nTg1Zi5iZADzDyqXpG8IOlBDrA8UhjDxuxxoMHPIZaDf2hD6efciYrF3QQVR5p@lists.infradead.org
X-Gm-Message-State: AOJu0YyVhH/SUBlrwpkHkt3ZoNszxEi7nHjLCB33D4W1Kzqypltjni3m
	w5UgiaJmpIyKempSGUXafTDHDjSp8ELfckwCW3qNPV2KPoR2id+xrEkAto5mdQAddlcca4iFcai
	PZCI5JihYSjJ9ddfiVw8j1gpv8AcoPhW/sOpaDA==
X-Gm-Gg: ASbGncsBxZ8OCLhmPf1npPURQmHYML+bPM7ydnN7/wil4lVMDJD6Wxr1KyjG7NHht8y
	peTGyVRg29K8RySw/lLtZFLJ8D3kERlW75BgwzdDCmeP9GAHzmedKXrH3LTsB/7k=
X-Google-Smtp-Source: AGHT+IEi3ScDmwaL6BuNLPC9RVZ0SffHnlV2j182TkFRSvu6Ibvv0coqzDmjB1nUi4Vfhlt3vE6Ek0Qw1Jo4FhfXkvs=
X-Received: by 2002:a05:690c:680d:b0:6dd:c828:485a with SMTP id
 00721157ae682-6eee0b67b47mr11613407b3.8.1732275661801; Fri, 22 Nov 2024
 03:41:01 -0800 (PST)
MIME-Version: 1.0
References: <20241122084152.1841419-1-naush@raspberrypi.com>
 <20241122084152.1841419-6-naush@raspberrypi.com> <xy44zndazbw7ehpzbc6hexgptjymevvupjhuy2x6zxp54qtepm@vlbb6js62cq4>
In-Reply-To: <xy44zndazbw7ehpzbc6hexgptjymevvupjhuy2x6zxp54qtepm@vlbb6js62cq4>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Fri, 22 Nov 2024 11:40:26 +0000
Message-ID: <CAEmqJPrrAhhukn2H4nUhe1njVi-dyW9q=u1h8YgafvJGbYRG6Q@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] drivers: media: bcm2835-unicam: Correctly handle
 FS + FE ISR condition
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_034102_666236_B4010115 
X-CRM114-Status: GOOD (  33.69  )
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

On Fri, 22 Nov 2024 at 11:16, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Naush
>
> On Fri, Nov 22, 2024 at 08:41:52AM +0000, Naushir Patuck wrote:
> > This change aligns the FS/FE interrupt handling with the Raspberry Pi
> > kernel downstream Unicam driver.
> >
> > If we get a simultaneous FS + FE interrupt for the same frame, it cannot
> > be marked as completed and returned to userland as the framebuffer will
> > be refilled by Unicam on the next sensor frame. Additionally, the
> > timestamp will be set to 0 as the FS interrupt handling code will not
> > have run yet.
> >
> > To avoid these problems, the frame is considered dropped in the FE
> > handler, and will be returned to userland on the subsequent sensor frame.
> >
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > ---
> >  .../media/platform/broadcom/bcm2835-unicam.c  | 39 +++++++++++++++++--
> >  1 file changed, 35 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > index f10064107d54..0d2aa25d483f 100644
> > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > @@ -773,10 +773,26 @@ static irqreturn_t unicam_isr(int irq, void *dev)
> >                        * as complete, as the HW will reuse that buffer.
> >                        */
> >                       if (node->cur_frm && node->cur_frm != node->next_frm) {
> > +                             /*
> > +                              * This condition checks if FE + FS for the same
> > +                              * frame has occurred. In such cases, we cannot
> > +                              * return out the frame, as no buffer handling
> > +                              * or timestamping has yet been done as part of
> > +                              * the FS handler.
> > +                              */
> > +                             if (!node->cur_frm->vb.vb2_buf.timestamp) {
> > +                                     dev_dbg(unicam->v4l2_dev.dev,
> > +                                             "ISR: FE without FS, dropping frame\n");
> > +                                     continue;
> > +                             }
> > +
> >                               unicam_process_buffer_complete(node, sequence);
> > +                             node->cur_frm = node->next_frm;
> > +                             node->next_frm = NULL;
> >                               inc_seq = true;
> > +                     } else {
> > +                             node->cur_frm = node->next_frm;
> >                       }
> > -                     node->cur_frm = node->next_frm;
> >               }
> >
> >               /*
> > @@ -812,10 +828,25 @@ static irqreturn_t unicam_isr(int irq, void *dev)
> >                                       i);
> >                       /*
> >                        * Set the next frame output to go to a dummy frame
> > -                      * if we have not managed to obtain another frame
> > -                      * from the queue.
> > +                      * if no buffer currently queued.
> >                        */
> > -                     unicam_schedule_dummy_buffer(node);
> > +                     if (!node->next_frm ||
> > +                         node->next_frm == node->cur_frm) {
> > +                             unicam_schedule_dummy_buffer(node);
> > +                     } else if (unicam->node[i].cur_frm) {
> > +                             /*
> > +                              * Repeated FS without FE. Hardware will have
> > +                              * swapped buffers, but the cur_frm doesn't
> > +                              * contain valid data. Return cur_frm to the
> > +                              * queue.
>
> So the buffer gets silently recycled ? Or should it be returned with
> errors to userspace ?

The buffer silently gets recycled and we dequeue when we are sure it
is valid and will not get overwritten.  If we were to return to
userspace with an error, there is still a race condition on the name
frame/buffer which will also have to return as error.

Regards,
Naush


>
> > +                              */
> > +                             spin_lock(&node->dma_queue_lock);
> > +                             list_add_tail(&node->cur_frm->list,
> > +                                           &node->dma_queue);
> > +                             spin_unlock(&node->dma_queue_lock);
> > +                             node->cur_frm = node->next_frm;
> > +                             node->next_frm = NULL;
> > +                     }
> >               }
> >
> >               unicam_queue_event_sof(unicam);
> > --
> > 2.34.1
> >
> >

