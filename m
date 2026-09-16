Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6987C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 10:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNAPLeXvS/tFg50EoyCbm6x82GXfrOBF+R3wO613ajU=; b=0FgpVa4rV6e0ElKpD6aA0W6phV
	zhAulJx9GkeUaUeL4RRuy+llfSPEUlxP7wK0Q7VjNjyKSflaKBdl2egzcLbR5nJjdliiA3n9pujFg
	EUg2bzUvqRSwZXKZWpO4pxXOR9eeNHR01JI2uVkHatVtAO+di3GF6mn7FJxwPP1QLkhfrs5S47eVk
	GrI5Kt1jKqG70YZQFkE3DxU58UO3lKSgUttMLho77axgb2tkJF6tESRbdOfMnh2C0qDOt+K8WOfFm
	KNFy2UEcLzxbz+k0UkDGrvbemajKNdxOd7nzB+2zQ4s7UO6InpCqnDYAl5vtTOkoiutWV+8seuJ32
	B7OC1g9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nEg-000000090cU-3ncs;
	Wed, 16 Sep 2026 10:51:30 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nEe-000000090bz-2LPi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 10:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789555888; x=1821091888;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3dnspZBBhdBbFMeM0WCDXZI0ml0DomVOCTSEv9AUE24=;
  b=nrSFWzLiOz2fYV8VxWSZ1y6s6XvT9UIUkEvHTxdrHJUBvqA0eXKfky8U
   +i2ew3SXpBsVPtAE16hcEP2cs3VslMp1xDxHKnajKttzDC5vc8vb+oaBA
   HVispOqWywsHA4C1EqmX2A2y1UgXe6rTvGwmqtUdJmsQ0LaeZeODnJivL
   Qc4ga/Wk3h6iduqUukujgi2SybxK1VqBeojG8ezmuD0IHvgtn0jlssOmI
   uoJZ4cYe/TQXZlcdjD3fikRCFWLPpNlaWQZrIO8QpWo9NxSfeaTrvVWqh
   igK+3q507JYKGu8oHziI7WiAF2itsbeEMArrWg+k+CBURjMq2xp39iiNm
   g==;
X-CSE-ConnectionGUID: W7xbjnUcTpK7kSkPidr1XQ==
X-CSE-MsgGUID: U1+9FN8OSlGd39GP0gYe+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90063475"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90063475"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 03:51:27 -0700
X-CSE-ConnectionGUID: f53uaTkgRHSVd4aHVEbG+w==
X-CSE-MsgGUID: siQuExozT/yqdlSyeZN/dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296795155"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 03:51:21 -0700
Date: Wed, 16 Sep 2026 13:51:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>,
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 11/15] gpio: pl061: add Ambarella register-layout
 variant
Message-ID: <aqp0pxBOc-amrmCz@ashevche-desk.local>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <20260915-cv75-v5-v7-11-3297d3fbc9c0@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-cv75-v5-v7-11-3297d3fbc9c0@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_035128_664872_C37CAFE7 
X-CRM114-Status: GOOD (  10.01  )
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

On Tue, Sep 15, 2026 at 07:15:41PM +0800, Long Zhao via B4 Relay wrote:

> Add a 32-bit, 32-line layout with DAT/DIR/IS/IBE/IEV/IE/MIS/IC plus
> MASK and ENABLE. Probe unmasks the bank and enables the controller.
> IRQ type changes also clear the pending bit. This derivative does not
> need write-after-direction or system suspend save/restore.
> 
> Match the part with designer AMBA_VENDOR_AMBARELLA (JEP106 identity
> 0x68, bit 7 set) and part number 0x061.

Yep, this one looks nice now!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



