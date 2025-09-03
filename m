Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26E1CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 22:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3m+4UVOMV+iDzynZN9VNQUFagRXoQT/Zh9N9jo5/QX8=; b=BcblbuSQ8+1AEXTpRO9YlsyHY4
	SDre7LMlK1+MiO9X+oGnv2BP0ww9IPej72rKLmJOzkNlnEtap3nhfZ14phvRCHMM0fwHrN84JzhF+
	0aoGq6cLu0wW4cWpAeCHeELcNOHScZVw5pqGETghKZESgcLAvQUsCXt57yuuA3pVMOlP48jiY4nDC
	3coXoZUgv9J6WTbN3Di+3idvkcIhDjB5ytyorKtgKubnYPgAEb+zICND0oWkcC8nYLL964nyrbvR3
	MFRjs2ZF0ov90YuxeT/6NjdTTwYFHFbNPTutcPvh3Ug63HLU3JL2UcCI0j/QoNS8k7J4DXsAuIqg4
	MmrosP5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utvjd-00000007lzL-1Z2q;
	Wed, 03 Sep 2025 22:13:45 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utpc3-00000006x7x-3IAz;
	Wed, 03 Sep 2025 15:41:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756914091; x=1788450091;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N2s+b8yQSCdu263w8kaJufSOphTU+OL/XziV+EYWFfk=;
  b=dVWNYOvecE456RUT59zo4zC1jyi8ELzbkBMkg7Sv2+zlEV9cRinWKi7s
   a25j3ZFfVLdicQ7PmvTWEWjVLkfv57/xy9RrSQAtlOfOVqkqXMUDgddqN
   XDgpeM621EiOdqNqLVeIRd4Q9sqgP+Gya5elGKKakMY49/ulR59qIWqjP
   N+eb9fPaehsmmNG6BYnGKaMj39Q8KPOz+hSQdn/B2+zmp7uoVOCR+HwIW
   +VTtMmhSeTQCDX6D/WxgxrvaJqXZBGOzd1Hn6hId5Jsk/1kj8GCo+sRtI
   ig1tF8yGZAkKlGjTg8+aJKWe6/iALq4kOydUF/wy4CvumgLYLLf2PL0K4
   w==;
X-CSE-ConnectionGUID: uRmaQcwWT9O3HAR9GbPoIA==
X-CSE-MsgGUID: 0Qn9oIb+SPS3ue3XAMI7Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="46806236"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="46806236"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 08:41:30 -0700
X-CSE-ConnectionGUID: IBh6LXKgSQKHmQGUyFcJKw==
X-CSE-MsgGUID: VDwwqc9DSbe5Dh0/U+6bsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="171564223"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 03 Sep 2025 08:41:28 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 9DA5C95; Wed, 03 Sep 2025 17:41:26 +0200 (CEST)
Date: Wed, 3 Sep 2025 17:41:26 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Yang Shen <shenyang39@huawei.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-unisoc@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RESEND 05/14] gpio: ts4800: use generic device properties
Message-ID: <aLhhpiVpGscOFydS@black.igk.intel.com>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
 <20250825-gpio-mmio-gpio-conv-v1-5-356b4b1d5110@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-5-356b4b1d5110@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_084131_831557_6F741D97 
X-CRM114-Status: UNSURE (   9.80  )
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

On Mon, Aug 25, 2025 at 11:48:46AM +0200, Bartosz Golaszewski wrote:
> 
> Avoid pulling in linux/of.h by using the generic device properties.

...

> -	retval = of_property_read_u32(node, "ngpios", &ngpios);
> +	retval = device_property_read_u32(dev, "ngpios", &ngpios);
>  	if (retval == -EINVAL)
>  		ngpios = DEFAULT_PIN_NUMBER;
>  	else if (retval)

Don't we have a method in GPIOLIB that does this (can be called explicitly by the drivers)?

-- 
With Best Regards,
Andy Shevchenko



