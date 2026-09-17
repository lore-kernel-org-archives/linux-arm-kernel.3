Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEA5C982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8s9FB4mkLguoX/MZuaDXebOlC81MYOzJYBSY6urM8Y=; b=O44f2ZRf2jkUJvMvSg/qOwDtwo
	3JFAbP8bzu7icscFEsENKzDVWI5kKRd3nVPP6IQsvOQSSTtTgLv6998QBwfYAn88LR9LzNcP50VRu
	snKe2MKjLVFV4Ik/r4ZeEGplJVNglmRqNjZrEmK6CIlKww8pGrmJH6P11CJjwQyz16lMluFPnH2JZ
	t3eAN2Pb5T7DmrvNT96PHa+NdPDNNhMQWMl6fx4bSUksgY8t2yNQnyNDmUmEUJqZUo3zoSh6skOoS
	jM75c+EqYi9DiHggqQUOX/Uv8H4LVqhRZeQM/QEnyZK316lioqxE3vdyIAPirjhRD/q+wF9O12QN/
	+7IHDm7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7B8J-0000000BHOH-2RDy;
	Thu, 17 Sep 2026 12:22:31 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7B8H-0000000BHNh-1jam
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 12:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789647749; x=1821183749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zo57ptsMztytzJ66q7w7TElsqXFNRm3Xo9NSI9URBfc=;
  b=PMV9O2Dr9S6Hrs6WWnAEzIFUSpoXK/xsojFc1KVe/K84nTuw4tzt2WtK
   OOgjMCKnkaOR6uI8Fb8xa/nZYbXD2gXbuNAsqGM7BjFqg1eskxprsWeca
   SunqKfqioJF0U8insTpxycR7yGTteUJIEVBJ0xw/tepTbMj5EDH+Z0XN4
   Hp28NmtFStCB4GKvBp/aYXNwOi+PZiyqCB/ZgSr8PoE8fdO7kPTwQp6NV
   xV8A8c0qTGjW7CP459CkBCM2zU6mR7NSXnqpPQ8wJNR7g+RrJ4ehipYqG
   EgkiXnbqqSiQI8ShltGWaMCRzs7g2pFs384DJ0E8RBdI6/XJWKcLBJXsJ
   g==;
X-CSE-ConnectionGUID: MVDAIw9eSB+SwBHgpRthWg==
X-CSE-MsgGUID: UhAodhugTiGfY3nZT+zAqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107569075"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107569075"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 05:22:28 -0700
X-CSE-ConnectionGUID: BfjX0q2oSlax1Hx0fa4JPQ==
X-CSE-MsgGUID: C6UIlR4DSgmHmuVzv984bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270450345"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.11])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 05:22:22 -0700
Date: Thu, 17 Sep 2026 15:22:20 +0300
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
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH v7 12/15] pinctrl: ambarella: add CV75 pin controller
Message-ID: <aqvbfCQ6cxfGYJeC@ashevche-desk.local>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <20260915-cv75-v5-v7-12-3297d3fbc9c0@ambarella.com>
 <aqp0VlwWotnuK9t7@ashevche-desk.local>
 <40f1f819.7f85.1a0ae9e4dae.Coremail.zl020895@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40f1f819.7f85.1a0ae9e4dae.Coremail.zl020895@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_052229_465643_B0DE4FBC 
X-CRM114-Status: GOOD (  15.78  )
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

On Thu, Sep 17, 2026 at 05:06:45PM +0800, zl020895 wrote:
> Thanks for the review. The small comments will be in v8,
> including pinconf set via regmap_assign_bits.
> 
> PINCTRL_PINGROUP does not fit here: groups carry
> AMBA_PINMUX(pin, alt), not a pin-number list, so I will keep
> CV75_GROUP.

I didn't get. It takes a pin as a parameter and adds the function on top
of it. It is a combo, but I think it still fits the purpose. Please, use
existing data structure and a macro.

> At 2026-09-16 18:49:58, "Andy Shevchenko" <andriy.shevchenko@linux.intel.com> wrote:
> >On Tue, Sep 15, 2026 at 07:15:42PM +0800, Long Zhao via B4 Relay wrote:

...

> >> +#define AMBA_PINMUX(pin, alt)		(((alt) << 12) | (pin))
> >> +#define AMBA_PINMUX_TO_PIN(mux)		((mux) & 0xfff)
> >> +#define AMBA_PINMUX_TO_ALT(mux)		(((mux) >> 12) & 0x7)
> >> +
> >> +struct amb_pinmux_group {
> >> +	const char *name;
> >> +	const u32 *mux;
> >> +	unsigned int nmux;
> >> +};

^^^ left for the context.


-- 
With Best Regards,
Andy Shevchenko



