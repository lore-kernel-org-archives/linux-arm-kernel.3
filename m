Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B474C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 12:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/b5rf3oXvJbp5RjgoEAox/zVVtLJhtfIVF0t4VBCTk=; b=hRURQwwXLylXXjwdmJ0ZNLJl6Q
	cezHbbVDhURxFOnqZeHoy4xSIIXdpZ4bdKbleOpTzNKzk35QDfVbpSbcGkPQm+ZVSANQpiDY6ZInA
	h+ssq44RF7PYBlCXFXO7eVN0YQDLOrw6rTrPMQoNDrKGIKcJ4auN+2vnYQdyQ05RYuII6Lj++qtcf
	sJ4gQKLq/Lqbz8A82MDzzk68kaA3LXprD43Tti7t2mCiRgqN8Cx4011aX/tjgUkbExOJNyC9BWJA+
	3suSWBUCaW4PGR/ulT79ulmAB/UOkdrqDi/3MTix8uAddk8QmdZNxqXOZGH+8GX6I6ME/HERsaKgT
	HVd3PIxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNWMd-00000000G9S-3PFQ;
	Fri, 06 Jun 2025 12:40:03 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNWH0-00000000FSz-1w6z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 12:34:15 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00E1811DD;
	Fri,  6 Jun 2025 14:34:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749213247;
	bh=KUB1zHF41EieIHY6D7XrX8haH8SMgp958TtlLmEVyME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iYmgYv6/bkOqUY27LwbLH8YpzTftPCEyojGssCbFJDNzi/e7NTTfKskNvC6JTRalL
	 weTLpS/8iDMAjVRE9f4JNBoBaRviTxp+dQ7r2//TfTQYSbQpKveA36ua5KsYHRFkoe
	 Jp4lyDEB7i1raRFKlZvqzbOwFywnH6ytawPeQg9k=
Date: Fri, 6 Jun 2025 15:34:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: kieran.bingham@ideasonboard.com, rmfrfs@gmail.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: platform: Refactor interrupt status registers
Message-ID: <20250606123400.GB27510@pendragon.ideasonboard.com>
References: <20250606121403.498153-1-isaac.scott@ideasonboard.com>
 <20250606121403.498153-2-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250606121403.498153-2-isaac.scott@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_053414_642435_73933BDB 
X-CRM114-Status: GOOD (  22.94  )
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

Hi Isaac,

Thank you for the patch.

On Fri, Jun 06, 2025 at 01:14:02PM +0100, Isaac Scott wrote:
> The NXP i.MX 8 MP CSI-2 receiver features multiple interrupt and debug
> status sources which span multiple registers. The driver currently
> supports two interrupt source registers, and attributes the
> mipi_csis_event event entries to those registers through a boolean debug
> field that indicate if the event relates to the main interrupt status
> (false) or debug interrupt status (true) register. To make it easier to
> add new event fields, replace the debug bool with a 'status index'
> integer than indicates the index of the corresponding status register.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 64 +++++++++++-----------
>  1 file changed, 31 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index d060eadebc7a..bbc549c22aff 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -249,7 +249,7 @@
>  #define MIPI_CSI2_DATA_TYPE_USER(x)		(0x30 + (x))
>  
>  struct mipi_csis_event {
> -	bool debug;
> +	unsigned int status_index;
>  	u32 mask;
>  	const char * const name;
>  	unsigned int counter;
> @@ -257,30 +257,30 @@ struct mipi_csis_event {
>  
>  static const struct mipi_csis_event mipi_csis_events[] = {
>  	/* Errors */
> -	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,	"Wrong Configuration Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_CRC,		"CRC Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,	"Data Type Ignored" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,	"Early Frame End" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,	"Early Frame Start" },
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,		"Wrong Configuration Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_ECC,			"ECC Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_CRC,			"CRC Error"},
> +	{ 0, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,		"Data Type Ignored"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,		"Early Frame End"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,		"Early Frame Start"},
>  	/* Non-image data receive events */
> -	{ false, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even frame" },
> -	{ false, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even frame" },
> -	{ false, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd frame" },
> -	{ false, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame" },
> +	{ 0, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even frame"},
> +	{ 0, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even frame"},
> +	{ 0, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd frame"},
> +	{ 0, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame"},
>  	/* Frame start/end */
> -	{ false, MIPI_CSIS_INT_SRC_FRAME_START,		"Frame Start" },
> -	{ false, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC Falling Edge" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC Rising Edge" },
> +	{ 0, MIPI_CSIS_INT_SRC_FRAME_START,		"Frame Start"},
> +	{ 0, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC Falling Edge"},
> +	{ 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC Rising Edge"},
>  };
>  
>  #define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
> @@ -765,32 +765,30 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
>  	struct mipi_csis_device *csis = dev_id;
>  	unsigned long flags;
>  	unsigned int i;
> -	u32 status;
> -	u32 dbg_status;
> +	u32 status[2];
>  
> -	status = mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
> -	dbg_status = mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
> +	status[0] = mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
> +	status[1] = mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
>  
>  	spin_lock_irqsave(&csis->slock, flags);
>  
>  	/* Update the event/error counters */
> -	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable) {
> +	if ((status[0] & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable) {
>  		for (i = 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
>  			struct mipi_csis_event *event = &csis->events[i];
>  
> -			if ((!event->debug && (status & event->mask)) ||
> -			    (event->debug && (dbg_status & event->mask)))
> +			if (status[event->status_index] & event->mask)
>  				event->counter++;
>  		}
>  	}
>  
> -	if (status & MIPI_CSIS_INT_SRC_FRAME_START)
> +	if (status[0] & MIPI_CSIS_INT_SRC_FRAME_START)
>  		mipi_csis_queue_event_sof(csis);
>  
>  	spin_unlock_irqrestore(&csis->slock, flags);
>  
> -	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status);
> -	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC, dbg_status);
> +	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status[0]);
> +	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC, status[1]);
>  
>  	return IRQ_HANDLED;
>  }

-- 
Regards,

Laurent Pinchart

