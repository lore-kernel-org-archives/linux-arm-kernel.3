Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD40BCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 20:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABfBECpzgHalzJTeWHIhKpQRhqq1W03XpK3V8+OiHCg=; b=SEb0yDy4Rmz/oD17Zw9/sEbX0R
	IIjmJujLtHB92XyzFc9OPD8dr3F8505BnGNnVEt681tU0g+iYmihK1DXvj4U6QSLsBt60EVK9PzIz
	SYzXFGv6orjGgMJFUWnED5+kJXBwrPnP+Gu0YlWpjK1ulnTzU0ZNT9iZo27S3qkMK/j5WZzny0u3P
	DK58T19PpFWTpVY9viqKk4rFTvdnpoOR7pmUb3O2A4AHE9LmBUkuLj3HdUAdERNZJw+QTp9yL/KsD
	u56NV7x9e//c066dMKBk+scJ+oe2uCv1+slhvL+pwcDLGPz6neNoEItS++DxdhDGZNvGVryTXD4gg
	aXrhB6aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNG2b-00000003gCr-3o9m;
	Wed, 13 May 2026 20:18:49 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNG2Z-00000003gCK-3Bse
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 20:18:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778703527; x=1810239527;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IfW99YHYzpUh373QPEOA4K2s4hb7mUdbwWNMEdE9QzM=;
  b=VbCSB72kwECrwA37V2fh6D9U+jepvggwMd6FjvCz9txlczr0QHn8/1lB
   dutEmrabkC7mN6dmQmOzP+fA+Opz6HoA6nSPvDFp2Ajsd2JYzHzJ5nA12
   6O3Dbp/hjl+oP1Ho+XFGUXMx0/31cjWPOrxMtxqRrOSvMjS7IYO3U1ojh
   NZh+YyW+IC6bBKURPHMfRuqi5Kj82YNmYQtYns6zek/tmrgGCJ+atXmtB
   k3eNYyLDIxVafZvxTJ/QCM53QNQVEghDHd3gfxA9ctL6ssmkcihqzsBda
   9A7K8PrxJikyxSEsUe/DnP3YMSBTy8rjudnPXMRs7fEvUzFhXLltFbkzo
   Q==;
X-CSE-ConnectionGUID: 7zD5HVqJQ2urkCnU/71jvA==
X-CSE-MsgGUID: CFOMYOfhTK6VBNyD8CROvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="102309111"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="102309111"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:18:47 -0700
X-CSE-ConnectionGUID: Er/26GkHRvy20O47F9TRWA==
X-CSE-MsgGUID: heEwA0y0TH2LkOXC67+U+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="261934359"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:18:43 -0700
Date: Wed, 13 May 2026 23:18:41 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 09/11] m68k: stmark2: use ioport.h macros for resources
Message-ID: <agTcoVbImqMgfQy5@ashevche-desk.local>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-9-fcdae50cf51a@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-wip-stmark2-dac-v2-9-fcdae50cf51a@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_131847_834750_6307C5CF 
X-CRM114-Status: GOOD (  12.30  )
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

On Wed, May 13, 2026 at 11:14:33AM +0200, Angelo Dureghello wrote:

> Align also other resource declaration using DEFINE_RES_.

DEFINE_RES_*()

...

>  static struct resource dspi_spi0_resource[] = {
> -	[0] = {
> -		.start = MCFDSPI_BASE0,
> -		.end   = MCFDSPI_BASE0 + 0xFF,
> -		.flags = IORESOURCE_MEM,
> -		},
> -	[1] = {
> -		.start = 12,
> -		.end   = 13,
> -		.flags = IORESOURCE_DMA,
> -	},
> -	[2] = {
> -		.start = MCF_IRQ_DSPI0,
> -		.end   = MCF_IRQ_DSPI0,
> -		.flags = IORESOURCE_IRQ,
> -	},
> +	DEFINE_RES_MEM(MCFDSPI_BASE0, 0x100),
> +	DEFINE_RES_DMA(12),
> +	DEFINE_RES_DMA(13),
> +	DEFINE_RES_IRQ(MCF_IRQ_DSPI0),
>  };

This conversion drops hard indices, would it be a problem (for example,
some code modifies the fields based on the [hard coded] index...)?

If not, perhaps good to mention in the commit message and move IRQ to be the
second one?

-- 
With Best Regards,
Andy Shevchenko



