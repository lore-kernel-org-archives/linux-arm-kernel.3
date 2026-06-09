Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A2BCD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 19:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btRGz5v1VgwPpmXgtzOshYcJI+zUSuVmGXHZ7zNmayk=; b=Vm+a8edfR500N2m2HGrSzhYdEo
	LxTHB9H8SYQitBOCGt7NATWIantp96yGFEY8LPmbTyUH9M7xZHOprHewAYInhIezHZYFA2WqyJaQO
	ZTrZ6xu29oRoYJupjPOY0/z8WCBP5xhEFH33UpXFrNkVHjuvydxFDC/PPWazQwSPCPneTMjf5Ac1l
	qXtxxG+MbKGFzbntJV4VY7AsZVDGz66pcLLCjcxQjNzZp0LnvkThLRA2fMHO7hqFm/I0ImHOFPcP/
	fFghSy+xtYOHNq5al/f4r5RItoi8QcDeTI4u7nfQysWp0Ya377fhux9yi/lq2LTTWknrVrrSxQ+A6
	AQydNOOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2CO-00000006I6v-0iCw;
	Tue, 09 Jun 2026 19:33:20 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2CL-00000006I5x-2cID;
	Tue, 09 Jun 2026 19:33:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781033598; x=1812569598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4sQeWTpTHfO3TwVdreiqV4yVzlLjiyYiPOU+cAH5/cQ=;
  b=VosZGYPuNvY0MVZWJS7MyTij2V9h7kRIF68qu4ZDWYMERgmzVq7+PtAA
   1/CU1hQtzaM/RMZ7AEn6uV5hlOJGAlnPVZyQLtfJuFb4bBiNZZbxhNYhE
   clxBW/szbS9UbaR1QrWglHXfveCuYQY02aj1yYnCvi6Xc3IvZO4fcR5cD
   NeDxMcgqapGBXOZt5Wxq+mQrVdmaXZgoF+CvcBTgY0A0VHHOwLNpTXpq1
   zyufyMXyh6dmPzW0uF5QsttusAN4X5y1Wd1JEAjsv0TlyBCAVLjvE3cO9
   Y403Oh1dw4KKRorMjU3/KU/LB3MHokyVP8+9K5fA56lsbgrTMA9mFpXc2
   Q==;
X-CSE-ConnectionGUID: NDEE1d6EScuU4VneID6OsQ==
X-CSE-MsgGUID: 9vHBln0hS1WzLkXo3H0yhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92130914"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="92130914"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 12:33:16 -0700
X-CSE-ConnectionGUID: SOLNmU1EQEStSFclzpEaCQ==
X-CSE-MsgGUID: hgRnIwRJQVqbOU668KynsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="242986939"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 09 Jun 2026 12:33:13 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 0F98E95; Tue, 09 Jun 2026 21:33:12 +0200 (CEST)
Date: Tue, 9 Jun 2026 21:33:12 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v2 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC
 driver
Message-ID: <aihqeLKHC3PP436t@black.igk.intel.com>
References: <20260609-mt6323-adc-v2-0-aa93a22309f9@protonmail.com>
 <20260609-mt6323-adc-v2-2-aa93a22309f9@protonmail.com>
 <aihbxowyAIlSeDjH@ashevche-desk.local>
 <hacDZbv1Whk_g8AMSfJqKHrgXfyVKt2o3_UGK-1k9jNRJyMxEFPztGhytHvHbc1x9j-F84I_ZuprmXWf2Azbtdqj2vnVal4PO1gG_DijYyA=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hacDZbv1Whk_g8AMSfJqKHrgXfyVKt2o3_UGK-1k9jNRJyMxEFPztGhytHvHbc1x9j-F84I_ZuprmXWf2Azbtdqj2vnVal4PO1gG_DijYyA=@protonmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_123317_697991_7426371C 
X-CRM114-Status: GOOD (  12.49  )
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

On Tue, Jun 09, 2026 at 07:15:42PM +0000, Roman Vivchar wrote:
> On Tuesday, June 9th, 2026 at 9:30 PM, Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > On Tue, Jun 09, 2026 at 04:31:59PM +0300, Roman Vivchar via B4 Relay wrote:

...

> > > +	case IIO_CHAN_INFO_RAW:
> > > +		scoped_guard(mutex, &auxadc->lock) {
> >
> > I'm wondering why we haven't moved to guard()() here
> 
> The compiler would complain about 'cannot jump from switch statement'
> due to default case.

I am not sure I follow. See the examples in the existing drivers. They are
warning clean in that sense.

-- 
With Best Regards,
Andy Shevchenko



