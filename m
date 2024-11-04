Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960C0D111BF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 08:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGtFLyR5XDU2TNJsl7+j3Dr9R/OvXbH4iYLcjUk7qa4=; b=RnR/neKkoD2se2w43yBiU5iFyw
	fMmWcbYCPMkGrGICAbsjViiKUC5pj2W5+Tsy4uNIzHlPRUAR4xUk7mF9YGY2zVhDpDvucYONTvj89
	UIHsa+icPV+vVDx228Pb2YtfSuxkCdWLSItzhK2B7pSIHXKKlpyRcLC9ux/Ar5yANe/1iqSNICi5l
	O+E70GGgTZovdzvGAR5qdqqnkL7TayfQJEB7t02IqTTYDMQzJoEiHawljtxC43TqFf3Tw3qrrzt/r
	5uUpaWWTb4xi9u78a9Q0YbpVKtLPwnaIsZOZ/RMWHqM9LpoDHHoOB5x3U0OvLDnxgInELU3CXimWH
	5gjwvimw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7scn-0000000D09G-3dC8;
	Mon, 04 Nov 2024 08:39:50 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7sb0-0000000Czkk-1jEm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 08:37:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730709479; x=1762245479;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ML6JuLR5aGTGkpWrKYsMlJoQ/UheugXHDbe7zvn2E4g=;
  b=JNzuLcPEtsgvhr7hlCAwN6UugFErwvoEccLoCPsGNWbeCl48VBU7SqZK
   uL0CKIqvQyDze4KayxCG5TUIj3Mc0fAqg/b6UZoK6Hv8CFFMEJ60xOG8N
   HbcwLpu8HnlKz6ru3WP3AXKiwLDiSP9Op0WuKTjEWZZ8qBx+s+Ni1kGOR
   z0hruqZIRxGCm/zH0A09HpOjOtxB6zEOZcc5B4vnzGl9fEef0huztsNV8
   YBW7uFOjsznNe28RraiiDzr3iZKgXBbIMFDTo5DCuX9RA2NMs9BHUOPBN
   1noLar4ChcnoGEGi1h1oBJKaxBlIFl9CU9C5LtWxN+RGhN0Eio0VrQ4s3
   g==;
X-CSE-ConnectionGUID: DkkYNHGqQ0eqJMhvgIVwZg==
X-CSE-MsgGUID: E1Cg4oWPScS5zmd+TGrbtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41502032"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41502032"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:37:58 -0800
X-CSE-ConnectionGUID: VctOKoJRQM2VqqPSh3Rvkg==
X-CSE-MsgGUID: +3dMFlo4Q2icgewC0wY8Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="88166032"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:37:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t7sas-0000000Az4Q-200R;
	Mon, 04 Nov 2024 10:37:50 +0200
Date: Mon, 4 Nov 2024 10:37:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Aren <aren@peacevolution.org>
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
Subject: Re: [PATCH v4 3/6] iio: light: stk3310: Implement vdd and leda
 supplies
Message-ID: <ZyiH3lkMZoAS-toj@smile.fi.intel.com>
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-9-aren@peacevolution.org>
 <20241103112933.60f96f97@jic23-huawei>
 <cx5bvcqfabsptn37uzscooh73j73dsoqadmfaibzxrzjk3byx4@ofwu7qa6ht4f>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cx5bvcqfabsptn37uzscooh73j73dsoqadmfaibzxrzjk3byx4@ofwu7qa6ht4f>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_003758_530270_2C7BA59C 
X-CRM114-Status: GOOD (  25.48  )
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

On Sun, Nov 03, 2024 at 11:11:13AM -0500, Aren wrote:
> On Sun, Nov 03, 2024 at 11:31:03AM +0000, Jonathan Cameron wrote:
> > On Sat,  2 Nov 2024 15:50:39 -0400
> > Aren Moynihan <aren@peacevolution.org> wrote:

...

> > For this Andy was asking for consistency.  Generally we don't insist on a
> > particular ordering in IIO drivers, but we do prefer them to be the same.
> > Your new ordering is inconsistent between resume and suspend.  Whilst
> > existing code may be inconsistent, you can still pick most common ordering
> > and use that for your new code.
> > 
> > If the existing driver is inconsistent then feel free to tidy that up but
> > do it in a precursor patch so there is a consistent style for you to then
> > carry on.
> 
> Oh right, the order of declarations in stk3310_suspend also needs to be
> flipped. Is that simple enough that you can fix it when applying this?
> 
> Apparently I was being dense, I checked the rest of the driver to see
> what it did (it's consistent about putting shorter lines & ones without
> an assignment first), and fixed the case Andy pointed out to match that,
> but failed to check the rest of the patch.

Thanks!

You may ignore my comment about RCT order if it's not that one that being
commonly used in the driver.

-- 
With Best Regards,
Andy Shevchenko



