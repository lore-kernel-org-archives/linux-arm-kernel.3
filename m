Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3CEC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 19:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JzNq+bRRIku6eXf6m5DElyGnO2G3fQU9+RJPFnpizM=; b=AJy6kGGwQzEtXmsNm2BRk/Gecs
	YgXItsFT1ZqzvjVau1DqVxbZQvXD0b/uqDpl41mqstO5OH7WVW8bzRSJZYFEydOVKtyrn0u9v4seT
	VQgPDXcViLFeAbSnwmjo+DNd0/4P4/5yYQ2KKXYNeP5yh0ymOWS2p+FljaRmn/hPOS6bHrYNuJKx2
	J3X9vK85pxD3MvlKxQyA1/x6Im0i/8tbE/HmdWyb+rCwtoabP4wg45QO+xkgKgEBngClT6SZEKXyJ
	chHGd+u2U6VW6sLvJwQ67CzRqtwneX68iH+U9c3xvuisbfmvW7afhnTw3tLbf3y+kXVsbLiq5pKZ9
	m0ISlSFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlu3V-00000007o1D-3FEW;
	Mon, 20 Jul 2026 19:53:37 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlu3S-00000007o0k-44Wq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 19:53:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784577215; x=1816113215;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+454JAV+BxB9Vte1eAS5c/9Mxzjo1tSIngrpdtWKheE=;
  b=ARbXYpRxgIGceh7GIKolzrIczs575fK+DKEosNHL0EBoWZLgjKPSq1k/
   DK4EGQnOk8uV/QtQN7TXeQE6VOoQFQtZpZrDajGoSUD6HCV2ful/UYkIN
   fJCUM++OWPt1x/4lSpujPrhyiFRRpc97jo168g6CPyp7KY/Cv2WSTdFY5
   nBc+6e/1Qd/xUgGmxT2euc77LptutwqkmLvUQ0izDjF6hr6TaQz3x11Yt
   6HySKph/sTcow2IExvBaXt7/OvTeWunXi7GOc/Oeh+Udh1Vz2l7CsHSTR
   hpUyjk43eor+oh+FbOV9LVEXYYWG9dv9AOif1Nsguk8bCGeEiyIAMb7Cb
   w==;
X-CSE-ConnectionGUID: OIkOGCL2TZi1ldEX9JBh7g==
X-CSE-MsgGUID: thuZbkYPSCiNmftEv86vzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="96680183"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="96680183"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 12:53:34 -0700
X-CSE-ConnectionGUID: P1jYgCOPQZmE6tA/345Qww==
X-CSE-MsgGUID: 8bDkAdW4R3ek/0OxhgkRiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="295760588"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.175])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 12:53:31 -0700
Date: Mon, 20 Jul 2026 22:53:29 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Shih-Yuan Lee <fourdollars@debian.org>
Cc: Mark Brown <broonie@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 3/7] spi: pxa2xx: overhaul teardown and suspend
 sequence using pxa2xx_spi_off
Message-ID: <al58ubdrmJpPtr0F@ashevche-desk.local>
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-4-fourdollars@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720162117.32304-4-fourdollars@debian.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_125335_076883_F843B139 
X-CRM114-Status: GOOD (  13.22  )
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

On Tue, Jul 21, 2026 at 12:21:12AM +0800, Shih-Yuan Lee wrote:
> When removing the driver or suspending the device, the clock must not
> be disabled while shared interrupts are still active. Gating the clock
> before waiting for in-flight interrupt handlers to complete results
> in race conditions where the handler performs unclocked MMIO accesses,
> causing PCIe Completion Timeouts.
> 
> Overhaul the remove, suspend, and runtime_suspend paths to use a strict
> synchronized teardown order:
> 1. Disable hardware interrupt generation at the controller level.
> 2. Mark the device state as suspended (suspended = true) to prevent
>    subsequent interrupt handlers from attempting MMIO reads.
> 3. Call synchronize_irq() to wait for any active interrupt handlers
>    to drain completely.
> 4. Gate the clock via pxa2xx_spi_clk_disable().
> 
> Additionally, commit 29d7e05c5f75 ("spi: pxa2xx: Avoid touching
> SSCR0_SSE on MMP2") documented that disabling the hardware block via SSE on
> MMP2 SoC platforms corrupts the RX/TX FIFO. Instead of calling
> pxa_ssp_disable() directly, use the helper function pxa2xx_spi_off(),
> which respects the MMP2 platform quirk by bypassing SSE register writes.

...

> +	/* Wait for any pending interrupt handlers to complete */
> +	synchronize_irq(ssp->irq);

Unneeded. free_irq() implies that.

> +	/* Release IRQ */
> +	free_irq(ssp->irq, drv_data);

-- 
With Best Regards,
Andy Shevchenko



