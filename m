Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDECCCDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 21:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKSzb6vgfh2Bcqwz8N01dWU91MpxEjvrnQ9zVlxcUJk=; b=s4AkTPEppwYSHvOqhfJYfKy/I4
	e0QRM+BSyqeJ3Y+dM3rvDV7Xnu0c+guhlrrljVdUsQUYCgdNofwWMUQR0TxRVQO7xIkjESqgiV60/
	XuzxHIEbFv8wQUL5p0r+Hc7l4e8YYpDHyj+l4+5TCVZ2epwbKH60K6U7gm7IWaUnGyRxULMDBRmzV
	Rz9ffJbIAPW7ESWS2+IOsZn6/8/oGHv/8J8FiNKcTTdGd0ojbG37dFgp16KoW/t30WnqewVz2ngq5
	7HSX/pi6Wvz9N2RaM1gelg5gh9WS9H8pHYD6spVaqOYAJs6SbGojgJHSI56xQ9ULIA0ReTpSjnKvG
	9eNlnFVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc8W6-00000006uAa-41Yt;
	Tue, 23 Jun 2026 21:18:46 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc8W3-00000006uAA-4A2N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 21:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782249524; x=1813785524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PXOMq887K9FXPyqsb4vi8gGbLEYnXMywB+78wZBK9dY=;
  b=W3LPt/ejLwv5D0uC+4Tfetl/hBdc0bOPFIMXsh4jZhladsl2gBd8SF7A
   eS+3DPC9jCMPOKSzxYOVVfdXtR2exhJQe1GYZBARkQIZVqbE+ixvwOT2n
   q8UET7WhIwIoDQ/X4d7fnSV+23oqT+gBtR3dY5ZalOTLO2+0rNYVws5C1
   U4bJDoValdhJmR7leUZJfo7t2pKuVNP33BojMgCJcL0TA50VSyGVLFbJf
   VCV16CjVhKj8nmAJ3tXnisIJXcNqRrRqq5Zur/rydnipOo7kVkWbIFtyy
   feC5L5vj5ocCXsYZHSwa7hPOzvptr+PZbO5PhETCRx3V1pRTHwWOOpQYK
   w==;
X-CSE-ConnectionGUID: Zn+k1avVQ7S0uSQLKbkWng==
X-CSE-MsgGUID: +CP3npuWRiuUCAMsWDzW9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="94121916"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="94121916"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 14:18:43 -0700
X-CSE-ConnectionGUID: NKkjQdtURQ+vCzlz1PrRGg==
X-CSE-MsgGUID: 1QLw5JC5RqmGz1M/tKJ1sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="247287657"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.7])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 14:18:40 -0700
Date: Wed, 24 Jun 2026 00:18:38 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 0/2] add mcf54415 DAC driver
Message-ID: <ajr4LvdPZKHrqDVp@ashevche-desk.local>
References: <20260618-wip-stmark2-dac-v6-0-48761dbb96d7@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-wip-stmark2-dac-v6-0-48761dbb96d7@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_141844_094339_20D00CCB 
X-CRM114-Status: GOOD (  14.87  )
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

On Thu, Jun 18, 2026 at 11:04:14PM +0200, Angelo Dureghello wrote:
> This patchset adds a minimalistic DAC driver for the NXP mcf54415/6/7/8
> builtin DACs.
> 
> Currently the driver enables the raw write only. Feature as dma, sync, or
> format are not supoprted for this version.
> 
> Additional options suppoerted by the DAC module will be added to the driver
> later on, as needed.
> 
> The same patchset prepares the m68k/coldfire architecture to support
> the driver.
> 
> Below some basic tests done on stmark2 mcf54415-based board, voltage check
> on DAC0 and DAC1:
> 
> ~ # cd /sys/bus/iio/devices/iio:device0/
> /sys/bus/iio/devices/iio:device0 # ls
> name               out_voltage_scale  uevent
> out_voltage_raw    subsystem
> /sys/bus/iio/devices/iio:device0 # cat name
> mcf54415
> /sys/bus/iio/devices/iio:device0 # echo 4095 > out_voltage_raw 
> /sys/bus/iio/devices/iio:device0 # echo 2048 > out_voltage_raw 
> /sys/bus/iio/devices/iio:device0 # echo 4096 > out_voltage_raw 
> sh: write error: Invalid argument
> /sys/bus/iio/devices/iio:device0 # cat out_voltage_raw 
> 2048
> /sys/bus/iio/devices/iio:device0 # 
> 
> Same behavior for /sys/bus/iio/devices/iio:device1.
> 
> Generated a sine wave by shell script, sine shape is good.

Heard a presentation (Embedded Recipes IIRC) where one tried sine and real
sound (it was about sound DAC) was really awful. So, Can you try a bit more
sophisticated signal?

-- 
With Best Regards,
Andy Shevchenko



