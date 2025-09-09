Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0184FCAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TILxIKRVPQJpP12ksT+ILWqU44FoU6j0tUzdymfZ1Tw=; b=alwgxZ8GA/0AFISmkp4TA9KN8c
	ReoRwG6f5WkjlWgxSiGYcLR56r17Zl5B6sZkcYpHL2TUtxBAOg/nP2qKbLQaqCKHpvT2aHy8Axccp
	ryipoden5Bq1UNNzuL4P0P+IL4HlC/9kXkBqe+CyT9tYZo3fCGdTM1Mughx0p0j3SBjuXwrs31Bll
	OSi4f4yje2SNxtugcTGQbf0+Ii3W1IvRUIBhU50lALS0nUgGvoxUf12REH3V1zUqUdTdf5uhYlUbR
	9jxV4UTEWHSq8BBbfdA3fSIDKt6LFKcNqYt1/8/AoNo1SlP1CbUMPAFXJnr6xBetq8CA2Z7EPLnsc
	iYWT34Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1wk-00000008p0e-0KHr;
	Tue, 09 Sep 2025 17:15:58 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwZ7-00000006kg4-3mDW;
	Tue, 09 Sep 2025 11:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757417474; x=1788953474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rz+1WJdCMk4bw7MZU/uL3ew/4Ysn6aikcYLa1uqNyjk=;
  b=a/q9vFW6FNsV4oaDRY9/kIPxOG++MWKmZk+gmCvASy6VETbGLEWqBVuF
   W7tWS3x3V2/Uima/JFMn3hpksIKTL0zpSrFbLVX28LxRRRCViP8ykY1et
   nr2tmzeCqrqJy6jBJ2yBZ1EZIXxKq2GAQAAy7Md+MHv/DfMhLqcLlOUsb
   nhtC3xmgdzaY9lsf+p5djIM7oMD3W+toEo+PjbsXtUDMzmFR6draYiekj
   K/sgMQ1vppX3znmW2ao2tH9vKOWraapqdqBPyuha4ND5tb12xiwYLzHp2
   wHV774dJ2GL/vNJ8RQuNUJO7qGZ9ctZ0eURw2i+P5oowDY0kAHtxTX48n
   A==;
X-CSE-ConnectionGUID: g97xOJYgRdemMmctxA/N0A==
X-CSE-MsgGUID: 4gxGXlgKR7yTTe3pifOetw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59762844"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59762844"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 04:31:11 -0700
X-CSE-ConnectionGUID: kETrlqaUS7SDcC66+bpzQA==
X-CSE-MsgGUID: d1Tczp/ZSi+Sia6+hUP0FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="172980605"
Received: from smile.fi.intel.com ([10.237.72.51])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 04:31:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uvwYw-00000001QM0-1JWn;
	Tue, 09 Sep 2025 14:31:02 +0300
Date: Tue, 9 Sep 2025 14:31:02 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
Message-ID: <aMAP9hAWars0T83r@smile.fi.intel.com>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_043113_975970_1D72F223 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

On Tue, Sep 09, 2025 at 11:15:40AM +0200, Bartosz Golaszewski wrote:
> 
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.

...

> +	config = (typeof(config)){

This looks unusual. Why can't properly formed compound literal be used as in
many other places in the kernel?

> +		.dev = &pdev->dev,
> +		.sz = 4,
> +		.dat = sd->gpio_pub_base + GPINR,
> +		.set = sd->gpio_pub_base + GPOUTR,
> +		.dirout = sd->gpio_pub_base + GPOER,
> +	};

-- 
With Best Regards,
Andy Shevchenko



