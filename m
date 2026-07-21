Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753DAC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 09:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4/6vPu3SjwsxhFKaBWF80NiqUTDyqmZUdfA0vJNbVw=; b=T9QNbaZ/4udFYUHwSsRbhT69Jb
	C8WkmuFtNINvi5kYcTMleML/20LGFRGlLUpwDGb6gneE22QNA/F+Pt6YyyGgpAHC9QqbXYm8DHTjZ
	+ZX57dsB5QQlsnU+RJbPgOMMAKAxHF5ZZ948DgJ2l8+mZJ93vKp+17IEq3Ks9jX7QR7wEjj2hf4wj
	1/16STZSt4t4qJceajNGQyhM5GmF8XVKtadtU6JKeDjHZJr6IuA5l80cYjuC673HgU9jPjFi7w78l
	MnEU+bLkzKVR4NvhWoemxeT2cX9PvcVB2X1bDhqL+RDDVX+Sg8Syfa9tPFPr3aZFJXNa6G6+vHUlp
	f5NUGSfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7B3-0000000922g-18zp;
	Tue, 21 Jul 2026 09:54:17 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7B1-00000009226-1Cb0;
	Tue, 21 Jul 2026 09:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784627655; x=1816163655;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kRHPnnFh2X+21LPOizKSZmusrUu78ngN/jBigWFpw5M=;
  b=aoFtPsKdSC1A00Zte9BZSlssen3TpX4zTuT6l3skiAf3vmGmmV4eQ5tx
   tx1kc3fnv/zUiIPARn/weSXd/94UJ7bHd8TGo8XmhFtEyjsVuzCEmGzHi
   VLLjvHpCfVwqK+97Nk//loZLALro56Xa3RS0E1bcJxrIdj8akP7T8woyj
   yjPWjxee4HJFdTlIURn1pnJ1QutFnCCrSLkperH9XsxyEaDLDlFBOt/KX
   4MIenozATdRJdZFhYfl0lvwY3nKFVU/2xa9dqSbKrOfYh5n2Y3WSozC+8
   6xBdLREH1Sd5IA75t3oD4cfC09zI03rl7bG0HexS8wa1kjTLSXXox6Gkh
   Q==;
X-CSE-ConnectionGUID: UZSv9T6RT7GBz2q1/W07tA==
X-CSE-MsgGUID: mvFgVhPNRzWKooq8nO57Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="95873440"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="95873440"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 02:54:14 -0700
X-CSE-ConnectionGUID: r9OCG1FcRO6fqxsy8OJs+A==
X-CSE-MsgGUID: H9avTQT6S+at69QN4ALNdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="295924390"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 02:54:10 -0700
Date: Tue, 21 Jul 2026 12:54:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/9] regulator: core: Add "enable and wait" functions
Message-ID: <al9BwHbG5IX0mIem@ashevche-desk.local>
References: <20260721075226.2347933-1-wenst@chromium.org>
 <20260721075226.2347933-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721075226.2347933-2-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_025415_344693_C540876A 
X-CRM114-Status: GOOD (  21.71  )
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

On Tue, Jul 21, 2026 at 03:52:15PM +0800, Chen-Yu Tsai wrote:
> In device power sequencing and initialization use cases, it is common
> for the driver to enable the regulator and then wait for a certain
> period of time to pass before continuing.
> 
> In cases where the regulator supply is always on, or has been turned on
> or left on by another consumer, the driver could shorten the delay or
> skip it altogether, provided that enough time has already passed since
> the regulator was _actually_ turned on.
> 
> Tracking this requires support from the regulator core. Introduce a
> "last turned on" timestamp field to the regulator device, and "enable
> and wait" functions to the single and bulk regulator consumer APIs.
> The existing "enable without wait" functions are then converted to
> macros that expand to the new functions.
> 
> One case in particular is not optimized yet: a regulator left on either
> by hardware reset default or by the bootloader, but does not have the
> "regulator-boot-on" property set. As the enable timestamp only gets
> updated when enabled by a consumer or by the core, the first enablement
> always needs to wait.

...

> -/* locks held by regulator_enable() */
> -static int _regulator_enable(struct regulator *regulator)
> +/* locks held by regulator_enable_and_wait() */
> +static int _regulator_enable_and_wait(struct regulator *regulator, unsigned int wait_us)

Hmm...
This comment a bit confusing, perhaps adding some lockdep annotations help?

...

> +	if (wait_us) {
> +		ktime_t end = ktime_add_us(rdev->last_on, wait_us);
> +		s64 remaining = ktime_us_delta(end, ktime_get_boottime());
> +
> +		if (remaining > 0)
> +			fsleep(remaining);

This style is discouraged as it makes maintenance harder. Better

		s64 remaining;

		remaining = ktime_us_delta(end, ktime_get_boottime());
		if (remaining > 0)
			fsleep(remaining);

> +	}

...

>  	/* private: Internal use */
>  	int ret;
> +	unsigned int wait_us;

If you want to make it more private (the above is only for kernel-doc) add
__private annotation that will affect how sparse will check this.

...

> -int __must_check regulator_enable(struct regulator *regulator);
> +int __must_check regulator_enable_and_wait(struct regulator *regulator, unsigned int ms);

ms or us? Please, double check all units.

-- 
With Best Regards,
Andy Shevchenko



