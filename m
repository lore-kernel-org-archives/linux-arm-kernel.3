Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7F2C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 13:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPQL1BFQHYjF4CcibJTVl+YdwQVvHcaCdNvDYxEk32Y=; b=ug3fp/9RYhANr+36J0AnZyut4I
	vZT8IbpSzy5lNYtBkKeANDDSTblEKOUf7FpdYPSvODjPZiJouC+MXKXM0C8Rgi5E5/nfu9lHRZIOG
	i1kSKF++cGfRpWFco3VmJJJJctvh7q4DwlAhI7umO+mk0VFN8mGCwyx8org0oKJOxyUGt3yVLV79D
	CInbapTu72+MCgNnwfVAd8/6zcy7+Lbd/PqD0hVMOS1xraG0eyKZJpSXqzoR5yfZtrisg8LKg9bx6
	FGD1F2lXr6tyZ0pFiGbCSpjcxdmgTnqGwdtkfWL9jqJ8Ty4TYVuf4JoFPhVfLTAxWSKa1Up6tne3d
	RJl3S4tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvx1z-00000006BC7-48Pn;
	Mon, 17 Aug 2026 13:05:35 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvx1y-00000006BBi-28hY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 13:05:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786971934; x=1818507934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gQPSYZ0+Yy2kCANGjD/T1ROayz/4tK0xY0qPUxojKMI=;
  b=i8jHY+tVggf2aY1ejzltSbiZo0bM2DoCoTBvlD7qWCIjpk8tIoU0E0tV
   tBDROJ/BZYZKIgR5wW/zuKHJMYjmLfix9tYVe6H2ZLzaH189Dl+QldIvT
   W7rtWJOAfgfuce2NihYGl2gW98b6R7PZJDUSOTfdkDo4DG7w9DtOpOhT7
   5itoV5BfI4YfGfJBm9pVDZ62lBADFfRibBTO4v3/L6+qPRp4AlZ/KRAqi
   9Xypr+tWawP/nS0X9MiONxZiRzt7CtCeszo4e8vOxbfvKj5XR8WafyB9Y
   56wSfEXYctf5ElaNfRgRPLV5pFxgngyp1zaJV/Kiab71BM1gs8DExCtyU
   w==;
X-CSE-ConnectionGUID: SPZQDQCZRzeK4WqS3GgdEA==
X-CSE-MsgGUID: uTa2khO8QeSJb4XsJZDusg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87303131"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="87303131"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 06:05:33 -0700
X-CSE-ConnectionGUID: Y68vzEzFSny1Jehzv6OMmg==
X-CSE-MsgGUID: XX2F8TSoQXejf/hp1iJ0Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="269184763"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 06:05:29 -0700
Date: Mon, 17 Aug 2026 16:05:26 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Petar Stepanovic <pstepanovic@axiado.com>,
	Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] iio: adc: add Axiado SARADC driver
Message-ID: <aoMHFhvAPcVV1xRb@ashevche-desk.local>
References: <20260810-axiado-ax3000-ax3005-saradc-v5-0-bb0df3ecedaa@axiado.com>
 <20260810-axiado-ax3000-ax3005-saradc-v5-2-bb0df3ecedaa@axiado.com>
 <anoYDi-bt-t6ZeeD@ashevche-desk.local>
 <20260817135610.00000c0c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817135610.00000c0c@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_060534_597781_3DA8ACB9 
X-CRM114-Status: GOOD (  11.98  )
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

On Mon, Aug 17, 2026 at 01:56:10PM +0200, Joshua Crofts wrote:
> On Mon, 10 Aug 2026 21:27:26 +0300
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

...

> > > +	soc_data = device_get_match_data(dev);
> > > +	if (!soc_data)
> > > +		return dev_err_probe(dev, -EINVAL, "failed to get match data\n");  
> > 
> > -ENODATA
> 
> Hmmm, I always thought it should be -ENODEV. (`grep -Rb5a5 "device_get_match_data"
> drivers/iio/` confirms this, but maybe it's just wrong to begin with, a few
> instances even have checks missing).

After a (small) discussion in this list, it seems that -ENODATA suits better as
there are less chances to get that from other frameworks and calls. EINVAL, ENODEV
are way too much overloaded with the meanings.

-- 
With Best Regards,
Andy Shevchenko



