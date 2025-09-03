Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87945CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 20:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Z2RoI9Eg0Vsx1325Db0YbSRRNYzmQf3Yz3p/gnZsWk=; b=nS5152pW+h5tWXl+vhV/sGvTtQ
	/91JfZmjSOOjGJFV4eS0sqNowjqGhdPAgF6NXZ599I+hSNQNmV296fBSdW2EpY7knHZO5BRbwl0cI
	hkh97ZE3j1DukkwRKXBCDL7G66jSGFBmV4UhaU8fyDCaueubrrTjRbuO5RePD54psV439FCKj9hqC
	XF8aXxVJud1FlifUlRYf9uVWcn56PF+oUFJo9C4LK/iHCtPn1lmrNBmAqpMF5jAkJuZe/nKMx5IBn
	uXgq9xgpoCbDLWHaAZ14JikQx68f4eJq+EIOcZARZm7mjUtyvMP6Ygl8c/WXnkYWcZgUbGlUQ+2ao
	m2wUz1tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utthF-00000007WiB-3VqD;
	Wed, 03 Sep 2025 20:03:09 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utplP-00000006yYk-2pWA;
	Wed, 03 Sep 2025 15:51:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756914671; x=1788450671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jDcu9ohaMsZLetBVvF384J1O7tyKxslm3o1sZzCQpa8=;
  b=LcAoicrKUkF2kDXGLtWcMZQMt347Iir78obxknzgPc3pshHHQiqx1xm9
   j3W/RLwXG6x1TB6bTr7B1bxg0zm2rWMAzX9tukeDCcqvNF45tKzNLdEqH
   meInko9OXYHJ8b6CKIPP5UyyzqtPDxaBQ3q4pqXy4mKiYk0z8ebzn1mEk
   p5pHao5hgfj7X/XPooY/B8TuslXuU+/6j9UhVo/SkhrQc4MIq7MkHn5Pj
   pT/oBPgV6szyrpLEQB8+qBM+bDfw/sBX5UGn2FzH3p47+3kkRXUOOMSPF
   uSRqprRwznqVlLrBIHFrEDJntM4sjKtkA79gtC9uTgjixZj5fVobJJwIw
   A==;
X-CSE-ConnectionGUID: rqB5SJZdSEeAsEHV55ZExQ==
X-CSE-MsgGUID: JDvQKDApQeG0ZaXr3Qjalg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="62876673"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="62876673"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 08:51:11 -0700
X-CSE-ConnectionGUID: y+zVVm5HRl+ykJu1eu0XDA==
X-CSE-MsgGUID: EwAhWLTbTHaszJY20N5Kcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="195272489"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 03 Sep 2025 08:51:08 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 40C9294; Wed, 03 Sep 2025 17:51:07 +0200 (CEST)
Date: Wed, 3 Sep 2025 17:51:07 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Yang Shen <shenyang39@huawei.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-unisoc@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RESEND 09/14] gpio: dwapb: use new generic GPIO chip API
Message-ID: <aLhj6xsR-NepfRx0@black.igk.intel.com>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
 <20250825-gpio-mmio-gpio-conv-v1-9-356b4b1d5110@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-9-356b4b1d5110@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_085111_781591_582BAAC4 
X-CRM114-Status: GOOD (  12.88  )
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

On Mon, Aug 25, 2025 at 11:48:50AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.

...

> +static inline struct dwapb_gpio *to_dwapb_gpio(struct gpio_chip *gc)
> +{
> +	return container_of(to_gpio_generic_chip(gc),
> +			    struct dwapb_gpio_port, chip)->gpio;
> +}

Since it's not a macro anymore it can be done better:

	struct dwapb_gpio_port *port;

	port = container_of(to_gpio_generic_chip(gc), struct dwapb_gpio_port, chip);
	return port->gpio;

Also, have you checked the bloat-o-meter before and after, wondering if we gain
something with this.

-- 
With Best Regards,
Andy Shevchenko



