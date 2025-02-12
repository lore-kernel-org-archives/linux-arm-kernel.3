Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2091C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFBnGiKHb0ir0BlGLMdz6dAYm2lFmUKDwMh23YME2Hw=; b=Uzcer46BClIq2Ws7gkk8UGXSzp
	OzkTU3i5ivWBSkLXMTKd0E7219GIk6UWQYOMtRMYLdbiKrP/C4C+au9p93iznjFYH6aON8XL6S6cP
	pcl18JVMLgJ6KUdu53XppAcDgfP4iA2W5pl/Tsy/KMGt/yPBM1gJHIgAD2/RV9l+41pu5TgYVTHfW
	bHsmI9/kTYgIQwd+ZG+vwDg1bktvt5xn5SGrWTw4/9Q25iu9iyVfYpReo+5hzfUMWLdJzNzpXNCmo
	FvH3QGXlVmSluKCMumxk5Vg06EKmFbMcs/TTdBeWWs+aCQvpMu8Am8Ye0l8ObW8lLBWcO+TTtPV2K
	TDoVrfXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAP7-000000074C6-4212;
	Wed, 12 Feb 2025 10:55:41 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiADh-000000071kk-1PAV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 10:43:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739357033; x=1770893033;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X2eltLRhw1w4UIkkJvn+viee4/SqEPKwaFrktrUEYQ0=;
  b=NhG72Q/3Qf2UdOIDnGRVFD2JMmWTWrrwgbiM0iDWx9ZrGFBt/U+ducJc
   qtHPZ1Fw+NiuMZRQAFpCpail3W4vcthj+AEN0NunkF1VDFQvDXh/IDUtD
   llkQlIZlnNO7+3fb3U7ie5xhrS/srXHX3BnQ9EhExFhyn5dgQ6LGQnK/s
   DMFwZHslKl4d2FpDJhAtIiTvxI4+v/WmG1ojPw+UHj5ECigdMXzv2TVKr
   vBrYdK6JB9jEdRNV2fmmpo+Kubt4DRVTXP4FtfDdk/UDiblboRtnm20TZ
   EobTNEVG3yNpT7urEPgFfUSS3JNgrGc5rb0CeiAZ4ahHXEOlxmAaBTPWv
   w==;
X-CSE-ConnectionGUID: bVo7PNujRmWDOScazThNfw==
X-CSE-MsgGUID: YJJAvpz5RwmOsfSWdXZepg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="40032068"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="40032068"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 02:43:50 -0800
X-CSE-ConnectionGUID: 9ogGZln/SR2AoJP2f85ftg==
X-CSE-MsgGUID: 082GvNeQSUKxR8PlBtUqjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="112998158"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 02:43:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tiADW-0000000Ao56-16Qk;
	Wed, 12 Feb 2025 12:43:42 +0200
Date: Wed, 12 Feb 2025 12:43:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Aren Moynihan <aren@peacevolution.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	=?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <trabarni@gmail.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, Ondrej Jirman <megi@xff.cz>,
	Dragan Simic <dsimic@manjaro.org>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v5 6/8] iio: light: stk3310: use dev_err_probe where
 possible
Message-ID: <Z6x7XgtGr8Thx08Z@smile.fi.intel.com>
References: <20250208211325.992280-2-aren@peacevolution.org>
 <20250208211325.992280-8-aren@peacevolution.org>
 <Z6jAEEU2dqn_FJVp@smile.fi.intel.com>
 <20250211194311.5255f25b@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211194311.5255f25b@jic23-huawei>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_024353_408796_57304711 
X-CRM114-Status: GOOD (  24.39  )
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

On Tue, Feb 11, 2025 at 07:43:11PM +0000, Jonathan Cameron wrote:
> On Sun, 9 Feb 2025 16:47:44 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Sat, Feb 08, 2025 at 04:13:24PM -0500, Aren Moynihan wrote:
> > > Using dev_err_probe instead of dev_err and return makes the errors  
> > 
> > Use dev_err_probe()
> > dev_err()
> > 
> > > easier to understand by including the error name, and saves a little
> > > code.  
> > 
> > I believe this patch will make more sense before switching to local 'dev'
> > variable. Then the previous one will have an additional justification as
> > the "struct device *dev = ...;" lines in some cases will be added already
> > by this patch.
> 
> I'm not sure I follow this one comment.
> The only line that has struct device *dev =  added in this patch is
> replacing an existing client->dev lookup that could have been pushed
> to previous patch if this patch ordering was maintained.
> 
> For dev_err() to dev_err_probe() the number of references to dev
> is the same after all. The only additional justification this patch
> makes is some longer lines that using a local dev pointer shortens
> again.

When converting to dev_err_probe() in some cases it makes sense to add a
temporary variable at the same time.

	if (ret) {
		dev_err(&pdev->dev, ...);
		return ...;
	}

===>

	struct device *dev = &pdev->dev;
	...
	if (ret)
		return dev_err_probe(dev, ...);

which reduces automatically the churn in the patch that wants to (re)use that
temporary variable and also adds to the justification as "we already have that
variable, just want to use it".

-- 
With Best Regards,
Andy Shevchenko



