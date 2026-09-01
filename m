Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0F4C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPyoXnX799zplSGoWRCxzPEXIRbeRij2GoDGs6QAZDo=; b=X4WW0cbhWkm2QYgHInNtmoTeMx
	NZEvOcMgFlACkiOMWcJH6N4F1WiXZ96Goi5tdMJpUP0QKmAwdS2SVkXO1jyNo3hX8SVT5G5GcyVS9
	yfagtTLQqerL1/O1j2+eWFnh5ZhLB7t9ylnlnJ5z+CQSqXKvy2AeCcopl9BHoiZsrgiPVapzzGDM9
	JY2WgK/lQuEUjUVb1K+JOa7EYdg/5cv/A4BOAUW1GsNfgYS9d+t0yYGYs3gHY3bhzTxxYIgm9vzzF
	/sSo3/BvgYSK7zF2LYkYm4hY/SjW3UPDx9QhBZlqC3tD4ynyg5nAg7xSMzzuC2l1WyC+ehUYO8w3U
	bYvzR5FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KJm-0000000BLzp-267M;
	Tue, 01 Sep 2026 08:58:10 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KJk-0000000BLzI-0Zp1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:58:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788253089; x=1819789089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dn9Xg91C/1thO31fkCEIbl0rMR4votQKC6FIQtp2kqc=;
  b=C/rHrVMVcH/32w+Ba9FDCvQbOcGKkL8WS4SrikorO5/bU/mGY4Nmqf7F
   B078zG/xbOdqIusR6pHbyUrfOvVOePZtxAB+SSNWV85ChkxOF2DhEmDgp
   XqicXOEt47NuOgsDoFoaw7N6wE94VCr3DAia5a4wmKm2ZArwL57ypQyjG
   MBQ9r7qBjwSY14ZkMIxrU58sfbul8J4lAeG7mC4mpajGx53bPG9kb4Rfp
   e5V/DHBcqqNUV2ZTCGnbquSyRWtN1b1qAFTCQD3dGffrZUksHDugGXdPS
   b9k497fiaUXXQaItETeRIa3in72rCviXq1QsP8gGj1AZfTtLtfqfxcq+1
   Q==;
X-CSE-ConnectionGUID: t6xZH8dIQRWB7sXxtz915A==
X-CSE-MsgGUID: 9TBQX4NmSLG9uCuUqAjZ4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92542933"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="92542933"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 01:58:07 -0700
X-CSE-ConnectionGUID: czjYX5yyTDOsZtb1SZR0ug==
X-CSE-MsgGUID: Y14AxRADQre7S7wFBk1Gvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="265319657"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 01 Sep 2026 01:58:03 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1FEEE99; Tue, 01 Sep 2026 10:58:02 +0200 (CEST)
Date: Tue, 1 Sep 2026 10:58:02 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 10/19] thunderbolt: Make the ring register layout
 configurable
Message-ID: <20260901085802.GC106095@black.igk.intel.com>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-10-44bc9348683c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-10-44bc9348683c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_015808_218869_080D2C0D 
X-CRM114-Status: GOOD (  28.67  )
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

Hi,

On Sun, Aug 30, 2026 at 10:19:28PM +0200, Sven Peter wrote:
> The ring descriptor and options registers are laid out differently on
> the Apple NHI. Describe their offsets and strides with a
> tb_nhi_ring_layout struct that NHI drivers can override.

This is odd because Apple is sitting in USB-IF and they are behind the
original register layout so why they do not follow it themselves?

> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/thunderbolt/nhi.c   | 30 ++++++++++++++++++++++++------
>  drivers/thunderbolt/nhi.h   | 18 ++++++++++++++++++
>  include/linux/thunderbolt.h |  3 +++
>  3 files changed, 45 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index fc54ff7edfb9..3a3d334e69fd 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -176,19 +176,32 @@ void nhi_disable_interrupts(struct tb_nhi *nhi)
>  
>  /* ring helper methods */
>  
> +static const struct tb_nhi_ring_layout nhi_default_ring_layout = {
> +	.tx_desc_base = REG_TX_RING_BASE,
> +	.rx_desc_base = REG_RX_RING_BASE,
> +	.desc_stride = 16,
> +	.tx_options_base = REG_TX_OPTIONS_BASE,
> +	.rx_options_base = REG_RX_OPTIONS_BASE,
> +	.options_stride = 32,
> +};

I'm not fan of these to be honest.

I think either adding ring_ops that includes hooks that can be overridden
by non-standard HI or not sure if we can take advantage of regmap here?

> +
>  static void __iomem *ring_desc_base(struct tb_ring *ring)
>  {
> +	const struct tb_nhi_ring_layout *layout = ring->nhi->ring_layout;
>  	void __iomem *io = ring->nhi->iobase;
> -	io += ring->is_tx ? REG_TX_RING_BASE : REG_RX_RING_BASE;
> -	io += ring->hop * 16;
> +
> +	io += ring->is_tx ? layout->tx_desc_base : layout->rx_desc_base;
> +	io += ring->hop * layout->desc_stride;
>  	return io;
>  }
>  
>  static void __iomem *ring_options_base(struct tb_ring *ring)
>  {
> +	const struct tb_nhi_ring_layout *layout = ring->nhi->ring_layout;
>  	void __iomem *io = ring->nhi->iobase;
> -	io += ring->is_tx ? REG_TX_OPTIONS_BASE : REG_RX_OPTIONS_BASE;
> -	io += ring->hop * 32;
> +
> +	io += ring->is_tx ? layout->tx_options_base : layout->rx_options_base;
> +	io += ring->hop * layout->options_stride;
>  	return io;
>  }
>  
> @@ -215,8 +228,10 @@ static void ring_iowrite32desc(struct tb_ring *ring, u32 value, u32 offset)
>  
>  static void ring_iowrite64desc(struct tb_ring *ring, u64 value, u32 offset)
>  {
> -	iowrite32(value, ring_desc_base(ring) + offset);
> -	iowrite32(value >> 32, ring_desc_base(ring) + offset + 4);
> +	void __iomem *base = ring_desc_base(ring);
> +
> +	iowrite32(value, base + offset);
> +	iowrite32(value >> 32, base + offset + 4);
>  }
>  
>  static void ring_iowrite32options(struct tb_ring *ring, u32 value, u32 offset)
> @@ -1253,6 +1268,9 @@ int nhi_probe(struct tb_nhi *nhi)
>  	if (!nhi->ops->init_interrupts)
>  		return dev_err_probe(dev, -EINVAL, "missing required NHI ops\n");
>  
> +	if (!nhi->ring_layout)
> +		nhi->ring_layout = &nhi_default_ring_layout;
> +
>  	nhi->hop_count = ioread32(nhi->iobase + REG_CAPS) & 0x3ff;
>  	dev_dbg(dev, "total paths: %d\n", nhi->hop_count);
>  
> diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
> index 4884c3f5a2b2..035cee433a3c 100644
> --- a/drivers/thunderbolt/nhi.h
> +++ b/drivers/thunderbolt/nhi.h
> @@ -40,6 +40,24 @@ void nhi_reset_interface(struct tb_nhi *nhi);
>  
>  extern const struct dev_pm_ops nhi_pm_ops;
>  
> +/**
> + * struct tb_nhi_ring_layout - Layout of the ring registers in the NHI MMIO space
> + * @tx_desc_base: Offset of the descriptor registers of the first TX ring
> + * @rx_desc_base: Offset of the descriptor registers of the first RX ring
> + * @desc_stride: Stride between the descriptor registers of neighboring rings
> + * @tx_options_base: Offset of the options registers of the first TX ring
> + * @rx_options_base: Offset of the options registers of the first RX ring
> + * @options_stride: Stride between the options registers of neighboring rings
> + */
> +struct tb_nhi_ring_layout {
> +	u32 tx_desc_base;
> +	u32 rx_desc_base;
> +	u32 desc_stride;
> +	u32 tx_options_base;
> +	u32 rx_options_base;
> +	u32 options_stride;
> +};
> +
>  /**
>   * struct tb_nhi_ops - NHI specific optional operations
>   * @init: NHI specific initialization
> diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
> index d48623fda79b..7c2717bd2945 100644
> --- a/include/linux/thunderbolt.h
> +++ b/include/linux/thunderbolt.h
> @@ -503,6 +503,8 @@ void tb_service_properties_changed(struct tb_service *svc);
>   *	  interrupt_work when dispatching interrupts to individual rings.
>   * @dev: Device associated with this NHI instance
>   * @ops: NHI specific optional ops
> + * @ring_layout: Layout of the ring registers inside @iobase. If not set
> + *		 the default layout from the USB4 specification is used.
>   * @iobase: MMIO space of the NHI
>   * @tx_rings: All Tx rings available on this host controller
>   * @rx_rings: All Rx rings available on this host controller
> @@ -524,6 +526,7 @@ struct tb_nhi {
>  	spinlock_t lock;
>  	struct device *dev;
>  	const struct tb_nhi_ops *ops;
> +	const struct tb_nhi_ring_layout *ring_layout;
>  	void __iomem *iobase;
>  	struct tb_ring **tx_rings;
>  	struct tb_ring **rx_rings;
> 
> -- 
> 2.55.0
> 

