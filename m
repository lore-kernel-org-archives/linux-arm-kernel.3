Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DDCC79FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 16:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D0DJn6bhtUde5El/agPjqhhHYLWYhGTtS9+RTZ1Ix2o=; b=SwHrVXPVSZhkQ5fEFHvt7roTAZ
	95/OIwUlKmpsi63NuQDUmfHWyb6Dr2ARLdJaDVktXWnhK96E7Dp2RNS9hYGgj1QsCN0UbGvGzBfZY
	pVfw8C8H5jh4e2n8TuETin3HibrcwnGeyak0lKhstHXg7NU9X3JugEh16zi5sozO4tIlU+mc0fe53
	A9Co02HT5Ikys2EXXhJi6NnIYGLKAsMF9QA6wU3+EKcsnzWMAw4V/+L/X3PA9G+cqmW54RnEUEQWL
	OFDKfyohPvYzIf7N2qwNPmVOI2Aohnv3UVf1eKvrnvfZQFd28dxwU9x83QGCG14BrlqFbnC6T9IUw
	m3AG/Bgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnA5-0000000BhnX-323R;
	Mon, 05 Jan 2026 16:10:31 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnA3-0000000BhnB-1XSw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 16:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767629427; x=1799165427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kzCRFUztXQTIWieGzaPRB5F9NacR2ZhvKHo9n5T7lCs=;
  b=dgQc0b4bkVdYXVUk7Sfz79trgYSNc4RnsHIBQuSZyhsnxODh+tDI0pbL
   Pm6Qqc+F84QfruQ4xUz8iS3xKAk4HWWDV1nL/Tj3kFbvLAV65HYE56cJL
   TCq6RyalR9CyZTkKfDPlCvdsqagGIptLdukZbnzGifjHaMJhP3F7Xi5l5
   IaPSoMURAQ7gLqR8nhsq4Q3kW+9O/YRSJaNAr3orkgZC4uMCCgbqYjaR5
   slCNaSMMM9YHhRsrt+QnyCC3hFPRoeduJIcGDAZjbSjnlEFqK+30V+JKc
   iLAt575Hj/0/ffEEG5vJfmUcngKZn+L/KN9XyibD5VQgFko6ZuKB8Yf5t
   Q==;
X-CSE-ConnectionGUID: gAxWSLgDRX6z7lwixKjpCQ==
X-CSE-MsgGUID: Fc6f1JyZSyqlT6LPs1gjDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="79300047"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="79300047"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 08:10:26 -0800
X-CSE-ConnectionGUID: zs90m1P/T/6PV/+GxPKxMQ==
X-CSE-MsgGUID: 6BWfqYvcS/SbRp4lnJP65w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="202469155"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO kuha) ([10.124.222.12])
  by orviesa008.jf.intel.com with SMTP; 05 Jan 2026 08:10:20 -0800
Received: by kuha (sSMTP sendmail emulation); Mon, 05 Jan 2026 18:10:01 +0200
Date: Mon, 5 Jan 2026 18:10:01 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: amitsd@google.com
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Subject: Re: [PATCH v3 5/5] usb: typec: tcpm/tcpci_maxim: deprecate WAR for
 setting charger mode
Message-ID: <aVvhvuq6Ls1v3B_E@kuha>
References: <20251227-max77759-charger-v3-0-54e664f5ca92@google.com>
 <20251227-max77759-charger-v3-5-54e664f5ca92@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-max77759-charger-v3-5-54e664f5ca92@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_081027_474731_B01EC5E3 
X-CRM114-Status: GOOD (  25.37  )
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

Sat, Dec 27, 2025 at 12:04:25AM +0000, Amit Sunil Dhamne via B4 Relay kirjoitti:
> From: Amit Sunil Dhamne <amitsd@google.com>
> 
> TCPCI maxim driver directly writes to the charger's register space to
> set charger mode depending on the power role. As MAX77759 chg driver
> exists, this WAR is not required.
> 
> Instead, use a regulator interface to source vbus when typec is in
> source power mode. In other power modes, this regulator will be turned
> off if active.
> 
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci_maxim.h      |  1 +
>  drivers/usb/typec/tcpm/tcpci_maxim_core.c | 54 +++++++++++++++++++------------
>  2 files changed, 34 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.h b/drivers/usb/typec/tcpm/tcpci_maxim.h
> index b33540a42a95..b314606eb0f6 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim.h
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim.h
> @@ -60,6 +60,7 @@ struct max_tcpci_chip {
>  	struct tcpm_port *port;
>  	enum contamiant_state contaminant_state;
>  	bool veto_vconn_swap;
> +	struct regulator *vbus_reg;
>  };
>  
>  static inline int max_tcpci_read16(struct max_tcpci_chip *chip, unsigned int reg, u16 *val)
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> index 19f638650796..e9e2405c5ca0 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> @@ -10,6 +10,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/usb/pd.h>
>  #include <linux/usb/tcpci.h>
>  #include <linux/usb/tcpm.h>
> @@ -35,12 +36,6 @@
>   */
>  #define TCPC_RECEIVE_BUFFER_LEN				32
>  
> -#define MAX_BUCK_BOOST_SID				0x69
> -#define MAX_BUCK_BOOST_OP				0xb9
> -#define MAX_BUCK_BOOST_OFF				0
> -#define MAX_BUCK_BOOST_SOURCE				0xa
> -#define MAX_BUCK_BOOST_SINK				0x5
> -
>  static const struct regmap_range max_tcpci_tcpci_range[] = {
>  	regmap_reg_range(0x00, 0x95)
>  };
> @@ -202,32 +197,49 @@ static void process_rx(struct max_tcpci_chip *chip, u16 status)
>  	tcpm_pd_receive(chip->port, &msg, rx_type);
>  }
>  
> +static int get_vbus_regulator_handle(struct max_tcpci_chip *chip)
> +{
> +	if (IS_ERR_OR_NULL(chip->vbus_reg)) {
> +		chip->vbus_reg = devm_regulator_get_exclusive(chip->dev,
> +							      "vbus");
> +		if (IS_ERR_OR_NULL(chip->vbus_reg)) {
> +			dev_err(chip->dev,
> +				"Failed to get vbus regulator handle");
> +			return -ENODEV;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int max_tcpci_set_vbus(struct tcpci *tcpci, struct tcpci_data *tdata, bool source, bool sink)
>  {
>  	struct max_tcpci_chip *chip = tdata_to_max_tcpci(tdata);
> -	u8 buffer_source[2] = {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_SOURCE};
> -	u8 buffer_sink[2] = {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_SINK};
> -	u8 buffer_none[2] = {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_OFF};
> -	struct i2c_client *i2c = chip->client;
>  	int ret;
>  
> -	struct i2c_msg msgs[] = {
> -		{
> -			.addr = MAX_BUCK_BOOST_SID,
> -			.flags = i2c->flags & I2C_M_TEN,
> -			.len = 2,
> -			.buf = source ? buffer_source : sink ? buffer_sink : buffer_none,
> -		},
> -	};
> -
>  	if (source && sink) {
>  		dev_err(chip->dev, "Both source and sink set\n");
>  		return -EINVAL;
>  	}
>  
> -	ret = i2c_transfer(i2c->adapter, msgs, 1);
> +	ret = get_vbus_regulator_handle(chip);
> +	if (ret) {
> +		/*
> +		 * Regulator is not necessary for sink only applications. Return
> +		 * success in cases where sink mode is being modified.
> +		 */
> +		return source ? ret : 1;
> +	}
> +
> +	if (source) {
> +		if (!regulator_is_enabled(chip->vbus_reg))
> +			ret = regulator_enable(chip->vbus_reg);
> +	} else {
> +		if (regulator_is_enabled(chip->vbus_reg))
> +			ret = regulator_disable(chip->vbus_reg);
> +	}
>  
> -	return  ret < 0 ? ret : 1;
> +	return ret < 0 ? ret : 1;
>  }
>  
>  static void process_power_status(struct max_tcpci_chip *chip)
> 
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 

-- 
heikki

