Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169F9CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cz29bOMWF8vbX2o/m1bZENy5PRqw1HW5ToaCrOCHBjQ=; b=I2ROpVY4gnvGrpnqiY9btOupCw
	5KWoQIv3+rDLqDo5aEUXPF2vm19okcJVmeARCrsDtR51315oNwj+Y8glC4ZLm6BiDRbd7mJN7JFBQ
	snz7XjdnoqpDJNC5m6BB4LT1I+jJ3lcATrIogH74IEbV1kQLYEx/jmszFkp7NAuRUljHDdojNwMKD
	PM4Nvnu3LRbW5tpYb7bbY2QXrUYIwchjHxgH/rVLESi3BXLz4hkeU6JieUdyZW+GRRV6A3UCd7efZ
	kWw6wUJOLH7h2lUIvked3b4lXh7VjTeou8hkRvp8lbzSBs3Gvl/7hDgPApOmvHr1q/Rky3xSMWLIz
	NnfJWmSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZTa-0000000B7uz-2Cla;
	Fri, 02 Oct 2026 09:22:46 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZTY-0000000B7tZ-1IjY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790932965; x=1822468965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fjiLNweLxwmozP439aS0ZNu1H6FrPKQa3Ai1bKR9ZlE=;
  b=LdRYyhbwjtEqAllMZnnUdIlQLD4P7oRusht+jqt4IF06wNlxK4NsMfwF
   STPirGH1aRRLaY79CNcDoRuY2RgLLznJlPzctExPIzCjXsERQCuJKrbPu
   Z0UD39/QDvqlZGb7UYX+yWmt5tBn/7om+U3G0q7sAROZ0OucrP4NQEona
   ZWLMYJJ8NKV2WaFK61cuV5tTyy7AK8nJZv5gV7rxbmXvBweHIhDeDTiCJ
   JdSfs/Zt7OZjuCSWiHBsyRY5CXaahEKu8MNBBSmTBijX84z4o9lxbZXkc
   Hpe1lsNFGUHkpkaiV6o3Z4Duuw1E90kwfCtMP8+dZm6wVSnzXYMdKq+cv
   g==;
X-CSE-ConnectionGUID: EdfxPxR2RBSCd10Dn7KRhA==
X-CSE-MsgGUID: csyINMTlQd6+slIwuCHGbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90728988"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90728988"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 02:22:43 -0700
X-CSE-ConnectionGUID: eNU2YW10T22FBc3/h+ZAhw==
X-CSE-MsgGUID: y1/IruAGQNa1bH81g2tJsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="302464580"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.188])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 02:22:37 -0700
Date: Fri, 2 Oct 2026 12:22:34 +0300
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
	Michael Walle <mwalle@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>,
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 09/15] gpio: pl061: use IRQ_TYPE_LEVEL_MASK and
 IRQ_TYPE_EDGE_BOTH
Message-ID: <ar932rg30_MnbRhf@ashevche-desk.local>
References: <20261001-cv75-v5-v9-0-486cc289a4b8@ambarella.com>
 <20261001-cv75-v5-v9-9-486cc289a4b8@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-cv75-v5-v9-9-486cc289a4b8@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_022244_416815_EBE7A274 
X-CRM114-Status: UNSURE (   7.87  )
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

On Thu, Oct 01, 2026 at 08:40:58PM +0800, Long Zhao via B4 Relay wrote:

> Use the standard IRQ_TYPE_LEVEL_MASK and IRQ_TYPE_EDGE_BOTH helpers
> instead of open-coded edge and level comparisons.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



