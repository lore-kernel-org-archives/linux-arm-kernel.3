Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DF2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 08:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKc9E8mHgmIZ99K/Yl8Ib+dj1S9dXObzgLEVLXXcaLg=; b=XHrEbnVQFnDkJ0bg11G4dQ1/O7
	u+pnix6idQq7YmlyPRAcFFUJwMzLQPtjtGjeap0dU8kn/J6dIAvDP8lOEDGeC+EDzD+pmWLDNRXYb
	VFzp67ddPxswOPjL5b/VZ1OAQuB6PdpwOjGsInYLrNx/qqJCS6iroh5PlwX2DwmgDvIQyZkZ/wWnC
	hoeEFSpSdsh2fp5aPNRSXea1o6sWxhdTlq47BU/QPNcBfrr1mU10pfhLkcRtnFe9SFp7mY9SPqweS
	gi0gsp+G08BvxmfAR03ew28IujXKYq2GRKVoU9c8orBQDtmVxkw6WpIrtrRQ53X76qG6awGeR7cZy
	wkv64Csg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYmB-0000000BLeZ-1c6G;
	Tue, 14 Jul 2026 08:46:03 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYm9-0000000BLdy-0aA5;
	Tue, 14 Jul 2026 08:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784018761; x=1815554761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xxJuEvZ2G5Kbr3szIgk1JdoMkjjna6X5BPLRDG4VrrU=;
  b=ZqPFgdhDtxtjWk8ULljLi5ki6ANd9h7Gulx3fwAEH0WeVm/5hlqPh6ll
   VfjZFthKRNypar6OhE5oT1ZpROmbDi5arAW4TBodNzFf847rz/ZxsbYpk
   DJKAr06+xGZin90zdjrqml1RVoufjBDwrtAq6uAcYokJnTxOcK/Rh/JOf
   zxW8Vrf/beQg6xiSLLn6V2BMi3DwGOMUecbSGv2lf6FPAsjZMIgOCaoe1
   1PjxAS5JsRk12XSc0lKwh/cXluCWvQAIktrGh8MrsCANEuNt80Z0SvoJP
   01lhE9b3DItyzABPOa1q3rT5AQa500MbyCkB75sn+bZp/fjZhDZTRaZO/
   w==;
X-CSE-ConnectionGUID: pXMf/2PpQQ6QIqpos9CEsw==
X-CSE-MsgGUID: FNSFJosrQImE87PszjlQhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="88458779"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="88458779"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:45:55 -0700
X-CSE-ConnectionGUID: qtQ7RAR0TAGtJe+16mkeLA==
X-CSE-MsgGUID: yJiBbxipTXeGeysSoUXSEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="259370157"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:45:52 -0700
Date: Tue, 14 Jul 2026 11:45:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] gpiolib: tolerate gpio-hogs lacking a hogging state
Message-ID: <alX3PLGgoKTgSy_-@ashevche-desk.local>
References: <4c67cf0839ccf57db35a826df6d8fc779531509a.1783974733.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c67cf0839ccf57db35a826df6d8fc779531509a.1783974733.git.daniel@makrotopia.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_014601_193064_0B5E870A 
X-CRM114-Status: GOOD (  20.42  )
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

On Tue, Jul 14, 2026 at 12:30:53AM +0100, Daniel Golle wrote:
> Commit d1d564ec4992 ("gpio: move hogs into GPIO core") made
> gpiochip_add_hog() return -EINVAL for hog nodes lacking any of the
> 'input', 'output-low' or 'output-high' properties. The error is
> propagated by gpiochip_hog_lines() and fails registration of the
> whole GPIO chip.
> 
> The previous OF-specific implementation tolerated such nodes:
> of_parse_own_gpio() warned "no hogging state specified, bailing out"
> and of_gpiochip_add_hog() stopped processing the node without failing
> chip registration.
> 
> Some boards deliberately ship hog nodes without a hogging state in
> their base devicetree and supply the state via overlay, e.g. the PCIe
> slot key selection hogs on the BananaPi R4 Pro added in
> commit e309fa232d12 ("arm64: dts: mediatek: mt7988a-bpi-r4pro: rework
> pcie gpio-hog handling"), as the polarity set in the base devicetree
> could not be overridden from an overlay.
> 
> Booting such a board without an overlay applied now fails to register
> the gpiochip. On the BananaPi R4 Pro this means the MT7988A pinctrl
> device fails to probe, all peripherals including the console UART
> defer forever, and the board finally hangs when clk_disable_unused()
> gates the clocks of the UART still in use by earlycon:
> 
>   gpiochip_add_data_with_key: GPIOs 512..595 (pinctrl_moore) failed to register, -22
>   mt7988-pinctrl 1001f000.pinctrl: error -EINVAL: Failed to add gpio_chip
>   ...
>   clk: Disabling unused clocks
>   (hangs)
> 
> Restore the previous behaviour by warning about hog nodes lacking a
> hogging state and skipping them instead of failing the registration
> of the whole GPIO chip.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> -	if (fwnode_property_present(fwnode, "input"))
> +	if (fwnode_property_present(fwnode, "input")) {
>  		dflags |= GPIOD_IN;
> -	else if (fwnode_property_present(fwnode, "output-low"))
> +	} else if (fwnode_property_present(fwnode, "output-low")) {
>  		dflags |= GPIOD_OUT_LOW;
> -	else if (fwnode_property_present(fwnode, "output-high"))
> +	} else if (fwnode_property_present(fwnode, "output-high")) {
>  		dflags |= GPIOD_OUT_HIGH;

For a fix I would make it less invasive and yes, break the style, by just
replacing

> -	else
> -		return -EINVAL;

with

	else {
		gpiochip_warn(gc, "%pfwP: no hogging state specified, bailing out\n",
			      fwnode);
		return 0;
	}

> +	} else {
> +		gpiochip_warn(gc, "%pfwP: no hogging state specified, bailing out\n",
> +			      fwnode);
> +		return 0;
> +	}

This leads patch directly to the point. The style can be modified later on.

-- 
With Best Regards,
Andy Shevchenko



