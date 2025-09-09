Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA87CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZ50Syz7TLlsJqlJydXY3+wTJItoXJy/aiF3/ClE/BQ=; b=HnJoilawTy19BpcVi1Fyt9Vfxc
	RbkYXieg0CGYE1ogzgRy2wtaKQx76DHaQfDE2uG7enqXXGH4qW4nYfdSn6xCLoUWP85ppL8c0u2rU
	63y250xrJaBTI748FrARgJqtAwlj8GbwYDU5QIea60ryo4bxRnjV3RcIyIMaA/QYSrQqETeV2zrsv
	pG2jGmp//KycHt90iNksLA2ZNdlPiq1c+ku8+cxtoPfN6UcsMA969ORbPG9x2e0lPBAdLNGQj3Vlc
	vY2ZgCOVg00Fx2tPbGmg34M5CIdNsYR2ZElK6GKUjv8IkXCj0ZdjEDmOp1gMjl+wyZdnQVBYHJ2IX
	UJzDvW/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1vt-00000008nid-35Xr;
	Tue, 09 Sep 2025 17:15:05 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvux4-0000000670h-0wug;
	Tue, 09 Sep 2025 09:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757411270; x=1788947270;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JrPGhCJ7nJZqXECYZOjxg/ffsRI6LCeK6wQeJaLY740=;
  b=niIzQz8ydI9EoyMQUqhjiibtQK+I2pfzB5WNbAr3uOj2PKu0/K38cK/v
   I5PLwtENPsN7QaZJwMLFVbVCwTziPdR81nmZGJz4dizH6xbJ0U1qmrn/A
   Cf9ADxg+MXuJEWSCZ1vn6yw5LpeyFj6yuSyRC7ZyN/MQxbIRrOpMEW+i4
   ytkdHWHWuEUVbRoP2fmJPAj0y2Hv6fjXMPULGIC/nmOjYtkGyyjvE6mm+
   pk7tHCAkMxZbsnF86+AmID/3o0OVTb45K5bfzhL8TWjC1nsS5dQkyPKC5
   2aghLlSlmNBuxVEUoV2Z93ppH4TFZ0+ZAZSYpF7/a+L2a8o9UMYJy+Q+f
   g==;
X-CSE-ConnectionGUID: PCHyDpyCSRmwZpHqzqjDyw==
X-CSE-MsgGUID: 24fbfIDFQR+7bu8YDRRIpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59624990"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="59624990"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 02:47:50 -0700
X-CSE-ConnectionGUID: NpxynYzHTfWJfZtZqNyrWQ==
X-CSE-MsgGUID: AHAG1jdMRGmJ/7J4oPLZ8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="210194115"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa001.jf.intel.com with SMTP; 09 Sep 2025 02:47:43 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 09 Sep 2025 12:47:42 +0300
Date: Tue, 9 Sep 2025 12:47:42 +0300
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
	Ran Wang <ran.wang_1@nxp.com>, Peter Chen <peter.chen@nxp.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 11/22] usb: typec: tipd: Register DisplayPort and
 Thunderbolt altmodes for cd321x
Message-ID: <aL_3vn7VYiapI3_N@kuha.fi.intel.com>
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
 <20250906-atcphy-6-17-v2-11-52c348623ef6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906-atcphy-6-17-v2-11-52c348623ef6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_024750_338551_C1103C80 
X-CRM114-Status: GOOD (  22.33  )
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

On Sat, Sep 06, 2025 at 03:43:24PM +0000, Sven Peter wrote:
> Ports equipped with a CD321x are only found on Apple Silicon machines
> and always support DisplayPort, Thunderbolt and USB4. Register these
> port modes unconditionally.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tipd/core.c | 85 +++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 82 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index afd11b3e1ae596c7f3283e4336aaa57874c9378d..c7cf936e5a61a331271c05b68ff1b77b89c0f643 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -16,6 +16,8 @@
>  #include <linux/interrupt.h>
>  #include <linux/usb/typec.h>
>  #include <linux/usb/typec_altmode.h>
> +#include <linux/usb/typec_dp.h>
> +#include <linux/usb/typec_tbt.h>
>  #include <linux/usb/role.h>
>  #include <linux/workqueue.h>
>  #include <linux/firmware.h>
> @@ -144,6 +146,7 @@ struct tipd_data {
>  	u64 irq_mask1;
>  	size_t tps_struct_size;
>  	int (*register_port)(struct tps6598x *tps, struct fwnode_handle *node);
> +	void (*unregister_port)(struct tps6598x *tps);
>  	void (*trace_data_status)(u32 status);
>  	void (*trace_power_status)(u16 status);
>  	void (*trace_status)(u32 status);
> @@ -185,6 +188,9 @@ struct cd321x {
>  	struct tps6598x_dp_sid_status_reg dp_sid_status;
>  	struct tps6598x_intel_vid_status_reg intel_vid_status;
>  	struct tps6598x_usb4_status_reg usb4_status;
> +
> +	struct typec_altmode *port_altmode_dp;
> +	struct typec_altmode *port_altmode_tbt;
>  };
>  
>  static enum power_supply_property tps6598x_psy_props[] = {
> @@ -964,6 +970,76 @@ tps6598x_register_port(struct tps6598x *tps, struct fwnode_handle *fwnode)
>  	return 0;
>  }
>  
> +static int cd321x_register_port_altmodes(struct cd321x *cd321x)
> +{
> +	struct typec_altmode_desc desc;
> +	struct typec_altmode *amode;
> +
> +	memset(&desc, 0, sizeof(desc));
> +	desc.svid = USB_TYPEC_DP_SID;
> +	desc.mode = USB_TYPEC_DP_MODE;
> +	desc.vdo = DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | BIT(DP_PIN_ASSIGN_D));
> +	desc.vdo |= DP_CAP_DFP_D;
> +	amode = typec_port_register_altmode(cd321x->tps.port, &desc);
> +	if (IS_ERR(amode))
> +		return PTR_ERR(amode);
> +	cd321x->port_altmode_dp = amode;
> +
> +	memset(&desc, 0, sizeof(desc));
> +	desc.svid = USB_TYPEC_TBT_SID;
> +	desc.mode = TYPEC_ANY_MODE;
> +	amode = typec_port_register_altmode(cd321x->tps.port, &desc);
> +	if (IS_ERR(amode)) {
> +		typec_unregister_altmode(cd321x->port_altmode_dp);
> +		cd321x->port_altmode_dp = NULL;
> +		return PTR_ERR(amode);
> +	}
> +	cd321x->port_altmode_tbt = amode;
> +
> +	return 0;
> +}
> +
> +static int
> +cd321x_register_port(struct tps6598x *tps, struct fwnode_handle *fwnode)
> +{
> +	struct cd321x *cd321x = container_of(tps, struct cd321x, tps);
> +	int ret;
> +
> +	ret = tps6598x_register_port(tps, fwnode);
> +	if (ret)
> +		return ret;
> +
> +	ret = cd321x_register_port_altmodes(cd321x);
> +	if (ret)
> +		goto err_unregister_port;
> +
> +	typec_set_mode(tps->port, TYPEC_STATE_SAFE);
> +
> +	return 0;
> +
> +err_unregister_port:
> +	typec_unregister_port(tps->port);
> +	return ret;
> +}
> +
> +static void
> +tps6598x_unregister_port(struct tps6598x *tps)
> +{
> +	typec_unregister_port(tps->port);
> +}
> +
> +static void
> +cd321x_unregister_port(struct tps6598x *tps)
> +{
> +	struct cd321x *cd321x = container_of(tps, struct cd321x, tps);
> +
> +	typec_unregister_altmode(cd321x->port_altmode_dp);
> +	cd321x->port_altmode_dp = NULL;
> +	typec_unregister_altmode(cd321x->port_altmode_tbt);
> +	cd321x->port_altmode_tbt = NULL;
> +	typec_unregister_port(tps->port);
> +}
> +
>  static int tps_request_firmware(struct tps6598x *tps, const struct firmware **fw,
>  				const char **firmware_name)
>  {
> @@ -1505,7 +1581,7 @@ static int tps6598x_probe(struct i2c_client *client)
>  err_disconnect:
>  	tps6598x_disconnect(tps, 0);
>  err_unregister_port:
> -	typec_unregister_port(tps->port);
> +	tps->data->unregister_port(tps);
>  err_role_put:
>  	usb_role_switch_put(tps->role_sw);
>  err_fwnode_put:
> @@ -1529,7 +1605,7 @@ static void tps6598x_remove(struct i2c_client *client)
>  		devm_free_irq(tps->dev, client->irq, tps);
>  
>  	tps6598x_disconnect(tps, 0);
> -	typec_unregister_port(tps->port);
> +	tps->data->unregister_port(tps);
>  	usb_role_switch_put(tps->role_sw);
>  
>  	/* Reset PD controller to remove any applied patch */
> @@ -1598,7 +1674,8 @@ static const struct tipd_data cd321x_data = {
>  		     APPLE_CD_REG_INT_DATA_STATUS_UPDATE |
>  		     APPLE_CD_REG_INT_PLUG_EVENT,
>  	.tps_struct_size = sizeof(struct cd321x),
> -	.register_port = tps6598x_register_port,
> +	.register_port = cd321x_register_port,
> +	.unregister_port = cd321x_unregister_port,
>  	.trace_data_status = trace_cd321x_data_status,
>  	.trace_power_status = trace_tps6598x_power_status,
>  	.trace_status = trace_tps6598x_status,
> @@ -1615,6 +1692,7 @@ static const struct tipd_data tps6598x_data = {
>  		     TPS_REG_INT_PLUG_EVENT,
>  	.tps_struct_size = sizeof(struct tps6598x),
>  	.register_port = tps6598x_register_port,
> +	.unregister_port = tps6598x_unregister_port,
>  	.trace_data_status = trace_tps6598x_data_status,
>  	.trace_power_status = trace_tps6598x_power_status,
>  	.trace_status = trace_tps6598x_status,
> @@ -1631,6 +1709,7 @@ static const struct tipd_data tps25750_data = {
>  		     TPS_REG_INT_PLUG_EVENT,
>  	.tps_struct_size = sizeof(struct tps6598x),
>  	.register_port = tps25750_register_port,
> +	.unregister_port = tps6598x_unregister_port,
>  	.trace_data_status = trace_tps6598x_data_status,
>  	.trace_power_status = trace_tps25750_power_status,
>  	.trace_status = trace_tps25750_status,
> 
> -- 
> 2.34.1
> 

-- 
heikki

