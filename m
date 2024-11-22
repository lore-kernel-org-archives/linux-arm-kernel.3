Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16829D75E59
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 14:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9q8yfrrvXs/V3uRVNyMgFUkSvD9wSNclRRO73ma5JQ=; b=J6u8oUco0/J8Cco57DmBUjf1SV
	8UH0a0BAaMqABu+pYyZMizmJQ1DklaJ3vh8XY+FR8nGM8iPwr+rsutYSPnrwp+O4yVJvMcs+TiXkQ
	On1u72nlphNK9uSqECxoWncaOwG9TDLpPwkO0phUh/xf2sPRRhNxpORB2ompkN+877P1nL1nig/XC
	e4St/hsIeOu6uFmCp1dtuj7plvQkmkZGtDHXtSGOQ6L+CpFm+ZyxCULRXYIgdh15uPbTSwrUDzfY6
	s/3/xkJa0Uexkg58pf/6cARPRrZFy/NNfDoYLs1zeZ+GpLy0iBYtbjxa+athIjciOPMo06qk+PgTO
	/aJornOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEUsj-00000002e2a-2WXD;
	Fri, 22 Nov 2024 14:43:37 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEUrl-00000002do2-0G7i;
	Fri, 22 Nov 2024 14:42:38 +0000
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F09A514;
	Fri, 22 Nov 2024 15:42:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732286536;
	bh=yvoAZlYrp2lwBX78QCFhBDDhxQT+PbHSUgM1ZHLXPGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CK3OzqryFp1iax8+Jbzb4kEAapp6Rg2+tYjAOV1za5rdXOekJdTOhZ5OY0Rfr2hba
	 n5aJJuGhXW+KsvsZOBNEsIyoUrrrphhIe9kR0pjy3RGqRyl2OBkdpanLWvBuyAyd2A
	 xy8y4A2pdhcXb+S256DPBZNHdKWCcTaovkd8XBQY=
Date: Fri, 22 Nov 2024 15:42:33 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v1 4/5] drivers: media: bcm2835-unicam: Fix for possible
 dummy buffer overrun
Message-ID: <whyu7ldlgfccyjpx6oqigfuska5nabfp2y6l7zha2unwlvipot@ouwgvjxovisx>
References: <20241122084152.1841419-1-naush@raspberrypi.com>
 <20241122084152.1841419-5-naush@raspberrypi.com>
 <vnl2px6zcb7pchhfp3k3lngicamsjvidu75sixvubrohqaudlr@h6r54mzr3daz>
 <CAEmqJPrfGCB=hKN-+0cG3xFiZxS4BJ_FT=pXnt5U+48wk+A0sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAEmqJPrfGCB=hKN-+0cG3xFiZxS4BJ_FT=pXnt5U+48wk+A0sw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_064237_234875_1E791573 
X-CRM114-Status: GOOD (  29.05  )
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

On Fri, Nov 22, 2024 at 11:35:59AM +0000, Naushir Patuck wrote:
> Hi Jacopo,

Thanks for the explanation

>
> On Fri, 22 Nov 2024 at 11:20, Jacopo Mondi
> <jacopo.mondi@ideasonboard.com> wrote:
> >
> > Hi Naush
> >
> > On Fri, Nov 22, 2024 at 08:41:51AM +0000, Naushir Patuck wrote:
> > > The Unicam hardware has been observed to cause a buffer overrun when
> > > using the dummy buffer as a circular buffer. The conditions that cause
> > > the overrun are not fully known, but it seems to occur when the memory
> > > bus is heavily loaded.
> > >
> > > To avoid the overrun, program the hardware with a buffer size of 0 when
> > > using the dummy buffer. This will cause overrun into the allocated dummy
> > > buffer, but avoid out of bounds writes.
> > >
> > > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> > > ---
> > >  drivers/media/platform/broadcom/bcm2835-unicam.c | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > index 550eb1b064f1..f10064107d54 100644
> > > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > @@ -640,7 +640,14 @@ static inline void unicam_reg_write_field(struct unicam_device *unicam, u32 offs
> > >  static void unicam_wr_dma_addr(struct unicam_node *node,
> > >                              struct unicam_buffer *buf)
> > >  {
> > > -     dma_addr_t endaddr = buf->dma_addr + buf->size;
> > > +     /*
> > > +      * Due to a HW bug causing buffer overruns in circular buffer mode under
> > > +      * certain (not yet fully known) conditions, the dummy buffer allocation
> > > +      * is set to a a single page size, but the hardware gets programmed with
> > > +      * a buffer size of 0.
> > > +      */
> > > +     dma_addr_t endaddr = buf->dma_addr +
> > > +                          (buf != &node->dummy_buf ? buf->size : 0);
> >
> > So the DMA engine doesn't actually write any data to dummy_buf
> > anymore ?
> >
> >
> > Does it still need to be allocated at all ? Or can we simply set the
> > dma transfer size to 0 ?
>
> The DMA engine does still write to the buffer, so the allocation needs
> to occur. The zero size programmed into the register is a quirk of the
> HW itself, and is used to ensure the write wrap correctly in the
> buffer.
>
> Naush
>
> >
> > >
> > >       if (node->id == UNICAM_IMAGE_NODE) {
> > >               unicam_reg_write(node->dev, UNICAM_IBSA0, buf->dma_addr);
> > > --
> > > 2.34.1
> > >
> > >
>

