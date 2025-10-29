Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93A8CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 11:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7B73XNnKK4gYHhSUYtGA4VAGT2Rrki1SpLzVUdKFQx0=; b=ChYhgNUftAqrDnv6FkY7hHWVj/
	cQAcB6LMDOZckw00J8uDFpArwUZeJjsn/DC4f84WROtaPFKkvImPUf//28QshVyNRK78ZYM1jP5Ud
	6BK4L+fp1SUTaRQAyR/z+ITUnIdyvr7Xu3XLAvwMBskT2XZAfUnvS5Y0LdqANSYAaVNIjgW9n+0/W
	sjErmGWE4jgxyrwJGKNQB8ugL3bTe4llAv8N9RRhDBJzOu18g4w+Oti6Q/CXHl+B5Pj1MihyTD82D
	ihSAh0rxJoAmtT2yzNbJ37wVP8yZxGhScPImR7F/K9wxnY6yLGOQMPeaeigkd8EUC+kFTTuGJ4Rvo
	qcIWMlpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4kq-000000013mn-155z;
	Wed, 29 Oct 2025 11:54:16 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4kn-000000013mQ-44ry
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 11:54:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761738854; x=1793274854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fuf1LfWN4j/837jd0hVGkh7BL7pxjiKOctcvPtmTalI=;
  b=hAxze3cvHdSOJFwLIp37wK+P++/GVMZgrvzlZ1jQK4RcehSNEc54hs/5
   H/et+wNbdKkT5rhQFxWV5OaGC5wRWr0mY9Ssrq4d5lh7sR1ZHko/cjkqg
   FZ1xG/QnKwTZHRgxSdQ8BaHmfTVG1AxWUwrPpSqA4dRHFSQ5f7/7TgIYe
   e3vFJ5pBlimnHT9yi6QGhADNkYt875bQwqCBVk+FT8HXZIDw+3Xp4jKJ4
   +gxYBIR3P27Dc2FSPYqe6lSBTbNF6M+PXG+Vn0C87SFnmv9YdqwbxQ+MS
   TfskKyBbKhjBgtMOxt6wAdeojXO8C+GY+QTmlqxq+raxR7QpBPzxV5GZb
   g==;
X-CSE-ConnectionGUID: n8eBBaJzSaSY0lRzbSs6jQ==
X-CSE-MsgGUID: n5USf2cdRm2nrOOJ/lpKfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="81277286"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="81277286"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 04:54:14 -0700
X-CSE-ConnectionGUID: 5r6AkawHSf6SHNTAxhpQGg==
X-CSE-MsgGUID: 6g6unhV9Sm+rGyvN/M0+Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="222855207"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.248])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 04:54:07 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vE4ke-00000003bMP-1GBg;
	Wed, 29 Oct 2025 13:54:04 +0200
Date: Wed, 29 Oct 2025 13:54:04 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 10/10] regulator: make the subsystem aware of shared
 GPIOs
Message-ID: <aQIAXO1hUrw4Yp9V@smile.fi.intel.com>
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
 <20251029-gpio-shared-v3-10-71c568acf47c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-gpio-shared-v3-10-71c568acf47c@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_045414_070443_51275C00 
X-CRM114-Status: GOOD (  13.93  )
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

On Wed, Oct 29, 2025 at 12:20:46PM +0100, Bartosz Golaszewski wrote:
> 
> GPIOLIB is now aware of shared GPIOs and - for platforms where access to
> such pins is managed internally - we don't need to keep track of the
> enable count.
> 
> Once all users in the kernel switch to using the new mechanism, we'll be
> able to drop the internal counting of users from the regulator code.

I am wondering if you took into account the layering violation (or others
put it as "transferring of ownership") in the regulator core for the platform
based GPIO regulators? This popped up during the discussion of
https://lore.kernel.org/platform-driver-x86/20251024050537.92440-1-qiuwenbo@gnome.org/

-- 
With Best Regards,
Andy Shevchenko



