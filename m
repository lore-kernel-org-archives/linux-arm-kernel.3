Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA0DC55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 15:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fh2zs7i8R+UCH1rMZtxlM71vkHJMz8nMYVeCu0VPVsQ=; b=Pa6HJVQFRbkJ3q6zbH0dyFR9WQ
	f1RTF4Wi9dpbvajpoQ9HHpK5wPPA1GSnN/J+6h0ymtwOvaTa86cRDvXJ/In++xc88QW6hN6qZ/bgH
	Mq38mvImYXXB4LhPbbkLbR5CYOwVaTvg5Lzl2MGDnt3HsLZi3w5mBG9uvcFTfOtEZei/6Ue1jd9Ta
	tjOceZjeFYSuU1aIi53y2cVNmwYoMZUlhqEdy2k+uB+fbYPy0wL77mJ6qQYA7swvVZ7jtuS94IBp9
	DYfqwtj4+9/2zsj8mBI0l6UsmCI4/t/hUQw0D0Y5leYrzkOozyehdW4g9Heegp3Yh8bbv0kRAiQFj
	xYwNWWLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqYQc-0000000Fo0b-3m5Q;
	Sun, 02 Aug 2026 15:48:42 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqYQb-0000000Fo08-03a7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 15:48:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785685721; x=1817221721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bGrOQ+CY7EkKESDzSdb+8OxxFKFT0DD6Txi0F3XW9x0=;
  b=WAf5YOyzgDVZf/+xY5QabfQhFz4p3gqrXUVaXoAGjmufp2G7HgLwOuN2
   8fsEGJsDUFgimoyboRI3iDNnyva2C+oDr7DCbpzWVrF8UuxCiBqxpGENs
   px4aM6tQ0xbsF2rCZ3mcf/NwAbYHz7JX5bwJJMMQg1bb+6k499BOWiUhL
   ToUv070cczENREvfGJ3wZ9tiIIbr7EG0TMB/DS7wdwz2BgjFu9Gd802LN
   YJQOVh3uxXTd6w2kIqxCZgQVHBDlOHY1dM/hjlADnAdqXV89Fiim67thT
   eYfFp2VSmjfApI/7zfexX8LVRSEIWQ5cgmBdcm+L4jTMT7uI9GYUgyzCq
   Q==;
X-CSE-ConnectionGUID: 2nESATugRGSvSwJ758upkg==
X-CSE-MsgGUID: KUic5k4BTiCRxVHvemwL9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="86442138"
X-IronPort-AV: E=Sophos;i="6.25,200,1779174000"; 
   d="scan'208";a="86442138"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 08:48:37 -0700
X-CSE-ConnectionGUID: i31RhG3aR4mFVqtIDOP2bw==
X-CSE-MsgGUID: 7rPvqHDCSs6Sk392WM6cgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,200,1779174000"; 
   d="scan'208";a="261064494"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa007.jf.intel.com with ESMTP; 02 Aug 2026 08:48:35 -0700
Date: Sun, 2 Aug 2026 23:48:34 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Heiko Schocher <hs@nabladev.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
	Xu Yilun <yilun.xu@intel.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3] driver: fpga: xilinx-selectmap: add csi and rdwr
 support
Message-ID: <am9m0pGSUYKaRRDI@yilunxu-OptiPlex-7050>
References: <20260727052218.4079979-1-hs@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727052218.4079979-1-hs@nabladev.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_084841_143313_3ADAC0AF 
X-CRM114-Status: GOOD (  38.00  )
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

On Mon, Jul 27, 2026 at 07:22:10AM +0200, Heiko Schocher wrote:
> The current driver requests the optional CSI_B and RDWR_B GPIOs but
> only configures their initial output state and never changes them
> afterwards. As a result, CSI_B and RDWR_B remain inactive throughout
> the configuration process.

Then how the existing configuration process work if the control signals
are always *INACTIVE*?

> 
> This may work on systems with a single FPGA where these signals do not
> need to be controlled by software,

Is this always the case today? Then why does the existing driver bother
doing the devm_gpiod_get_optional()?

> but it does not support systems
> with multiple FPGAs sharing a SelectMAP interface.
> 
> On systems with multiple FPGAs sharing the same SelectMAP data bus,
> the driver must actively control these signals during configuration.
> 
> CSI_B (Chip Select, active low) selects the target FPGA. It is asserted
> before configuration data is transferred and deasserted afterwards so
> that only the intended device responds to bus transactions.

I still don't understand, only one Chip Select pin defined for each
selectmap device, how could it select between multiple FPGAs?

> 
> RDWR_B (Read/Write, active low) controls the transfer direction on the
> SelectMAP interface. A low level selects write cycles, while a high
> level selects read cycles. During FPGA configuration the driver drives
> RDWR_B low before transferring the bitstream and restores it to its
> reading (high state) afterwards.
> 
> Store the optional GPIO descriptors and toggle both signals around the
> configuration data transfer, allowing multiple FPGAs to safely share a
> single SelectMAP interface.
> 
> Tested on an AM625 based board with two Xilinx FPGAs connected to the
> GPMC bus.

What is GPMC bus, anything to do with "SelectMAP data bus"?

> 
> Signed-off-by: Heiko Schocher <hs@nabladev.com>
> ---
> 
> Changes in v3:
> - use 0 (deasserted state) and 1 (asserted state) in gpio_set_value()
>   as commented from Micahl
> - rewrite commit message as requested from Xu Yilun
>   - describe what rdwr_b and csi_b do, and why this change is needed
>     for more than one FPGA.
> - add comment before asserting the signals, why they are asserted
>   in this order.
> 
> Changes in v2:
> - add comments from Michal
>   - skip check if gpio descriptor variables csi_b/rdwr_b are valid,
>     as validate_desc() checks this in gpiod_set_value() call.
>   - initialize the gpio variables csi_b/rdwr_b immediately with
>     the return value from devm_gpiod_get_optional(), so we can
>     drop local gpio variable at all
> 
>  drivers/fpga/xilinx-selectmap.c | 32 +++++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/fpga/xilinx-selectmap.c b/drivers/fpga/xilinx-selectmap.c
> index d0cbb5fdfe3a..35078206a3a3 100644
> --- a/drivers/fpga/xilinx-selectmap.c
> +++ b/drivers/fpga/xilinx-selectmap.c
> @@ -19,6 +19,8 @@
>  struct xilinx_selectmap_conf {
>  	struct xilinx_fpga_core core;
>  	void __iomem *base;
> +	struct gpio_desc *csi_b;
> +	struct gpio_desc *rdwr_b;
>  };
>  
>  #define to_xilinx_selectmap_conf(obj) \
> @@ -30,16 +32,30 @@ static int xilinx_selectmap_write(struct xilinx_fpga_core *core,
>  	struct xilinx_selectmap_conf *conf = to_xilinx_selectmap_conf(core);
>  	size_t i;
>  
> +	/*
> +	 * Assert CSI_B and select write mode.
> +	 *
> +	 * UG570 states in note 4 in Figure "Continuous x8 SelectMAP Data
> +	 * Loading", RDWR_B should be asserted before CSI_B to avoid
> +	 * causing an ABORT on the next CCLK.
> +	 *
> +	 * To be sure, set first RDWR_B pin before activate CSI_B
> +	 */
> +	gpiod_set_value(conf->rdwr_b, 1);
> +	gpiod_set_value(conf->csi_b, 1);
> +
>  	for (i = 0; i < count; ++i)
>  		writeb(buf[i], conf->base);
>  
> +	gpiod_set_raw_value(conf->csi_b, 0);
> +	gpiod_set_raw_value(conf->rdwr_b, 0);

I don't see why you do gpiod_set_raw_value() here, they seems change nothing.

  Function (example)                 line property          physical line
  gpiod_set_raw_value(desc, 0);      don't care             low
  ...
  gpiod_set_value(desc, 1);          active low             low

> +
>  	return 0;
>  }
>  
>  static int xilinx_selectmap_probe(struct platform_device *pdev)
>  {
>  	struct xilinx_selectmap_conf *conf;
> -	struct gpio_desc *gpio;
>  	void __iomem *base;
>  
>  	conf = devm_kzalloc(&pdev->dev, sizeof(*conf), GFP_KERNEL);
> @@ -56,15 +72,17 @@ static int xilinx_selectmap_probe(struct platform_device *pdev)
>  	conf->base = base;
>  
>  	/* CSI_B is active low */
> -	gpio = devm_gpiod_get_optional(&pdev->dev, "csi", GPIOD_OUT_HIGH);
> -	if (IS_ERR(gpio))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(gpio),
> +	conf->csi_b = devm_gpiod_get_optional(&pdev->dev, "csi",
> +					      GPIOD_OUT_HIGH);

You've changed this from v2, why? Why keep the initial state active?

> +	if (IS_ERR(conf->csi_b))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(conf->csi_b),
>  				     "Failed to get CSI_B gpio\n");
>  
>  	/* RDWR_B is active low */
> -	gpio = devm_gpiod_get_optional(&pdev->dev, "rdwr", GPIOD_OUT_HIGH);
> -	if (IS_ERR(gpio))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(gpio),
> +	conf->rdwr_b = devm_gpiod_get_optional(&pdev->dev, "rdwr",
> +					       GPIOD_OUT_HIGH);
> +	if (IS_ERR(conf->rdwr_b))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(conf->rdwr_b),
>  				     "Failed to get RDWR_B gpio\n");
>  
>  	return xilinx_core_probe(&conf->core);
> ---
> base-commit: 58717b2a1365d06c8c64b72aa948541b53fe31eb
> 
> -- 
> 2.55.0
> 
> 

