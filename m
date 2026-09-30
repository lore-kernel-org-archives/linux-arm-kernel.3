Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C8CCA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 08:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mq9VLako79BWnqgl4JBh0IEfUKzyM7Kvk8zHvic2HK4=; b=snAGhUM3NTUjtzX0vEhQZH/wG3
	CyhGTPCVgiow4uKwhJeZQuAFa+hpers0tIq344MTwTR3YDVb5X3JvwsFkWmAkJ5fxEKBvFriRLEJY
	9Xzfg/ITfFlUIG3v9Gw/GmHS9vy31Xq+UUfJWL6ZESC20j6sxK/IOWwJJVCUpVxxohavtxYZzzJwK
	EbhGUEJsIxdjuqZIImfFEzOqCvUaG0oPU/ygzajonoXZPVGbzb8S7tZcTVFcoWvyLr5kPyDVvHePZ
	G9PirLvnKxKeNQwOdVJOMcJn0+y1HPnOaY2AOqsvli9g4GL0gRo4vSvYhsinoVzK8raAKqFi3GzX3
	fL1fuZnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpl6-00000005RO5-3Zt2;
	Wed, 30 Sep 2026 08:33:48 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpl3-00000005RNZ-2wuU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 08:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790757225; x=1822293225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MMtdk41NBB+Qc3t0U9od8tLeaTfZYIc2vmIwOCe7IgA=;
  b=SwqRcW/WuUyCkJKXNqdT63Q+m53ADMsx5N91ZUtSQC5GyWHm7NLm+F0Q
   /OQXAMnJ7+UCOP9vkCYKTFptbycVWYhx4w6+UeTRlQ6adDuW1y21sWoHp
   s8aaWxA7QL5MxgyxfBw736I8EbuEvbOf+EGLSjBB6AXDcICBNwXxaf5Pf
   6xE9AEzM4FZyQEU5Exiay80SfEOtCr4RiQigZ9/cffqZJ5pddm5z1S34p
   J7I/P6gmNb21xNpMR5CLpGK+OazUFTlUX3aXo+rirTo77frQSQNg05c10
   StSXPSeg5EGpLxNnWOygxWB1DwUh4AOWWoaq4bddLstGWrWNhXfBQQtqJ
   g==;
X-CSE-ConnectionGUID: PXOh/M/5Tv2rzJ7Jj5+1uw==
X-CSE-MsgGUID: eCILo/3fSseTVYmbqyebGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90443711"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90443711"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 01:33:44 -0700
X-CSE-ConnectionGUID: T7JBMI1SSi2mJ6wrZLV/ag==
X-CSE-MsgGUID: LajcXhi9TGmpIrpaZz5Xuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="274233722"
Received: from spandruv-desk1.amr.corp.intel.com (HELO localhost) ([10.245.245.137])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 01:33:40 -0700
Date: Wed, 30 Sep 2026 11:33:38 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Marek Vasut <marex@nabladev.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Cheick Traore <cheick.traore-ext@st.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>
Subject: Re: [PATCH v2 07/14] iio: adc: stm32-adc: add support for stm32mp25
Message-ID: <arzJYg3cg73vYCOE@ashevche-desk.local>
References: <20260923-adc-stm32mp25-v1-v2-0-46bc019537c6@foss.st.com>
 <20260923-adc-stm32mp25-v1-v2-7-46bc019537c6@foss.st.com>
 <arWPjx-JKt1IZCZl@ashevche-desk.local>
 <8fd19ab1-6ec4-49d7-aadc-accec6e71410@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fd19ab1-6ec4-49d7-aadc-accec6e71410@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_013345_807123_77185B82 
X-CRM114-Status: GOOD (  18.70  )
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

On Tue, Sep 29, 2026 at 06:48:28PM +0200, Fabrice Gasnier wrote:
> On 9/24/26 23:01, Andy Shevchenko wrote:
> > On Wed, Sep 23, 2026 at 05:39:10PM +0200, Fabrice Gasnier wrote:

...

> >>  		.compatible = "st,stm32mp13-adc-core",
> >>  		.data = (void *)&stm32mp13_adc_priv_cfg
> >>  	}, {
> >> -	},
> >> +		.compatible = "st,stm32mp25-adc-core",
> >> +		.data = (void *)&stm32mp25_adc_priv_cfg
> >> +	}, {
> >> +	}
> > 
> > Same issue and now it's a regression from maintenance perspective: you added an
> > unnedeed churn that has to be handled from now on... TL;DR: do add trailing
> > commas to the non-terminator entries and remove trailing commas in the
> > terminator entries.

> Do you wish I add a separate cleanup patch for existing match table ?
> This can also fit into 100 chars line now:

This is, of course, is up to you, but my comment was solely against the
trailing comma removal.

> static const struct of_device_id stm32_adc_of_match[] = {
> 	{ .compatible = "st,stm32f4-adc-core", .data = (void
> *)&stm32f4_adc_priv_cfg, },

Here is actually the opposite, no inner trailing comma should be added as it's
a one-line entry.

> 	{ .compatible = "st,stm32h7-adc-core", .data = (void
> *)&stm32h7_adc_priv_cfg, },
> 	{ .compatible = "st,stm32mp1-adc-core",	.data = (void
> *)&stm32mp1_adc_priv_cfg, },
> 	{ .compatible = "st,stm32mp13-adc-core", .data = (void
> *)&stm32mp13_adc_priv_cfg, },
> 	{ }
> };

> >>  };

-- 
With Best Regards,
Andy Shevchenko



