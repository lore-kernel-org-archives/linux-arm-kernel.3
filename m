Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0498FEA4FC7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 14:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxKATui/UQyUvubDHJXnZf2s00J5h+7DdlYLHSB06SM=; b=hiMC58n3Yu9W+Xm+1U9E4GO0C4
	cYjFT9s0ZwZwD9qeKDlQ+CluqpqBOIV+4njAHFT3d63IDVIMwHRlSuOMbxbGyiQpooSqhAK2dY3zQ
	a5gV9mDOrHa3bMeSoimmZB4DM8iM8zvCpmLdN5mAj0u61acSRELPWBjL+2+NzvUSjEDmnopKuqjOV
	gEiRlSuRVUogZMEuR0zaps2IzR7T02nvlVfhuWJdVFdWBkAbUgSgVTOothYaHEqIcFJTBbgPRth8r
	leX7g6I0vnlnxjA2tIkRS/4go7q7HxV0mTLSt6E8RY0lg+7aWe1Ay/4GXvEJ5X0HBsufCIyIO0Uqz
	/DWgCvKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXK2-00000000VLd-094J;
	Mon, 23 Feb 2026 14:54:06 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXJy-00000000VKl-1lt8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 14:54:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771858442; x=1803394442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lKSI3fNmZ35AjEPR2S93P8vRyJRP+Lw9+ZmmDpvhR1E=;
  b=YvFAf98Du0Pr7BoDMHTVYbEEoZr7pgHbb3BF52hxLeWd8QdSJvguge8h
   iDilpu4Xi/TgNvQ8n1HrZn7sj/5tomye36ESv/XLXtfLlZ1HPa4hjxU7w
   mCMn60QcLleRVtVHj/HYPp74jDmYrA5kmY/6s1NYlCsbE0xRNiPAuzGrP
   A+rF7JL5lBL/SIFPMTkeHAHg66ucoAMZwjELlQT8D3yXBkmMm7Up0ibSC
   6mSSQaILFofdxJPgcbMjuJAtGymBFBAQ1Ra9qk99HeG/9HBhMCiH/8eJN
   UpAUJBvRslotn4w0EFf9r7ty2dEUp3T/ASLJrLwgcX5D1AXojYuka0DNU
   A==;
X-CSE-ConnectionGUID: wCiOusYxR0iV3dHVSu4OLQ==
X-CSE-MsgGUID: DJ48e/3NSqu9qwhu8/Vu4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72893576"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="72893576"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:54:01 -0800
X-CSE-ConnectionGUID: CYc3oGXDRh2V11auPgHWmg==
X-CSE-MsgGUID: UrG81fSjSdWzjN+e9HqG/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="238553814"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:53:58 -0800
Date: Mon, 23 Feb 2026 16:53:56 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 1/5] i2c: core: add callback to change bus frequency
Message-ID: <aZxqBOaFId-9WfnR@smile.fi.intel.com>
References: <20260223-i2c-mux-v7-0-ec75b214718a@gmail.com>
 <20260223-i2c-mux-v7-1-ec75b214718a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-i2c-mux-v7-1-ec75b214718a@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065402_794371_CC5258C6 
X-CRM114-Status: GOOD (  18.02  )
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

On Mon, Feb 23, 2026 at 03:33:50PM +0100, Marcus Folkesson wrote:
> All devices on the same I2C bus share the same clock line and the bus
> frequency has therefor be chosen so that all attached devices are able
> to tolarate that clock rate. IOW, the bus speed must be set for the
> slowest attached device.
> 
> With I2C multiplexers/switches on the other hand, it would be possible
> to have different "domains" that runs with different speeds.
> 
> Prepare for such a feature by provide an optional callback function to
> change bus frequency.
> 
> As a side effect, several bus drivers keep the bus speed in a
> private structure and can now have this value stored in a uniform way
> instead.

...

> +	/*
> +	 * If the adapter is a root adapter without set_clk_freq implemented, this feature is not
> +	 * supported
> +	 */
> +	if (!i2c_parent_is_i2c_adapter(adapter))
> +		return -EOPNOTSUPP;
> +
> +	/* Update the clock_hz for non-root adapters, even if set_clk_freq is not implemented,
> +	 * to allow * the clock frequency to be propagated to root adapters that do support it.
> +	 */

/*
 * Please, keep the style of multi-line comment consistent
 * and as per above.
 */

> +	adapter->clock_hz = clock_hz;
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



