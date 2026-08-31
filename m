Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFC2C624C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 13:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjbaT1etGIfqM1tgawskh02f4y4Oohv8U9MGWdWVIs0=; b=qoTp4WiTr3tJDTUCHgne8OkHB/
	fSotEG+78PIMjLrtfwXC+654ZfOSKQV/0ut/kSN3gpNuzv9C4QZ/eUbihUGYg/Zh5ud3+Y8H7wIyu
	rDNGcIOyaDblfzu/vt0GFKWFW34XgpylWF2bvR1fsrVaQlPzFJfrj5gpA0VCAG7w4tYCZwAtfvPaX
	7bvFl0WqXwNi3JlZOvjVlL9qIBhd73blq3E49EsuZTsIeUsb6Ox2pswlHTsXJFOg05sjCgQaihjXo
	1ZLow+0JHDe1g1BtRFFrAQP8auZlbqdW8K/MMHI1ixzWlHbwWy8B8tcXgwpUtymfTTOWP+/9O91PK
	H0hu6/pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12O3-00000009XQe-0kRn;
	Mon, 31 Aug 2026 13:49:23 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12O1-00000009XOx-1lqC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 13:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788184161; x=1819720161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=h6Ld0f1tqG+J98xm0TFaV3c9NYudrk1XB2K3F5fgbz0=;
  b=F/bOaXOQIc1u9qNgZXICGHYqCosgDSlyh1Ahj6c4EBiwQIadbEsKijLb
   DMIKkD6P10Mj1ch+Qoy8uXMe2fUKP55To+Hklr3GucZmKDKiR79gtianJ
   3JgZgUIUi2Bm+yoRPqRiQhgdrsfdysHQh7hTL9uz9ekaAaBCj7f15xG7x
   HdUoO2QiCtYns9IEDklUDYKWOt/bFu1AOvXV3CfZAaKEoUw6X1E2wYk3O
   PW4GPSZyGnj6IpuKl54CBXzdzPbo3qv4g6UJaOdGtSjZu0Q/YlBeBhoW7
   SYfhRmtDkaV8TSDOX0HimvS7Tw5D1Lyv0BMMSmLzRn9agbCaOo43+pHq6
   A==;
X-CSE-ConnectionGUID: 56izSEFpRaW+2YJRic4NMA==
X-CSE-MsgGUID: Kpl8aMpoS8OEyW9c5u+qdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99193002"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="99193002"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 06:49:21 -0700
X-CSE-ConnectionGUID: rPusQVupTySZrL7PVWQddg==
X-CSE-MsgGUID: rol2X92aSNGypCZBpqZSJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="272600396"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 06:49:16 -0700
Date: Mon, 31 Aug 2026 16:49:13 +0300
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
	Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 9/9] dmaengine: Drop legacy bus width fields from
 dma_slave_caps
Message-ID: <apWGWdLTmpRVGTWX@ashevche-desk.local>
References: <20260831-dmaengine-support-wider-dma-masks-v3-0-507d97496f2d@analog.com>
 <20260831-dmaengine-support-wider-dma-masks-v3-9-507d97496f2d@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260831-dmaengine-support-wider-dma-masks-v3-9-507d97496f2d@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_064921_489938_61789846 
X-CRM114-Status: GOOD (  11.53  )
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

On Mon, Aug 31, 2026 at 12:46:46PM +0100, Nuno Sá wrote:
> All users of dma_get_slave_caps() that inspect bus width capabilities now
> use the bitmap helpers.
> 
> Hence, remove the legacy u32 src_addr_widths and dst_addr_widths fields
> from struct dma_slave_caps and stop copying the dma_device masks into
> them.
> 
> Note the legacy u32 src_addr_widths and dst_addr_widths fields in struct
> dma_device are kept for now as every DMA controller driver setting them
> still has to be converted to the new helpers. dma_get_slave_caps() keeps
> folding those masks into the bitmaps it returns so unconverted producers
> continue to work during the transition.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



