Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E97C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 15:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQsRU5egikGwVZJmhP5HrHOi5E90elYU3n1vwgyXe9Q=; b=2mVQaAOzXykHKqG2nuvVez4Is7
	r2Og6Mr8nA4EyqQoKr0nU+3a1TutSwX4/tOh2mrc9XFHnHuTVradJU7UqyMWJTP0uvJD4HEWb8PEV
	yBhT/SwxMYw6coo0sSHwYNPn0kXyhzF4PTJFd0ypnzUT3N0KQIc1Z3zahJ79Zq8pBG5pI/40MT+fX
	KWmLhLDtKR2O60WKu3uyJaKUI4tW1N99SgnEz6m8K7XZLYNVwaEdhAbw0PrkcR3q2LHN0jelmjQAz
	9PQvIdr28kFOfcll1j6keevGI0O0C5ld1P76HfwFFuwiMRe++Dye8UbrkllRwm0UkR0QYuLPQ3thK
	cfhc72iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLMs-0000000EvyJ-2XOZ;
	Fri, 24 Jan 2025 15:13:10 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLJ8-0000000EvEL-0wOE;
	Fri, 24 Jan 2025 15:09:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737731358; x=1769267358;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nu5L0oHkKO/XvEtpmpggRMODnIIoAWZ2OPQcpyBS/x8=;
  b=QiM0s3nZzI6Gbt6BrPIVA/ui1O4o3Lxuvmqu05M3sVzPZ7pLYGDnBjy9
   +V07nknvMxrdvGOHSUlV8hmyUsuLZpIdbcwODVfBMITJH2oCLAqCdOElT
   8URFiaHsr/qA748hS/17Em4Q3IhEFdC/DC1vUIk4pBQnfi7TaRD2pmPUo
   Q3hZik5l6mcgQqB3xJhSWHsLuLbXDOYlujpTwpKOdxDgjsScDR3XOieyj
   vsLZElFyz1/ln86/VxYWQdIN+J9GVLEu3c0zR87oX3ccKQnh+RGhm1cPM
   cVqvXXZmJ/ytk+Amn3RDjNGAdmtFz7F83fRPwCAcPm2yIDl0pZGhz/QKS
   Q==;
X-CSE-ConnectionGUID: lFlNbcIGRdibuNZcwiAwCg==
X-CSE-MsgGUID: ONoCOpvUSMCNgMWN0fCE+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="48773118"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="48773118"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 07:09:17 -0800
X-CSE-ConnectionGUID: FGtdc2FbRdObUS8rE2/eYQ==
X-CSE-MsgGUID: QpmEVMWQQXS0uR6y2gE0SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131087548"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 07:09:14 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tbLJ0-00000004qdD-3BFn;
	Fri, 24 Jan 2025 17:09:10 +0200
Date: Fri, 24 Jan 2025 17:09:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yenchia Chen <yenchia.chen@mediatek.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	yj.chiang@mediatek.com, tbergstrom@nvidia.com,
	treapking@chromium.org, u.kleine-koenig@baylibre.com,
	yujiaoliang@vivo.com, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] serial: 8250_mtk: Add ACPI support
Message-ID: <Z5OtFqtf4dpvvc9v@smile.fi.intel.com>
References: <20250124031835.1788995-1-yenchia.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124031835.1788995-1-yenchia.chen@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_070918_313551_0090C7D4 
X-CRM114-Status: GOOD (  16.66  )
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

On Fri, Jan 24, 2025 at 11:18:32AM +0800, Yenchia Chen wrote:
> Add ACPI support to 8250_mtk driver. This makes it possible to
> use UART on ARM-based desktops with EDK2 UEFI firmware.

...

> +#include <linux/acpi.h>

This will not be needed (see below)

>  #include <linux/clk.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> @@ -15,6 +16,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/serial_8250.h>
>  #include <linux/serial_reg.h>

> +#include <linux/units.h>

This might not be needed either (see below)

>  #include <linux/console.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/tty.h>

You probably want to sort header inclusions first for easier maintenance and
feature additions like this one.

Can you add that one?

...

> +	} else if (!acpi_dev_handle) {

> +	}

This should look like

	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
	...
	if (is_of_node(fwnode)) {
		...parse OF...
	} else if (!fwnode) {
		return -ENODEV;
	}

...

>  	uart.port.uartclk = clk_get_rate(data->uart_clk);
> +	if (!uart.port.uartclk)
> +		uart.port.uartclk = 26 * HZ_PER_MHZ;

Why doesn't your table provide the clock-frequency property?

What I expect to see is the use of uart_read_port_properties().

...

>  #ifdef CONFIG_SERIAL_8250_DMA
>  	if (data->dma)
>  		uart.dma = data->dma;
>  #endif

Btw, how do you handle DMA in ACPI case?

...

> -	/* Disable Rate Fix function */
> -	writel(0x0, uart.port.membase +
> +	if (!acpi_dev_handle) {
> +		/* Disable Rate Fix function */
> +		writel(0x0, uart.port.membase +
>  			(MTK_UART_RATE_FIX << uart.port.regshift));
> +	}

	if (is_of_node()) {
		...
	}

...

> +static const struct acpi_device_id mtk8250_acpi_match[] = {
> +	{ "MTKI0511", 0 },

No ', 0' part, please.

> +	{},

No comma in the terminator line.

> +};

-- 
With Best Regards,
Andy Shevchenko



