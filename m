Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88338C982C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQAR28J/9MYs1JBQtzQCnbS9XqpVotVO20f8EF1wSQg=; b=h1TkLPQH7pqarCnEzje0q/oJ+j
	uRwzj2sfvD7FmPFtnnas8mAi3QP1dWWNBurwygNRPP1JFySc0qHw/q6piN+RLEdCHnMy4hYt8Dqv7
	W0VMozzhtjy7+k+hR/pTS0IwhnWX9zM64lOOMzCz0jckkCz0KM3ekNMPa9/8AaDsmt/7ARFTvyJu6
	1AdTa8EeRL5ztWMlvx4ef8wBHGPHrAf7HoVgiDAr3xKmihzmbw1GKFwE7p24m/gFNvcw+KCw+QnDt
	ncJevVAATev4OCyFVgaDjqbrPb6UYBJA7fXyJr+CzTCRdB5jIRXdgCH6YXquRTS/PyUV1NFXHYqzP
	HiK9qEZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rRM-00000009YlJ-2e6t;
	Wed, 16 Sep 2026 15:20:52 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rRK-00000009YkW-0K1x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 15:20:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789572051; x=1821108051;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ABPqlFY+qgVQVQriZmgkEfnyudsflUMPcXg+FS+S01s=;
  b=ZLr7rTLrXSSs97W2yzd9mI4IbmUKZmV4Yt3QpEeY9T5gMLHzgH10jGwG
   2DZwgFpe4qhsediAF88V31X7MMCMvW0187+dloF15JJWlp63uLO2cjA0K
   dDs2uE0NHvPOZO6/WfMUK0M7U/noiFJqDLywvtD0GuTSNR3OgW+asmqGj
   2glPmXsn83FcksoutupZLG5CbThPOWnr3GnVSC/HTzo1l/upZD7msMvQo
   Go1uF1W2UCBRG7A2nfPiNH6QPdaNQgZgZDbYc8hTx5dJtQc/P901w4//Y
   TAj/ymVo+amIbSO2v8KAflXhMWoJ/5cYSLqHewIfk9SnGb2MnDOeYpEDu
   Q==;
X-CSE-ConnectionGUID: /c49hALGTUKFDsfWK4CEPg==
X-CSE-MsgGUID: 7U52kNHwRc+jVcvTsscE1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93653722"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93653722"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:20:50 -0700
X-CSE-ConnectionGUID: JwexR3oJQzatmu4g5LEWDA==
X-CSE-MsgGUID: vFlYH9tyRkangFMS75Q85w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296853472"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:20:43 -0700
Date: Wed, 16 Sep 2026 18:20:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: zl020895 <zl020895@163.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, soc@lists.linux.dev,
	longzhao@ambarella.com,
	Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Re: [PATCH v7 00/15] Ambarella CV75 SoC minimal bring-up
Message-ID: <aqqzyPR-2JKr-2Me@ashevche-desk.local>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <CAMRc=McEOcWq8i3B01AR1PnfBzSQaLEaOzE6Qa+QdVXrvS_YrA@mail.gmail.com>
 <CAD++jLnRL_s9zPNkSj2UnHWPx+QHAXV19DA7dEmGZu0AkxxyaA@mail.gmail.com>
 <aqpuMcqbra9i6UDq@ashevche-desk.local>
 <23d61058.962b.1a0a9e0b355.Coremail.zl020895@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23d61058.962b.1a0a9e0b355.Coremail.zl020895@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_082050_178402_00B58CDE 
X-CRM114-Status: GOOD (  29.41  )
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

On Wed, Sep 16, 2026 at 07:01:10PM +0800, zl020895 wrote:

> ACK: GPIO bits through the GPIO tree, then an IB for the SoC tree.
> I will keep a unified series for now.
> 
> regmap-irq cannot do PL061 type (IS/IBE/IEV, both-edge) plus the
> AMBA chained demux.
> 
> Two options for v8 — Andy, which do you prefer?
>   1) Convert PL061 MMIO to regmap only. Keep the existing gpio_chip
>      and irqchip/girq (double-write stays in the driver). Ambarella
>      layout can be a follow-up on that. No gpio-regmap yet.
> 
>   2) After (1), also move get/set/direction to gpio-regmap. IRQ
>      would stay a custom PL061 irqchip (not regmap-irq). I am not
>      sure we can avoid a way to get the gpio_chip for
>      gpiochip_*_irq() / the chained handler.
> 
> I am leaning to (1) for v8.

I would prefer to see (2) and then we can discuss to roll-back if it looks not
good enough.

Either way your PM runtime support for gpio-regmap is a good change.

> 在 2026-09-16 18:23:45，"Andy Shevchenko" <andriy.shevchenko@linux.intel.com> 写道：
> >On Wed, Sep 16, 2026 at 11:42:56AM +0200, Linus Walleij wrote:
> >> On Wed, Sep 16, 2026 at 11:14 AM Bartosz Golaszewski <brgl@kernel.org> wrote:
> >> > On Tue, 15 Sep 2026 13:15:30 +0200, Long Zhao via B4 Relay
> >> > <devnull+longzhao.ambarella.com@kernel.org> said:
> >> > > This series adds minimal Ambarella CV75 support for early bring-up with
> >> > > a serial console: DT bindings, RCT clocks, pinctrl, PL061 GPIO via
> >> > > gpio-regmap, 8250_dw UART quirks, ARCH_AMBARELLA, CV75 EVK DT, and
> >> > > MAINTAINERS.
> >> > >
> >> > > This is a single unified series. Please apply via the SoC
> >> > > tree; subsystem maintainers are Cc'd for their pieces.
> >> >
> >> > I would prefer to take the GPIO regmap bits through the GPIO tree and provide
> >> > an immutable branch to the SoC tree as it has potential for conflicts that
> >> > early into the cycle.
> >> 
> >> Queue them up and send us the IB if you think they are ready!
> >> 
> >> Long can probably send a PR based on that IB for the rest to the
> >> SoC tree, a bit tricksy but it works.
> >
> >I'm still unsure why we can't use IRQ facility from gpio-regmap.
> >Can you have a look there?
> >
> >With that being said, I'm not sure that the patch that exposing gpio_chip
> >from gpio-regmap is justified.
> >
> >The whole GPIO rework needs a bit more routine work (resplitting, refactoring,
> >et cetera), so later we may see clearer what's going on.

-- 
With Best Regards,
Andy Shevchenko



