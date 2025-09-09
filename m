Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD153CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQlodsQ7D10HyiL8kofWE+gF1jwaEZI79SJcHGpg5BY=; b=hJIO9Fv3pvqfeMC9JNrxw5TANj
	hsK9vyx9zJ0TDYDKK5ZKqOBYIhpJTW6EQISAXLsvL2ZlNLyMc/X1fJ31ImODEXpd7r/3q2bUs5bjC
	WWnCoej16Apy6OZHIZVWn+x5OagicZpjN/tqGvERjkprb93vgcXdMLHD6BnDMu09Yhs7+lTcsOi5n
	V8/zpDcIVphAzDEr4t8UCr2SBsgVzWnT+T/yvJODKhjU1wnfd11C3IGNYcEe6ZXJRh5OAq86hNgNM
	QXw7a7OpbMya+AmufdEtpd2Mkx6eoJz+x3I0xvAZaE1XnYv5uQtfgRE0sOiik5E70LdkJ9Dkz3KBD
	ZeRgO+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0RY-000000089Y7-0red;
	Tue, 09 Sep 2025 15:39:40 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuqz-000000064D0-0RVD;
	Tue, 09 Sep 2025 09:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757410893; x=1788946893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iDZvQAjGdFONOD0C7BJifOhr90vJwi4Gs1ZMg3jQOdU=;
  b=RCmWOH5GBiouh61tzjqzaw0d8dPCL9TK6Tm97vP7dXKcXSU8NZuAKnjI
   TW6PPATpgeLIFn7ELfvbzibmuFP5iN22jezwUOBRK9CN4UJ4tmU29f2je
   99gTXjPD6PMHTAREaedVTk6gh92QZC4HTrvoleLsKgobhTpyCvwK2miN0
   6O4v6yGUAwc5adcfVXzWVY7MmPZHb7rktCtOSzbkAIcMfLGY3MxUe6Tqo
   rn462MfXh1KBcKkqG2ZAxSTPJITX2DBSIxOOMpT+eGWLJeTajJnv9mMV0
   c7ADXt58MAPX5kazK5HB2/3zqkZ+fhV2x6gLxBk2dvVba2qDqN6rU4+J3
   g==;
X-CSE-ConnectionGUID: idXvpGQgTo2xB4pyQ5bF2g==
X-CSE-MsgGUID: sllUGolUR6auNCGFG7LLXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="62315390"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="62315390"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 02:41:32 -0700
X-CSE-ConnectionGUID: y4y1TQowQ3WfYBEL7QqmVw==
X-CSE-MsgGUID: A6PAWP7WSNC5vsBA9uaY2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="173163265"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa008.jf.intel.com with SMTP; 09 Sep 2025 02:41:25 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 09 Sep 2025 12:41:23 +0300
Date: Tue, 9 Sep 2025 12:41:23 +0300
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
Subject: Re: [PATCH v2 10/22] usb: typec: tipd: Read USB4, Thunderbolt and
 DisplayPort status for cd321x
Message-ID: <aL_2Q6obeQdYZuHE@kuha.fi.intel.com>
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
 <20250906-atcphy-6-17-v2-10-52c348623ef6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906-atcphy-6-17-v2-10-52c348623ef6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_024133_166301_3FD9A8D8 
X-CRM114-Status: GOOD (  23.02  )
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

On Sat, Sep 06, 2025 at 03:43:23PM +0000, Sven Peter wrote:
> CD321x supports various alternate modes and stores information once
> these are entered into separate status registers. Read those when they
> are active when reading TPS_DATA_STATUS to prepare supporting these.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tipd/core.c | 80 ++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 76 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 51b0f3be8b66a743ddc3ea96c1b25f597a1e8f6c..afd11b3e1ae596c7f3283e4336aaa57874c9378d 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -35,14 +35,18 @@
>  #define TPS_REG_INT_MASK2		0x17
>  #define TPS_REG_INT_CLEAR1		0x18
>  #define TPS_REG_INT_CLEAR2		0x19
> -#define TPS_REG_SYSTEM_POWER_STATE	0x20
>  #define TPS_REG_STATUS			0x1a
> +#define TPS_REG_SYSTEM_POWER_STATE	0x20
> +#define TPS_REG_USB4_STATUS		0x24
>  #define TPS_REG_SYSTEM_CONF		0x28
>  #define TPS_REG_CTRL_CONF		0x29
>  #define TPS_REG_BOOT_STATUS		0x2D
>  #define TPS_REG_POWER_STATUS		0x3f
>  #define TPS_REG_PD_STATUS		0x40
>  #define TPS_REG_RX_IDENTITY_SOP		0x48
> +#define TPS_REG_CF_VID_STATUS		0x5e
> +#define TPS_REG_DP_SID_STATUS		0x58
> +#define TPS_REG_INTEL_VID_STATUS	0x59
>  #define TPS_REG_DATA_STATUS		0x5f
>  #define TPS_REG_SLEEP_CONF		0x70
>  
> @@ -85,6 +89,31 @@ struct tps6598x_rx_identity_reg {
>  	struct usb_pd_identity identity;
>  } __packed;
>  
> +/* TPS_REG_USB4_STATUS */
> +struct tps6598x_usb4_status_reg {
> +	u8 mode_status;
> +	__le32 eudo;
> +	__le32 unknown;
> +} __packed;
> +
> +/* TPS_REG_DP_SID_STATUS */
> +struct tps6598x_dp_sid_status_reg {
> +	u8 mode_status;
> +	__le32 status_tx;
> +	__le32 status_rx;
> +	__le32 configure;
> +	__le32 mode_data;
> +} __packed;
> +
> +/* TPS_REG_INTEL_VID_STATUS */
> +struct tps6598x_intel_vid_status_reg {
> +	u8 mode_status;
> +	__le32 attention_vdo;
> +	__le16 enter_vdo;
> +	__le16 device_mode;
> +	__le16 cable_mode;
> +} __packed;
> +
>  /* Standard Task return codes */
>  #define TPS_TASK_TIMEOUT		1
>  #define TPS_TASK_REJECTED		3
> @@ -121,6 +150,7 @@ struct tipd_data {
>  	int (*apply_patch)(struct tps6598x *tps);
>  	int (*init)(struct tps6598x *tps);
>  	int (*switch_power_state)(struct tps6598x *tps, u8 target_state);
> +	bool (*read_data_status)(struct tps6598x *tps);
>  	int (*reset)(struct tps6598x *tps);
>  };
>  
> @@ -151,6 +181,10 @@ struct tps6598x {
>  
>  struct cd321x {
>  	struct tps6598x tps;
> +
> +	struct tps6598x_dp_sid_status_reg dp_sid_status;
> +	struct tps6598x_intel_vid_status_reg intel_vid_status;
> +	struct tps6598x_usb4_status_reg usb4_status;
>  };
>  
>  static enum power_supply_property tps6598x_psy_props[] = {
> @@ -505,6 +539,41 @@ static bool tps6598x_read_data_status(struct tps6598x *tps)
>  	return true;
>  }
>  
> +static bool cd321x_read_data_status(struct tps6598x *tps)
> +{
> +	struct cd321x *cd321x = container_of(tps, struct cd321x, tps);
> +	int ret;
> +
> +	ret = tps6598x_read_data_status(tps);
> +	if (ret < 0)
> +		return false;
> +
> +	if (tps->data_status & TPS_DATA_STATUS_DP_CONNECTION) {
> +		ret = tps6598x_block_read(tps, TPS_REG_DP_SID_STATUS,
> +				&cd321x->dp_sid_status, sizeof(cd321x->dp_sid_status));
> +		if (ret)
> +			dev_err(tps->dev, "Failed to read DP SID Status: %d\n",
> +				ret);
> +	}
> +
> +	if (tps->data_status & TPS_DATA_STATUS_TBT_CONNECTION) {
> +		ret = tps6598x_block_read(tps, TPS_REG_INTEL_VID_STATUS,
> +				&cd321x->intel_vid_status, sizeof(cd321x->intel_vid_status));
> +		if (ret)
> +			dev_err(tps->dev, "Failed to read Intel VID Status: %d\n", ret);
> +	}
> +
> +	if (tps->data_status & CD321X_DATA_STATUS_USB4_CONNECTION) {
> +		ret = tps6598x_block_read(tps, TPS_REG_USB4_STATUS,
> +				&cd321x->usb4_status, sizeof(cd321x->usb4_status));
> +		if (ret)
> +			dev_err(tps->dev,
> +				"Failed to read USB4 Status: %d\n", ret);
> +	}
> +
> +	return true;
> +}
> +
>  static bool tps6598x_read_power_status(struct tps6598x *tps)
>  {
>  	u16 pwr_status;
> @@ -565,7 +634,7 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
>  			goto err_unlock;
>  
>  	if (event & APPLE_CD_REG_INT_DATA_STATUS_UPDATE)
> -		if (!tps6598x_read_data_status(tps))
> +		if (!tps->data->read_data_status(tps))
>  			goto err_unlock;
>  
>  	/* Handle plug insert or removal */
> @@ -614,7 +683,7 @@ static irqreturn_t tps25750_interrupt(int irq, void *data)
>  			goto err_clear_ints;
>  
>  	if (event[0] & TPS_REG_INT_DATA_STATUS_UPDATE)
> -		if (!tps6598x_read_data_status(tps))
> +		if (!tps->data->read_data_status(tps))
>  			goto err_clear_ints;
>  
>  	/*
> @@ -688,7 +757,7 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
>  			goto err_unlock;
>  
>  	if ((event1[0] | event2[0]) & TPS_REG_INT_DATA_STATUS_UPDATE)
> -		if (!tps6598x_read_data_status(tps))
> +		if (!tps->data->read_data_status(tps))
>  			goto err_unlock;
>  
>  	/* Handle plug insert or removal */
> @@ -1534,6 +1603,7 @@ static const struct tipd_data cd321x_data = {
>  	.trace_power_status = trace_tps6598x_power_status,
>  	.trace_status = trace_tps6598x_status,
>  	.init = cd321x_init,
> +	.read_data_status = cd321x_read_data_status,
>  	.reset = cd321x_reset,
>  	.switch_power_state = cd321x_switch_power_state,
>  };
> @@ -1550,6 +1620,7 @@ static const struct tipd_data tps6598x_data = {
>  	.trace_status = trace_tps6598x_status,
>  	.apply_patch = tps6598x_apply_patch,
>  	.init = tps6598x_init,
> +	.read_data_status = tps6598x_read_data_status,
>  	.reset = tps6598x_reset,
>  };
>  
> @@ -1565,6 +1636,7 @@ static const struct tipd_data tps25750_data = {
>  	.trace_status = trace_tps25750_status,
>  	.apply_patch = tps25750_apply_patch,
>  	.init = tps25750_init,
> +	.read_data_status = tps6598x_read_data_status,
>  	.reset = tps25750_reset,
>  };

-- 
heikki

