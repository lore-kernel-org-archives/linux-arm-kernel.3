Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCC6CA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 08:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAqYHbneXcuLPSAxDRJG97QDorHxLr/olmgfdkPy0uE=; b=ePKiRE31sawgjWeRJDzJNXkjFl
	az/f7ORPpCZihHBX99A6ph0kUQDwp9v8+wUJVrZYCwjaK4kYIYQ3o25nHYZgP3XqCD3N9pggCgVq2
	2QwW7gYS9mZxo2z3kaa1tkue4MdmjY2+DO/Ughi8xmfGtvnvE21bMHNLtgnYoFAWYlbbWCsNnbCqV
	S41sYkjuXcAb94+K/2heY0aiz2AigFcaX2/lvVtpDb7jctLMl9y0eVVVTl2J887Hy2Vp8SHgQmT7u
	sB1AM0LpOjfw15T7n6+JSq5/19tccvjzkUs8d4zkZubjJnjSwKuhpNmcYm4QRv0b4UW9Ra32LkgOA
	xXWthq5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYF5-0000000AwIg-3QrJ;
	Fri, 02 Oct 2026 08:03:43 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYF3-0000000AwIA-02u0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 08:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790928221; x=1822464221;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=DEDFriac35s+gIoyaMgUbMVu6cJHcKf+y+irwCw/Q9Y=;
  b=XNE74BanVlfrDZuXanvjX5ZWPGqzxxHis6xzzoFqJqHU75IzpqNWN4GX
   xnSDRMryjWntk9Sl8/AMOg4ca0lodpHuwbto/VG1nOVp1M+cg7mAT5xS+
   wUJwelkNJcRS2+6BDUA9/Ej5ZfIy0FFr2N8cXw8Fygi6FlT+2mop37Nwu
   VVN8ksYGYjXpatntuNRfeTq1C8zn4qyHwkvqnIuUUXlkLzUrKmbrP24L3
   YrNDDIy6s0RPoCtYwgnMMJUK5zywsHkWlsTjbJs/H3xJev6q6qzdFdSp7
   vPvUBsH6ai5G9BEVTRpQzoW56xy1QOOu5MixE30sdtOBwVanVQbC3emEr
   A==;
X-CSE-ConnectionGUID: O99xu0vBSFi6N3rOlNw9bA==
X-CSE-MsgGUID: 9vaRWmHrSwC3CJwXhDH+aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="101023960"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="101023960"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 01:03:39 -0700
X-CSE-ConnectionGUID: Hm8w3a7QQMW5S3wOS/afXQ==
X-CSE-MsgGUID: P6pK22I5S2mLVAZ748h99Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="279454708"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.188])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 01:03:35 -0700
Date: Fri, 2 Oct 2026 11:03:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chanho Min <chanho.min@lge.com>
Cc: Linus Walleij <linusw@kernel.org>, longzhao@ambarella.com,
	Wei Xu <xuwei5@hisilicon.com>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Long Zhao <zl020895@163.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v8 10/18] gpio: pl061: convert register access to regmap
Message-ID: <ar9lVUjfMbMWII8d@ashevche-desk.local>
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com>
 <20260921-cv75-v5-v8-10-282ff5d98dda@ambarella.com>
 <CAD++jLm8fWyAFY=Uv-O3-9joU+HiKjMAzmd0s6Hc=QEu51wCGA@mail.gmail.com>
 <ar9h0T9+EvRxj6As@BRUNHILD>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ar9h0T9+EvRxj6As@BRUNHILD>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_010341_089685_81C5F823 
X-CRM114-Status: GOOD (  16.08  )
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

On Fri, Oct 02, 2026 at 04:48:33PM +0900, Chanho Min wrote:
> On Tue, Sep 22, 2026 at 09:23:21AM +0200, Linus Walleij wrote:
> > On Mon, Sep 21, 2026 at 6:23 AM Long Zhao via B4 Relay
> > <devnull+longzhao.ambarella.com@kernel.org> wrote:

...

> > It would be good if some critical users of the PL061 could
> > test this patch.
> > 
> > Wei, can you test this on HiSilicon?
> > 
> > Chanho, can you test on LGE hardware?
> 
> Tested the patch on LGE hardware (LG webOSTV) All 18 PL061 GPIO controllers
> registered successfully.  GPIO direction and input read operations passed for
> 143 available GPIOs, with no failures or new kernel warnings/errors observed.
> Output value/readback was also verified on available GPIOs.

Thanks for testing!

> Tested-by: <Chanho Min> chanho.min@lge.com

There is v9 available already...

> > but it looks good!
> > Reviewed-by: Linus Walleij <linusw@kernel.org>

-- 
With Best Regards,
Andy Shevchenko



