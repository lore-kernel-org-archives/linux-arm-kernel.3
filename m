Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9C0C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 08:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6GrpfcVe1ZE2msYePbwt9AXEqp6vDJFjGcIXkRFEYs=; b=ueAamZxD/ZsstCLkSx5tSRYHtg
	RyUf4GDbMr+kTLn5nT1at4XBpUCAhoFat4Jz2joK3yUSf4SqF2Yf2C5a5NYwc0RQ6RlqKuKlAUOiN
	uiuhgoHCwadDqM8Cjc+sPTKIrjmRf1BAWlOJxhn9fRRUdZmCMOSnfcZRYMUHncqPcArhuX9sntCSp
	VY87VweExDtWlIDSggv7Wy4mGvy717llgWEoNVigJHrmOGC1phesinNtyH7zP8vUv5YCoTBC8/P2+
	4QlQOrrYB/v2aRUYBz1Rn/Mmr02j0M4CkcGqqC1JhWx7fvyszDrL2ldxALu3kmIpzhvMh0TlQofJd
	gyIx4GXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6dg-000000004zM-1UgZ;
	Mon, 28 Sep 2026 08:23:08 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6dd-000000004ys-43TT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 08:23:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790583786; x=1822119786;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1wocS/8MUk0c5FYoePcc+sCMjbYoo1qq/BetZNUrGpM=;
  b=juf4vuDPmyPMIdgOEjzEWiOrM06u4M1HiM0H7X14x7lBdAqoAeW6ns7s
   HAAFGZ93oRlaQ9oChZDSzfixWI/BKtE+Pc4XYEE7JiCPoipyZXEFfPybf
   c4tGS0RfPd4rz573Z41ANlrquewt9vkzHyeiUcMmQYr7yfoZ9oKVhHqdL
   6HcT3PAzpMAlGekDELKsPW9I44pZmRkDXYFH2AGDDTU73T1ILKQPOBoZe
   /UBYQDBGNk+8I9g1yVdrK6FCTD6qfHDIUcXV/CMNLvH7DrJz3vhwftpdO
   SybgDSJWyi91MLYtXsDYP0yR26oZpS54HqKfFBDVvkbo/p1GaEAY4/WY/
   Q==;
X-CSE-ConnectionGUID: V2Y8/USnTTKa+myKhF2jXQ==
X-CSE-MsgGUID: Yy3f1+uQRlGLQ6KwfxR5vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="108765979"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="108765979"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 01:23:05 -0700
X-CSE-ConnectionGUID: U0XgYB7cQzujYAq8DGQ0OQ==
X-CSE-MsgGUID: WlXpRSZvTRSRmYdNxQYmvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="274220575"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.42])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 01:23:02 -0700
Date: Mon, 28 Sep 2026 11:22:59 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Weigang He <geoffreyhe2@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] iio: adc: xilinx-ams: fix out-of-bounds accesses when
 parsing channels
Message-ID: <aroj4-Wag_kxuBxH@ashevche-desk.local>
References: <20260926055456.3289189-1-geoffreyhe2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926055456.3289189-1-geoffreyhe2@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_012306_020179_014E86FF 
X-CRM114-Status: GOOD (  18.35  )
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

On Sat, Sep 26, 2026 at 03:54:56PM +1000, Weigang He wrote:
> ams_parse_firmware() allocates room for ARRAY_SIZE(ams_ps_channels) +
> ARRAY_SIZE(ams_pl_channels) + ARRAY_SIZE(ams_ctrl_channels) = 51
> channel specs and lets ams_init_module() fill them for the AMS node and
> each of its children, without telling it how much room is left.
> 
> For the PL-SYSMON node, ams_get_ext_chan() appends one channel per
> "channel@N" child after the 10 fixed PL channels. The binding allows
> reg values 20..50, so a PL node can have up to 31 such children, i.e.
> up to 41 PL channels, while only 31 are budgeted for it. Together with
> the 13 PS and 7 AMS control channels, this writes past the end of the
> buffer. Since the modules are filled in device tree order, the fixed
> channel blocks copied after the PL node can overflow as well.
> 
> ams_get_ext_chan() also only checks the upper bound of reg. ext_chan is
> unsigned, so a reg below 20 makes it wrap and ams_pl_channels[] is read
> far out of bounds.
> 
> Pass the remaining capacity down to ams_init_module() and
> ams_get_ext_chan() and fail with -EINVAL when a module does not fit,
> instead of writing past the buffer. Also reject reg values below 20, as
> the binding requires.
> 
> Found by static analysis tool CodeQL.

...

>  	fwnode_for_each_child_node(chan_node, child) {

It seems better to switch to _scoped() variant at some point.

>  		ret = fwnode_property_read_u32(child, "reg", &reg);
> -		if (ret || reg > AMS_PL_MAX_EXT_CHANNEL + 30)
> +		if (ret || reg < 30 - AMS_PL_MAX_FIXED_CHANNEL ||
> +		    reg > AMS_PL_MAX_EXT_CHANNEL + 30)
>  			continue;
>  
> +		if (num_channels >= max_channels) {
> +			fwnode_handle_put(child);
> +			return -EINVAL;

-ECHRNG

> +		}

...

>  	if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams-ps")) {
> +		if (max_channels < ARRAY_SIZE(ams_ps_channels))
> +			return -EINVAL;

ENOSPC?

...

>  	} else if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams-pl")) {
> +		if (max_channels < AMS_PL_MAX_FIXED_CHANNEL)
> +			return -EINVAL;

Ditto.

...

>  	} else if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams")) {
> +		if (max_channels < ARRAY_SIZE(ams_ctrl_channels))
> +			return -EINVAL;

Ditto.

-- 
With Best Regards,
Andy Shevchenko



