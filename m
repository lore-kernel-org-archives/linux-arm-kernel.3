Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7E8C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWX6kPTTMaJXnLer+Hq64AJVcYWmyYEOr6n5TQoSY9Y=; b=vKnjn33oCJKgMRbVrD+4H9N+FP
	qHAD0KNcjcUOyCqymangCBZYts9Aq0F8SWUKp2XhvWDzFRnYpSVKtMOVveuZdkIqj8I8OjCFXLIi9
	ASn+4OWfamJPwi82bYIhVFKfFxA75itg2FJAfvyFXAdCWFRRTGn1ix2XRJO6pk/giktzuZQugR/1q
	RhHAa7f3Pa42BGdWkR0z3g8uhebhr1dsRA6NYTldgjzRSKEP4YIe0fNkagvHHUHJp/1a/bvjRHcL9
	gDx3mlGgQaHN9A1GPKQMbkyrar073Tsntnt28Hx1ei9P5qgOKA2sQo5LzhWQ1Obxz+hzREAqEQmcn
	6kgf+WQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61gd-00000002eay-1IJa;
	Mon, 14 Sep 2026 08:05:11 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61gb-00000002eZw-3HEK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 08:05:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789373110; x=1820909110;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ms02h7CsujbREPeLnaUOThPK+64TwYCRPpUsizrNp/I=;
  b=Y/F90iyiZEpQn5/UtgRnsJn7o/gZfnqShwdwST9hmKdh7ruZ3txLNYYk
   rto6ydl+kkAijYbSdKux836OGDURLKJlkCyYatKy3d288aqFsxtvkUTej
   AwGfFn/rQ9bE6WyommDpuHYnRKCW+X3d0yPQowfc7YRNizcBk8+CYUcEH
   EdVeOijVxIgvElYy5zTAS1+xUj7C04RhTu+7Lnr1t1TOYm9NMT+Loj0NH
   AV2lmmHti9hcXu8BZlRC1HPM6YTiZP+Wc5BTBJph5T1LozRIoBDmPJ5K2
   5dCIkeexa8joZN6PBUuNUQQzFUTCZdJ0LwcNzkzVCT+G3ydxZEXndSzOB
   w==;
X-CSE-ConnectionGUID: t0MNjsHxSkCMPOXjtZ6PHA==
X-CSE-MsgGUID: tBwisndRScWyvE9O29XQBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="100317037"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="100317037"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 01:05:09 -0700
X-CSE-ConnectionGUID: k/BGMQlsQ26pQ7qXoD2Low==
X-CSE-MsgGUID: LyK3jnAQS4OvLkjyLJO+GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="268897922"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.29])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 01:05:03 -0700
Date: Mon, 14 Sep 2026 11:05:01 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	=?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 02/10] dmaengine: Support bus widths of 32 bytes and
 above
Message-ID: <aqeqrQU7Gtj9uGQx@ashevche-desk.local>
References: <20260911-dmaengine-support-wider-dma-masks-v4-0-72b8fd4cc78e@analog.com>
 <20260911-dmaengine-support-wider-dma-masks-v4-2-72b8fd4cc78e@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-dmaengine-support-wider-dma-masks-v4-2-72b8fd4cc78e@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_010509_857248_BC81E972 
X-CRM114-Status: GOOD (  18.95  )
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

On Fri, Sep 11, 2026 at 06:25:37PM +0100, Nuno Sá wrote:
> The src_addr_widths and dst_addr_widths capability masks encode each
> supported width as a bit whose position equals the corresponding
> enum dma_slave_buswidth value (e.g. DMA_SLAVE_BUSWIDTH_4_BYTES sets bit
> 4). As these masks are plain u32, widths of 32 bytes and above
> (DMA_SLAVE_BUSWIDTH_32/64/128_BYTES map to bits 32, 64 and 128) cannot
> be represented at all.
> 
> Introduce bitmap-based bus width capabilities that span the full enum
> range, through a new dma_buswidth_mask_t type modeled after
> dma_cap_mask_t. To allow DMA controller drivers to be converted
> incrementally, the legacy dma_device u32 fields are kept alongside the
> new masks and the core folds a legacy-only driver's u32 into the mask
> when the device is registered, so consumers only ever have to look at
> the mask.
> 
> The accessors live in a new include/linux/dma/engine/widthmask.h instead
> of in linux/dmaengine.h, so that only their users pay for the
> linux/bitmap.h include. They all take a dma_buswidth_mask_t, which means
> the interface will not change once the legacy fields are dropped.
> 
> The fold is bidirectional while both representations coexist. A driver
> that only fills in the legacy u32 gets its mask derived from it, so the
> consumers already converted see it. A driver that only fills in the mask
> gets its legacy u32 derived from the mask, so the consumers not
> converted yet, which read the legacy dma_slave_caps fields, keep working.
> 
> On top of that, dma_get_slave_caps() derives the legacy dma_slave_caps
> masks from the new ones when a device_caps() callback adjusted them, so
> that a converted controller narrowing its per-channel capabilities is
> still seen by the consumers not converted yet, while a driver adjusting
> the legacy masks directly keeps working.

Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



