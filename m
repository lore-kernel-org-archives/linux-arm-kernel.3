Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647BEC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 10:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgpRqRWeRbVfF5cUnWE4dtSfuPLNlAyhBEbJY43se50=; b=EyJ3y+XfVx+mFGqgt3kq6ZpiRn
	jpb1ut0k5QSOyDkwxg7PMuRHjuqSJvVdLgowerO5dIeGpa2WglYh2wBRZiRxPTEj9tVOPKDVtXQtT
	l7fk6ruwQypI4860QD6UZB5mMsXh/rdzAxovd3kLShE9Lszwg67JMlt1QGfcpUq5ZrOFtDJRVVZwJ
	7QpzFewnDxYpS51kA8Jny8+HIyiZhGYkOLMKx14E0hFn3SSqxQsszsiUIXE5V+otvTXVODbFhMLCD
	MEfDb4YZcOobL0sTRsjim98A6Wt/oiKCU/vycSUxBMq0Rg/UV8Du+oDw3qxkcg+WvGluEl4VyPvAT
	Bd2gPF4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Gqc-00000001Sty-23mO;
	Mon, 14 Apr 2025 10:15:26 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Ghz-00000001PVO-1wk6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 10:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744625191; x=1776161191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BiSUzfCDnNgIrJX+isw39+Vro9YCyJ6cdnHsguSEtUc=;
  b=nGQvBw7/zbySCyF6eWNa8+hHiQK+CWK1L25TNrPisP9lisuYvUSckhlI
   bfN6gM5TFDfgWNBhhqeIlL55Ovwgou6eR7XRImRgh2jaKr/bUTayW+B7g
   SYbWSJHiO50t66byiio9RPV5zN78I5uyS/AejNWyn9bhdS46d2Ym85IOk
   D0HK9UDTExH+jBhTAiCEk+eV/3vmtYWwoEhm4CPQek/zpfNeXrETdJyst
   F9LfDIlwJx5kgt0+jPnYO06pM37INYT+lJJhzCrwVwPr/0a9sp5/oFLQq
   yT47DFye3FbwT2O9ogsKlARQd39xTCL18cHY4DZHNlEDrvwAqZME+A83x
   A==;
X-CSE-ConnectionGUID: Tx5z1iUoSxqj+p37nS2RtQ==
X-CSE-MsgGUID: XgmLlcAUTGq1zh1arcaaKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46177333"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="46177333"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 03:06:30 -0700
X-CSE-ConnectionGUID: qTJjutGBRhqLYDoKfDvGew==
X-CSE-MsgGUID: PSjkCGfHS2ins9CPEqykHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="129625952"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 03:06:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4Ght-0000000CCbZ-3Dmf;
	Mon, 14 Apr 2025 13:06:25 +0300
Date: Mon, 14 Apr 2025 13:06:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] coresight: cti: Replace inclusion by struct
 fwnode_handle forward declaration
Message-ID: <Z_zeIdZMhF31DL4o@smile.fi.intel.com>
References: <20250331071453.3987013-1-andriy.shevchenko@linux.intel.com>
 <28dd049e-65b1-4111-8a24-ba9765bbb1f6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28dd049e-65b1-4111-8a24-ba9765bbb1f6@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_030631_536970_ACE6262B 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
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

On Mon, Mar 31, 2025 at 02:40:51PM +0100, James Clark wrote:
> On 31/03/2025 8:14 am, Andy Shevchenko wrote:

> Reviewed-by: James Clark <james.clark@linaro.org>

Thank you! Can it be applied now?

-- 
With Best Regards,
Andy Shevchenko



