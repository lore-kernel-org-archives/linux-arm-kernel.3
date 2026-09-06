Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660ACC79F85
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 16:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y1Vmeph/0J2uHxeLJdYJg80ax9Y/Lpecpyu1qTgOHWg=; b=gwO/KPf3viIBwYpFUUNtt7sL21
	ZkUDAMhUD9i4ZJgRxqlEOS+22WhHG3BKF+engJ+6N0+uIYu4gt5foKb8uGl1lUBolnmP6ovNeBY6T
	i6wxaHQ1ALZe7+kEejC7MghvueVDFccXPabwHe80/dsf5wYxPP7pr1BOUx7YHcmyphAfScT9zCHu8
	hbQBOLJAemm6fIWaPKl5DFf8lPKbHdtcBorHYAnPsAcx/Jh80DDOdF0R50gb9hRmhbdb0vIxYD3xn
	ka4MdeyvMRvleyUwnOJASfYt6ZBa8rnyHD8A02719IEAPTGL43qZksJBl99X6d9JnX2UHwRi92YAd
	NQX2ddog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3G0L-00000005CwX-0iBq;
	Sun, 06 Sep 2026 16:46:05 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3G0J-00000005Cvv-10xl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 16:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788713163; x=1820249163;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ihmr8oeQnM8FYh1NYQcgFGPk2IsSRVmBaFkBqvvUTuM=;
  b=US/YOl85J0mhrAhMNHzEsHt9zVVYo6gVtPrXlPKzOHp4U/PTx82DH8M8
   Iey5ESq5QV1nEwiIepdFZxuHhRvv/280N1Dwpso9M0law1C4464WBhhAm
   kSUvwZVbgqG2avI8i3SEXgTPhcKmQojPtotqEb/pfb/uVEB51BIZfBidQ
   ZIF0tTn8I4ypTemTfdzR7uy+fB3zo/Yy5DahzqmFb3LLZ0DETx5VmOT2d
   YsEwxbQ/cmRYIOnlLnwoCTnfNKmrJ1SwpGLZROQN+ncdS5Ra9NiBF7GfM
   7LNihqSihB/cldHKLz3jJRFVkkh5iklDs1R/wkmpYDbeI+8YovhE+fWxg
   g==;
X-CSE-ConnectionGUID: wksdmc05Rf2RDtn7u6cUrw==
X-CSE-MsgGUID: vOR1oOfjQYS0OOZc6wMnLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="114676043"
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; 
   d="scan'208";a="114676043"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2026 09:46:02 -0700
X-CSE-ConnectionGUID: PQbWxNL0TQCgZDGvaBFE3w==
X-CSE-MsgGUID: YupSYtInT7aDAONy3HsGeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; 
   d="scan'208";a="264315586"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by fmviesa009.fm.intel.com with ESMTP; 06 Sep 2026 09:45:59 -0700
Date: Mon, 7 Sep 2026 00:45:59 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Heiko Schocher <hs@nabladev.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
	Xu Yilun <yilun.xu@intel.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4] driver: fpga: xilinx-selectmap: add csi and rdwr
 support
Message-ID: <ap2Yx8oACWfBKOep@yilunxu-OptiPlex-7050>
References: <20260810062105.299808-1-hs@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810062105.299808-1-hs@nabladev.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_094603_328158_7F156F61 
X-CRM114-Status: GOOD (  42.95  )
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

On Mon, Aug 10, 2026 at 08:20:51AM +0200, Heiko Schocher wrote:
> The current driver requests the optional CSI_B and RDWR_B GPIOs but
> only configures their initial output state and never changes them
> afterwards. As a result, CSI_B and RDWR_B remain inactive or active

I got even confused, the old code explicitly set them GPIOD_OUT_HIGH,
why "inactive or active"? And I also confused by your comments in v3,
why "inactive or active" depends on DTS?

Do you want to activate or inactivate the GPIOs in your code? You can't
say don't know, go check the DTS, is it?

> throughout the configuration process.
> 
> This may work on systems with a single FPGA where these signals do not
> need to be controlled by software, or where the signals are configured
> to their active state.

Could you just tell the actual problem, as you said in v3 "The gpios are
never used in mainline".

> But this does not not support systems with
> multiple FPGAs sharing a SelectMAP interface.
> 
> On systems with multiple FPGAs sharing the same SelectMAP data bus,
> the driver must deassert this signals in probe, and actively control
> them during configuration.
> 
> CSI_B (Chip Select, active low) selects the target FPGA. It is asserted
> before configuration data is transferred and deasserted afterwards so
> that only the intended device responds to bus transactions.
> 
> RDWR_B (Read/Write, active low) controls the transfer direction on the
> SelectMAP interface. A low level selects write cycles, while a high
> level selects read cycles. During FPGA configuration the driver drives
> RDWR_B low before transferring the bitstream and restores it to its
> reading (high state) afterwards.
> 
> With that info from the datasheet the driver is now changed to:
> 
> - deassert the CSI_B and RDWR_B pin on probe and store the
>   optional GPIO descriptors in private driver data.
> 
> - toggle both signals around the configuration data transfer
> 
> This allows multiple FPGAs to safely share a single SelectMAP interface.
> 
> Signed-off-by: Heiko Schocher <hs@nabladev.com>
> ---
> 
> Changes in v4:
> - add comments from Xu Yulin
>   replace wrong gpiod_set_raw_value() with gpiod_set_value()
>   deassert CSI_B and RDWR_B in probe as in patch version 2
>   rework commit message (correct the description what current
>   driver do on probe), why this is not a problem with one
>   FPGA, and why it needs a change if you have N FPGAs
>   sharing the same selectmap Interface (clk and data pins).
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
>  drivers/fpga/xilinx-selectmap.c | 36 ++++++++++++++++++++++++---------
>  1 file changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/fpga/xilinx-selectmap.c b/drivers/fpga/xilinx-selectmap.c
> index d0cbb5fdfe3a..e9b1d15ca054 100644
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
> +	gpiod_set_value(conf->csi_b, 0);
> +	gpiod_set_value(conf->rdwr_b, 0);
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
> @@ -55,16 +71,18 @@ static int xilinx_selectmap_probe(struct platform_device *pdev)
>  				     "ioremap error\n");
>  	conf->base = base;
>  
> -	/* CSI_B is active low */
> -	gpio = devm_gpiod_get_optional(&pdev->dev, "csi", GPIOD_OUT_HIGH);
> -	if (IS_ERR(gpio))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(gpio),
> +	/* CSI_B is active low, deassert signal */

I'm not sure "active low" does any help here, it just makes more
confusion.

At first glance, "active low" && "deassert" => "set it high", then you
should use GPIOD_OUT_HIGH?? You are not reasoning your change.

Please elaborate on how these flags work before you send v5, thanks.

> +	conf->csi_b = devm_gpiod_get_optional(&pdev->dev, "csi",
> +					      GPIOD_OUT_LOW);
> +	if (IS_ERR(conf->csi_b))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(conf->csi_b),
>  				     "Failed to get CSI_B gpio\n");
>  
> -	/* RDWR_B is active low */
> -	gpio = devm_gpiod_get_optional(&pdev->dev, "rdwr", GPIOD_OUT_HIGH);
> -	if (IS_ERR(gpio))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(gpio),
> +	/* RDWR_B is active low, deassert signal */

Same concern

> +	conf->rdwr_b = devm_gpiod_get_optional(&pdev->dev, "rdwr",
> +					       GPIOD_OUT_LOW);
> +	if (IS_ERR(conf->rdwr_b))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(conf->rdwr_b),
>  				     "Failed to get RDWR_B gpio\n");
>  
>  	return xilinx_core_probe(&conf->core);
> ---
> base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
> 
> -- 
> 2.55.0
> 
> 

