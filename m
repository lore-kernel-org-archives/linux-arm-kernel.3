Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92164C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 07:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4l/4r2o+XySRKolgkZpaLOlp+tOiTwKRedLdVM+gSoQ=; b=z9LwNYwqRJXI9aETbyStf+xfdj
	fY2O3RBYKqw9CVPZ0JyXKs17jYivDESmIwpTTs8hv79dsDbzknZGjBULB8SH2UOghfwzySGkFU0YE
	D+Dss8gf6PTDLeLIgoiXsPaZMka0bEgw6Rm2wBLT8XeK1ifQfmRsNGFqGamwFbT2M3oOoJG7NPHuy
	/zrFoDZ1Q4n6Z9Qrv/4IgeLQHnkKszJ2cn6giltgNxvEVBQwFU2qIsSAOAfFckPxTl8U1/3Yhs5y8
	XEhkE3llw4NclRl/QY3PiRhz+FQ+N4btMOlUt65CDAGSRDDU8rkEHFHRM6xMlbAlspZF79S34Kh9y
	EWWQjXVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1IlJ-0000000B6Wn-452E;
	Tue, 01 Sep 2026 07:18:29 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1IlG-0000000B6W3-32SI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 07:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788247106; x=1819783106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nQ1Txs5VtWwa3LV7R5SsGLj9IbDYJQeJmmceT7DdqFA=;
  b=Z6AZQRHni6dqdqDwCab6t7basbX1y8oU/uVT3kBD4DtX/VLVQZmUjA/W
   mxRi6cA8mF5N9pbf3KCbPm8sfyq15RHmPiz0ZciIgWz5dghzyGv9Sly3t
   tmpo9ifMPQBiP7mjZdRwWQqKWY0eEO9oM/am/xMr0ynE4/nBgJ71NdAfm
   XlZXX0UI4tgM0KXjtA/mYGMABcXYyNXC1esPMrXVWT+W16PsLwKDxknPf
   YBUMVeS2Lqz45XkPUPrEgIPKcS/wZyAoJ2fTzlpwzuOBi6dhg3QyoFyYD
   /55YxlwiT/iwKj/yl2tBkWOUFZAWN8Ri5egHUvL6yFhRlwLIqCCkJd/0r
   A==;
X-CSE-ConnectionGUID: GXTg/551Qj+T87UwwTrQWg==
X-CSE-MsgGUID: sYFP2sEJTlef4l2OqW/EZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92534046"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="92534046"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 00:18:25 -0700
X-CSE-ConnectionGUID: 6fQWQPLNTsGsO9NeARB8fA==
X-CSE-MsgGUID: KiNiqfY8RJGBKkD+8I7ZhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="292513211"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.222])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 00:18:20 -0700
Date: Tue, 1 Sep 2026 10:18:17 +0300
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
Subject: Re: [PATCH v3 1/9] dmaengine: Support bus widths of 32 bytes and
 above
Message-ID: <apZ8OSzG7bEpQylL@ashevche-desk.local>
References: <20260831-dmaengine-support-wider-dma-masks-v3-0-507d97496f2d@analog.com>
 <20260831-dmaengine-support-wider-dma-masks-v3-1-507d97496f2d@analog.com>
 <apWFa4BFoAL2AhG3@ashevche-desk.local>
 <apWjMBvGA6yo_nCZ@nsa>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apWjMBvGA6yo_nCZ@nsa>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_001826_829899_70B2DFCD 
X-CRM114-Status: GOOD (  17.75  )
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

On Mon, Aug 31, 2026 at 04:56:18PM +0100, Nuno Sá wrote:
> On Mon, Aug 31, 2026 at 04:45:15PM +0300, Andy Shevchenko wrote:
> > On Mon, Aug 31, 2026 at 12:46:38PM +0100, Nuno Sá wrote:

...

> > >  F:	drivers/dma/
> > >  F:	include/dt-bindings/dma/
> > >  F:	include/linux/dma/
> > > +F:	include/linux/dma/engine/
> > >  F:	include/linux/dmaengine.h
> > >  F:	include/linux/of_dma.h
> > 
> > Unneeded, previous entry includes recursively.
> 
> Checkpatch complains so I guess we assume it's a tool issue?

Can you confirm that without this line get_maintainer.pl works? If it does,
then the problem is in checkpatch.pl (false positive).

...

> > It's possible to split this patch to two:
> > - move the existing type into a new types.h header
> > - add support for the new API
> 
> Yeah I thought about that but this still looked simple enough to go
> together but I can split in the next version.

I think the split is needed as it makes better view on the changes
(and accompanying justifications in the commit messages).

-- 
With Best Regards,
Andy Shevchenko



