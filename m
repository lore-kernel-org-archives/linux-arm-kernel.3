Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAA8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ltJYKu5vBBdVeOMLhjGQdQTTAHldNEHzZRaL7sIwTaE=; b=X2hwRJSYj0oEdGy0BYsLuPb8D6
	vZT2FPAzMHm6h0eKIywpKLfAIYdOnrHS48c3HM2py9WkBnvSYa/Ep8RDtZQj0Z+hwkeNqLG02NzLv
	N08Gll4kzAyea2Z5tbYNqiK7MM4oumSoq2XQPtJd4BI1fTrcycNC0sU9BE6TzDR6yxzJORpxJcfXG
	Usk0xetQqmv6hOJ7vfYI8R146LltEwOr2QRloE90wie1zkRBHI5yCziYpqi3l2yFZL38SD4NV9MEO
	dEa8Ox9wzsLuJVFW++c9QiFZPqBmPX5MV1ag053NxFMQ8DDkZ17IPmCaDISPT4RPRhIkMeBjAb9KN
	P+7VDwOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmNq-000000021vp-3aMU;
	Thu, 09 Jul 2026 10:53:34 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmNm-000000021k4-2mJj;
	Thu, 09 Jul 2026 10:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783594411; x=1815130411;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PvwFawp2iYCKug7OnZ1L1tsF9gscNjwbC5sgQMjyLUA=;
  b=QDuRPSD8Rqfx8wPcKp6OVfoVDvFLjjul8A2RwDt42cVSeBvsF7oYoU5a
   6qdoU4K5UL+coUPadkGI9V/MV226CokdnNik0yz/YO29ZrEcKLtUJBoWE
   wW/lH256Jx/phBU1/BzNSbRHb3xO3azLclkyDMnZtfsf8p5EPu7EKd28F
   D0zWvAJyTO7Szw7Bgf+fiQFOB2qQd3rI/flr6p+1n/ZbiwgiM9GJbc/oC
   LMTqfw08Vbw7hl/5bOhW5tMSMl9enyTXV+a9wIPkLH/wrrUZhvQ5Mm0tn
   Cg7EgsqjysqXGIOtvFu7U9xVqqfrfLbk7d1MZAWSQiIcZNk2NPKVppdNk
   A==;
X-CSE-ConnectionGUID: bK8D+EXIR8C3DLuiO7QFYA==
X-CSE-MsgGUID: 0izMqrgFRpakW8SAZvuQzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87956674"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="87956674"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:53:30 -0700
X-CSE-ConnectionGUID: XV2lQsU2QUK3dikQ6J3nQg==
X-CSE-MsgGUID: PFp2vzNHSaa1nuO8WaAUaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258420526"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:53:24 -0700
Date: Thu, 9 Jul 2026 13:53:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4 09/14] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
Message-ID: <ak99ouEr7n807Ss3@ashevche-desk.local>
References: <20260709095726.704448-1-wenst@chromium.org>
 <20260709095726.704448-10-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709095726.704448-10-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_035330_775008_5A5EC43B 
X-CRM114-Status: GOOD (  35.61  )
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

On Thu, Jul 09, 2026 at 05:57:14PM +0800, Chen-Yu Tsai wrote:
> The new M.2 E-key connector can have a USB connection. For the USB device
> on this connector to work, its power must be enabled and the W_DISABLE2#
> signal deasserted. The connector driver handles this and provides a
> toggle over the power sequencing API.
> 
> This feature currently only supports a directly connected (no mux in
> between) M.2 E-key connector. Existing USB connector types are not
> covered. The USB A connector was recently added to the onboard devices
> driver. USB B connectors have historically been managed by the USB
> gadget or dual-role device controller drivers. USB C connectors are
> handled by TCPM drivers.
> 
> The power sequencing API does not know whether a power sequence provider
> is not needed or not available yet, so we only request it for connectors
> that we know need it, which at this time is just the E-key connector.
> 
> On the USB side, the port firmware node (if present) is tied to the
> usb_port device. This device is used to acquire the power sequencing
> descriptor. This allows the provider to tell the different ports on one
> hub apart.
> 
> This feature is not implemented in the onboard USB devices driver. The
> power sequencing API expects the consumer device to make the request,
> but there is no device node to instantiate a platform device to tie
> the driver to. The connector is not a child node of the USB host or
> hub, and the graph connection is from a USB port to the connector.
> And the connector itself already has a driver.
> 
> Power sequencing is not directly enabled in the connector driver as
> that would completely decouple the timing of it from the USB subsystem.
> It would not be possible for the USB subsystem to toggle the power
> for a power cycle or to disable the port.
> 
> Also rewrite the existing set_bit() and clear_bit() branches with
> assign_bit() to make it cleaner.

...

>  int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
>  			   int port1, bool set)
>  {
> +	struct usb_port *pwrseq_port = hub->ports[port1 - 1];
>  	int ret;
>  
> +	ret = usb_hub_set_port_pwrseq(pwrseq_port, set);
> +	if (ret)
> +		return ret;
> +
>  	if (set)
>  		ret = set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
>  	else
>  		ret = usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
>  
> -	if (ret)
> +	if (ret) {
> +		usb_hub_set_port_pwrseq(pwrseq_port, !set);
>  		return ret;
> +	}

> -	if (set)
> -		set_bit(port1, hub->power_bits);
> -	else
> -		clear_bit(port1, hub->power_bits);
> +	assign_bit(port1, hub->power_bits, set);

I just realised that this change doesn't affect any functionality neither
before nor after the core of this patch. With that being said, I think you
may split this small piece to a separate patch to avoid unneeded churn here.
I will give a tag to that patch immediately I see it.

>  	return 0;
>  }

...

> -	return ret;
> +	/* stub functions return error */
> +	if (!IS_ENABLED(CONFIG_POWER_SEQUENCING))
> +		return ret;
> +
> +	if (!port->pwrseq)
> +		return ret;
> +
> +	return ret && pwrseq_power_is_on(port->pwrseq);

Perhaps

	/* stub functions return error */
	if (IS_ENABLED(CONFIG_POWER_SEQUENCING) && port->pwrseq)
		return ret && pwrseq_power_is_on(port->pwrseq);
	return ret;

? This will also make better visibility of what you meant in the comment
above.

>  }

...

> +static bool port_pwrseq_is_supported(struct usb_port *port_dev)
> +{
> +	struct device *dev = &port_dev->dev;
> +	struct fwnode_handle *port = dev->fwnode;

Use dev_fwnode().

Also it make sense to add a blank line here to keep __free()-defined variables
coupled with the checks (and hence scope).

> +	struct fwnode_handle *ep __free(fwnode_handle) =
> +			fwnode_graph_get_next_port_endpoint(port, NULL);
> +	if (!ep)
> +		return false;
> +
> +	struct fwnode_handle *remote __free(fwnode_handle) =
> +			fwnode_graph_get_remote_port_parent(ep);
> +	if (!remote)
> +		return false;
> +
> +	if (!fwnode_device_is_compatible(remote, "pcie-m2-e-connector")) {
> +		dev_dbg(dev, "remote endpoint %pfw is not a supported connector", remote);
> +		return false;
> +	}
> +
> +	return true;
> +}

-- 
With Best Regards,
Andy Shevchenko



