Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1FACA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4yFqRwlD/ssxTOeIfkqh08Zu6B0X/AzsCNBrNwQp7U=; b=P7XDjPp9SuL4YC/8fyDA64CNPP
	z+gHisMCSP+SoNrtWcMXiu+y7nchb/KqGxUM3JjNLEdotdrfPOhbFCLIZ4/n50ElPDkE0ofwhmULf
	NkHHqq9JzdIFaFVteQ/Q81+g03LD6wJFVdFrpdI20MkSmnymYsqcLq9dllxHrHCjdd6LYG3tFfRQ2
	bCuKvNWCChupMawQQZZd6QuM5CAbrLw0Wa85002612ZlwK7IAAyQDHg4iDIxkaR5Ima7cbEC4YUOg
	OgjCW4B7c+UoD11ev7HzMdSKmZFJ3oz5swg2kKkHQrXFO8hUP6ErH10klJ6vZMJL6dQO1Ky414yL7
	5mkOsLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYYt-00000002pKP-0wza;
	Fri, 05 Sep 2025 15:41:15 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuUK5-00000001HUd-077f;
	Fri, 05 Sep 2025 11:09:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757070581; x=1788606581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7m/86o3yQ77TEdGSH2MiSbmes09C1SQZCM+n87rz7fg=;
  b=btMw55hjbBZs6N/QPh47X4FjGcefjA4z+UmuZG5jcrM9XXjd9jbsgQhg
   Z4RnK8wP1i0w8bSypqZ/FNU45tFfqXIqPyeROlII+vrOiBUIrzSU+8Ihr
   Tj4hDO+aiuRpI+AlazFkxh32nMHnegT9D4z7o+SKCbnAHpoqS5f9wILkO
   J46UbmxS7BUcpZpPsw7drfPk3axRm3hKsL/zv/ETEAXUUDryykI07+rc8
   Enpu91XHMzTdWk+WMYUjM2vYXXDbhB5baCAjBXjclz4COsZMff9B7514V
   dZpvhJ9808hJAtpS/RDB92In2lZ49Sg8FC0kPZLnZ1XlM2js2Jh8EoBwo
   g==;
X-CSE-ConnectionGUID: EAgunRp4QZugi/uh/sisLA==
X-CSE-MsgGUID: /rxvIjHPRc6SAJetvlog8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="58454998"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="58454998"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 04:09:40 -0700
X-CSE-ConnectionGUID: Q+k0m8w6TqGxOoJFGC8I5g==
X-CSE-MsgGUID: NcHeEyL0SVK7RRDj8ZOf7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="202960490"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa002.jf.intel.com with SMTP; 05 Sep 2025 04:09:35 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 05 Sep 2025 14:09:34 +0300
Date: Fri, 5 Sep 2025 14:09:34 +0300
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
Subject: Re: [PATCH RFC 10/22] usb: typec: tipd: Move switch_power_state to
 tipd_data
Message-ID: <aLrE7uzHH-ZloOWS@kuha.fi.intel.com>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
 <20250821-atcphy-6-17-v1-10-172beda182b8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-atcphy-6-17-v1-10-172beda182b8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_040941_113025_CB228C7F 
X-CRM114-Status: GOOD (  21.20  )
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

On Thu, Aug 21, 2025 at 03:39:02PM +0000, Sven Peter wrote:
> When support for CD321x was originally added no other hardware variant
> was supported and there was no need for struct tipd_data. Now that it
> exists move the special case in there so that we can drop the
> of_device_is_compatible_check entirely.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tipd/core.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 6d8bcbc9cad8a1394e066504d4c5ca570edd4e4f..4815c5c462837865a5f9d37bbc139249c82c2f75 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -118,6 +118,7 @@ struct tipd_data {
>  	void (*trace_status)(u32 status);
>  	int (*apply_patch)(struct tps6598x *tps);
>  	int (*init)(struct tps6598x *tps);
> +	int (*switch_power_state)(struct tps6598x *tps, u8 target_state);
>  	int (*reset)(struct tps6598x *tps);
>  };
>  
> @@ -1293,7 +1294,6 @@ tps25750_register_port(struct tps6598x *tps, struct fwnode_handle *fwnode)
>  
>  static int tps6598x_probe(struct i2c_client *client)
>  {
> -	struct device_node *np = client->dev.of_node;
>  	struct tps6598x *tps;
>  	struct fwnode_handle *fwnode;
>  	u32 status;
> @@ -1331,18 +1331,16 @@ static int tps6598x_probe(struct i2c_client *client)
>  	if (i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
>  		tps->i2c_protocol = true;
>  
> -	if (np && of_device_is_compatible(np, "apple,cd321x")) {
> -		/* Switch CD321X chips to the correct system power state */
> -		ret = cd321x_switch_power_state(tps, TPS_SYSTEM_POWER_STATE_S0);
> -		if (ret)
> -			return ret;
> -
> -	}
> -
>  	tps->data = i2c_get_match_data(client);
>  	if (!tps->data)
>  		return -EINVAL;
>  
> +	if (tps->data->switch_power_state) {
> +		ret = tps->data->switch_power_state(tps, TPS_SYSTEM_POWER_STATE_S0);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	/* Make sure the controller has application firmware running */
>  	ret = tps6598x_check_mode(tps);
>  	if (ret < 0)
> @@ -1525,6 +1523,7 @@ static const struct tipd_data cd321x_data = {
>  	.trace_status = trace_tps6598x_status,
>  	.init = cd321x_init,
>  	.reset = cd321x_reset,
> +	.switch_power_state = cd321x_switch_power_state,
>  };
>  
>  static const struct tipd_data tps6598x_data = {
> 
> -- 
> 2.34.1
> 

-- 
heikki

