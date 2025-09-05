Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB18CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdaK+CiJGzdySnlLKuyuZTS4mHBENmCfRDcYHX4HFJY=; b=qs5rkExnkKov0BA2pQpiznSi2w
	11WTu3phP+0zEQMD+7zue6qtTVH8V/ASyB0khTLpdfjNgHUhAsZBLZTbPX03+PNk3OSs3AwETTuP4
	Z7kBfVASYqg2aEav18dSbQgexsWSCe9m0zwEZbaC9MozGHpMJrH7AkItG2apKup5lf+xqZ/oW5hiS
	SpWWv5VnYlWpEz7FnHg96D5+QwouuU6IptDqrlgA5Rd9yiVtH/1ICZdx4yt9k5iZuh/r4RrMeKW1U
	1NqCdcRyubwTIjb5INXamT65ox57pKgxohCaYT+Z2JEx78mBqKsihEh9lJgw3gT1DAuIbeQsybxQe
	6L0fn+uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXZQ-00000002Pcv-3EJg;
	Fri, 05 Sep 2025 14:37:44 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuULd-00000001HsZ-1vbS;
	Fri, 05 Sep 2025 11:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757070677; x=1788606677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e3FFZ9M28JOKjXef3qHP2L1uivU/Fe9ONzkw3ESelJI=;
  b=YPXzv7bUj0UT1J/tNHtl2zONMGzPB57zLjVfupLslTCs2KT4dy80XYyl
   nJLNDoXZUhE/V972VZeu07BrDnkiQL7SVk+D+h2j3/lfhHmKTahXCDTv8
   8JvV5pzfytt45MTJzJRc9CZmkIRewndOlgPd5s2zPpYApCBd/ON10Iej7
   QsQjzEd4QJkF1w6EjeAUFCKe9PpkYSduv4s7ijQ4ll/BC+tTkrAfiN6ka
   C2NRLArfEEBl8j+lhNQakbfweFdF26deZ2J9YLWxZnGQq2cAR9oI2jqgX
   S77t6QOQWZOAamGljLtCGv4AI/Bbnl8sGrMv+86JFEPRO842V4qVLiob/
   A==;
X-CSE-ConnectionGUID: Z7SJWb0eQhOnws4e56jrQA==
X-CSE-MsgGUID: JhIqfmYnSriC1zdsDZxatA==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="76875206"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="76875206"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 04:11:15 -0700
X-CSE-ConnectionGUID: GjV0dPcYQ9GdWGAmsow5ZA==
X-CSE-MsgGUID: AUQ0hFHAQtyqf31xDwLKbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="209318232"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa001.jf.intel.com with SMTP; 05 Sep 2025 04:11:10 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 05 Sep 2025 14:11:08 +0300
Date: Fri, 5 Sep 2025 14:11:08 +0300
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
Subject: Re: [PATCH RFC 11/22] usb: typec: tipd: Trace data status for CD321x
 correctly
Message-ID: <aLrFTF6bBPgWUoMd@kuha.fi.intel.com>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
 <20250821-atcphy-6-17-v1-11-172beda182b8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-atcphy-6-17-v1-11-172beda182b8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_041117_549205_5BBD57DC 
X-CRM114-Status: GOOD (  20.36  )
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

On Thu, Aug 21, 2025 at 03:39:03PM +0000, Sven Peter wrote:
> Some bits inside the CD321x TPS_DATA_STATUS register have a different
> function compared to the original tipd chip. Add these and introduce a
> separate trace function to show them correctly.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tipd/core.c     |  8 +++++++-
>  drivers/usb/typec/tipd/tps6598x.h |  5 +++++
>  drivers/usb/typec/tipd/trace.h    | 39 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 4815c5c462837865a5f9d37bbc139249c82c2f75..19d713937870304e68325a441b0de63eb5db3b80 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -114,6 +114,7 @@ struct tipd_data {
>  	irq_handler_t irq_handler;
>  	u64 irq_mask1;
>  	int (*register_port)(struct tps6598x *tps, struct fwnode_handle *node);
> +	void (*trace_data_status)(u32 status);
>  	void (*trace_power_status)(u16 status);
>  	void (*trace_status)(u32 status);
>  	int (*apply_patch)(struct tps6598x *tps);
> @@ -492,7 +493,9 @@ static bool tps6598x_read_data_status(struct tps6598x *tps)
>  		dev_err(tps->dev, "failed to read data status: %d\n", ret);
>  		return false;
>  	}
> -	trace_tps6598x_data_status(data_status);
> +
> +	if (tps->data->trace_data_status)
> +		tps->data->trace_data_status(data_status);
>  
>  	return true;
>  }
> @@ -1519,6 +1522,7 @@ static const struct tipd_data cd321x_data = {
>  		     APPLE_CD_REG_INT_DATA_STATUS_UPDATE |
>  		     APPLE_CD_REG_INT_PLUG_EVENT,
>  	.register_port = tps6598x_register_port,
> +	.trace_data_status = trace_cd321x_data_status,
>  	.trace_power_status = trace_tps6598x_power_status,
>  	.trace_status = trace_tps6598x_status,
>  	.init = cd321x_init,
> @@ -1532,6 +1536,7 @@ static const struct tipd_data tps6598x_data = {
>  		     TPS_REG_INT_DATA_STATUS_UPDATE |
>  		     TPS_REG_INT_PLUG_EVENT,
>  	.register_port = tps6598x_register_port,
> +	.trace_data_status = trace_tps6598x_data_status,
>  	.trace_power_status = trace_tps6598x_power_status,
>  	.trace_status = trace_tps6598x_status,
>  	.apply_patch = tps6598x_apply_patch,
> @@ -1545,6 +1550,7 @@ static const struct tipd_data tps25750_data = {
>  		     TPS_REG_INT_DATA_STATUS_UPDATE |
>  		     TPS_REG_INT_PLUG_EVENT,
>  	.register_port = tps25750_register_port,
> +	.trace_data_status = trace_tps6598x_data_status,
>  	.trace_power_status = trace_tps25750_power_status,
>  	.trace_status = trace_tps25750_status,
>  	.apply_patch = tps25750_apply_patch,
> diff --git a/drivers/usb/typec/tipd/tps6598x.h b/drivers/usb/typec/tipd/tps6598x.h
> index cecb8d11d23972dab0d8c15458b4052af7510b03..03edbb77bbd6d8093b2560db83e5913e25d06154 100644
> --- a/drivers/usb/typec/tipd/tps6598x.h
> +++ b/drivers/usb/typec/tipd/tps6598x.h
> @@ -197,6 +197,11 @@
>  #define TPS_DATA_STATUS_FORCE_LSX	     BIT(23)
>  #define TPS_DATA_STATUS_POWER_MISMATCH	     BIT(24)
>  
> +/* modified TPS_REG_DATA_STATUS bits for CD321x (and likely also TPS65987DDK) */
> +#define CD321X_DATA_STATUS_HPD_IRQ	     BIT(14)
> +#define CD321X_DATA_STATUS_HPD_LEVEL	     BIT(15)
> +#define CD321X_DATA_STATUS_USB4_CONNECTION   BIT(23)
> +
>  #define TPS_DATA_STATUS_DP_PIN_ASSIGNMENT_MASK GENMASK(11, 10)
>  #define TPS_DATA_STATUS_DP_PIN_ASSIGNMENT(x) \
>  	TPS_FIELD_GET(TPS_DATA_STATUS_DP_PIN_ASSIGNMENT_MASK, (x))
> diff --git a/drivers/usb/typec/tipd/trace.h b/drivers/usb/typec/tipd/trace.h
> index bea383f2db9de5bbf1804fbad9ee6b134407b932..e9e40425138a01f15e35867f38f62e13623dbcec 100644
> --- a/drivers/usb/typec/tipd/trace.h
> +++ b/drivers/usb/typec/tipd/trace.h
> @@ -217,6 +217,26 @@
>  		{ TPS_DATA_STATUS_FORCE_LSX,		"FORCE_LSX" }, \
>  		{ TPS_DATA_STATUS_POWER_MISMATCH,	"POWER_MISMATCH" })
>  
> +#define show_cd321x_data_status_flags(data_status) \
> +	__print_flags(data_status & TPS_DATA_STATUS_FLAGS_MASK, "|", \
> +		{ TPS_DATA_STATUS_DATA_CONNECTION,	"DATA_CONNECTION" }, \
> +		{ TPS_DATA_STATUS_UPSIDE_DOWN,		"DATA_UPSIDE_DOWN" }, \
> +		{ TPS_DATA_STATUS_ACTIVE_CABLE,		"ACTIVE_CABLE" }, \
> +		{ TPS_DATA_STATUS_USB2_CONNECTION,	"USB2_CONNECTION" }, \
> +		{ TPS_DATA_STATUS_USB3_CONNECTION,	"USB3_CONNECTION" }, \
> +		{ TPS_DATA_STATUS_USB3_GEN2,		"USB3_GEN2" }, \
> +		{ TPS_DATA_STATUS_USB_DATA_ROLE,	"USB_DATA_ROLE" }, \
> +		{ TPS_DATA_STATUS_DP_CONNECTION,	"DP_CONNECTION" }, \
> +		{ TPS_DATA_STATUS_DP_SINK,		"DP_SINK" }, \
> +		{ CD321X_DATA_STATUS_HPD_IRQ,		"HPD_IRQ" }, \
> +		{ CD321X_DATA_STATUS_HPD_LEVEL,		"HPD_LEVEL" }, \
> +		{ TPS_DATA_STATUS_TBT_CONNECTION,	"TBT_CONNECTION" }, \
> +		{ TPS_DATA_STATUS_TBT_TYPE,		"TBT_TYPE" }, \
> +		{ TPS_DATA_STATUS_OPTICAL_CABLE,	"OPTICAL_CABLE" }, \
> +		{ TPS_DATA_STATUS_ACTIVE_LINK_TRAIN,	"ACTIVE_LINK_TRAIN" }, \
> +		{ CD321X_DATA_STATUS_USB4_CONNECTION,	"USB4" }, \
> +		{ TPS_DATA_STATUS_POWER_MISMATCH,	"POWER_MISMATCH" })
> +
>  #define show_data_status_dp_pin_assignment(data_status) \
>  	__print_symbolic(TPS_DATA_STATUS_DP_SPEC_PIN_ASSIGNMENT(data_status), \
>  		{ TPS_DATA_STATUS_DP_SPEC_PIN_ASSIGNMENT_E, "E" }, \
> @@ -388,6 +408,25 @@ TRACE_EVENT(tps6598x_data_status,
>  		    )
>  );
>  
> +TRACE_EVENT(cd321x_data_status,
> +	TP_PROTO(u32 data_status),
> +	TP_ARGS(data_status),
> +
> +	TP_STRUCT__entry(
> +			 __field(u32, data_status)
> +			 ),
> +
> +	TP_fast_assign(
> +		       __entry->data_status = data_status;
> +		       ),
> +
> +	TP_printk("%s%s%s",
> +		  show_cd321x_data_status_flags(__entry->data_status),
> +		  __entry->data_status & TPS_DATA_STATUS_DP_CONNECTION ? ", DP pinout " : "",
> +		  maybe_show_data_status_dp_pin_assignment(__entry->data_status)
> +		)
> +);
> +
>  #endif /* _TPS6598X_TRACE_H_ */
>  
>  /* This part must be outside protection */
> 
> -- 
> 2.34.1
> 

-- 
heikki

