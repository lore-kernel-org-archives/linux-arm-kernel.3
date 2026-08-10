Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91672C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 08:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EiNSrWMYXU1lAESrBBTqirBD1aqtB7igJQpO5uxNUA0=; b=HP67pm7zAm0KIdtMUeDroBVjv/
	iUWZCYDtr5FRyEWb1hki/ouemow88Iqg6J1bQeGglQcS6hgU+a+7jleTogDzyMqdBgLEyfkaspV71
	wrjCwpAo5v8eQXaEGsyzMuD1nL2Y074Q6xLQf/IVus0oAvPxgzGbnvhcuGUcjdJrHMQryCdT+IQpF
	qwcBUOrAi64hbYvgFiMyWhNZ4izKjFH+mz/HPd5RgxsRkLFIC7XjORgtfHHO2qkOqkQ61rJ0uW0OA
	DzoU60HC89mNelDbZIZSH8GRh3aDwGSVJ04XV/4UXlvr/9GVIFlbwSnPglrcVwPBf2b3so83+U53n
	8zV0IlrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLLJ-0000000BHnE-4BzJ;
	Mon, 10 Aug 2026 08:26:46 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLLH-0000000BHmY-1kn8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 08:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786350403; x=1817886403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I+uvV4fVrNWKtuIs7EPZt3PNlff9PBOCKPezXlsgBoA=;
  b=S/fRGy1DsnCZ7in8Ff76aPI/snNqN5r6Vt99tOYCWPNRgqcOyFOyJtYq
   3eksCD2etT3CZdgb4wX9YQpborKGn0Bg1E0b1VWc+JF0PxdXH7XEkZlTQ
   19CaLSOLC4azpQ8xErgdgmGZmxGLaFLUkIJT3bLPSqPZuuKngq9YREt2J
   8MtVyq8GOuKw3dVvipvqVHU6aog1clLmJTkW/xD5WXcaEasY5JQyBNoF0
   A44NkHeJe4cBBY6Y6SO0gcUowE3kksYFlUw+3f+Ohg4zfgWBbicPHbPfY
   za1wFi4LQ0UJ2Z0uaSEyK6vZ6pppc5F6OnN7DOf9wA/f1h7bHZRHlh/m1
   Q==;
X-CSE-ConnectionGUID: +WEwj2uPQ3GthYILxOrMmg==
X-CSE-MsgGUID: BCy4PrXpS5yNdWbwdg+N/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="85976406"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="85976406"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 01:26:43 -0700
X-CSE-ConnectionGUID: auTyl09QRNqrr1RebhmFJQ==
X-CSE-MsgGUID: GjUCenVnRi+6b30eZH28JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="264960689"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.99])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 01:26:40 -0700
Date: Mon, 10 Aug 2026 11:26:38 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: mdshahid03@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Markus Elfring <Markus.Elfring@web.de>,
	Joshua Crofts <joshua.crofts1@gmail.com>, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] iio: adc: bcm_iproc_adc: Introduce local device
 pointer
Message-ID: <anmLPn_6JYqLVcsa@ashevche-desk.local>
References: <20260806023902.8608-1-mdshahid03@gmail.com>
 <20260806023902.8608-3-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806023902.8608-3-mdshahid03@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_012643_467728_F25F7A77 
X-CRM114-Status: UNSURE (   8.44  )
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

On Thu, Aug 06, 2026 at 08:09:01AM +0530, mdshahid03@gmail.com wrote:

> Introduce a local 'struct device *dev' variable in iproc_adc_probe()
> and use it for device-managed helper calls instead of repeatedly
> referencing '&pdev->dev'.
> 
> No functional change intended.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



