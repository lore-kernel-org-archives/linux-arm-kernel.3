Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0F6C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 20:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cf+x+QhP9+T6qpZ/kRwo+J/ZbagVFUc8JxO3jhmbkLA=; b=ni3lyoIlxkhiBeC50WTYGZHqoJ
	5v3j/GBzeCvg8t/3r0GfmCsALF2byY3ZM/itvgB9BjggpxoWEWio0gLjPoNVIovmL/Z8pwWp6ND9G
	gBjxJbUwmffUeFO0bpiP+8z8xK05AVQrL6lQN1ETt8uOgcxkyaWm38SKUETh8R1xBvJCpg2rDlIgT
	xlk4ifYplpJSuvFAE0RkGoqtxTsKbUoB0bLA+F7n/9TGxOppMRXGrskDxz5w5c+RLXaCQ2xvZCYpj
	0UfJ08jjDPyehDPlgTtBXBnSXcH8riglde2wuAz61KEw8lGEy6Rp5g+wPWHblWqXtjIecEScCzsbE
	APgYu78A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws4ek-00000006euR-0xBF;
	Thu, 06 Aug 2026 20:25:34 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws4eg-00000006eoF-40dD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 20:25:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786047931; x=1817583931;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CP3wHDYVhQB60zwjDHpFdYkgmzJXwfa0mm+U0jmkRRM=;
  b=DLj3oVoyy0305D+jWzwk9S7iX/Jekk9Tu0NZwOE9hyOZSo/KKlQNrqaO
   6/W6MWDrhm7PaHACXLnOnGVkFso2Z5HBzFnkJha5suRwC27p0pNOUv9yr
   f0RlBykro/zWAyU0r78dOPB9dCE2wmUGnjbdni8nPLu3mqRxP1DY6K3pU
   lrAvR0d+xefM01Ss9FfjnPV4JBa2PqOS/qzlToaA73AvNX5aIDo2gz7yd
   y+UwIAd1IlcnML1kz9VBqm3LgFzRX/6FkWisl7T4JzAXwCLcsnBVYUyYM
   kqVZr2DzuSSXO2uBA+ukLq5zFeHvC05BjYEYgRq4qOkqY7TznuOX/uGcA
   g==;
X-CSE-ConnectionGUID: BCR8V7h9TUqDxRO9rvrwNg==
X-CSE-MsgGUID: 0Zu2Nc9ETKumVs7QOGzOfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97303697"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="97303697"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 13:24:56 -0700
X-CSE-ConnectionGUID: xOBKRLieTniids7AZV1SsA==
X-CSE-MsgGUID: 5gh4RNyoSUeuiy0J+nFmkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="258875949"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 13:24:53 -0700
Date: Thu, 6 Aug 2026 23:24:51 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Shih-Yuan Lee (FourDollars)" <fourdollars@debian.org>
Cc: Mark Brown <broonie@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 6/7] spi: pxa2xx: restore LPSS private register state
 on S3 resume
Message-ID: <anTtk2ilyFLDeGLi@ashevche-desk.local>
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-7-fourdollars@debian.org>
 <al5-JasTYF5r8A-j@ashevche-desk.local>
 <CAAT15mM_5t9YuEsEKN8UkJh_AoY_PPVkstVujdBM6QJpq7O0=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAT15mM_5t9YuEsEKN8UkJh_AoY_PPVkstVujdBM6QJpq7O0=g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_132531_004043_E8878057 
X-CRM114-Status: GOOD (  20.11  )
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

On Sun, Jul 26, 2026 at 07:48:27PM +0800, Shih-Yuan Lee (FourDollars) wrote:

...

> > Is this series AI-assisted?

> Yes, I used an LLM assistant to help format and polish the commit messages.
> However, all hardware register analysis (such as inspecting BAR0 +
> 0x204 LPSS Private Resets), DSDT ACPI overrides, schematic
> verifications for logic board 820-00244-A, and physical S3
> suspend/resume hardware testing on MacBook8,1 were performed
> empirically on real hardware.

Check the kernel documentation if you need or may use Assisted-by tag.

...

> > This is an ugly hack.
> >
> > Saving context is done in drivers/acpi/x86/lpss.c (see #1 why this file).
> > If something wrong in the flow it has to be fixed there, not here.
> I checked drivers/acpi/x86/lpss.c and its LPSS_SAVE_CTX mechanism.
> However, on MacBook8,1, the LPSS SPI controller is instantiated as a
> PCI device (00:15.4 / 8086:9ce6) bound to spi-pxa2xx-pci.c, rather
> than an ACPI platform device handled by drivers/acpi/x86/lpss.c. As a
> result, acpi_lpss_restore_ctx() is never invoked for this PCI device.
> 
> Physical hardware S3 testing (rtcwake -m mem) confirms that across S3
> suspend, LPSS_PRIV_RESETS (BAR0 + 0x204) is reset to 0x00000000
> (functional block held in reset) by the PCH, causing all post-resume
> SPI transfers to fail  continuously with -110 timeouts (applespi
> spi-APP000D:00: SPI transfer timed out).
> 
> I understand your point about not doing context saving in spi-pxa2xx.c.
> Would moving the LPSS private register context save/restore into
> spi-pxa2xx-pci.c (the PCI glue driver) be an acceptable approach for
> PCI-enumerated devices?

I see. Can we do something similar to what drivers/pci/pci-mid.c does?
And somehow to unify the core part of the context saving, et cetera
between two ACPI and PCI cases?

-- 
With Best Regards,
Andy Shevchenko



