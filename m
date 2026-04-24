Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98B4FE51F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 09:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFCtqsZeu8GtPVYIRwzzaQCiBOPIDqLaP8WifViEs8I=; b=4ZuPLNETucmc0+9ELaxqqQ/tPn
	et+USWJn1GEyxlC1mRypX7fc676seLwLmK36Cq9+XmOAtGwxJlxcds5swqLoWfEN+SP03MGh8PMqr
	bvfglxB+21bbahXBJ1lhRKTriHolkqxV/1reGnBUtyTvsQkwiMFZChGlwUERRWd7ihWMytQNqleUz
	HAckz2MX042fTPT+xOB5q+6tg3jaGY3bepZCPfOzip2Kob8L44/M3pcQg1tGEufLNxHt+qixEGCGC
	uryJ5hTWzc05CGQ1bG++n29zZWv8EFb7UgdO5ebQy/xPffoq04nq+clXM8Eu69pRW2Xd13LtExCjl
	tkNmJroA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGD6X-0000000Cx86-1mvN;
	Fri, 24 Apr 2026 09:45:45 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGD6V-0000000Cx7d-2tHe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 09:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777023944; x=1808559944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hakn+gZG/YFWCFkXjekj+kvyfuJfJyugadrRDXHdA6g=;
  b=FDfXYPApJeweZeh7NUzSsIlTsa152t3JatzXDwLJNgZSnse3fEzClTHQ
   lzZOIzSYd3NbBKEACjqdmcBAwE1ma1R7v5rWcp7Qi4XrNHMRm07X1eL7U
   Md+p6FJV3LWOhJpGc5wj9q2weoTvYIywoBGt2uJ0YHWnG4e5MSibAeVFO
   tnxMhUBx3NTAUI0ltjXAC/tZwABhZpPuEVy3vAIqGQTRKCfxa75rkSWsl
   SBHF6n/BAhoqHR9lAmQGbgl84meBp1HZ3zIiRazaYCJdAgy/c0Hsv+2ZK
   ZDEgVunNPgh7bUZaEMHdnq8Gv9cTFUcVOvH7gDR23X2lpLcoJS57VjOBJ
   A==;
X-CSE-ConnectionGUID: 3MERvZJjQ3+oDsTsMHHWow==
X-CSE-MsgGUID: MzDHReWkR1WJ/uSzXabcCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="81608907"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="81608907"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 02:45:41 -0700
X-CSE-ConnectionGUID: NUD2afy6QMmlNLynjKgEGQ==
X-CSE-MsgGUID: 5uNwqq81QJmHRvbpojr/Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="232769137"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 02:45:39 -0700
Date: Fri, 24 Apr 2026 12:45:36 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Caio Morais <caiomorais@usp.br>, jic23@kernel.org, nuno.sa@analog.com,
	andy@kernel.org, michal.simek@amd.com, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] iio: fix header includes across multiple drivers
Message-ID: <aes7wGq2NYmtfMgs@ashevche-desk.local>
References: <20260423183349.636757-1-caiomorais@usp.br>
 <a9307e04-3754-465e-a610-92c6e83cc3e6@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9307e04-3754-465e-a610-92c6e83cc3e6@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_024543_800108_7600129D 
X-CRM114-Status: GOOD (  15.94  )
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

On Thu, Apr 23, 2026 at 01:45:12PM -0500, David Lechner wrote:
> On 4/23/26 1:33 PM, Caio Morais wrote:
> > 
> > Remove unnecessary includes and add missing ones as reported by the
> > include-what-you-use (IWYU) tool.
> > 
> > Files changed:
> > - drivers/iio/adc/xilinx-xadc-events.c
> > - drivers/iio/buffer/industrialio-triggered-buffer.c
> > - drivers/iio/common/st_sensors/st_sensors_i2c.c
> > - drivers/iio/common/st_sensors/st_sensors_spi.c
> 
> We'll want to split these up, one patch per file in case they every
> need to be backported as a dependency to a fix.

Per driver actually, as the last two belong to the same driver
(different busses though).

...

> This looks like sorting alphabetically, not actually adding or removing
> any headers as seen by the equal number of insertions and deletions.
> 
> Usually we don't bother with sorting unless we are making other
> changes on top of that.

Right. At bare minimum we expect sorting + IWYU patch series.

...

> >  #include <linux/device.h>
> >  #include <linux/err.h>
> >  #include <linux/i2c.h>
> > +#include <linux/iio/iio.h>
> >  #include <linux/linkage.h>
> >  #include <linux/module.h>
> >  #include <linux/regmap.h>
> > -#include <linux/iio/iio.h>
> 
> On this one, it would be more logical to move the iio header
> down one line to group it with the one below.

Hmm... Personally I consider them different group, I would rather see

linux/*
...blank line...
linux/iio/*
...blank line...
linux/_whatever_driver_specific_

> >  #include <linux/iio/common/st_sensors_i2c.h>

-- 
With Best Regards,
Andy Shevchenko



