Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB31CFB422
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 08:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FijUh14MEGRa7xHoblHfpRzY1ieCTBYFa7Y8yyzE9NA=; b=2UqcislWFJKGU+RAfoaIQVSdXD
	gJBoomLMPIEUcsirGodr4iH1DUTnq2ft//PegcCzecqzX1q2Y89aVXSbNQzGD8+F/Sw6698lwQ/T2
	Gei5VnFhu40+AdgtXa4fn/6od9EXuTn+Enod6hnOF/JDGn6OYvO0X4HbjU7CTIqw4pTlOZMpSLehE
	BdTrL+nJw2f/3L6fLW4/rRJ64mg/HMpFn6ySquTg1VM9P+hR3wScKV1+RyLHlxODBe8DF3fY7AvA3
	Y0RyUBODM/zKyTQVe79IdQt9+gu6Pp+S7pJza2Cu7Q74rudKuxMm+zdOlZoELPFImNbjuwlcXaLvI
	TPb1pQ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7shs-0000000D13L-3UvE;
	Mon, 04 Nov 2024 08:45:04 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7seG-0000000D0LP-3ANw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 08:41:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730709680; x=1762245680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zDYq57ceopXWdZlfFAbeiXO9ZVobTOfwl8WWXD/RefQ=;
  b=iVWKy7lBEmq/WoTQ01Jqz18o1U1IE3W3P+ZGncFrRZkMmVSInmQuxKI0
   3uj0YOUKHQJe8CHKiKjIX341nxHSSvQmC5ZYYiB3kmSmcqJy+En4XSNSK
   Y6lDENgpo4EYspZfvz+qe7jXJqU1YsUYL0snWsfmflmE4BSi3NV7I7SAk
   g8//0OEODMm2r+tz7wzgrU/SO49HWCcHPzW/pFwa6edMzkugI3yXkT9CI
   ExjvCC7wZhkIznilNl6FdcCFmWYR/d2rnAi7dW9KdJz47HYYPe+efM3/r
   3UyrG9h7B7OSXjlpBfGVGqGJqMxZHHBoy1hMcZ4U10BPmZpC3FSyTq18v
   w==;
X-CSE-ConnectionGUID: tUJe1UMLRNeX+1EwheaO5g==
X-CSE-MsgGUID: vzbl62E0TJOb0MSycQc8cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="29823840"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="29823840"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:41:19 -0800
X-CSE-ConnectionGUID: vWm3BvYMSWmedTSoklhIiQ==
X-CSE-MsgGUID: 8NfREzgwQpmiLMQYcIRotQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83472466"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:41:15 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t7se7-0000000Az7U-1K9x;
	Mon, 04 Nov 2024 10:41:11 +0200
Date: Mon, 4 Nov 2024 10:41:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Aren Moynihan <aren@peacevolution.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	=?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <trabarni@gmail.com>,
	Ondrej Jirman <megi@xff.cz>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 5/6] iio: light: stk3310: log error if reading the
 chip id fails
Message-ID: <ZyiIp6t53FN9ssyV@smile.fi.intel.com>
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-13-aren@peacevolution.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241102195037.3013934-13-aren@peacevolution.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_004121_085709_36324C28 
X-CRM114-Status: GOOD (  12.59  )
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

On Sat, Nov 02, 2024 at 03:50:43PM -0400, Aren Moynihan wrote:
> If the chip isn't powered, this call is likely to return an error.
> Without a log here the driver will silently fail to probe. Potential
> errors include ENXIO (when the chip isn't powered) and ETIMEDOUT (when
> the i2c bus isn't powered).
> 
> This function is only called from stk3310_probe, and this condition
> should return an error, which fits what dev_err_probe is designed for.

...

> +		return dev_err_probe(dev, ret, "failed to read chip id\n");

Please, make sure you have consistent style in the messages. Most of what
I have seen use period at the end. This one doesn't.

-- 
With Best Regards,
Andy Shevchenko



