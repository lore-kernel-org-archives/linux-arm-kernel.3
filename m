Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A01C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 09:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9RuMLXtXdNxf8kKBQAx4rQj1YQxi4fWQAeXn6Q3mP8=; b=PgfwSRZdSdQ0K5BFo32YNt4+hB
	GhyMTxwpmohbqQi4DRu5+5Gs0Rphz77Piab9tSQMAAI2ZDvMclwPwmq5MgKwrmDtu3MvfvFZzzA1t
	++eccOmgZYo7I6tj8vZ5HPqCbpnDGUDcjb1ca1UdN69Bhr7UDS7l6BlMG+3f9i2RxyvmTv8DWXMz1
	AD+FGij6f2FK1ZQbLjfFnqGendzJKKr0xmIaO5w4MQaQO8K4jGi9IWo6Ms6zMDzvCmIbJj9YA4P5Y
	Dmgwlre1rdNqwOXgIlmUzmzqr62/GbAJHr9jvRU0ivQGKwK8VPJ8KaohucVlpRUAwuNSnKzZE5oEe
	fn//V3MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4b6o-0000000DtFU-2Qy7;
	Thu, 10 Sep 2026 09:30:18 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4b6l-0000000DtED-425h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 09:30:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789032616; x=1820568616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uRqstXESvREbE7sgABus3VPsikH/WGsWpiYKC8RGfyc=;
  b=m849NaLZ6sxQ5gBpvzjfBGt2DwyvTsOson0htAtAHUSG5PcjEhEoXv4I
   EgoOrvnOPgNQO2qnZKnjlXffuuVwhNTqR9xWr6fE6I0o2kPq4p/Q+k5xO
   O/2rkGKbNeUTwJ/YfOVl1v3apI/w/ywmaf3D+t2PBZSZYc6b5xynqzqjn
   tOMu03LL7hsavOxwDurtnYNEL1wgkU/urhTBOAiwgkECHchh/2ENGZ5qX
   OQRHYKsQaSd2SepuhThowH8xYm5DqvK/FxxBWCuaxbE6MciO6e+himMXu
   RtGTkAa+kkQ41wmQCyAKk6TFUu6Nu346qgZgapZLLtwfs32M/Es4+wnqd
   g==;
X-CSE-ConnectionGUID: +I3zYxtvQdO9EvZh24SUgg==
X-CSE-MsgGUID: X305HP3lRWqpYxLYnw2qyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89319709"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89319709"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 02:30:15 -0700
X-CSE-ConnectionGUID: lCnUWz4jQ8CM6GL6fh/4ZA==
X-CSE-MsgGUID: 9Om9URfuRdabHB7tU3BG+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="271089393"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 02:30:09 -0700
Date: Thu, 10 Sep 2026 12:30:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: zl020895 <zl020895@163.com>
Cc: longzhao@ambarella.com, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
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
	Will Deacon <will@kernel.org>, Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: Re: [PATCH v6 08/13] gpio: regmap: support
 write_data_after_dir and girq
Message-ID: <aqJ4n43eYYochJl4@ashevche-desk.local>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
 <20260904-cv75-v5-v6-8-e918514cb3b1@ambarella.com>
 <apqxwRgi-uVKkOpr@ashevche-desk.local>
 <27a1901.423e.1a07a183bd4.Coremail.zl020895@163.com>
 <ap5BgWtHMAxl28wF@ashevche-desk.local>
 <6ca46138.9970.1a07b6abb25.Coremail.zl020895@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ca46138.9970.1a07b6abb25.Coremail.zl020895@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_023016_039574_969981A8 
X-CRM114-Status: GOOD (  28.56  )
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

On Mon, Sep 07, 2026 at 06:29:47PM +0800, zl020895 wrote:

> Thanks for the bxtwc pointer.
> 
> I looked at mapping PL061 onto regmap-irq. Status/mask/ack (MIS/IE/IC)
> could fit, but PL061 still needs the chained demux plus IS/IBE/IEV type
> programming (including EDGE_BOTH) and the existing gpiochip immutable
> helpers. That looks like a poor fit versus idi-48/bxtwc-style chips, and
> switching the long-standing ARM PL061 path from chained to threaded
> regmap-irq seems risky.
> 
> What I plan for the next round (without extending gpio-regmap with girq):
> keep the custom irqchip + chained handler, create the irq_domain in
> gpio-pl061, and pass it via config.irq_domain to gpio-regmap.
> 
> Does that match what you had in mind, or do you still prefer a
> regmap-irq-based approach?

Okay, let's continue with this approach. Just make sure the commit message
covers the choice made (explains why GPIO IRQ chip is customised).

> At 2026-09-07 12:45:53, "Andy Shevchenko" <andriy.shevchenko@linux.intel.com> wrote:
> >On Mon, Sep 07, 2026 at 12:20:03PM +0800, zl020895 wrote:
> >
> >> > Are you going to fix this HW in the next version of the SoC?
> >> No — Ambarella does not use write_data_after_dir. It only preserves the
> >> existing ARM PL061 quirk already documented in gpio-pl061 (data writes
> >> ignored while the pin is still an input). Only pl061_arm sets the flag.
> >
> >Ah, this is a good news!
> >
> >In any case when documenting that flag, please also mention that any new HW
> >should not use it as it's considered buggy (glitches during direction change
> >are guaranteed).
> >
> >> I will also make the first gpio_regmap_set() conditional so the quirk
> >> path writes once after direction_output, not twice.
> >
> >I see that original pl061 actually writes twice. TBH I don't know the best
> >effort here and if it's really required to do so. Probably others have
> >better ideas...
> >
> >> > This needs to be in a separate update. Also we need to understand why
> >> > it is required.
> >> OK, girq will be a separate patch. PL061 keeps a custom chained
> >> irqchip (not regmap-irq); gpio_regmap today only takes irq_domain or
> >> regmap_irq_chip, so we passed girq to keep the usual gpio_irq_chip +
> >> gpiochip_add flow. Open to using a caller-created irq_domain instead if
> >> you prefer.
> >
> >If there is a chained IRQ, look how PMIC drivers usually do similar setups.
> >First what comes to my mind is drivers/mfd/intel_soc_pmic_bxtwc.c.

-- 
With Best Regards,
Andy Shevchenko



