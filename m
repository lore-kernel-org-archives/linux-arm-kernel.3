Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5119BC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 20:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gznV+LB15vmhWoRTlpGEHarjonWqGIox8XJlDCHDZK8=; b=jQv+Ph9AuN6tH1zJv+PC7Q1mcg
	BrH8AChFRyONKgSa3rP1MmCZs6oCAEzeEs6bhStpBT6Afc0/qbXGPRSdCJ9qO5FgvUoXINmLVTjRV
	/Koy8abon7oPbC+7YwAvNbtCrNinoQFhCJmOpBOUTn7WiqZCfgr+XsLTu69zor3VbiYPcOlUchdtk
	HB3pfTXe6bDficSYeETpGqivmpMyK0u/7+ECkQzaANpYOKQcdb7YjBresk9skGXS62dbeqOYqu435
	E2Yf0EMejOGULN/AXBLm14Y7hocdGk6zuS+WcH+fzZrZ52cKyKs8MRA84js3FmEJfXGvY0G/pjvao
	f42tdy2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmH4y-0000000ANfM-03av;
	Tue, 21 Jul 2026 20:28:40 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmH4w-0000000ANf0-1Q3u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 20:28:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784665718; x=1816201718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=i41F0VtbH8eej0JjA+9cjDBrSagBe6HmsLGLINWNq1Y=;
  b=gUgXs4b4c8pdQs1WguH1fpH0VhZXdaDiuoKghmCnm+VAAHLPgG86we5e
   BuyPAa7obWmiUEO+7jRLfhUCXlSvjfeG1ekn8T1UTGh66x3hn2jt8ASwf
   +FA9h+jWjImBjGkjTHSmgDEtdQA3rqCXm3IaQBQly1vlAiwCXnjWpIxL2
   j7xprNA8AH9CCO4fwoJIDLrqnOvmY+kBeBPOVxOqsH2ZZBkDgBiXIQXsi
   sjeAS0SX8LO9xfaBZBNFZXbJ4EeXEV6Pl6nN2WFnJZGtGURxZpCdaR3d4
   uJ8RuQQZ94ruA5vPMWG9Vy6GoyUS6ifxp9SLi3z0+2FRLcIrZ1GZeEqyB
   A==;
X-CSE-ConnectionGUID: GMW5M2PqR8u59RJzDM1m/Q==
X-CSE-MsgGUID: I3mfsrx2T4q4FEFDlcwdrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85157318"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="85157318"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 13:28:35 -0700
X-CSE-ConnectionGUID: rvQzQn6cTiy66MrPIUEa/A==
X-CSE-MsgGUID: H4YlEInCRuK03bLxzDbNyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="287898383"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 13:28:33 -0700
Date: Tue, 21 Jul 2026 23:28:29 +0300
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
Message-ID: <al_WbeyPMvtcmO32@ashevche-desk.local>
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-6-fourdollars@debian.org>
 <al81PmK1UMr2g8p-@wunner.de>
 <CAAT15mPuO71WbbS2ZpWjceCVj3FUTqHLi3wbbeV7B33JHbPRsQ@mail.gmail.com>
 <CAAT15mPrwAqLmFVF730G+iJugzNzaT=HDj_7G5-wXbhBNU7ANg@mail.gmail.com>
 <f7449a69-98e3-41c0-b535-847b8c520e10@sirena.org.uk>
 <CAAT15mNppZ6nPQ9a8Hp54XK4BXndfv+G24n4VeQ1X8GOk6fSyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAT15mNppZ6nPQ9a8Hp54XK4BXndfv+G24n4VeQ1X8GOk6fSyQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_132838_422351_8CCCEDBA 
X-CRM114-Status: GOOD (  12.19  )
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

On Tue, Jul 21, 2026 at 11:26:27PM +0800, Shih-Yuan Lee (FourDollars) wrote:
> On Tue, Jul 21, 2026 at 11:05 PM Mark Brown <broonie@debian.org> wrote:

...

> Actually, I was just following Lukas's suggestion to modify
> drivers/dma/dw/pci.c to do a quick proof-of-concept test, and I used
> an AI assistant to help me write and deploy the driver quirk code.
> 
> I have previous experience with the Initrd ACPI Table Override
> mechanism, so I can definitely try that on my machine next to see if
> we can get DMA working properly by aligning the PCI routing and DMAR
> mapping correctly).
> output.

For old hardware (before Skylake) LPSS DMA interrupt line is defined in
two places: DSDT (and/or PCI) and CSRT. Changing in one might not help
as CSRT may have something different. Check drivers/dma/acpi-dma.c
acpi_dma_parse_resource_group().

-- 
With Best Regards,
Andy Shevchenko



