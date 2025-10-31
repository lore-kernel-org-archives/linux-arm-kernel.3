Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0F1CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 14:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBjbzKnwNGFPcKVzuuUXipZ/oERKOjV+5DDGM+Hw9l4=; b=wlSgv2cCFDJvaRgjnORHKHhUR4
	NlRUtW1v3JiiBTKV1I+DrumqiQuLTkvRLN+jtCRrqunEATrBl1KjeFOt3dHnu3o6KIbblU4Q+WxNR
	a0sWCyjAFWNd15MntyJGVu6rbY9nYAqEQPkuXhAxMLcCRbT6yG1Vy8QqkX+D/iHnLFFMFQmm0VOqa
	7BjxwbBSiqV7OUu0dxG6qplsXaSqpOAgVg2JXvkHgKpyRGeyRCmBiVsazp6eVfS/rpcVdTe+WhNBd
	+2Ail5qmqabkT0tffcn5TuJOQndxPmjB/gR2USHPtbQKXz3ExG3ZNjDU6RGpL1f9rDp1uBcQR3JDt
	SuQ8gm/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqMZ-00000006GMr-1ZHI;
	Fri, 31 Oct 2025 14:44:23 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqM4-00000006G7u-3v34
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 14:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761921832; x=1793457832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yiJIG8RgYqqsqxUcvGus6coafj2H1WoefBY5Wu39Z2Q=;
  b=HBGQ9CQxNQkc590syxR1V1V5wR+Dh3VrIp7Xc+N5a3YK4BmkwGA5zpRu
   0ShckxDB+hUvxAUEeNrVUAD+rijeAZ5UM5CzFtIarHHC4k5VXAWrL2whs
   xpigmCV43XMsP/CjNcPqXeGgpEIuaOU151Pm37hlZlhVMldFBy7FH4MIr
   Ct23HwyoQGJ07pxYqaeLClNVl6bIBKEy8axjvUL4iu4gJsmmyKnnh8M99
   OmzB2HbAO4NESIxnyZQQkzjCxQFSA2MEvmU8Fk7uV+LGLNzEvnymCjbeP
   yoxFIzfLI1zw+nFp3fqaKarTcztxPO0b72/hqEVHba73WK92DuSPYoJw8
   w==;
X-CSE-ConnectionGUID: QCq047hgR/ywY3YYUr5uCg==
X-CSE-MsgGUID: S6O3xb6GQeO/M+yaIBnHQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="81494978"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="81494978"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 07:43:50 -0700
X-CSE-ConnectionGUID: NkH0JEyISkabtWBtmRcyjA==
X-CSE-MsgGUID: uEaV6zgSSqqCzkr7PJaDdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="190599652"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO ashevche-desk.local) ([10.124.220.66])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 07:43:49 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vEqLv-00000004Ia0-25Ep;
	Fri, 31 Oct 2025 16:43:43 +0200
Date: Fri, 31 Oct 2025 16:43:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Nishanth Menon <nm@ti.com>, Raag Jadav <raag.jadav@intel.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Tero Kristo <kristo@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk: keystone: sci-clk: use devm_kmemdup_array() once
 more in ti_sci_scan_clocks_from_fw()
Message-ID: <aQTLHlv2_V9Pgjk3@smile.fi.intel.com>
References: <a8e94921-a426-4db8-aed6-b6e17e88b8e3@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8e94921-a426-4db8-aed6-b6e17e88b8e3@web.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_074354_255653_54F21235 
X-CRM114-Status: GOOD (  14.71  )
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

On Fri, Oct 31, 2025 at 03:33:24PM +0100, Markus Elfring wrote:
> 
> * Reuse existing functionality from devm_kmemdup_array()
>   instead of keeping duplicate source code.
> 
> * Prevent a null pointer dereference.
> 
> 
> The source code was transformed by using the Coccinelle software.
> 
> Fixes: 3c13933c60338ce6fb2369bd0e93f91e52ddc17d ("clk: keystone: sci-clk: add support for dynamically probing clocks")

Wrong format of Fixes tag, please keep the SHA at bare minumum.

...

>  		if (num_clks == max_clks) {
> -			tmp_clks = devm_kmalloc_array(dev, max_clks + 64,
> -						      sizeof(sci_clk),
> -						      GFP_KERNEL);
> -			memcpy(tmp_clks, clks, max_clks * sizeof(sci_clk));
> +			tmp_clks = devm_kmemdup_array(dev, clks, max_clks + 64,
> +						      sizeof(sci_clk), GFP_KERNEL);
>  			if (max_clks)
>  				devm_kfree(dev, clks);

> +			if (!tmp_clks)
> +				return -ENOMEM;

You haven't read the code, right?
This now will work differently. Would it be acceptable?

>  			max_clks += 64;
>  			clks = tmp_clks;
>  		}

-- 
With Best Regards,
Andy Shevchenko



