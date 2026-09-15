Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7093FC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNxwT5rlktkgC2wKNDdcPxV2UOT1HUqMVnmKn5V3d24=; b=2RUWtL3Upx16s9640Y/AhzHljk
	9uZx89uNtQ3eDnid0F8z8V5cR9pjUdoYiiQdePLlBUxV02QL7L/AsOPW2ceUPFnsLWFZ/PGmmakF3
	PgNM5msfRzIAQt+zr3JGsEeLhDUwC/vFQomrnY56sVoP6I7RlNYXbviAWZSBMr+BSDi05wB7j6gL1
	zgqpi7xdggEyfb08f5OVy6nbl5FXxgl+EHcokvf3/wxZmT47GwPQOX6+vHttzOPhS745WOh3ZnGfo
	vi+uAIlKQ30d+O8QdmpevFM3G4X18kLxgOFQvSJfM9Ah7f2fx2G1PeUq2dacl4e5JQh1h+1YNHIVv
	2f/3fvsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UlI-000000076BD-3g2O;
	Tue, 15 Sep 2026 15:07:56 +0000
Received: from mgamail.intel.com ([192.198.163.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ukq-000000075rr-2sDq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789484848; x=1821020848;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EW0qRFGFljFTOmx6/2DP3eUwDe1LgFNPcQdwJlKSirI=;
  b=PcsTXDEaeBweo0sTYeHdIS76Mu0wuUjhbdclL6C/Ba+XN9EcFc/8fo3Z
   PtAnuqiUSdpeKJT9BUJ+ruAJf3lml14Q0f8soI6B3znURqPqWeF2GkoAK
   OPZYFEmpd/3+ZO8zoPdMotKt1NmRwXSJc49FBOmwNtMhT1+v0CiS+4u3B
   vLKiXdVLoew0uz897vm5MEq5qQM454yF5HheOhvp/73FN0j03cWP/LfyC
   dXmxaIrw+Xq1w8qs1JuaJN+Wk6D0EJuriXD4D66adrtQDngkl7H9uE3O5
   F7kwnvYozrVZTwUHymRwvusq20MpgX+8QJBGiH08wRs4f2TiCzwr7Fooe
   A==;
X-CSE-ConnectionGUID: kYWkmGp9SuGN1mBwItM8/Q==
X-CSE-MsgGUID: K5oNsAV3TFm4Iuz7TyDk7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="361058"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="361058"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 08:07:28 -0700
X-CSE-ConnectionGUID: qGvx8WAqSlmM63A4mIdOJQ==
X-CSE-MsgGUID: Lf22iUCBQe6YEuM+0Lg/6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271603122"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.57])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 08:07:22 -0700
Date: Tue, 15 Sep 2026 18:07:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>,
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 08/15] gpiolib: regmap: add write_data_after_dir quirk
Message-ID: <aqlfJ3PnFib1smnV@ashevche-desk.local>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <20260915-cv75-v5-v7-8-3297d3fbc9c0@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-cv75-v5-v7-8-3297d3fbc9c0@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_080728_754000_09C83809 
X-CRM114-Status: GOOD (  19.30  )
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

On Tue, Sep 15, 2026 at 07:15:38PM +0800, Long Zhao via B4 Relay wrote:

> Some controllers ignore data-register writes while a line is still an
> input. Optionally write the output value again after switching the
> direction, matching the existing PL061 behaviour.

...

> -	gpio_regmap_set(chip, offset, value);
> +	ret = gpio_regmap_set(chip, offset, value);
> +	if (ret)
> +		return ret;

I think that this might lead to regressions when the end driver just leaves
the output in the previous state in case of errors. In any case, even if this
is a correct update, it needs to be done separately with the justification
that shows that all current users won't have regressions or the regression is
actually a fix of the behaviour.

> +	ret = gpio_regmap_set_direction(chip, offset, true);
> +	if (ret)
> +		return ret;
>  
> -	return gpio_regmap_set_direction(chip, offset, true);
> +	/*
> +	 * gpio value is set again, because pl061 doesn't allow to set value of
> +	 * a gpio pin before configuring it in OUT mode.
> +	 */
> +	if (gpio->write_data_after_dir)
> +		return gpio_regmap_set(chip, offset, value);

Taking the above into account I'm not sure if we want the inconsistency with
the above. Perhaps also ignore the returned value for now?

> +	return 0;

-- 
With Best Regards,
Andy Shevchenko



