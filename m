Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8A7C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 06:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUGtrb8gsEIeJXlm/eWUeYMFS7bUYFrpsz1jvCDC0pI=; b=a8tGbyjyIHMZLNELjQ2L3ZBIGF
	QNyXw8Gep2qdADqjMMutnSYa4Qx7Q3utZGuujj1dPidLFGJ0GoboQt8i18cbZ35moGCaJ7sd3n1Ej
	2QZYefsYpXxr7/4FCti8c+pHj+NKxa8xOticS8WLtFFoUtoId+HZrqVisrVuxZtbKfMgXb32w5XIw
	99NMvGj2Rw58EI53wiTI11xdGjUZoF3+BUN+QccyNgQZ8LdWxgQhU97+unmyI5cyCOmHYHSKYnT+4
	3naZZSzwALoEsOeVbekLrNvFaNmp07L30Wdfd6yRG7WXzqFTraPzeTKHx8hrvyx9htBZ0WBlypyZ0
	7odYSxqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwa5u-000000097cp-1JfD;
	Wed, 19 Aug 2026 06:48:14 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwa5s-000000097cL-1ShA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 06:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787122092; x=1818658092;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j2H1knM9PX+Wt32Jvy9psq03GLJHDRacQxhLvd+A+78=;
  b=B8vKmukzAlPHbtfRrbcuEg6HuFaDiGMha2J9obvnIP01dx9WDKzDrcCI
   kDfsJ49+yXVA2QBLNmLqdtJJfbmn3cj7KXOSDw7w59fW7AH2aopAysjfp
   kHMwYxZBwaPfreZQPuxswPnYp+5CAiodjcx0VFU8+ygl8puQg+4I3gXo0
   uGCj5vmiWKmBB+tfJNMWOK43sPywKhRIGpew6zP8rLVY1f8YhKzC03wjk
   Qg9HeNbgLXn0htAkUPkiAeusO3afbbMk/Ru6N/8Ymzr3mWq9gCH6x0HZ8
   Skcqg6WK+H7ZMQuRlHsfD0+1IXuR3LveGickNPOTMZPXQ3ZOCao82UzSr
   w==;
X-CSE-ConnectionGUID: vaoxkkJBR4yAM/FcgM3b7g==
X-CSE-MsgGUID: eOSPQAP9SBeiuJrG7RNQZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87643465"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87643465"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 23:48:10 -0700
X-CSE-ConnectionGUID: fg23qZLCQPyRt/XjYmT8OQ==
X-CSE-MsgGUID: o6VJj8oiTke6KvHZWeuXxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="264137221"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.106])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 23:48:08 -0700
Date: Wed, 19 Aug 2026 09:48:05 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: xiic: restore non-managed runtime PM to fix clk
 WARN flood
Message-ID: <aoVRpS7EmL3YYBWH@ashevche-desk.local>
References: <20260818-i2c-xiic-restore-runtime-pm-teardown-v3-1-5fd315b078e1@nexthop.ai>
 <aoVRETUfgS4FwMnq@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoVRETUfgS4FwMnq@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_234812_397942_E2D2147E 
X-CRM114-Status: GOOD (  15.94  )
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

On Wed, Aug 19, 2026 at 09:45:41AM +0300, Andy Shevchenko wrote:
> On Tue, Aug 18, 2026 at 08:35:10AM -0700, Abdurrahman Hussain wrote:

...

> >  	pm_runtime_set_autosuspend_delay(dev, XIIC_PM_TIMEOUT);
> >  	pm_runtime_use_autosuspend(dev);
> > -	ret = devm_pm_runtime_set_active_enabled(dev);
> > -	if (ret)
> > -		return ret;
> > +	/*
> > +	 * Enable runtime PM by hand: devm_pm_runtime_set_active_enabled()
> > +	 * tears down in an order that races the devm-enabled clock release and
> > +	 * makes clk_core_disable() WARN (see xiic_i2c_remove()).
> > +	 */
> > +	pm_runtime_set_active(dev);
> > +	pm_runtime_enable(dev);
> >  
> >  	/* SCL frequency configuration */
> >  	i2c->input_clk = clk_get_rate(i2c->clk);
> 
> >  	ret = devm_request_threaded_irq(dev, irq, NULL, xiic_process,
> >  					IRQF_ONESHOT, pdev->name, i2c);
> >  	if (ret)
> > -		return ret;
> > +		goto err_pm_disable;
> 
> This might be problematic now. You need to unwind the IRQ request in non-devm
> manner as well. Scenario is that IRQ comes exactly after PM is disabled
> in the error path. Is it a problem today? What about tomorrow (assuming some
> new chips / code is added)?

(To be clear: I'm talking about next call(s) that may fail, like xiic_reinit()
 later in the probe.)

> The rule of thumb is that, no devm_*() call should be followed by a goto.

-- 
With Best Regards,
Andy Shevchenko



