Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192A8C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 06:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrE+Xpcc9OkxLyVZ7+mxr2/E1WQvXxHbBEf/HiXP99Q=; b=yUfV5bPga98ltNvAJ4W1GSAjR4
	LRBxAIKhOByU/UPGgYC6gbVPdgOZkQpY4RQy+jIdlwccZX28+fTTsGbvYyL8GL6/sm0WxuE8/35KQ
	N0Tq3LSdaEXUBgOQXC4fzjnK2KxeOf1TElTROWgHIVn8CUM1Lj1960s94clygYzz2by1cH8XbrK4y
	JxKsN5ZFbbMP1978ZZ4fiQL+cgGiGi/8Ba3RJvCZPE1ftpl+W0qS16UGNwvRHrUGjMJB1ltURVPJz
	Kve2wX5YI/yq1bOYnBoyyY/lK+C4F6HNP6a5xXqpjq+hT8nmi2KPJ46fOpgJUUETcSyGVXTDzoNg6
	4J+QWq7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1IQf-0000000B5Ab-3RWW;
	Tue, 01 Sep 2026 06:57:09 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1IQd-0000000B59w-1Uma
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 06:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788245827; x=1819781827;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z8iSOtQQ5N/Zb04KDBa6B08g8AitxJSoe7kabS6P2yg=;
  b=nEq7Q2Xl0QBkaIN4IdT/k5XCoNjHcqrNkchTQzwmlpR9Ewq1fUtMrCd/
   Gpmntz4tXnJr829yIzIFNLD4P2o7h779s1tXKAvf99itqrm1JY+raAvCz
   pah9AL0YkGrlsEC5fwm2POBtwy1EfZ/m2deE0GX+wpF76pcG70zm/tRFO
   oVno7w1zhwdGgdCsiEsR6Ar/YShXT/TnrnozN9no0x8TEUZTZJTNZwsxX
   TBg6okGbez+ZI0IuqUfeM0I/EEsxms7uFid77lXD19lWbk/dKYrjOJNu5
   Nip4nVL/4lA53w3spx/cH55xnGSMehoejPE6OlVd1gC8QPjmrf1sJQsZ4
   w==;
X-CSE-ConnectionGUID: PhiF4dpASFiNvMGQy4FsqQ==
X-CSE-MsgGUID: /Sm3MCj3QmmeZEY4HnY5SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="111435566"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="111435566"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 23:57:06 -0700
X-CSE-ConnectionGUID: 0dRf2eKMQ6mUUxunvfbtVA==
X-CSE-MsgGUID: /rACxs7dTwis/6NrTuKXow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="269060856"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.222])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 23:57:02 -0700
Date: Tue, 1 Sep 2026 09:57:00 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: mdshahid03@gmail.com, Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] iio: adc: bcm_iproc_adc: fix include dependencies
Message-ID: <apZ3PBOrxn9sLjKD@ashevche-desk.local>
References: <20260830170919.470974-1-mdshahid03@gmail.com>
 <20260830170919.470974-3-mdshahid03@gmail.com>
 <apY4GY-0_XMSfE9B@debian-BULLSEYE-live-builder-AMD64>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apY4GY-0_XMSfE9B@debian-BULLSEYE-live-builder-AMD64>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_235707_443648_22AB695A 
X-CRM114-Status: GOOD (  12.76  )
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

On Mon, Aug 31, 2026 at 11:27:37PM -0300, Marcelo Schmitt wrote:
> On 08/30, mdshahid03@gmail.com wrote:

> > Add the headers required directly by the driver for completion and
> > mutex APIs.
> > 
> > Remove the unused `linux/io.h` header now that register access is
> > handled through regmap APIs.

...

> >  #include <linux/clk.h>
> > +#include <linux/completion.h>
> >  #include <linux/delay.h>
> >  #include <linux/interrupt.h>
> > -#include <linux/io.h>
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/module.h>
> > +#include <linux/mutex.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> 
> I think that's okay. Though, if you go for a v3, you may also add 
> #include <linux/bits.h>
> #include <linux/types.h>
> #include <linux/array_size.h>

> #include <linux/device-id/of.h>

This one is covered by platform_device.h.

> #include <linux/iio/types.h>

This one is covered by iio/iio.h.

> which mostly completes the list of includes iwyu tool reports to be missing.

The rest is indeed needs to be added. Thanks for spotting that!

-- 
With Best Regards,
Andy Shevchenko



