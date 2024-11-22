Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4229D75E2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 11:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IreAChIhCboUhWgUnBS8JyW9g8B9rfOdoAhrDqUy5Ck=; b=1biRDaKVhJIDUStUzJdgFxEGc9
	GUygWehUaDM+fg+O9YErA0yhvtIzKCzrEntylqMyPHOZ+Lwb2bzLqQAp/WfnwY7yp/DEqduUWWGAJ
	qF9WC5uDuvC8cfzkR5tbPsEY5Kw1On2an9JhW0TO6So6P/IXqHp0hg2hhQpFZ0jvzDhOBTPg7DBqk
	zElTUcdhNt2ZWdeyJdSvlOE4u7r8hAFiy4ux6KdQUs129qDSFAj5MW0qxJ01A04obVDxfOwn0BKlq
	ik9OV88X0gU1Ylmh4tjdTo3z0DWvivxSsy3uqkKwb+Mve5MEKMENDZy9cgaPRJnR4AIHddTH+20fU
	fo+QUcnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tERks-00000002MJs-47Hs;
	Fri, 22 Nov 2024 11:23:18 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tERiO-00000002LnV-3mk1;
	Fri, 22 Nov 2024 11:20:46 +0000
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 524824C9;
	Fri, 22 Nov 2024 12:20:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732274424;
	bh=IRgrCb6NBNtdhKLpJ2c31xozwLFzsO9letozRyoDWbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EL7V0rG55eLDxd2z3URajDlhIhfEpZiPoixLdd3Vl6MN9vGADzG/3TnbEWtB5XEZr
	 lLAHX/8oX5/npsIaSdOvJePCe0A/7AFcuwBGJmr9nrGfMslDbA+9ejPAzAsknZA2n8
	 PJJAQ1TXgxNmc+wHOlYsAVnfldxDPWE49dvjrbfY=
Date: Fri, 22 Nov 2024 12:20:40 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jacopo.mondi@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v1 4/5] drivers: media: bcm2835-unicam: Fix for possible
 dummy buffer overrun
Message-ID: <vnl2px6zcb7pchhfp3k3lngicamsjvidu75sixvubrohqaudlr@h6r54mzr3daz>
References: <20241122084152.1841419-1-naush@raspberrypi.com>
 <20241122084152.1841419-5-naush@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122084152.1841419-5-naush@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_032045_085060_D2F54202 
X-CRM114-Status: GOOD (  22.62  )
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

On Fri, Nov 22, 2024 at 08:41:51AM +0000, Naushir Patuck wrote:
> The Unicam hardware has been observed to cause a buffer overrun when
> using the dummy buffer as a circular buffer. The conditions that cause
> the overrun are not fully known, but it seems to occur when the memory
> bus is heavily loaded.
>
> To avoid the overrun, program the hardware with a buffer size of 0 when
> using the dummy buffer. This will cause overrun into the allocated dummy
> buffer, but avoid out of bounds writes.
>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> ---
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 550eb1b064f1..f10064107d54 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -640,7 +640,14 @@ static inline void unicam_reg_write_field(struct unicam_device *unicam, u32 offs
>  static void unicam_wr_dma_addr(struct unicam_node *node,
>  			       struct unicam_buffer *buf)
>  {
> -	dma_addr_t endaddr = buf->dma_addr + buf->size;
> +	/*
> +	 * Due to a HW bug causing buffer overruns in circular buffer mode under
> +	 * certain (not yet fully known) conditions, the dummy buffer allocation
> +	 * is set to a a single page size, but the hardware gets programmed with
> +	 * a buffer size of 0.
> +	 */
> +	dma_addr_t endaddr = buf->dma_addr +
> +			     (buf != &node->dummy_buf ? buf->size : 0);

So the DMA engine doesn't actually write any data to dummy_buf
anymore ?

Does it still need to be allocated at all ? Or can we simply set the
dma transfer size to 0 ?

>
>  	if (node->id == UNICAM_IMAGE_NODE) {
>  		unicam_reg_write(node->dev, UNICAM_IBSA0, buf->dma_addr);
> --
> 2.34.1
>
>

