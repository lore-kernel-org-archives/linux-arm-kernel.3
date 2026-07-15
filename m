Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10779C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yoSrRSKif73YSb2a5jGtKpARnUijvX8usQsu2PfcH/w=; b=yhg/tWYB37sea/24BwqA/aw36n
	bgOtQY5C4zmI/vCtpJBjBErbR40EACXPsEZ/5tS/AXZ8G0aUWnJ/8z3XX9DfsOKhVLd2QXG1o9haU
	knztaBPNBzauiSRAmfkUCDNN5D3UPoIT4Yy7LHKLbltH/x6Pi7H5MxLn6IumHCD6LLJ9fKMPqDPUo
	VUfjYpRtNHtYJAW1UO5HKA4ZK7yPGlZ2KngfM4TgGFRDjkNk7SDuoi0R9yhYAr7sNaxITavIPssDb
	BtK/ATOThY0BckJ+5E++HKzzvcZBlAeAFhs0qSB4jFCewItFKjkNA6GWh/96s2MyqIhqBWwImfM2x
	KL6WMW8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzcB-0000000EwMu-2fc4;
	Wed, 15 Jul 2026 13:25:31 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzc8-0000000EwLA-3Xvm;
	Wed, 15 Jul 2026 13:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784121929; x=1815657929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FoJio/rVwDwRIkKJBPFy4VQTYHNnMkd8RIsGPHmXYtU=;
  b=iCq6MiM6nn2AeLFK6OdwsJdOFMnlX+WY9pnlFHFqfhwnJ8ZcgSf+X4cg
   p0EfxQ//JjeDT/UrQADlffD2F4iICH30ANU+2ekCs/6yMO/HP51GhbFdz
   OU1reXn25uNMthXeEFBQRTVp+VUmihqqg8Oxogr9ipe4xQgY3fzRO62hX
   v1aRm1jGC7iRgApwiF4b5SwBaoD6v+MAE04FWmXRl6dZZmAdSq8RAxpXq
   d+hgbqjdm336zFswdjKxprjp8gdBhqytjlQnDBVovf7a51xz2DHiHSmJW
   QWsDQ6x2OSJhU4dcKfDrwgs5j4bXNHJAOErneQc3i+A1CfFl5mUlobrcz
   A==;
X-CSE-ConnectionGUID: cLvsFzlNS3249MLgiZ10Dg==
X-CSE-MsgGUID: 4DeZuXXwRr2INUj6xzn0dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88661396"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="88661396"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 06:25:28 -0700
X-CSE-ConnectionGUID: 9Wz6tj6iT3aKtxwO1JLjGw==
X-CSE-MsgGUID: 7GiJrNRMTn+eeKAn9h7sFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="258139844"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.129])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 06:25:22 -0700
Date: Wed, 15 Jul 2026 16:25:20 +0300
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
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 10/16] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
Message-ID: <aleKQKH2V-ck-SX6@ashevche-desk.local>
References: <20260715085348.3457359-1-wenst@chromium.org>
 <20260715085348.3457359-11-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715085348.3457359-11-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_062528_980506_996C9E54 
X-CRM114-Status: GOOD (  29.56  )
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

On Wed, Jul 15, 2026 at 04:53:40PM +0800, Chen-Yu Tsai wrote:
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

...

> static void usb_port_device_release(struct device *dev)

>  	fwnode_handle_put(dev_fwnode(dev));
> +	/* usb_hub_create_port_device() could leave an error value */
> +	if (!IS_ERR(port_dev->pwrseq))
> +		pwrseq_put(port_dev->pwrseq);

Hmm... I would rather make pwrseq_put() NULL and error pointer-aware, so
it will be no-op in such cases. But I think Bart has his own opinion about
this.

>  	kfree(port_dev->req);
>  	kfree(port_dev);
>  }

>  		put_device(&port_dev->dev);
> +		hub->ports[port1 - 1] = NULL;
>  		return retval;
>  	}

...

> int usb_hub_create_port_device(struct usb_hub *hub, int port1)

> +	port_dev->pwrseq = usb_hub_port_pwrseq_get(port_dev);
> +	if (IS_ERR(port_dev->pwrseq)) {
> +		retval = dev_err_probe(&port_dev->dev, PTR_ERR(port_dev->pwrseq),
> +				       "failed to get power sequencing descriptor\n");
> +		goto err_put_kn;

OTOH, how pwrseq can be non-NULL and at the same time port be created?

> +	}

-- 
With Best Regards,
Andy Shevchenko



