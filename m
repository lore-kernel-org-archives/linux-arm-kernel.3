Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C19F54AC0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 14:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A78lvZsygbNtsotcBSqd2RuTK8h1T0fmpv7ffpy2mG4=; b=qMx7Gvroph8sf6ql7RW5+0Y68F
	2ULtzex3y7/4Q4usUdIojnnCMwtAmRU/zOqXPxvlriZQbHOHwU4900VXfr34bkA1dRQxVZBemrmO2
	0e1hEBOQb8meB8lvTfqD2+6VUF5OwyGPLwqDKLxkYg23l/NXekwFKFa976TI9DIiQ473XuWVdLIF/
	XMxAB9WYjy+GB0A+DeoZ/qdVnkjwtpx/RBnibHA5UaFRiVH/pC+6PNeEqasnOGvMPMlwU38DBm4LW
	Ge91BwU+X5jggJXucH880fEA8cbeVe1L+VIp9KoE4Xd1VoIJKrFR8mjj+xK7jp50K6r+8NwYSARmI
	h24+EZXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52T5-00000001c6r-1zsG;
	Tue, 24 Mar 2026 14:10:51 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52T3-00000001c5k-0MVu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 14:10:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774361448; x=1805897448;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zwde7jG+zF9qr5SPigLAIwxRSoBCrA0SpkWRrEkdqSo=;
  b=kq2eFQle5EwlKog9Cl3Wvmcfd01/vGf+bg/waMplY2rPrE8hodkV5buB
   XsmTrQJk31277bIqI9Q5lol4KcSxqqSI4maj0raHSt+W4aR4/hTmGljxc
   EcnfFIXp64IoV/pYOtbtSvlJTyRl6dYRcqVeu0nI4dD6FDe0qq1Rjt/oV
   HEn+Mg47LsSsPvZYgVqWQzmfCgeHS8Offfe6N7i7pfhhg1wmBIfwuT+SI
   yT72eFREokavqkhkcqNbBudT9AUHx2ZLI9am7Rp5lV5KYf6AMfL2m9W3Z
   Hp8WGyKWkxK8+7J6Tnb8FH42xaYsSol1FRPgTvAJ87X25pQtustqIwumR
   A==;
X-CSE-ConnectionGUID: YKLRbAgcSoC4X7YtFqdC4w==
X-CSE-MsgGUID: uYcwoV07ToOHbnKOh0evoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="78974105"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="78974105"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 07:10:46 -0700
X-CSE-ConnectionGUID: yBwwehg/RoG+sHw14JK3TQ==
X-CSE-MsgGUID: d5ltkdDNRIm+yGn5KU0M0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="247970109"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 07:10:44 -0700
Date: Tue, 24 Mar 2026 16:10:42 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 2/5] i2c: mux: add support for per channel bus
 frequency
Message-ID: <acKbYhbwZzv2gTnB@ashevche-desk.local>
References: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
 <20260324-i2c-mux-v9-2-5292b0608243@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-i2c-mux-v9-2-5292b0608243@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_071049_202788_E75D8E2C 
X-CRM114-Status: GOOD (  21.96  )
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

On Tue, Mar 24, 2026 at 02:54:16PM +0100, Marcus Folkesson wrote:
> There may be several reasons why you may need to use a certain speed
> on an I2C bus. E.g.
> 
> - When several devices are attached to the bus, the speed must be
>   selected according to the slowest device.
> 
> - Electrical conditions may limit the usable speed on the bus for
>   different reasons.
> 
> With an I2C multiplexer, it is possible to group the attached devices
> after their preferred speed by e.g. putting all "slow" devices on a
> separate channel on the multiplexer.
> 
> Consider the following topology:
> 
>                       .----------. 100kHz .--------.
>     .--------. 400kHz |          |--------| dev D1 |
>     |  root  |--+-----| I2C MUX  |        '--------'
>     '--------'  |     |          |--. 400kHz .--------.
>                 |     '----------'  '-------| dev D2 |
>                 |  .--------.               '--------'
>                 '--| dev D3 |
>                    '--------'
> 
> One requirement with this design is that a multiplexer may only use the
> same or lower bus speed as its parent.
> Otherwise, if the multiplexer would have to increase the bus frequency,
> then all siblings (D3 in this case) would run into a clock speed it may
> not support.
> 
> The bus frequency for each channel is set in the devicetree. As the
> i2c-mux bindings import the i2c-controller schema, the clock-frequency
> property is already allowed.
> If no clock-frequency property is set, the channel inherits their parent
> bus speed.

...

> +		of_property_read_u32(child, "clock-frequency", &priv->adap.clock_hz);

Wondering if we may use existing API to get i2c timings from fw description?
i2c_parse_fw_timings() (it might be that it needs to be split for pure fwnode
one and device wrapped).

> +
> +		/* If the mux adapter has no clock-frequency property, inherit from parent */
> +		if (!priv->adap.clock_hz)
> +			priv->adap.clock_hz = parent->clock_hz;
> +
> +		/*
> +		 * Warn if the mux adapter is not parent-locked as
> +		 * this may cause issues for some hardware topologies.
> +		 */
> +		if ((priv->adap.clock_hz < parent->clock_hz) && muxc->mux_locked)
> +			dev_warn(muxc->dev,
> +				 "channel %u is slower than parent on a non parent-locked mux\n",
> +				 chan_id);
> +
> +		/* We don't support mux adapters faster than their parent */
> +		if (priv->adap.clock_hz > parent->clock_hz) {
> +			dev_err(muxc->dev,
> +				"channel (%u) is faster (%u) than parent (%u)\n",
> +				chan_id, priv->adap.clock_hz, parent->clock_hz);
> +
> +			of_node_put(mux_node);
> +			ret = -EINVAL;
> +			goto err_free_priv;
> +		}

-- 
With Best Regards,
Andy Shevchenko



