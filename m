Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38564C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 16:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3i+OmNqmqXg0snJ+VK0nV9BVyNhwMq5bkBlVLPpWpw=; b=QmVvZs40bMas/Jl3v3kD+Zf4Qr
	VqaiU8H8lCxR0Fs+j/iadRBiVSTEpfQ6W6cHY85l5ieTQ+aavpXJK/7xRtTufTThysycT8XfnNv/c
	RhgDkP3+OQfktzfO9RwpgbOtMUZfo6IsYLaaJ+VEiAgSKDBbPX3IrgvoRkbSM4JmFwLYiU1IlCSHv
	03tyLi0DSW5XIhNkhBh2tqGv4vWKvHKb8tWtws+w6P82QIJmbce8nYSZyP9t7pAkZaa8oDMmLhGnd
	mR+LM9WlDr9svoX4aYPRYZYEZJiHk0DWlR5m5Cy4Xb6UHp7+fkRtpDRgKlFEELSi9E05TShXsV03c
	llUQ/upw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53mD-0000000HAnI-3BUQ;
	Fri, 11 Sep 2026 16:06:57 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53mB-0000000HAmf-22FH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 16:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789142816; x=1820678816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4bQugtR3/IuUOZUfBGt3l7BWYRUU3qkM5jZ+MMD++Y0=;
  b=CvF86D+nZoHUgJ8B6cb8aoq38iT16kiRuN7mQHKXaADQ/S25sShpaGGF
   cuibM+2u8BtKiP1guyT/CmdYoxU4IuzwNvId5wI9nbG4go5cYPaYRQEU2
   iZxBNhec83YxJnYhQBr/jaRqH4PkWOmg+aJcJbqEFuEPMlXAcgzfXb0E1
   4NhgHMjOORng+kjz1cO72kwNZPB6Ptv1k0pzmgBihLgl4sS0nJ8Dv3P3a
   JHzhroG7/0T5+lN8Kmv7HE1VIxwaBT2Ih8LVwtS9Z2Q9KNelNun34aCdF
   ZJYTx4ydw+OelX8dA5Okwlx+MgRT2+CHYWkwjnkUiYG/pfvHOsu9GevaI
   A==;
X-CSE-ConnectionGUID: WNDkxnpnRUG+BkfUlchS+A==
X-CSE-MsgGUID: f+5dVsDXSwKvShgn8sSMRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89540967"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89540967"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 09:06:55 -0700
X-CSE-ConnectionGUID: aPAYlHAVRV64t21YPzr70w==
X-CSE-MsgGUID: KT3R59AVSaC+yCckLANsxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268280469"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.80])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 09:06:49 -0700
Date: Fri, 11 Sep 2026 19:06:47 +0300
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
Message-ID: <aqQnF9-Qtc-ZJJWa@ashevche-desk.local>
References: <20260831-dmaengine-support-wider-dma-masks-v3-0-507d97496f2d@analog.com>
 <20260831-dmaengine-support-wider-dma-masks-v3-1-507d97496f2d@analog.com>
 <apWFa4BFoAL2AhG3@ashevche-desk.local>
 <apWjMBvGA6yo_nCZ@nsa>
 <aqQaUx5Ok8uesHu5@nsa>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqQaUx5Ok8uesHu5@nsa>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_090655_568664_06303B98 
X-CRM114-Status: GOOD (  13.38  )
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

On Fri, Sep 11, 2026 at 04:14:20PM +0100, Nuno Sá wrote:
> On Mon, Aug 31, 2026 at 04:56:18PM +0100, Nuno Sá wrote:
> > On Mon, Aug 31, 2026 at 04:45:15PM +0300, Andy Shevchenko wrote:
> > > On Mon, Aug 31, 2026 at 12:46:38PM +0100, Nuno Sá wrote:

...

> > > > +/*
> > > > + * Basic types shared by the DMA engine interfaces.
> > > > + */
> > > > +#ifndef LINUX_DMA_ENGINE_TYPES_H
> > > > +#define LINUX_DMA_ENGINE_TYPES_H
> > > > +
> > > > +#include <linux/bitops.h>
> > > 
> > > Not yet? Perhaps next changes will use it, then they can add it.
> > 
> > Should be dropped!
> 
> In fact, I'll keep the above! DECLARE_BITMAP() needs BITS_TO_LONGS().

I'm not sure I follow.

The DECLARE_BITMAP() comes from types.h. It's the problem of types.h to include
bitops.h for BITS_TO_LONGS() if required.

> Yeah, not great...

-- 
With Best Regards,
Andy Shevchenko



