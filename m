Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D55C79F83
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 11:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k15hnN7udmpZanH1BWHeiOYv5uhgOD9CWICtD7gksog=; b=EhngSMaAd89Tf5BlPMSrg9V9HV
	snd2QcX70ehVevJUDj+etJUTnBRJQa70hpKvk/ZuTged/8Pf8Lb3ymv2NOFP1UwyB/jn+PKHBwsJ3
	N5fT1qVZztE3kPZ4E+vgM6zk913hw1TMX6zX2PAyvxWUr9wPJnTgbldaDK32dU/kNj8aLzQF9NOMF
	KbT+eMeK7kBKZZ9g80bD93wpzxD3gicwSZhGE7/Tl8g9R2irQ/qtV2nRB6nEe+qODAI8N8ZRvTMcE
	EfJGFXYBuFS2vsU/Wcx/pk6f9GfZLMIMVDF9ttbU8BT31a/VZL6LoghuDk5pZhtX+VwwrIuUuiNOJ
	MuKrGRTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SWU-00000001xki-3nXo;
	Fri, 04 Sep 2026 11:55:58 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SWQ-00000001xis-0tYt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 11:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788522954; x=1820058954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SQpI4I09fd14R+BxKv83yrD2WKM66SRsC9Z6WdfEhNU=;
  b=FBD7niyFGUBvRR/kfy0GHYlsX6l5j/utPRm7GtmTSxsLgnDQzURE2w3S
   l6y0aCsOufuBt4hj0L5pooOi31DTXaAcGurouEN1aiBPf6bNJtDc5c1sF
   J7EW8mCE3kOBzUHl9ZSy5On4RRGSmxYmGFNL3i5VbteofRdWBJf6Gjqq+
   FYaiGI3FoZAq5z044fvQKg5PuvwYQNYv2DW5cCsxgeMT7kALPmRXaJUxk
   9jh6Rww3Wo/a7Ot4XY6gX1CG4x5QtAcunwO+tBTU210E6rHHJp/4WPktT
   5AUZ6vQ4Qx46+ZWR/48wiU1XQW9RhJCvy/Z3xSwclPtZYgK1b1USaAlwe
   w==;
X-CSE-ConnectionGUID: slP80BQIQauw0fwehNfZdQ==
X-CSE-MsgGUID: ZIV0AIx6SwSG48Rfe0ICmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100381148"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="100381148"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 04:55:53 -0700
X-CSE-ConnectionGUID: 0yJ5hwEYTn+ZBPfL4jfyNQ==
X-CSE-MsgGUID: DK4Sk+7SSmC/yGDtit4SKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="273548667"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.224])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 04:55:47 -0700
Date: Fri, 4 Sep 2026 14:55:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>,
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 08/13] gpio: regmap: support write_data_after_dir and
 girq
Message-ID: <apqxwRgi-uVKkOpr@ashevche-desk.local>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
 <20260904-cv75-v5-v6-8-e918514cb3b1@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-cv75-v5-v6-8-e918514cb3b1@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_045554_289575_E9DB44E0 
X-CRM114-Status: GOOD (  17.51  )
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

On Fri, Sep 04, 2026 at 02:38:15PM +0800, Long Zhao via B4 Relay wrote:

Thanks for this change, my comments below.

> Add an optional write-after-direction-output quirk for controllers
> that ignore data-register writes while a line is still configured as
> input,

The chips that require this are buggy. Are you going to fix this HW in the next
version of the SoC?

> and allow drivers to pass an existing gpio_irq_chip through
> gpio_regmap_register() so IRQ setup can stay with the caller.

This needs to be in a separate update. Also we need to understand why
it is required. The caller should be able to create the respective IRQ
domain which is important.

...

> struct gpio_regmap {
>  	unsigned int reg_dir_out_base;
>  	unsigned long *fixed_direction_mask;
>  	unsigned long *fixed_direction_output;
> +	bool write_data_after_dir;

Is `pahole` happy with the layout?

>  #ifdef CONFIG_REGMAP_IRQ
>  	int regmap_irq_line;

...

> static int gpio_regmap_direction_output(struct gpio_chip *chip,

>  	gpio_regmap_set(chip, offset, value);

^^^ (see below)

>  
> -	return gpio_regmap_set_direction(chip, offset, true);
> +	ret = gpio_regmap_set_direction(chip, offset, true);
> +	if (ret)
> +		return ret;
> +
> +	/* Some controllers ignore data writes while the line is still an input. */
> +	if (gpio->write_data_after_dir)
> +		gpio_regmap_set(chip, offset, value);

This can lead to two writes to the same register, the above needs to be
conditional as well.

-- 
With Best Regards,
Andy Shevchenko



