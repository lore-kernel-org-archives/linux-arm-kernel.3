Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10C7C982CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 06:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GSmXDwmertwXe0HkM935tbNyBQxGsgPGDwzb0ouUuA=; b=R9ND33fu5hdrtoiC8iFxNirTND
	L5KHEl+AYPiv9ZlCeMlj4KvMHsyL5DaqSaLNLKKzlO5aZ1HwuPs2W/NC+JFc5/r4bUSt1JOdpGrZh
	eE2Nkbc2irXiZhvEOnkfD4VStjfzLNdRZF1DHRM9jDdJyAui0z/jQaYxJ/Tkbi3vVWN3YE0da3RbZ
	j3WvR6rpbOYAqmwu6dnBn2DU1oYoNyNYLRhUeO31pHgSqLpVxUVuZW+GuMTo6Si8JJu75cGVSvoGG
	eBxkdxYsKHviQJgJSTHujlF/kpRhjdXghf4kjhQ1pnwCSlokVvvvYmmaZ4XWpnHB1aMy6k3uIJ0mg
	wjvh4OEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75pF-0000000Agfq-1jDm;
	Thu, 17 Sep 2026 06:42:29 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75pC-0000000Agf3-2SaR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 06:42:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789627346; x=1821163346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GLl+PNDb3G6wQ93kIOoz2vznPBNPJZqJdDb2FXYmeHI=;
  b=S+wRUKIENXNUfkq+BwJUcPt1ma47QNpnYV+3gjOurae553FbKt5Yh9h4
   czC1bjDkVn4eXUsUtB9yArYzsFcJcmzM3SeTwK5Dm47VzQaDc9Pq4cveD
   UG4HoOUGweXV/cLxyVCVtmYW10v6rqLLTm8zxxfXKuD4tiCZTbi30C9d/
   GJNZJDE8+e8FytDThd62zPaD18hppbXSzNP/Mea1CYUe2tz8aFPbYKUjT
   gSEjQB0w4uW0z9hcNM6NRbGfT0QKKd1bPHLLQ7986h4V9ASM3LezLXGbW
   K226ezkrJAx448trXex448J8uY/DbxwWzD3a6Qwu7v0pj+0D1bZ3QECjZ
   g==;
X-CSE-ConnectionGUID: yuZx4wxATIaVHDmESFOm5A==
X-CSE-MsgGUID: a0aU334sS6afEdvSW6mlqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92528028"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92528028"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 23:42:25 -0700
X-CSE-ConnectionGUID: PG/D0x/ySmKmZq1ey6kmtQ==
X-CSE-MsgGUID: JHg0psEGTpaArnv+HRX1zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297099751"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.11])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 23:42:23 -0700
Date: Thu, 17 Sep 2026 09:42:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Malathi A <malathi.a2000@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] serial: 8250_uniphier: Use devm_clk_get_enabled()
Message-ID: <aquLzbM25C8dDb0p@ashevche-desk.local>
References: <20260917040511.103232-1-malathi.a2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917040511.103232-1-malathi.a2000@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_234226_646391_5770CE0C 
X-CRM114-Status: GOOD (  16.94  )
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

On Thu, Sep 17, 2026 at 04:05:09AM +0000, Malathi A wrote:
> uniphier_uart_probe() enables priv->clk by hand and is then responsible
> for disabling it again on every error path. It misses one: when
> uart_read_port_properties() fails the function returns directly, leaving
> the clock prepared and enabled. The neighbouring path, taken when
> serial8250_register_8250_port() fails, does call clk_disable_unprepare(),
> which shows the leak is an oversight rather than intent.
> 
> Rather than adding another manual unwind, switch to
> devm_clk_get_enabled() so the clock is released by devres. That removes
> the error path entirely, along with the explicit disables in the
> register failure path and in uniphier_uart_remove().
> 
> The clock is still disabled and re-enabled by hand across system sleep,
> which stays balanced: only SET_SYSTEM_SLEEP_PM_OPS is used, so the
> device cannot be unbound while suspended and devres always sees an
> enabled clock at detach.
> 
> Found by smatch:
> 
>   drivers/tty/serial/8250/8250_uniphier.c:232 uniphier_uart_probe() warn: 'priv->clk' from clk_prepare_enable() not released on lines: 205.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> -	priv->clk = devm_clk_get(dev, NULL);
> +	priv->clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(priv->clk)) {
> -		dev_err(dev, "failed to get clock\n");
> +		dev_err(dev, "failed to get and enable clock\n");
>  		return PTR_ERR(priv->clk);

Consider fixing another latent bug here, id est with intermittent probe defer
this will spam the kernel dmesg a lot, so converting to use dev_err_probe()
will fix the issue (but at the same time you may convert all of the error
messages in probe to use return dev_err_probe() pattern). This needs to be
a separate change.

>  	}

-- 
With Best Regards,
Andy Shevchenko



