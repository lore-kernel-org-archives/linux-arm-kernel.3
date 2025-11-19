Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E125FCF34DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKdLqYFKcR0Ssvd81vhbWTn7XyXVhMB6X/CIK4YAmJ8=; b=J0ahn0DE68HvexJLlQPgqVDWTj
	KfVHXSPKCgIobHY0h+xWxiKiy+lCHypUG5CZwV5NJnEVqvSMjDNNnwgcZLbCYRWMgPj9m7KW9CP12
	bb9CU/D7wCenJbfy2pP3Vq/tK6V9PrqFFb5mbsSyCazvmeOVjDtRC2aXwpbYZulAtLxsXl7dsxFev
	Z94R6m+sI6Qja9w4+Onxwaj28eG8AvEEDzOsbtPxQQ0FbqOV0A8h7rdBs1z1OeFefOvWOHjI9XBj7
	JwgJHQVWq+gVstOPcVEM2sm/pdu/VUZp7u00hZeggIJyeWbO/ApRbRvR5kK+MRr3zLauYyX7Xy+vJ
	SG6ZNDWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkKt-00000003VaT-1Chu;
	Wed, 19 Nov 2025 15:43:11 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkKr-00000003VZn-03Oh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:43:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763566989; x=1795102989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0RZPFAONQ4eeFMXT+CMJvWTBqEYsuVS8uhy75HjL4yU=;
  b=CGIybMezIFbauPcT8PdFssHXyfH5HiLc1KxgQlX1Ct60ZbybyIMywKpA
   TrNNvtSWZz8T3iwT9cGCRBZxsoaYGnU7wXIFDE/swqKeNalQMSx/11Y5D
   uAKJwW9p0uSrR4dSEoLo46d0p7bWdkTmCPuPOuFpomzNaRXDsmfdHd2j9
   5O9MQDgQUg+TtoG4J/1NtkA7O5Cd9D8nGH3DBzVtHamDEkHof0v2c2Ey3
   ++/C85d/05UDVSlSzTcuSHERt6b0nIupMFvX4XnZs6zb7PCGnmh7K0zGg
   iXmGVfYsKtim/+h+UHb1zcmYMv+A+xkmq7uwDFCno47n+wtvSV4yGPl3V
   Q==;
X-CSE-ConnectionGUID: QJQMbM1PSMeuaN92qxcp8g==
X-CSE-MsgGUID: b57D4BdzRWy+GkdkDoro4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65546335"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65546335"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 07:43:06 -0800
X-CSE-ConnectionGUID: r4NEVHUqRaW1JBPgUKX4DQ==
X-CSE-MsgGUID: lkuTqTpcSSuluJvpOUgoPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="191126714"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 07:43:01 -0800
Date: Wed, 19 Nov 2025 17:42:59 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 01/15] gpio: dwapb: Use modern PM macros
Message-ID: <aR3lg0aNaoT-_7SM@smile.fi.intel.com>
References: <20251119144327.13345-1-jszhang@kernel.org>
 <20251119144327.13345-2-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119144327.13345-2-jszhang@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074309_123956_0F0F8ADF 
X-CRM114-Status: GOOD (  13.96  )
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

On Wed, Nov 19, 2025 at 10:43:13PM +0800, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.

...

> -#ifdef CONFIG_PM_SLEEP
>  /* Store GPIO context across system-wide suspend/resume transitions */
>  struct dwapb_context {
>  	u32 data;

>  	u32 int_deb;
>  	u32 wake_en;
>  };
> -#endif

This ifdeffery is to protect the type definition? It may be removed for sure.

...

>  struct dwapb_gpio_port_irqchip {
>  	unsigned int		nr_irqs;

>  	struct gpio_generic_chip chip;
>  	struct dwapb_gpio_port_irqchip *pirq;
>  	struct dwapb_gpio	*gpio;
> -#ifdef CONFIG_PM_SLEEP
>  	struct dwapb_context	*ctx;
> -#endif

But why this? For the PM_SLEEP=n cases it will give an unrequested overhead.

>  	unsigned int		idx;
>  };

Otherwise LGTM.

-- 
With Best Regards,
Andy Shevchenko



