Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A49CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3mUkdOyA9D5ezBCQWBBX6dwp+nUOAyHGSorcoXVJZc=; b=3yHUELqWdwNw6bUZPc485ZHeKB
	z32m6mTbghcowuqjUn1CrE3LAoMy/daNP4c4UaOjhDUphvE6OElDs1GnZsGy7ILl/ZMr7ZhC1Fn1B
	VotcPZab0Q+9PDDruqPUtCMfF8BhoSucwSDPy0AynlKg5vFqJX77nXhLWysEIoBreN4AIDxUk1V8d
	qOtz/aP2OPgE5xDxOtthPceg9TtZTSuQmk3BdYj58W1V63wA8t1YnDmGAWBlqTh9KX+SY0otfBdfb
	wJ/MRDDRri8zRbsxKDYBeuADOg/VSvo+22wj3FokTaJsPonm1TdEgjyjvnx/DTiHfMpBJ/f+LBGE5
	sy2nT5iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uladK-00000009Dt8-3nmg;
	Mon, 11 Aug 2025 22:04:46 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulYxp-000000090Rf-3AvZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 20:17:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754943470; x=1786479470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yyBb39BiqDIpv9A/xIVgde9Qlx9RcFbByzIMcGrSgwA=;
  b=mrW0l8yJh8PqlHhYVlO+/tNdCckxZF5XYlIGnOsBHdEmfdX7kiOMoq/A
   8HaVRh5boKJCvHUVgafs2GtzzVjoDREW4xEindMvPLBSCjmDaRj5QYOgg
   tkxfVIZAF0Z5ry4ImX9+9g5GxIhhXzYC4TDLA6MPqK7+n3MFCpO2+1WKv
   QwLfGH5A6Qzbnh0LLiuzNVjGhfSNOGjT5B6j/cEBCwud17fTl66Zr5ljG
   AH60FV3VXuOhEa9GJGZ0Rc5ajfWe+EE8ngXIeudII9vHAUfvLXMWpfWQa
   cUhFXGdCMvPGFMqi25yD0Ps6+sxTH2BRcBRZxwbKq7FSxGhZQpuBThsdE
   A==;
X-CSE-ConnectionGUID: VUImWnYlSXm4pg4u76FZZQ==
X-CSE-MsgGUID: ZsosONrNRRaIRv0AzdVViA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56233928"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="56233928"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 13:17:49 -0700
X-CSE-ConnectionGUID: LDqZ9GQDTkKUBXBPFE1LGg==
X-CSE-MsgGUID: 1PNPdKRCT/qmTAf2kwLvSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="165630085"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 13:17:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ulYxh-000000056aH-48oB;
	Mon, 11 Aug 2025 23:17:41 +0300
Date: Mon, 11 Aug 2025 23:17:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>, Hanna Hawa <hhhawa@amazon.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] i2c: add init_recovery() callback
Message-ID: <aJpP5eABTYnQRV82@smile.fi.intel.com>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-1-ca42ea818dc9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-i2c-pxa-fix-i2c-communication-v2-1-ca42ea818dc9@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_131749_812534_B414324B 
X-CRM114-Status: GOOD (  17.96  )
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

On Mon, Aug 11, 2025 at 09:49:55PM +0200, Gabor Juhos wrote:
> Add a new init_recovery() callback to struct 'i2c_bus_recovery_info'
> and modify the i2c_init_recovery() function to call that if specified
> instead of the generic i2c_gpio_init_recovery() function.
> 
> This allows controller drivers to skip calling the generic code by
> implementing a dummy callback function, or alternatively to run a
> fine tuned custom implementation.
> 
> This is needed for the 'i2c-pxa' driver in order to be able to fix
> a long standing bug for which the fix will be implemented in a

> followup patch.

"...next change."

...

The first traditional question is why the generic recovery is not working.

...

> -	if (i2c_gpio_init_recovery(adap) == -EPROBE_DEFER)
> +	if (bri->init_recovery) {
> +		ret = bri->init_recovery(adap);
> +		if (ret)
> +			return ret;

> +	} else if (i2c_gpio_init_recovery(adap) == -EPROBE_DEFER) {
>  		return -EPROBE_DEFER;
> +	}

If the above stays, I think we would drop the last and always have
init_recovery to be assigned.

-- 
With Best Regards,
Andy Shevchenko



