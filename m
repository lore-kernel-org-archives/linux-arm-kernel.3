Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137C6C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 19:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5du5EBQFpIi/SwJ0ieCW4HFbKgYVSov3wFaDLiDqK9c=; b=D7M0uGaKmIeunUg1CvX+RBCBPF
	UaAvdIdkclIiQXiH0QKJ+qfJdOasHsfqD559qt7JOghJGzOJqUJjUOkuQGdZIr+2BDVWjZ3zgN6YH
	miBXWFmjlS2LVD2xECmPnxRkGWSLcmmapX5A9a82HIV9IA3mCkuqc4ujWVU7gkNmaPQacfRXX/XeR
	y7MADANqjZd9LjCaZDlgn9lLfNDPyVyIyaicwJUsyl94HtFS0C/s64RFK2kNTOOWMhe02clCMmQsP
	8RplEucdPF/NnRIOD70BnKV/+mLEphYm/Wptq5/IrQj9Gag2vGPbH860CBYAaV62Ka5a8fcYGYe/b
	aT/E0sRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlte7-00000007kss-0VoB;
	Mon, 20 Jul 2026 19:27:23 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlte3-00000007ks8-3o4z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 19:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784575640; x=1816111640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hWgaDkOb0LbmVmmiCxtUvfxEken1qhpQkfHaM7Fgk3A=;
  b=NGF4aVqiuLuwhnZpTpsvLDzmf/ADWEukC1zviQxA+iI5NOk7nv/fv2g2
   WTb2cfZVS/VcnkaBRPdnSn2krEWiyYdFihLXXwmHGUh2hnSQHQXc/F+x5
   x5Dm1igl8HUrq4cQPRcqavk546h8xIyy3loQNmWpI4fBjmhPUjqlt18T6
   rJvoawclYc3JiJeWzpYL9/uYDeI8QDfdu1KkhJmr2+Zdzwmeyz/OUn6fK
   f4MtEsJrMapjL2ZrsP22qJBXyYmq4yrPKt1msBQrlndmvnD+DWq+yUuAh
   ode1EqkxM1gedxhtAzSxpSKUTM41byGDJBpRaiW5GDoZu4MRAQzLBuZjr
   Q==;
X-CSE-ConnectionGUID: 2ILECYwnQnyTnfLe09f93Q==
X-CSE-MsgGUID: ixMevB0OQxOd0fIf+fS+gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="88843558"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="88843558"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 12:27:19 -0700
X-CSE-ConnectionGUID: VEpARZS2TN6OfnH+jxlpNw==
X-CSE-MsgGUID: VCqD1pLAT0WCgKQ3SjF7uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="257598201"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.175])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 12:27:16 -0700
Date: Mon, 20 Jul 2026 22:27:14 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Shih-Yuan Lee <fourdollars@debian.org>
Cc: Mark Brown <broonie@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 5/7] spi: pxa2xx: disable DMA for Apple MacBook8,1
Message-ID: <al52kpB1hklx5guG@ashevche-desk.local>
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-6-fourdollars@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720162117.32304-6-fourdollars@debian.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_122719_991814_4C553157 
X-CRM114-Status: GOOD (  15.47  )
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

On Tue, Jul 21, 2026 at 12:21:14AM +0800, Shih-Yuan Lee wrote:
> On MacBook8,1 (early 2015 12" MacBook), the LPSS SPI controller at
> 00:15.4 suffers from hardware DMA handshake failures and interrupt
> routing bugs, causing keyboard/touchpad transactions to fail when
> DMA is enabled.

Why? The thing like this I noticed on some other HW which required different
DMA settings. Have you tried to investigate the issue more?

> Move the forced PIO mode DMI quirk to spi-pxa2xx-pci.c (the LPSS host
> controller PCI glue driver) to avoid layering violations in client
> drivers (such as applespi).
> 
> Add an explicit DMI match table for MacBook8,1 and a module parameter
> spi_pxa2xx_force_pio to allow forcing PIO mode on demand.

This looks like a hack. Please, if you have a hardware, try to dump the errors,
collect the data corruption or timeouts and provide more information. DMA for
SPI on LPSS hardware never was a problem (unlike UART in some cases). I'm almost
100% sure the problem is in DMA configuration / setting bits.

...

>  #include <linux/dmaengine.h>
>  #include <linux/platform_data/dma-dw.h>
>   +#include <linux/dmi.h>

Keep list ordered.

>  #include "spi-pxa2xx.h"

...

> +static bool spi_pxa2xx_force_pio;
> +module_param_named(force_pio, spi_pxa2xx_force_pio, bool, 0444);
> +MODULE_PARM_DESC(force_pio, "Force PIO mode (disables DMA) for SPI transfers. ([0] = disabled, 1 = enabled)");

No. There is no room for module parameters like this.

-- 
With Best Regards,
Andy Shevchenko



