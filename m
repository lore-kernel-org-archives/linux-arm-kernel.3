Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B19EA4FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 15:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+wWtSAuQMUMoys0T3zHJKlkE1Rj5rIX4YMFnluMz5g=; b=hcukC8hYcDMhq9uJhh4M25PcxE
	m/yC3t5bU/zFTpwON5kycNKcWfbmzUfcuO9UTlxF9lduppWwonaUT+KBoRrIrMGBLN/2F+moBSCS8
	i0W9aY6uEX36lNDrpY4Ns9wN6PdSitDm5LK7+YHKOVRVyC1BLk78dux1iUFFFJRuXMF1Ta/u2OUA/
	YomUGIcmx8S7aNOxK0ii+rCQkVyXrRO6maoSqYLeoCT3jMZZpnh3Hh+Gw2j+l9409RPBn6ZfM61Hk
	8XLvoXqJpTuovMA67Aya//PjMJ4xFnJfM2ImhhGgK009t2WrAvlhqI+8Ql8DSz2HbM4oNICMM65sa
	9QSlUfug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXPj-00000000XK4-0J8z;
	Mon, 23 Feb 2026 14:59:59 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXPf-00000000XJg-22lx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 14:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771858795; x=1803394795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eeWYPc8OuwfwyaVW6aOAdz8XwY93DInoJYhirUrauSw=;
  b=LJRtmgfzDqGxXVoILk3oA63zlovYsjzRMUF6ZSe3h46NVLm5LaKHhcCn
   KzY0OB15H2sqHUb6XObl/GtCAOWN04zNDhDvslQmj9cTBb2Mbbr3XZBHO
   5J31arRG1M7UtXUUGMcQFVSA2oibUQj5eEEhPam1Lt35OxjI5myQ2Gbue
   FVnyIDEBDDo/8EtW/RCHSdD6RoSutfwiHICbSQr+qBWcHf775VNe8781p
   dOBtuvBNzv1A2hP8r7wAvsunNEIfPkX1jb+tTTkgVMxU9I3jCsuYqc22E
   Sns5owarge4zRvU/4YSMCwPyPqfEJS9emZWb6i41o5oZNAm1PlR2LVwHn
   g==;
X-CSE-ConnectionGUID: 7JqNwlOsQFWmS2XcIjVSLw==
X-CSE-MsgGUID: aWVVWaRUTn+L9GEraJ3HwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72732163"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="72732163"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:59:53 -0800
X-CSE-ConnectionGUID: shuSI13fSgCfW9D2/WJiUQ==
X-CSE-MsgGUID: bJFQHpcxSWuxnu5RtOf7iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="214666564"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:59:51 -0800
Date: Mon, 23 Feb 2026 16:59:49 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 3/5] i2c: davinci: calculate bus freq from Hz instead
 of kHz
Message-ID: <aZxrZbbXxm31q62s@smile.fi.intel.com>
References: <20260223-i2c-mux-v7-0-ec75b214718a@gmail.com>
 <20260223-i2c-mux-v7-3-ec75b214718a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-i2c-mux-v7-3-ec75b214718a@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065955_563472_AAC3445A 
X-CRM114-Status: GOOD (  10.04  )
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

On Mon, Feb 23, 2026 at 03:33:52PM +0100, Marcus Folkesson wrote:
> The bus frequency is unnecessarily converted between Hz and kHz in
> several places.
> This is probably an old legacy from the old times (pre-devicetrees)
> when the davinci_i2c_platform_data took the bus_freq in kHz.
> 
> Stick to Hz.

...

> -	clk = ((input_clock / (psc + 1)) / (dev->bus_freq * 1000));
> +	clk = ((input_clock / (psc + 1)) / (dev->bus_freq_hz));

Two pairs too many parentheses!

	clk = (input_clock / (psc + 1)) / dev->bus_freq_hz;

...

> +	dev_dbg(dev->dev, "bus_freq_hz = %dHz\n", dev->bus_freq_hz);

%u ?

-- 
With Best Regards,
Andy Shevchenko



