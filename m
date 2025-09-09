Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685CECAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqpe2bqaC4sdbfV2Yw1BhzqELA/AKcDcnBw9K7HRcEw=; b=vwzyAU313fkv7NHfHzdglqnb/n
	b+3njQvep8rZdTa9M7lC0+t0Q+D8hdTVxdE/XcMfS5fEFm/JXlbZsqSvZV8yWwxbnnQ/37ikvvA39
	pIj5SRJ1DQ7hcanGYgEKR1WEEUqbuM5A5mbmxruOq6HFY8YU/9Oe9lrUvTgsW/lK2OwORfQ4V2neu
	N4688xi5B7SVu5gY1v/ubws0k/jFvVKH18xKZI7WXtPFFMs84SSwQ8M7vZFNsiW6wZoZv6wXJ9kcS
	juX87CrNxPv3uEuSSGP+1BFB1F9SEQBPE/tEzDRGGYqfVdECtqdLwjBDF90IAxWW2doIOfHp2Le6k
	xZvlFqSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Td-00000008C5E-3NCz;
	Tue, 09 Sep 2025 15:41:49 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvAz-00000006Dbz-426l;
	Tue, 09 Sep 2025 10:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757412134; x=1788948134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tEjUpDYvYVCiLuU5pbp0rm5Pfjj/tg0TJ9N8gnYaMb8=;
  b=ac6XIqw3h/x/eFpMHOzAmDaGZsExBmZiupjwyvTJ3SF3tDUgexDJevhC
   lLKHYhV+cwIXFjLVrQhkShh3sVlk1eGPDpV+94WJhSsEDl1+VvYTNG/Pu
   VyFH60+YtwFikNMCRfCltF7THA3qSGXy5xTMo0UZgUkWSCEZbB51O/J6N
   N36DG3A2hgu52W/N3bHofGOswREfO3Vuwzd5qsBWU3HR4mpHwzn1JSdp5
   KeMhNIt2joQMUh7U1B21IpE1YRQ1wqpWWg6iV0SwED1GYQEvepNO7gK1X
   +owaX1AJTKCLXLOpZh2nAeW+XuEyLF9MZJumAy8LufG7u0gizvpk5OVbc
   g==;
X-CSE-ConnectionGUID: lnjiEnU3RQOtUezr1YP8NQ==
X-CSE-MsgGUID: Au5FBt9uSMWSkAzpDR63LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59627231"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="59627231"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 03:02:13 -0700
X-CSE-ConnectionGUID: 6CAL+BkbQ0GLmY9r/PDbfQ==
X-CSE-MsgGUID: bWb6v0dzQF2Nf5Sb/J+gnA==
X-ExtLoop1: 1
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa003.fm.intel.com with SMTP; 09 Sep 2025 03:02:07 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 09 Sep 2025 13:02:06 +0300
Date: Tue, 9 Sep 2025 13:02:06 +0300
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
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 14/22] usb: typec: tipd: Read data status in probe and
 cache its value
Message-ID: <aL_7Hklraq2ff_YA@kuha.fi.intel.com>
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
 <20250906-atcphy-6-17-v2-14-52c348623ef6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906-atcphy-6-17-v2-14-52c348623ef6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_030214_042870_43881FFA 
X-CRM114-Status: GOOD (  19.09  )
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

On Sat, Sep 06, 2025 at 03:43:27PM +0000, Sven Peter wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> Just like for power status we also need to keep track of data status to
> be able to detect mode changes once we introduce de-bouncing for CD321x.
> Read it during probe and keep a cached copy of its value.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Sven Peter <sven@kernel.org>

Reviewed-by: Heikki Krogerus <>

> ---
>  drivers/usb/typec/tipd/core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index e6e9730ee6dacd8c1271b1d52a02da49ff248d3e..b558fc5ecbc35a9dabbf33c444f38173740af7c3 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -176,6 +176,7 @@ struct tps6598x {
>  
>  	int wakeup;
>  	u32 status; /* status reg */
> +	u32 data_status;
>  	u16 pwr_status;
>  	struct delayed_work	wq_poll;
>  
> @@ -538,6 +539,7 @@ static bool tps6598x_read_data_status(struct tps6598x *tps)
>  		dev_err(tps->dev, "failed to read data status: %d\n", ret);
>  		return false;
>  	}
> +	tps->data_status = data_status;
>  
>  	if (tps->data->trace_data_status)
>  		tps->data->trace_data_status(data_status);
> @@ -1551,6 +1553,8 @@ static int tps6598x_probe(struct i2c_client *client)
>  	if (status & TPS_STATUS_PLUG_PRESENT) {
>  		if (!tps6598x_read_power_status(tps))
>  			goto err_unregister_port;
> +		if (!tps->data->read_data_status(tps))
> +			goto err_unregister_port;
>  		ret = tps6598x_connect(tps, status);
>  		if (ret)
>  			dev_err(&client->dev, "failed to register partner\n");
> 
> -- 
> 2.34.1
> 

-- 
heikki

