Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33C3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 12:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RuUQ330Wqy0+ts8WmIurUgrhiRmcX3sIxVlWL9Prdqg=; b=dUr6Kc+y+pFZ3w+rmwCYvWUJCu
	FmDkVBrk+TlHkhJ2l+Ilqq9cn9wMLw6eO1JFXaee0JuSAE/X8c7IXg2yKr36Hmx9mHj03nWma2yRQ
	djK4HRiHvQwNir6Ji31n0pb6+g6Po1cEmYLzuyIHxzxb/WTfytEvXqvuSaBK3ScKykcCCUNRKZoVV
	XB2kL9r9oJY3COiNjOY/LRGLb/5JkUgC9qW+L1MuwPmFCvHAEcMCqF/cqI5t6QBUIFH5MLqnuHg2J
	BoGzI6KefLSSwBfQJ2zpfSLwSdnRIwXjSgsDRF9MwQSi+IqbW4xkZl5ZIBDDUw0cmz+BUog8OqDNA
	uA6PMTrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdSJ-000000071Nz-2OY3;
	Fri, 03 Jul 2026 12:57:19 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdSH-000000071NV-1UPe;
	Fri, 03 Jul 2026 12:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783083438; x=1814619438;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QqusrYjfaWkybx2fPqLba4i2Sxky75V7VYsL+SP5Rao=;
  b=SJi8YBQuqR1Zz+Z1Ji1EJDcKTlJK2+G5+iqab8RT/c0kSpQ6WCv0fI6u
   XJdpBYFsKtTjOBDLGhgIWktXiInNhmYun6xa+0cEt/wY/qnEa1ZP2vikt
   MLTUb+Hpu7mt5nY6npFxzHxih1nllsmU4NW99eQ9F+9R1C8O8Ds7tm2aP
   yY882c0/ePRXzH/RJS3X2cnZY4klOFdWfhrArIT7NTIQLkOObXjYQnj5n
   /l1+XzBal1Ogpd1vbUPq66SI64NXaDZ+2tpb6T9oIZUwSGq2eUjeDVwkj
   a0V7U9fjFPxmkLRz7fbB0RbzDUNRu13BsGnZxmuHleKdyHFtCXZsATRFa
   w==;
X-CSE-ConnectionGUID: /hWI3JHHTeCIqqm7ptqtKA==
X-CSE-MsgGUID: w6qIhjN4RfCDOvH8T+Hw6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83819183"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83819183"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 05:57:16 -0700
X-CSE-ConnectionGUID: fWi3FGauSZCt5t0+ix7MsA==
X-CSE-MsgGUID: zg506o79Sd21UCgCUHNsyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="277436452"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.80])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 05:57:10 -0700
Date: Fri, 3 Jul 2026 15:57:08 +0300
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
Subject: Re: [PATCH v3 10/13] power: sequencing: pcie-m2: support matching on
 remote "port" node
Message-ID: <akexpAPFMD4zNlvx@ashevche-desk.local>
References: <20260703110317.1283411-1-wenst@chromium.org>
 <20260703110317.1283411-11-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703110317.1283411-11-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_055717_432692_510F9F97 
X-CRM114-Status: GOOD (  15.89  )
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

On Fri, Jul 03, 2026 at 07:03:11PM +0800, Chen-Yu Tsai wrote:
> A USB hub can have multiple ports, and this driver needs to
> differentiate which port is being matched to. The USB hub driver now
> associates the "port" node with the usb_port device, so here we can
> use the remote "port" node to check for a match. Then fall back to
> the remote device node for the other connection types.
> 
> Also rewrite the existing "remote == dev_of_node(dev)" with
> device_match_of_node() for consistency.

...

>  	for_each_endpoint_of_node(ctx->of_node, endpoint) {
> +		/* USB port devices are tied to the port nodes. */
> +		struct device_node *remote_port __free(device_node) =
> +				of_graph_get_remote_port(endpoint);
> +
> +		if (remote_port && device_match_of_node(dev, remote_port))

Dup NULL check. _match_of_node() already does that and it seems follows
the same logic here. So dropping it should not change how it functions.

> +			return PWRSEQ_MATCH_OK;
> +
> +		/* Try the remote port parent for other types. */
>  		struct device_node *remote __free(device_node) =
>  				of_graph_get_remote_port_parent(endpoint);
> -		if (remote && (remote == dev_of_node(dev)))
> +
> +		if (remote && device_match_of_node(dev, remote))

Ditto.

>  			return PWRSEQ_MATCH_OK;
>  	}

-- 
With Best Regards,
Andy Shevchenko



