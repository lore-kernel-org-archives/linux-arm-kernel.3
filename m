Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30907C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 08:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqBSDOxVPj2frlCfCyApI0AAgoK6ilDInQM/Bcl7z30=; b=BOY+1dyt2fP+ANtkvRKyRffNdo
	Uq9s3TJcUIyXaPB5W/t8xqTIcgJAg0S+tCkQiZeQJcU8D4LR33cwk5tec1lh4OwlMuqY3gjqAsMjy
	OPpDZSKPB8sueNC3YVrGljm97/QjIgkKvDsMJxka7LEkL2mJctEkaxS6zChxi1qOllAFdefrhb6ka
	haJIjPNsOSAunrvqTrghj6b6aOD6GjNdAPayEFaD9CM0Ay4HAsjY5eYkxQffbyREhSGGiueXzweSm
	WFM96HHhFfDuXIU/IozORLjLQIT9fdR3Yf7/RiEyIi13gZUjSIVr2zQOIgJB5iFzudU8QcVSyZb5E
	xL74q83g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aDk-0000000Dkxx-3j4W;
	Thu, 10 Sep 2026 08:33:24 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aDi-0000000Dkwl-1fyc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 08:33:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789029202; x=1820565202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=crIMr6lHdYoc1yLpuiNmToTTcqtQKMa63bcOTy3RX10=;
  b=dLPFEk65TwI8ZckmhsqDH5yiQHKqrZBQnJWftGGf3lad2koznfB1bYco
   myLvS1SdxxDBeulJeMXfgJVS4P3yIPjSKrXI/stfV1YJOZWaH/QMksiwa
   IYXCI+QV0SFDtmuRF1s29EKzrJqRhia0BrMwfEmrE0Ugi/M9fvH9f/HMs
   kbW+cyLzTOqEXa0fgN/hzKwoiDjQOWXPNOFa56XTKew/NoNibUu+IwWvP
   i5hseDyYhU6gMRJJEZ09JYIK7UTUtvIC8rEM/fyFRHi0kjMg8Pv71yVQM
   iJIX7TFDrD2CET9fNnq4hNbr1HZ1+KT0ZHollsYk2rxI+W+bo4TgilnaH
   A==;
X-CSE-ConnectionGUID: zUCQxrd4RwapcxlwnYk0/w==
X-CSE-MsgGUID: EG5RjQG5SAqJEJmXBnjYDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106987303"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="106987303"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 01:33:21 -0700
X-CSE-ConnectionGUID: fl6KbBSZRvekShUjRPDzhw==
X-CSE-MsgGUID: xoSe0ZbyT8KlKM8Xu0u95g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="267873193"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 01:33:16 -0700
Date: Thu, 10 Sep 2026 11:33:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
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
	Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>,
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 11/13] serial: 8250_dw: add Ambarella CV75 quirks
Message-ID: <aqJrSnr0rwv4BOJ3@ashevche-desk.local>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
 <20260904-cv75-v5-v6-11-e918514cb3b1@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-cv75-v5-v6-11-e918514cb3b1@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_013322_451663_2CDF5A97 
X-CRM114-Status: GOOD (  16.21  )
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

On Fri, Sep 04, 2026 at 02:38:18PM +0800, Long Zhao via B4 Relay wrote:

> The Ambarella CV75 UART is Ambarella IP, not a Synopsys DesignWare
> licensed block. At the register level it is close enough to DW APB UART
> that a full custom UART driver is unnecessary: reuse 8250_dw with a
> small platform quirk.
> 
> Quirks:
> - keep IER ETOI (bit 5) set for RX timeout behaviour
> - skip set_rate; baud clock is managed outside the UART block

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> +static int dw8250_ier_mask_startup(struct uart_port *p)
> +{
> +	struct dw8250_data *d = to_dw8250_data(p->private_data);
> +	struct uart_8250_port *up = up_to_u8250p(p);
> +	int ret;
> +
> +	ret = serial8250_do_startup(p);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Ambarella keeps variant IER bits (e.g. ETOI) set for correct RX
> +	 * timeout behaviour. Force them into the 8250 IER shadow so later
> +	 * generic IER updates do not clear them.
> +	 */

Wondering if we should undo this in the port's .shutdown() callback.

> +	up->ier |= d->pdata->ier_mask;
> +	serial_port_out(p, UART_IER, up->ier);
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



