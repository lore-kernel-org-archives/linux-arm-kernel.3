Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9D4CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 08:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7s7cIpoWzooi6KCel1K/BhJC4KE4day4yCyTcRcgmQ=; b=FOxaaxiIo4Ak2gUYfP8OwuHlPl
	o9T3NFvuMO/2yxJvzfPzK2q1jlcL8Qiw+/U60Utx7ccKRXnDcPdVpNPkkq+86+eK5hqmStn+XOucx
	wW3qCUEBHenlm5XuszjMdYjkwFzVi7aDXVh8vXOr/Af/LcY9G22VHOhvk/KnqwWuBNqOlRhw795Ov
	W2jV5mzUi4iczIA1jc2l9CYEUGsbsvggmibEabA7nllqbFHOUbmuK2n7WhhCLf2pTrkwtssafO77R
	3vuRT1vB3OZqSGLIJxvy3OJBqUbHWxPVF3ds6a9LY7TC88f9QAqg6Mtl9Y5V7hDP4+6puqvIMTu1b
	upsEN70Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcGM-00000001hU3-37pU;
	Thu, 11 Sep 2025 08:02:38 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcGK-00000001hSi-1Yf5;
	Thu, 11 Sep 2025 08:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757577756; x=1789113756;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=kdicIERSEGS6CGqV+GThuXvTSIsMgiNJoEUEEMAQ7JM=;
  b=cjmKTtturTBd1u1rRoNqqkPHnT+f1CuyYm3OnFnQ64Lg9c8b0d3xfzQN
   RlcfdwX3WmeRnJmBuHBVBHdzHT4qUypp0wD1AnYyA1LpIc1xs/4YrkDj6
   IwltMsrN49XIPqyMB5YfGYIRmB4Q0aphRf0LDIm79G6kWJGoNaWUNluf1
   SJlzLMpsKz1lCPwbF4V4mXt6L7c/U+yqsOr+X1YVeaRxkZYq+g7/ihy+/
   fDToy2PVp0jKkJ0Xuy8bnIxm2QrtZfPDpyUV9BHwMMiUlxnX+9IaRD/Xq
   x8UVrxnJdJ6YzgIMmMnXzM7cFGIVXrT2Y37K4AKIXGbvJ3LZgQVCOpOE5
   Q==;
X-CSE-ConnectionGUID: umL3eZeQRDyat69o4z+giw==
X-CSE-MsgGUID: zzO25s1ORQWy0WkJSNh6Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59130645"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="59130645"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 01:02:36 -0700
X-CSE-ConnectionGUID: HSAt/B/2T7CyoKV4/Fpp1g==
X-CSE-MsgGUID: KD+qII/XTDGOjnGuMB8DWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="172805532"
Received: from smile.fi.intel.com ([10.237.72.51])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 01:02:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uwcGA-000000022ZP-12Gk;
	Thu, 11 Sep 2025 11:02:26 +0300
Date: Thu, 11 Sep 2025 11:02:26 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Doug Berger <opendmb@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Alban Bedel <albeu@free.fr>,
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
Subject: Re: [PATCH v2 07/15] gpio: brcmstb: use new generic GPIO chip API
Message-ID: <aMKCEjwDUFH4OZAf@smile.fi.intel.com>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org>
 <e0941449-7a62-4bbb-8790-616f393f2cc8@gmail.com>
 <CAMRc=MfZ5ss8Gd_TTPV8EYSv04ENp_C26b3=wukO+UTy_boXUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfZ5ss8Gd_TTPV8EYSv04ENp_C26b3=wukO+UTy_boXUA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_010236_418856_39089ECD 
X-CRM114-Status: GOOD (  12.75  )
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

On Thu, Sep 11, 2025 at 09:56:28AM +0200, Bartosz Golaszewski wrote:
> On Thu, Sep 11, 2025 at 2:11 AM Doug Berger <opendmb@gmail.com> wrote:

...

> > I'm just curious about the longer term plans for the member accesses. Is
> > there an intent to have helpers for things like?:
> > chip.gc.offset
> > chip.gc.ngpio
> 
> I don't think so. It would require an enormous effort and these fields
> in struct gpio_chip are pretty stable so there's no real reason for
> it.

What I would like to see in TODO is to "make struct gpio_chip const" when
passing to the gpiochip_add_*().

-- 
With Best Regards,
Andy Shevchenko



