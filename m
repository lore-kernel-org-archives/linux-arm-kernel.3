Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6C4C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 16:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooXEucNYgyu76TXMNDZk8Kir+vBfv87ziRZQacM+prw=; b=oEx9jvfJzE6VRS8Qj/udDv9URX
	A9DjVolOXalBjcqWO4y0RM/ObBIz7Bwwc4ebzL4LyZr/IaMmABc1AI+PiMF1AWyo1nJ917mzIivRs
	gv9wmUYozAm8pXdH7uwtIvsdUm/mFj41VOZYFYAAhyID5jvxeF3bahb77Gw6jR4cfZp83CpvJdAzu
	wbMUFELI4FPbMgMny3rCdfjHFqO/QF25nby8kUlooK7So2r6OTej2spb80QLDXosd+FFIH3oZewXQ
	UHQUB5+IZBKhyixrTc03Bef+EFmz8JD2WwQwQDWW+728Rqx78WrFmkT6IDcxvKuvxl8YLcsaru0jV
	UZEvdfsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuD04-00000003Gkl-3YTo;
	Mon, 17 Mar 2025 16:07:36 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCxm-00000003GBV-32gX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 16:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742227515; x=1773763515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gBan3RY0LoNCVgD61lrCi1GDyG/NWfQNDeRXn9WrIYQ=;
  b=ibEwLMTdRD02SSkPtj4bB3FpbgBU5F3Quy+qJ/F0y2EsiK5HBuxI7dF1
   jgArX/KK8/allur1fPNtSpupnpUsEMecZgrQ0iLgfDauCSMzMvuoEPLBg
   5vLml/iOptD2ertWrps40cKqDcnZoQeEUn+HuFVqDOLo/0NeTwEwBOzpG
   KOM9dKc5DFyqbfvf/ploKRYZBP1u039IPmdOvFZcDm3sQUCt/jwgLS/KU
   47jlZwqDobhQTD2aqtTOLBm/Zg3m88ZJbPqYiyCF5qZm719S373KTxeDz
   V8F1b5iNBAR8DMWnckKk2m068ip8NQp3eIDbgxvgDqRtpDfHlicgZRNUq
   A==;
X-CSE-ConnectionGUID: CL6VwESoQXWu5ApOAriU2w==
X-CSE-MsgGUID: jDCkZLw9QSGoOL4Z23wGNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43240990"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="43240990"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 09:03:13 -0700
X-CSE-ConnectionGUID: CVPcKQ0jRjW7UNLmHtaUbQ==
X-CSE-MsgGUID: mhtgn21rSZuwusaAqIQDYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="122470767"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 09:03:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tuCvd-00000003LyD-3atp;
	Mon, 17 Mar 2025 18:03:01 +0200
Date: Mon, 17 Mar 2025 18:03:01 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v8 05/10] iio: adc: sun20i-gpadc: Use adc-helpers
Message-ID: <Z9hHtTzUQ4CE8AB_@smile.fi.intel.com>
References: <cover.1742225817.git.mazziesaccount@gmail.com>
 <78d33ea9a795abdb2c5a4c606d48593e827ca59e.1742225817.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78d33ea9a795abdb2c5a4c606d48593e827ca59e.1742225817.git.mazziesaccount@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_090514_802493_C3121565 
X-CRM114-Status: GOOD (  12.48  )
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

On Mon, Mar 17, 2025 at 05:51:14PM +0200, Matti Vaittinen wrote:
> The new devm_iio_adc_device_alloc_chaninfo_se() -helper is intended to
> help drivers avoid open-coding the for_each_node -loop for getting the
> channel IDs. The helper provides standard way to detect the ADC channel
> nodes (by the node name), and a standard way to convert the "reg"
> -properties to channel identification numbers, used in the struct
> iio_chan_spec. Furthermore, the helper can optionally check the found
> channel IDs are smaller than given maximum. This is useful for callers
> which later use the IDs for example for indexing a channel data array.
> 
> The original driver treated all found child nodes as channel nodes. The
> new helper requires channel nodes to be named channel[@N]. This should
> help avoid problems with devices which may contain also other but ADC
> child nodes. Quick grep from arch/* with the sun20i-gpadc's compatible
> string didn't reveal any in-tree .dts with channel nodes named
> otherwise. Also, same grep shows all the in-tree .dts seem to have
> channel IDs between 0..num of channels.
> 
> Use the new helper.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



