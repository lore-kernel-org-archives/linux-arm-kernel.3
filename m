Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F4BCDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 21:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/ZT38oJwe9SvdRsKZa4b9hkalZ8gnq+XcMgdaJ8tn8=; b=hPv8bVu4HQljajgE7ow1up06HG
	9EcZh+isJlbILrg+dZrZYKaVb7Mdzcvk82ZsmIMuiU18688j7rsqsqukOT5t84U3GK8oNsutmqfTk
	9ToXDRztoZHXQ31Rc7ClfQljaEqKGhUf1BSh4gOW4QwJ4loDlKVchokVJ2CcCA6B/D6QD0k6ytXt7
	5sbNcEBkqW4c5XHRdn2oG4Bz9UbTymWR33dztIhl8cVyHJuJ7tRbfcFUfS5COCizgWDkFp6BC+fyn
	tOqd9DafkIFqMEPA+jHrwP94vl34GzIgo5yUoFuK2a0a1oBqvjlY2Uhx11NpfahpGlwy0+JJKrMXk
	PvcHUGJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc8aE-00000006uP1-1k7e;
	Tue, 23 Jun 2026 21:23:02 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc8aB-00000006uOg-09rE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 21:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782249779; x=1813785779;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AKXV4muuFBAbGj4jCPBZwKR37ivYTelH5ksj5TS5Clg=;
  b=EWnzwOg9/hYDCLq2TX8rWtSp3jMy6Jc2/A0pmHuV+BwyDbOBsVcZPxvo
   4OMQkmbCaYYxlPmB5AVaVC83mHZ0whLTqC0ivQstWV0kQnmUZ24Mwmu2W
   mGSCOkThW51Xhxdzit0Q3SGRc95P0wLf8ihpCBMFYCpZtJQ1H9THamrAa
   zY9q3ZyPWOc1zbm5Wniv6p+5h0nqHnGbF6B4nJKh+DcZScZU+4gDwppyj
   WzYTCi1myhMkIyaBSiN76qFzwS2NWVuUusHdH2aMKYBlE3FXaxZtMy2G9
   0xpL2XEa3VUQXzAPn2fJh+NRQnjIf0EyIc7vDUqslST/BHJ62aNyETBZz
   g==;
X-CSE-ConnectionGUID: Z7NkcDvFTvmoHvJFfkiANA==
X-CSE-MsgGUID: GwwAm72iSXi7U5EuSmupuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83044949"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="83044949"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 14:22:56 -0700
X-CSE-ConnectionGUID: +O/5Yu9XRy2OyPRl9TD3QA==
X-CSE-MsgGUID: kJADlDnMQamLWZjchZ8MYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="287753248"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.7])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 14:22:53 -0700
Date: Wed, 24 Jun 2026 00:22:50 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 1/2] iio: dac: add mcf54415 DAC
Message-ID: <ajr5Kj1GH-z9x2_k@ashevche-desk.local>
References: <20260618-wip-stmark2-dac-v6-0-48761dbb96d7@baylibre.com>
 <20260618-wip-stmark2-dac-v6-1-48761dbb96d7@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-wip-stmark2-dac-v6-1-48761dbb96d7@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_142259_093273_DD09E334 
X-CRM114-Status: GOOD (  11.88  )
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

On Thu, Jun 18, 2026 at 11:04:15PM +0200, Angelo Dureghello wrote:

> Add basic version of mcf54415 DAC driver. DAC is embedded in the SoC and
> DAC configuration registers are mapped in the internal IO address space.
> 
> The DAC accepts a 12-bit digital signal and creates a monotonic 12-bit
> analog output varying from DAC_VREFL to DAC_VREFH. The DAC module
> consists of a conversion unit, an output amplifier, and the associated
> digital control blocks. Default register values for DAC_VREFL and DAC_VREFH
> are respectively 0 and 0xfff, left untouched in this initial version.
> 
> This initial version of the driver is minimalistic, "output raw" only, to
> be extended in the future. DMA and external sync are disabled, default mode
> is high speed, default format is right-justified 12-bit on 16-bit word.

...

> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>

> +#include <linux/io.h>

Is it used now?

> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>

...

> +	platform_set_drvdata(pdev, indio_dev);

Is it used?

...

Otherwise LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



