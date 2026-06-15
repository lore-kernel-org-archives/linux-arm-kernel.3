Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB838CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 14:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vVX6YKJ+jcJWSU5Cp+ailrbaNJVnvxKt18ThbS8vqA=; b=y+/UIxxE4O5tCzWa76zfCUNZUq
	MIhlLOrzgck0XCuAIBC6pY9h113NeT7QVUMK7a8u0eX6p13+LBReip+9g8nvMARHvVLhWKRnv4+vw
	KqjDH2JgMs+LbHjkFohTkIQiUBJxbTQeDPBPBcVzlfbCRHQ2LfUKvzaQ9GO4H3WxPVpouIJuwClNk
	hHDvKvfsqMLhLVw9YoYPQApejT0EfLEREwCsfuhi4g0i0bXc2K5NvX+ev2joL9qxC1A2DkDYZCA8v
	JQWhTQtXDa1oXb2oBz8lII7olS6LGTdxATr10S2NLgrtuUbhFKwYpgxULex/ulB0cHs8NwJxWcSmY
	E1EgLENw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ824-0000000EN7l-2KZ9;
	Mon, 15 Jun 2026 14:11:20 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ822-0000000EN7A-1M2A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 14:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781532678; x=1813068678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+jfiyocO8vr2wpyUeUWFDPlWTa92nHvjYl+1p032auY=;
  b=joAlgbyXD/FBGmunAyOFf0hhTO8izXHl1gEXpTxntLiJuYl/VuJyAioR
   MWJO01D+nx7eLONJLSKkBEGbAyU3SlfqqlW3f5AgSBb4L7tN7GyBJ9q7q
   qOS/K8Fp8rMtLkeVxjQZXHHDdfYGj3HYvd6KDcudj1sYg+HB2RqqDEa/P
   WVFPvhyXze+yMjTp8VGVG2fppaCvtYYPGU++qoEcoXVBCDx3eXRSu7KqE
   lUrSPcUCoWpzF6RL71uoHCssS0MDMmofKIWKsFh9FyCYHjsuZWVyCpiJM
   1Mde3irGwvxr1/SmOBSElqFKbt3H8d/8BaMmTgRE6ASqhIExHrDaBLXsN
   Q==;
X-CSE-ConnectionGUID: sYjdodRgTWuOgGTNalxEDQ==
X-CSE-MsgGUID: Q0CPLFDFRYW+LApw2hiyDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="86173648"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="86173648"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 07:11:17 -0700
X-CSE-ConnectionGUID: 758HNN3QRRKSim1Ta26hEw==
X-CSE-MsgGUID: U2n6ICRjQb2ToPJSQNJCmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="277688874"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 07:11:14 -0700
Date: Mon, 15 Jun 2026 17:11:11 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maxwell Doose <m32285159@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Hartmut Knaack <knaack.h@gmx.de>,
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Sangyun Kim <sangyun.kim@snu.ac.kr>,
	Kyungwook Boo <bookyungwook@gmail.com>,
	Jaeyoung Chung <jjy600901@snu.ac.kr>
Subject: Re: [PATCH 0/2] iio: adc: Initialize completions before requesting
 IRQs
Message-ID: <ajAH_xKO5NXOB3-R@ashevche-desk.local>
References: <20260613005812.160572-1-m32285159@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613005812.160572-1-m32285159@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_071118_473865_CF8BF02C 
X-CRM114-Status: GOOD (  16.97  )
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

On Fri, Jun 12, 2026 at 07:58:09PM -0500, Maxwell Doose wrote:
> Hi all,
> 
> This short patch series fixes the issues raised by Jaeyoung Chung,
> Sangyun Kim, and Kyungwook Boo regarding init_completion() and spurious
> IRQs. The report is linked below [1], but I will also put it here
> inline:
> 
> "lpc32xx_adc_probe() in drivers/iio/adc/lpc32xx_adc.c and
> spear_adc_probe() in drivers/iio/adc/spear_adc.c register their
> interrupt handler with devm_request_irq() before they initialize
> st->completion with init_completion(). If an interrupt arrives after
> devm_request_irq() and before init_completion(), the handler calls
> complete() on an uninitialized completion, causing a kernel panic.
> 
> The probe path, in lpc32xx_adc_probe():
> 
>     iodev = devm_iio_device_alloc(&pdev->dev, sizeof(*st)); /* st kzalloc-zeroed */
>     ...
>     retval = devm_request_irq(&pdev->dev, irq, lpc32xx_adc_isr, 0,
>                               LPC32XXAD_NAME, st);           /* register handler */
>     ...
>     init_completion(&st->completion);                       /* initialize completion */
> 
> spear_adc_probe() has the same ordering: devm_request_irq() for
> spear_adc_isr() before init_completion(&st->completion).
> 
> Both interrupt handlers, lpc32xx_adc_isr() and spear_adc_isr(), call
> complete():
> 
>     complete(&st->completion);
> 
> If the device raises an interrupt before init_completion() runs,
> complete() acquires the uninitialized wait.lock and walks the zeroed
> task_list in swake_up_locked(). The zeroed task_list makes list_empty()
> return false, so swake_up_locked() dereferences a NULL list entry,
> triggering a KASAN wild-memory-access.
> 
> Suggested fix: move init_completion(&st->completion) above
> devm_request_irq(), so the completion is valid before the handler can run.
> 
> Reported-by: Sangyun Kim <sangyun.kim@snu.ac.kr>
> Reported-by: Kyungwook Boo <bookyungwook@gmail.com>"

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



