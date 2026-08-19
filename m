Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB9FC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 06:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0LuRY9GGtKBLn1AM4Xejj5e7A5jvUqbZlZYnDo+Opk=; b=CGzfHMXzLs4Ey+c3d8Mv1BAJV4
	zwk0+nIe1sYcrl7IIqbSRmx7CefzY+ELcta9gULidAI0E6FBpUlHDiS4oafhvBS4ZvVBIhwROlc/7
	h/p4HVjcVmDZqPNzfQdDvLlFF8I6FXMisPznp65F2iHehnRtjYKkHMdygUNiF+jFFj3TqEUyGNUnV
	28v5eFjGbvL5kmvm7SD10GwVmTJLUIdVONc8f2sHdjiyAyB3H3UyIQU4ygzgastdGkgpMGvo7qB47
	IrCh21gJQSIFz5zOcIxBy3+Q/0iWZ4Of1I0Uyhm1w0SlA+cEf08v9JBWFRlO0pDllGjjssmQD6rOw
	9785sAyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwa3V-000000097Gu-3FhO;
	Wed, 19 Aug 2026 06:45:45 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwa3T-000000097Fx-1Tzx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 06:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787121944; x=1818657944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=12reE8wYpDisf9Z1pLaA6vVzzI2+6J2CVzQ6j8h7qW0=;
  b=mt7YtMYrXge1PhS66r/pclU8+ji2MfRyEkc7gucJKlSIYuLK1Je7JTgu
   G9n71zbuQuE+3+0JJKWIRyIZVmf+i7PXxElpJlTkJ7U/Tk8hwvD7Oqwyh
   NRxa/breReLDcb7JqvkBWzpUXE+v1oQH9xhitFP23BBkSJJuqnJJ4TjLw
   zrSyfNCpbX1y92UufDCmcLBq4W7xC9Bf0LwsPTyAUIUyHfeteF+bC6dC7
   AFgxctR/i+b8FrRrOWmweG42Cll4g4rOOrQw+lTatjPv3RV+eOykD1CmE
   Jx+79jeVCbdCYb1q8L5eM90+RXPM4qmpLGQPLMVoDo0gJb9OnIipbgd8U
   g==;
X-CSE-ConnectionGUID: R2CMXXgJTdqkYG62gth+Cg==
X-CSE-MsgGUID: HwjCAHvFS5Okofd3UOYBIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="105007617"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="105007617"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 23:45:42 -0700
X-CSE-ConnectionGUID: 26tNyrbXR6WtNCoQBh4Z3Q==
X-CSE-MsgGUID: WTdqJy6NQsmcpT2UCq0xCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="288962761"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.106])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 23:45:40 -0700
Date: Wed, 19 Aug 2026 09:45:37 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: xiic: restore non-managed runtime PM to fix clk
 WARN flood
Message-ID: <aoVRETUfgS4FwMnq@ashevche-desk.local>
References: <20260818-i2c-xiic-restore-runtime-pm-teardown-v3-1-5fd315b078e1@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-i2c-xiic-restore-runtime-pm-teardown-v3-1-5fd315b078e1@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_234543_469376_D4615CD5 
X-CRM114-Status: GOOD (  16.40  )
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

On Tue, Aug 18, 2026 at 08:35:10AM -0700, Abdurrahman Hussain wrote:
> The devres conversion replaced manual pm_runtime_enable()/disable() with
> devm_pm_runtime_set_active_enabled() and dropped the remove-time runtime
> PM teardown. The managed release tears runtime PM down in the wrong
> order: it calls pm_runtime_dont_use_autosuspend() before
> pm_runtime_disable(), i.e. while runtime PM is still enabled, and devres
> is LIFO so the devm_clk_get_enabled() release runs afterwards.
> 
> At remove(), pm_runtime_put_sync() leaves the device active with the
> autosuspend timer armed. Clearing use_autosuspend then makes rpm_idle()
> suspend immediately, and xiic_i2c_runtime_suspend() clk_disable()s the
> clock. The later devm_clk_get_enabled() release clk_disable_unprepare()s
> the already-disabled clock, so clk_core_disable() WARNs ("clkN already
> disabled") on every teardown.
> 
> Drop the managed helper and restore the non-managed runtime PM setup and
> teardown, so runtime PM is enabled once in probe and disabled once in
> remove and the clock enable count stays balanced.

...

>  	pm_runtime_set_autosuspend_delay(dev, XIIC_PM_TIMEOUT);
>  	pm_runtime_use_autosuspend(dev);
> -	ret = devm_pm_runtime_set_active_enabled(dev);
> -	if (ret)
> -		return ret;
> +	/*
> +	 * Enable runtime PM by hand: devm_pm_runtime_set_active_enabled()
> +	 * tears down in an order that races the devm-enabled clock release and
> +	 * makes clk_core_disable() WARN (see xiic_i2c_remove()).
> +	 */
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
>  
>  	/* SCL frequency configuration */
>  	i2c->input_clk = clk_get_rate(i2c->clk);

>  	ret = devm_request_threaded_irq(dev, irq, NULL, xiic_process,
>  					IRQF_ONESHOT, pdev->name, i2c);
>  	if (ret)
> -		return ret;
> +		goto err_pm_disable;

This might be problematic now. You need to unwind the IRQ request in non-devm
manner as well. Scenario is that IRQ comes exactly after PM is disabled
in the error path. Is it a problem today? What about tomorrow (assuming some
new chips / code is added)?

The rule of thumb is that, no devm_*() call should be followed by a goto.

-- 
With Best Regards,
Andy Shevchenko



