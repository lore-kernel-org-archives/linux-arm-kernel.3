Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B14C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 07:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExWyFWEwKA4Dm6GjucANeDwN82P70GSCP6y4pBamQgg=; b=w1MwuZKFec3MzRh8M66qrVKxSt
	NiFckAQpfjG3UIZil5sP4bYtc/wC//UZaLg7ZBChyqRt2TZmsfsfwFCLBIYwrPQS1al0QwdnI4Oh1
	Ydmthv4p5GrAM3jKKj8YxGXjZ58KaoHKEXYObJudMRZ/ggT3KwQyHOUoeRSBqBBlkAy8eZdHsS/0f
	reDcuGc6jvlSNOcmiUZWzxAftB+2stpLHIINmyGaPvlPvkPhxOeSPao12mwoReZKlTCL7ynxKSzIp
	jB/ijrDpHDig1/Q/zvl18nwnKbQ41d1AQC8X5eoeAS2lQ2Ii4Vf0AlJ5ViXbZ1eu+rQl85t4KEjLR
	Lf0SXmoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwapB-00000009CtH-2cjt;
	Wed, 19 Aug 2026 07:35:01 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwap6-00000009Cs9-1WUV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 07:35:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787124896; x=1818660896;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nJA0/6kYLHyEEZ/c1kClhKWe404ZhLpl/En2+SoLBHk=;
  b=lf0HHuQ76meOI6IFKT9Hbla/yoUXpTwECDgy9F/S/5teB9syJJkIsqqC
   Uq7uR2VV4ND+CL/9TzJFBZAmw0+cvhkA3lyJghumkeC+Py/h4hAMoO/1x
   AyNpVbeG7Ycu7BrSvHVZZs6vnfeJIbgb9rP//yXwEnyWdvPQT5SXkuau1
   4oqAHFfGspuojuprf1NFmqCJnVvVvYjisd5msD7Uq61Bm829jheHK73rH
   buM4keMeooUuk/9ZH06fNDafOIG1jkevxH8K8QKf8tkLIGaU9btHKTxXc
   nhNZS2DVatnVxmnnTx1SCRzW/F1bLwA+a12DAY3S7o+OJTftjTvmsAI0i
   Q==;
X-CSE-ConnectionGUID: RVsOOCICQQeQqdKCQ7F59Q==
X-CSE-MsgGUID: taEsSuVOSdGjuZ1ya5BLRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87693356"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87693356"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 00:34:55 -0700
X-CSE-ConnectionGUID: FrUAUwlwRhKkJIHe3rcb5g==
X-CSE-MsgGUID: bIaQRPCcQDS7wWvNjTGJYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="295375262"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.106])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 00:34:49 -0700
Date: Wed, 19 Aug 2026 10:34:46 +0300
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
Subject: Re: Re: Re: [PATCH v5 10/12] serial: 8250: add Ambarella UART driver
Message-ID: <aoVclvO1eAV3TULu@ashevche-desk.local>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-10-7bbb12f0360f@ambarella.com>
 <aoRpc2RK2_X3CdAi@ashevche-desk.local>
 <162c0385.2c076.1a018b82fa7.Coremail.zl020895@163.com>
 <aoVSI4xcpRqUZIew@ashevche-desk.local>
 <4dfe3bbe.2c34f.1a018d297c3.Coremail.zl020895@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4dfe3bbe.2c34f.1a018d297c3.Coremail.zl020895@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_003457_099761_D6975AE3 
X-CRM114-Status: GOOD (  27.42  )
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

On Wed, Aug 19, 2026 at 03:00:49PM +0800, zl020895 wrote:
> 
> The register layout is 16550-compatible with reg-shift = 2, and it has a
> USR-style busy bit at a similar offset to DW APB UART. That is why it looks
> Synopsys-like and why we first tried 8250_dw.

I see.

> It is still Ambarella IP, not a Synopsys DesignWare license. Besides the
> common 8250 map it has Ambarella-specific pieces (e.g. IER ETOI, and DMA via
> DMAE/DMAF rather than the DW DMA path). DMA support is out of scope for this
> minimal bring-up series; the current driver is PIO / console only.

Okay, put the summary and the details of this discussion in the commit message
of the next version to make sure we have a justification for a new driver and
some pieces that looks like Synopsys DesignWare.

Also try to make the driver really bare minimum without any blindly copied
pieces or "features" that are not related to your HW or will be implemented
differently in the future.

> Sorry, I do not have a public datasheet URL I can post. 

If you can share register layout with small descriptions (even privately) it
would be helpful (some pages from your datasheet, for example).

> ---- Replied Message ----
> | From | Andy Shevchenko<andriy.shevchenko@linux.intel.com> |
> | Date | 08/19/2026 14:50 |
> On Wed, Aug 19, 2026 at 02:31:59PM +0800, zl020895 wrote:
> 
> > This is Ambarella 8250-compatible IP, not Synopsys DesignWare. We
> > first tried 8250_dw after Linus asked us to move to the 8250 library;
> > you then told us not to touch 8250_dw and to use 8250_ambarella
> > instead. That is what this patch is.
> > Background:
> > https://lore.kernel.org/r/CAD++jLm6HzEU1TM-c=Vtjv3FJEBecVP7TyxSgq_Q0zF-YwT6NA@mail.gmail.com/
> > https://lore.kernel.org/linux-serial/an8KvvHWX0naH3Xw@ashevche-desk.local/
> > https://lore.kernel.org/linux-serial/7E774305-3920-4BB7-BA46-E0772D6BED84@ambarella.com/
> > I will also switch to uart_read_port_properties() and trim the
> > 8250_dw-derived boilerplate.
> 
> But it has layout like Synopsys? Do you have a link to the datasheet?
> 
> > ---- Replied Message ----
> > | From | Andy Shevchenko<andriy.shevchenko@linux.intel.com> |
> > | Date | 08/18/2026 22:17 |
> > On Tue, Aug 18, 2026 at 06:31:24PM +0800, Long Zhao via B4 Relay wrote:
> >
> > > Add an 8250 platform driver for Ambarella CV75 instead of claiming
> > > snps,dw-apb-uart compatibility.
> >
> > This is a record from a changelog. There is nothing in the commit message.

...

> > The code seems like an almost blind copy of 8250_dw.c.
> >
> > > +#define AMBARELLA_UART_USR        0x1f
> > > +#define AMBARELLA_UART_USR_BUSY        BIT(0)
> >
> > So, is it Synopsys IP-based design? How this gets into this platform? This
> > whole story completely made me lost.
> >
> > > +#define AMBARELLA_UART_IIR_IID        GENMASK(3, 0)
> > > +#define AMBARELLA_UART_IIR_STATUS    GENMASK(5, 0)

-- 
With Best Regards,
Andy Shevchenko



