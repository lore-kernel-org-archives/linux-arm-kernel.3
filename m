Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAFBC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 15:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2othaWJT08mqqPE000kDL5LKOe1CaEnxgsCt+8sKLk=; b=uVEUdVIV7OtGVxBT0cqQI3XJeR
	9cqeHxK+X4vI8w0qlrIOKZUYSwUovT5NXOotKuwURj/+bwUK7op4c6PFwdqGjHWpZcBGrsKG9A0U6
	LGEAyeLbzAQMVDTXwF4zrQEbVqURMYTUKfsEbiqHOCn2qi/IUdurSfjS42qG5AeYx/Auodc5eSKt5
	1gXO7fhKEdiMCGf1okfXh3LEde0pZSCV1ifLCPGKshjLe1mtnQc93IslYOaarQuSNMEk/emDUqN8Z
	yuLVLp0AdJOsyWn5ypcQh658SlzbPfe+tCPWDQLiVm6qhFdu7ItKfYrapyHYqObvuIrsqdCfyaPWu
	GzwiIsfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0zD-00000001IsP-3Vq0;
	Sun, 26 Jul 2026 15:41:55 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0zB-00000001Irl-36wH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 15:41:55 +0000
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4a483a552efso790743b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 08:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785080512; x=1785685312;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z2othaWJT08mqqPE000kDL5LKOe1CaEnxgsCt+8sKLk=;
        b=UvIDveUs/ej9dGoBFpjQ+u6e/Qdg5HdbQ+VjdG1vRusZi/nmsy50KmyzxADtKYHZJb
         PJmxuWucKSEtzbnoSTOCxd6g+nyzIwifbWUWThB7VutNmRXXIPqAAzYnYp8qQzLBbQPJ
         6eqa5WHS0dfyDTYkXgMcA9K9G5JVhE4UxciCgEY7qslvEn5DHTRX63NGFZhgQZFM4s70
         slgoC+jNps80JT86pVnT7Edx5D/eU5PouVaUnEQBM+WmlRQvgKE/qwHGreY0494SHs1L
         3D+9K5ojzU7A8cMuHvt6OTBZLRuTEMR9BQ2+DGKhYcv++ONWKVnIEyxnRQb6X9UmqZQ/
         ZVVw==
X-Forwarded-Encrypted: i=1; AHgh+RpNl7LxIRqsR4G5U9sDSQoYWwM3kmEo1C0vsgHyi+A0jiA81RGfpm69NX5I2H6hM9UFh/TRnr4pFja0140aajv0@lists.infradead.org
X-Gm-Message-State: AOJu0YzcLXmM7uG2fgp8Ug2TcVHA+6YVcwnvwz1AT3NZ+dqahMMJtPVJ
	FLEm4GlUrDx1Uf35uCZqI1PXJLUyC1hdORoJFaqQL97EPh7Vgav18j6mw3XhqMkDGg==
X-Gm-Gg: AR+sD12ZZrqtfVqHEpltyrqPnT/bOTriq1hz2YuKT+V+74Y00UcpVpebFlowwXVCU12
	YOztsEusmiHoTtKiHW5c2ZgXlVW0KXvhyH8BJkjomO0OCFTWdEYQ8Mp8AE+LEoXx/KVVEWUKyCw
	NzxIaYpaUlk6b4qI8cqkrrGRL4+Cyeiq0UfODBoKWX67RUu1zJj+eqxAgd6eJD0+7zSiBOrjk/7
	o76f4ROI1kGK5y08QL8Y13+KOtV46cz2NUFuHtXKw291ToX8/fp3yU8bKULWF9NCZAscRAAkNkN
	ooRD9EFleIR4bKzFdYMkNsGUFqmj4jMgk3qtLvuEMhlqsT3aan6qVIQ35fC+xJRUYpO5QRbmoMu
	/nK9T18Tnvw/rrMbhp9uUoUVkM+HW0Ise1y/QN4z9Mr41Qt0isd24DchzIgeqUMXkKsj4o/OHCn
	pDWcY6TnzWiuqg/a7qEVcwGyFlLQ+Jfdxg+5AnNLJBd5Hv52JxAz2OqFkaXW3tKQ+Hjyvnl0X+
X-Received: by 2002:a05:6808:1b27:b0:49f:a87e:2316 with SMTP id 5614622812f47-4ab6a13988bmr5080982b6e.31.1785080512282;
        Sun, 26 Jul 2026 08:41:52 -0700 (PDT)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com. [209.85.160.48])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ab0c7a1756sm9133164b6e.3.2026.07.26.08.41.51
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 08:41:51 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-44cedfaab6bso649872fac.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 08:41:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq26QdG7o0C2B7unkghym8h7oVrrcQU8IFwX6VDLUyakfSIDqvllKVUMWHyFZ8RR9aMYMuBJGpPyMtLH0qTq65K@lists.infradead.org
X-Received: by 2002:a05:6870:d629:b0:456:e129:9446 with SMTP id
 586e51a60fabf-457f23abf1emr4538214fac.3.1785080511041; Sun, 26 Jul 2026
 08:41:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-6-fourdollars@debian.org> <al81PmK1UMr2g8p-@wunner.de>
 <CAAT15mPuO71WbbS2ZpWjceCVj3FUTqHLi3wbbeV7B33JHbPRsQ@mail.gmail.com>
 <CAAT15mPrwAqLmFVF730G+iJugzNzaT=HDj_7G5-wXbhBNU7ANg@mail.gmail.com>
 <f7449a69-98e3-41c0-b535-847b8c520e10@sirena.org.uk> <CAAT15mNppZ6nPQ9a8Hp54XK4BXndfv+G24n4VeQ1X8GOk6fSyQ@mail.gmail.com>
 <CAAT15mMc73=cnqx7jvPXWjVUuzr-E54qh5+BR3d_G6m3NoXrng@mail.gmail.com> <al_ZlTkEUHj-X1YS@ashevche-desk.local>
In-Reply-To: <al_ZlTkEUHj-X1YS@ashevche-desk.local>
From: "Shih-Yuan Lee (FourDollars)" <fourdollars@debian.org>
Date: Sun, 26 Jul 2026 23:41:39 +0800
X-Gmail-Original-Message-ID: <CAAT15mMaZWdkp9YRKvRDRw-WCA-4nWGGo8gge=D7oBKUr1yysw@mail.gmail.com>
X-Gm-Features: AUfX_myjmSRotxH1zLRimxUCvDVSz9Mkj6eNoqv1Zp2kNAxKWsuPvlHvnixM1FE
Message-ID: <CAAT15mMaZWdkp9YRKvRDRw-WCA-4nWGGo8gge=D7oBKUr1yysw@mail.gmail.com>
Subject: Re: [PATCH v16 5/7] spi: pxa2xx: disable DMA for Apple MacBook8,1
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Mark Brown <broonie@debian.org>, Lukas Wunner <lukas@wunner.de>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_084153_780197_270D4F18 
X-CRM114-Status: GOOD (  17.16  )
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

Hi Andy,

Thank you for the detailed feedback and for explaining the SoC-level
interrupt architecture.

> Neither is preferred until we will fully understand what's going on there.
> Yes, DMI quirk is a last resort, but to come to that we need to try better
> options. See my other reply about the DMA case.

I completely agree that DMI quirks should be a last resort when better
options exist. I have removed the custom force_pio module parameter
from the series.

Having investigated the ACPI resource options and confirmed via MMIO
that the EFI firmware permanently holds the LPSS DMA hardware block in
reset (LPSS_PRIV_RESETS = 0x0), applying a targeted DMI quirk in
spi-pxa2xx-pci.c appears to be the unavoidable last resort required to
prevent system hangs on this platform.

> It's impossible. The interrupt line from DMA controller is an IOAPIC RTE that
> is programmed by BIOS, there is no "physical wire" in traditional meaning.

Thank you for the correction regarding PCH SoC interrupt routing. You
are completely right that within the PCH die, LPSS interrupts use
IOAPIC RTEs rather than discrete physical PCB traces.

> No, this analysis is wrong. There are up to 3 interrupts that may participate
> in the design: DMA controller; SPI controller; and SPI peripheral. The first
> two usually use IOAPIC RTEs for the interrupts (and hence represented as
> Interrupt() resources in _CRS methods on DSDT, plus CSRT for DMA), and the
> last one often is GpioInt() and has nothing to do with DMA at all.

Thank you for clarifying the three distinct interrupts involved in LPSS systems:

  1. DMA controller interrupt (dw:dmac)
  2. SPI controller interrupt (00:15.4)
  3. SPI peripheral interrupt (GpioInt())

On MacBook8,1, the applespi input device specifically uses the third
mechanism: a dedicated Out-Of-Band GpioInt() line (TPAD_SPI_INT_L)
connected to the PCH GPIO controller to drive SPI keyboard and
trackpad transfers in PIO mode.

> For old hardware (before Skylake) LPSS DMA interrupt line is defined in
> two places: DSDT (and/or PCI) and CSRT. Changing in one might not help
> as CSRT may have something different. Check drivers/dma/acpi-dma.c
> acpi_dma_parse_resource_group().

Thanks for the pointer regarding CSRT on pre-Skylake platforms.

Direct MMIO inspection of the LPSS DMA controller (PCI device 00:15.0)
on physical MacBook8,1 hardware reveals that Apple's EFI firmware
leaves the functional reset register (LPSS_PRIV_RESETS at BAR0 +
0x204) permanently set to 0x00000000 (held in reset).

Since the LPSS DMA controller is held in reset (0x0) by EFI firmware
and the SPI peripheral relies on the dedicated OOB GpioInt() line for
PIO transfers, forcing PIO mode via the DMI quirk in spi-pxa2xx-pci.c
accurately reflects how EFI configures the hardware, allowing the
driver to operate reliably out-of-the-box without system hangs.

I have compiled the complete MMIO register dumps, schematic
references, and physical hardware test logs in a technical report for
reference [0]:

Thanks,
Shih-Yuan

[0]: https://github.com/fourdollars/MacBook8-1/blob/main/spi-keyboard-touchpad-technical-evidence-report.md

