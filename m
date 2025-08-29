Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF00CA1001
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 12:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xMY1sq0O80OtRWLCyCKc5lzvvozhwv6hxA6pjgIQNYQ=; b=aR05hheE+TmjhgvFsk9DgK2dhZ
	OwU5sDMpBM4fOGju3dl/Mqk3Qgp26lNeHzOlb4LPMCcBaobiKCb1FSM0HbxcIwAu2z0tqrKEQ58Xs
	cLV63gJ1acPX49ubDcu9dJf4qc7HCx1HvKfDofcXaIH0+RNVfHOr+Z5CJ0pSAUyXUAzNuig1TZqcv
	FzwJ1rObI3FACxKZClC0os81Ns2sp8M04L64Q+IAHpR4p5IuAijbDpsp8bhmrLFol3zV94pt2KX1W
	8OQFcq39uIVBaAkj6gxNd5/sfgv3x+yHiewAPPwZHFvpAuKZzDrBOlpqctl37H1NdDbYHqfXDJT7F
	whbtho+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uryAo-00000005dkP-0kwq;
	Fri, 29 Aug 2025 12:25:42 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvY3-00000005B7X-48yj;
	Fri, 29 Aug 2025 09:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756460252; x=1787996252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ap6TpSpSWfu+GxU/IBIYtbECJ/gJQjgTTVqFq2X5zn4=;
  b=HArccxoMtF3UGFirNhnpXQz4D33g0ZIoAp8k78P5Ndvx6l0DWyFzVlz2
   zSiUtK33awI8dz6MeLXxeR3gcLgLhpe5p+ofeddO+VzkZV7BVyR4+zFMs
   nEJ72Fzwz67jDNUArNBFR+BtL0hJc5qsNuxRw28SMLN3aYtXDMssT4pMt
   7AD7FWmtdFrxZHE3UXTAq+MFGjswjKpBBGpMYZKobiSxxd7JUAi+taKaU
   XPXgWaFV4sgKhI5QLIhw6o4ibN75XH6rZ1m3eLG2Mju//RIdFjr/V6PUn
   YuGsiRCsaJCH9ULgLqcuMpyfc4VNEofy66sL/tXeHyhMmVoyg62s+nB2I
   g==;
X-CSE-ConnectionGUID: EDfFoEI4TNawgzWqA6tKnw==
X-CSE-MsgGUID: bJWjkg/lRgOEFUF4foWe6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="62389369"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="62389369"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 02:37:30 -0700
X-CSE-ConnectionGUID: J7/Vuy9PRtaesA1hnRSVOQ==
X-CSE-MsgGUID: BWMYcSp6RXqR0c2ViZZwaQ==
X-ExtLoop1: 1
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa003.fm.intel.com with SMTP; 29 Aug 2025 02:37:24 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 29 Aug 2025 12:37:23 +0300
Date: Fri, 29 Aug 2025 12:37:23 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, stable@kernel.org
Subject: Re: [PATCH RFC 08/22] usb: typec: tipd: Clear interrupts first
Message-ID: <aLF00zGWg2MPUlyJ@kuha.fi.intel.com>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
 <20250821-atcphy-6-17-v1-8-172beda182b8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-atcphy-6-17-v1-8-172beda182b8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_023732_116309_747008B8 
X-CRM114-Status: GOOD (  22.77  )
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

On Thu, Aug 21, 2025 at 03:39:00PM +0000, Sven Peter wrote:
> Right now the interrupt handler first reads all updated status registers
> and only then clears the interrupts. It's possible that a duplicate
> interrupt for a changed register or plug state comes in after the
> interrupts have been processed but before they have been cleared:
> 
> * plug is inserted, TPS_REG_INT_PLUG_EVENT is set
> * TPS_REG_INT_EVENT1 is read
> * tps6598x_handle_plug_event() has run and registered the plug
> * plug is removed again, TPS_REG_INT_PLUG_EVENT is set (again)
> * TPS_REG_INT_CLEAR1 is written, TPS_REG_INT_PLUG_EVENT is cleared
> 
> We then have no plug connected and no pending interrupt but the tipd
> core still thinks there is a plug. It's possible to trigger this with
> e.g. a slightly broken Type-C to USB A converter.
> 
> Fix this by first clearing the interrupts and only then reading the
> updated registers.
> 
> Fixes: 45188f27b3d0 ("usb: typec: tipd: Add support for Apple CD321X")
> Fixes: 0a4c005bd171 ("usb: typec: driver for TI TPS6598x USB Power Delivery controllers")
> Cc: stable@kernel.org
> Signed-off-by: Sven Peter <sven@kernel.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tipd/core.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index dcf141ada07812295a6f07e41d77f95f98116010..1c80296c3b273e24ceacb3feff432c4f6e6835cc 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -545,24 +545,23 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
>  	if (!event)
>  		goto err_unlock;
>  
> +	tps6598x_write64(tps, TPS_REG_INT_CLEAR1, event);
> +
>  	if (!tps6598x_read_status(tps, &status))
> -		goto err_clear_ints;
> +		goto err_unlock;
>  
>  	if (event & APPLE_CD_REG_INT_POWER_STATUS_UPDATE)
>  		if (!tps6598x_read_power_status(tps))
> -			goto err_clear_ints;
> +			goto err_unlock;
>  
>  	if (event & APPLE_CD_REG_INT_DATA_STATUS_UPDATE)
>  		if (!tps6598x_read_data_status(tps))
> -			goto err_clear_ints;
> +			goto err_unlock;
>  
>  	/* Handle plug insert or removal */
>  	if (event & APPLE_CD_REG_INT_PLUG_EVENT)
>  		tps6598x_handle_plug_event(tps, status);
>  
> -err_clear_ints:
> -	tps6598x_write64(tps, TPS_REG_INT_CLEAR1, event);
> -
>  err_unlock:
>  	mutex_unlock(&tps->lock);
>  
> @@ -668,25 +667,24 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
>  	if (!(event1[0] | event1[1] | event2[0] | event2[1]))
>  		goto err_unlock;
>  
> +	tps6598x_block_write(tps, TPS_REG_INT_CLEAR1, event1, intev_len);
> +	tps6598x_block_write(tps, TPS_REG_INT_CLEAR2, event2, intev_len);
> +
>  	if (!tps6598x_read_status(tps, &status))
> -		goto err_clear_ints;
> +		goto err_unlock;
>  
>  	if ((event1[0] | event2[0]) & TPS_REG_INT_POWER_STATUS_UPDATE)
>  		if (!tps6598x_read_power_status(tps))
> -			goto err_clear_ints;
> +			goto err_unlock;
>  
>  	if ((event1[0] | event2[0]) & TPS_REG_INT_DATA_STATUS_UPDATE)
>  		if (!tps6598x_read_data_status(tps))
> -			goto err_clear_ints;
> +			goto err_unlock;
>  
>  	/* Handle plug insert or removal */
>  	if ((event1[0] | event2[0]) & TPS_REG_INT_PLUG_EVENT)
>  		tps6598x_handle_plug_event(tps, status);
>  
> -err_clear_ints:
> -	tps6598x_block_write(tps, TPS_REG_INT_CLEAR1, event1, intev_len);
> -	tps6598x_block_write(tps, TPS_REG_INT_CLEAR2, event2, intev_len);
> -
>  err_unlock:
>  	mutex_unlock(&tps->lock);
>  
> 
> -- 
> 2.34.1
> 

-- 
heikki

