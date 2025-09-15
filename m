Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38D8CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 13:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vFD2fUL4nijzNa1WtRCCk/5C5/lc8fR6TS5GiUFXak=; b=hweCZTQroDss751U7IzZ4Xtcxh
	p8nBCdZWGTqcONcFekCmp/rZfrIvpCr+qDotNnQeuHbQt+A73KWGtGcAA8bDOQA+Bw/U8iDV79N83
	pdNqKbXiPL2O7iMAUQFCoKFapt6z2a1Hznxuvyvd1HkaBTo7LBsooX8xdLnIW3Q9cRRkHCEwasOwc
	C0/JRW9wgeG8OwsiGc17w+N3YqdrHxiV3iFMDEbj+a/OLk8DtPXL7RJBDKtuoK1xgx/JlFkIi7VH6
	z6uJRQX+vzJCNmz4IM8MtfAtIpOxOMJtcT0AWiKSUiTukBFt0xo1mMPgBuPBjsh9F3O4usNzVoGmX
	HL8UhLgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy92B-00000004HEb-06ZY;
	Mon, 15 Sep 2025 13:14:19 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy928-00000004HDZ-05fZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 13:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757942056; x=1789478056;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dle/WCXE1FdM2SDAFI+ZfumRAap/NFKRsz2OC6kLbMo=;
  b=Mt13+Cpf1zKVlxxcmCAPOku4vGuQJBlbqk2WLW8j0odERJl3nC00ThOd
   e5m06iwXlbj9clDAWLEtbaV1iz5thSuFa8JAbHHOMHUEoX9qqcmeawwAY
   yFB+WCv1iGTxidgNtfBvO6kLrModmrpBIo+6vWkgzzy6765VLzfi4SI1O
   lw+Ruq19SQJtBNRVzdJaFhY3qg0bNBlPlBaB8FBBofmBUN9OmUK/NN8Ug
   6CycfYDBWUhrnoEKZ7hoAxZ3/bZx/piV0xP2tEro3UistQlmoLYxrp71I
   RR6SZlLL6vGvCG2NAxEsUjca5M1bPPmpqC75q3ria8cIDY7NuHhkCfz2W
   A==;
X-CSE-ConnectionGUID: vaPMZjjFTQu8ioOBdzEaHg==
X-CSE-MsgGUID: qqLGgZoUSVOPEWrlandsvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="59890762"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="59890762"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 06:14:15 -0700
X-CSE-ConnectionGUID: zpz3F27SSnSNkSqFUpMt/A==
X-CSE-MsgGUID: ac8/E/joTTG4Igx2G0j/KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="173942411"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa010.jf.intel.com with SMTP; 15 Sep 2025 06:14:11 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 15 Sep 2025 16:14:10 +0300
Date: Mon, 15 Sep 2025 16:14:10 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 08/11] usb: typec: tipd: Update partner identity when
 power status was updated
Message-ID: <aMgRIoaIbMDH3aAl@kuha.fi.intel.com>
References: <20250914-apple-usb3-tipd-v1-0-4e99c8649024@kernel.org>
 <20250914-apple-usb3-tipd-v1-8-4e99c8649024@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914-apple-usb3-tipd-v1-8-4e99c8649024@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_061416_126422_BF03E32B 
X-CRM114-Status: GOOD (  20.43  )
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

On Sun, Sep 14, 2025 at 12:56:13PM +0000, Sven Peter wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> Whenever the power status is changed make sure to also update the
> partner identity to be able to detect changes once de-bouncing and mode
> changes are added for CD321x.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sven Peter <sven@kernel.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tipd/core.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index c7cf936e5a61a331271c05b68ff1b77b89c0f643..e16c6c07c72a3e285f1fc94db72bed8dc3217a1d 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -635,9 +635,16 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
>  	if (!tps6598x_read_status(tps, &status))
>  		goto err_unlock;
>  
> -	if (event & APPLE_CD_REG_INT_POWER_STATUS_UPDATE)
> +	if (event & APPLE_CD_REG_INT_POWER_STATUS_UPDATE) {
>  		if (!tps6598x_read_power_status(tps))
>  			goto err_unlock;
> +		if (TPS_POWER_STATUS_PWROPMODE(tps->pwr_status) == TYPEC_PWR_MODE_PD) {
> +			if (tps6598x_read_partner_identity(tps)) {
> +				dev_err(tps->dev, "failed to read partner identity\n");
> +				tps->partner_identity = (struct usb_pd_identity) {0};
> +			}
> +		}
> +	}
>  
>  	if (event & APPLE_CD_REG_INT_DATA_STATUS_UPDATE)
>  		if (!tps->data->read_data_status(tps))
> 
> -- 
> 2.34.1
> 

-- 
heikki

