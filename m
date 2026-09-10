Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BACC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 09:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86vmOg95m0USoJ2CzbHQCprZrbWYs1qHymLuz8WAuuA=; b=yDThTRJP0u1nD4UbpNGq825Mew
	kplfJcSj7rf55fuKLXFxIRhFrc0KDMnbbaM+hFHumGeEaRQ91zGidMRzsZSaP4eHpKvz0hBnFtcq9
	LGsa8mNt5Y4KIKX8kMzl6VZCk6SZ+BfjtJYcUAd8fnUmy/v8VSrsNwbc5oVi6DAHQgQR30OmaVz5E
	FOxFOYlmMfkASZR86gpQgy3qu12Lv/2OcZ8hYZEd6zcKCurHdzDf6IZN4C9w9OOP54AZS2gPKI/dk
	SyJnmQ0wlj4i8PqQTbuGe9MImgA+Or2y8AjxVFIUDdxhSJlzJGo8gc/B/CqaXxhzu+qT8O/+ygJjN
	w9sFj0iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4b3s-0000000DscN-2W2A;
	Thu, 10 Sep 2026 09:27:16 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4b3q-0000000Dsbx-2TQW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 09:27:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789032434; x=1820568434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g9Cp6K2YW/0ojAZM+PERC3yWY2MaFiW9F9EZGEa+wq0=;
  b=m0MrM3WinIL75/v4If01y1KKal2wMm1KS/8Z1/VoD3iSMTm5liHhwXhb
   n69jSLUfK3USxydm7UbDc14b9l5v353frYp3gagwoaxPzWuInkH/i0sEM
   pobkGUt40IE+czbYZ5a4S58PeduLfaJq6WehEyZvjmeU0C09ZzGlFhiQp
   ceZyURsahcQJ25ixAJSmnCn+CK9K8H14QCUFQ7hqDdbty0QAsKhk+bCD5
   oPlKt42TpxRXrgyuzqCyV6GI16RufOJfnz0/3rS2nKgAz0AseNyCSLjb2
   HNnh/2r+kJDa9KJMe/7iye9RT5XYLkKoSL21EkgsIS3J/XLumTX1bKpic
   g==;
X-CSE-ConnectionGUID: /gynOjyDRY+HTfQUa+OxRA==
X-CSE-MsgGUID: jD1sVxd/TbGZdIjrKpW7gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100068158"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="100068158"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 02:27:09 -0700
X-CSE-ConnectionGUID: 9Lk46I8cT22DEwuQeaU5Rw==
X-CSE-MsgGUID: YmZZHAgjTGqItji2nmnofw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="273537486"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 02:27:04 -0700
Date: Thu, 10 Sep 2026 12:27:02 +0300
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
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH v6 11/13] serial: 8250_dw: add Ambarella CV75 quirks
Message-ID: <aqJ35vMBiBZo2iUE@ashevche-desk.local>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
 <20260904-cv75-v5-v6-11-e918514cb3b1@ambarella.com>
 <aqJrSnr0rwv4BOJ3@ashevche-desk.local>
 <122573f8.8232.1a08a9765fc.Coremail.zl020895@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <122573f8.8232.1a08a9765fc.Coremail.zl020895@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_022714_668926_43D875A6 
X-CRM114-Status: GOOD (  14.42  )
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

On Thu, Sep 10, 2026 at 05:12:52PM +0800, zl020895 wrote:

> > Wondering if we should undo this in the port's .shutdown() callback.
> I saw the shutdown path already covers it: dw8250_shutdown() calls
> serial8250_do_shutdown(), which does
> 	up->ier = 0;
> 	serial_port_out(port, UART_IER, 0);
> so both the IER shadow and hardware IER are cleared, including ETOI.

Depending on the answer to Ilpo the enabling may need an updated comment
summarising the above.

> At 2026-09-10 16:33:14, "Andy Shevchenko" <andriy.shevchenko@linux.intel.com> wrote:
> >On Fri, Sep 04, 2026 at 02:38:18PM +0800, Long Zhao via B4 Relay wrote:

...

> >> +	/*
> >> +	 * Ambarella keeps variant IER bits (e.g. ETOI) set for correct RX
> >> +	 * timeout behaviour. Force them into the 8250 IER shadow so later
> >> +	 * generic IER updates do not clear them.
> >> +	 */
> >
> >Wondering if we should undo this in the port's .shutdown() callback.

-- 
With Best Regards,
Andy Shevchenko



