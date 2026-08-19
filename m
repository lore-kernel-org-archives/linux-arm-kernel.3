Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C94C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 06:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBgC1vaK7oGH01TmcxoGSxj74xWbhKolVz8UzaQQxYE=; b=Puejkin4MzDcVWkiEgEc8erBHW
	MaIyk40YkJ9M5I6whZLD52+I5OxdD3trJJVv7WJyJ9jFJmJlu7TQ+JkVE6Giewru4DWAI1maieLSE
	AQB5NfWlL4ouZZao6INrfkSOgC3tlfa4NfKGild6upO3hMvQWTrlWMMOChreOVG/Y9jMSS0kRwEj7
	11tYgZE6d6/cP27wX0HE08wFGmGxLgS3qqxHZVAu6Nu26tGtCbunL48LLPF7duQqhL6ifPb5YJSrV
	TlFfa61ueTi9igweP5Nze5xgtupQFk90pThEL/PcJHoyq4+feKtSYyzP6La1GvbUPM9iEarOEt47B
	wq8lnTfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwa80-000000097le-2aNl;
	Wed, 19 Aug 2026 06:50:24 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwa7x-000000097lG-3rmj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 06:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787122222; x=1818658222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=izjKXIFxi/rqtVADf2M0sBpedoa8cJQqW1TXF55iZ3A=;
  b=M2hwTb7txOei1ofoJNNcJ+RiWe4XLYaiyfDRGjMypZ+lJF1XSKKL+MAg
   NSbCa5vyXjDLABMVs41u9lu8WWFJJiEjQx1EppiVqfnxM5JSVCvLYkzGZ
   28dmTxy5IE3ye6v2rWZzq8Cw2dIgeJbE4SzjY00Dk5FNt4xAw6T2ZzM3Q
   DeT3/UG45dSeTV9o2PD6xnC/UZMoKqfcTP5KCXAcW1Q5xznc4XBbmXJj7
   u4b7gGrVe7BaXJt4RTVBS+kchclEfInrVDQgDoHX73o54GXCLdT90bKDh
   2p1aKcsXiBrOOxCy/KNX92wuO3kOzOdxTM0OwtoNYT2z089pU7p0KaBXV
   w==;
X-CSE-ConnectionGUID: o/pIaUQWSb66wEcJHg8izw==
X-CSE-MsgGUID: /fi9RI5ITleG0+2+9qFctg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87829339"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87829339"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 23:50:20 -0700
X-CSE-ConnectionGUID: H1XQ80vSTXqXbOh+BrnsQw==
X-CSE-MsgGUID: QSkiNZ14S62aTkp1BIOMog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="268965440"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.106])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 23:50:14 -0700
Date: Wed, 19 Aug 2026 09:50:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: zl020895 <zl020895@163.com>
Cc: longzhao <longzhao@ambarella.com>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc <soc@lists.linux.dev>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-gpio <linux-gpio@vger.kernel.org>,
	linux-serial <linux-serial@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Brian Masney <bmasney@redhat.com>, Lee Jones <lee@kernel.org>,
	mfd <mfd@lists.linux.dev>
Subject: Re: Re: [PATCH v5 10/12] serial: 8250: add Ambarella UART driver
Message-ID: <aoVSI4xcpRqUZIew@ashevche-desk.local>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-10-7bbb12f0360f@ambarella.com>
 <aoRpc2RK2_X3CdAi@ashevche-desk.local>
 <162c0385.2c076.1a018b82fa7.Coremail.zl020895@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162c0385.2c076.1a018b82fa7.Coremail.zl020895@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_235022_071821_8BFEF538 
X-CRM114-Status: GOOD (  19.96  )
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

On Wed, Aug 19, 2026 at 02:31:59PM +0800, zl020895 wrote:

> This is Ambarella 8250-compatible IP, not Synopsys DesignWare. We
> first tried 8250_dw after Linus asked us to move to the 8250 library;
> you then told us not to touch 8250_dw and to use 8250_ambarella
> instead. That is what this patch is.
> Background:
> https://lore.kernel.org/r/CAD++jLm6HzEU1TM-c=Vtjv3FJEBecVP7TyxSgq_Q0zF-YwT6NA@mail.gmail.com/
> https://lore.kernel.org/linux-serial/an8KvvHWX0naH3Xw@ashevche-desk.local/
> https://lore.kernel.org/linux-serial/7E774305-3920-4BB7-BA46-E0772D6BED84@ambarella.com/
> I will also switch to uart_read_port_properties() and trim the
> 8250_dw-derived boilerplate.

But it has layout like Synopsys? Do you have a link to the datasheet?

> ---- Replied Message ----
> | From | Andy Shevchenko<andriy.shevchenko@linux.intel.com> |
> | Date | 08/18/2026 22:17 |
> On Tue, Aug 18, 2026 at 06:31:24PM +0800, Long Zhao via B4 Relay wrote:
> 
> > Add an 8250 platform driver for Ambarella CV75 instead of claiming
> > snps,dw-apb-uart compatibility.
> 
> This is a record from a changelog. There is nothing in the commit message.
> ...
> 
> The code seems like an almost blind copy of 8250_dw.c.
> 
> > +#define AMBARELLA_UART_USR        0x1f
> > +#define AMBARELLA_UART_USR_BUSY        BIT(0)
> 
> So, is it Synopsys IP-based design? How this gets into this platform? This
> whole story completely made me lost.
> 
> > +#define AMBARELLA_UART_IIR_IID        GENMASK(3, 0)
> > +#define AMBARELLA_UART_IIR_STATUS    GENMASK(5, 0)

...

> > +    of_property_read_u32(dev->of_node, "reg-shift", &reg_shift);
> > +    of_property_read_u32(dev->of_node, "reg-io-width", &reg_io_width);
> > +    uart.port.regshift = reg_shift;
> 
> > +    switch (reg_io_width) {
> > +    case 4:
> > +        uart.port.iotype = UPIO_MEM32;
> > +        uart.port.serial_in = ambarella_serial_in;
> > +        uart.port.serial_out = ambarella_serial_out;
> > +        break;
> > +    default:
> > +        return dev_err_probe(dev, -EINVAL,
> > +                     "unsupported reg-io-width %u\n",
> > +                     reg_io_width);
> > +    }
> 
> This is handled by uart_read_port_properties().

-- 
With Best Regards,
Andy Shevchenko



