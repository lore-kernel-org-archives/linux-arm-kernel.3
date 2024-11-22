Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E684D75E59
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 14:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBPjOUvvmxe0f7XWXE6B6R/O4RyErRG5Mh3Jvasn+Bo=; b=RNmUxdJsVQMLtEeB+NOnpltHkH
	la9GsdbedhAPAocoGDKg0O9GaJIXa7Exhe/WLoptjU6fkhqwHb7QjlqXiRtoJ0YwlHH4XaTO5H/Rb
	c0wCQG3teRT4AMYKvsRH/Rd21isN2ew1RTldUUlEyK4+9jiwait+vPfcA1W5JIfvNh13Wbk/6kUhS
	eZNhVyBlLwI423xwsIosIFxfB72GzvThOX502nX+nF4Jq9z/+BUCt08xsqO5Rkv2FLmCbEdXsisVY
	snFlxI6loyiGb71LqQZziDdvkEZytJe8cSX4KoQ0gYYOu0dCIN/YSvIrcm9t46BkNFABH6gk6B00A
	CFzTF4tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEUvy-00000002emj-1FMF;
	Fri, 22 Nov 2024 14:46:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEUv1-00000002eVW-0krK;
	Fri, 22 Nov 2024 14:46:00 +0000
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 852DB514;
	Fri, 22 Nov 2024 15:45:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732286738;
	bh=7Ay/3r+wW0JDRN5wnHDl+VfBwqOAMEjjkxIuQW5QdEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tn58/XiYKHc2bN3o5vJLZbbYGiGYg6GTxEPKhNaf63ycPKV3N6CiVULhi5dvmQaKQ
	 lq6VAp0MKLn/yB0NelV2MaP6ZJ4GnLY4QvzJv0J10bFbDoM2TBLF5BGdj3F2ei3v1j
	 AGq47shVfRQS4ChCYQ9fPASgUE2Sh/sLZhJWBgBs=
Date: Fri, 22 Nov 2024 15:45:55 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jacopo.mondi@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v1 1/5] drivers: media: bcm2835-unicam: Improve frame
 sequence count handling
Message-ID: <gl7qb2rqmqzd6tw7pei3ldbu6m4l3qiwld3ddhvn4pemdpgfjz@bvaf5prvmz3c>
References: <20241122084152.1841419-1-naush@raspberrypi.com>
 <20241122084152.1841419-2-naush@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122084152.1841419-2-naush@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_064559_358133_C3674089 
X-CRM114-Status: GOOD (  24.66  )
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

Hi Naush

On Fri, Nov 22, 2024 at 08:41:48AM +0000, Naushir Patuck wrote:
> Ensure that the frame sequence counter is incremented only if a previous
> frame start interrupt has occurred, or a frame start + frame end has
> occurred simultaneously.
>
> This corresponds the sequence number with the actual number of frames
> produced by the sensor, not the number of frame buffers dequeued back
> to userland.
>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>


Thanks, looks good to me
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  .../media/platform/broadcom/bcm2835-unicam.c  | 22 +++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 3aed0e493c81..36fb186a0421 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -199,6 +199,7 @@ struct unicam_device {
>  	/* subdevice async notifier */
>  	struct v4l2_async_notifier notifier;
>  	unsigned int sequence;
> +	bool frame_started;
>
>  	/* Sensor node */
>  	struct {
> @@ -742,6 +743,8 @@ static irqreturn_t unicam_isr(int irq, void *dev)
>  	 * buffer forever.
>  	 */
>  	if (fe) {
> +		bool inc_seq = unicam->frame_started;
> +
>  		/*
>  		 * Ensure we have swapped buffers already as we can't
>  		 * stop the peripheral. If no buffer is available, use a
> @@ -761,11 +764,24 @@ static irqreturn_t unicam_isr(int irq, void *dev)
>  			 * + FS + LS). In this case, we cannot signal the buffer
>  			 * as complete, as the HW will reuse that buffer.
>  			 */
> -			if (node->cur_frm && node->cur_frm != node->next_frm)
> +			if (node->cur_frm && node->cur_frm != node->next_frm) {
>  				unicam_process_buffer_complete(node, sequence);
> +				inc_seq = true;
> +			}
>  			node->cur_frm = node->next_frm;
>  		}
> -		unicam->sequence++;
> +
> +		/*
> +		 * Increment the sequence number conditionally on either a FS
> +		 * having already occurred, or in the FE + FS condition as
> +		 * caught in the FE handler above. This ensures the sequence
> +		 * number corresponds to the frames generated by the sensor, not
> +		 * the frames dequeued to userland.
> +		 */
> +		if (inc_seq) {
> +			unicam->sequence++;
> +			unicam->frame_started = false;
> +		}
>  	}
>
>  	if (ista & UNICAM_FSI) {
> @@ -795,6 +811,7 @@ static irqreturn_t unicam_isr(int irq, void *dev)
>  		}
>
>  		unicam_queue_event_sof(unicam);
> +		unicam->frame_started = true;
>  	}
>
>  	/*
> @@ -1413,6 +1430,7 @@ static int unicam_sd_enable_streams(struct v4l2_subdev *sd,
>  		if (unicam->pipe.nodes & BIT(UNICAM_METADATA_NODE))
>  			unicam_start_metadata(unicam);
>
> +		unicam->frame_started = false;
>  		unicam_start_rx(unicam, state);
>  	}
>
> --
> 2.34.1
>
>

