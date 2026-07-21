Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA7EC4452D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 20:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3w5ac4IwXvSl6ObVeVe51cEbxNEpYaHFJLTkSKm3fis=; b=4IDXqhGAmC8LkF4acdhHWZ0tAH
	ZcLy1KuwwrdviatAlBPxMZn88xZiRrHOQHW/VfpeSdsCSSVbUCvu3rRv4mw0jF840IO2azwcKNqMA
	7ZtjuTn0fauwSeA+f9NydHg20/SLtzdX/8cT2OdheJQiURdwzL84STQwolEwsAO1GoFFOcUGN8TMf
	yFxgMWqjdvR284B7ywm7JGESqYSzXlgQ1Xyp4yv2atcGA6cx5tHU0abQogAgnfOWHzJRPW/Chzht2
	1ibeaAtrGbtoXAUa4/KNPQxn2SlF1dhrR35ntDXarYDVYGcWhBQ+x9M0LoElaWJK2EPaWG5b0nIrP
	9V3OZoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmHHx-0000000AOkX-2BRx;
	Tue, 21 Jul 2026 20:42:05 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmHHu-0000000AOk9-3JrY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 20:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784666523; x=1816202523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=skSQxPyPM6bJlDc9hM3ypyDg9GlQqaAJt8Rd7J/fRrM=;
  b=eRz05PKB/XNHGSd99DqTtx6aAwOrk3QfOwVda4mRl2G0x1iXI3BCGO77
   /4POFwf9o9JNFul5uKilP8fIjw+LXeLxIHdOAnRVPuBqSRLHDgDuYdMEk
   vHHyFb6T+8O7I0Hzb4ZRo9VNHL80yAcM7x4ibv0wtyyRru8qYwZkj232M
   X1iJd4SkT8i9GH8/v5pHOkCXEBmp4H8WkFa1uH7vthacXbBgd6si9CUxW
   EScSXSiC5iwLanI1HWqx6yRi9K/cTHcU2QNf1PznVHQASVpp27GJMnXlh
   dcMVH/yRFCTsNsusDjj+ouYQYNwc44zT/WeyqLEkrFZyhHk1BqxEYtNam
   Q==;
X-CSE-ConnectionGUID: tijkkPF0RFqEecisKsp3aQ==
X-CSE-MsgGUID: TO/4JrJBQL6R5KbZFHiaEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="96798221"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="96798221"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 13:42:03 -0700
X-CSE-ConnectionGUID: xcyV9Z45RoqNUi+xXhBnVw==
X-CSE-MsgGUID: O43iy8aXT3eVMe6FOM7Brg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="258537927"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 13:41:59 -0700
Date: Tue, 21 Jul 2026 23:41:57 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Shih-Yuan Lee (FourDollars)" <fourdollars@debian.org>
Cc: Mark Brown <broonie@debian.org>, Lukas Wunner <lukas@wunner.de>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 5/7] spi: pxa2xx: disable DMA for Apple MacBook8,1
Message-ID: <al_ZlTkEUHj-X1YS@ashevche-desk.local>
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-6-fourdollars@debian.org>
 <al81PmK1UMr2g8p-@wunner.de>
 <CAAT15mPuO71WbbS2ZpWjceCVj3FUTqHLi3wbbeV7B33JHbPRsQ@mail.gmail.com>
 <CAAT15mPrwAqLmFVF730G+iJugzNzaT=HDj_7G5-wXbhBNU7ANg@mail.gmail.com>
 <f7449a69-98e3-41c0-b535-847b8c520e10@sirena.org.uk>
 <CAAT15mNppZ6nPQ9a8Hp54XK4BXndfv+G24n4VeQ1X8GOk6fSyQ@mail.gmail.com>
 <CAAT15mMc73=cnqx7jvPXWjVUuzr-E54qh5+BR3d_G6m3NoXrng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAT15mMc73=cnqx7jvPXWjVUuzr-E54qh5+BR3d_G6m3NoXrng@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_134202_870453_9BFD6F33 
X-CRM114-Status: GOOD (  22.82  )
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

On Wed, Jul 22, 2026 at 12:09:44AM +0800, Shih-Yuan Lee (FourDollars) wrote:
> On Tue, Jul 21, 2026 at 11:26 PM Shih-Yuan Lee (FourDollars)
> <fourdollars@debian.org> wrote:

> I just tested the Initrd ACPI Table Override on the machine. Here is
> what I found.
> 
> I patched the _PRT table in the DSDT to remap device 00:15.0 (Pin 0
> and Pin 1) from GSI 20 to GSI 21 to match the SPI controller's
> interrupt line, 

I'm lost here. Why SPI controller and DMA controller has to share an interrupt
line?

> umped the OEM Revision from 0x00080001 to 0x00080002
> so the kernel would accept the override, and prepended it to the
> initramfs.
> 
> The override was successfully applied:
> 
>   ACPI: Table Upgrade: override [DSDT-APPLE - MacBook]
>   ACPI: DSDT ... 007EB5 (v03 APPLE  MacBook  00080002 INTL 20251212)
> 
> After rebooting, the DMA controller loaded without errors and both
> dw:dmac168 and the SPI controller 0000:00:15.4 now correctly share IRQ
> 21:
> 
>   21: 0  0  0  0  IR-IO-APIC  21-fasteoi  dw:dmac168, 0000:00:15.4
> 
> However, SPI transfers still timed out with -ETIMEDOUT (-110) and the
> IRQ 21 counter remained at zero — no interrupts were actually received
> from the DMA hardware, despite the corrected ACPI routing.
> 
> This confirms the root cause is not a software IRQ routing issue but
> rather that the DMA controller's interrupt line is physically
> non-functional on this motherboard. macOS also does not use DMA for
> this device, which is consistent with that conclusion.
> 
> It is also worth noting that Apple may have intentionally mapped the
> DMA controller to GSI 20 — an otherwise unused interrupt — precisely
> because the interrupt line is not physically connected.

It's impossible. The interrupt line from DMA controller is an IOAPIC RTE that
is programmed by BIOS, there is no "physical wire" in traditional meaning.
In any case this link is done on the SoC level. Apple can't burn that out
of the die. They even can't fuse out that (of my knowledge LPSS is always
present IP, the fuse works against the full controller, not parts like
disabling interrupt message or "line").

> On macOS and
> Windows, no DMA driver is ever loaded for this device, so the bogus
> GSI 20 entry is harmless. It effectively acts as a silent signal to
> the OS that interrupt-driven DMA should not be used on this platform.

Maybe because they didn't get how it's supposed to work.

> Since the DMA interrupt line is physically unconnected, no completion
> interrupt ever fires, causing all SPI transfers to time out with
> -ETIMEDOUT (-110) and ultimately deadlocking the applespi driver.

No, this analysis is wrong. There are up to 3 interrupts that may participate
in the design: DMA controller; SPI controller; and SPI peripheral. The first
two usually use IOAPIC RTEs for the interrupts (and hence represented as
Interrupt() resources in _CRS methods on DSDT, plus CSRT for DMA), and the
last one often is GpioInt() and has nothing to do with DMA at all.

> Therefore, forcing PIO mode via a DMI quirk in spi-pxa2xx-pci remains
> the only viable out-of-the-box solution for this platform.

-- 
With Best Regards,
Andy Shevchenko



