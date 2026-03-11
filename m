Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEB91062894
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 12:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCpv2B481p5tXJx5vm72pzJA7/wNwbYDhrgNk/JD+bU=; b=FF0X2oasQE1MTQqtVrvqa33y36
	44Gy2wwcisvgqcHx+GdcJS0xxtMOMA9CS68BoU7Tr0wRg+uXXp3xt0lKCwhd8v97UunMsbNHgky7l
	2fTzClwW5gwJaA7H69rXx7Khv/esUL7URuwnpo4DVLdmwINHb6yxvcs0TL2X9wMBZ2HE2aZOvvNg0
	IFMmThyLZGysh+ksGMVjwJayHawH4TwsNBkMe4oetNJC/kA6VOtz8QZNo2X7A3X/0wLPkxEC+6+hU
	RRHSJ35+Xt74BDxfMroMgNYaw2KXIWgaDeTq67lAOBa43e8pUuwpvMBMNjgurvU4s5KbzORRup+7F
	C4p8a0bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Iwp-0000000BaDL-01Ma;
	Wed, 11 Mar 2026 12:45:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Iwm-0000000BaCx-2vBC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 12:45:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 519B044375;
	Wed, 11 Mar 2026 12:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6760C4CEF7;
	Wed, 11 Mar 2026 12:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773233156;
	bh=p5s6LmiZUsNIQywTKWkHbQraxneuuNSzrESbFlm5lxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EIvv5lepipQPW10zdemikIqrwuUfcRR2QVowZqwFW/ZMs8Vk8zbtQOHn+AEYgh++Z
	 LenwsZII7WsgyInyJ0Fx3KydhVgM2Piwy/FAhRLI5Ha+CpuKojEhkrzgKy+9RsoeG1
	 aK57CJaJsW/ALaXAvG4Fki6KUN9EAQmPimqZra/gUOXkT3CkfKsKCejdp98VUGfsAN
	 SAkQ0ZX9PP2GBVNlM8c90pgKjgyOxjyv36dyQjnAY0oDjoPoqOUjjdcJlVWrJgqKq7
	 nEIfwuUerD9oTl5p7gL5uLuAWZ7qJPf1IHvD/oW8IoZQyMvRKy/hXEoGJn5kCeIqDD
	 Dh0CYmLG/rnNw==
Date: Wed, 11 Mar 2026 18:15:03 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, brgl@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v12 02/12] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
Message-ID: <iimeqofy4fzr4pqtda7sayt5hbbmdldopmcyxagve44dbapnla@ruzqqx6lntkz>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
 <20260310-qcom-qce-cmd-descr-v12-2-398f37f26ef0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-2-398f37f26ef0@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_054556_776570_9173F39C 
X-CRM114-Status: GOOD (  26.55  )
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

On Tue, Mar 10, 2026 at 04:44:16PM +0100, Bartosz Golaszewski wrote:
> BH workqueues are a modern mechanism, aiming to replace legacy tasklets.
> Let's convert the BAM DMA driver to using the high-priority variant of
> the BH workqueue.
> 
> [Vinod: suggested using the BG workqueue instead of the regular one
> running in process context]
> 
> Suggested-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/dma/qcom/bam_dma.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 19116295f8325767a0d97a7848077885b118241c..c8601bac555edf1bb4384fd39cb3449ec6e86334 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -42,6 +42,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
> +#include <linux/workqueue.h>
>  
>  #include "../dmaengine.h"
>  #include "../virt-dma.h"
> @@ -397,8 +398,8 @@ struct bam_device {
>  	struct clk *bamclk;
>  	int irq;
>  
> -	/* dma start transaction tasklet */
> -	struct tasklet_struct task;
> +	/* dma start transaction workqueue */
> +	struct work_struct work;
>  };
>  
>  /**
> @@ -863,7 +864,7 @@ static u32 process_channel_irqs(struct bam_device *bdev)
>  			/*
>  			 * if complete, process cookie. Otherwise
>  			 * push back to front of desc_issued so that
> -			 * it gets restarted by the tasklet
> +			 * it gets restarted by the work queue.
>  			 */
>  			if (!async_desc->num_desc) {
>  				vchan_cookie_complete(&async_desc->vd);
> @@ -893,9 +894,9 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
>  
>  	srcs |= process_channel_irqs(bdev);
>  
> -	/* kick off tasklet to start next dma transfer */
> +	/* kick off the work queue to start next dma transfer */
>  	if (srcs & P_IRQ)
> -		tasklet_schedule(&bdev->task);
> +		queue_work(system_bh_highpri_wq, &bdev->work);
>  
>  	ret = pm_runtime_get_sync(bdev->dev);
>  	if (ret < 0)
> @@ -1091,14 +1092,14 @@ static void bam_start_dma(struct bam_chan *bchan)
>  }
>  
>  /**
> - * dma_tasklet - DMA IRQ tasklet
> - * @t: tasklet argument (bam controller structure)
> + * bam_dma_work() - DMA interrupt work queue callback
> + * @work: work queue struct embedded in the BAM controller device struct
>   *
>   * Sets up next DMA operation and then processes all completed transactions
>   */
> -static void dma_tasklet(struct tasklet_struct *t)
> +static void bam_dma_work(struct work_struct *work)
>  {
> -	struct bam_device *bdev = from_tasklet(bdev, t, task);
> +	struct bam_device *bdev = from_work(bdev, work, work);
>  	struct bam_chan *bchan;
>  	unsigned int i;
>  
> @@ -1111,14 +1112,13 @@ static void dma_tasklet(struct tasklet_struct *t)
>  		if (!list_empty(&bchan->vc.desc_issued) && !IS_BUSY(bchan))
>  			bam_start_dma(bchan);
>  	}
> -
>  }
>  
>  /**
>   * bam_issue_pending - starts pending transactions
>   * @chan: dma channel
>   *
> - * Calls tasklet directly which in turn starts any pending transactions
> + * Calls work queue directly which in turn starts any pending transactions
>   */
>  static void bam_issue_pending(struct dma_chan *chan)
>  {
> @@ -1286,14 +1286,14 @@ static int bam_dma_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_disable_clk;
>  
> -	tasklet_setup(&bdev->task, dma_tasklet);
> +	INIT_WORK(&bdev->work, bam_dma_work);
>  
>  	bdev->channels = devm_kcalloc(bdev->dev, bdev->num_channels,
>  				sizeof(*bdev->channels), GFP_KERNEL);
>  
>  	if (!bdev->channels) {
>  		ret = -ENOMEM;
> -		goto err_tasklet_kill;
> +		goto err_workqueue_cancel;
>  	}
>  
>  	/* allocate and initialize channels */
> @@ -1358,8 +1358,8 @@ static int bam_dma_probe(struct platform_device *pdev)
>  err_bam_channel_exit:
>  	for (i = 0; i < bdev->num_channels; i++)
>  		tasklet_kill(&bdev->channels[i].vc.task);
> -err_tasklet_kill:
> -	tasklet_kill(&bdev->task);
> +err_workqueue_cancel:
> +	cancel_work_sync(&bdev->work);
>  err_disable_clk:
>  	clk_disable_unprepare(bdev->bamclk);
>  
> @@ -1393,7 +1393,7 @@ static void bam_dma_remove(struct platform_device *pdev)
>  			    bdev->channels[i].fifo_phys);
>  	}
>  
> -	tasklet_kill(&bdev->task);
> +	cancel_work_sync(&bdev->work);
>  
>  	clk_disable_unprepare(bdev->bamclk);
>  }
> 
> -- 
> 2.47.3
> 

-- 
மணிவண்ணன் சதாசிவம்

