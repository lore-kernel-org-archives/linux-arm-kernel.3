Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F238C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 08:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QykdCuz3ObbGK17zwhD93Vyb082PIq8C7a4PH9Y6qI0=; b=gGYOitqVuuNPTYrPplH1JIQJR9
	WJxvaM8pA1L/qp84liw674bAgh9phQ9uVOobc4dBrcS5nQ1L/wr9udfFjuc/mNLcFtSo9K1tCni2g
	gYs+6FKXl/FuAHIuGQZkLqxMqW2WvGq1MOZWc31IDpA6Ufd9V7Hh/B9ghYFmYoIf0U+jyaK6ba7Et
	h6A/cxQPJCYK2VgAWU3a0G/dtsV/goyIVGxNPi/BOyuvGFWIAjGPpqwl9MEUWI7EpzMUO24906DYl
	zkCWDR1qK9UwTf0vyHDngzlJzYc6taaNKHQjLSSsm3oYBh+mpAGnwUHbQOBgSmAV5jPjQbVMvt7uo
	gnT8gvGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4Cc-0000000FdZX-0dhW;
	Wed, 12 Aug 2026 08:20:46 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4CZ-0000000FdYt-2Pts
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 08:20:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786522844; x=1818058844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zY9lfAeGg60M/szQsAT7pL7C5lr5YMoI0MFXXJjlo38=;
  b=CurxtQEkH1h8IJVr1xzdMAnQIFnLNO6pbBpiIRFT5Ixv4OOw8ier+dnk
   zrps4wbJNGwZSnd6Vbm6ICciy1qPZzhhgV2/6QriNDvAlsifak0ieqmGq
   eghACET/sI7x2JYH1MpXkwQViMT84V/GF3CdLWleR+GDLDTybl6K2eaFk
   CAd5GER0hLfyak+/pXvUSV9JahuGN9sIfy8ZcPSOnKGatjav+PgkdTzRl
   RbV7Uniy82wiLSC4eYvedddQtZ4mRd3zUsGGTIKJeDlHc6ZkmALV2124x
   qOuuZn5ShviXplItjDUONBoL7B+UgjxOhbP22ZhGX3xxEqgbVeRS6BPaX
   Q==;
X-CSE-ConnectionGUID: 0jTRvK6xRxKjc5zmR7Fn2Q==
X-CSE-MsgGUID: B5IlsPf6Stm35yzCdutG7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98581842"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="98581842"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 01:20:43 -0700
X-CSE-ConnectionGUID: HxDbThHLS1imTTlw115NKw==
X-CSE-MsgGUID: 4sV80IQTTc+RqD4rcZy7VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="267070761"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.92])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 01:20:40 -0700
Date: Wed, 12 Aug 2026 11:20:37 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Linus Walleij <linusw@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, robh@kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] pinctrl: keembay: Propagate errors from optional IRQ
 lookup
Message-ID: <anws1QKiDqMjLNYl@ashevche-desk.local>
References: <20260810053142.27938-1-phucduc.bui@gmail.com>
 <20260810053142.27938-2-phucduc.bui@gmail.com>
 <CAHp75Vcb12Ok=yEF_WqKp=yS_EW9SWS=G2+B7Fa7aLH=u-aR0w@mail.gmail.com>
 <CAABR9nETzzsjzE0JnnLC5tX7d=0yZW9bt+t8DuVxV=JSb1VsYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABR9nETzzsjzE0JnnLC5tX7d=0yZW9bt+t8DuVxV=JSb1VsYw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_012043_755560_42C5145C 
X-CRM114-Status: GOOD (  16.53  )
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

On Tue, Aug 11, 2026 at 09:48:01AM +0700, Bui Duc Phuc wrote:

> > While this looks okay, have you considered actually having the
> > platform_get_irq_optional() to be optional in this sense?
> 
> As I understand it, if we decide to use platform_get_irq_optional(),
> then -ENXIO should be handled as the expected case where the IRQ is
> not available.

If platform_get_irq_optional() was optional, it would return 0 instead of ENXIO
(and avoid printing any message in such a case).

> If we do not want to handle -ENXIO as an optional IRQ,
> then I think we should use platform_get_irq() instead,
> which matches its intended semantics:

> https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/base/platform.c#L301

> -------------------------------
> ret = platform_get_irq_optional(dev, num);
> if (ret < 0)
>         return dev_err_probe(&dev->dev, ret,
>                                             "IRQ index %u not found\n", num);
> -------------------------------
> 
> In my opinion, we should not use an optional API if the IRQ is not
> actually intended to be optional.

Right. But does it suit for this driver?

-- 
With Best Regards,
Andy Shevchenko



