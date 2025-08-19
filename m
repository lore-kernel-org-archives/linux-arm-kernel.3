Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3762ECA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 19:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rG3LxTcq7T1qMzuwmBfInoZLiZtNrFVPYB+dIGAfvPg=; b=cQ4bm8VOI+LjpJHR6Z8YQZtTTf
	gK0NKkHGREyJAtjG/mzk3QzeKAEAQ0ZnlWDuaydYYfoPP8MSDlk/Q+XF6xJSppwgbvuQ3T3e1o9cA
	hiwNQk1NSg6RbR52rmmJ8z/NRcmYoayEuQR74Gn+fg2PBETr08jh5UQFhNGDHI0D10jkBzH44LAON
	FPEQZ8WPcRRYkIblZyUHOBMN7Sj1V1RG+1H3fOydqPtm/LFMryzBpb6a23CTJLbn5fn6/OLRXtsbT
	KyEaDaWHp+gpUEEfekRF577GondoZa5kxqRfE0QhkjJe4G1fnhV0RLVpLPu5/718EZJPLgwB7IXll
	Wqqv0Q9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoRvE-0000000BOxL-33Sn;
	Tue, 19 Aug 2025 19:23:04 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoPTy-0000000B35c-1UXA;
	Tue, 19 Aug 2025 16:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755622006; x=1787158006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gJlCbtML3/hYLPe1GeD4TuTAglGALBUIYnsjaTlV7b4=;
  b=MAdNWRhJgCzsQJ5qgXpgKOYf9qNH98Y+Ofa/+rUqBg4DH4PtBd/208ld
   w48YGwYunsCcmDZ8vJZV8TjNTIY6i8LIyLxNv4A8T2HeJojsnOwj+z/Qi
   htJXfp2q9lbgwBWLVVCwcE+WxMmREpUBH+QAskJOTXUwD1JQCW+mzPZm4
   YapiRcm2WjGHmBKQYTliLJgEoS2nfJWtW+8X0SY95zSP04ifwveqT0kUy
   xMUDmosZVKsNGjKibuWHXtlGLU1Q+Ii2WxMb0qdlnnF/QF8zKh02T8oiG
   bxdcWi1nB13jbygAjGad5Wql1RhaZKhh6P9byw0tVHPm7DM16XH2GJxSm
   Q==;
X-CSE-ConnectionGUID: YvClh5roQSGpMsGTIM5u8g==
X-CSE-MsgGUID: VW7ZI3Q2SkG4673tYNJ2tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61706174"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="61706174"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 09:46:43 -0700
X-CSE-ConnectionGUID: R+JSMxuVTImX1WWpIWSi/A==
X-CSE-MsgGUID: hNi8ogtaSYuLdJCpLMDC7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="205044336"
Received: from johunt-mobl9.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.222])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 09:46:37 -0700
Date: Tue, 19 Aug 2025 18:46:29 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Gerald Loacker <gerald.loacker@wolfvision.net>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Markus Elfring <Markus.Elfring@web.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Collabora Kernel Team <kernel@collabora.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v10 08/13] media: rockchip: rkcif: add support for mipi
 csi-2 capture
Message-ID: <rpaa2jspgmw3do5y367kq4pvvtpboeu7gjd4chmh6pgztmj6ar@ckh7jxvfuhlg>
References: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
 <20240220-rk3568-vicap-v10-8-62d8a7b209b4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v10-8-62d8a7b209b4@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_094646_460357_A1CA266D 
X-CRM114-Status: GOOD (  22.49  )
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

Hi Michael,

I am seeing IOMMU page faults: See below.

On Tue, Aug 19, 2025 at 01:26:00AM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The RK3568 Video Capture (VICAP) unit features a MIPI CSI-2 capture
> interface that can receive video data and write it into system memory
> using the ping-pong scheme. Add support for it.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

[..]

>  irqreturn_t rkcif_mipi_isr(int irq, void *ctx)
>  {
> +	struct device *dev = ctx;
> +	struct rkcif_device *rkcif = dev_get_drvdata(dev);
>  	irqreturn_t ret = IRQ_NONE;
> +	u32 intstat;
> +
> +	for (unsigned int i = 0; i < rkcif->match_data->mipi->mipi_num; i++) {
> +		enum rkcif_interface_index index = RKCIF_MIPI_BASE + i;
> +		struct rkcif_interface *interface = &rkcif->interfaces[index];
> +
> +		intstat = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
> +		rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, intstat);
> +
> +		for (unsigned int j = 0; j < interface->streams_num; j++) {
> +			struct rkcif_stream *stream = &interface->streams[j];

In the TRM you can see in the MIPI_INTSTAT interrupts to detect
overflows: why not activate them ?

something like this:

#define RKCIF_MIPI_INT_Y_OVERFLOW(id)          BIT(16)
#define RKCIF_MIPI_INT_UV_OVERFLOW(id)         BIT(17)
#define RKCIF_MIPI_INT_FIFO_OVERFLOW(id)       BIT(18)
#define RKCIF_MIPI_INT_CSI2RX_FIFO_OVERFLOW(id)        BIT(20)

and then OR them with the int_mask in rkcif_mipi_start_streaming()

and then you can log the err if something happened ?

> +
> +			if (intstat & RKCIF_MIPI_INT_FRAME0_END(stream->id) ||
> +			    intstat & RKCIF_MIPI_INT_FRAME1_END(stream->id)) {
> +				ret = IRQ_HANDLED;
> +
> +				if (stream->stopping) {
> +					rkcif_mipi_stop_streaming(stream);
> +					wake_up(&stream->wq_stopped);
> +					continue;
> +				}
> +
> +				rkcif_stream_pingpong(stream);
> +			}
> +		}
> +	}
>  
>  	return ret;
>  }

Now to the IOMMU page faults:

Camera Sensor: IMX219
Frame Size: 1920x1080
Format: SRGGB10P

Packed SRGGB10
--> Every four consecutive samples are packed into 5 bytes
--> Stride = 2400 bytes (1920 * 5/4)

So the imagesize = 1080 * 2400 = 2 592 000

in __vb2_buf_mem_alloc() the size of the buf will be PAGE_ALIGNED in:
PAGE_ALIGN(vb->planes[plane].length);

So we allocate a buffer with the size: 2 592 768 -> hex = 0x297000

In rkcif_mipi_queue_buffer():
We will queue a total of two buffers to the HW (2 because of pingpong)
The first buffer will have the address: 0x00000000ffc00000

We start to capture and then this happens:

rk_iommu fdfe0800.iommu: Page fault at 0x00000000ffe79000 of type write
rk_iommu fdfe0800.iommu: iova = 0x00000000ffe79000: dte_index: 0x3ff pte_index: 0x279 page_offset: 0x0
rk_iommu fdfe0800.iommu: mmu_dte_addr: 0x0000000012cc8000 dte@0x0000000012cc8ffc: 0x11a0d001 valid: 1 pte@0x0000000011a0d9e4: 0x31b79006 valid: 0 page@0x0000000000000000 flags: 0x0

With:
0xffe79000 = 0xffc00000 (buffer address) + 0x297000 (buffersize)

--> So the VICAP is overflowing the buffer even though everything was
correctly configured ?! (If I understood everything correctly ofc.)

I also see the same problem with the SRGGB8 format. It also happens in
the downstream Radxa/Rockchip Kernel.

Do you see the same problem ?

--
Kind Regards
Mehdi Djait

