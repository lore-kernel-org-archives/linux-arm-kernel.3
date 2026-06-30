Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF29C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 21:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9TexMUsTMAbS8it8WaFvlrCqT4rsw90jOJV1JjeB4E=; b=ETL9Bt2LB32y6hWVWo/nXWdhLw
	IdFTD2LMqkvnTqGdeUr27bP75BbWdwwrdB/ayP1d7rQ9+tFYemWz77Idt4LOsiPavUuKca0DwJPz5
	Yjzj4d8P2cvfwD50OhR8zVFmnT1U5iRZ6P6z5etimbEdd7O0okucgi9GN36Ef3FwQDodpRcUERprM
	1Cf5p87tNqFHmbIfis11axkG+rKe3kCydkXOhQLJGvf5wGJnBo9c37BlMMjC7jR8ybj/N/2LxM+jJ
	YcxS8ouGy+//DvraSMqySgiznfxbiXn58ulhVq/Dap3z6sXDCKtQ3jsoYw07W/TPYvgM8AKOCg5/m
	A44eNjqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefZc-00000000D1C-2qwd;
	Tue, 30 Jun 2026 21:00:54 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefZY-00000000CzX-0gqx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 21:00:50 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-8eeadbc5e21so25065616d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 14:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782853246; x=1783458046; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U9TexMUsTMAbS8it8WaFvlrCqT4rsw90jOJV1JjeB4E=;
        b=XQoUc7lbdjlitqkvzMU1MnUWcT6Zymmi/IhLj0nKjYOi3i+7/kqc/2q7RKQl4Q1ovw
         mQba0aMCv2vHZcvPHn3c5pQp0ibHlEySXAvlQREqzq02vDA66WdNoxCtWozigYzw0aNr
         ydVlF0qSDMWnOyCuPUDI+zA2ljm7xVADVJx955GoZRFvmTeUPc6lCkcypMaCWuungSuu
         NCOGvp0LZFezG+UHsn2bSrXg2LlUhB43bL/9U9JlyKcFO9zSwU08jOjRLSjT0NfJJha/
         F5j2DSDvkYH1ijJDnWijboayHhQewjO5CAyyMJaUCzvUvCtHGOJys7LGUD5+32m3YLCO
         hzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782853246; x=1783458046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9TexMUsTMAbS8it8WaFvlrCqT4rsw90jOJV1JjeB4E=;
        b=VCp2jbpaX9VWzvE6HouwzIO0DPP8hq7ttbe9YdvOIVNjz6yHET8N0B7an8m7wM00uz
         T8K4JvlLQKHneDbuQmOqP6g/nN8IXYz1YDQJAX5skSzYitxTlXCZpfvgHYp5mX9lnGDS
         5FrtP5OpiDaqAPq/8ZdUFjS+h1HkK4mgkBf8LwcfKyhyOrtZJTDw8SjhDVrcsvA9AQxh
         SGWxbjzYrdQ3Z27NdmraivYpV6s+vNEoWxz2MiVxi/eLvXnomWR0lBEyN6lMbxY2MhCl
         wVLuEWz+3fXjuUThaPr1bQh6iknb9h5c0IBlUYYlGp2b/2CojisJmas+eybK1rqKSwny
         hMLw==
X-Forwarded-Encrypted: i=1; AFNElJ/KasjdWaFkHwwIkJtJUV8Onigfh+C++njJbOqH4BzPlB7SP+JeWR0GCAIYZRWFpuBlrSqDbYNhUgPiEf7R8Vs4@lists.infradead.org
X-Gm-Message-State: AOJu0YwhBF23W6p90LaQ4IiTEvDgIo1HLigJc999C6oy+LmzDoeFuLS5
	GCVPbB9tavanz8V1E5YP4cp6XkKmSLw71ijCCUdcFbnXxOp/kvu1hMKG
X-Gm-Gg: AfdE7cl9OMP48yNHPIm8A2oGUoG1lGUjEGjT8VEWqEBlsW1fzLKa/ASBGUYXTkWSScl
	B+hACz9wkuGqoSUkLfGvQtm6hGLbB5R5FZRlHThaWDENKQkxV0GLQFQUJHrtTTmxCt9Rx/h4odr
	EiOS6lPdcYyDh8FUHFMMxXGlliVIclHI1bJ5UXCIbMU9IGx7aCgADQvNJyRHH3NAJVuYS//PXq6
	DHizxsSASNwQ7KrQFUJ4u2PgqFKMhWeQJxRrjBAocKxvcZJLvCfcQQpTJwxBJLHITTgW3FbrvJw
	fXoMHAi3cbgbWA1Q2RHq2A27SaD7qEYEUcd+N9tkQT23V7xiuQfCenFp3IMMxqPbOcoUso4N2wY
	FxgHXUyWdu1+Ng92gM9BQf0RcsPQMMkBIm9s1G5g+KEXZCC5istGLmxawmww5yXppYoZf5YsRN2
	kwUlX799qz+Pe+bw==
X-Received: by 2002:a05:620a:4805:b0:92a:a400:df70 with SMTP id af79cd13be357-92e62673174mr898729285a.47.1782853245056;
        Tue, 30 Jun 2026 14:00:45 -0700 (PDT)
Received: from b82beb281c41 ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e6218fa27sm327885585a.16.2026.06.30.14.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:00:44 -0700 (PDT)
Date: Tue, 30 Jun 2026 21:00:41 +0000
From: Yuanshen Cao <alex.caoys@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: conor+dt@kernel.org, mripard@kernel.org, krzk+dt@kernel.org,
	robh@kernel.org, samuel@sholland.org, wens@kernel.org,
	jernej.skrabec@gmail.com, Frank.Li@kernel.org, vkoul@kernel.org,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/5] dmaengine: sun6i-dma: Refactor to support A733
 interrupt and register handling
Message-ID: <akQuefaUpt6OPNSo@b82beb281c41>
References: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
 <20260622-sun60i-a733-dma-v3-1-f697ef296cbc@gmail.com>
 <20260629003505.18f0053d@ryzen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629003505.18f0053d@ryzen.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_140048_728945_EAE95E7D 
X-CRM114-Status: GOOD (  48.84  )
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

On Mon, Jun 29, 2026 at 12:35:05AM +0200, Andre Przywara wrote:
> On Mon, 22 Jun 2026 01:36:23 +0000
> Yuanshen Cao <alex.caoys@gmail.com> wrote:
> 
> Hi,
> 
> first, many thanks for sending this, also for structuring the changes
> nicely, so that they remain reviewable!
> 
> > Refactor to support the Allwinner A733 DMA controller. Currently, the
> > `sun6i-dma` driver has several functions related to interrupt handling
> > (reading/writing interrupt enable and status registers) and register
> > dumping that are hardcoded.
> > 
> > To support the A733, which has different register layouts and interrupt
> > handling logic, these functions are being moved into the
> > `sun6i_dma_config` structure as function pointers.
> 
> So I see that this driver already makes use of per-device function
> pointer, though personally I don't like this approach very much, as it
> decreases the readability, and suggests significant differences between
> the SoC generations that are not really there: each function just reads
> or write an MMIO register, it's just the offset that differs.

Yes, I considered to do this but since the original mainline code and
BSP code all use function-pointer so I impelement this the same way.

> 
> So I think it's better to express the differences through data
> entries in the config struct, for the IRQ enable/stat functions I think
> this should be something like this:
> 
> struct sun6i_dma_config {
> 	...
> 	u32	irq_stride;
> 	u32	irq_en_offset;
> 	u32	irq_stat_offset;
> 	...
> };
> 
> -	irq_val = readl(sdev->base + DMA_IRQ_EN(irq_reg));
> +	irq_val = readl(sdev->base + sdev->cfg->irq_en_offset + irq_reg * sdev->cfg->irq_stride);
> 
> the existing configs set .stride to 0x04, and .en_offset to 0x0, the
> A733 later uses .stride = 0x40 and .en_offset = 0x134.
> Maybe we still move that now longish line into a helper function, but
> not a config specific one. 
> 
> I think that's more readable, and avoids unnecessary redirections and
> potential pipeline stalls.
> 
> dump_com_regs is a different story, since the two instances of that
> function are significantly different.
> 
> What do you think?

I am okay to change this one but should we do the same for the other
function pointers as well? Just to keep them aligned. Let me know what
do you think.

> > This allows the
> > driver to use a polymorphic approach where the specific implementation
> > is determined by the hardware configuration assigned during device
> > probing.
> > 
> > Changes:
> > - Added function pointers to `struct sun6i_dma_config` for:
> 
> By the way: the preferred style to list changes in commit messages in
> imperative mood [1], not in past tense. Think about you ask the
> code base what to change:
> 
> Add function pointers to ...
> Implement generic functions ...

Thanks for the advice! I'll make sure to follow them in the future.

Best,
Alex

> Cheers,
> Andre
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n94
> 
> >     - `dump_com_regs`
> >     - `read_irq_en`
> >     - `write_irq_en`
> >     - `read_irq_stat`
> >     - `write_irq_stat`
> > - Implemented generic `sun6i_read/write_irq_*` functions for existing
> >   hardware.
> > - Added a macro and updated existing `sun6i_dma_config` instances (A31,
> >   A23, H3, A64, A100, H6, V3S) to use these new function pointers.
> > 
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
> > ---
> >  drivers/dma/sun6i-dma.c | 50 ++++++++++++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 45 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> > index a9a254dbf8cb..ef3052c4ab36 100644
> > --- a/drivers/dma/sun6i-dma.c
> > +++ b/drivers/dma/sun6i-dma.c
> > @@ -138,6 +138,11 @@ struct sun6i_dma_config {
> >  	void (*set_burst_length)(u32 *p_cfg, s8 src_burst, s8 dst_burst);
> >  	void (*set_drq)(u32 *p_cfg, s8 src_drq, s8 dst_drq);
> >  	void (*set_mode)(u32 *p_cfg, s8 src_mode, s8 dst_mode);
> > +	void (*dump_com_regs)(struct sun6i_dma_dev *sdev);
> > +	u32 (*read_irq_en)(struct sun6i_dma_dev *sdev, u32 irq_reg);
> > +	void (*write_irq_en)(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 irq_val);
> > +	u32 (*read_irq_stat)(struct sun6i_dma_dev *sdev, u32 irq_reg);
> > +	void (*write_irq_stat)(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 status);
> >  	u32 src_burst_lengths;
> >  	u32 dst_burst_lengths;
> >  	u32 src_addr_widths;
> > @@ -347,6 +352,26 @@ static void sun6i_set_mode_h6(u32 *p_cfg, s8 src_mode, s8 dst_mode)
> >  		  DMA_CHAN_CFG_DST_MODE_H6(dst_mode);
> >  }
> >  
> > +static u32 sun6i_read_irq_en(struct sun6i_dma_dev *sdev, u32 irq_reg)
> > +{
> > +	return readl(sdev->base + DMA_IRQ_EN(irq_reg));
> > +}
> > +
> > +static void sun6i_write_irq_en(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 irq_val)
> > +{
> > +	writel(irq_val, sdev->base + DMA_IRQ_EN(irq_reg));
> > +}
> > +
> > +static u32 sun6i_read_irq_stat(struct sun6i_dma_dev *sdev, u32 irq_reg)
> > +{
> > +	return readl(sdev->base + DMA_IRQ_STAT(irq_reg));
> > +}
> > +
> > +static void sun6i_write_irq_stat(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 status)
> > +{
> > +	writel(status, sdev->base + DMA_IRQ_STAT(irq_reg));
> > +}
> > +
> >  static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
> >  {
> >  	struct sun6i_desc *txd = pchan->desc;
> > @@ -460,16 +485,16 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
> >  
> >  	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
> >  
> > -	irq_val = readl(sdev->base + DMA_IRQ_EN(irq_reg));
> > +	irq_val = sdev->cfg->read_irq_en(sdev, irq_reg);
> >  	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
> >  			(irq_offset * DMA_IRQ_CHAN_WIDTH));
> >  	irq_val |= vchan->irq_type << (irq_offset * DMA_IRQ_CHAN_WIDTH);
> > -	writel(irq_val, sdev->base + DMA_IRQ_EN(irq_reg));
> > +	sdev->cfg->write_irq_en(sdev, irq_reg, irq_val);
> >  
> >  	writel(pchan->desc->p_lli, pchan->base + DMA_CHAN_LLI_ADDR);
> >  	writel(DMA_CHAN_ENABLE_START, pchan->base + DMA_CHAN_ENABLE);
> >  
> > -	sun6i_dma_dump_com_regs(sdev);
> > +	sdev->cfg->dump_com_regs(sdev);
> >  	sun6i_dma_dump_chan_regs(sdev, pchan);
> >  
> >  	return 0;
> > @@ -549,14 +574,14 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
> >  	u32 status;
> >  
> >  	for (i = 0; i < sdev->num_pchans / DMA_IRQ_CHAN_NR; i++) {
> > -		status = readl(sdev->base + DMA_IRQ_STAT(i));
> > +		status = sdev->cfg->read_irq_stat(sdev, i);
> >  		if (!status)
> >  			continue;
> >  
> >  		dev_dbg(sdev->slave.dev, "DMA irq status %s: 0x%x\n",
> >  			str_high_low(i), status);
> >  
> > -		writel(status, sdev->base + DMA_IRQ_STAT(i));
> > +		sdev->cfg->write_irq_stat(sdev, i, status);
> >  
> >  		for (j = 0; (j < DMA_IRQ_CHAN_NR) && status; j++) {
> >  			pchan = sdev->pchans + j;
> > @@ -1101,6 +1126,13 @@ static inline void sun6i_dma_free(struct sun6i_dma_dev *sdev)
> >  	}
> >  }
> >  
> > +#define SUN6I_DMA_IRQ_A31_COMMON_OPS	\
> > +	.dump_com_regs    = sun6i_dma_dump_com_regs,	\
> > +	.read_irq_en      = sun6i_read_irq_en,	\
> > +	.write_irq_en     = sun6i_write_irq_en,	\
> > +	.read_irq_stat    = sun6i_read_irq_stat,	\
> > +	.write_irq_stat   = sun6i_write_irq_stat,
> > +
> >  /*
> >   * For A31:
> >   *
> > @@ -1132,6 +1164,7 @@ static struct sun6i_dma_config sun6i_a31_dma_cfg = {
> >  	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
> >  			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
> >  			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
> > +	SUN6I_DMA_IRQ_A31_COMMON_OPS
> >  };
> >  
> >  /*
> > @@ -1155,6 +1188,7 @@ static struct sun6i_dma_config sun8i_a23_dma_cfg = {
> >  	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
> >  			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
> >  			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
> > +	SUN6I_DMA_IRQ_A31_COMMON_OPS
> >  };
> >  
> >  static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
> > @@ -1173,6 +1207,7 @@ static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
> >  	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
> >  			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
> >  			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
> > +	SUN6I_DMA_IRQ_A31_COMMON_OPS
> >  };
> >  
> >  /*
> > @@ -1200,6 +1235,7 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg = {
> >  			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
> >  			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
> >  			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
> > +	SUN6I_DMA_IRQ_A31_COMMON_OPS
> >  };
> >  
> >  /*
> > @@ -1221,6 +1257,7 @@ static struct sun6i_dma_config sun50i_a64_dma_cfg = {
> >  			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
> >  			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
> >  			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
> > +	SUN6I_DMA_IRQ_A31_COMMON_OPS
> >  };
> >  
> >  /*
> > @@ -1244,6 +1281,7 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
> >  			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
> >  	.has_high_addr = true,
> >  	.has_mbus_clk = true,
> > +	SUN6I_DMA_IRQ_A31_COMMON_OPS
> >  };
> >  
> >  /*
> > @@ -1266,6 +1304,7 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
> >  			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
> >  			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
> >  	.has_mbus_clk = true,
> > +	SUN6I_DMA_IRQ_A31_COMMON_OPS
> >  };
> >  
> >  /*
> > @@ -1289,6 +1328,7 @@ static struct sun6i_dma_config sun8i_v3s_dma_cfg = {
> >  	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
> >  			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
> >  			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
> > +	SUN6I_DMA_IRQ_A31_COMMON_OPS
> >  };
> >  
> >  static const struct of_device_id sun6i_dma_match[] = {
> > 
> 

