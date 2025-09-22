Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C674ECAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 06:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qu23B2J7b2A56Ul4JJXUbLHwY6TNh++dPK/zMyIBMg0=; b=uCjBPlV9EC72/jRG3pgt6mCaLO
	cDqq8vaVrJ3y9rxv65x00tHMuljv3ii8w2yAuQyeScww0+0K9G4Sj25gjm5Ek85M6OTPzlddkaoPh
	gnOE2WfYNmcrou/qgv02M0s3G0gxX97iC3TyzADMxlNAzBs1yumFE1tJcesPeO6lIkln+AC1hLdzb
	TFpQYjcWqkt1pEB/7SjLxKM7HjXWvcIIdAEQLhFj/apaFFJ07lZXIPDYgnQLa0N/e+0XYCwKJXiVy
	TMDuNwDOVcOU9k2cpBZClyu1EutKN5THYOIZC/h5jGLT8dQdwIx95F38ev90SbRDwmXK9+VBumEuz
	+c2kC14w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0aMf-000000091Fg-2XHP;
	Mon, 22 Sep 2025 06:49:33 +0000
Received: from meesny.iki.fi ([2001:67c:2b0:1c1::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0aMd-000000091Eg-1F6z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 06:49:32 +0000
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4cVYcm1p8bzyQK;
	Mon, 22 Sep 2025 09:49:28 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1758523768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qu23B2J7b2A56Ul4JJXUbLHwY6TNh++dPK/zMyIBMg0=;
	b=WEEjoJVdBwwCayHJBLPJdNoFEAW4IbR1kcb2P++33rMnLG+qunU7aLcs7iGjM0qX2NHYxp
	EhUb3NmgPVaTg6SJhM4tVDPAjGEugpYJ00go8WJO/3yw3dfThsZTqq9VBWSChLQ6d5/FK6
	NHJ3c/iyggnw3wKo7JDdj/b/Ao66Edw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1758523768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qu23B2J7b2A56Ul4JJXUbLHwY6TNh++dPK/zMyIBMg0=;
	b=ZNYxOXMX192BGaQKrTn8H1Y9O2P5kTyWUb8VxPYRUGycx2Y1PS05oQ0MIdVnNZ4FqCX9kb
	fV0JmGyr6kRqHpKonn0Rp+nJhFyE768q3uEmXf5wIarYqBa1qexqcITQ6i3QCtYbG4ajMc
	TDwlnxkWKXb9bw2QpGB6lf1ZO8t50AE=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1758523768; a=rsa-sha256; cv=none;
	b=SGLNt2dwI5NBADA5l6wnw15IsKqG6BHCpS7pGDWnWAOAUg9RsqjWOt4Z8aOOVpHNZoC+LF
	ORAEGm9wXJG1RGo6eYOCuVDXZ6NOXnmfrT/rQQUKI5HUbksqe5vmMNsiJJijw/pRdxEc7B
	iWygxQEJEQEnBQeU59pDNWeDFTkozdE=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 79790634C97;
	Mon, 22 Sep 2025 09:49:27 +0300 (EEST)
Date: Mon, 22 Sep 2025 09:49:27 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/3] media: imx-mipi-csis: Store the number of
 data_lanes configured in dt
Message-ID: <aNDxd9rWjmgrVCd9@valkosipuli.retiisi.eu>
References: <20250915-mbus-config-active-lanes-v3-0-97a1282a410b@ideasonboard.com>
 <20250915-mbus-config-active-lanes-v3-2-97a1282a410b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-mbus-config-active-lanes-v3-2-97a1282a410b@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_234931_502176_4981798E 
X-CRM114-Status: GOOD (  23.94  )
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

On Mon, Sep 15, 2025 at 02:18:34PM +0100, Isaac Scott wrote:
> The number of lanes actively used by a MIPI CSI transmitter may differ
> from that which is defined in device tree. To allow us to be able to set
> the number of configured lanes without changing the maximum lane count,
> store the number of lanes configured in device tree, and adjust the
> debug print to reflect the device tree value.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 2beb5f43c2c0..6afbedfe131e 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -313,6 +313,8 @@ struct mipi_csis_device {
>  	u32 hs_settle;
>  	u32 clk_settle;
>  
> +	unsigned int num_data_lanes;
> +
>  	spinlock_t slock;	/* Protect events */
>  	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
>  	struct dentry *debugfs_root;
> @@ -535,7 +537,7 @@ static void mipi_csis_system_enable(struct mipi_csis_device *csis, int on)
>  	val = mipi_csis_read(csis, MIPI_CSIS_DPHY_CMN_CTRL);
>  	val &= ~MIPI_CSIS_DPHY_CMN_CTRL_ENABLE;
>  	if (on) {
> -		mask = (1 << (csis->bus.num_data_lanes + 1)) - 1;
> +		mask = (1 << (csis->num_data_lanes + 1)) - 1;

Please use 1U or BIT() for bit-shifted values.

>  		val |= (mask & MIPI_CSIS_DPHY_CMN_CTRL_ENABLE);
>  	}
>  	mipi_csis_write(csis, MIPI_CSIS_DPHY_CMN_CTRL, val);
> @@ -586,7 +588,7 @@ static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
>  
>  	/* Calculate the line rate from the pixel rate. */
>  	link_freq = v4l2_get_link_freq(src_pad, csis_fmt->width,
> -				       csis->bus.num_data_lanes * 2);
> +				       csis->num_data_lanes * 2);
>  	if (link_freq < 0) {
>  		dev_err(csis->dev, "Unable to obtain link frequency: %d\n",
>  			(int)link_freq);
> @@ -631,7 +633,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
>  				 const struct v4l2_mbus_framefmt *format,
>  				 const struct csis_pix_format *csis_fmt)
>  {
> -	int lanes = csis->bus.num_data_lanes;
> +	int lanes = csis->num_data_lanes;
>  	u32 val;
>  
>  	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
> @@ -1299,8 +1301,10 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
>  	}
>  
>  	csis->bus = vep.bus.mipi_csi2;
> +	csis->bus.num_data_lanes = vep.bus.mipi_csi2.num_data_lanes;
> +	csis->num_data_lanes = csis->bus.num_data_lanes;
>  
> -	dev_dbg(csis->dev, "data lanes: %d\n", csis->bus.num_data_lanes);
> +	dev_dbg(csis->dev, "data lanes: %d\n", csis->num_data_lanes);
>  	dev_dbg(csis->dev, "flags: 0x%08x\n", csis->bus.flags);
>  
>  	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
> @@ -1498,7 +1502,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
>  	}
>  
>  	dev_info(dev, "lanes: %d, freq: %u\n",
> -		 csis->bus.num_data_lanes, csis->clk_frequency);
> +		 csis->num_data_lanes, csis->clk_frequency);
>  
>  	return 0;
>  
> 

-- 
Regards,

Sakari Ailus

