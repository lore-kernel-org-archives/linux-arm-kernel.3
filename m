Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036AEF46441
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 10:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0wegV4/4h7iDrEpbvJ3/9t9wTA1VvJ2zKiM6J/rQ9E=; b=T7ZfP1dFAg5XfmuLawGiFqaSsL
	Q3uSULc0vIHIlakWTE0+5KEm9xaRF+4B9fCzAdzLjQkxzbx46VVJoh2RVCjTSwdqY9Lcxn7nLoInd
	LXugglaotqCeONODVrDXTs8jX88hnYHVjL6h6tFfboCeNE0Plv06dEdsYKrqGfsCuZtHOi1BSWQww
	ZTg7xTIzksXyrlCcmPDnknaRzru+y/mQBu2jcnRBjwwtYIUatV9lYCf/WezfE9pssYhuKAjDlf3gE
	IC+r/Ln0yzWbAqnlvtHvKRVfQzhrMrWBN5UAGngNOcjOctoTH6RCr0xhh5fpbCaOrW3MuLm9DXm/h
	ato1zBzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24kO-00000003igS-3WM9;
	Mon, 16 Mar 2026 10:00:28 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24kK-00000003ig5-0V1n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 10:00:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773655224; x=1805191224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oDCWXtcdNUoexWPdAJlnnGHY5eh//4KjcNNcgNjgvqA=;
  b=ZNttDfvbrEVBUkmB+m91K5WY0H18/8Qj9YUbU/GhBZXnce52DVW+5SZH
   wfUQqBUUbuN37pErdhGgWF9vWhkYHRUOJxmH88GxnXsta3l+yPA+IffvY
   xkbrS5SfR72WY8ytg9ZxlvZSOlg5S67081J1PvcTZW4cBg4B06A/R0A59
   RWGOv8KZ3cWjZR+8JFl+xmf95FKOsorOcR02hwroxCv9AoRIuc4tcHf6c
   HzFtIw0u1tDokIBfAyDB+9appb3k3tmb7cQb+drbliw9PI08L5ilt0wIf
   Zy87GfQrgY7amgROlO6gpmhvW/GzR8F1W+2TEq5sCAT0lA4sh/qjngFUs
   Q==;
X-CSE-ConnectionGUID: ntHnNA8XQLCEo02L8EWaJA==
X-CSE-MsgGUID: BKqwulhNQwymOVk6aRjJbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="73681462"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="73681462"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 03:00:21 -0700
X-CSE-ConnectionGUID: rSxpTnUpRkqodHdy8QXgDw==
X-CSE-MsgGUID: t2z2WKsKS7qI22OnAKAatw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="259768354"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.237])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 03:00:18 -0700
Date: Mon, 16 Mar 2026 12:00:16 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 4/5] i2c: davinci: add support for setting bus
 frequency
Message-ID: <abfUsE0cR6GddDDz@ashevche-desk.local>
References: <20260314-i2c-mux-v8-0-fb1738a4df0a@gmail.com>
 <20260314-i2c-mux-v8-4-fb1738a4df0a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314-i2c-mux-v8-4-fb1738a4df0a@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_030024_223212_81979204 
X-CRM114-Status: UNSURE (   8.73  )
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

On Sat, Mar 14, 2026 at 10:22:43AM +0100, Marcus Folkesson wrote:
> Populate adapter with clock_hz and .set_clk_freq() to enable support for
> dynamic bus frequency.
> 
> Remove bus_freq_hz entirely and only use clock_hz instead.

...

>  	u32 input_clock = clk_get_rate(dev->clk);
> +	u32 bus_freq_hz = dev->adapter.clock_hz;

> +

Stray blank line. We have already one below.

>  
>  	/* NOTE: I2C Clock divider programming info
>  	 * As per I2C specs the following formulas provide prescaler

-- 
With Best Regards,
Andy Shevchenko



