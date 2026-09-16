Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3564C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 10:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmoapqsTP/x09ZC8Vq70tFPLb6TkdXSkL5FbXgBmNkg=; b=Ehh3g/lm0MCkWGnBJBwSOq0rD6
	WKGqYK51B4mXvyBcXtPfIMoTmfzKNlFqxDDnuF/066IHbK7obq0FBjZ1e4Xwe5icnz2liT0wlUs4O
	cIoP2E0rbmndfS8RQeoNb3eMhpDGG2EK/5IPQPYOhiQOWTLOi18bvzmtq1en68u/qMatQh/RRYqQY
	yLS+8wlTd2eeeV4ZHxDLzQ5ou0ZjJL3VL2k1KtEX2AmQSv5b377v1tGZpMj8JcDBT+bCzPSvzTSOR
	hug1QfGTeBEMADOBCBObp6fTnIpfG/0YViQX8ngbDdA38ZNYDNk7y2Jh10DuWPFju07A9xZAzZ5hD
	3Q4lCcQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6moC-00000008y3G-1vJH;
	Wed, 16 Sep 2026 10:24:08 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mny-00000008xz8-3ueP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 10:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789554235; x=1821090235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=PeVfyJvNsLA4HGK44/YoeVENKrqs3ZCDtZ1Sly+fN/8=;
  b=QLRj44dP+lzFm9iYVC2SPv9txz8TEbyhwkrPgY/lNntkRb8SsOhRcHmo
   isKy4xp5jZ6pAvz9qpyk9LF2GAL0AX2g+qUtx0zn/DcAO8uP2uXcaqT+f
   /ThYODAi3DibevsoULV3kK/14yLupWZnBRdcFrdqOfhDVqqPoThazxo2d
   sLCVilxU4j9KWQO6ADR4P87FkYJCUdxTbQFovQTUelir5W25OTZEYxGNd
   eWhst9frLlA+Eaq4ZrLFrcG+acoj3ZFQph0DAsbKw67oMu6H+UV7MEfuI
   kPrv7qhG2xHFdWXOXXUelTUUuHdhY6dKztvY9hSKUdPLWZJiUyOnYHII4
   A==;
X-CSE-ConnectionGUID: fcRclNrkQX2FvcmV2Pm+Dg==
X-CSE-MsgGUID: SalNyZTLTJKI3D8V0sdgcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93798678"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93798678"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 03:23:54 -0700
X-CSE-ConnectionGUID: zZTsqc9USHyL5sqH2UfPDg==
X-CSE-MsgGUID: 8JRWbhnbR4S5o23MCxAirA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="311581967"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 03:23:48 -0700
Date: Wed, 16 Sep 2026 13:23:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, soc@lists.linux.dev,
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
	Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>,
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 00/15] Ambarella CV75 SoC minimal bring-up
Message-ID: <aqpuMcqbra9i6UDq@ashevche-desk.local>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <CAMRc=McEOcWq8i3B01AR1PnfBzSQaLEaOzE6Qa+QdVXrvS_YrA@mail.gmail.com>
 <CAD++jLnRL_s9zPNkSj2UnHWPx+QHAXV19DA7dEmGZu0AkxxyaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnRL_s9zPNkSj2UnHWPx+QHAXV19DA7dEmGZu0AkxxyaA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_032355_950423_612254CD 
X-CRM114-Status: GOOD (  20.27  )
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

On Wed, Sep 16, 2026 at 11:42:56AM +0200, Linus Walleij wrote:
> On Wed, Sep 16, 2026 at 11:14 AM Bartosz Golaszewski <brgl@kernel.org> wrote:
> > On Tue, 15 Sep 2026 13:15:30 +0200, Long Zhao via B4 Relay
> > <devnull+longzhao.ambarella.com@kernel.org> said:
> > > This series adds minimal Ambarella CV75 support for early bring-up with
> > > a serial console: DT bindings, RCT clocks, pinctrl, PL061 GPIO via
> > > gpio-regmap, 8250_dw UART quirks, ARCH_AMBARELLA, CV75 EVK DT, and
> > > MAINTAINERS.
> > >
> > > This is a single unified series. Please apply via the SoC
> > > tree; subsystem maintainers are Cc'd for their pieces.
> >
> > I would prefer to take the GPIO regmap bits through the GPIO tree and provide
> > an immutable branch to the SoC tree as it has potential for conflicts that
> > early into the cycle.
> 
> Queue them up and send us the IB if you think they are ready!
> 
> Long can probably send a PR based on that IB for the rest to the
> SoC tree, a bit tricksy but it works.

I'm still unsure why we can't use IRQ facility from gpio-regmap.
Can you have a look there?

With that being said, I'm not sure that the patch that exposing gpio_chip
from gpio-regmap is justified.

The whole GPIO rework needs a bit more routine work (resplitting, refactoring,
et cetera), so later we may see clearer what's going on.

-- 
With Best Regards,
Andy Shevchenko



