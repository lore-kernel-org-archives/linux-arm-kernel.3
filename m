Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42793C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jg+q0HhdJhAuEMNQ+qV2DCQVL0i+D/hle4eeBlLZtX8=; b=VPtTIUIH13U68q6m7Et2BVQTFL
	pFzfUs1HuEYh6NHx166+qCI/AYFsUlrUbbnSedcqPiuj5YR5f0LAXolyjrieg+7Lj0yTOzU8Py3GC
	u/JXzRyYV7kNo63WKviYq9TXa4WHpYWlDhWl7Flleh3lwq1a70MkB2cKUsIuNK2vHdkSITYFjvOaD
	CtjT6b3HVzrLpJAG6BZ67usffDh5ht9osesl7iEjjAkZgu3s5PKIJJzGaldFsNklSah7Qf5u+UgAI
	O02J2aG+7ylXdbOBRHcAGZmtpOaoFeRR/PY16D9w7BVhtKH+pYjMW+dfaXnmds8dXFAJDdpM7cQZR
	jffMae0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdoI-000000074fq-2HP4;
	Fri, 03 Jul 2026 13:20:02 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdoF-000000074dv-1RAv;
	Fri, 03 Jul 2026 13:20:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783084799; x=1814620799;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KrlLYeQgAxCXAG/ivbQ5uAlbi+6kKNnyK+xS9eeJRo8=;
  b=DF3BciihzxzC6kp79klu/CyeN7u1nhVPW2On1xXda3SeU7AHYFsu4Jsb
   wJDKf/wZmG8TAd7Ka1ssZcQFsSSB5+1U7CxdlEEjc5qMmuG3k/FElDV9F
   6DpY26n9FaMjQFIVX3buPApx01cRot5R+RjGZqNv+7EgACNdmvXLRIN4r
   4bmJsPcqqol7nWaxMt/STa8qydf5aIdsgjPtSQcVjCY1gDc1kQw4JhgM7
   6kQNlBMwcwu/VSt1C5gD9T1/8ojXqy83yjTXl+aoSuMVADKiOfnAEzCJo
   rbTKxPDlQY2R9CW4JcpnT55pPkt46QohwNNB9NRBVA15axscN5cTniIiJ
   A==;
X-CSE-ConnectionGUID: EZNMPkm8TLOfKlUGZ8r8gA==
X-CSE-MsgGUID: IAq56tgFQO6ePwoUhAaAQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83703678"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83703678"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:19:58 -0700
X-CSE-ConnectionGUID: CBioSAPuS22okVwAFtW7iw==
X-CSE-MsgGUID: t/oGYSA2TvC644qNAISfew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="283200657"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.80])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:19:54 -0700
Date: Fri, 3 Jul 2026 16:19:51 +0300
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
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v3 08/13] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
Message-ID: <ake296caIUq0XX8K@ashevche-desk.local>
References: <20260703110317.1283411-1-wenst@chromium.org>
 <20260703110317.1283411-9-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703110317.1283411-9-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_061959_419805_3D6DEF6F 
X-CRM114-Status: GOOD (  31.00  )
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

On Fri, Jul 03, 2026 at 07:03:09PM +0800, Chen-Yu Tsai wrote:
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

> +static int usb_hub_set_port_pwrseq(struct usb_port *port, bool set)

Not sure 'set' in the name is a good choice as you have also parameter 'set',
can be confusing. So for the other one. I don't know enough about pwrseq to
suggest better naming of these parts, but I would like to see some consistency
and less oddity.

> +{
> +	int ret = 0;

Unneeded assignment.

> +	if (set)
> +		ret = pwrseq_power_on(port->pwrseq);
> +	else
> +		ret = pwrseq_power_off(port->pwrseq);
> +
> +	return ret;

Moreover, for now this can be written as

	if (set)
		return pwrseq_power_on(port->pwrseq);

	return pwrseq_power_off(port->pwrseq);

> +}
> +
> +static int usb_hub_restore_port_pwrseq(struct usb_port *port, bool set)
> +{
> +	int ret = 0;

Ditto.

> +	if (set)
> +		ret = pwrseq_power_off(port->pwrseq);
> +	else
> +		ret = pwrseq_power_on(port->pwrseq);
> +
> +	return ret;
> +}

...

> +	port_dev->pwrseq = usb_hub_port_pwrseq_get(port_dev);
> +	if (IS_ERR(port_dev->pwrseq)) {
> +		retval = PTR_ERR(port_dev->pwrseq);
> +		dev_err_probe(&port_dev->dev, retval,
> +			      "failed to get power sequencing descriptor\n");

		retval = dev_err_probe(&port_dev->dev, PTR_ERR(port_dev->pwrseq),
				       "failed to get power sequencing descriptor\n");

> +		goto err_put_kn;
> +	}

-- 
With Best Regards,
Andy Shevchenko



