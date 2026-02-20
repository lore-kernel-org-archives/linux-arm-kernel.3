Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DD8C54FD0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 07:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFJyDDj/nwb/WXyu2y8739tsNobmfJkVtRDp1FApWZU=; b=PHEUirv+gs2AC+WGDUmZqQg1oF
	ydQyfjg6Y+IC1QgZpeW0NLxSTg9firE53EBSINhUln3gmn15667/i6629O81eEfwyb8p2M/X9EiiK
	41iqGxXIAL55UFgiOVipMKaRsJS3gr9fzaj4FKDytMM8nx5Jcn2fNmi5lqXKkhTVfImfCPbMv8l8o
	hS/6/NM3rL5JmX7OCVtWthnxC9VCct9OJG/G6gRcOK6G5WfeUfnuy45S/LCx2J2Dq0EQHGw+Ql5PX
	Z52HLNQqaa+y0P1h7CX6vCgedvdrbgqN/Tad9qUh/mDaAwWAIFFCFceSKt9VA2ydlbeHWAbO/mzpr
	pN5UFUHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLJK-0000000DN2a-18ts;
	Fri, 20 Feb 2026 07:52:26 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLJI-0000000DN1h-0qfY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 07:52:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771573945; x=1803109945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CTACKERyrLFo7FWUXuOxaDSKmh3CY0L4vT8iY/OmwbI=;
  b=N7LXoRVT8gHiCwNoxhB/g+Er0BcwbF3XvJTOsvFrzLCggY/QJF+Kznfw
   G4JRaK2ppBIfEVB144IpOgRQmd8Ks6CYrLjAzWrIzgRNaJpuK8TFrFmOT
   SW9oWJbWUvrpkHXJZL7/6ZCnEKuyNUOBOqEXzcBo4aldxRtcib2XLKElj
   O5L5GfJulVkanALOjmE2/tyoo7Gu9QuDH55Qm7WUP4/dyssfeysG0AlQ0
   TqN7t27TFgc5hBp/PY6on05+/1iGHopxLrk3SdZPlBAprVvgwLZUNsQZM
   iK0w4z8p8erLdy1nNV2EYK6I24BfjRN86P0GaMy5cIfvwItCkckTfBRr+
   w==;
X-CSE-ConnectionGUID: OIcdZCXiT0em5WIR65oKJw==
X-CSE-MsgGUID: sunxr2SrRHqwHI85yNdz6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76504184"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="76504184"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 23:52:24 -0800
X-CSE-ConnectionGUID: EbRr2662QLGVe9sRhX654g==
X-CSE-MsgGUID: CGTUPyrOR9SIfNit8Y6E6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="212930068"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.25])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 23:52:20 -0800
Date: Fri, 20 Feb 2026 09:52:17 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, saikrishna12468@gmail.com,
	git@amd.com
Subject: Re: [PATCH 2/5] iio: adc: xilinx-xadc: Add setup_channels function
 pointer to ops structure
Message-ID: <aZgSseBpdOgoWgsG@smile.fi.intel.com>
References: <20260220053941.611415-1-sai.krishna.potthuri@amd.com>
 <20260220053941.611415-3-sai.krishna.potthuri@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220053941.611415-3-sai.krishna.potthuri@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_235224_283997_39ACB357 
X-CRM114-Status: UNSURE (   7.37  )
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

On Fri, Feb 20, 2026 at 11:09:38AM +0530, Sai Krishna Potthuri wrote:
> Add setup_channels function pointer to xadc_ops structure to enable

Add .setup_channels()...

...to struct xadc_ops to enable...

> different interfaces to have custom channel setup logic.

...

> +static int xadc_parse_dt(struct iio_dev *indio_dev, unsigned int *conf, int irq);

This is a red flag. Why do we need a forward declaration? Bad architecture /
design of the function calls?

-- 
With Best Regards,
Andy Shevchenko



