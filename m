Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B52EDF150
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 11:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPV8vkxVPmu0M11QzmGtgneg1BkMf5g6BBylqxDR6pQ=; b=wYALelWEMuQTlhp4uLVhs8MPmQ
	7j4l13qPDXR+x2v0SEn+/gs9hY4qrINekqFDR2xKgrW85l0HMjTM+rLYk7KrL5ajlnKbUQSJnz0Mm
	W6/Et+jP1/F/5w826zwq1ox5LvOzMeQnedhf2NnkdoT/gTUU9yW4d3cZl4ihibCY3M4y9xSe24abv
	gD2OpK8vzLEIZ20Y9S/I+S9vF0BIUD/r5PK09nXu69CHUhog0Sye0wX+Jp30uUnESRDp42SsKRyIS
	hhAAVhDBmE82c3UUINtacEFKwKB0/k13vQcQ+qyburxighDs3tvaEE4AgnW9xVQIeCOi7xSCdb1PZ
	fVaEtDpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqr7l-00000003Nq6-0Xga;
	Fri, 13 Feb 2026 11:14:13 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqr7i-00000003Nph-17yo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 11:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770981250; x=1802517250;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+8aBZJqxJhqCJZ7eoqLEz+sX3tjpS03I8vQECstrgo8=;
  b=efB8R4LNddqDemeK4FlRv3EAfqBX8tKLjnn73t8DsVToOzaHySddkoxQ
   /88xghJYm1MtFe5K8XNDfoQLXYxz8A8aYGSJDHjjELkmhXT/IG5RJCjOZ
   HlctaJfHjv30bgrnC8VPi+4B/m5raVZRKD631wI9Y4OGABgqFZMWdUR+/
   yApo72mc2ffFNZu+IlwzZArWXVqCuPNnXRp0R2epaNt2FitquOxm1BpoA
   6Z5jaMbpkcB4ewkMCR+C4C4fAApwC7oAsEppec6HaVHTJli3yydwjBiF+
   xKehCah+D3FZuT3eu4vNeaIfzBLMTmb/d4TuhF36ui/nzafMjy4BdOAiN
   A==;
X-CSE-ConnectionGUID: vtbRtSWWTVKy8Nw7q7ZjrA==
X-CSE-MsgGUID: LrFrgR+oRsSX8c1W98B6wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="59736398"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="59736398"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 03:14:08 -0800
X-CSE-ConnectionGUID: jZ8rbkQGR/yPUGqsWkTfOg==
X-CSE-MsgGUID: Qow4PsEwRXi7vWUXA83rOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="217438803"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 13 Feb 2026 03:14:06 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id D2B3595; Fri, 13 Feb 2026 12:14:04 +0100 (CET)
Date: Fri, 13 Feb 2026 12:14:04 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/5] i2c: core: add callback to change bus frequency
Message-ID: <aY8HfN3c3qcVbOJj@black.igk.intel.com>
References: <20260213-i2c-mux-v5-0-fb2cbf9979b3@gmail.com>
 <20260213-i2c-mux-v5-1-fb2cbf9979b3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260213-i2c-mux-v5-1-fb2cbf9979b3@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_031411_660993_3D1740AF 
X-CRM114-Status: GOOD (  15.43  )
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

On Fri, Feb 13, 2026 at 12:06:50PM +0100, Marcus Folkesson wrote:
> All devices on the same I2C bus share the same clock line and the bus
> frequency has therefor be chosen so that all attached devices are able
> to tolarate that clock rate. IOW, the bus speed must be set for the
> slowest attached device.
> 
> With I2C multiplexers/switches on the other hand, it would be possible
> to have different "domains" that runs with different speeds.
> 
> Prepare for such a feature by provide an optional callback function to
> change bus frequency.

...

> struct i2c_adapter {

> +	int clock_hz;

Why signed? Even inconsistent with the parameter of the below.

> +	int (*set_clk_freq)(struct i2c_adapter *adap, u32 clock_hz); /* Optional */

It's already a huge struct, can we make this compile-time chosen
(when I²C muxes are not required, for example)?

...

> +static inline int
> +i2c_adapter_set_clk_freq(struct i2c_adapter *adapter, u32 clock_hz)
> +{
> +	int ret = -EOPNOTSUPP;
> +
> +	if (adapter->set_clk_freq)
> +		ret = adapter->set_clk_freq(adapter, clock_hz);
> +
> +	return ret;

The 'ret' is redundant and can be dropped completely. This makes the function
2LoCs shorter.

> +}

-- 
With Best Regards,
Andy Shevchenko



