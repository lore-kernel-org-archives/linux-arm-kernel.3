Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E9BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 19:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3WIbEaVLTfjHf3FpdkW9n5ZS8PaWn2g4SXwnVVpva4=; b=SlM1mmgVPhPsxrIbDxqAF4TvU2
	ba/RsYimihzVKF8+Xljjo4sbNSJbhgAjRxMT9O3dfclKbm3WODUTXFnOv2L93MnT079E3ITuDKHq/
	Rcq/6GByLWB2Zu3j33BFBK1dzPaOXqk9F1pf8tQlGws2Q0UwUqYnd11tqG6sUauyGm42Doi0Y05JB
	Bni2NMopcTAowLtcZ0rgEexiyghobQJbIhAYlOD+b1MGmKrtGbsdZSPE62nDDyQPFmfktHjzlXXlI
	QDezsbO6nEwid3TnOn2hyqe2huyvLmr34sgQTSqQBpHtnZpJWdpio4hMydngc7vHQ6B5UYLYhbzo1
	MUliUtWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whXyi-00000000GjC-1rad;
	Wed, 08 Jul 2026 19:30:40 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whXyg-00000000Gic-24N3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 19:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783539038; x=1815075038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qAq+ZSPXLg44QlTgS1ix9LoGfl+1op/1FU+72xyaugQ=;
  b=KGTLhf4vNDO0yCEW4eot4EKdNjWpxsphQ56GVIuqW4nOSOIua14O5rja
   mj6C2n0TYqF1t+9D56J0IYS6tAz+e3gdHs1JvsSadqoRqnk8jol/bVMuP
   14m5zFagRMHpzK93z7imamt3L5LU+QfCyHtPxDQyzs68BTikPyKntPbKN
   Ml2SX3kchcvlB/l2R9y1xJNbQIi3VlaUbK0n97mIPN4TcYGBsEsNIDIqa
   2GFT6kzK8E4KybJtYgpMAVbhJV+hF+z113GLFaU5+HAT1B/FXDHXBNDtS
   tum2MYy/M7HEf/sQbLXxFgTalYXTybgX1zEMm9SpdAtmfa8GpTx+8rTAo
   A==;
X-CSE-ConnectionGUID: bQPMOEqQTbeWicChhYUgbw==
X-CSE-MsgGUID: K5Od49xOSEmIIq4qoa2xOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="86759744"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="86759744"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 12:30:37 -0700
X-CSE-ConnectionGUID: B1vqodKVQpqhh0ViXt/yQA==
X-CSE-MsgGUID: ga5rGlrpT2e1FEmaSw3fbA==
X-ExtLoop1: 1
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.100])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 12:30:35 -0700
Date: Wed, 8 Jul 2026 22:30:32 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 4/7] i2c: davinci: calculate bus freq from Hz instead
 of kHz
Message-ID: <ak6lWKWDM8XwqLgw@ashevche-desk.local>
References: <20260708-i2c-mux-v10-0-09dca03c8a15@gmail.com>
 <20260708-i2c-mux-v10-4-09dca03c8a15@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-i2c-mux-v10-4-09dca03c8a15@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_123038_575629_67D55E3F 
X-CRM114-Status: GOOD (  13.64  )
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

On Wed, Jul 08, 2026 at 02:16:16PM +0200, Marcus Folkesson wrote:
> The bus frequency is unnecessarily converted between Hz and kHz in
> several places.
> This is probably an old legacy from the old times (pre-devicetrees)
> when the davinci_i2c_platform_data took the bus_freq in kHz.
> 
> Stick to Hz.

...

> -#define DAVINCI_I2C_DEFAULT_BUS_FREQ	100000
> -

You need to rebase this on top of the i2c-next.

...

> +	/* standard bus frequency */
> +	unsigned int		bus_freq_hz;

While at it, I would dare to suggest _Hz as we started doing in IIO (id est
we start following more closely the SI units in the suffixes of constant
definitions and variables to be case sensitive).

...

>  	r = device_property_read_u32(&pdev->dev, "clock-frequency", &prop);
>  	if (r)
> -		prop = DAVINCI_I2C_DEFAULT_BUS_FREQ;
> +		prop = I2C_MAX_STANDARD_MODE_FREQ;
>  

See above about rebase.

-- 
With Best Regards,
Andy Shevchenko



