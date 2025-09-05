Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BABACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CS7/+88GKvPz+RzdqbRIb2EPsCndRz2p9qUkq+VGtSU=; b=1Oo72DLlmJ4cxZdjORjHT9f78g
	3UTT/UWIfF9myp8+afFpE+8F6iSCSqC9RjwM/4PreHoeYhGM2DxU1cXGXmqG4ollOSWK5dMPESZMy
	LnGLFPAuF7g171Dyv0UkEST7lA9udyDEVEgzoxRaB3PFyAMbN5Ab/cut0xmEFbTINMQJJ/Jf5GAwP
	s86HYVz5kaHiMSpQfugb/jXtpbGwGtLdJWr234o7lXIzS6U15v9UnuGGfD3J2PVivI0l0RY/9Mzyl
	ysx4xt0shPhLrhQ94QA8FhHRO4PYd0pLs7Lvlqj6EU6FVegby2mQ94nI57ZM4+nseICETDpHduUj5
	T6ByWz9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXZS-00000002PhF-3t5t;
	Fri, 05 Sep 2025 14:37:46 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuUPi-00000001JTh-2c6n;
	Fri, 05 Sep 2025 11:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757070931; x=1788606931;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3akFC5IMed+fG2KKB0KQf9NBmC17zIW/9AU0DfJiD7Q=;
  b=evMVsjKRo24QhgqTHmUogHH7LKfCmEX34atlZNYejTiiEj0N5Ca/rcFd
   cH+6oOKOVEzo6DU1BK5gHoJbqYZb/v772DJ4c8DLMGeMu5JWuGhDo2iZc
   mdtwrzrTlrQl6AFnSzAJKVZkvs6yMiL3vi4Qcc/TGRpDTDq0QVzYvSHCN
   T9cHkLfSormHSSP49CmzdPafgKLgYG1AFd42QyLI7xXKCaRp+kYAUINs5
   G7QATflKakHJO3+HV7AXdS15fQwmSLeYLM/Wycy7zWSLiINzUw5RK7cma
   mHk08Um1SEf/RTCFZ/f63DSK/xIi23K0mp1V87G+plKmDVRIdyWiBOdj3
   Q==;
X-CSE-ConnectionGUID: k0yHEqaOT4S1pJxU/d7+ZQ==
X-CSE-MsgGUID: zdYGVnCtRTCgHFsMb0Tyhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63251836"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63251836"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 04:15:24 -0700
X-CSE-ConnectionGUID: +3HgtWUMTAaK3lJguvuAiQ==
X-CSE-MsgGUID: 0bI3GIRWSgi/mUctC2BkUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="172069602"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa006.fm.intel.com with SMTP; 05 Sep 2025 04:15:17 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 05 Sep 2025 14:15:16 +0300
Date: Fri, 5 Sep 2025 14:15:16 +0300
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
	linux-phy@lists.infradead.org
Subject: Re: [PATCH RFC 12/22] usb: typec: tipd: Add cd321x struct with
 separate size
Message-ID: <aLrGRGTjyMhKV9hd@kuha.fi.intel.com>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
 <20250821-atcphy-6-17-v1-12-172beda182b8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-atcphy-6-17-v1-12-172beda182b8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_041530_811276_CC5222D6 
X-CRM114-Status: GOOD (  20.29  )
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

On Thu, Aug 21, 2025 at 03:39:04PM +0000, Sven Peter wrote:
> We're about to add more fields to struct tps6598x which are only relevant
> for Apple's CD321x and to ensure that we don't waste memory everywhere for
> those add a separate struct for cd321x and prepare to allocate more space
> inside probe.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tipd/core.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 19d713937870304e68325a441b0de63eb5db3b80..51b0f3be8b66a743ddc3ea96c1b25f597a1e8f6c 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -113,6 +113,7 @@ struct tps6598x;
>  struct tipd_data {
>  	irq_handler_t irq_handler;
>  	u64 irq_mask1;
> +	size_t tps_struct_size;
>  	int (*register_port)(struct tps6598x *tps, struct fwnode_handle *node);
>  	void (*trace_data_status)(u32 status);
>  	void (*trace_power_status)(u16 status);
> @@ -148,6 +149,10 @@ struct tps6598x {
>  	const struct tipd_data *data;
>  };
>  
> +struct cd321x {
> +	struct tps6598x tps;
> +};
> +
>  static enum power_supply_property tps6598x_psy_props[] = {
>  	POWER_SUPPLY_PROP_USB_TYPE,
>  	POWER_SUPPLY_PROP_ONLINE,
> @@ -1297,18 +1302,24 @@ tps25750_register_port(struct tps6598x *tps, struct fwnode_handle *fwnode)
>  
>  static int tps6598x_probe(struct i2c_client *client)
>  {
> +	const struct tipd_data *data;
>  	struct tps6598x *tps;
>  	struct fwnode_handle *fwnode;
>  	u32 status;
>  	u32 vid;
>  	int ret;
>  
> -	tps = devm_kzalloc(&client->dev, sizeof(*tps), GFP_KERNEL);
> +	data = i2c_get_match_data(client);
> +	if (!data)
> +		return -EINVAL;
> +
> +	tps = devm_kzalloc(&client->dev, data->tps_struct_size, GFP_KERNEL);
>  	if (!tps)
>  		return -ENOMEM;
>  
>  	mutex_init(&tps->lock);
>  	tps->dev = &client->dev;
> +	tps->data = data;
>  
>  	tps->reset = devm_gpiod_get_optional(tps->dev, "reset", GPIOD_OUT_LOW);
>  	if (IS_ERR(tps->reset))
> @@ -1334,10 +1345,6 @@ static int tps6598x_probe(struct i2c_client *client)
>  	if (i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
>  		tps->i2c_protocol = true;
>  
> -	tps->data = i2c_get_match_data(client);
> -	if (!tps->data)
> -		return -EINVAL;
> -
>  	if (tps->data->switch_power_state) {
>  		ret = tps->data->switch_power_state(tps, TPS_SYSTEM_POWER_STATE_S0);
>  		if (ret)
> @@ -1521,6 +1528,7 @@ static const struct tipd_data cd321x_data = {
>  	.irq_mask1 = APPLE_CD_REG_INT_POWER_STATUS_UPDATE |
>  		     APPLE_CD_REG_INT_DATA_STATUS_UPDATE |
>  		     APPLE_CD_REG_INT_PLUG_EVENT,
> +	.tps_struct_size = sizeof(struct cd321x),
>  	.register_port = tps6598x_register_port,
>  	.trace_data_status = trace_cd321x_data_status,
>  	.trace_power_status = trace_tps6598x_power_status,
> @@ -1535,6 +1543,7 @@ static const struct tipd_data tps6598x_data = {
>  	.irq_mask1 = TPS_REG_INT_POWER_STATUS_UPDATE |
>  		     TPS_REG_INT_DATA_STATUS_UPDATE |
>  		     TPS_REG_INT_PLUG_EVENT,
> +	.tps_struct_size = sizeof(struct tps6598x),
>  	.register_port = tps6598x_register_port,
>  	.trace_data_status = trace_tps6598x_data_status,
>  	.trace_power_status = trace_tps6598x_power_status,
> @@ -1549,6 +1558,7 @@ static const struct tipd_data tps25750_data = {
>  	.irq_mask1 = TPS_REG_INT_POWER_STATUS_UPDATE |
>  		     TPS_REG_INT_DATA_STATUS_UPDATE |
>  		     TPS_REG_INT_PLUG_EVENT,
> +	.tps_struct_size = sizeof(struct tps6598x),
>  	.register_port = tps25750_register_port,
>  	.trace_data_status = trace_tps6598x_data_status,
>  	.trace_power_status = trace_tps25750_power_status,
> 
> -- 
> 2.34.1
> 

-- 
heikki

