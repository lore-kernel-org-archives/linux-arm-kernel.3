Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962F0C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 15:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpVuhd57p5ZA9u9v7o/i9FRvWvTDiDOi5Kza2mP66e0=; b=uxFP06apNqQAvC00zOAVsbRw44
	NzLE9twcO8Beb26C1oQiDbCz4sGLkU7DgbyVjYoC1WCTtMi5mN+ferrMGAero/1lc5+GvFYYwTk++
	GiszYElnFjN0OtNytfHgkujOtbR2KRmDniLT/vF2hGrOKev92+1Dgm9aEOaNNKe5SGv8IrNKkTNnF
	nxPocde57t+ix9643aYi8b2PV6QdSMPLf3asg47bM/0X6FAaoyTlGcJG/KGlvWndZa9Xed6b41++e
	2a2X+WQYeO/Y6MHUms7WCL2n/d8yBV1eh0z6CdXAyE/BHg31NEpBSEt455Shq5nBogqfRTOvKnYI0
	HaCk2N0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYTy-00000007lUY-2RaF;
	Tue, 17 Jun 2025 15:44:18 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXMr-00000007ZbB-2MPm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 14:32:55 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-877e4077dc3so57395241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 07:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1750170772; x=1750775572; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UpVuhd57p5ZA9u9v7o/i9FRvWvTDiDOi5Kza2mP66e0=;
        b=nsZp8DuUv+5sIai8qU4W6+0h4l55QR/Yr0ms0LsHeptnh+n0vBdisDgRSFP/gkvN2k
         Ozs9nmrIoOM5Gdw6d45AuLpQ/2COqrmaK/fcAh8n/GiVFeDvwwgw9HhJbblSt1pFvhXr
         nEBmuREVxFIUQd2CJUu+7utzfsCC/BUnlTnjny09via4fGyyGX0VM+xT+1cJQl6ehWML
         g46KwkdJJtP9Gl34FFhhVfsPP3lR5iIHf/VRQRsjUxkN/9UbVaMZOpCbrofew3381yr+
         ddWgK+3g57uYQdIyamKzcsV22BNMmF/PLmRCEHvc3auXFoAAVcEtwoh1WEu41WbY09CV
         CTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750170772; x=1750775572;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UpVuhd57p5ZA9u9v7o/i9FRvWvTDiDOi5Kza2mP66e0=;
        b=pesYB+0dgU7FINkr1tR6QLk4+7PEy1pk6T3Pm8mxFFBTGjazJH7yVZlAJgasgzTEuB
         XPtuttGM9bNVdEnxT18inAzKrqd9rgD2B02QPxICVPS7NZeuSxsh4KdzrcuZ8viPx0+0
         nBm+LvcDRjri+7lz3svQ1z9pJPHhcjnOpUxMG4lmxlN5KUWVmGbaV7V9RxfnrHuk0Ij3
         W4hqsLfbLLRfqWH6RXK7aGmoqdbqddjncx1hTb7IuSgxxigf/+KgfstBCl8E/NAgqxV4
         p67MnbwBkIwqxst6UblhOeMVlEiWhDdQPgvIRPhT8EMQ+QSkWBYPcSYmi+MFVDe5WCX1
         E2tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIrdPAKQTzzdJEddrfOWeunpWOdDiM6ZSEcbWh5GZo/H72fiz2fDvGmyjIHDDIslxO6cfqkWfQUK3ZHLNQdwmW@lists.infradead.org
X-Gm-Message-State: AOJu0YxxRnA8NT+wN5naAbfLhCrBBD5rn9+04C3cp6EGGxGSpFrmSi6g
	rQPCpxRiOXCJq9IQKfY9ci7OSWE03PzgIRL3miNijAR7UIxDxj9yhyXMa/5QjZYuG75OTkdKrPo
	xBjOXlS5O4+jcXpYakBMHbIk+eoF9iQwAijkCVtUtCw==
X-Gm-Gg: ASbGncuNPCM8blI4Ef9kRcVbmLUm4lXg+t23mgI2H+KllVQMIMx/cEoOVw4ZZicq0cY
	nQ2EHS3kuxPHJfZ0RhaOCPLbnT/JcP7WgmoYrBhlinrTznIqKgU2OSLaE8GYGshbm2E1F2XqYjh
	MNppRQe2tFj3f8rc7iEmIlz/rMRnQ4b27nRaTFO0JI
X-Google-Smtp-Source: AGHT+IGTVqsuzTLaFuVqtYIazEIZdLZAOFPRgX/KC9sHF4LyTsKoJCWIlkyH4YKO1sxPGdRaHqYpvDzMTKK+6itImNA=
X-Received: by 2002:ac5:c74d:0:b0:52f:44fc:3b30 with SMTP id
 71dfb90a1353d-5314940abf8mr2321729e0c.2.1750170772352; Tue, 17 Jun 2025
 07:32:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-0-e58ae199c17d@ideasonboard.com>
 <20250617-pispbe-mainline-split-jobs-handling-v6-v8-3-e58ae199c17d@ideasonboard.com>
In-Reply-To: <20250617-pispbe-mainline-split-jobs-handling-v6-v8-3-e58ae199c17d@ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Tue, 17 Jun 2025 15:32:17 +0100
X-Gm-Features: Ac12FXx8nCXb9hHGOd7Z8EnpOMRizDD1-QFHNkx6xBX-t_x8Y1VpsEYROY0dKEs
Message-ID: <CAEmqJPokx39uXWPLLw0YBXsw+jqS4cTYfZDMbQAJCp2xVDW8sw@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] media: pisp_be: Split jobs creation and scheduling
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
	David Plowman <david.plowman@raspberrypi.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_073253_621507_EFB5E4EA 
X-CRM114-Status: GOOD (  40.58  )
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

On Tue, 17 Jun 2025 at 14:54, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Currently the 'pispbe_schedule()' function does two things:
>
> 1) Tries to assemble a job by inspecting all the video node queues
>    to make sure all the required buffers are available
> 2) Submit the job to the hardware
>
> The pispbe_schedule() function is called at:
>
> - video device start_streaming() time
> - video device qbuf() time
> - irq handler
>
> As assembling a job requires inspecting all queues, it is a rather
> time consuming operation which is better not run in IRQ context.
>
> To avoid executing the time consuming job creation in interrupt
> context split the job creation and job scheduling in two distinct
> operations. When a well-formed job is created, append it to the
> newly introduced 'pispbe->job_queue' where it will be dequeued from
> by the scheduling routine.
>
> As the per-node 'ready_queue' buffer list is only accessed in vb2 ops
> callbacks, protected by the node->queue_lock mutex, it is not necessary
> to guard it with a dedicated spinlock so drop it. Also use the
> spin_lock_irq() variant in all functions not called from an IRQ context
> where the spin_lock_irqsave() version was used.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Naushir Patuck <naush@raspberrypi.com>

> ---
>  .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 161 +++++++++++----------
>  1 file changed, 87 insertions(+), 74 deletions(-)
>
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> index 92c452891d6c2d68aff9aa269c06fa1af77e3885..ccc6cb99868b842ac0d295f9ec28470303e60788 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/slab.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/videobuf2-dma-contig.h>
> @@ -161,8 +162,6 @@ struct pispbe_node {
>         struct mutex node_lock;
>         /* vb2_queue lock */
>         struct mutex queue_lock;
> -       /* Protect pispbe_node->ready_queue and pispbe_buffer->ready_list */
> -       spinlock_t ready_lock;
>         struct list_head ready_queue;
>         struct vb2_queue queue;
>         struct v4l2_format format;
> @@ -190,6 +189,8 @@ struct pispbe_hw_enables {
>
>  /* Records a job configuration and memory addresses. */
>  struct pispbe_job_descriptor {
> +       struct list_head queue;
> +       struct pispbe_buffer *buffers[PISPBE_NUM_NODES];
>         dma_addr_t hw_dma_addrs[N_HW_ADDRESSES];
>         struct pisp_be_tiles_config *config;
>         struct pispbe_hw_enables hw_enables;
> @@ -215,8 +216,10 @@ struct pispbe_dev {
>         unsigned int sequence;
>         u32 streaming_map;
>         struct pispbe_job queued_job, running_job;
> -       spinlock_t hw_lock; /* protects "hw_busy" flag and streaming_map */
> +       /* protects "hw_busy" flag, streaming_map and job_queue */
> +       spinlock_t hw_lock;
>         bool hw_busy; /* non-zero if a job is queued or is being started */
> +       struct list_head job_queue;
>         int irq;
>         u32 hw_version;
>         u8 done, started;
> @@ -440,42 +443,48 @@ static void pispbe_xlate_addrs(struct pispbe_dev *pispbe,
>   * For Output0, Output1, Tdn and Stitch, a buffer only needs to be
>   * available if the blocks are enabled in the config.
>   *
> - * Needs to be called with hw_lock held.
> + * If all the buffers required to form a job are available, append the
> + * job descriptor to the job queue to be later queued to the HW.
>   *
>   * Returns 0 if a job has been successfully prepared, < 0 otherwise.
>   */
> -static int pispbe_prepare_job(struct pispbe_dev *pispbe,
> -                             struct pispbe_job_descriptor *job)
> +static int pispbe_prepare_job(struct pispbe_dev *pispbe)
>  {
> +       struct pispbe_job_descriptor __free(kfree) *job = NULL;
>         struct pispbe_buffer *buf[PISPBE_NUM_NODES] = {};
> +       unsigned int streaming_map;
>         unsigned int config_index;
>         struct pispbe_node *node;
> -       unsigned long flags;
>
> -       lockdep_assert_held(&pispbe->hw_lock);
> +       lockdep_assert_irqs_enabled();
>
> -       memset(job, 0, sizeof(struct pispbe_job_descriptor));
> +       scoped_guard(spinlock_irq, &pispbe->hw_lock) {
> +               static const u32 mask = BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE);
>
> -       if (((BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE)) &
> -               pispbe->streaming_map) !=
> -                       (BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE)))
> -               return -ENODEV;
> +               if ((pispbe->streaming_map & mask) != mask)
> +                       return -ENODEV;
> +
> +               /*
> +                * Take a copy of streaming_map: nodes activated after this
> +                * point are ignored when preparing this job.
> +                */
> +               streaming_map = pispbe->streaming_map;
> +       }
> +
> +       job = kzalloc(sizeof(*job), GFP_KERNEL);
> +       if (!job)
> +               return -ENOMEM;
>
>         node = &pispbe->node[CONFIG_NODE];
> -       spin_lock_irqsave(&node->ready_lock, flags);
>         buf[CONFIG_NODE] = list_first_entry_or_null(&node->ready_queue,
>                                                     struct pispbe_buffer,
>                                                     ready_list);
> -       if (buf[CONFIG_NODE]) {
> -               list_del(&buf[CONFIG_NODE]->ready_list);
> -               pispbe->queued_job.buf[CONFIG_NODE] = buf[CONFIG_NODE];
> -       }
> -       spin_unlock_irqrestore(&node->ready_lock, flags);
> -
> -       /* Exit early if no config buffer has been queued. */
>         if (!buf[CONFIG_NODE])
>                 return -ENODEV;
>
> +       list_del(&buf[CONFIG_NODE]->ready_list);
> +       job->buffers[CONFIG_NODE] = buf[CONFIG_NODE];
> +
>         config_index = buf[CONFIG_NODE]->vb.vb2_buf.index;
>         job->config = &pispbe->config[config_index];
>         job->tiles = pispbe->config_dma_addr +
> @@ -495,7 +504,7 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
>                         continue;
>
>                 buf[i] = NULL;
> -               if (!(pispbe->streaming_map & BIT(i)))
> +               if (!(streaming_map & BIT(i)))
>                         continue;
>
>                 if ((!(rgb_en & PISP_BE_RGB_ENABLE_OUTPUT0) &&
> @@ -522,25 +531,28 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
>                 node = &pispbe->node[i];
>
>                 /* Pull a buffer from each V4L2 queue to form the queued job */
> -               spin_lock_irqsave(&node->ready_lock, flags);
>                 buf[i] = list_first_entry_or_null(&node->ready_queue,
>                                                   struct pispbe_buffer,
>                                                   ready_list);
>                 if (buf[i]) {
>                         list_del(&buf[i]->ready_list);
> -                       pispbe->queued_job.buf[i] = buf[i];
> +                       job->buffers[i] = buf[i];
>                 }
> -               spin_unlock_irqrestore(&node->ready_lock, flags);
>
>                 if (!buf[i] && !ignore_buffers)
>                         goto err_return_buffers;
>         }
>
> -       pispbe->queued_job.valid = true;
> -
>         /* Convert buffers to DMA addresses for the hardware */
>         pispbe_xlate_addrs(pispbe, job, buf);
>
> +       scoped_guard(spinlock_irq, &pispbe->hw_lock) {
> +               list_add_tail(&job->queue, &pispbe->job_queue);
> +       }
> +
> +       /* Set job to NULL to avoid automatic release due to __free(). */
> +       job = NULL;
> +
>         return 0;
>
>  err_return_buffers:
> @@ -551,33 +563,37 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
>                         continue;
>
>                 /* Return the buffer to the ready_list queue */
> -               spin_lock_irqsave(&n->ready_lock, flags);
>                 list_add(&buf[i]->ready_list, &n->ready_queue);
> -               spin_unlock_irqrestore(&n->ready_lock, flags);
>         }
>
> -       memset(&pispbe->queued_job, 0, sizeof(pispbe->queued_job));
> -
>         return -ENODEV;
>  }
>
>  static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
>  {
> -       struct pispbe_job_descriptor job;
> -       unsigned long flags;
> -       int ret;
> +       struct pispbe_job_descriptor *job;
> +
> +       scoped_guard(spinlock_irqsave, &pispbe->hw_lock) {
> +               if (clear_hw_busy)
> +                       pispbe->hw_busy = false;
>
> -       spin_lock_irqsave(&pispbe->hw_lock, flags);
> +               if (pispbe->hw_busy)
> +                       return;
>
> -       if (clear_hw_busy)
> -               pispbe->hw_busy = false;
> +               job = list_first_entry_or_null(&pispbe->job_queue,
> +                                              struct pispbe_job_descriptor,
> +                                              queue);
> +               if (!job)
> +                       return;
>
> -       if (pispbe->hw_busy)
> -               goto unlock_and_return;
> +               list_del(&job->queue);
>
> -       ret = pispbe_prepare_job(pispbe, &job);
> -       if (ret)
> -               goto unlock_and_return;
> +               for (unsigned int i = 0; i < PISPBE_NUM_NODES; i++)
> +                       pispbe->queued_job.buf[i] = job->buffers[i];
> +               pispbe->queued_job.valid = true;
> +
> +               pispbe->hw_busy = true;
> +       }
>
>         /*
>          * We can kick the job off without the hw_lock, as this can
> @@ -585,16 +601,8 @@ static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
>          * only when the following job has been queued and an interrupt
>          * is rised.
>          */
> -       pispbe->hw_busy = true;
> -       spin_unlock_irqrestore(&pispbe->hw_lock, flags);
> -
> -       pispbe_queue_job(pispbe, &job);
> -
> -       return;
> -
> -unlock_and_return:
> -       /* No job has been queued, just release the lock and return. */
> -       spin_unlock_irqrestore(&pispbe->hw_lock, flags);
> +       pispbe_queue_job(pispbe, job);
> +       kfree(job);
>  }
>
>  static void pispbe_isr_jobdone(struct pispbe_dev *pispbe,
> @@ -846,18 +854,16 @@ static void pispbe_node_buffer_queue(struct vb2_buffer *buf)
>                 container_of(vbuf, struct pispbe_buffer, vb);
>         struct pispbe_node *node = vb2_get_drv_priv(buf->vb2_queue);
>         struct pispbe_dev *pispbe = node->pispbe;
> -       unsigned long flags;
>
>         dev_dbg(pispbe->dev, "%s: for node %s\n", __func__, NODE_NAME(node));
> -       spin_lock_irqsave(&node->ready_lock, flags);
>         list_add_tail(&buffer->ready_list, &node->ready_queue);
> -       spin_unlock_irqrestore(&node->ready_lock, flags);
>
>         /*
>          * Every time we add a buffer, check if there's now some work for the hw
>          * to do.
>          */
> -       pispbe_schedule(pispbe, false);
> +       if (!pispbe_prepare_job(pispbe))
> +               pispbe_schedule(pispbe, false);
>  }
>
>  static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
> @@ -865,17 +871,16 @@ static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
>         struct pispbe_node *node = vb2_get_drv_priv(q);
>         struct pispbe_dev *pispbe = node->pispbe;
>         struct pispbe_buffer *buf, *tmp;
> -       unsigned long flags;
>         int ret;
>
>         ret = pm_runtime_resume_and_get(pispbe->dev);
>         if (ret < 0)
>                 goto err_return_buffers;
>
> -       spin_lock_irqsave(&pispbe->hw_lock, flags);
> -       node->pispbe->streaming_map |=  BIT(node->id);
> -       node->pispbe->sequence = 0;
> -       spin_unlock_irqrestore(&pispbe->hw_lock, flags);
> +       scoped_guard(spinlock_irq, &pispbe->hw_lock) {
> +               node->pispbe->streaming_map |=  BIT(node->id);
> +               node->pispbe->sequence = 0;
> +       }
>
>         dev_dbg(pispbe->dev, "%s: for node %s (count %u)\n",
>                 __func__, NODE_NAME(node), count);
> @@ -883,17 +888,16 @@ static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
>                 node->pispbe->streaming_map);
>
>         /* Maybe we're ready to run. */
> -       pispbe_schedule(pispbe, false);
> +       if (!pispbe_prepare_job(pispbe))
> +               pispbe_schedule(pispbe, false);
>
>         return 0;
>
>  err_return_buffers:
> -       spin_lock_irqsave(&pispbe->hw_lock, flags);
>         list_for_each_entry_safe(buf, tmp, &node->ready_queue, ready_list) {
>                 list_del(&buf->ready_list);
>                 vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
>         }
> -       spin_unlock_irqrestore(&pispbe->hw_lock, flags);
>
>         return ret;
>  }
> @@ -902,8 +906,9 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
>  {
>         struct pispbe_node *node = vb2_get_drv_priv(q);
>         struct pispbe_dev *pispbe = node->pispbe;
> +       struct pispbe_job_descriptor *job, *temp;
>         struct pispbe_buffer *buf;
> -       unsigned long flags;
> +       LIST_HEAD(tmp_list);
>
>         /*
>          * Now this is a bit awkward. In a simple M2M device we could just wait
> @@ -915,11 +920,7 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
>          * This may return buffers out of order.
>          */
>         dev_dbg(pispbe->dev, "%s: for node %s\n", __func__, NODE_NAME(node));
> -       spin_lock_irqsave(&pispbe->hw_lock, flags);
>         do {
> -               unsigned long flags1;
> -
> -               spin_lock_irqsave(&node->ready_lock, flags1);
>                 buf = list_first_entry_or_null(&node->ready_queue,
>                                                struct pispbe_buffer,
>                                                ready_list);
> @@ -927,15 +928,26 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
>                         list_del(&buf->ready_list);
>                         vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>                 }
> -               spin_unlock_irqrestore(&node->ready_lock, flags1);
>         } while (buf);
> -       spin_unlock_irqrestore(&pispbe->hw_lock, flags);
>
>         vb2_wait_for_all_buffers(&node->queue);
>
> -       spin_lock_irqsave(&pispbe->hw_lock, flags);
> +       spin_lock_irq(&pispbe->hw_lock);
>         pispbe->streaming_map &= ~BIT(node->id);
> -       spin_unlock_irqrestore(&pispbe->hw_lock, flags);
> +
> +       if (pispbe->streaming_map == 0) {
> +               /*
> +                * If all nodes have stopped streaming release all jobs
> +                * without holding the lock.
> +                */
> +               list_splice_init(&pispbe->job_queue, &tmp_list);
> +       }
> +       spin_unlock_irq(&pispbe->hw_lock);
> +
> +       list_for_each_entry_safe(job, temp, &tmp_list, queue) {
> +               list_del(&job->queue);
> +               kfree(job);
> +       }
>
>         pm_runtime_mark_last_busy(pispbe->dev);
>         pm_runtime_put_autosuspend(pispbe->dev);
> @@ -1393,7 +1405,6 @@ static int pispbe_init_node(struct pispbe_dev *pispbe, unsigned int id)
>         mutex_init(&node->node_lock);
>         mutex_init(&node->queue_lock);
>         INIT_LIST_HEAD(&node->ready_queue);
> -       spin_lock_init(&node->ready_lock);
>
>         node->format.type = node->buf_type;
>         pispbe_node_def_fmt(node);
> @@ -1677,6 +1688,8 @@ static int pispbe_probe(struct platform_device *pdev)
>         if (!pispbe)
>                 return -ENOMEM;
>
> +       INIT_LIST_HEAD(&pispbe->job_queue);
> +
>         dev_set_drvdata(&pdev->dev, pispbe);
>         pispbe->dev = &pdev->dev;
>         platform_set_drvdata(pdev, pispbe);
>
> --
> 2.49.0
>

